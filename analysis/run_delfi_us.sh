# UPDATED BY IRENE CHOI 18 Apr 2023

#!/bin/bash
#$ -cwd
# error = Merged with joblog
#$ -o joblog.$JOB_ID
#$ -j y
# Edit the line below as needed
#$ -l h_rt=4:00:00,h_data=4G
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
module load gcc/4.9.3
module load intel/2020.4
module load samtools
module load bwa/0.7.17
module load bamtools
module load intel/2020.4
module load anaconda3/2020.11
module load python/3.7.3
module load java
module load perl/5.32.1
module load python/3.9.6

# substitute the command to run your code below:

# use 2 arguments: 
# [1] /u/INPUT_DIRECTORY (do not include FILENAME) 
# [2] FILENAME (do not include _R1 or _R3, use ONLY sample name)
# ex (for ultrashort): qsub run_delfi_frag_us.sh /u/home/c/choi/ P_H7

# setting the arguments
numberofchrom=25
windows_length=1000000
numberofbin=300
inputfile=$1$2"_analysis/"$2"_sorted_us.sam"
minsizeA=40
maxsizeA=53
maxsizeB=70

# create analysis directory
mkdir $1$2"_analysis"

# convert bam to sam
samtools view $1$2"_processing/"$2"_sorted_us.bam" -o $1$2"_analysis/"$2"_sorted_us.sam" -O sam

echo "___________BAM2SAM___________"

# run delfi.py
python3 /u/home/c/choi/delfi.py $numberofchrom $windows_length $numberofbin $minsizeA $maxsizeA $maxsizeB $1$2"_analysis/"$2"_sorted_us.sam"

echo "___________DELFIFRAG___________"

rm -rf $1$2"_analysis/"$2"_sorted_us.sam"


# echo job info on joblog:
echo " " 
echo "Job $JOB_ID ended on:   " `hostname -s`
echo "Job $JOB_ID ended on:   " `date `
echo " "