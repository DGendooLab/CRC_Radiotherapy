#!/bin/bash

#SBATCH --time 5:0:0
#SBATCH --mem 64G
#SBATCH --ntasks 32
#SBATCH --mail-type END

module purge; module load bluebear
set -e

module load bear-apps/2022b
module load SAMtools/1.17-GCC-12.2.0

# input bam files directory
inputDir='/rds/projects/g/gendood-preclinbase/SCORT_validation/pipeline-Geoffrey/bam.samtools.hg19'
# output sorted-indexed bam files directory 
outputDir='/rds/projects/g/gendood-preclinbase/SCORT_validation/pipeline-Geoffrey/bam.sorted.indexed.samtools.hg19'

for f in "${inputDir}"/*.bam; do
	if [ -f "${f}" ]; then
		#echo -e "${f}"

		# base is the filename and extension format of each bam file.
		base="${f##*/}"
		# fileName is the filename of each bam file.
		fileName="${base%\.bam}"
		#echo -e "${fileName}"

		# sort the reads by chromosome and position (coordinate order) for each bam file.
		samtools sort -@ 6 -m 4G -O BAM -o "${outputDir}/${fileName}_sorted.bam" "${f}"

		# create an index for each sorted bam file.
		samtools index "${outputDir}/${fileName}_sorted.bam"
	fi
done
