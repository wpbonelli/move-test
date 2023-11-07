module teststring
    use testdrive, only : new_unittest, unittest_type, error_type, check
    use StringModule
    use stdlib_string_type
    implicit none
    private
  
    public :: collect_string
 
contains

    subroutine collect_string(testsuite)
        type(unittest_type), allocatable, intent(out) :: testsuite(:)
        testsuite = [ &
            new_unittest("move_local", test_move_local), &
            new_unittest("move_stdlib", test_move_stdlib) &
        ]
    end subroutine collect_string

    subroutine test_move_local(error)
        type(error_type), allocatable, intent(out) :: error
        character(len=:), allocatable :: raw, tmp
        type(StringType) :: st

    end subroutine test_move_local

    subroutine test_move_stdlib(error)
        type(error_type), allocatable, intent(out) :: error
        character(len=:), allocatable :: raw, tmp
        type(StringType) :: local_st
        type(string_type) :: stdlib_st

        ! standalone
        raw = "hello world"
        call move_alloc(raw, tmp)
        call move_alloc(tmp, raw)
        print *, raw

        ! local StringType
        local_st = "hello world"
        call move_str(local_st, local_st)
        call print_str(local_st)

        ! stdlib_string_type
        stdlib_st = "hello world"
        call move(stdlib_st, stdlib_st)
        print *, stdlib_st
        call check(error, stdlib_st == "hello world")
   end subroutine test_move_stdlib

end module teststring