#!/bin/bash

#SBATCH --time 24:0:0
#SBATCH --mem 128G
#SBATCH --ntasks 32
#SBATCH --mail-type END

module purge; module load bluebear
set -e

module load bear-apps/2022b
module load HISAT2/2.2.1-gompi-2022b

# hisat2 index file folder
idxFolder='/rds/projects/g/gendood-preclinbase/SCORT_validation/pipeline-Geoffrey/human.ref.hg19'
# processed fastq file folder
processedFastqFolder='/rds/projects/g/gendood-preclinbase/SCORT_validation/pipeline-Geoffrey/processed.fastq'
# output BAM file folder
bamFolder='/rds/projects/g/gendood-preclinbase/SCORT_validation/pipeline-Geoffrey/sam.hisat2.hg19'
# log folder
logFolder='/rds/projects/g/gendood-preclinbase/SCORT_validation/pipeline-Geoffrey/hisat2.log3'

#echo -e "${idxFolder}"
#echo -e "${processedFastqFolder}"
#echo -e "${bamFolder}"

for processedFastqFile in "${processedFastqFolder}"/*.fastq.gz; do
	fileName="${processedFastqFile%.fastq.gz}"
	fileName="${fileName##*/}"
	
	#if [ -f "${processedFastqFolder}/${fileName}.fastq.gz" ]; then
	#	echo -e "${processedFastqFolder}/${fileName}.fastq.gz"
	#fi
	hisat2 -p 12 \
		-x "${idxFolder}/ref_hg19.fa_snp_gtf" \
		-U "${processedFastqFolder}/${fileName}.fastq.gz" \
		-S "${bamFolder}/${fileName}.sam" > "${logFolder}/${fileName}_hisat2_info.log" 2>&1
	
	#echo -e "${bamFolder}/${fileName##*/}.sam"
done
