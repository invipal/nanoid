module nanoid

import math
import crypto.rand

const (
	// default_alphabet is the alphabet used for ID characters by default.
	default_alphabet = '_-0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ'.runes()
	// default length for ID
	default_size     = 21
)

// get_mask generates bit mask used to obtain bits from the random bytes that are used to get index of random character
// from the alphabet. Example: if the alphabet has 6 = (110)_2 characters it is sufficient to use mask 7 = (111)_2
fn get_mask(alphabet_size int) int {
	for i := 1; i <= 8; i++ {
		mask := (2 << u64(i)) - 1
		if mask >= alphabet_size - 1 {
			return mask
		}
	}
	return 0
}

// generate is a low-level function to change alphabet and ID size.
pub fn generate(alphabet string, size int) ?string {
	chars := alphabet.runes()

	if alphabet.len == 0 || alphabet.len > 255 {
		return error('alphabet must not be empty and contain no more than 255 chars')
	}
	if size <= 0 {
		return error('size must be positive integer')
	}

	mask := get_mask(chars.len)
	// estimate how many random bytes we will need for the ID, we might actually need more but this is tradeoff
	// between average case and worst case
	ceil_arg := 1.6 * f64(mask * size) / f64(alphabet.len)
	step := int(math.ceil(ceil_arg))

	mut id := []rune{len: size}
	// bytes := []byte{len: step}
	bytes := rand.read(step) or { return error(err.msg) }
	for j := 0; true; {
		for i := 0; i < step; i++ {
			curr_byte := bytes[i] & byte(mask)
			if curr_byte < byte(chars.len) {
				id[j] = chars[curr_byte]
				j++
				if j == size {
					return id[..size].string()
				}
			}
		}
	}

	return error('could not generated')
}

// must_generate is the same as generate but panics on error.
pub fn must_generate(alphabet string, size int) string {
	id := generate(alphabet, size) or { panic(err.msg) }
	return id
}

// new generates secure URL-friendly unique ID.
// Accepts optional parameter - length of the ID to be generated (21 by default).
pub fn new(l ...int) ?string {
	mut size := int(0)
	if l.len == 0 {
		size = default_size
	} else if l.len == 1 {
		size = l[0]
		if size <= 0 {
			return error('size must be positive integer')
		}
	} else {
		return error('unexpected parameter')
	}

	bytes := rand.read(size) or { return error(err.msg) }

	mut id := []rune{len: size}
	for i := 0; i < size; i++ {
		id[i] = default_alphabet[bytes[i] & 63]
	}

	return id[..size].string()
}

// must is the same as new but panics on error.
pub fn must(l ...int) string {
	id := new(...l) or { panic(err.msg) }
	return id
}
