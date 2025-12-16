#!/bin/bash

#SBATCH --time 24:0:0
#SBATCH --mem 256G
#SBATCH --ntasks 12
#SBATCH --mail-type END

module purge; module load bluebear
set -e

# GCCcore/12.2.0
module load bear-apps/2022b
module load GCCcore/12.2.0

# zlib/1.2.12-GCCcore-12.2.0
module load bear-apps/2022b
module load zlib/1.2.12-GCCcore-12.2.0

# binutils/2.39-GCCcore-12.2.0
module load bear-apps/2022b
module load binutils/2.39-GCCcore-12.2.0

# GCC/12.2.0
module load bear-apps/2022b
module load GCC/12.2.0

# numactl/2.0.16-GCCcore-12.2.0
module load bear-apps/2022b
module load numactl/2.0.16-GCCcore-12.2.0

# XZ/5.2.7-GCCcore-12.2.0
module load bear-apps/2022b
module load XZ/5.2.7-GCCcore-12.2.0

# libxml2/2.10.3-GCCcore-12.2.0
module load bear-apps/2022b
module load libxml2/2.10.3-GCCcore-12.2.0

# libpciaccess/0.17-GCCcore-12.2.0
module load bear-apps/2022b
module load libpciaccess/0.17-GCCcore-12.2.0

# hwloc/2.8.0-GCCcore-12.2.0
module load bear-apps/2022b
module load hwloc/2.8.0-GCCcore-12.2.0

# OpenSSL/1.1
module load OpenSSL/1.1

# libevent/2.1.12-GCCcore-12.2.0
module load bear-apps/2022b
module load libevent/2.1.12-GCCcore-12.2.0

# UCX/1.13.1-GCCcore-12.2.0
module load bear-apps/2022b
module load UCX/1.13.1-GCCcore-12.2.0

# libfabric/1.16.1-GCCcore-12.2.0
module load bear-apps/2022b
module load libfabric/1.16.1-GCCcore-12.2.0

# PMIx/4.2.2-GCCcore-12.2.0
module load bear-apps/2022b
module load PMIx/4.2.2-GCCcore-12.2.0

# UCC/1.1.0-GCCcore-12.2.0
module load bear-apps/2022b
module load UCC/1.1.0-GCCcore-12.2.0

# OpenMPI/4.1.4-GCC-12.2.0
module load bear-apps/2022b
module load OpenMPI/4.1.4-GCC-12.2.0

# gompi/2022b
module load bear-apps/2022b
module load gompi/2022b

# Szip/2.1.1-GCCcore-12.2.0
module load bear-apps/2022b
module load Szip/2.1.1-GCCcore-12.2.0

# HDF5/1.14.0-gompi-2022b
module load bear-apps/2022b
module load HDF5/1.14.0-gompi-2022b

# bzip2/1.0.8-GCCcore-12.2.0
module load bear-apps/2022b
module load bzip2/1.0.8-GCCcore-12.2.0

# ncbi-vdb/3.0.10-gompi-2022b
module load bear-apps/2022b
module load ncbi-vdb/3.0.10-gompi-2022b

# Java/11.0.18
module load bear-apps/2022b
module load Java/11.0.18

# file/5.45-GCCcore-12.2.0
module load bear-apps/2022b
module load file/5.45-GCCcore-12.2.0

# SRA-Toolkit/3.0.10-gompi-2022b
module load bear-apps/2022b
module load SRA-Toolkit/3.0.10-gompi-2022b

# Python-3.9.6
module load bear-apps/2022b
module load Python/3.10.8-GCCcore-12.2.0

# HISAT2/2.2.1-gompi-2022b
module load bear-apps/2022b
module load HISAT2/2.2.1-gompi-2022b

baseDir='/rds/projects/g/gendood-preclinbase/SCORT_validation/pipeline-Geoffrey/human.ref.hg19'
logDir='/rds/projects/g/gendood-preclinbase/SCORT_validation/pipeline-Geoffrey/hisat2.log'

#hisat2-build -p 3 --noauto --snp "${baseDir}/snp151Common.snp" --haplotype "${baseDir}/snp151Common.haplotype" --ss "${baseDir}/hg38_NCBI_RefSeq.ss" \
#	--exon "${baseDir}/hg38_NCBI_RefSeq.exon" "${baseDir}/ref_hg38.fa" "${baseDir}/ref_hg38.fa_snp_gtf" > "${logDir}/hisat2_build_info.log" 2>&1
 
hisat2-build -p 3 --noauto --ss "${baseDir}/hg19_NCBI_RefSeq.ss" --exon "${baseDir}/hg19_NCBI_RefSeq.exon" "${baseDir}/ref_hg19.fa" "${baseDir}/ref_hg19.fa_snp_gtf" > \
	"${logDir}/hisat2_build_info.log" 2>&1








