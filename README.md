# espeakng-loader

This package loads the espeak-ng shared library so it will be available for other libraries.

## Platforms

- Linux (x86-64, arm64)
- Windows (x86-64, arm64)
- macOS (x86-64, arm)

## Install

```console
pip install espeakng-loader
```

## Usage

```python
from espeakng_loader import get_library_path, load_library, make_library_available

library_path = get_library_path() # Pass it to the library
# Or use load_library() for load it directly
# Or use make_library_available() for making it available for other libraries
```

## Usage with [phonemizer](https://github.com/bootphon/phonemizer)

Note: please use `phonemizer-fork` instead of `phonemizer` package until [#191](https://github.com/bootphon/phonemizer/pull/191) merged.

```python
from phonemizer.backend.espeak.wrapper import EspeakWrapper
from phonemizer import phonemize
import espeakng_loader

EspeakWrapper.set_library(espeakng_loader.get_library_path())
EspeakWrapper.set_data_path(espeakng_loader.get_data_path())

phonemes = phonemize('Hello')
print('Phonemes: ', phonemes)
```

## License

The loader code in this repository is [MIT](LICENSE) licensed.

The wheels on PyPI also bundle a prebuilt espeak-ng shared library
(`libespeak-ng` / `espeak-ng.dll`) and `espeak-ng-data`, built from
[espeak-ng 1.52.0](https://github.com/espeak-ng/espeak-ng/tree/1.52.0).
espeak-ng is licensed under [GPL-3.0-or-later](espeak-ng-licenses/COPYING), and
its Unicode character tables are under the
[Unicode Data Files license](espeak-ng-licenses/COPYING.UCD). The source code for
the bundled library is the espeak-ng 1.52.0 tag linked above; the build steps are
in [build.sh](build.sh) and [.github/workflows/build.yml](.github/workflows/build.yml).

The package metadata declares this as `MIT AND GPL-3.0-or-later`, and the
license texts are included in each wheel, so license scanners can see what is
bundled.

Depending on `espeakng-loader` therefore means your project installs and loads
GPL-licensed code, and shipping it in an app, installer or container image means
redistributing that code. Whether that affects your project depends on how you
use and distribute it. This note is for transparency, not legal advice.
