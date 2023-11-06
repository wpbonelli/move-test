sources = [
    'string.f90',
    'test.f90'
]
str_lib = static_library('string', sources)
str_exe = executable(
    buildname,
    'test.f90',
    link_with: [str_lib],
    install: true)