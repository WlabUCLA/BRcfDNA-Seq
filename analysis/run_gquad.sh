# UPDATED BY IRENE CHOI 20 Apr 2023

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
export PATH=$PATH:/u/home/c/choi/fastaRegexFinder.py:~/.local/bin

# substitute the command to run your code below:

# use 2 arguments: 
# [1] /u/DIRECTORY (do not include FILE.bam) 
# [2] .bam FILENAME (without .bam) 

# create gquad directory
mkdir $1$2"_gquad"

# convert bam to bed
module load bedtools
bedtools bamtobed -i $1$2".bam" > $1$2"_gquad/"$2".bed"

echo "___________BAM2BED___________"

# convert bed to fasta
bedtools getfasta -fi /u/home/c/choi/RefGenomes/bwamem/GRCh38_lambda3.fa -bed $1$2"_gquad/"$2".bed" -fo $1$2"_gquad/"$2"_gquad.fasta"
ls -latr

echo "___________BED2FASTA___________"

# run fastaRegexFinder.py
module load python
/u/home/c/choi/fastaRegexFinder.py --fasta $1$2"_gquad/"$2"_gquad.fasta" > $1$2"_gquad/"$2"_gquad.txt"

echo "___________FASTAREGEXFINDER___________"

# count number of gquads
grep -c "chr" $1$2"_gquad/"$2"_gquad.txt"  > $1$2"_gquad/"$2"_gquad_count.txt"

echo "___________GREP1___________"

# count initial number of reads
grep -c "chr" $1$2"_gquad/"$2"_gquad.fasta" > $1$2"_gquad/"$2"_gquad_total.txt"

echo "___________GREP2___________"

# echo job info on joblog:
echo " " 
echo "Job $JOB_ID ended on:   " `hostname -s`
echo "Job $JOB_ID ended on:   " `date `
echo " "
