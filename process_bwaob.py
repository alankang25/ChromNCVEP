import pandas as pd
import argparse
import os

def add_bp_to_bed(bed_file):
    df = pd.read_csv(bed_file, sep='\t', header=None)
    df.columns = ['chrom', 'start', 'end', 'annot']
    df['start'] = df['start'] - 1
    df['end'] = df['end'] + 1
    df.to_csv(bed_file, sep='\t', header=False, index=False)

def run_bigWigAverageOverBed(bed_file, bigwig_file, output_file):
    os.system(f"bigWigAverageOverBed {bigwig_file} {bed_file} {output_file}")

def main():
    parser = argparse.ArgumentParser()
    parser.add_argument('--bed', '-b',type=str, help='Path to BED file')
    parser.add_argument('--bigwig', '-w', type=str, help='Path to bigWig file')
    parser.add_argument('--output', '-o',type=str, help='Path to output file')
    args = parser.parse_args()

    bed = args.bed
    output = args.output
    bigwig = args.bigwig

    add_bp_to_bed(bed)
    run_bigWigAverageOverBed(bed, bigwig, output)

if __name__ == "__main__":
    main()