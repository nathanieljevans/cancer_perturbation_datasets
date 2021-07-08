#!/bin/sh

# Download datasets and document sources 
# author: nathaniel evans
# email: evansna@ohsu.edu 
# --------------------------------------------------------------------

# --------------------------------------------------------------------
# Reactome Ontology 
# Paper: 
# info: https://reactome.org/download-data
# file name: 
# file size:
reactome_rel=https://reactome.org/download/current/ReactomePathwaysRelation.txt
reactome_path=https://reactome.org/download/current/ReactomePathways.txt
reactome_comp=https://reactome.org/download/current/Complex_2_Pathway_human.txt
reactome_prot=https://reactome.org/download/current/ComplexParticipantsPubMedIdentifiers_human.txt
reactome_genesets=https://reactome.org/download/current/ReactomePathways.gmt.zip
# --------------------------------------------------------------------
# Graph network;Base interactome - Reactome Functional Interactions 
# paper: https://genomebiology.biomedcentral.com/articles/10.1186/gb-2010-11-5-r53
# file name: FIsInGene_020720_with_annotations.txt
# size: 9844 kb
FInetwork=https://reactome.org/download/tools/ReatomeFIs/FIsInGene_020720_with_annotations.txt.zip

# check that dir/file exists and then make/download

[ ! -d "./data/" ] && mkdir ./data/
[ ! -d "./data/raw/" ] && mkdir ./data/raw/

[ ! -f "./data/raw/ReactomePathways.gmt" ] && wget $reactome_genesets -O ./data/raw/ReactomePathways.gmt.zip --no-hsts --max-redirect=2 --trust-server-names
[ -f "./data/raw/ReactomePathways.gmt.zip" ] && unzip ./data/raw/ReactomePathways.gmt.zip -d ./data/raw/.
[ -f "./data/raw/ReactomePathways.gmt.zip" ] && rm ./data/raw/ReactomePathways.gmt.zip

[ ! -f "./data/raw/ReactomePathwaysRelation.txt" ] && wget $reactome_rel -O ./data/raw/ReactomePathwaysRelation.txt --no-hsts --max-redirect=2 --trust-server-names
[ ! -f "./data/raw/ReactomePathways.txt" ] && wget $reactome_path -O ./data/raw/ReactomePathways.txt --no-hsts --max-redirect=2 --trust-server-names
[ ! -f "./data/raw/Complex_2_Pathway_human.txt" ] && wget $reactome_comp -O ./data/raw/Complex_2_Pathway_human.txt --no-hsts --max-redirect=2 --trust-server-names
[ ! -f "./data/raw/ComplexParticipantsPubMedIdentifiers_human.txt" ] && wget $reactome_prot -O ./data/raw/ComplexParticipantsPubMedIdentifiers_human.txt --no-hsts --max-redirect=2 --trust-server-names

[ ! -f "./data/raw/FIsInGene_020720_with_annotations.txt" ] && wget $FInetwork -P ./data/raw/ --no-hsts --max-redirect=2 --trust-server-names
[ -f "./data/raw/FIsInGene_020720_with_annotations.txt.zip" ] && unzip ./data/raw/FIsInGene_020720_with_annotations.txt.zip -d ./data/raw/
[ -f "./data/raw/FIsInGene_020720_with_annotations.txt.zip" ] && rm ./data/raw/FIsInGene_020720_with_annotations.txt.zip

echo 'downloads complete'

## checksums 
#echo 'verifying checksums...'
#md5sum ./data/CCLE_expression.csv  | awk '$1!="c6006df041acf45e3da1dc36fb267f7b"{print"CCLE_expression.csv - checksum failed"}'

echo 'Reactome ontologies checksums not evaluated (not yet implemented)'
echo 'complete.'
