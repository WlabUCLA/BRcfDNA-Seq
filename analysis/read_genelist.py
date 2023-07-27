# UPDATED BY IRENE CHOI 8 Mar 2023

from pandas import *
import numpy as np
import subprocess

# reading CSV file
# manually input .csv file
data = read_csv("OC_intersect.csv")
 
# converting column data to list
name = data['name'].tolist()
chr_info = data['chr_info'].tolist()

# iterate through each gene from CSV file
for i in range(len(name)):
    # obtain gene chromosome, start, end regions
    region = chr_info[i]
    # generate gene_name based on the gene name
    # manually input directory with FILENAME (without .bam)
    gene_name = "/u/scratch/n/neeti/OC_procd/intersect/UBC31/UBC31_Clippremove_intersected_" + name[i] + ".sam"
    # call run_geneintersect_view.sh to run samtools view with input of output file name (gene_name), input file (manually write in), gene region
    # manually input directory of run_geneintersect_view.sh, directory with FILENAME (with .bam)
    subprocess.call(['/u/home/n/neeti/run_geneintersect_view.sh', str(gene_name), "/u/scratch/n/neeti/OC_procd/intersect/UBC31_Clippremove_OC_intersect_intersected.bam", str(region)])


for i in range(len(name)):
    # obtain gene chromosome, start, end regions
    region = chr_info[i]
    # generate gene_name based on the gene name
    # manually input directory with FILENAME (without .bam)
    gene_name = "/u/scratch/n/neeti/OC_procd/intersect/UBC32/UBC32_Clippremove_intersected_" + name[i] + ".sam"
    # call run_geneintersect_view.sh to run samtools view with input of output file name (gene_name), input file (manually write in), gene region
    # manually input directory of run_geneintersect_view.sh, directory with FILENAME (with .bam)
    subprocess.call(['/u/home/n/neeti/run_geneintersect_view.sh', str(gene_name), "/u/scratch/n/neeti/OC_procd/intersect/UBC32_Clippremove_OC_intersect_intersected.bam", str(region)])


for i in range(len(name)):
    # obtain gene chromosome, start, end regions
    region = chr_info[i]
    # generate gene_name based on the gene name
    # manually input directory with FILENAME (without .bam)
    gene_name = "/u/scratch/n/neeti/OC_procd/intersect/UBC33/UBC33_Clippremove_intersected_" + name[i] + ".sam"
    # call run_geneintersect_view.sh to run samtools view with input of output file name (gene_name), input file (manually write in), gene region
    # manually input directory of run_geneintersect_view.sh, directory with FILENAME (with .bam)
    subprocess.call(['/u/home/n/neeti/run_geneintersect_view.sh', str(gene_name), "/u/scratch/n/neeti/OC_procd/intersect/UBC33_Clippremove_OC_intersect_intersected.bam", str(region)])


for i in range(len(name)):
    # obtain gene chromosome, start, end regions
    region = chr_info[i]
    # generate gene_name based on the gene name
    # manually input directory with FILENAME (without .bam)
    gene_name = "/u/scratch/n/neeti/OC_procd/intersect/UBC34/UBC34_Clippremove_intersected_" + name[i] + ".sam"
    # call run_geneintersect_view.sh to run samtools view with input of output file name (gene_name), input file (manually write in), gene region
    # manually input directory of run_geneintersect_view.sh, directory with FILENAME (with .bam)
    subprocess.call(['/u/home/n/neeti/run_geneintersect_view.sh', str(gene_name), "/u/scratch/n/neeti/OC_procd/intersect/UBC34_Clippremove_OC_intersect_intersected.bam", str(region)])


for i in range(len(name)):
    # obtain gene chromosome, start, end regions
    region = chr_info[i]
    # generate gene_name based on the gene name
    # manually input directory with FILENAME (without .bam)
    gene_name = "/u/scratch/n/neeti/OC_procd/intersect/UBC35/UBC35_Clippremove_intersected_" + name[i] + ".sam"
    # call run_geneintersect_view.sh to run samtools view with input of output file name (gene_name), input file (manually write in), gene region
    # manually input directory of run_geneintersect_view.sh, directory with FILENAME (with .bam)
    subprocess.call(['/u/home/n/neeti/run_geneintersect_view.sh', str(gene_name), "/u/scratch/n/neeti/OC_procd/intersect/UBC35_Clippremove_OC_intersect_intersected.bam", str(region)])


