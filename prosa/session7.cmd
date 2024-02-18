read pdb pdb1ubi.ent wt

mutate sequence wt 46 P mutant1
mutate sequence wt 5 E mutant2
mutate sequence mutant2 32 P mutant3
mutate sequence mutant3 47 L mutant4
list objects

analyse energy *
color * mutant1 red
hide *
show wt
show mutant1
plot

diff wt mutant1 diff1
hide *
show diff1
plot

diff wt mutant4 diff4
color * diff4 blue
show diff4
plot

init zscore
delete diff1
delete diff4
zscore *

exit
