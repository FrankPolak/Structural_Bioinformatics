# Comparative Homology Modelling using Modeller

# 1. Blast Search for Homologs
blastp -query P11018.fa -db /mnt/NFS_UPF/soft/databases/blastdat/pdb_seq -out P11018_pdb.out

# 2. Obtain Chosen Homolg Sequences
cp /mnt/NFS_UPF/soft/databases/pdb/pdb/data/structures/divided/pdb/me/pdb1mee.ent.gz .
cp /mnt/NFS_UPF/soft/databases/pdb/pdb/data/structures/divided/pdb/sb/pdb1sbh.ent.gz .
cp /mnt/NFS_UPF/soft/databases/pdb/pdb/data/structures/divided/pdb/sc/pdb1scj.ent.gz .

gunzip *gz

# 3. Split Chains
PDBtoSplitChain.pl -i pdb1mee.ent -o 1mee
PDBtoSplitChain.pl -i pdb1scj.ent -o 1scj
PDBtoSplitChain.pl -i pdb1sbh.ent -o 1sbh

# 4. Copy All Sequences (or chosen chain) into an Alignment File
cat P11018.fa > alignment.fa
cat 1meeA.fa >> alignment.fa
cat 1sbhA.fa >> alignment.fa 
cat 1scjA.fa >> alignment.fa 

# 5. Clustal Omega for MSA
clustalw alignment.fa

# 6. Convert Alignment into PIR Format
aconvertMod2.pl -in c -out p< alignment.aln >alignment.pir

# 7. Run Modeller usding Python
modpy.sh python3 modeling.py 

# 8. Visualise using Chimera
chimera P11018.B99990001.pdb P11018.B99990002.pdb 1meeA.pdb 1sbhA.pdb 1scjA.pdb

# 9. Modify the Alignment by removing tails and areas of low coverage
gedit alignment.aln
    # modify and save as alignment2.aln
aconvertMod2.pl -in c -out p< alignment2.aln >alignment2.pir
    # edit python script to use alignment2.pir
modpy.sh python3 modeling.py 

# 10. Visialise New Model
chimera P11018*pdb 1meeA.pdb 1sbhA.pdb 1scjA.pdb
