# 2020_sc_hgemv_artifacts


In order to compile all the relevant code, edit the build.sh script and run it

The executables used for the results contained in the paper are located in

petsc/arch-cpu/externalpackages/git.hara/examples/hgemv_dist (for CPU only builds)

or in

petsc/arch-gpu/externalpackages/git.hara/examples/hgemv_dist (GPU enabled builds)

For example, to run the GPU test cases:
```
cd petsc/arch-gpu/externalpackages/git.hara/examples/hgemv_dist
make
mpiexec -n 2 ./test_hgemv_dist_2d 128 64 64 8 0.9 64 1
```
The above command will use a 128x64 grid of points in 2D, using 64 as leaf size, 8 as (1D) approximation order for the off-diagonal blocks amenable to compression, 0.9 as admissibility parameter eta, from 1 to 64 rhs vectors in powers of two, and check the results using the sequential code as baseline. You should get an output like the one below
```
add
```
For the 3d case
```
mpiexec -n 2 ./test_hgemv_dist_2d 128 64 32 64 4 1.1 64 1
```
where we added the third dimension (32) to the grid. The meaning of the other command line parameters remains the same: leaf size, 1D approx order, eta, number of vectors, and check for the results. The above command should produce an output like this
```
aaa
```
The results folder contains data from the SUMMIT configuration (artifacts.txt), outputs for 2d and 3d runs, together with the scripts (filter.sh) we used to collect the timings.
