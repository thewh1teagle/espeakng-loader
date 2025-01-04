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

```python
from phonemizer.backend.espeak.wrapper import EspeakWrapper
from phonemizer import phonemize
import espeakng_loader

EspeakWrapper.set_library(espeakng_loader.get_library_path())
EspeakWrapper.set_data_path(espeakng_loader.get_data_path())

phonemes = phonemize('Hello')
print('Phonemes: ', phonemes)
```