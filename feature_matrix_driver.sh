#!/bin/bash

# This script is a driver script to create feature matrices for all chromosomes


echo "calculating signal for SNVs in pathogenic"

python bwaob_driver.py -b /Volumes/Samsung_T5/ncVEP/VCFs/annotated/pathogenic_sorted.bed -d /Volumes/Samsung_T5/ncVEP/BigWigs -o /Volumes/Samsung_T5/ncVEP/nc_SNVs/pathogenic_tabs

echo "Starting pathogenic"

python add_features.py -b /Volumes/Samsung_T5/ncVEP/VCFs/annotated/pathogenic_sorted_increased.bed -t /Volumes/Samsung_T5/ncVEP/nc_SNVs/pathogenic_tabs \
 --TSS /Volumes/Samsung_T5/ncVEP/gene_TSS_sorted.bed -g /Volumes/Samsung_T5/ncVEP/hg38.fa -c /Volumes/Samsung_T5/ncVEP/hg38.phastCons100way.bw \
 -o /Volumes/Samsung_T5/feature_matrix/pathogenic.csv

echo "Finished pathogenic"

echo "calculating signal for SNVs in benign"

python bwaob_driver.py -b /Volumes/Samsung_T5/ncVEP/VCFs/annotated/benign_sorted.bed -d /Volumes/Samsung_T5/ncVEP/BigWigs -o /Volumes/Samsung_T5/ncVEP/nc_SNVs/benign_tabs

echo "Starting benign"

python add_features.py -b /Volumes/Samsung_T5/ncVEP/VCFs/annotated/benign_sorted_increased.bed -t /Volumes/Samsung_T5/ncVEP/nc_SNVs/benign_tabs \
 --TSS /Volumes/Samsung_T5/ncVEP/gene_TSS_sorted.bed -g /Volumes/Samsung_T5/ncVEP/hg38.fa -c /Volumes/Samsung_T5/ncVEP/hg38.phastCons100way.bw \
 -o /Volumes/Samsung_T5/feature_matrix/benign.csv

echo "Finished benign"
:'

echo "calculating signal for SNVs in chr_21_synthetic"

python bwaob_driver.py -b /Users/kihoonkang/ncfVEP/chr_21_synthetic.bed -d /Volumes/Samsung_T5/ncVEP/BigWigs -o /Users/kihoonkang/ncfVEP/chr_21_synthetic_tabs

#sort chr_21_synthetic_increased.bed
sort -k1,1 -k2,2n /Users/kihoonkang/ncfVEP/chr_21_synthetic_increased.bed > /Users/kihoonkang/ncfVEP/chr_21_synthetic_increased_sorted.bed
echo "Starting chr_21_synthetic"

python add_features.py -b /Users/kihoonkang/ncfVEP/chr_21_synthetic_increased_sorted.bed -t /Users/kihoonkang/ncfVEP/chr_21_synthetic_tabs \
 --TSS /Volumes/Samsung_T5/ncVEP/gene_TSS_sorted.bed -g /Volumes/Samsung_T5/ncVEP/hg38.fa -c /Volumes/Samsung_T5/ncVEP/hg38.phastCons100way.bw \
 -o /Users/kihoonkang/ncfVEP/chr_21_synthetic.csv

echo "Finished chr_21_synthetic"


echo "calculating signal for SNVs in chr21_synthetic_2"

python bwaob_driver.py -b /Users/kihoonkang/ncfVEP/chr21_synthetic_2.bed -d /Volumes/Samsung_T5/ncVEP/BigWigs -o /Users/kihoonkang/ncfVEP/chr_21_synthetic_2_tabs

sort -k1,1 -k2,2n /Users/kihoonkang/ncfVEP/chr21_synthetic_2_increased.bed > /Users/kihoonkang/ncfVEP/chr21_synthetic_2_increased_sorted.bed
echo "Starting chr21_synthetic_2"

python add_features.py -b /Users/kihoonkang/ncfVEP/chr21_synthetic_2_increased_sorted.bed -t /Users/kihoonkang/ncfVEP/chr_21_synthetic_2_tabs \
 --TSS /Volumes/Samsung_T5/ncVEP/gene_TSS_sorted.bed -g /Volumes/Samsung_T5/ncVEP/hg38.fa -c /Volumes/Samsung_T5/ncVEP/hg38.phastCons100way.bw \
 -o /Users/kihoonkang/ncfVEP/chr21_synthetic_2.csv

