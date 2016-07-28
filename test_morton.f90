! This program demonstrates and tests the m_morton module
program test_morton
  use m_morton

  implicit none

  ! The morton indices are of the int64 kind,
  integer(int64) :: m_ix
  integer        :: ix(3)

  ix = (/2**21-1, 2**3-1, 0/)
  print *, "indices     ", ix

  m_ix = morton_from_ix3(ix)
  print *, "morton index", m_ix

  ix = morton_to_ix3(m_ix)
  print *, "indices     ", ix

  call print_bits(ix(1))
  call print_bits(ix(2))
  call print_bits(ix(3))
  call print_bits_morton(m_ix)

end program test_morton
