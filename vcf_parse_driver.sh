#!/bin/bash

# This script is a driver script to run process_vcf.py on all chromosomes
:'
echo "Starting chr1"

python3 /Users/kihoonkang/ncfVEP/process_vcf.py -v /Volumes/Samsung_T5/ncVEP/VCFs/chr1/gnomad.genomes.v4.1.sites.chr1.vcf.bgz \
    -e /Volumes/Samsung_T5/ncVEP/exon_files/gencode_exons.bed \
    -o /Volumes/Samsung_T5/ncVEP/nc_SNVs/nc_SNVs_chr1.bed

echo "Finished chr1"

echo "Starting chr2"

python3 /Users/kihoonkang/ncfVEP/process_vcf.py -v /Volumes/Samsung_T5/ncVEP/VCFs/chr2/gnomad.genomes.v4.1.sites.chr2.vcf.bgz \
    -e /Volumes/Samsung_T5/ncVEP/exon_files/gencode_exons.bed \
    -o /Volumes/Samsung_T5/ncVEP/nc_SNVs/nc_SNVs_chr2.bed

echo "Finished chr2"

echo "Starting chr3"

python3 /Users/kihoonkang/ncfVEP/process_vcf.py -v /Volumes/Samsung_T5/ncVEP/VCFs/chr3/gnomad.genomes.v4.1.sites.chr3.vcf.bgz \
    -e /Volumes/Samsung_T5/ncVEP/exon_files/gencode_exons.bed \
    -o /Volumes/Samsung_T5/ncVEP/nc_SNVs/nc_SNVs_chr3.bed

echo "Finished chr3"

echo "Starting chr4"

python3 /Users/kihoonkang/ncfVEP/process_vcf.py -v /Volumes/Samsung_T5/ncVEP/VCFs/chr4/gnomad.genomes.v4.1.sites.chr4.vcf.bgz \
    -e /Volumes/Samsung_T5/ncVEP/exon_files/gencode_exons.bed \
    -o /Volumes/Samsung_T5/ncVEP/nc_SNVs/nc_SNVs_chr4.bed

echo "Finished chr4"
'
echo "Starting chr5"

python3 /Users/kihoonkang/ncfVEP/process_vcf.py -v /Volumes/Samsung_T5/ncVEP/VCFs/chr5/gnomad.genomes.v4.1.sites.chr5.vcf.bgz \
    -e /Volumes/Samsung_T5/ncVEP/exon_files/gencode_exons.bed \
    -o /Volumes/Samsung_T5/ncVEP/nc_SNVs/nc_SNVs_chr5.bed

echo "Finished chr5"

echo "Starting chr6"

python3 /Users/kihoonkang/ncfVEP/process_vcf.py -v /Volumes/Samsung_T5/ncVEP/VCFs/chr6/gnomad.genomes.v4.1.sites.chr6.vcf.bgz \
    -e /Volumes/Samsung_T5/ncVEP/exon_files/gencode_exons.bed \
    -o /Volumes/Samsung_T5/ncVEP/nc_SNVs/nc_SNVs_chr6.bed

echo "Finished chr6"

echo "Starting chr7"

python3 /Users/kihoonkang/ncfVEP/process_vcf.py -v /Volumes/Samsung_T5/ncVEP/VCFs/chr7/gnomad.genomes.v4.1.sites.chr7.vcf.bgz \
    -e /Volumes/Samsung_T5/ncVEP/exon_files/gencode_exons.bed \
    -o /Volumes/Samsung_T5/ncVEP/nc_SNVs/nc_SNVs_chr7.bed

echo "Finished chr7"

echo "Starting chr8"

python3 /Users/kihoonkang/ncfVEP/process_vcf.py -v /Volumes/Samsung_T5/ncVEP/VCFs/chr8/gnomad.genomes.v4.1.sites.chr8.vcf.bgz \
    -e /Volumes/Samsung_T5/ncVEP/exon_files/gencode_exons.bed \
    -o /Volumes/Samsung_T5/ncVEP/nc_SNVs/nc_SNVs_chr8.bed

echo "Finished chr8"

echo "Starting chr9"

python3 /Users/kihoonkang/ncfVEP/process_vcf.py -v /Volumes/Samsung_T5/ncVEP/VCFs/chr9/gnomad.genomes.v4.1.sites.chr9.vcf.bgz \
    -e /Volumes/Samsung_T5/ncVEP/exon_files/gencode_exons.bed \
    -o /Volumes/Samsung_T5/ncVEP/nc_SNVs/nc_SNVs_chr9.bed

echo "Finished chr9"

echo "Starting chr10"

python3 /Users/kihoonkang/ncfVEP/process_vcf.py -v /Volumes/Samsung_T5/ncVEP/VCFs/chr10/gnomad.genomes.v4.1.sites.chr10.vcf.bgz \
    -e /Volumes/Samsung_T5/ncVEP/exon_files/gencode_exons.bed \
    -o /Volumes/Samsung_T5/ncVEP/nc_SNVs/nc_SNVs_chr10.bed

echo "Finished chr10"

echo "Starting chr11"

python3 /Users/kihoonkang/ncfVEP/process_vcf.py -v /Volumes/Samsung_T5/ncVEP/VCFs/chr11/gnomad.genomes.v4.1.sites.chr11.vcf.bgz \
    -e /Volumes/Samsung_T5/ncVEP/exon_files/gencode_exons.bed \
    -o /Volumes/Samsung_T5/ncVEP/nc_SNVs/nc_SNVs_chr11.bed

