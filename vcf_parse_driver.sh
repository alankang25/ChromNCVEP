#!/bin/bash

# This script is a driver script to run process_vcf.py on all chromosomes

#python3 /Users/kihoonkang/ncfVEP/process_vcf.py -v /Volumes/Samsung_T5/ncVEP/VCFs/chr21/gnomad.genomes.v4.1.sites.chr21.vcf.bgz \
#    -e /Volumes/Samsung_T5/ncVEP/exon_files/gencode_exons.bed \
#    -o /Volumes/Samsung_T5/ncVEP/nc_SNVs/nc_SNVs_chr21.bed
#
#echo "Finished chr21"

echo "Starting chr22"
python3 /Users/kihoonkang/ncfVEP/process_vcf.py -v /Volumes/Samsung_T5/ncVEP/VCFs/chr22/gnomad.genomes.v4.1.sites.chr22.vcf.bgz \
    -e /Volumes/Samsung_T5/ncVEP/exon_files/gencode_exons.bed \
    -o /Volumes/Samsung_T5/ncVEP/nc_SNVs/nc_SNVs_chr22.bed

echo "Finished chr22"