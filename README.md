# 2020_sc_hgemv_artifacts


In order to compile all the relevant code, edit the build.sh script and run it

The executables used for the results contained in the paper are located in

petsc/arch-cpu/externalpackages/git.hara/examples/hgemv_dist (for CPU only builds)

or in

petsc/arch-gpu/externalpackages/git.hara/examples/hgemv_dist (GPU enabled builds)

The results folder contains data from the SUMMIT configuration (artifacts.txt), outputs for 2d and 3d runs, together with the scripts (filter.sh) we used to collect the timings
