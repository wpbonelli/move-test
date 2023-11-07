module StringModule
    implicit none
    private
    public :: StringType
    public :: assignment(=)
    public :: assign_str
    public :: move_str
    public :: print_str

    type :: StringType
        sequence
        private
        character(len=:), allocatable :: raw
    end type StringType

    interface assignment(=)
        module procedure :: assign_str
    end interface

contains

    elemental subroutine assign_str(st, str)
        type(StringType), intent(inout) :: st
        character(len=*), intent(in) :: str
        st%raw = str
    end subroutine assign_str

    elemental subroutine move_str(from, to)
        type(StringType), intent(inout) :: from, to
        character(:), allocatable :: tmp
        call move_alloc(from%raw, tmp)
        call move_alloc(tmp, to%raw)
    end subroutine move_str

    subroutine print_str(st)
        type(StringType), intent(in) :: st
        print *, st%raw
    end subroutine print_str

end module StringModule