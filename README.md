# Structural_Bioinformatics
This repository contains projects relating to determining structure of protiens using current bioinformatical techniques.

<ins>Index:</ins>
1. **Comparative Homology Modeling**
2. **Macro-complex Modeling and Restrictions**
3. **Loop Modeling, Refinement, and Assessment**
4. **Protein Structure Quality Assessment using Prosa**

<hr>

### 1. Comparative Homology Modeling
The frist step is to create a model by comparing the target sequence to the structure of its homologs. The steps for this are as follows and can be executed on the command line, as seen in the script.sh file.\
1) Blast Search for Homologs (Templates)
2) Homolog selection\
   *From the Blast results select the homologs with the highest E-value. Do not select too many homologs as this will affect the modeller. In this example 3 homologs are used.*
3) Split Homologs into Chains\
   *If the target does not contain certain chains they can be omitted entirely.*
4) Prepare an Alignment File and Run Clustal Omgega
5) Convert the Alignment (.aln file) into PIR format
6) Run Modeller using Python\
   ```bash
   modpy.sh python3 modeling1.py
   ```
8) Visualise using Chimera
9) Adjust the Alignment and Repeat Steps 6 and 7\
   *change alnfile parameter to the new alignment and increment a.starting_model and a.ending_model.*

<hr>

### 2. Macro-complex Modeling and Restrictions
How to model a protein complex (i.e., a protein with more than one chain).

1) Modify the PIR file\
   (alignment.pir) Place a "\" at the end of a chain and inculde start and end of each chain in the first line as such:
   ```
   >P1;1mee
    structureX:1mee:  1 :A:401  :C:  : : -1.00 :-1.00
    ISNNMDVINMSLGGPTGSTALKTVVDKAVSSGIVVAAAAGNEGSSGS-TSTVGYPAKYPS-/
    LKSFPEVVGKTVDQAREYFTLHYPQYNVYFLPEGSPVTLDLRYNRVRVFYNPGTNVVNHVPHVG*
   ```
   Start and end of each chain can be found in the PDB file. Save as a separate alignment file.
2) Run Modeller using python\
   Specify the new alignment file and increment a.starting_model and a.ending_model if needed.
3) Visualise using Chimera\
   Inspect the model and template superimposed to identify faulty regions
4) Modify the Python Script *(modeling2.py)*\
   Create a new class that inherits from automodel and add special restraints as such:
   ```python
   def special_restraints(self, aln):
        rsr = self.restraints
        at = self.atom
        rsr.add(secondary_structure.alpha(self.residue_range('251:A', '271:A')))
   ```
   Use the new MyModel class instead of automodel. Run.
5) Inspect again using Chimera
   Sometimes when forcing a helix the programme can place it in the wrong configuration

<hr>

### 3. Loop Modeling, Refinement, and Assessment
How to deal with non-regular structures between two regular secondary structures and variable regions. *Ab initio* modeling.

1) Modify the Python Script to Run loopmodel instead of automodel
2) Add Model and Loop Assessment Method (DOPE)\
   The programme can be run faster by adding:
   ```python
    a.md_level = refine.fast
    a.loop.md_level = refine.fast
   ```
   Run using
   ```bash
   modpy.sh python3 modeling3.py > modeling_11_12.log &
   ```
3) Introduce Special Restraints by Defining a MyModel Class\
   *(modeling3_1.py)*\
   Increment starting_model and ending_model.\
   For better models execute:
   ```python
    a.md_level = refine.slow
    a.loop.md_level = refine.slow
   ```
   Run using
   ```bash
   modpy.sh python3 modeling3.py > modeling_13_14.log &
   ```
4) Inspect the Results (modeling_13_14.log) to Find the Model with the <ins>Lowest</ins> DOPE Score (Best Model)\
   *DOPE is calculating the energy, so the lower the score the better.*

**See https://salilab.org/modeller/manual/ for more information.**

<hr>

### 4. Protein Structure Quality Assessment using Prosa
By analysing protein structure databases we can determine the probability of two residues being in close proximity. The frequency of two residues in close contact can be interpreted as probability and, hence, the inverse of Boltzmann's law can be applied to calculate energies.\
Prosa is a programme that allows us to score protein structures by their energies.\
**NB. This appraoch is only valid for soluable globular proteins.**

Run Prosa from the command line and use the Prosa console to execute commands.
```
execute session1.cmd
```
*The following cmd files have been obtained form the Prosa manual, see Manual_prosa2003.pdf*

**session1.cmd:** Read PDB Files and Calculate and Visualise the Energies\
**session2.cmd:** Compare Energies\
**session4a.cmd:** Shift Graph to Compare Sequences of Different Lengths\
**session4b.cmd:** Calculate Z-Scores\
**session5.cmd:** Use Cα and Cβ Potentials\
**session6.cmd:** Use Only Cα Potentials\
**session7.cmd:** Analyse Mutant Structures without Generating New Models\
**session8.cmd:** Compare Stability of Protein Regions using Mutability\









