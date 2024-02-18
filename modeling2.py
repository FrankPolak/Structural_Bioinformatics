# Homology modeling with multiple templates
from modeller import *              # Load standard Modeller classes
from modeller.automodel import *    # Load the automodel class

log.verbose()    # request verbose output
env = environ()  # create a new MODELLER environment to build this model in

# directories for input atom files
env.io.atom_files_directory = ['.', '../atom_files']

class MyModel(automodel):
    def special_restraints(self, aln):
        rsr = self.restraints
        at = self.atom
        rsr.add(secondary_structure.alpha(self.residue_range('251:A', '271:A'))) # define the atom numbers of the helix

a = MyModel(env,
              alnfile  = 'alignment3.pir',     # alignment filename
              knowns   = ('1mee'),             # codes of the templates
              sequence = 'P11018')             # code of the target

a.starting_model= 9                 # index of the first model
a.ending_model  = 10                # index of the last model

a.make()                            # run homology modeling
