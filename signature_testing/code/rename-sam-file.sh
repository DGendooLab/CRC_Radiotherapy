#!/bin/bash

#SBATCH --time 1:0:0
#SBATCH --mem 16G
#SBATCH --ntasks 8
#SBATCH --mail-type END

module purge; module load bluebear
set -e

inputDir="/rds/projects/g/gendood-preclinbase/SCORT_validation/pipeline-Geoffrey/bam.hisat2"

for f in "${inputDir}"/*.sam; do
	if [ -f "$f" ]; then
		#echo -e "$f"
		#base is the filename and extension format of each sam file
		base=${f##*/}
		#echo -e "${base}"
		#remove '{' from begin
		base=${base#\{}
		#echo -e "${base}"
		#remove '}.sam' from end
		base=${base%_cutadapt\}.sam}
		newFileName="${base}.sam"
		#echo -e "${newFileName}"

		#rename
		mv "${f}" "${inputDir}/${newFileName}"
	fi
done
