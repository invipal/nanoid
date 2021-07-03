module nanoid

fn test_new() ? {
	negative_number := new(-1) or { 'error' }
	assert negative_number == 'error'
	assert new() ?.len == 21
	assert new(10) ?.len == 10
}

fn test_generate() ? {
	nanoid := generate('invipal', 25) ?
	assert nanoid.len == 25
	assert nanoid.contains_any('bcdefghjkmorstuwxyz0123456789_-') == false
	bad_alphabet_nanoid := generate('', 20) or { 'error' }
	assert bad_alphabet_nanoid == 'error'
	bad_number_nanoid := generate('abcde', -1) or { 'error' }
	assert bad_number_nanoid == 'error'
}
