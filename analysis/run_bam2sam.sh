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

# substitute the command to run your code below:

# use 1 arguments: 
# [1] /u/DIRECTORY/FILENAME (without .bam) 

# ex: qsub run_bam2sam.sh /u/home/c/choi/UBC1

samtools view -h $1".bam" > $1".sam"

# echo job info on joblog:
echo " " 
echo "Job $JOB_ID ended on:   " `hostname -s`
echo "Job $JOB_ID ended on:   " `date `
echo " "
