str_lib = static_library(
    'strlib',
    'string.f90')
str_exe = executable(
    'strexe',
    'test.f90',
    link_with: [str_lib],
    dependencies: [fortran_stdlib],
    install: true)