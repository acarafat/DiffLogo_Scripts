# DiffLogo Utilities

# This script will convert fasta file to flat sequence format: one sequence per line

from Bio import SeqIO

infile = open('../Main Analysis/Dataset/Sequences/Edited Set/Type O edited.fas')
outfile = open('Type O.txt', 'w')

seqs = []

for records in SeqIO.parse(infile, 'fasta'):
    seqs.append(str(records.seq))
    
for i in seqs:
    outfile.write(i+'\n')
       
outfile.close()
    
