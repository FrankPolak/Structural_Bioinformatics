# Homology modeling with multiple templates
from modeller import *              # Load standard Modeller classes
from modeller.automodel import *    # Load the automodel class

log.verbose()       # request verbose output
env = environ()     # create a new MODELLER environment to build this model in

# directories for input atom files
env.io.atom_files_directory = ['.', '../atom_files']

a = loopmodel(env,
              alnfile  = 'alignment3.pir',          # alignment filename
              knowns   = ('1mee'),                  # codes of the templates
              sequence = 'P11018',                  # code of the target
              assess_methods = assess.DOPE,         # assessment of models with DOPE
              loop_assess_methods = assess.DOPE     # assessment of models with DOPE
              )    

a.md_level = refine.fast
a.loop.md_level = refine.fast

a.loop.starting_model = 1   # index of first loop model
a.loop.ending_model = 2     # index of last loop model

a.starting_model= 11        # index of the first model
a.ending_model  = 12        # index of the last model

a.make()                    # run homology modeling

ok_mdl = [x for x in filter(lambda x: x['failure'] is None, a.outputs)]  # specify models that have not failed
key = "DOPE score"
ok_mdl.sort(key=lambda a: a[key])   # sort the outputs by DOPE score
print("*** MODELS RESULTS: ***\n")
for m in ok_mdl:
    print(f"Model {m['name']} (DOPE: {m[key]})\n")

ok_mdl = [x for x in filter(lambda x: x['failure'] is None, a.loop.outputs)]    # specify loop models that have not failed
key = "DOPE score"
ok_mdl.sort(key=lambda a: a[key])   # sort the outputs by DOPE score
print("*** LOOP MODELS RESULTS: ***\n")
for m in ok_mdl:
    print(f"Model {m['name']} (DOPE: {m[key]})\n")
