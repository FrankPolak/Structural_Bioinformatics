pair potential $PROSA_BASE/pII3.0.pair-cb pcb
surface potential $PROSA_BASE/pII3.0.surf-cb scb
pair potential $PROSA_BASE/pII3.0.pair-ca pca
surface potential $PROSA_BASE/pII3.0.surf-ca sca

read pdb pdb2aat.ent aat
read pdb pdb1spa.ent spa

use potential aat pca sca pcb scb
use potential spa pca sca pcb scb

analyse energy *

color * aat yellow
color * spa red

winsize * 50

plot

diff aat spa diff
plot

draw * * 0
draw pair * 1

plot

export plot session5

exit
