# UPDATED BY IRENE CHOI 30 Jun 2023

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
module load bedtools
module load samtools

# substitute the command to run your code below:

# use 2 or 4 arguments: 

# if you need to generate all enrichment portions, use 2 arguments
# [1] /u/DIRECTORY (do not include FILE.bam) 
# [2] .bam FILENAME (without .bam) 
# ex: qsub run_geneintersect.sh /u/home/c/choi/ UBC1

# if you need to generate one enrichment portion, use 4 arguments
# [1] /u/DIRECTORY (do not include FILE.bam) 
# [2] .bam FILENAME (without .bam) 
# [3] /u/DIRECTORY (do not include FILE.bed) 
# [4] .bed FILENAME (without .bed)
# ex: qsub run_geneintersect.sh /u/home/c/choi/ UBC1 /u/home/c/choi/ OC_intersect

# # index bam (comment out if already done)
# samtools index $1$2".bam"

# create intersect directory (comment out if already done)
mkdir $1$2"_intersect/"

# bedtools intersect for all gene enrichment regions (comment out if generating one gene enrichment)
bedtools intersect -u -abam $1$2".bam" -b /u/home/c/choi/hg38_geneenrichment/SINE.ann.bed $1$2"_intersect/"$2"_SINE.ann_intersected.bam"
bedtools intersect -u -abam $1$2".bam" -b /u/home/c/choi/hg38_geneenrichment/LINE.ann.bed $1$2"_intersect/"$2"_LINE.ann_intersected.bam"
bedtools intersect -u -abam $1$2".bam" -b /u/home/c/choi/hg38_geneenrichment/Simple_repeat.ann.bed $1$2"_intersect/"$2"_Simple_repeat.ann_intersected.bam"
bedtools intersect -u -abam $1$2".bam" -b /u/home/c/choi/hg38_geneenrichment/hg38.basic.promTSS.bed $1$2"_intersect/"$2"_hg38.basic.promTSS_intersected.bam"
bedtools intersect -u -abam $1$2".bam" -b /u/home/c/choi/hg38_geneenrichment/hg38.basic.intron.bed $1$2"_intersect/"$2"_hg38.basic.intron_intersected.bam"
bedtools intersect -u -abam $1$2".bam" -b /u/home/c/choi/hg38_geneenrichment/hg38.basic.intergenic.bed $1$2"_intersect/"$2"_hg38.basic.intergenic_intersected.bam"
bedtools intersect -u -abam $1$2".bam" -b /u/home/c/choi/hg38_geneenrichment/hg38.basic.exon.bed $1$2"_intersect/"$2"_hg38.basic.exon_intersected.bam"
bedtools intersect -u -abam $1$2".bam" -b /u/home/c/choi/hg38_geneenrichment/hg38.basic.5UTR.bed $1$2"_intersect/"$2"_hg38.basic.5UTR_intersected.bam"
bedtools intersect -u -abam $1$2".bam" -b /u/home/c/choi/hg38_geneenrichment/hg38.basic.3UTR.bed $1$2"_intersect/"$2"_hg38.basic.3UTR_intersected.bam"
bedtools intersect -u -abam $1$2".bam" -b /u/home/c/choi/hg38_geneenrichment/hg38.basic.TTS.bed $1$2"_intersect/"$2"_hg38.basic.TTS_intersected.bam"
bedtools intersect -u -abam $1$2".bam" -b /u/home/c/choi/hg38_geneenrichment/hg38.basic.nonCoding.bed $1/$2"_intersect/"$2"_hg38.basic.nonCoding_intersected.bam"
bedtools intersect -u -abam $1$2".bam" -b /u/home/c/choi/hg38_geneenrichment/cpgIsland.ann.bed $1/$2"_intersect/"$2"_cpgIsland.ann_intersected.bam"

# bedtools intersect with relation to [4] .bed file (comment out if generating all gene enrichment)
bedtools intersect -u -abam $1$2".bam" -b $3$4".bed" > $1$2"_intersect/"$2"_"$4"_intersected.bam"


# echo job info on joblog:
echo " " 
echo "Job $JOB_ID ended on:   " `hostname -s`
echo "Job $JOB_ID ended on:   " `date `
echo " "
