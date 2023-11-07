test_drive = dependency('test-drive', required: false)
if test_drive.found()
  tests = [
      'string'
  ]
  test_srcs = files(
      'tester.f90',
  )
  foreach t : tests
    test_srcs += files('test@0@.f90'.format(t.underscorify()))
  endforeach

  tester = executable(
    'tester',
    sources: test_srcs,
    link_with: str_lib,
    dependencies: [test_drive, fortran_stdlib],
  )

  test('Test source modules', tester)

  foreach t : tests
    test(t, tester, args: t)
  endforeach
endif