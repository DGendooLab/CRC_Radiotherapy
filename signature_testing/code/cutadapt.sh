#!/bin/bash
#SBATCH --time 24:0:0
#SBATCH --mem 128G
#SBATCH --ntasks 32
#SBATCH --mail-type END

module purge; module load bluebear
set -e

module load bear-apps/2023a
module load cutadapt/4.9-GCCcore-12.3.0

inputDir='/rds/projects/g/gendood-preclinbase/SCORT_validation/pipeline-Geoffrey/raw.fastq'
outputDir='/rds/projects/g/gendood-preclinbase/SCORT_validation/pipeline-Geoffrey/processed.fastq'
logDir='/rds/projects/g/gendood-preclinbase/SCORT_validation/pipeline-Geoffrey/cutadapt.log'

for f in "$inputDir"/*.fastq.gz; do
	if [ -f "$f" ]; then
		# f is the absolute path of each raw fastq file
		# echo -e "$f"
		# base is the filename and extension format of each raw fastq file
		base=${f##*/}
		# base is the filename of each raw fastq file
		base=${base%.fastq.gz}
		# outputFile is the output filename of each processed fastq file
		outputFile="${base}_cutadapt.fastq.gz"
		# outputFile is the absolute path of each processed fastq file
		outputFile="$outputDir/$outputFile"
		# outputLogFile is the absolute path of each log file of cutadapt
		outputLogFile="$logDir/cutadapt_info_${base}.log"

		#echo -e "$f"
		#echo -e "$outputFile"
		#echo -e "cutadapt_info_${base}.log"

		cutadapt -j 32 --times 1 -e 0.1 -O 5 --quality-cutoff 25 -m 50 \
			-a AGATCGGAAGAGCACACGTCTGAACTCCAGTCA \
			-o "$outputFile" \
			"$f"
			> "$outputLogFile" 2>&1
	fi
done
