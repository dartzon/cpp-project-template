#!/bin/bash

_cmd_list=$(echo $* | tr ' ' '\n')
_run_gdb=0
_run_tests=0
_should_run=1

for _cmd in $_cmd_list
do

    case $_cmd in

	-d|-debug)
	    let _run_gdb=1
	    ;;

	-t|-test)
	    let _run_tests=1
	    ;;

	-h|-help)
	    echo "Usage: $0 [OPTION]..."
	    echo "Run the program or the unit-tests."

	    echo -e "Example: $0 -d\n"

	    echo "Optional arguments:"
	    echo -e "  -d, -debug\tRun the program through the GDB debugger."
	    echo -e "  -t, -test\tRun the unit-tests."
	    echo -e "  -h, -help\tDisplay this help and exit."
	    echo -e "\nReport bugs to: dartzon@gmail.com"

	    let _should_run=0
	    break
	    ;;

	*)
	    echo "$0: invalid option -- '$_cmd'"
	    echo -e "Try '$0 -h' for more information."
	    let _should_run=0
	    break
	    ;;

    esac

done

if [ $_should_run == 1 ]; then

    _path="."

    if [ $_run_tests == 1 ]; then

	_path="tests"

    fi

    _bin_name=$(cat $_path/CMakeLists.txt | grep add_executable | cut -d' ' -f1 | cut -d'(' -f2)

    if [ $_run_gdb == 1 ]; then

	gdb -tui -x .gdb-args --args build/bin/$_bin_name

    else

	./build/bin/$_bin_name

    fi

fi
