
#!/bin/bash
#$ -cwd
# error = Merged with joblog
#$ -o joblog.$JOB_ID
#$ -j y
# Edit the line below as needed
#$ -l h_rt=10:00:00,h_data=8G
# Add multiple cores/nodes as needed:
#$ -pe shared 4
# Email address to notify
#$ -M $USER@mail
# Notify when
#$ -m bea

# echo job info on joblog:
echo "Job $JOB_ID started on:   " `hostname -s`
echo "Job $JOB_ID started on:   " `date `
echo " "

# load the job environment:
source /u/local/Modules/default/init/modules.sh
export PATH=$PATH:~/.local/bin

# substitute the command to run your code below:

# use 3 arguments: 
# [1] /u/INPUT_DIRECTORY (do not include FILENAME) 
# [2] FILENAME (do not include _R1 or _R3, use ONLY sample name)
# [3] /u/OUTPUT_DIRECTORY
# ex: qsub methfinalmodify.sh /u/scratch/j/jcheng1/ ADP02 /u/scratch/j/jcheng1/

#mkdir $1$2"_processing"

# merge reads (download bbmap)
#cd bbmap
#./bbmerge.sh in1=$1$2"_R1.fastq.gz" in2=$1$2"_R2.fastq.gz" out=$3$2"_processing/"$2"_merged.fastq.gz"

#echo "___________BBMAP___________"

# adapter trimming (download fastp)
#/u/home/j/jcheng1/fastp -i $3$2"_processing/"$2"_merged.fastq.gz" -o $3$2"_processing/"$2"_trimmed.fastq.gz" --adapter_sequence=AGATCGGAAGAGCACACGTCTGAACTCCAGTCAC --adapter_sequence_r2=AGATCGGAAGAGCGTCGTGTAGGGAAAGAGTGT -p -w 4 -L --overlap_len_require 25 > $3$2"_processing/"$2"_trimmed.fastq.log"
#mv fastp.html $3$2"_processing/"$2"_trimmed.fastq.html"
#mv fastp.json $3$2"_processing/"$2"_trimmed.fastq.json"

#echo "___________FASTP___________"

# bsbolt alignment
#module load intel/2020.4
#module load python/3.7.3
#bsbolt Align -DB /u/home/j/jcheng1/RefGenomes/GRC38_lambda_new -F1 $3$2"_processing/"$2"_trimmed.fastq.gz" -O $3$2"_processing/"$2"_methalign" -t 12 

#echo "___________BSBOLT___________"

# sort bam
module load samtools
samtools sort -o $3$2"_processing/"$2"_sorted_1.bam" $3$2"_processing/"$2"_methalign.bam"

echo "___________SORT1___________"

# index bam
module load samtools
samtools index $3$2"_processing/"$2"_sorted_1.bam"

echo "___________INDEX1___________"

# first qualimap
cd /u/home/j/jcheng1/qualimap_v2.2.1/
./qualimap bamqc -bam $3$2"_processing/"$2"_sorted_1.bam" -outdir $3$2"_processing/"$2"_first.QC" --java-mem-size=15G

echo "___________QC1___________"

module load intel/2020.4
module load samtools
samtools rmdup -s $3$2"_processing/"$2"_sorted_1.bam" $3$2"_processing/"$2"_sorted_1_dedup.bam"

echo "___________DEDUP___________"

# sort bam
module load samtools
samtools sort -o $3$2"_processing/"$2"_sorted_2.bam" $3$2"_processing/"$2"_sorted_1_dedup.bam"

echo "___________SORT2___________"

# index bam
module load samtools
samtools index $3$2"_processing/"$2"_sorted_2.bam"

echo "___________INDEX2___________"

# remove soft and hard clips
module load samtools
samtools view -H $3$2"_processing/"$2"_sorted_2.bam" > $3$2"_processing/"$2"_SCHC.sam"
samtools view $3$2"_processing/"$2"_sorted_2.bam" |awk '$6  !~ /S/ &&   $6  !~ /H/ && $6  ~ /M/  {print}' >>  $3$2"_processing/"$2"_SCHC.sam"

