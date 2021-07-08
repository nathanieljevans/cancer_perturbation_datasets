#!/bin/sh

# Download datasets and document sources 
# author: nathaniel evans
# email: evansna@ohsu.edu 
# --------------------------------------------------------------------

# --------------------------------------------------------------------
# LINCS L1000 Phase II - beta 
# date: 5/24/2021 (time of first download and links)
# Paper: 
# info: https://clue.io/releases/data-dashboard
# file name: 
# file size: 111GB
l1000_phaseII_lvl3_controls=https://s3.amazonaws.com/macchiato.clue.io/builds/LINCS2020/level3/level3_beta_ctl_n188708x12328.gctx
l1000_phaseII_lvl3_compounds=https://s3.amazonaws.com/macchiato.clue.io/builds/LINCS2020/level3/level3_beta_trt_cp_n1805898x12328.gctx
l1000_phaseII_lvl3_shRNA=https://s3.amazonaws.com/macchiato.clue.io/builds/LINCS2020/level3/level3_beta_trt_sh_n453175x12328.gctx
l1000_phaseII_lvl3_crispr=https://s3.amazonaws.com/macchiato.clue.io/builds/LINCS2020/level3/level3_beta_trt_xpr_n420583x12328.gctx 
l1000_phaseII_lvl3_overexpr=https://s3.amazonaws.com/macchiato.clue.io/builds/LINCS2020/level3/level3_beta_trt_oe_n131668x12328.gctx

l1000_phaseII_lvl34_meta=https://s3.amazonaws.com/macchiato.clue.io/builds/LINCS2020/instinfo_beta.txt
l1000_phaseII_compoundinfo=https://s3.amazonaws.com/macchiato.clue.io/builds/LINCS2020/compoundinfo_beta.txt
l1000_phaseII_cellineinfo=https://s3.amazonaws.com/macchiato.clue.io/builds/LINCS2020/cellinfo_beta.txt
l1000_phaseII_geneinfo=https://s3.amazonaws.com/macchiato.clue.io/builds/LINCS2020/geneinfo_beta.txt

# check that dir/file exists and then make/download

[ ! -d "./data/" ] && mkdir ./data/
[ ! -d "./data/raw" ] && mkdir ./data/raw/

[ ! -f "./data/raw/compoundinfo_beta.txt" ] && wget $l1000_phaseII_compoundinfo -O ./data/raw/compoundinfo_beta.txt
[ ! -f "./data/raw/cellinfo_beta.txt" ] && wget $l1000_phaseII_cellineinfo -O ./data/raw/cellinfo_beta.txt
[ ! -f "./data/raw/geneinfo_beta.txt" ] && wget $l1000_phaseII_geneinfo -O ./data/raw/geneinfo_beta.txt
[ ! -f "./data/raw/instinfo_beta.txt" ] && wget $l1000_phaseII_lvl34_meta -O ./data/raw/instinfo_beta.txt

[ ! -f "./data/raw/level3_beta_ctl_n188708x12328.gctx" ] && wget $l1000_phaseII_lvl3_controls -O ./data/raw/level3_beta_ctl_n188708x12328.gctx
[ ! -f "./data/raw/level3_beta_trt_cp_n1805898x12328.gctx" ] && wget $l1000_phaseII_lvl3_compounds -O ./data/raw/level3_beta_trt_cp_n1805898x12328.gctx
[ ! -f "./data/raw/level3_beta_trt_sh_n453175x12328.gctx" ] && wget $l1000_phaseII_lvl3_shRNA -O ./data/raw/level3_beta_trt_sh_n453175x12328.gctx
[ ! -f "./data/raw/level3_beta_trt_xpr_n420583x12328.gctx" ] && wget $l1000_phaseII_lvl3_crispr -O ./data/raw/level3_beta_trt_xpr_n420583x12328.gctx

[ ! -f "./data/raw/level3_beta_trt_oe_n131668x12328.gctx" ] && wget $l1000_phaseII_lvl3_overexpr -O ./data/raw/level3_beta_trt_oe_n131668x12328.gctx

echo 'downloads complete'

# beta version (phase II) is continuously being added to... so checksums aren't the best move. 

#echo 'verifying checksums...'
#md5sum ./data/CCLE_expression.csv  | awk '$1!="c6006df041acf45e3da1dc36fb267f7b"{print"CCLE_expression.csv - checksum failed"}'
