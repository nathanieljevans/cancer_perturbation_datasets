'''
LINCS/LVL5/SRC/utils.py
'''

import pandas as pd
import numpy as np
from matplotlib import pyplot as plt 
import networkx as nx 
import pickle as pkl

import h5py


def get_lvl5_cmp_data(): 
    '''
    hacky interim dataloading 
    '''

    # gene id mapping
    with open('../../../GENEID_MAPPING/data/processed/all2genesymbol.pkl', 'rb') as f: 
        all2symb = pkl.load(f)

    geneinfo = pd.read_csv('../data/raw/geneinfo_beta.txt', sep='\t', dtype=str)
    id2symb = geneinfo.set_index('gene_id')['gene_symbol'].to_dict()

    siginfo = pd.read_csv('../data/raw/siginfo_beta.txt', sep='\t')

    with open('../../../DDS_graph.pkl', 'rb') as f: 
        DDS_graph = pkl.load(f)

    with open('../../../PPI_graph.pkl', 'rb') as f: 
        PPI_graph = pkl.load(f)

    drugs = DDS_graph['nodelist']
    genes = PPI_graph['nodelist']

    cp = h5py.File('../data/raw/level5_beta_trt_cp_n720216x12328.gctx', 'r')
    cp_data = cp['0']['DATA']['0']['matrix']

    sample_meta = np.array(cp['0']['META']['COL']['id'], dtype=str)
    gene_meta = np.array(cp['0']['META']['ROW']['id'], dtype=str)

    gene_meta_symb = np.array([all2symb[id2symb[x].upper()][0] if id2symb[x].upper() in all2symb else None for x in gene_meta])

    gene_selector = np.array([x in genes for x in gene_meta_symb])

    overlap_ = set(siginfo.cmap_name.str.lower().unique()).intersection(set(drugs))

    mydrugs = siginfo[lambda x: x.cmap_name.str.lower().isin(drugs) & (x.pert_time == 24.0) & (x.pert_dose == 10.)]

    drug_cnt = mydrugs.groupby('cmap_name').count()['cell_mfc_name']
    repl20_drugs = drug_cnt.index[drug_cnt > 20].values

    mydrugs = mydrugs[lambda x: x.cmap_name.isin(repl20_drugs)]

    sample_selector = pd.Series(sample_meta).isin(mydrugs.sig_id.values).values 

    mysamples_all_drugs = cp_data[sample_selector.nonzero()[0], :]

    mysamples_mygenes = mysamples_all_drugs[:, gene_selector]

    mydata = pd.DataFrame(mysamples_mygenes)
    mydata.columns = gene_meta_symb[gene_selector]
    mydata.index = sample_meta[sample_selector]
    mydata = mydata.merge(siginfo, left_index=True, right_on='sig_id', how='left')

    return mydata, gene_meta_symb[gene_selector]



