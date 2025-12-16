#!/bin/bash
#SBATCH --time 12:0:0
#SBATCH --mem 128G
#SBATCH --ntasks 64
#SBATCH --mail-type END

module purge; module load bluebear
set -e

module load bear-apps/2023a
module load FastQC/0.11.9-Java-11

fastqc -t 64 -o /rds/projects/g/gendood-preclinbase/SCORT_validation/pipeline-Geoffrey/fastqc.results/ /rds/projects/g/gendood-preclinbase/SCORT_validation/pipeline-Geoffrey/raw.fastq/*.fastq.gz > /rds/projects/g/gendood-preclinbase/SCORT_validation/pipeline-Geoffrey/fastqc.log/fastqc.log 2>&1
