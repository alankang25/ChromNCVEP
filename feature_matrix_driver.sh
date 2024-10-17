#!/bin/bash

# This script is a driver script to create feature matrices for all chromosomes

echo "calculating signal for SNVs in chr21"

python bwaob_driver.py -b /Volumes/Samsung_T5/ncVEP/nc_SNVs/nc_SNVs_chr21.bed -d /Volumes/Samsung_T5/ncVEP/BigWigs -o /Volumes/Samsung_T5/ncVEP/nc_SNVs/chr_21_tabs

echo "Starting chr21"

python add_features.py -b /Volumes/Samsung_T5/ncVEP/nc_SNVs/nc_SNVs_chr21_increased.bed -t /Volumes/Samsung_T5/ncVEP/nc_SNVs/chr_21_tabs \
 --TSS /Volumes/Samsung_T5/ncVEP/gene_TSS_sorted.bed -g /Volumes/Samsung_T5/ncVEP/hg38.fa -c /Volumes/Samsung_T5/ncVEP/hg38.phastCons100way.bw \
 -o /Volumes/Samsung_T5/feature_matrix/chr_21.csv

echo "Finished chr21"