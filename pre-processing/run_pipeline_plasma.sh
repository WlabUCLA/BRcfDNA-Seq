# UPDATED BY IRENE CHOI 26 Jun 2023

#!/bin/bash
#$ -cwd
# error = Merged with joblog
#$ -o joblog.$JOB_ID
#$ -j y
# Edit the line below as needed
#$ -l h_rt=12:00:00,h_data=12G
# Add multiple cores/nodes as needed:
#$ -pe shared 8
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
# [3] /u/OUTPUT_DIRECTORY
# ex: qsub run_pipeline_plasma.sh /u/home/c/choi/ P_H7 /u/scratch/c/choi/plasma/

# create processing directory
mkdir $3$2"_processing"
  
# merge reads (download bbmap)
cd bbmap
./bbmerge.sh in1=$1$2"_R1.fastq.gz" in2=$1$2"_R3.fastq.gz" out=$3$2"_processing/"$2"_merged.fastq.gz"

echo "___________BBMAP___________"

# adapter trimming (download fastp)
/u/home/c/choi/fastp -i $3$2"_processing/"$2"_merged.fastq.gz" -o $3$2"_processing/"$2"_trimmed.fastq.gz" --adapter_sequence=AGATCGGAAGAGCACACGTCTGAACTCCAGTCAC --adapter_sequence_r2=AGATCGGAAGAGCGTCGTGTAGGGAAAGAGTGT -p -w 4 -L --overlap_len_require 25 > $3$2"_processing/"$2"_trimmed.fastq.log"
mv fastp.html $3$2"_processing/"$2"_trimmed.fastq.html"
mv fastp.json $3$2"_processing/"$2"_trimmed.fastq.json"

echo "___________FASTP___________"

# BWA-MEM alignment
module load bwa
bwa mem /u/home/c/choi/RefGenomes/bwamem/GRCh38_lambda3.fa $3$2"_processing/"$2"_trimmed.fastq.gz" > $3$2"_processing/"$2"_bwamem.sam"

echo "___________BWA-MEM___________"

# convert sam to bam
module load samtools
samtools view -bS $3$2"_processing/"$2"_bwamem.sam" > $3$2"_processing/"$2"_bwamem.bam"

echo "___________SAM2BAM___________"

# sort bam
module load samtools
samtools sort -o $3$2"_processing/"$2"_sorted_1.bam" $3$2"_processing/"$2"_bwamem.bam"

echo "___________SORT1___________"

# index bam
module load samtools
samtools index $3$2"_processing/"$2"_sorted_1.bam"

echo "___________INDEX1___________"

# intermediate qualimap
cd /u/home/c/choi/qualimap_v2.2.1/
./qualimap bamqc -bam $3$2"_processing/"$2"_sorted_1.bam" -outdir $3$2"_processing/"$2"_intermediate.QC" --java-mem-size=15G

echo "___________QC1___________"

# dedup SRSLY-UMI bamtag
module load python
srslyumi-bamtag --binary -o $3$2"_processing/"$2"_RX.bam" --take-fragment 0 $3$2"_processing/"$2"_sorted_1.bam"

echo "___________SRSLYUMI___________"

# dedup UMI_tools
module load python
umi_tools group --output-bam --stdin=$3$2"_processing/"$2"_RX.bam" --stdout=$3$2"_processing/"$2"_BX.bam" --group-out=$3$2"_processing/"$2"_umicorrection.tsv" --extract-umi-method=tag --umi-tag=RX --method=directional --paired --unmapped-reads=use --chimeric-pairs=discard 

echo "___________UMITOOLS___________"

# dedup picard removal
module load java
java -jar $PICARD picard.jar MarkDuplicates -BARCODE_TAG BX -VALIDATION_STRINGENCY LENIENT -I $3$2"_processing/"$2"_BX.bam" -O $3$2"_processing/"$2"_deduped.bam" -M $3$2"_processing/"$2"_deduped.metrics.txt" -REMOVE_DUPLICATES TRUE

echo "___________PICARD___________"

# sort bam
module load samtools
samtools sort -o $3$2"_processing/"$2"_sorted_2.bam" $3$2"_processing/"$2"_deduped.bam"

echo "___________SORT2___________"

# index bam
module load samtools
samtools index $3$2"_processing/"$2"_sorted_2.bam"

echo "___________INDEX2___________"

# remove soft and hard clips
module load samtools
samtools view -H $3$2"_processing/"$2"_sorted_2.bam" > $3$2"_processing/"$2"_SCHC.sam"
samtools view $3$2"_processing/"$2"_sorted_2.bam" |awk '$6  !~ /S/ &&   $6  !~ /H/ && $6  ~ /M/  {print}' >>  $3$2"_processing/"$2"_SCHC.sam"

echo "___________SCHC___________"

# convert sam to bam
module load samtools
samtools view -bS $3$2"_processing/"$2"_SCHC.sam" > $3$2"_processing/"$2"_SCHC.bam"

echo "___________SAM2BAM___________"

# sort bam
module load samtools
samtools sort -o $3$2"_processing/"$2"_sorted_3.bam" $3$2"_processing/"$2"_SCHC.bam"

echo "___________SORT3___________"

# index bam
module load samtools
samtools index $3$2"_processing/"$2"_sorted_3.bam"

echo "___________INDEX3___________"

# export human reads
module load samtools
samtools view -b $3$2"_processing/"$2"_sorted_3.bam"  chr1 chr2 chr3 chr4 chr5 chr6 chr7 chr8 chr9 chr10 chr11 chr12 chr13 chr14 chr15 chr16 chr17 chr18 chr19 chr20 chr21 chr22 chrX chrY > $3$2"_processing/"$2"_nuc.bam"
samtools view -b $3$2"_processing/"$2"_sorted_3.bam" chrM > $3$2"_processing/"$2"_mit.bam" 

echo "___________NUC/MIT___________"


# remove blacklisted regions
module load bedtools
bedtools intersect -v -abam $3$2"_processing/"$2"_nuc.bam" -b /u/home/c/choi/blacklist.bed > $3$2"_processing/"$2"_blacklisted.bam"

echo "___________BLACKLIST___________"

# final qualimap
cd /u/home/c/choi/qualimap_v2.2.1/
./qualimap bamqc -bam $3$2"_processing/"$2"_nuc.bam" -outdir $3$2"_processing/"$2"_final.QC" --java-mem-size=15G

echo "___________QC2___________"

# sort bam
module load samtools
samtools sort -o $3$2"_processing/"$2"_sorted_blacklisted.bam" $3$2"_processing/"$2"_blacklisted.bam"

echo "___________SORT4___________"

# index bam
module load samtools
samtools index $3$2"_processing/"$2"_sorted_blacklisted.bam"

echo "___________INDEX4___________"