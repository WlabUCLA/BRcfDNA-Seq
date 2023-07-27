# UPDATED BY IRENE CHOI 18 Apr 2023

#!/bin/bash
#$ -cwd
# error = Merged with joblog
#$ -o joblog.$JOB_ID
#$ -j y
# Edit the line below as needed
#$ -l h_rt=2:00:00,h_data=2G
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

# use 2 arguments: 
# [1] /u/INPUT_DIRECTORY (do not include FILENAME) 
# [2] FILENAME (do not include _R1 or _R3, use ONLY sample name)
# ex: qsub run_insert_size.sh /u/home/c/choi/ P_H7

# create analysis directory
mkdir $1$2"_analysis"

# convert bam to sam
module load samtools
samtools view $1$2"_processing/"$2"_sorted_blacklisted.bam" -@ 4 | cut -f10 | awk '{print length}' | sort | uniq -c > $1$2"_analysis/"$2"_insert_size.txt"

echo "___________INSERTSIZE___________"

# echo job info on joblog:
echo " " 
echo "Job $JOB_ID ended on:   " `hostname -s`
echo "Job $JOB_ID ended on:   " `date `
echo " "