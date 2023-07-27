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
module load anaconda3
module load python

# load conda environment with MACS2 and homer installed
conda activate homer
module load samtools

# substitute the command to run your code below:

# use 2 arguments: 
# [1] /u/DIRECTORY (do not include FILE.bam) 
# [2] .bam FILENAME (without .bam) 
# ex: qsub run_tagdirectory.sh /u/home/c/choi/ UBC1 

# create gene enrichment tag directory
mkdir $1$2"_tags"
mkdir $1$2"_tags"/$2"_SINE.ann_tags/"
mkdir $1$2"_tags"/$2"_LINE.ann_tags/"
mkdir $1$2"_tags"/$2"_Simple_repeat.ann_tags/"
mkdir $1$2"_tags"/$2"_hg38.basic.promTSS_tags/"
mkdir $1$2"_tags"/$2"_hg38.basic.intron_tags/"
mkdir $1$2"_tags"/$2"_hg38.basic.intergenic_tags/"
mkdir $1$2"_tags"/$2"_hg38.basic.exon_tags/"
mkdir $1$2"_tags"/$2"_hg38.basic.5UTR_tags/"
mkdir $1$2"_tags"/$2"_hg38.basic.3UTR_tags/"
mkdir $1$2"_tags"/$2"_hg38.basic.TTS_tags/"
mkdir $1$2"_tags"/$2"_hg38.basic.nonCoding_tags/"
mkdir $1$2"_tags"/$2"_cpgIsland.ann_tags/"

# generate tag directory using homer
makeTagDirectory $1$2"_tags"/$2"_SINE.ann_tags/" $1$2"_intersect/"$2"_SINE.ann_intersected.bam"
makeTagDirectory $1$2"_tags"/$2"_LINE.ann_tags/" $1$2"_intersect/"$2"_LINE.ann_intersected.bam"
makeTagDirectory $1$2"_tags"/$2"_Simple_repeat.ann_tags/" $1$2"_intersect/"$2"_Simple_repeat.ann_intersected.bam"
makeTagDirectory $1$2"_tags"/$2"_hg38.basic.promTSS_tags/" $1$2"_intersect/"$2"_hg38.basic.promTSS_intersected.bam"
makeTagDirectory $1$2"_tags"/$2"_hg38.basic.intron_tags/" $1$2"_intersect/"$2"_hg38.basic.intron_intersected.bam"
makeTagDirectory $1$2"_tags"/$2"_hg38.basic.intergenic_tags/" $1$2"_intersect/"$2"_hg38.basic.intergenic_intersected.bam"
makeTagDirectory $1$2"_tags"/$2"_hg38.basic.exon_tags/" $1$2"_intersect/"$2"_hg38.basic.exon_intersected.bam"
makeTagDirectory $1$2"_tags"/$2"_hg38.basic.5UTR_tags/" $1$2"_intersect/"$2"_hg38.basic.5UTR_intersected.bam"
makeTagDirectory $1$2"_tags"/$2"_hg38.basic.3UTR_tags/" $1$2"_intersect/"$2"_hg38.basic.3UTR_intersected.bam"
makeTagDirectory $1$2"_tags"/$2"_hg38.basic.TTS_tags/" $1$2"_intersect/"$2"_hg38.basic.TTS_intersected.bam"
makeTagDirectory $1$2"_tags"/$2"_hg38.basic.nonCoding_tags/" $1/$2"_intersect/"$2"_hg38.basic.nonCoding_intersected.bam"
makeTagDirectory $1$2"_tags"/$2"_cpgIsland.ann_tags/" $1/$2"_intersect/"$2"_cpgIsland.ann_intersected.bam"



# echo job info on joblog:
echo " " 
echo "Job $JOB_ID ended on:   " `hostname -s`
echo "Job $JOB_ID ended on:   " `date `
echo " "