echo "Finished chr21_synthetic_2"



echo "calculating signal for SNVs in chr21"

python bwaob_driver.py -b /Volumes/Samsung_T5/ncVEP/nc_SNVs/nc_SNVs_chr21.bed -d /Volumes/Samsung_T5/ncVEP/BigWigs -o /Volumes/Samsung_T5/ncVEP/nc_SNVs/chr_21_tabs


echo "Starting chr21"

python add_features.py -b /Volumes/Samsung_T5/ncVEP/nc_SNVs/nc_SNVs_chr21_increased.bed -t /Volumes/Samsung_T5/ncVEP/nc_SNVs/chr_21_tabs \
 --TSS /Volumes/Samsung_T5/ncVEP/gene_TSS_sorted.bed -g /Volumes/Samsung_T5/ncVEP/hg38.fa -c /Volumes/Samsung_T5/ncVEP/hg38.phastCons100way.bw \
 -o /Volumes/Samsung_T5/feature_matrix/chr_21.csv

echo "Finished chr21"


echo "calculating signal for SNVs in chr20"

python bwaob_driver.py -b /Volumes/Samsung_T5/ncVEP/nc_SNVs/nc_SNVs_chr20.bed -d /Volumes/Samsung_T5/ncVEP/BigWigs -o /Volumes/Samsung_T5/ncVEP/nc_SNVs/chr_20_tabs

echo "Starting chr20"

python add_features.py -b /Volumes/Samsung_T5/ncVEP/nc_SNVs/nc_SNVs_chr20.bed -t /Volumes/Samsung_T5/ncVEP/nc_SNVs/chr_20_tabs \
 --TSS /Volumes/Samsung_T5/ncVEP/gene_TSS_sorted.bed -g /Volumes/Samsung_T5/ncVEP/hg38.fa -c /Volumes/Samsung_T5/ncVEP/hg38.phastCons100way.bw \
 -o /Volumes/Samsung_T5/feature_matrix/chr_20.csv

echo "Finished chr20"

echo "calculating signal for SNVs in chr19"

python bwaob_driver.py -b /Volumes/Samsung_T5/ncVEP/nc_SNVs/nc_SNVs_chr19.bed -d /Volumes/Samsung_T5/ncVEP/BigWigs -o /Volumes/Samsung_T5/ncVEP/nc_SNVs/chr_19_tabs

echo "Starting chr19"

python add_features.py -b /Volumes/Samsung_T5/ncVEP/nc_SNVs/nc_SNVs_chr19.bed -t /Volumes/Samsung_T5/ncVEP/nc_SNVs/chr_19_tabs \
 --TSS /Volumes/Samsung_T5/ncVEP/gene_TSS_sorted.bed -g /Volumes/Samsung_T5/ncVEP/hg38.fa -c /Volumes/Samsung_T5/ncVEP/hg38.phastCons100way.bw \
 -o /Volumes/Samsung_T5/feature_matrix/chr_19.csv

echo "Finished chr19"

echo "calculating signal for SNVs in chr18"

python bwaob_driver.py -b /Volumes/Samsung_T5/ncVEP/nc_SNVs/nc_SNVs_chr18.bed -d /Volumes/Samsung_T5/ncVEP/BigWigs -o /Volumes/Samsung_T5/ncVEP/nc_SNVs/chr_18_tabs

echo "Starting chr18"

python add_features.py -b /Volumes/Samsung_T5/ncVEP/nc_SNVs/nc_SNVs_chr18.bed -t /Volumes/Samsung_T5/ncVEP/nc_SNVs/chr_18_tabs \
 --TSS /Volumes/Samsung_T5/ncVEP/gene_TSS_sorted.bed -g /Volumes/Samsung_T5/ncVEP/hg38.fa -c /Volumes/Samsung_T5/ncVEP/hg38.phastCons100way.bw \
 -o /Volumes/Samsung_T5/feature_matrix/chr_18.csv

echo "Finished chr18"

echo "calculating signal for SNVs in chr17"

