program array_sum_input
    use omp_lib
    implicit none
    
    integer :: N, i
    real, allocatable :: A(:)
    real :: total_sum

    print *, "Enter the number of elements in the array:"
    read *, N

    allocate(A(N))

    print *, "Enter ", N, " real numbers:"
    do i = 1, N
        read *, A(i)
    end do

    total_sum = 0.0

    !$OMP PARALLEL DO REDUCTION(+:total_sum) PRIVATE(i)
    do i = 1, N
        total_sum = total_sum + A(i)
    end do
    !$OMP END PARALLEL DO

    print *, "The sum of elements is: ", total_sum

    deallocate(A)
end program array_sum_input