#module load bio/picard-tools-1.98
module load centos6/samtools-0.1.19-fasrc01_gcc-4.4.7 
mem=20000
threads=10
time=400
inputDir=/n/rinn_data1/users/agroff/seq/OtherMice/Diana/lincP21/bam
#for dir in `ls -d $inputDir/*_*`;do 
#	echo $dir
#	sbatch -J "rmdup" -t $time --mem=$mem -N 1 -n $threads -p general --mail-type=FAIL --wrap="samtools rmdup $dir/accepted_hits_sorted_duplicates_marked.bam $dir/rmdup_accepted_hits.bam"
#done

for dir in `ls -d $inputDir/JR*`;do 
	echo $dir
	sbatch -J "rmdup" -t $time --mem=$mem -N 1 -n $threads -p general --mail-type=FAIL --wrap="samtools rmdup $dir/accepted_hits.bam $dir/rmdup_accepted_hits.bam"
done
