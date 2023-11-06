module teststring
    use testdrive, only : new_unittest, unittest_type, error_type, check
    use StringModule
    implicit none
    private
  
    public :: collect_string
 
contains

    subroutine collect_string(testsuite)
        type(unittest_type), allocatable, intent(out) :: testsuite(:)
        testsuite = [ &
            new_unittest("move", test_move) &
        ]
    end subroutine collect_string

    subroutine test_move(error)
        type(error_type), allocatable, intent(out) :: error
        character(len=:), allocatable :: raw, tmp
        type(string_type) :: st

        ! standalone
        raw = "hello world"
        call move_alloc(raw, tmp)
        call move_alloc(tmp, raw)
        print *, raw

        ! explicit assignment
        call assign(st, "hello world")
        call move(st, st)
        call print(st)

        ! assignment operator
        st = "hello world"
        call move(st, st)
        call print(st)
   end subroutine test_move

end module teststring