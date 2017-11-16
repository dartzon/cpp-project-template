# cpp-project-template

A basic template for C++ projects that use CMake and Clang

## Project organization

![Alt text](screenshots/ProjectTree.png?raw=true "Project organization")

* `build/` is where the build files are stored.
* `build/bin/` is where the built binaries are stored.
* `src/` is where the source code files are stored.
* `tests/` is where the unit-test code is stored along with **Catch**, the unit test framework.
* `build.sh` is the build script for the main program and the unit tests.
* `run.sh` is the script that launches the main program or the unit tests.

## Before using

Don't forget to change the project name and the binary name in the CMakeLists.txt files in both the `src/` and the `tests/` folders. Look for **project_name** and **bin_name**.

## Usage

The project offers two scripts, one for building and the other for running. Each script has various options that can be displayed on the terminal like so:

```sh
./build.sh -h
```

```sh
./run.sh -h
```

### Building

Running the `build.sh` script will build the project with the default parameters which are: **debug mode** and **no unit-tests**.

The building process can be customized with the following parameters:

* `-d` or `-debug` build in DEBUG mode.
* `-r` or `-release` build in RELEASE mode.
* `-t` or `-test` build tests.
* `-c` or `-clean` remove the CMakeCache.txt file.
* `-tc` or `-total-clean` remove the entire build directory.
* `-h` or `-help` display the help and exit.

### Running

Running the `run.sh` script will simply launch the project generated binary.

The running process can be customized with the following parameters:

* `-d` or `-debug` run the program through the **GDB** debugger.
* `-t` or `-test` run the unit-tests.
* `-h` or `-help` display the help and exit.

## Authors

* **Othmane AIT EL CADI** - *Initial work* - [dartzon](https://github.com/dartzon/)

## License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE) file for details
