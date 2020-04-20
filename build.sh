#!/bin/bash

# we use PETSc to download and install all the relevant packages for us
if [ ! -d "petsc" ]
then
git clone https://gitlab.com/petsc/petsc.git
fi
cd petsc
git stash
git checkout stefanozampini/feature-add-hpackages
# for help, type ./configure --help from the PETSc source dir

#Use your favourite MPI wrappers here
MPICC=mpicc
MPICXX=mpicxx
MPIFC=mpif90
compilers="--with-cc=$MPICC --with-cxx=$MPICXX --with-fc=$MPIFC"

#Add your favorite compilation flags
CFLAGS=
CXXFLAGS=
FFLAGS=
CUDAFLAGS=

#Add your favorite optimization flags
COPTFLAGS=
CXXOPTFLAGS=
FOPTFLAGS=
CUDAOPTFLAGS=

cpuflags="--CFLAGS=$CFLAGS --COPTFLAGS=$COPTFLAGS --CXXFLAGS=$CXXFLAGS --CXXOPTFLAGS=$CXXOPTFLAGS --FFLAGS=$FFLAGS --FOPTFLAGS=$FOPTFLAGS"
gpuflags="--CUDAFLAGS=$CUDAFLAGS --CUDAOPTFLAGS=$CUDAOPTFLAGS"

# our code uses the C interface to BLAS/LAPACK. If you don't have one that can be found in system-wide installations, use
#blaslapack="--download-openblas --download-openblas-use-pthreads"
# alternatively, mkl can be used
blaslapack="--with-blaslapack-dir=$MKLROOT"

# Common options between CPU only builds and GPU builds
opts="$compilers --with-fortran-bindings=0 --with-sowing=0 --with-debugging=0 --with-openmp --with-cxx-dialect=C++11 --download-hara --download-hara-commit=origin/opt_dist_sz $blaslapack"

# CPU ONLY build: we need thrust anyway
cpubuild="--download-thrust"

# GPU enabled build: we need cuda and much more
# fill in with the compute capability, e.g. for V100 SM=70, for K80 SM=37
#SM="--with-cuda-gencodearch=your_value_for_SM_here"
gpubuild="--with-cuda --with-cudac=nvcc --download-kblas --download-magma --with-magma-fortran-bindings=0 --download-cub $SM"

# just to make sure...
export PETSC_DIR=$PWD

# configure for CPU only builds
./configure PETSC_ARCH=arch-cpu $cpuflags $opts $cpubuild

# configure for GPU enabled builds
#./configure PETSC_ARCH=arch-gpu $cpuflags $gpuflags $opts $gpubuild