echo "Finished chr11"
:'
echo "Starting chr12"

python3 /Users/kihoonkang/ncfVEP/process_vcf.py -v /Volumes/Samsung_T5/ncVEP/VCFs/chr12/gnomad.genomes.v4.1.sites.chr12.vcf.bgz \
    -e /Volumes/Samsung_T5/ncVEP/exon_files/gencode_exons.bed \
    -o /Volumes/Samsung_T5/ncVEP/nc_SNVs/nc_SNVs_chr12.bed

echo "Finished chr12"

echo "Starting chr13"

python3 /Users/kihoonkang/ncfVEP/process_vcf.py -v /Volumes/Samsung_T5/ncVEP/VCFs/chr13/gnomad.genomes.v4.1.sites.chr13.vcf.bgz \
    -e /Volumes/Samsung_T5/ncVEP/exon_files/gencode_exons.bed \
    -o /Volumes/Samsung_T5/ncVEP/nc_SNVs/nc_SNVs_chr13.bed

echo "Finished chr13"

echo "Starting chr14"

python3 /Users/kihoonkang/ncfVEP/process_vcf.py -v /Volumes/Samsung_T5/ncVEP/VCFs/chr14/gnomad.genomes.v4.1.sites.chr14.vcf.bgz \
    -e /Volumes/Samsung_T5/ncVEP/exon_files/gencode_exons.bed \
    -o /Volumes/Samsung_T5/ncVEP/nc_SNVs/nc_SNVs_chr14.bed

echo "Finished chr14"

echo "Starting chr15"

python3 /Users/kihoonkang/ncfVEP/process_vcf.py -v /Volumes/Samsung_T5/ncVEP/VCFs/chr15/gnomad.genomes.v4.1.sites.chr15.vcf.bgz \
    -e /Volumes/Samsung_T5/ncVEP/exon_files/gencode_exons.bed \
    -o /Volumes/Samsung_T5/ncVEP/nc_SNVs/nc_SNVs_chr15.bed

echo "Finished chr15"

echo "Starting chr16"

python3 /Users/kihoonkang/ncfVEP/process_vcf.py -v /Volumes/Samsung_T5/ncVEP/VCFs/chr16/gnomad.genomes.v4.1.sites.chr16.vcf.bgz \
    -e /Volumes/Samsung_T5/ncVEP/exon_files/gencode_exons.bed \
    -o /Volumes/Samsung_T5/ncVEP/nc_SNVs/nc_SNVs_chr16.bed

echo "Finished chr16"

echo "Starting chr17"

python3 /Users/kihoonkang/ncfVEP/process_vcf.py -v /Volumes/Samsung_T5/ncVEP/VCFs/chr17/gnomad.genomes.v4.1.sites.chr17.vcf.bgz \
    -e /Volumes/Samsung_T5/ncVEP/exon_files/gencode_exons.bed \
    -o /Volumes/Samsung_T5/ncVEP/nc_SNVs/nc_SNVs_chr17.bed

echo "Finished chr17"

echo "Starting chr18"

python3 /Users/kihoonkang/ncfVEP/process_vcf.py -v /Volumes/Samsung_T5/ncVEP/VCFs/chr18/gnomad.genomes.v4.1.sites.chr18.vcf.bgz \
    -e /Volumes/Samsung_T5/ncVEP/exon_files/gencode_exons.bed \
    -o /Volumes/Samsung_T5/ncVEP/nc_SNVs/nc_SNVs_chr18.bed

echo "Finished chr18"

echo "Starting chr19"

python3 /Users/kihoonkang/ncfVEP/process_vcf.py -v /Volumes/Samsung_T5/ncVEP/VCFs/chr19/gnomad.genomes.v4.1.sites.chr19.vcf.bgz \
    -e /Volumes/Samsung_T5/ncVEP/exon_files/gencode_exons.bed \
    -o /Volumes/Samsung_T5/ncVEP/nc_SNVs/nc_SNVs_chr19.bed

echo "Finished chr19"

echo "Starting chr20"

python3 /Users/kihoonkang/ncfVEP/process_vcf.py -v /Volumes/Samsung_T5/ncVEP/VCFs/chr20/gnomad.genomes.v4.1.sites.chr20.vcf.bgz \
    -e /Volumes/Samsung_T5/ncVEP/exon_files/gencode_exons.bed \
    -o /Volumes/Samsung_T5/ncVEP/nc_SNVs/nc_SNVs_chr20.bed

echo "Finished chr20"

echo "Starting chr21"

python3 /Users/kihoonkang/ncfVEP/process_vcf.py -v /Volumes/Samsung_T5/ncVEP/VCFs/chr21/gnomad.genomes.v4.1.sites.chr21.vcf.bgz \
    -e /Volumes/Samsung_T5/ncVEP/exon_files/gencode_exons.bed \
    -o /Volumes/Samsung_T5/ncVEP/nc_SNVs/nc_SNVs_chr21.bed

echo "Finished chr21"

echo "Starting chr22"

python3 /Users/kihoonkang/ncfVEP/process_vcf.py -v /Volumes/Samsung_T5/ncVEP/VCFs/chr22/gnomad.genomes.v4.1.sites.chr22.vcf.bgz \
    -e /Volumes/Samsung_T5/ncVEP/exon_files/gencode_exons.bed \
    -o /Volumes/Samsung_T5/ncVEP/nc_SNVs/nc_SNVs_chr22.bed

echo "Finished chr22"
'