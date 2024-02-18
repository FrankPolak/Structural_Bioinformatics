read pdb pdb2aat.ent 2aat
read pdb pdb3aat.ent 3aat
read pdb pdb1aaw.ent 1aaw
read pdb pdb1spa.ent 1spa

analyse energy *

draw * * 0
draw pair * 1

color * 3aat cyan
color * 1aaw red
color * 1spa white

winsize * 50

plot

export plot refine
