# morton_fortran

This module can be used to convert non-negative indices to morton numbers and
back, in 2D and 3D. The morton numbers are stored as 64-bit integers.

The functionality in this module:

* Convert an index (i, j) or (i, j, k) to a Morton number
* Convert a Morton number to an index (i, j) or (i, j, k)
* Sort a list of Morton numbers
* Binary search in a sorted list of Morton numbers
* Print the individual bits of a 32/64 bit integer

## What are morton numbers?

If you have two numbers with bit patterns `a3 a2 a1` and `b3 b2 b1`, you can
combine them into a number with a longer bit pattern as `b3 a3 b2 a2 b1 a1`.
With three numbers (or more) you can use the same technique. For more
information, see this
[Wikipedia article](https://en.wikipedia.org/wiki/Z-order_curve).

As an example, the indices `2**21-1`, `2**3-1` and 0 have the following bit representation:

    00000000000111111111111111111111 (2**21-1)
    00000000000000000000000000000111 (2**3-1)
    00000000000000000000000000000000 (0)

The corresponding 64-bit morton number is 1317624576693539547, which has the
following bit representation:

    0001001001001001001001001001001001001001001001001001001011011011

## Input range

In 2D, the indices can be at most `2**31 - 1 = 2147483647`, which is also the
maximum value of a 32-bit signed integer. In 3D the indices can be at most
`2**21 - 1 = 2097151`, because 64/3 gives 21 bits.

## Usage 2D & 3D

    integer(int64) :: m_ix ! The morton number
    integer        :: ix2(2), ix3(3)

    ! Convert indices to morton numbers
    m_ix = morton_from_ix2(ix2) ! 2D
    m_ix = morton_from_ix3(ix3) ! 3D

    ! Convert morton numbers to indices
    ix2 = morton_to_ix2(m_ix) ! 2D
    ix3 = morton_to_ix3(m_ix) ! 3D

Also see `test_morton.f90`.

## Algorithm

The code uses the *magic bits* method, see
[this page](http://www.forceflow.be/2013/10/07/morton-encodingdecoding-through-bit-interleaving-implementations/).
The cost for a 64-bit number is about `log2(64)` steps, each comprising of a bit
shift, `OR` and `AND` operation.

## Links

* [Comparison of algorithms](http://www.forceflow.be/2016/01/18/libmorton-a-library-for-morton-order-encoding-decoding/)
* C++ header library [libmorton](https://github.com/Forceflow/libmorton)