python bwaob_driver.py -b /Volumes/Samsung_T5/ncVEP/nc_SNVs/nc_SNVs_chr17.bed -d /Volumes/Samsung_T5/ncVEP/BigWigs -o /Volumes/Samsung_T5/ncVEP/nc_SNVs/chr_17_tabs

echo "Starting chr17"

python add_features.py -b /Volumes/Samsung_T5/ncVEP/nc_SNVs/nc_SNVs_chr17.bed -t /Volumes/Samsung_T5/ncVEP/nc_SNVs/chr_17_tabs \
 --TSS /Volumes/Samsung_T5/ncVEP/gene_TSS_sorted.bed -g /Volumes/Samsung_T5/ncVEP/hg38.fa -c /Volumes/Samsung_T5/ncVEP/hg38.phastCons100way.bw \
 -o /Volumes/Samsung_T5/feature_matrix/chr_17.csv

echo "Finished chr17"

echo "calculating signal for SNVs in chr16"

python bwaob_driver.py -b /Volumes/Samsung_T5/ncVEP/nc_SNVs/nc_SNVs_chr16.bed -d /Volumes/Samsung_T5/ncVEP/BigWigs -o /Volumes/Samsung_T5/ncVEP/nc_SNVs/chr_16_tabs

echo "Starting chr16"

python add_features.py -b /Volumes/Samsung_T5/ncVEP/nc_SNVs/nc_SNVs_chr16.bed -t /Volumes/Samsung_T5/ncVEP/nc_SNVs/chr_16_tabs \
 --TSS /Volumes/Samsung_T5/ncVEP/gene_TSS_sorted.bed -g /Volumes/Samsung_T5/ncVEP/hg38.fa -c /Volumes/Samsung_T5/ncVEP/hg38.phastCons100way.bw \
 -o /Volumes/Samsung_T5/feature_matrix/chr_16.csv

echo "Finished chr16"

echo "calculating signal for SNVs in chr15"

python bwaob_driver.py -b /Volumes/Samsung_T5/ncVEP/nc_SNVs/nc_SNVs_chr15.bed -d /Volumes/Samsung_T5/ncVEP/BigWigs -o /Volumes/Samsung_T5/ncVEP/nc_SNVs/chr_15_tabs

echo "Starting chr15"

python add_features.py -b /Volumes/Samsung_T5/ncVEP/nc_SNVs/nc_SNVs_chr15.bed -t /Volumes/Samsung_T5/ncVEP/nc_SNVs/chr_15_tabs \
 --TSS /Volumes/Samsung_T5/ncVEP/gene_TSS_sorted.bed -g /Volumes/Samsung_T5/ncVEP/hg38.fa -c /Volumes/Samsung_T5/ncVEP/hg38.phastCons100way.bw \
 -o /Volumes/Samsung_T5/feature_matrix/chr_15.csv

echo "Finished chr15"

echo "calculating signal for SNVs in chr14"

python bwaob_driver.py -b /Volumes/Samsung_T5/ncVEP/nc_SNVs/nc_SNVs_chr14.bed -d /Volumes/Samsung_T5/ncVEP/BigWigs -o /Volumes/Samsung_T5/ncVEP/nc_SNVs/chr_14_tabs

echo "Starting chr14"

python add_features.py -b /Volumes/Samsung_T5/ncVEP/nc_SNVs/nc_SNVs_chr14.bed -t /Volumes/Samsung_T5/ncVEP/nc_SNVs/chr_14_tabs \
 --TSS /Volumes/Samsung_T5/ncVEP/gene_TSS_sorted.bed -g /Volumes/Samsung_T5/ncVEP/hg38.fa -c /Volumes/Samsung_T5/ncVEP/hg38.phastCons100way.bw \
 -o /Volumes/Samsung_T5/feature_matrix/chr_14.csv

echo "Finished chr14"

echo "calculating signal for SNVs in chr13"

python bwaob_driver.py -b /Volumes/Samsung_T5/ncVEP/nc_SNVs/nc_SNVs_chr13.bed -d /Volumes/Samsung_T5/ncVEP/BigWigs -o /Volumes/Samsung_T5/ncVEP/nc_SNVs/chr_13_tabs

