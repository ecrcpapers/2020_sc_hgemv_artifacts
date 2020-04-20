#!/bin/bash
# filters results and reports relevant data
tar xvf results.tar.gz
ofile="summary.txt"
echo "# NP V  MIN      AVG      MAX          TOTGFLOP -> MAXGFLOP/s   AVGGFLOP/s   MINGFLOP/s   (reported avg and gflops)" > $ofile
echo "---------------------------------------------------------------------------------------------------------------" >> $ofile
echo "" >> $ofile
for v in 01 02 04 08 16 32 64; do
echo "---------------------------------------------------------------------------------------------------------------" >> $ofile
for np in 0002 0004 0008 0016 0032 0064 0128 0256 0512 1024; do
f="hgemv_dist_np${np}_vv${v}_2_nof.log"

# Min and Max timing among the performed runs: we report only the timing from run 0 since timers are synchronized
tim=$(grep "Rank 0 Run " $f | awk '{print substr($8,1,8)}' | sort -n)

# remove min and max from the list of timings
data=$(echo $tim | awk '{ j=0;t=0;m=-1;k=-2; for(i=2; i<=NF-1;i++) { t+=1; j+=$i; k=$i; if (t==1) {m=$i;} } printf "%s %s %s %s",m,k,j,t}')

# extract min,max,sum and number of runs from filtered times
data=(${data// / })
min=${data[0]} 
max=${data[1]} 
sum=${data[2]} 
totrun=${data[3]} 
avg=$(echo $sum/$totrun | bc -l | awk '{print substr($1,1,7)}')
avg=0$avg

# total arithmetic GFLOP 
g=$(grep "Vectors " $f | awk '{print substr($10,1,8)}')

# Average time (reported in ms, so scale it to seconds for being consistent with min and max (sums only nruns -1, discards first run)
aa=$(grep "Vectors " $f | awk '{print $7}')
rep=$(grep "Vectors " $f | awk '{print $13}')
a=$(echo $aa/1000 | bc -l | awk '{print substr($1,1,7)}')
a=0$a
avgr=$(echo $g/$a | bc -l | awk '{print substr($1,1,12)'})

mins=$(echo $g/$min | bc -l | awk '{print substr($1,1,12)'})
maxs=$(echo $g/$max | bc -l | awk '{print substr($1,1,12)'})
avgs=$(echo $g/$avg | bc -l | awk '{print substr($1,1,12)'})
g=$(printf '%12s' $g)
echo "$np $v $min $avg $max $g -> $mins $avgs $maxs ($a $rep)" >> $ofile
done 
done 
echo "" >> $ofile
echo "---------------------------------------------------------------------------------------------------------------" >> $ofile
