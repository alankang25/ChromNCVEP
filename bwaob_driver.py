import pandas as pd
import os
import argparse

def increase_bed_region(bedfile):
    df = pd.read_csv(bedfile, sep='\t', header=None)
    df[1] = df[1] - 1
    df[2] = df[2] + 1
    df.to_csv(bedfile.split('.')[0] + '_increased.bed', sep='\t', header=False, index=False)

def bwaob_driver(bw_dir, bedfile, output_dir):
    if not os.path.exists(output_dir):
        os.makedirs(output_dir)

    for file in os.listdir(bw_dir):
        if file.endswith('.bw') or file.endswith('.bigWig') or file.endswith('.bigwig'):
            os.system('bigWigAverageOverBed ' + bw_dir +'/'+ file + ' ' + bedfile + ' ' + output_dir +'/'+ file.split('.')[0] + '.tab')
        else:
            print('Skipping ' + file + ' make sure you are using .bw .bigWig or .bigwig as input')


def main():
    parser = argparse.ArgumentParser(description='Driver for bigWigAverageOverBed')
    parser.add_argument('-b', '--bedfile', help='Bed file with the data', required=True)    
    parser.add_argument('-d', '--bwdir', help='directory with bigWig files', required=True)
    parser.add_argument('-o', help='Output directory', required=True)

    args = parser.parse_args()

    increase_bed_region(args.bedfile)
    bwaob_driver(args.bwdir, args.bedfile, args.o)

if __name__ == '__main__':
    main()