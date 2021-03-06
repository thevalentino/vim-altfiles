# Alternate Files

Implements a shortcut to jump between the current file and its _alternate_ file. The _alternate_ file can be a test file, or a header file, or whatever the user decides to define. To define the _alternte_ file use the function call:

`:SetAlternateFile("<path_to_file>")`

then you can jump to the defined file by pressing `<Tab>`.

## Python Module

If the file is in a Python module, the plugin will automatically try to guess the _alternate_ file assuming it is the test file in the following module structure:

```
module_name/
│
├── module_name/
│   ├── __init__.py
│   ├── file_name.py
│   └── other_file_name.py
│
└── tests/
    ├── __init__.py
    ├── file_name_test.py
    └── other_file_test.py
```

Here it's important that `module_name` repeats in the structure and that the folders contain the `__init__.py` files. Also, the tests must be in a folder named `tests` and the individual files must have the suffix `_test.py`. This complies with the default `pytest` discovery.

## Julia Package

If the file is in a Julia package, the plugin will automatically try to guess the _alternate_ file assuming it is the test file in the following package structure:


```
package_name/
│
├── src/
│   ├── file_name.jl
│   └── other_file_name.jl
│
└── tests/
    ├── file_name_tests.jl
    └── other_file_tests.jl
```

Here it's important that the source code of the package is contained in a folder named `src` and the tests in a folder named `tests`, with files having a suffix `_tests.jl`.
