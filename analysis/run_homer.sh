# UPDATED BY IRENE CHOI 4 Mar 2023

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

# substitute the command to run your code below:

# use 2 arguments:
# [1] /u/DIRECTORY (do not include FILE)
# [2] FILE (without .bam)
# ex: qsub run_homer.sh /u/home/c/choi/ UBC1

# create macs2 directory
mkdir $1$2"_nomodel_macs2"
# mkdir $1$2"_macs2"

# run macs2
macs2 callpeak -f AUTO -g hs -q 0.01 --nomodel -t $1$2".bam" -n $2"_nomodel_macs2" --outdir $1$2"_nomodel_macs2"
# macs2 callpeak -f AUTO -g hs -q 0.01 -t $1$2".bam" -n $2"_macs2" --outdir $1$2"_macs2"

# create homer directory
mkdir $1$2"_nomodel_homer"
# mkdir $1$2"_homer"

mkdir $1$2"_nomodel_homer_enrichment"
# mkdir $1$2"_homer_enrichment"

mkdir $1$2"_nomodel_homer_motif"
# mkdir $1$2"_homer_motif"

# run homer
annotatePeaks.pl $1$2"_nomodel_macs2/"$2"_nomodel_macs2_peaks.narrowPeak" hg38 -annStats $1$2"_nomodel_homer"/"$2_nomodel_homer_annStats.txt" > $1$2"_nomodel_homer"/"$2_nomodel_homer_geneStats.txt"
# annotatePeaks.pl $1$2"_macs2/"$2"_macs2_peaks.narrowPeak" hg38 -annStats $1$2"_homer"/"$2_homer_annStats.txt" > $1$2"_homer"/"$2_homer_geneStats.txt"


annotatePeaks.pl $1$2"_nomodel_macs2/"$2"_nomodel_macs2_peaks.narrowPeak" hg38 -d $1$2"_tags"/$2"_SINE.ann_tags" -size 1000 -hist 10 > $1$2"_nomodel_homer_enrichment/"$2"_homer_nomodel_SINE.ann_histStats.txt"
annotatePeaks.pl $1$2"_nomodel_macs2/"$2"_nomodel_macs2_peaks.narrowPeak" hg38 -d $1$2"_tags"/$2"_Simple_repeat.ann_tags" -size 1000 -hist 10 > $1$2"_nomodel_homer_enrichment/"$2"_homer_nomodel_Simple_repeat.ann_histStats.txt"
annotatePeaks.pl $1$2"_nomodel_macs2/"$2"_nomodel_macs2_peaks.narrowPeak" hg38 -d $1$2"_tags"/$2"_hg38.basic.TTS_tags" -size 1000 -hist 10 > $1$2"_nomodel_homer_enrichment/"$2"_homer_nomodel_hg38.basic.TTS_histStats.txt"
annotatePeaks.pl $1$2"_nomodel_macs2/"$2"_nomodel_macs2_peaks.narrowPeak" hg38 -d $1$2"_tags"/$2"_hg38.basic.promTSS_tags" -size 1000 -hist 10 > $1$2"_nomodel_homer_enrichment/"$2"_homer_nomodel_hg38.basic.promTSS_histStats.txt"
annotatePeaks.pl $1$2"_nomodel_macs2/"$2"_nomodel_macs2_peaks.narrowPeak" hg38 -d $1$2"_tags"/$2"_hg38.basic.intron_tags" -size 1000 -hist 10 > $1$2"_nomodel_homer_enrichment/"$2"_homer_nomodel_hg38.basic.intron_histStats.txt"
annotatePeaks.pl $1$2"_nomodel_macs2/"$2"_nomodel_macs2_peaks.narrowPeak" hg38 -d $1$2"_tags"/$2"_hg38.basic.intergenic_tags" -size 1000 -hist 10 > $1$2"_nomodel_homer_enrichment/"$2"_homer_nomodel_hg38.basic.intergenic_histStats.txt"
annotatePeaks.pl $1$2"_nomodel_macs2/"$2"_nomodel_macs2_peaks.narrowPeak" hg38 -d $1$2"_tags"/$2"_hg38.basic.exon_tags" -size 1000 -hist 10 > $1$2"_nomodel_homer_enrichment/"$2"_homer_nomodel_hg38.basic.exon_histStats.txt"
annotatePeaks.pl $1$2"_nomodel_macs2/"$2"_nomodel_macs2_peaks.narrowPeak" hg38 -d $1$2"_tags"/$2"_hg38.basic.5UTR_tags" -size 1000 -hist 10 > $1$2"_nomodel_homer_enrichment/"$2"_homer_nomodel_hg38.basic.5UTR_histStats.txt"
annotatePeaks.pl $1$2"_nomodel_macs2/"$2"_nomodel_macs2_peaks.narrowPeak" hg38 -d $1$2"_tags"/$2"_hg38.basic.3UTR_tags" -size 1000 -hist 10 > $1$2"_nomodel_homer_enrichment/"$2"_homer_nomodel_hg38.basic.3UTR_histStats.txt"
annotatePeaks.pl $1$2"_nomodel_macs2/"$2"_nomodel_macs2_peaks.narrowPeak" hg38 -d $1$2"_tags"/$2"_cpgIsland.ann_tags" -size 1000 -hist 10 > $1$2"_nomodel_homer_enrichment/"$2"_homer_nomodel_cpgIsland.ann_histStats.txt"


