# UPDATED BY IRENE CHOI 11 Mar 2023

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

samtools view -c -F 260 /u/scratch/n/neeti/OC_procd/UBC1_Clippremove.bam
samtools view -c -F 260 /u/scratch/n/neeti/OC_procd/UBC2_Clippremove.bam
samtools view -c -F 260 /u/scratch/n/neeti/OC_procd/UBC3_Clippremove.bam
samtools view -c -F 260 /u/scratch/n/neeti/OC_procd/UBC4_Clippremove.bam
samtools view -c -F 260 /u/scratch/n/neeti/OC_procd/UBC5_Clippremove.bam
samtools view -c -F 260 /u/scratch/n/neeti/OC_procd/UBC6_Clippremove.bam
samtools view -c -F 260 /u/scratch/n/neeti/OC_procd/UBC7_Clippremove.bam
samtools view -c -F 260 /u/scratch/n/neeti/OC_procd/UBC8_Clippremove.bam
samtools view -c -F 260 /u/scratch/n/neeti/OC_procd/UBC9_Clippremove.bam
samtools view -c -F 260 /u/scratch/n/neeti/OC_procd/UBC10_Clippremove.bam

samtools view -c -F 260 /u/scratch/n/neeti/OC_procd/UBC11_Clippremove.bam
samtools view -c -F 260 /u/scratch/n/neeti/OC_procd/UBC12_Clippremove.bam
samtools view -c -F 260 /u/scratch/n/neeti/OC_procd/UBC13_Clippremove.bam
samtools view -c -F 260 /u/scratch/n/neeti/OC_procd/UBC14_Clippremove.bam
samtools view -c -F 260 /u/scratch/n/neeti/OC_procd/UBC15_Clippremove.bam
samtools view -c -F 260 /u/scratch/n/neeti/OC_procd/UBC16_Clippremove.bam
samtools view -c -F 260 /u/scratch/n/neeti/OC_procd/UBC17_Clippremove.bam
samtools view -c -F 260 /u/scratch/n/neeti/OC_procd/UBC18_Clippremove.bam
samtools view -c -F 260 /u/scratch/n/neeti/OC_procd/UBC19_Clippremove.bam
samtools view -c -F 260 /u/scratch/n/neeti/OC_procd/UBC20_Clippremove.bam

samtools view -c -F 260 /u/scratch/n/neeti/OC_procd/UBC21_Clippremove.bam
samtools view -c -F 260 /u/scratch/n/neeti/OC_procd/UBC22_Clippremove.bam
samtools view -c -F 260 /u/scratch/n/neeti/OC_procd/UBC23_Clippremove.bam
samtools view -c -F 260 /u/scratch/n/neeti/OC_procd/UBC24_Clippremove.bam
samtools view -c -F 260 /u/scratch/n/neeti/OC_procd/UBC25_Clippremove.bam
samtools view -c -F 260 /u/scratch/n/neeti/OC_procd/UBC26_Clippremove.bam
samtools view -c -F 260 /u/scratch/n/neeti/OC_procd/UBC27_Clippremove.bam
samtools view -c -F 260 /u/scratch/n/neeti/OC_procd/UBC28_Clippremove.bam
samtools view -c -F 260 /u/scratch/n/neeti/OC_procd/UBC29_Clippremove.bam
samtools view -c -F 260 /u/scratch/n/neeti/OC_procd/UBC30_Clippremove.bam

samtools view -c -F 260 /u/scratch/n/neeti/OC_procd/UBC31_Clippremove.bam
samtools view -c -F 260 /u/scratch/n/neeti/OC_procd/UBC32_Clippremove.bam
samtools view -c -F 260 /u/scratch/n/neeti/OC_procd/UBC33_Clippremove.bam
samtools view -c -F 260 /u/scratch/n/neeti/OC_procd/UBC34_Clippremove.bam
samtools view -c -F 260 /u/scratch/n/neeti/OC_procd/UBC35_Clippremove.bam
samtools view -c -F 260 /u/scratch/n/neeti/OC_procd/UBC36_Clippremove.bam
samtools view -c -F 260 /u/scratch/n/neeti/OC_procd/UBC37_Clippremove.bam
samtools view -c -F 260 /u/scratch/n/neeti/OC_procd/UBC38_Clippremove.bam
samtools view -c -F 260 /u/scratch/n/neeti/OC_procd/UBC39_Clippremove.bam
samtools view -c -F 260 /u/scratch/n/neeti/OC_procd/UBC40_Clippremove.bam


# echo job info on joblog:
echo " " 
echo "Job $JOB_ID ended on:   " `hostname -s`
echo "Job $JOB_ID ended on:   " `date `
echo " "
