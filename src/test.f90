program Test
    use StringModule
    use stdlib_string_type
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
end program Test