echo "Starting chr13"

python add_features.py -b /Volumes/Samsung_T5/ncVEP/nc_SNVs/nc_SNVs_chr13.bed -t /Volumes/Samsung_T5/ncVEP/nc_SNVs/chr_13_tabs \
 --TSS /Volumes/Samsung_T5/ncVEP/gene_TSS_sorted.bed -g /Volumes/Samsung_T5/ncVEP/hg38.fa -c /Volumes/Samsung_T5/ncVEP/hg38.phastCons100way.bw \
 -o /Volumes/Samsung_T5/feature_matrix/chr_13.csv

echo "Finished chr13"

echo "calculating signal for SNVs in chr12"

python bwaob_driver.py -b /Volumes/Samsung_T5/ncVEP/nc_SNVs/nc_SNVs_chr12.bed -d /Volumes/Samsung_T5/ncVEP/BigWigs -o /Volumes/Samsung_T5/ncVEP/nc_SNVs/chr_12_tabs

echo "Starting chr12"

python add_features.py -b /Volumes/Samsung_T5/ncVEP/nc_SNVs/nc_SNVs_chr12.bed -t /Volumes/Samsung_T5/ncVEP/nc_SNVs/chr_12_tabs \
 --TSS /Volumes/Samsung_T5/ncVEP/gene_TSS_sorted.bed -g /Volumes/Samsung_T5/ncVEP/hg38.fa -c /Volumes/Samsung_T5/ncVEP/hg38.phastCons100way.bw \
 -o /Volumes/Samsung_T5/feature_matrix/chr_12.csv

echo "Finished chr12"

echo "calculating signal for SNVs in chr11"

python bwaob_driver.py -b /Volumes/Samsung_T5/ncVEP/nc_SNVs/nc_SNVs_chr11.bed -d /Volumes/Samsung_T5/ncVEP/BigWigs -o /Volumes/Samsung_T5/ncVEP/nc_SNVs/chr_11_tabs

echo "Starting chr11"

python add_features.py -b /Volumes/Samsung_T5/ncVEP/nc_SNVs/nc_SNVs_chr11.bed -t /Volumes/Samsung_T5/ncVEP/nc_SNVs/chr_11_tabs \
 --TSS /Volumes/Samsung_T5/ncVEP/gene_TSS_sorted.bed -g /Volumes/Samsung_T5/ncVEP/hg38.fa -c /Volumes/Samsung_T5/ncVEP/hg38.phastCons100way.bw \
 -o /Volumes/Samsung_T5/feature_matrix/chr_11.csv

echo "Finished chr11"

echo "calculating signal for SNVs in chr10"

python bwaob_driver.py -b /Volumes/Samsung_T5/ncVEP/nc_SNVs/nc_SNVs_chr10.bed -d /Volumes/Samsung_T5/ncVEP/BigWigs -o /Volumes/Samsung_T5/ncVEP/nc_SNVs/chr_10_tabs

echo "Starting chr10"

python add_features.py -b /Volumes/Samsung_T5/ncVEP/nc_SNVs/nc_SNVs_chr10.bed -t /Volumes/Samsung_T5/ncVEP/nc_SNVs/chr_10_tabs \
 --TSS /Volumes/Samsung_T5/ncVEP/gene_TSS_sorted.bed -g /Volumes/Samsung_T5/ncVEP/hg38.fa -c /Volumes/Samsung_T5/ncVEP/hg38.phastCons100way.bw \
 -o /Volumes/Samsung_T5/feature_matrix/chr_10.csv

echo "Finished chr10"

echo "calculating signal for SNVs in chr9"

python bwaob_driver.py -b /Volumes/Samsung_T5/ncVEP/nc_SNVs/nc_SNVs_chr9.bed -d /Volumes/Samsung_T5/ncVEP/BigWigs -o /Volumes/Samsung_T5/ncVEP/nc_SNVs/chr_9_tabs

echo "Starting chr9"