echo "___________SCHC___________"

# convert sam to bam
module load samtools
samtools view -bS $3$2"_processing/"$2"_SCHC.sam" > $3$2"_processing/"$2"_SCHC.bam"

echo "___________SAM2BAM___________"

# sort bam
module load samtools
samtools sort -o $3$2"_processing/"$2"_sorted_3.bam" $3$2"_processing/"$2"_SCHC.bam"

echo "___________SORT3___________"

# index bam
module load samtools
samtools index $3$2"_processing/"$2"_sorted_3.bam"

echo "___________INDEX3___________"

# export human reads
module load samtools
samtools view -b $3$2"_processing/"$2"_sorted_3.bam"  chr1 chr2 chr3 chr4 chr5 chr6 chr7 chr8 chr9 chr10 chr11 chr12 chr13 chr14 chr15 chr16 chr17 chr18 chr19 chr20 chr21 chr22 chrX chrY > $3$2"_processing/"$2"_nuc.bam"
samtools view -b $3$2"_processing/"$2"_sorted_3.bam" chrM > $3$2"_processing/"$2"_mit.bam" 

echo "___________NUC/MIT___________"


# remove blacklisted regions
module load bedtools
bedtools intersect -v -abam $3$2"_processing/"$2"_nuc.bam" -b /u/home/j/jcheng1/blacklist.bed > $3$2"_processing/"$2"_blacklisted.bam"

echo "___________BLACKLIST___________"

# sort bam
module load samtools
samtools sort -o $3$2"_processing/"$2"_sorted_4.bam" $3$2"_processing/"$2"_blacklisted.bam"

echo "___________SORT4___________"

# index bam
module load samtools
samtools index $3$2"_processing/"$2"_sorted_4.bam"

echo "___________INDEX4___________"

# split into junk_ultrashort_short_mn

source /u/local/Modules/default/init/modules.sh
export PATH=$PATH:~/.local/bin
module load python/3.6.8
#alignmentSieve -b $3$2"_processing/"$2"_sorted_4.bam" --filterMetrics log.txt -p 8 --minFragmentLength 25 --maxFragmentLength 39 -o $3$2"_processing/"$2"_junk.bam"
alignmentSieve -b $3$2"_processing/"$2"_sorted_4.bam" --filterMetrics log.txt -p 8 --minFragmentLength 40 --maxFragmentLength 70 -o $3$2"_processing/"$2"_ultrashort.bam"
#alignmentSieve -b $3$2"_processing/"$2"_sorted_4.bam" --filterMetrics log.txt -p 8 --minFragmentLength 71 --maxFragmentLength 119 -o $3$2"_processing/"$2"_short.bam"
alignmentSieve -b $3$2"_processing/"$2"_sorted_4.bam" --filterMetrics log.txt -p 8 --minFragmentLength 120 --maxFragmentLength 250 -o $3$2"_processing/"$2"_mononucleosomal.bam"

echo "___________US/MN___________"

# sort bam
module load samtools
#samtools sort -o $3$2"_processing/"$2"_sorted_junk.bam" $3$2"_processing/"$2"_junk.bam"
samtools sort -o $3$2"_processing/"$2"_sorted_us.bam" $3$2"_processing/"$2"_ultrashort.bam"
#samtools sort -o $3$2"_processing/"$2"_sorted_short.bam" $3$2"_processing/"$2"_short.bam"
samtools sort -o $3$2"_processing/"$2"_sorted_mn.bam" $3$2"_processing/"$2"_mononucleosomal.bam"

echo "___________SORT_US/MN___________"

# index bam
module load samtools
#samtools index $3$2"_processing/"$2"_sorted_junk.bam"
samtools index $3$2"_processing/"$2"_sorted_us.bam"
#samtools index $3$2"_processing/"$2"_sorted_short.bam"
samtools index $3$2"_processing/"$2"_sorted_mn.bam"

echo "___________INDEX_US/MN___________"

# echo job info on joblog:
echo " " 
echo "Job $JOB_ID ended on:   " `hostname -s`
echo "Job $JOB_ID ended on:   " `date `
echo " "