# annotatePeaks.pl $1$2"_macs2/"$2"_macs2_peaks.narrowPeak" hg38 -d $1$2"_tags"/$2"_SINE.ann_tags" -size 1000 -hist 10 > $1$2"_homer_enrichment/"$2"_homer_SINE.ann_histStats.txt"
# annotatePeaks.pl $1$2"_macs2/"$2"_macs2_peaks.narrowPeak" hg38 -d $1$2"_tags"/$2"_Simple_repeat.ann_tags" -size 1000 -hist 10 > $1$2"_homer_enrichment/"$2"_homer_Simple_repeat.ann_histStats.txt"
# annotatePeaks.pl $1$2"_macs2/"$2"_macs2_peaks.narrowPeak" hg38 -d $1$2"_tags"/$2"_hg38.basic.TTS_tags" -size 1000 -hist 10 > $1$2"_homer_enrichment/"$2"_homer_hg38.basic.TTS_histStats.txt"
# annotatePeaks.pl $1$2"_macs2/"$2"_macs2_peaks.narrowPeak" hg38 -d $1$2"_tags"/$2"_hg38.basic.promTSS_tags" -size 1000 -hist 10 > $1$2"_homer_enrichment/"$2"_homer_hg38.basic.promTSS_histStats.txt"
# annotatePeaks.pl $1$2"_macs2/"$2"_macs2_peaks.narrowPeak" hg38 -d $1$2"_tags"/$2"_hg38.basic.intron_tags" -size 1000 -hist 10 > $1$2"_homer_enrichment/"$2"_homer_hg38.basic.intron_histStats.txt"
# annotatePeaks.pl $1$2"_macs2/"$2"_macs2_peaks.narrowPeak" hg38 -d $1$2"_tags"/$2"_hg38.basic.intergenic_tags" -size 1000 -hist 10 > $1$2"_homer_enrichment/"$2"_homer_hg38.basic.intergenic_histStats.txt"
# annotatePeaks.pl $1$2"_macs2/"$2"_macs2_peaks.narrowPeak" hg38 -d $1$2"_tags"/$2"_hg38.basic.exon_tags" -size 1000 -hist 10 > $1$2"_homer_enrichment/"$2"_homer_hg38.basic.exon_histStats.txt"
# annotatePeaks.pl $1$2"_macs2/"$2"_macs2_peaks.narrowPeak" hg38 -d $1$2"_tags"/$2"_hg38.basic.5UTR_tags" -size 1000 -hist 10 > $1$2"_homer_enrichment/"$2"_homer_hg38.basic.5UTR_histStats.txt"
# annotatePeaks.pl $1$2"_macs2/"$2"_macs2_peaks.narrowPeak" hg38 -d $1$2"_tags"/$2"_hg38.basic.3UTR_tags" -size 1000 -hist 10 > $1$2"_homer_enrichment/"$2"_homer_hg38.basic.3UTR_histStats.txt"
# annotatePeaks.pl $1$2"_macs2/"$2"_macs2_peaks.narrowPeak" hg38 -d $1$2"_tags"/$2"_cpgIsland.ann_tags" -size 1000 -hist 10 > $1$2"_homer_enrichment/"$2"_homer_cpgIsland.ann_histStats.txt"


findMotifsGenome.pl $1$2"_nomodel_macs2/"$2"_nomodel_macs2_peaks.narrowPeak" hg38 $1$2"_nomodel_homer_motif" -size 200 -mask
# findMotifsGenome.pl $1$2"_macs2/"$2"_macs2_peaks.narrowPeak" hg38 $1$2"_homer_motif" -size 200 -mask

# echo job info on joblog:
echo " " 
echo "Job $JOB_ID ended on:   " `hostname -s`
echo "Job $JOB_ID ended on:   " `date `
echo " "
