# V NanoID

[![Test Status](https://img.shields.io/badge/Tests-passed-brightgreen?style=flat-square&logo=github)](https://github.com/invipal/nanoid/actions/)
[![Lint Status](https://img.shields.io/badge/Lint-passed-brightgreen?style=flat-square&logo=github)](https://github.com/invipal/nanoid/actions/)
[![GitHub issues](https://img.shields.io/github/issues/invipal/nanoid?style=flat-square&cacheSeconds=3600)](https://github.com/invipal/nanoid/issues)
[![License](https://img.shields.io/github/license/invipal/nanoid?style=flat-square&cacheSeconds=3600)](LICENSE.md)
[![Twitter Follow](https://img.shields.io/twitter/follow/invipal?style=flat-square&logo=twitter)](https://twitter.com/invipal)
[![Twitter Follow](https://img.shields.io/twitter/follow/oguzhankurnuc?style=flat-square&logo=twitter)](https://twitter.com/oguzhankurnuc)

This package is V implementation of [NanoID](https://github.com/ai/nanoid)

Generated from [Go Nanoid](https://github.com/matoous/go-nanoid)

**Safe.** It uses cryptographically strong random generator.

**Compact.** It uses more symbols than UUID (`A-Za-z0-9_-`)
and has the same number of unique options in just 22 symbols instead of 36.

**Fast.** Nanoid is as fast as UUID but can be used in URLs.

## Install

Via vpm

```bash
$ v install invipal.nanoid
```

## Usage

Generate ID

```v
id := nanoid.new() or { 'error' }
```

Generate ID with a custom alphabet and length

```v
id := nanoid.generate('erzurum', 25) or { 'error' }
```

## Contribution

I would welcome your contribution! If you find any improvement or issue you want to fix, feel free to send a pull request, I like pull requests that include test cases for fix/enhancement.

## Credits

- [ai](https://github.com/ai) - [nanoid](https://github.com/ai/nanoid)
- [matoous](https://github.com/matoous) - [go nanoid](https://github.com/matoous/go-nanoid)

## License

The MIT License (MIT). Please see [License File](LICENSE.md) for more information.
