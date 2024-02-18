read pdb pdb2aat.ent obj1
analyse energy obj1
plot

winsize obj1 50
plot

draw * obj1 1
plot
color comb obj1 cyan
color surf obj1 magenta
plot 

read pdb pdb1spa.ent obj2
analyse energy obj2
plot 

color * obj2 red
winsize * 50
plot 

draw * * 0
draw pair * 1
plot

export plot myplot

exit