python add_features.py -b /Volumes/Samsung_T5/ncVEP/nc_SNVs/nc_SNVs_chr9.bed -t /Volumes/Samsung_T5/ncVEP/nc_SNVs/chr_9_tabs \
 --TSS /Volumes/Samsung_T5/ncVEP/gene_TSS_sorted.bed -g /Volumes/Samsung_T5/ncVEP/hg38.fa -c /Volumes/Samsung_T5/ncVEP/hg38.phastCons100way.bw \
 -o /Volumes/Samsung_T5/feature_matrix/chr_9.csv

echo "Finished chr9"

echo "calculating signal for SNVs in chr8"

python bwaob_driver.py -b /Volumes/Samsung_T5/ncVEP/nc_SNVs/nc_SNVs_chr8.bed -d /Volumes/Samsung_T5/ncVEP/BigWigs -o /Volumes/Samsung_T5/ncVEP/nc_SNVs/chr_8_tabs

echo "Starting chr8"

python add_features.py -b /Volumes/Samsung_T5/ncVEP/nc_SNVs/nc_SNVs_chr8.bed -t /Volumes/Samsung_T5/ncVEP/nc_SNVs/chr_8_tabs \
 --TSS /Volumes/Samsung_T5/ncVEP/gene_TSS_sorted.bed -g /Volumes/Samsung_T5/ncVEP/hg38.fa -c /Volumes/Samsung_T5/ncVEP/hg38.phastCons100way.bw \
 -o /Volumes/Samsung_T5/feature_matrix/chr_8.csv

echo "Finished chr8"

echo "calculating signal for SNVs in chr7"

python bwaob_driver.py -b /Volumes/Samsung_T5/ncVEP/nc_SNVs/nc_SNVs_chr7.bed -d /Volumes/Samsung_T5/ncVEP/BigWigs -o /Volumes/Samsung_T5/ncVEP/nc_SNVs/chr_7_tabs

echo "Starting chr7"

python add_features.py -b /Volumes/Samsung_T5/ncVEP/nc_SNVs/nc_SNVs_chr7.bed -t /Volumes/Samsung_T5/ncVEP/nc_SNVs/chr_7_tabs \
 --TSS /Volumes/Samsung_T5/ncVEP/gene_TSS_sorted.bed -g /Volumes/Samsung_T5/ncVEP/hg38.fa -c /Volumes/Samsung_T5/ncVEP/hg38.phastCons100way.bw \
 -o /Volumes/Samsung_T5/feature_matrix/chr_7.csv

echo "Finished chr7"

echo "calculating signal for SNVs in chr6"

python bwaob_driver.py -b /Volumes/Samsung_T5/ncVEP/nc_SNVs/nc_SNVs_chr6.bed -d /Volumes/Samsung_T5/ncVEP/BigWigs -o /Volumes/Samsung_T5/ncVEP/nc_SNVs/chr_6_tabs

echo "Starting chr6"

python add_features.py -b /Volumes/Samsung_T5/ncVEP/nc_SNVs/nc_SNVs_chr6.bed -t /Volumes/Samsung_T5/ncVEP/nc_SNVs/chr_6_tabs \
 --TSS /Volumes/Samsung_T5/ncVEP/gene_TSS_sorted.bed -g /Volumes/Samsung_T5/ncVEP/hg38.fa -c /Volumes/Samsung_T5/ncVEP/hg38.phastCons100way.bw \
 -o /Volumes/Samsung_T5/feature_matrix/chr_6.csv

echo "Finished chr6"

echo "calculating signal for SNVs in chr5"

python bwaob_driver.py -b /Volumes/Samsung_T5/ncVEP/nc_SNVs/nc_SNVs_chr5.bed -d /Volumes/Samsung_T5/ncVEP/BigWigs -o /Volumes/Samsung_T5/ncVEP/nc_SNVs/chr_5_tabs

echo "Starting chr5"

python add_features.py -b /Volumes/Samsung_T5/ncVEP/nc_SNVs/nc_SNVs_chr5.bed -t /Volumes/Samsung_T5/ncVEP/nc_SNVs/chr_5_tabs \
 --TSS /Volumes/Samsung_T5/ncVEP/gene_TSS_sorted.bed -g /Volumes/Samsung_T5/ncVEP/hg38.fa -c /Volumes/Samsung_T5/ncVEP/hg38.phastCons100way.bw \
 -o /Volumes/Samsung_T5/feature_matrix/chr_5.csv

echo "Finished chr5"'