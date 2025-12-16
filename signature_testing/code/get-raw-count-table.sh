#!/bin/bash

#SBATCH --time 1:0:0
#SBATCH --mem 8G
#SBATCH --ntasks 8
#SBATCH --mail-type END

module purge; module load bluebear
set -e

countDir='/rds/projects/g/gendood-preclinbase/SCORT_validation/pipeline-Geoffrey/raw.counts.subread'

cd "$countDir"

# remove comment lines
# only output gene_id and sample_ids
grep -v '^#' SCORT_validation_featureCounts \
	| cut -f 1,7- \
	| sed 's/\t/,/g' \
	> raw-count.csv

