# project init
project(
    'move-test',
    'fortran',
    version: '0')

# compiler flags
dialect = ''
bounds =  ''
if meson.get_compiler('fortran').get_id() == 'gcc'
    dialect = [
        '-ffree-form',
        '-std=f2008',
        '-fimplicit-none'
    ]
    bounds = '-fbounds-check'
endif
add_global_arguments(dialect, language : 'fortran')
add_global_arguments(bounds, language : 'fortran')

# stdlib
fortran_stdlib = dependency('fortran_stdlib', required: true)

# buildname
buildname = get_option('buildname')

# subdirs
subdir('src')
subdir('test')
