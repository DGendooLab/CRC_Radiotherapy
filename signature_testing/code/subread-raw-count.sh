#!/bin/bash

#SBATCH --time 24:0:0
#SBATCH --mem 128G
#SBATCH --ntasks 64
#SBATCH --mail-type END

module purge; module load bluebear
set -e

module load bear-apps/2022a
module load Subread/2.0.4-GCC-11.3.0

#directory of input bam files (sorted)
bamDir='/rds/projects/g/gendood-preclinbase/SCORT_validation/pipeline-Geoffrey/bam.sorted.indexed.samtools'
#directory of output read count files
countDir='/rds/projects/g/gendood-preclinbase/SCORT_validation/pipeline-Geoffrey/raw.counts.subread'
#genome annotation file
gtfFile='/rds/projects/g/gendood-preclinbase/SCORT_validation/pipeline-Geoffrey/human.ref/hg38_NCBI_RefSeq.gtf'
#directory of output log file
logDir='/rds/projects/g/gendood-preclinbase/SCORT_validation/pipeline-Geoffrey/subread.log'

#list all bam files
ls -1 "${bamDir}"/*.bam > "${bamDir}/bamFiles.list"

#if [ -f "${gtfFile}" ]; then
#	echo -e "${gtfFile}"
#fi

#if [ -f "${bamDir}/S488465_31102024_S28_R1_001_sorted.bam" ]; then
#	echo -e "${bamDir}/S488465_31102024_S28_R11_001_sorted.bam"
#fi

featureCounts -t exon -g gene_id -Q 10 --primary -s 0 -T 6 -a "${gtfFile}" -o "${countDir}/SCORT_validation_featureCounts" "${bamDir}"/*.bam > "${logDir}/subread-featureCounts-info.log" 2>&1
#echo -e "${bamDir}"/*.bam
