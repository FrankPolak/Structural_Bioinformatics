pair potential $PROSA_BASE/pII3.0.pair-ca pca
surface potential $PROSA_BASE/pII3.0.surf-ca sca

read pdb pdb1phy.ent phy
read pdb pdb2lzh.ent lzh

use potential phy pca sca
use potential lzh pca sca

analyse energy *

color * phy yellow
color * lzh red

winsize * 10

plot

export plot session6

