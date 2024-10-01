import argparse
import pandas as pd
import numpy as np
from cyvcf2 import VCF
import os

def generate_tabix(vcf_file):
    os.system(f"tabix -p vcf {vcf_file}")
    vcf = VCF(vcf_file)
    return vcf

def filter_SNV(vcf):
    chrom = []
    pos = []
    ID = []
    ref = []
    alt = []
    for variant in vcf:
        if variant.INFO["variant_type"] == "snv":
            chrom.append(variant.CHROM)
            pos.append(variant.POS)
            ID.append(variant.ID)
            ref.append(variant.REF)
            alt.append(variant.ALT)

    # create a dataframe from the lists
    df = pd.DataFrame({'chrom': chrom, 'pos': pos, 'ID': ID, 'ref': ref, 'alt': alt})

    #convert alt to string
    df['alt'] = df['alt'].apply(lambda x: str(x[0]))

    #convert pos to string
    df['pos'] = df['pos'].apply(lambda x: str(x))

    #if ID is missing, replace with '.'
    df['ID'] = df['ID'].apply(lambda x: '.' if x is None else x)

    return df

def save_bed(df, vcf_path):
    df['annot'] = df['chrom'] + '_' + df['pos'] + ";" +df['ID'] + '_' + df['ref'] + ':' + df['alt']
    bed_out = df[['chrom', 'pos', 'pos', 'annot']]
    file_save = vcf_path + ".bed"
    bed_out.to_csv(file_save, sep='\t', header=False, index=False)

    return file_save

def run_bedtools(snv_bed, exon_file, output_file):
    os.system(f"bedtools intersect -a {snv_bed} -b {exon_file} -v > {output_file}")

def main():
    parser = argparse.ArgumentParser(description='Process VCF file')
    parser.add_argument('--vcf', '-v',type=str, help='Path to VCF file')
    parser.add_argument('--exons', '-e', type=str, help='Path to BED file of exons')
    parser.add_argument('--output', '-o',type=str, help='Path to output BED for ncSNVs file')
    args = parser.parse_args()

    vcf = args.vcf
    output = args.output
    exons = args.exons

    # Generate tabix index
    print("Generating tabix index...")
    vcf = generate_tabix(vcf)

    # Filter SNVs
    print("Filtering for SNVs...")
    df = filter_SNV(vcf)

    # Save BED file
    print("Saving BED file...")
    bed_file = save_bed(df, args.vcf)

    # Run bedtools
    print("Running bedtools...")
    run_bedtools(bed_file, exons, output)

    print("Done!")

if __name__ == "__main__":
    main()