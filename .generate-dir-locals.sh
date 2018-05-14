#!/bin/bash

_build_mode=$1
_build_arch=$2
_project_path=$3
_project_name=$4
_build_args=$5

_gcc_version=$(gcc -dumpversion)

_dir_locals="(( nil . (\n\t
(cmake-ide-project-dir . \"$_project_path/\")\n\t
(cmake-ide-build-dir . \"$_project_path/build/$_build_mode/$_build_arch/\")\n\t
(cmake-ide-cmakelists-dir . \"$_project_path/\")\n\t
(cmake-ide-compile-command . \"$_project_path/build.sh $_build_args\")\n\t
(cmake-ide-flags-c . \"-I/usr/include\")\n\t
(cmake-ide-flags-c++ . (\"-I/usr/include/c++/$_gcc_version\"\n\t\t
                       \"-I/usr/include/c++/$_gcc_version/x86_64-pc-linux-gnu\"\n\t\t
                       \"-I/usr/include/c++/$_gcc_version/backward\"\n\t\t
                       \"-I/usr/lib/gcc/x86_64-pc-linux-gnu/$_gcc_version/include\"\n\t\t
                       \"-I/usr/local/include\"\n\t\t
                       \"-I/usr/lib/gcc/x86_64-pc-linux-gnu/$_gcc_version/include-fixed\"\n\t\t
                       \"-I/usr/include\"))\n\t
(flycheck-clang-tidy-build-path . \"$_project_path/build/$_build_mode/$_build_arch/\")\n\t
(projectile-enable-caching . t)\n\t
(projectile-project-name . \"$_project_name\")\n\t
(projectile-project-root . \"$_project_path/\")\n\t
)\n\t
)
(c-mode . ((mode . c++))) )\n\t"

echo -e $_dir_locals > $_project_path/.dir-locals.el
