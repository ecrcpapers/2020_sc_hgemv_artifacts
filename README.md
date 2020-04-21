# 2020_sc_hgemv_artifacts


In order to download and compile all the relevant code, edit the build.sh script and run it.

After successfull compilation, the executables used for the results contained in the paper will be located in

petsc/arch-cpu/externalpackages/git.hara/examples/hgemv_dist (for CPU only builds)

or in

petsc/arch-gpu/externalpackages/git.hara/examples/hgemv_dist (GPU enabled builds)

For example, to run the GPU test cases:
```
cd petsc/arch-gpu/externalpackages/git.hara/examples/hgemv_dist
make
mpiexec -n 2 ./test_hgemv_dist_2d 128 64 64 8 0.9 4 1
```
The above command will use a 128x64 grid of points in 2D, using 64 as leaf size, 8 as (1D) approximation order for the off-diagonal blocks amenable to compression, 0.9 as admissibility parameter eta, from 1 to 4 rhs vectors in powers of two (i.e. 1,2 and 4), and check the results using the sequential code as baseline. You should get an output like the one below
```
Local Rank  1 Pid  56918 on    jasmine device  1 [0x07] Tesla K80
Local Rank  0 Pid  56917 on    jasmine device  0 [0x06] Tesla K80
N = 8192
Rank 0 Vectors 1 Run 0: 0.014467 GFLOP in 0.007588s at 1.906535 GFLOP/s
Rank 1 Vectors 1 Run 0: 0.014434 GFLOP in 0.007588s at 1.902217 GFLOP/s
Rank 0 Vectors 1 Run 1: 0.014467 GFLOP in 0.006861s at 2.108604 GFLOP/s
Rank 1 Vectors 1 Run 1: 0.014434 GFLOP in 0.005898s at 2.447322 GFLOP/s
Rank 0 Vectors 1 Run 2: 0.014467 GFLOP in 0.005937s at 2.436724 GFLOP/s
Rank 1 Vectors 1 Run 2: 0.014434 GFLOP in 0.005907s at 2.443569 GFLOP/s
Rank 0 Vectors 1 Run 3: 0.014467 GFLOP in 0.005781s at 2.502445 GFLOP/s
Rank 1 Vectors 1 Run 3: 0.014434 GFLOP in 0.005752s at 2.509403 GFLOP/s
Rank 0 Vectors 1 Run 4: 0.014467 GFLOP in 0.005857s at 2.470052 GFLOP/s
Rank 1 Vectors 1 Run 4: 0.014434 GFLOP in 0.005828s at 2.476757 GFLOP/s
Rank 0 Vectors 1 Run 5: 0.014467 GFLOP in 0.005844s at 2.475494 GFLOP/s
Rank 1 Vectors 1 Run 5: 0.014434 GFLOP in 0.005814s at 2.482648 GFLOP/s
Rank 0 Vectors 1 Run 6: 0.014467 GFLOP in 0.005767s at 2.508549 GFLOP/s
Rank 1 Vectors 1 Run 6: 0.014434 GFLOP in 0.005739s at 2.515137 GFLOP/s
Rank 0 Vectors 1 Run 7: 0.014467 GFLOP in 0.005755s at 2.513745 GFLOP/s
Rank 1 Vectors 1 Run 7: 0.014434 GFLOP in 0.005727s at 2.520372 GFLOP/s
Rank 0 Vectors 1 Run 8: 0.014467 GFLOP in 0.005837s at 2.478527 GFLOP/s
Rank 1 Vectors 1 Run 8: 0.014434 GFLOP in 0.005809s at 2.484788 GFLOP/s
Rank 0 Vectors 1 Run 9: 0.014467 GFLOP in 0.005714s at 2.531785 GFLOP/s
Rank 1 Vectors 1 Run 9: 0.014434 GFLOP in 0.005689s at 2.537272 GFLOP/s
Vectors = 1: Average runtime = 5.928 ms for 0.029 GFLOP at 4.875 GFLOP/s
Vec diff = 4.864309e-16
Rank 0 Vectors 2 Run 0: 0.028934 GFLOP in 0.006178s at 4.683490 GFLOP/s
Rank 1 Vectors 2 Run 0: 0.028869 GFLOP in 0.006178s at 4.672882 GFLOP/s
Rank 0 Vectors 2 Run 1: 0.028934 GFLOP in 0.006212s at 4.657785 GFLOP/s
Rank 1 Vectors 2 Run 1: 0.028869 GFLOP in 0.006253s at 4.616758 GFLOP/s
Rank 0 Vectors 2 Run 2: 0.028934 GFLOP in 0.006983s at 4.143487 GFLOP/s
Rank 1 Vectors 2 Run 2: 0.028869 GFLOP in 0.006999s at 4.124667 GFLOP/s
Rank 0 Vectors 2 Run 3: 0.028934 GFLOP in 0.006216s at 4.654748 GFLOP/s
Rank 1 Vectors 2 Run 3: 0.028869 GFLOP in 0.006230s at 4.633897 GFLOP/s
Rank 0 Vectors 2 Run 4: 0.028934 GFLOP in 0.006095s at 4.747246 GFLOP/s
Rank 1 Vectors 2 Run 4: 0.028869 GFLOP in 0.006110s at 4.724849 GFLOP/s
Rank 0 Vectors 2 Run 5: 0.028934 GFLOP in 0.006164s at 4.693997 GFLOP/s
Rank 1 Vectors 2 Run 5: 0.028869 GFLOP in 0.006178s at 4.672702 GFLOP/s
Rank 0 Vectors 2 Run 6: 0.028934 GFLOP in 0.006759s at 4.280726 GFLOP/s
Rank 1 Vectors 2 Run 6: 0.028869 GFLOP in 0.006806s at 4.241557 GFLOP/s
Rank 0 Vectors 2 Run 7: 0.028934 GFLOP in 0.006194s at 4.671232 GFLOP/s
Rank 1 Vectors 2 Run 7: 0.028869 GFLOP in 0.006220s at 4.641179 GFLOP/s
Rank 0 Vectors 2 Run 8: 0.028934 GFLOP in 0.006222s at 4.650289 GFLOP/s
Rank 1 Vectors 2 Run 8: 0.028869 GFLOP in 0.006246s at 4.622045 GFLOP/s
Rank 0 Vectors 2 Run 9: 0.028934 GFLOP in 0.006209s at 4.660110 GFLOP/s
Rank 1 Vectors 2 Run 9: 0.028869 GFLOP in 0.006235s at 4.630175 GFLOP/s
Vectors = 2: Average runtime = 6.339 ms for 0.058 GFLOP at 9.118 GFLOP/s
Vec diff = 2.483207e-16
Rank 0 Vectors 4 Run 0: 0.057868 GFLOP in 0.013833s at 4.183337 GFLOP/s
Rank 1 Vectors 4 Run 0: 0.057737 GFLOP in 0.013833s at 4.173861 GFLOP/s
Rank 0 Vectors 4 Run 1: 0.057868 GFLOP in 0.006221s at 9.302004 GFLOP/s
Rank 1 Vectors 4 Run 1: 0.057737 GFLOP in 0.006290s at 9.179268 GFLOP/s
Rank 0 Vectors 4 Run 2: 0.057868 GFLOP in 0.006105s at 9.478919 GFLOP/s
Rank 1 Vectors 4 Run 2: 0.057737 GFLOP in 0.006132s at 9.415896 GFLOP/s
Rank 0 Vectors 4 Run 3: 0.057868 GFLOP in 0.007825s at 7.395405 GFLOP/s
Rank 1 Vectors 4 Run 3: 0.057737 GFLOP in 0.007850s at 7.355123 GFLOP/s
Rank 0 Vectors 4 Run 4: 0.057868 GFLOP in 0.006216s at 9.309496 GFLOP/s
Rank 1 Vectors 4 Run 4: 0.057737 GFLOP in 0.006241s at 9.251507 GFLOP/s
Rank 0 Vectors 4 Run 5: 0.057868 GFLOP in 0.006103s at 9.481881 GFLOP/s
Rank 1 Vectors 4 Run 5: 0.057737 GFLOP in 0.006129s at 9.420292 GFLOP/s
Rank 0 Vectors 4 Run 6: 0.057868 GFLOP in 0.006220s at 9.303430 GFLOP/s
Rank 1 Vectors 4 Run 6: 0.057737 GFLOP in 0.006245s at 9.245149 GFLOP/s
Rank 0 Vectors 4 Run 7: 0.057868 GFLOP in 0.006105s at 9.478919 GFLOP/s
Rank 1 Vectors 4 Run 7: 0.057737 GFLOP in 0.006131s at 9.417361 GFLOP/s
Rank 0 Vectors 4 Run 8: 0.057868 GFLOP in 0.006188s at 9.351822 GFLOP/s
Rank 1 Vectors 4 Run 8: 0.057737 GFLOP in 0.006213s at 9.293044 GFLOP/s
Rank 0 Vectors 4 Run 9: 0.057868 GFLOP in 0.006155s at 9.401813 GFLOP/s
Rank 1 Vectors 4 Run 9: 0.057737 GFLOP in 0.006179s at 9.344322 GFLOP/s
Vectors = 4: Average runtime = 6.349 ms for 0.116 GFLOP at 18.209 GFLOP/s
Vec diff = 7.615423e-17
```
For the 3d case
```
mpiexec -n 2 ./test_hgemv_dist_3d 128 64 32 64 4 1.1 -5 1
```
where we added the third dimension (32) to the grid. The meaning of the other command line parameters remains the same: leaf size, 1D approx order, eta, number of vectors, and check for the results. The number of vectors is negative and it means we only want to test for a specific number, in this case 5. The above command should produce an output like this
```
Local Rank  0 Pid  57189 on    jasmine device  0 [0x06] Tesla K80
Local Rank  1 Pid  57190 on    jasmine device  1 [0x07] Tesla K80
N = 262144
Rank 0 Run 0: 2.505605 GFLOP in 0.042117s at 59.491707 GFLOP/s
Rank 1 Run 0: 2.505441 GFLOP in 0.042117s at 59.487817 GFLOP/s
Rank 0 Run 1: 2.505605 GFLOP in 0.047109s at 53.187254 GFLOP/s
Rank 1 Run 1: 2.505441 GFLOP in 0.063959s at 39.172540 GFLOP/s
Rank 0 Run 2: 2.505605 GFLOP in 0.051304s at 48.838300 GFLOP/s
Rank 1 Run 2: 2.505441 GFLOP in 0.051204s at 48.930610 GFLOP/s
Rank 0 Run 3: 2.505605 GFLOP in 0.036695s at 68.281915 GFLOP/s
Rank 1 Run 3: 2.505441 GFLOP in 0.036695s at 68.277450 GFLOP/s
Rank 0 Run 4: 2.505605 GFLOP in 0.036701s at 68.270826 GFLOP/s
Rank 1 Run 4: 2.505441 GFLOP in 0.036700s at 68.268136 GFLOP/s
Rank 0 Run 5: 2.505605 GFLOP in 0.036697s at 68.278366 GFLOP/s
Rank 1 Run 5: 2.505441 GFLOP in 0.036697s at 68.273902 GFLOP/s
Rank 0 Run 6: 2.505605 GFLOP in 0.034959s at 71.673006 GFLOP/s
Rank 1 Run 6: 2.505441 GFLOP in 0.034960s at 71.666365 GFLOP/s
Rank 0 Run 7: 2.505605 GFLOP in 0.034472s at 72.685250 GFLOP/s
Rank 1 Run 7: 2.505441 GFLOP in 0.034473s at 72.678487 GFLOP/s
Rank 0 Run 8: 2.505605 GFLOP in 0.034486s at 72.656104 GFLOP/s
Rank 1 Run 8: 2.505441 GFLOP in 0.034486s at 72.651354 GFLOP/s
Rank 0 Run 9: 2.505605 GFLOP in 0.034418s at 72.799545 GFLOP/s
Vectors = 5: Average runtime = 38.538 ms for 5.011 GFLOP at 130.029 GFLOP/s
Rank 1 Run 9: 2.505441 GFLOP in 0.034418s at 72.794785 GFLOP/s
Vec diff = 1.670721e-16
```
The results folder contains data from the SUMMIT configuration (artifacts.txt), outputs for 2d and 3d runs, together with the scripts (filter.sh) we used to collect the timings.
