# UPDATED BY IRENE CHOI 3 Mar 2023

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
module load samtools
module load python

# substitute the command to run your code below:

# use 2 arguments: 
# [1] /u/DIRECTORY (do not include FILE.bam) 
# [2] .bam FILENAME (without .bam) 

# create motif directory
# mkdir $1$2"_analysis"

# convert bam to sam
module load samtools
samtools view $1$2".bam" -o $1$2".sam" -O sam

echo "___________BAM2SAM___________"

# run motif.py
python3 /u/home/c/choi/motif.py $1$2".sam"

echo "___________MOTIF___________"

# cleanup
rm -rf $1$2".sam"

# echo job info on joblog:
echo " " 
echo "Job $JOB_ID ended on:   " `hostname -s`
echo "Job $JOB_ID ended on:   " `date `
echo " "
