# cancer_perturbation_datasets
EDA, pre-processing and sourcing of datasets relevant gene expression perturbation datasets (cancer focused).


Each folder pertains to a different dataset and should have the following structure: 

```
-> FOLDER_NAME/
    README.md               
    get_data.sh             # bash script to document data source and download
    make_data.sh            # bash script to produce filtered datset, may take user input; see `README.md` 
    -> data/
        -> raw/
        -> processed/       # where the processed data will be saved
    -> notebooks/
    -> docs/ 
```