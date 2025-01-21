# CRC Radiotherapy

This repository contains the code used for the project. The project involves data preprocessing and model building, including MOFA (Multi-Omics Factor Analysis) and Random Forest model.

---

## Overview of Scripts

The scripts are organised to follow the workflow of the project:

### **1. Data Preparation**
- **`data_split.Rmd`**  
  Splits the dataset into two subsets:  
  - One subset for training the MOFA model.  
  - One subset for training the Random Forest model.

### **2. Data Preprocessing**
- **`RNA_preprocessing.Rmd`**  
  Preprocessing of the RNA dataset.
- **`mutation_preprocessing.Rmd`**  
  Preprocessing of the mutational dataset.
- **`methylation_preprocessing.Rmd`**  
  Preprocessing of the methylation dataset.
- **`cna_preprocessing.Rmd`**  
  Preprocessing of the Copy Number Alteration (CNA) dataset.

### **3. MOFA Model Development**
- **`MOFA_models.Rmd`**  
  - Identify the optimal MOFA model.  
  - Build the optimal MOFA model.  
  - Characterize the factors in the model.  

### **4. Feature Extraction**
- **`extract_features.Rmd`**  
  Extract informative features from the MOFA model, particularly in relation to the treatment response covariate.

### **5. Functional Analysis**
- **`GSEA.Rmd`**  
  Perform Gene Set Enrichment Analysis (GSEA) using important factors identified from the MOFA model.  
- **`pathway_enrichment.Rmd`**  
  Conduct pathway enrichment analysis using the informative factors identified from the MOFA model.

### **6. Machine Learning**
- **`Random_Forest.ipynb`**  
  - Build and evaluate a Random Forest model using the features extracted from the MOFA model.  

### **Data avalibility**
- Data was initially provided by S-CORT and is not avalible here.
- Serveral preprocessed datasets are provided here to allow running of the later scripts as well as a construced MOFA model.
---