for i in range(len(name)):
    # obtain gene chromosome, start, end regions
    region = chr_info[i]
    # generate gene_name based on the gene name
    # manually input directory with FILENAME (without .bam)
    gene_name = "/u/scratch/n/neeti/OC_procd/intersect/UBC36/UBC36_Clippremove_intersected_" + name[i] + ".sam"
    # call run_geneintersect_view.sh to run samtools view with input of output file name (gene_name), input file (manually write in), gene region
    # manually input directory of run_geneintersect_view.sh, directory with FILENAME (with .bam)
    subprocess.call(['/u/home/n/neeti/run_geneintersect_view.sh', str(gene_name), "/u/scratch/n/neeti/OC_procd/intersect/UBC36_Clippremove_OC_intersect_intersected.bam", str(region)])


for i in range(len(name)):
    # obtain gene chromosome, start, end regions
    region = chr_info[i]
    # generate gene_name based on the gene name
    # manually input directory with FILENAME (without .bam)
    gene_name = "/u/scratch/n/neeti/OC_procd/intersect/UBC37/UBC37_Clippremove_intersected_" + name[i] + ".sam"
    # call run_geneintersect_view.sh to run samtools view with input of output file name (gene_name), input file (manually write in), gene region
    # manually input directory of run_geneintersect_view.sh, directory with FILENAME (with .bam)
    subprocess.call(['/u/home/n/neeti/run_geneintersect_view.sh', str(gene_name), "/u/scratch/n/neeti/OC_procd/intersect/UBC37_Clippremove_OC_intersect_intersected.bam", str(region)])


for i in range(len(name)):
    # obtain gene chromosome, start, end regions
    region = chr_info[i]
    # generate gene_name based on the gene name
    # manually input directory with FILENAME (without .bam)
    gene_name = "/u/scratch/n/neeti/OC_procd/intersect/UBC38/UBC38_Clippremove_intersected_" + name[i] + ".sam"
    # call run_geneintersect_view.sh to run samtools view with input of output file name (gene_name), input file (manually write in), gene region
    # manually input directory of run_geneintersect_view.sh, directory with FILENAME (with .bam)
    subprocess.call(['/u/home/n/neeti/run_geneintersect_view.sh', str(gene_name), "/u/scratch/n/neeti/OC_procd/intersect/UBC38_Clippremove_OC_intersect_intersected.bam", str(region)])


for i in range(len(name)):
    # obtain gene chromosome, start, end regions
    region = chr_info[i]
    # generate gene_name based on the gene name
    # manually input directory with FILENAME (without .bam)
    gene_name = "/u/scratch/n/neeti/OC_procd/intersect/UBC39/UBC39_Clippremove_intersected_" + name[i] + ".sam"
    # call run_geneintersect_view.sh to run samtools view with input of output file name (gene_name), input file (manually write in), gene region
    # manually input directory of run_geneintersect_view.sh, directory with FILENAME (with .bam)
    subprocess.call(['/u/home/n/neeti/run_geneintersect_view.sh', str(gene_name), "/u/scratch/n/neeti/OC_procd/intersect/UBC39_Clippremove_OC_intersect_intersected.bam", str(region)])


for i in range(len(name)):
    # obtain gene chromosome, start, end regions
    region = chr_info[i]
    # generate gene_name based on the gene name
    # manually input directory with FILENAME (without .bam)
    gene_name = "/u/scratch/n/neeti/OC_procd/intersect/UBC40/UBC40_Clippremove_intersected_" + name[i] + ".sam"
    # call run_geneintersect_view.sh to run samtools view with input of output file name (gene_name), input file (manually write in), gene region
    # manually input directory of run_geneintersect_view.sh, directory with FILENAME (with .bam)
    subprocess.call(['/u/home/n/neeti/run_geneintersect_view.sh', str(gene_name), "/u/scratch/n/neeti/OC_procd/intersect/UBC40_Clippremove_OC_intersect_intersected.bam", str(region)])