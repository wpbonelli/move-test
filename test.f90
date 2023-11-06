module StringModule
    implicit none
    private
    public :: string_type
    public :: assign
    public :: assignment(=)
    public :: move
    public :: print

    type :: string_type
        sequence
        private
        character(len=:), allocatable :: raw
    end type string_type

    interface assignment(=)
        module procedure :: assign
    end interface

contains

    elemental subroutine assign(st, str)
        type(string_type), intent(inout) :: st
        character(len=*), intent(in) :: str
        st%raw = str
    end subroutine assign

    elemental subroutine move(from, to)
        type(string_type), intent(inout) :: from, to
        character(:), allocatable :: tmp
        call move_alloc(from%raw, tmp)
        call move_alloc(tmp, to%raw)
    end subroutine move

    subroutine print(st)
        type(string_type), intent(in) :: st
        print *, st%raw
    end subroutine print

end module StringModule

program Test
    use StringModule
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

end program Test