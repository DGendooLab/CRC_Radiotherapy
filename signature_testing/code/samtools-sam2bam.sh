#!/bin/bash

#SBATCH --time 2:0:0
#SBATCH --mem 64G
#SBATCH --ntasks 24
#SBATCH --mail-type END

module purge; module load bluebear
set -e

module load bear-apps/2022b
module load SAMtools/1.17-GCC-12.2.0

samDir='/rds/projects/g/gendood-preclinbase/SCORT_validation/pipeline-Geoffrey/sam.hisat2.hg19'
bamDir='/rds/projects/g/gendood-preclinbase/SCORT_validation/pipeline-Geoffrey/bam.samtools.hg19'

for f in "${samDir}"/*.sam; do
	if [ -f "${f}" ]; then
		# base is the filename and extension format of each sam file
		base="${f##*/}"
		#echo -e "${base}"
		
		# fileName is the filename of each sam file
		fileName="${base%\.sam}"
		#echo -e "${fileName}"

		# convert sam files to bam files
		samtools view -@ 6 -b -h "${f}" > "${bamDir}/${fileName}.bam"
	fi
done
