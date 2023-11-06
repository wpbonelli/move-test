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