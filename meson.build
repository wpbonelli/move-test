project(
    'move-test',
    'fortran',
    version: '0')

# compiler flags
dialect = ''
bounds =  ''
if meson.get_compiler('fortran').get_id() == 'gcc'
    dialect = [ '-ffree-form','-std=f2008','-fimplicit-none']
    bounds = '-fbounds-check'
endif
add_global_arguments(dialect, language : 'fortran')
add_global_arguments(bounds, language : 'fortran')

buildname = get_option('buildname')
subdir('src')
subdir('test')
