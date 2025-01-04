# espeakng-loader

This package loads the espeak-ng shared library so it will be available for other libraries.

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
import espeakng_loader
EspeakWrapper.set_library(espeakng_loader.get_library_path())
```