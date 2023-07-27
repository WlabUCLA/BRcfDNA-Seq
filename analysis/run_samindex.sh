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

samtools index /u/scratch/n/neeti/OC_procd/intersect/UBC1_Clippremove_OC_intersect_intersected.bam
samtools index /u/scratch/n/neeti/OC_procd/intersect/UBC2_Clippremove_OC_intersect_intersected.bam
samtools index /u/scratch/n/neeti/OC_procd/intersect/UBC3_Clippremove_OC_intersect_intersected.bam
samtools index /u/scratch/n/neeti/OC_procd/intersect/UBC4_Clippremove_OC_intersect_intersected.bam
samtools index /u/scratch/n/neeti/OC_procd/intersect/UBC5_Clippremove_OC_intersect_intersected.bam
samtools index /u/scratch/n/neeti/OC_procd/intersect/UBC6_Clippremove_OC_intersect_intersected.bam
samtools index /u/scratch/n/neeti/OC_procd/intersect/UBC7_Clippremove_OC_intersect_intersected.bam
samtools index /u/scratch/n/neeti/OC_procd/intersect/UBC8_Clippremove_OC_intersect_intersected.bam
samtools index /u/scratch/n/neeti/OC_procd/intersect/UBC9_Clippremove_OC_intersect_intersected.bam
samtools index /u/scratch/n/neeti/OC_procd/intersect/UBC10_Clippremove_OC_intersect_intersected.bam
samtools index /u/scratch/n/neeti/OC_procd/intersect/UBC11_Clippremove_OC_intersect_intersected.bam
samtools index /u/scratch/n/neeti/OC_procd/intersect/UBC12_Clippremove_OC_intersect_intersected.bam
samtools index /u/scratch/n/neeti/OC_procd/intersect/UBC13_Clippremove_OC_intersect_intersected.bam
samtools index /u/scratch/n/neeti/OC_procd/intersect/UBC14_Clippremove_OC_intersect_intersected.bam
samtools index /u/scratch/n/neeti/OC_procd/intersect/UBC15_Clippremove_OC_intersect_intersected.bam
samtools index /u/scratch/n/neeti/OC_procd/intersect/UBC16_Clippremove_OC_intersect_intersected.bam
samtools index /u/scratch/n/neeti/OC_procd/intersect/UBC17_Clippremove_OC_intersect_intersected.bam
samtools index /u/scratch/n/neeti/OC_procd/intersect/UBC18_Clippremove_OC_intersect_intersected.bam
samtools index /u/scratch/n/neeti/OC_procd/intersect/UBC19_Clippremove_OC_intersect_intersected.bam
samtools index /u/scratch/n/neeti/OC_procd/intersect/UBC20_Clippremove_OC_intersect_intersected.bam
samtools index /u/scratch/n/neeti/OC_procd/intersect/UBC21_Clippremove_OC_intersect_intersected.bam
samtools index /u/scratch/n/neeti/OC_procd/intersect/UBC22_Clippremove_OC_intersect_intersected.bam
samtools index /u/scratch/n/neeti/OC_procd/intersect/UBC23_Clippremove_OC_intersect_intersected.bam
samtools index /u/scratch/n/neeti/OC_procd/intersect/UBC24_Clippremove_OC_intersect_intersected.bam
samtools index /u/scratch/n/neeti/OC_procd/intersect/UBC25_Clippremove_OC_intersect_intersected.bam
samtools index /u/scratch/n/neeti/OC_procd/intersect/UBC26_Clippremove_OC_intersect_intersected.bam
samtools index /u/scratch/n/neeti/OC_procd/intersect/UBC27_Clippremove_OC_intersect_intersected.bam
samtools index /u/scratch/n/neeti/OC_procd/intersect/UBC28_Clippremove_OC_intersect_intersected.bam
samtools index /u/scratch/n/neeti/OC_procd/intersect/UBC29_Clippremove_OC_intersect_intersected.bam
samtools index /u/scratch/n/neeti/OC_procd/intersect/UBC30_Clippremove_OC_intersect_intersected.bam
samtools index /u/scratch/n/neeti/OC_procd/intersect/UBC31_Clippremove_OC_intersect_intersected.bam
samtools index /u/scratch/n/neeti/OC_procd/intersect/UBC32_Clippremove_OC_intersect_intersected.bam
samtools index /u/scratch/n/neeti/OC_procd/intersect/UBC33_Clippremove_OC_intersect_intersected.bam
samtools index /u/scratch/n/neeti/OC_procd/intersect/UBC34_Clippremove_OC_intersect_intersected.bam
samtools index /u/scratch/n/neeti/OC_procd/intersect/UBC35_Clippremove_OC_intersect_intersected.bam
samtools index /u/scratch/n/neeti/OC_procd/intersect/UBC36_Clippremove_OC_intersect_intersected.bam
samtools index /u/scratch/n/neeti/OC_procd/intersect/UBC37_Clippremove_OC_intersect_intersected.bam
samtools index /u/scratch/n/neeti/OC_procd/intersect/UBC38_Clippremove_OC_intersect_intersected.bam
samtools index /u/scratch/n/neeti/OC_procd/intersect/UBC39_Clippremove_OC_intersect_intersected.bam
samtools index /u/scratch/n/neeti/OC_procd/intersect/UBC40_Clippremove_OC_intersect_intersected.bam

