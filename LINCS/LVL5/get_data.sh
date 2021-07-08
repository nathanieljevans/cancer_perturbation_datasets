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
# file size: 
l1000_phaseII_lvl5_compounds=https://s3.amazonaws.com/macchiato.clue.io/builds/LINCS2020/level5/level5_beta_trt_cp_n720216x12328.gctx
l1000_phaseII_lvl5_shRNA=https://s3.amazonaws.com/macchiato.clue.io/builds/LINCS2020/level5/level5_beta_trt_sh_n238351x12328.gctx
l1000_phaseII_lvl5_crispr=https://s3.amazonaws.com/macchiato.clue.io/builds/LINCS2020/level5/level5_beta_trt_xpr_n142901x12328.gctx 
l1000_phaseII_lvl5_overexpr=https://s3.amazonaws.com/macchiato.clue.io/builds/LINCS2020/level5/level5_beta_trt_oe_n34171x12328.gctx

l1000_phaseII_lvl5_meta=https://s3.amazonaws.com/macchiato.clue.io/builds/LINCS2020/siginfo_beta.txt
l1000_phaseII_compoundinfo=https://s3.amazonaws.com/macchiato.clue.io/builds/LINCS2020/compoundinfo_beta.txt
l1000_phaseII_cellineinfo=https://s3.amazonaws.com/macchiato.clue.io/builds/LINCS2020/cellinfo_beta.txt
l1000_phaseII_geneinfo=https://s3.amazonaws.com/macchiato.clue.io/builds/LINCS2020/geneinfo_beta.txt

# check that dir/file exists and then make/download

[ ! -d "./data/" ] && mkdir ./data/
[ ! -d "./data/raw" ] && mkdir ./data/raw/

[ ! -f "./data/raw/compoundinfo_beta.txt" ] && wget $l1000_phaseII_compoundinfo -O ./data/raw/compoundinfo_beta.txt
[ ! -f "./data/raw/cellinfo_beta.txt" ] && wget $l1000_phaseII_cellineinfo -O ./data/raw/cellinfo_beta.txt
[ ! -f "./data/raw/geneinfo_beta.txt" ] && wget $l1000_phaseII_geneinfo -O ./data/raw/geneinfo_beta.txt
[ ! -f "./data/raw/siginfo_beta.txt" ] && wget $l1000_phaseII_lvl5_meta -O ./data/raw/siginfo_beta.txt

[ ! -f "./data/raw/level5_beta_trt_cp_n720216x12328.gctx" ] && wget $l1000_phaseII_lvl5_compounds -O ./data/raw/level5_beta_trt_cp_n720216x12328.gctx
[ ! -f "./data/raw/level5_beta_trt_sh_n238351x12328.gctx" ] && wget $l1000_phaseII_lvl5_shRNA -O ./data/raw/level5_beta_trt_sh_n238351x12328.gctx
[ ! -f "./data/raw/level5_beta_trt_xpr_n142901x12328.gctx" ] && wget $l1000_phaseII_lvl5_crispr -O ./data/raw/level5_beta_trt_xpr_n142901x12328.gctx
[ ! -f "./data/raw/level5_beta_trt_oe_n34171x12328.gctx" ] && wget $l1000_phaseII_lvl5_overexpr -O ./data/raw/level5_beta_trt_oe_n34171x12328.gctx

# don't have enough memory on my pc for the conversion...
#echo 'converting gctx to gct (requires cmapPy)'
#[ ! -f "./data/raw/level5_beta_trt_cp_n720216x12328.gct" ] && gctx2gct -filename ./data/raw/level5_beta_trt_cp_n720216x12328.gctx -output_filepath  ./data/raw/level5_beta_trt_cp_n720216x12328.gct
#[ ! -f "./data/raw/level5_beta_trt_sh_n238351x12328.gct" ] && gctx2gct -filename ./data/raw/level5_beta_trt_sh_n238351x12328.gctx -output_filepath ./data/raw/level5_beta_trt_sh_n238351x12328.gct
#[ ! -f "./data/raw/level5_beta_trt_xpr_n142901x12328.gct " ] && gctx2gct -filename ./data/raw/level5_beta_trt_xpr_n142901x12328.gctx -output_filepath ./data/raw/level5_beta_trt_xpr_n142901x12328.gct
#[ ! -f "./data/raw/level5_beta_trt_oe_n34171x12328.gct" ] && gctx2gct -filename ./data/raw/level5_beta_trt_oe_n34171x12328.gctx -output_filepath ./data/raw/level5_beta_trt_oe_n34171x12328.gct

echo 'downloads complete'

# beta version (phase II) is continuously being added to... so checksums aren't the best move. 

#echo 'verifying checksums...'
#md5sum ./data/CCLE_expression.csv  | awk '$1!="c6006df041acf45e3da1dc36fb267f7b"{print"CCLE_expression.csv - checksum failed"}'
