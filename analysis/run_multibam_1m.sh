# UPDATED BY IRENE CHOI 17 Apr 2023

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

# substitute the command to run your code below:

# use 2 arguments: 
# [1] /u/INPUT_DIRECTORY (do not include FILENAME) 
# [2] FILENAME (do not include _R1 or _R3, use ONLY sample name)
# ex: qsub run_plasma_split.sh /u/home/c/choi/ P_H7

# create delfi_frag analysis directory
mkdir $1$2"_analysis"

# run multibam summary using binsize of 1m
module load anaconda3
module load python
conda activate dt_choi
multiBamSummary bins --bamfiles $1$2"_processing/"$2"_sorted_us.bam" --binSize 1000000 --minMappingQuality 10 --outRawCounts $1$2"_analysis/"$2"_us_multibam.csv"
multiBamSummary bins --bamfiles $1$2"_processing/"$2"_sorted_mn.bam" --binSize 1000000 --minMappingQuality 10 --outRawCounts $1$2"_analysis/"$2"_mn_multibam.csv"

echo "___________MULTIBAM___________"

# echo job info on joblog:
echo " " 
echo "Job $JOB_ID ended on:   " `hostname -s`
echo "Job $JOB_ID ended on:   " `date `
echo " "