#!/bin/sh

# Download datasets and document sources 
# author: nathaniel evans
# email: evansna@ohsu.edu 
# --------------------------------------------------------------------

# --------------------------------------------------------------------
# CHEMANTRA; drug-drug structural similarity graph 
# date: 5/27/2021 (time of first download and links)
# Paper: https://www.nature.com/articles/s41540-017-0022-3#MOESM13
# info: https://chemantra.tigem.it/index.php?variable=&soglia=0.20
# file name: chemantra_network.rar
# file size:
chemantra_network=http://chemantra.tigem.it/data/chemantra_network.rar

# check that dir/file exists and then make/download
[ ! -d "./data/" ] && mkdir ./data/
[ ! -d "./data/raw" ] && mkdir ./data/raw/

[ ! -f "./data/raw/chemantra_network.rar" ] && wget $chemantra_network -O ./data/raw/chemantra_network.rar

cd data/raw/

unar chemantra_network.rar 

mv ./chemantra_network/* .

rm -r chemantra_network

echo 'downloads complete'