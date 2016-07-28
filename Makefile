FC 	:= gfortran
FFLAGS	:= -O2 -g -std=f2008 -Wall -Wextra

OBJS	:= m_morton.o

.PHONY:	all test clean

all: 	test_morton

clean:
	$(RM) test_m_morton

# Dependency information
test_morton:	m_morton.o

# How to get .o object files from .f90 source files
%.o: %.f90
	$(FC) -c -o $@ $< $(FFLAGS)

# How to get executables from .o object files
%: %.o
	$(FC) -o $@ $^ $(FFLAGS)
