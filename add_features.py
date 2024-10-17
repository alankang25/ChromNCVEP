import pandas as pd
import os
import argparse

def load_data(bedfile):
    # Load the data
    data = pd.read_csv(bedfile, sep='\t', header=None)
    data.columns = ['chr', 'start', 'end', 'annot']
    return data

def add_substitution(data):
    # One hot encode substitution
    data['Substitution'] = data['annot'].str.split('_').str[2]
    val_counts = data['Substitution'].value_counts()

    data['Substitution'] = pd.Categorical(data['Substitution'])
    dataDummies = pd.get_dummies(data['Substitution'], prefix = 'Substitution')
    data = pd.concat([data, dataDummies], axis=1)
    data.drop(columns='Substitution', inplace=True)

    return data, val_counts

def add_tab_data(data, tab_file):
    tab = pd.read_csv(tab_file, sep='\t', header=None)
    tab = tab[[0, 5]]
    tab_dict = dict(zip(tab[0], tab[5]))
    data[tab_file.split('/')[-1].split('.')[0]] = data['annot'].map(tab_dict)


def calculate_distance_TSS(bedfile, TSS_file):
    os.system('bedtools closest -a ' + bedfile + ' -b ' + TSS_file + ' > ' + bedfile.split('.')[0] + '_TSS.bed')
    return bedfile.split('.')[0] + '_TSS.bed'

def add_TSS_distance(data, TSS_file):
    TSS = pd.read_csv(TSS_file, sep = '\t', header = None)
    #keep columns 3 and 5
    TSS = TSS[[3, 5]]
    #rename columns 'annot' 'closest TSS'
    TSS.columns = ['annot', 'closest_TSS']

    #SNP_pos is the position of the SNP: chr22_10510061;rs2146084712_A:T
    TSS['SNP_pos'] = TSS['annot'].str.split('_').str[1].str.split(';').str[0]

    #calculate the distance to the TSS
    TSS['distance_to_TSS'] = (TSS['closest_TSS'] - TSS['SNP_pos'].astype(int)).abs()
    
    data['distance_to_TSS'] = data['annot'].map(dict(zip(TSS['annot'], TSS['distance_to_TSS'])))

def make_100bp_windows(data):
    hundred_b_bed = data[['chr', 'start', 'end', 'annot']].copy()
    hundred_b_bed['start'] = hundred_b_bed['start'] - 49
    hundred_b_bed['end'] = hundred_b_bed['end'] + 49
    hundred_b_bed.to_csv('flanking_110bp.bed', sep='\t', header=False, index=False)

def calculate_GC_content(bedfile, genome_file):
    os.system('bedtools nuc -fi ' + genome_file + ' -bed ' + bedfile + ' > ' + bedfile.split('.')[0] + '_GC.bed')
    return bedfile.split('.')[0] + '_GC.bed'

def add_GC_content(data, GC_file):
    GC = pd.read_csv(GC_file, sep='\t', header=None)
    GC = GC[[3, 5]]
    GC.columns = ['annot', 'GC_content']
    data['GC_content'] = data['annot'].map(dict(zip(GC['annot'], GC['GC_content'])))

def make_flanking_bed(bedfile):
    flanking = bedfile.copy()
    flanking['start'] = flanking['start'] - 1
    #keep only chr start, end, annot
    flanking = flanking[['chr', 'start', 'end', 'annot']]
    #save flanking bed
    flanking.to_csv('flanking.bed', sep='\t', header=None, index=None)
    return 'flanking.bed'

def get_flanking(bedfile, genome_file):
    os.system('bedtools getfasta -fi ' + genome_file + ' -bed ' + bedfile + ' > ' + bedfile.split('.')[0] + '_flanking.fa')
    return bedfile.split('.')[0] + '_flanking.fa'

def read_fasta(fasta_file):
    with open(fasta_file, 'r') as f:
        lines = f.readlines()
    return lines

def add_flanking_sequence(data, lines):
    regions = []
    seq = []
    for i, line in enumerate(lines):
        if line.startswith('>'):
            regions.append(line)
            seq.append(lines[i+1].strip())

    flanking = pd.DataFrame({'region': regions, 'seq': seq})

    #from >chr22:10510031-10510034\n, get 10510034
    flanking['end_pos'] = flanking['region'].str.split(':').str[1].str.split('-').str[1]

    #make dict with key end_pos and value seq
    flanking_dict = dict(zip(flanking['end_pos'], flanking['seq']))

    #remove \n from the end of the keys in the dict
    flanking_dict = {k.strip(): v for k, v in flanking_dict.items()}

    #make keys integers
    flanking_dict = {int(k): v for k, v in flanking_dict.items()}

    #map the dict to flanking column
    data['flanking'] = data['end'].map(flanking_dict)

    #add +1 and -1 column
    data['+1'] = data['flanking'].str[2]
    data['-1'] = data['flanking'].str[0]

    #drop flanking column
    data.drop(columns='flanking', inplace=True)

    #one hot encode +1 and -1
    data['+1'] = pd.Categorical(data['+1'])
    data['-1'] = pd.Categorical(data['-1'])
    dataDummies = pd.get_dummies(data[['+1', '-1']])
    data = pd.concat([data, dataDummies], axis=1)
    data.drop(columns=['+1', '-1'], inplace=True)

def calculate_conservation(bedfile, bigwig_file):
    os.system('bigWigAverageOverBed ' + bigwig_file + ' ' + bedfile + ' conservation.tab')

def add_conservation(data, conservation_file):
    conservation = pd.read_csv(conservation_file, sep='\t', header=None)
    conservation = conservation[[0, 5]]
    conservation.columns = ['annot', 'conservation']
    data['conservation'] = data['annot'].map(dict(zip(conservation['annot'], conservation['conservation'])))

def main():
    parser = argparse.ArgumentParser(description='Add features to the data')
    parser.add_argument('-b', '--bedfile', help='Bed file with the data', required=True)
    parser.add_argument('-t', '--tabdir', help='directory with tabular bwaob files', required=False)
    parser.add_argument('--TSS', help='File with TSS', required=False)
    parser.add_argument('-g', help='Genome file', required=False)
    parser.add_argument('-c', help='BigWig file with conservation', required=False)
    parser.add_argument('-o', help='Output file', required=False)

    args = parser.parse_args()

    tab_dir = args.tabdir + '/'

    data = load_data(args.bedfile)

    data, val_counts = add_substitution(data)

    print('Adding tab data...')

    for tab_file in os.listdir(args.tabdir):
        add_tab_data(data, os.path.join(tab_dir, tab_file))

    print('Calculating distance to TSS...')

    TSS_file = calculate_distance_TSS(args.bedfile, args.TSS)
    add_TSS_distance(data, TSS_file)

    print('Calculating GC content of 100b window...')

    make_100bp_windows(data)

    GC_file = calculate_GC_content('flanking_110bp.bed', args.g)
    add_GC_content(data, GC_file)

    print('Getting flanking sequence...')

    flanking_bed = make_flanking_bed(data)
    flanking_fasta = get_flanking(flanking_bed, args.g)
    lines = read_fasta(flanking_fasta)
    add_flanking_sequence(data, lines)

    print('Calculating conservation...')

    calculate_conservation(args.bedfile, args.c)
    add_conservation(data, 'conservation.tab')

    data.to_csv(args.o, index=False)

    print('feature matrix for ' + args.bedfile + ' saved to ' + args.o)

    #save value counts
    val_counts.to_csv(args.o.split('.')[0] + '_substitution_value_counts.csv')


if __name__ == '__main__':
    main()