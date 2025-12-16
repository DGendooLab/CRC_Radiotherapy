#!/bin/bash

#SBATCH --time 1:0:0
#SBATCH --mem 8G
#SBATCH --ntasks 16
#SBATCH --mail-type END

module purge; module load bluebear
set -e

logDir='/rds/projects/g/gendood-preclinbase/SCORT_validation/pipeline-Geoffrey/hisat2.log3'
summaryFile="${logDir}/alignment_summary_hg19.csv"

#write header
echo "sample_id,aligned_0_time,aligned_1_time,aligned_gt1_times,overall_rate" > "${summaryFile}"

for f in "$logDir"/*.log; do
	if [ -f "$f" ]; then
		#echo -e "$f"
		
		#get primary_specimen or biopsy_specimen index
		base=$(basename "$f")
		#remove _ and suffix
		sample_id=${base%%_*}
		#remove S
		sample_id=${sample_id#S}
		#echo -e "${sample_id}"

		#extracting information from log file
		aligned_0=$(awk '/aligned 0 times/ {print $2}' "$f")
		aligned_1=$(awk '/aligned exactly 1 time/ {print $2}' "$f")
		aligned_gt_1=$(awk '/aligned >1 times/ {print $2}' "$f")
		overall_rate=$(awk '/overall alignment rate/ {print $1}' "$f")

		echo "${sample_id},${aligned_0},${aligned_1},${aligned_gt_1},${overall_rate}" >> "$summaryFile"
	fi
done
