#!/bin/bash

#SBATCH --time 1:0:0
#SBATCH --mem 32G
#SBATCH --ntasks 32
#SBATCH --mail-type END

module purge; module load bluebear
set -e

#install HISAT2 from BlueBEAR
module load bear-apps/2022b
module load HISAT2/2.2.1-gompi-2022b

refFileDir='/rds/projects/g/gendood-preclinbase/SCORT_validation/pipeline-Geoffrey/human.ref.hg19'
logFileDir='/rds/projects/g/gendood-preclinbase/SCORT_validation/pipeline-Geoffrey/hisat2.log'
gtfFile='hg19_NCBI_RefSeq.gtf'
ssFile='hg19_NCBI_RefSeq.ss'
exonFile='hg19_NCBI_RefSeq.exon'
snpFile='snp151Common'

#echo -e "${dir}/${gtfFile}"
#echo -e "${dir}/${ssFile}"
#echo -e "${dir}/${exonFile}"
#echo -e "${dir}/${snpFile}"

#extract alternative splicing information from genome annotation file
hisat2_extract_splice_sites.py "$refFileDir/$gtfFile" > "$refFileDir/$ssFile"

#extract exon information from genome annotation file
hisat2_extract_exons.py "$refFileDir/$gtfFile" > "$refFileDir/$exonFile"

#extract snp information from genome annotation file
hisat2_extract_snps_haplotypes_UCSC.py "$refFileDir/ref_hg19.fa" "$refFileDir/snp151Common.txt" "$refFileDir/snp151Common"
