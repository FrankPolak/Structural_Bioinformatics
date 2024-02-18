read pdb pdb2gn5.ent gn
read pdb pdb1vqb.ent vqb

analyse energy *

color * vqb red
winsize * 10
draw * * 0
draw pair * 1
graph title 2gn5 1vqb

shift vqb 1

plot 

export plot session4a

exit
