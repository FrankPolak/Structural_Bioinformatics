# Structural_Bioinformatics
This repository contains projects relating to determining structure of protiens using current bioinformatical techniques. 

### 1. Comparative Homology Modeling
The frist step is to create a model by comparing the target sequence to the structure of its homologs. The steps for this are as follows and can be executed on the command line, as seen in the script.sh file.\
1) Blast Search for Homologs
2) Homolog selection\
   *From the Blast results select the homologs with the highest E-value. Do not select too many homologs as this will affect the modeller. In this example 3 homologs are used.*
3) Split Homologs into Chains\
   *If the target does not contain certain chains they can be omitted entirely.*
4) Prepare an Alignment File and Run Clustal Omgega
5) Convert the Alignment (.aln file) into PIR format
6) Run Modeller using Python
7) Visualise using Chimera
8) Adjust the Alignment and Repeat Steps 6 and 7
