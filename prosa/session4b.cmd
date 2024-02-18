read pdb pdb2gn5.ent 2gn5
read pdb pdb1vqb.ent 1vqb

init zscore
combine type sdev

sorted_depth = 10

zscore 2gn5 z-result

sorted_depth = 0

zscore 1vqb z-result

exit
