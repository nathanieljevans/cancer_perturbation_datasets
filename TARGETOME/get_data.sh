#!/bin/sh

# Download datasets and document sources 
# email: evansna@ohsu.edu 
# --------------------------------------------------------------------
# Drug targets data - Cancer Targetome
# paper: https://pubmed.ncbi.nlm.nih.gov/28964549/
# github: https://github.com/ablucher/The-Cancer-Targetome
# file name: Targetome_FullEvidence_070617.txt
# size: 1356 kb
targets=https://raw.githubusercontent.com/ablucher/The-Cancer-Targetome/master/results_070617/Targetome_FullEvidence_070617.txt
#https://github.com/ablucher/The-Cancer-Targetome/blob/master/results_070617/Targetome_FullEvidence_070617.txt
# --------------------------------------------------------------------

# check that dir/file exists and then make/download

[ ! -d "./data/" ] && mkdir ./data/
[ ! -d "./data/raw/" ] && mkdir ./data/raw/

[ ! -f "./data/raw/Targetome_FullEvidence_070617.txt" ] && wget $targets -P ./data/raw/ --no-hsts --max-redirect=10 --referer='https://github.com/ablucher/The-Cancer-Targetome/tree/master/results_070617'

echo 'downloads complete'

## checksums 
echo 'verifying checksums...'
md5sum ./data/raw/Targetome_FullEvidence_070617.txt  | awk '$1!="74936108f59f98973f3ee3dd2f3a619a"{print"Targetome_FullEvidence_070617.txt - checksum failed"}'

echo 'complete.'
