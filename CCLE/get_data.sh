#!/bin/sh

# Download datasets and document sources 
# email: evansna@ohsu.edu 

# --------------------------------------------------------------------
# --------------------------------------------------------------------
# cell line info - ccle
# paper: nature.com/articles/s41586-019-1186-3
# info: https://depmap.org/portal/download/
# file name: sample_info.csv
# file size: ???
info=https://ndownloader.figshare.com/files/26261569

# --------------------------------------------------------------------
# --------------------------------------------------------------------
# cell line mutation data - ccle 
# info: https://depmap.org/portal/download/
# Citation: Mahmoud Ghandi, Franklin W. Huang, Judit Jané-Valbuena, Gregory V. Kryukov, ... Todd R. Golub, Levi A. Garraway & William R. Sellers. 2019. Next-generation characterization of the Cancer Cell Line Encyclopedia. Nature 569, 503-508 (2019).
# file name: 
# file size: 
mut=https://ndownloader.figshare.com/files/27902118

# --------------------------------------------------------------------
# --------------------------------------------------------------------
# cell line CNV data - ccle 
# info: https://depmap.org/portal/download/
# Citation: Mahmoud Ghandi, Franklin W. Huang, Judit Jané-Valbuena, Gregory V. Kryukov, ... Todd R. Golub, Levi A. Garraway & William R. Sellers. 2019. Next-generation characterization of the Cancer Cell Line Encyclopedia. Nature 569, 503-508 (2019).
# file name: 
# file size: 
cnv=https://ndownloader.figshare.com/files/27902124
# --------------------------------------------------------------------
# --------------------------------------------------------------------
# RNA expression data - CCLE 
# paper: nature.com/articles/s41586-019-1186-3
# info: https://depmap.org/portal/download/
# file name: CCLE_expression.csv
# file size: ???
rna_expr=https://ndownloader.figshare.com/files/26261476
# --------------------------------------------------------------------

# --------------------------------------------------------------------
# --------------------------------------------------------------------
# Gene Dependency - DepMap
# paper: Robin M. Meyers, Jordan G. Bryan, James M. McFarland, Barbara A. Weir, ... David E. Root, William C. Hahn, Aviad Tsherniak. Computational correction of copy number effect improves specificity of CRISPR-Cas9 essentiality screens in cancer cells. Nature Genetics 2017 October 49:1779-1784. doi:10.1038/ng.3984
# info: https://depmap.org/portal/download/
# file name: CRISPR_gene_effect.csv
# file size: 
gene_dep=https://ndownloader.figshare.com/files/27902226
# --------------------------------------------------------------------

# --------------------------------------------------------------------
# --------------------------------------------------------------------
# cell line methylation data - ccle 
# info: https://depmap.org/portal/download/
# Citation: Mahmoud Ghandi, Franklin W. Huang, Judit Jané-Valbuena, Gregory V. Kryukov, ... Todd R. Golub, Levi A. Garraway & William R. Sellers. 2019. Next-generation characterization of the Cancer Cell Line Encyclopedia. Nature 569, 503-508 (2019).
# file name: CCLE_RRBS_TSS_CpG_clusters_20180614.txt
# file size: 
CpG_rrbs='https://depmap.org/portal/download/api/download?file_name=ccle%2FCCLE_RRBS_TSS_CpG_clusters_20180614.txt&bucket=depmap-external-downloads'

# check that dir/file exists and then make/download

[ ! -d "./data/" ] && mkdir ./data/
[ ! -d "./data/raw/" ] && mkdir ./data/raw/

[ ! -f "./data/raw/CCLE_RRBS_TSS_CpG_clusters_20180614.txt" ] && wget $gene_dep -O ./data/raw/CCLE_RRBS_TSS_CpG_clusters_20180614.txt
[ ! -f "./data/raw/ccle_expression.txt" ] && wget $rna_expr -O ./data/raw/ccle_expression.txt
[ ! -f "./data/raw/ccle_info.txt" ] && wget $info -O ./data/raw/ccle_info.txt
[ ! -f "./data/raw/ccle_mutation.txt" ] && wget $mut -O ./data/raw/ccle_mutation.txt
[ ! -f "./data/raw/ccle_cnv.txt" ] && wget $cnv -O ./data/raw/ccle_cnv.txt
[ ! -f "./data/raw/ccle_methyl.txt" ] && wget $CpG_rrbs -O ./data/raw/ccle_methyl.txt --referer='https://depmap.org/portal/download/all/' --user-agent="Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2704.103 Safari/537.36"

echo 'downloads complete'