mkdir /u/scratch/n/neeti/OC_procd/intersect/UBC1
mkdir /u/scratch/n/neeti/OC_procd/intersect/UBC2
mkdir /u/scratch/n/neeti/OC_procd/intersect/UBC3
mkdir /u/scratch/n/neeti/OC_procd/intersect/UBC4
mkdir /u/scratch/n/neeti/OC_procd/intersect/UBC5
mkdir /u/scratch/n/neeti/OC_procd/intersect/UBC6
mkdir /u/scratch/n/neeti/OC_procd/intersect/UBC7
mkdir /u/scratch/n/neeti/OC_procd/intersect/UBC8
mkdir /u/scratch/n/neeti/OC_procd/intersect/UBC9
mkdir /u/scratch/n/neeti/OC_procd/intersect/UBC10
mkdir /u/scratch/n/neeti/OC_procd/intersect/UBC11
mkdir /u/scratch/n/neeti/OC_procd/intersect/UBC12
mkdir /u/scratch/n/neeti/OC_procd/intersect/UBC13
mkdir /u/scratch/n/neeti/OC_procd/intersect/UBC14
mkdir /u/scratch/n/neeti/OC_procd/intersect/UBC15
mkdir /u/scratch/n/neeti/OC_procd/intersect/UBC16
mkdir /u/scratch/n/neeti/OC_procd/intersect/UBC17
mkdir /u/scratch/n/neeti/OC_procd/intersect/UBC18
mkdir /u/scratch/n/neeti/OC_procd/intersect/UBC19
mkdir /u/scratch/n/neeti/OC_procd/intersect/UBC20
mkdir /u/scratch/n/neeti/OC_procd/intersect/UBC21
mkdir /u/scratch/n/neeti/OC_procd/intersect/UBC22
mkdir /u/scratch/n/neeti/OC_procd/intersect/UBC23
mkdir /u/scratch/n/neeti/OC_procd/intersect/UBC24
mkdir /u/scratch/n/neeti/OC_procd/intersect/UBC25
mkdir /u/scratch/n/neeti/OC_procd/intersect/UBC26
mkdir /u/scratch/n/neeti/OC_procd/intersect/UBC27
mkdir /u/scratch/n/neeti/OC_procd/intersect/UBC28
mkdir /u/scratch/n/neeti/OC_procd/intersect/UBC29
mkdir /u/scratch/n/neeti/OC_procd/intersect/UBC30
mkdir /u/scratch/n/neeti/OC_procd/intersect/UBC31
mkdir /u/scratch/n/neeti/OC_procd/intersect/UBC32
mkdir /u/scratch/n/neeti/OC_procd/intersect/UBC33
mkdir /u/scratch/n/neeti/OC_procd/intersect/UBC34
mkdir /u/scratch/n/neeti/OC_procd/intersect/UBC35
mkdir /u/scratch/n/neeti/OC_procd/intersect/UBC36
mkdir /u/scratch/n/neeti/OC_procd/intersect/UBC37
mkdir /u/scratch/n/neeti/OC_procd/intersect/UBC38
mkdir /u/scratch/n/neeti/OC_procd/intersect/UBC39
mkdir /u/scratch/n/neeti/OC_procd/intersect/UBC40



# echo job info on joblog:
echo " " 
echo "Job $JOB_ID ended on:   " `hostname -s`
echo "Job $JOB_ID ended on:   " `date `
echo " "
