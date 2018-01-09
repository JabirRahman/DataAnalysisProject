#!/bin/csh
set inputfile = "eventcatalog.txt"

# In this script we are going to plot the focal mechanism for our events
# pscoast command to plot continents, shorelines, rivers and border
# -P, to make it portarit; -K, not to finalize the postscript plot; -D, resolution (f for full)
pscoast -R-112/-100/16/26 -JM5i -B2 -Gbisque -Sskyblue -Df -K -P > fq.ps

# AWK will change the txt data file's format and 'll arrange it in a new organized format as
# lon lat dep mrr mtt mpp mrt mrp mtp exp lon1 lat1
awk '{print $1, $2, $3, $4, $5, $6, $7, $8, $9, $10}' $inputfile >> fm.txt

# psmeca will plot focal mechanisms on maps, -J for projection, -P fpr portrait, 
# -K for not finalizing it right now 
psmeca fm.txt -R -JM5i -Sm0.15i -P -O -K >> fq.ps

# Draw legend using pslegend, with -D can specify where to put the legend square, -J will specif the projection, -F draws border ofor it
pslegend << END -R -JM5i -Dx3.75i/3.0i+w1.05i/1.05i+jLB -F+gwhite+p1p,black -O -P >> fq.ps
G 0.05i
S 0.15i c 0.15i - black 0.4i M = 4.9
G 0.05i
S 0.15i c 0.12i - black 0.4i M = 4.6
G 0.05i                                                                            
S 0.15i c 0.09i - black 0.4i M = 4.3 
END
# psconvert to convert the plot into pdf, rm to remove the .ps file
psconvert -A0.1i -Tf fq.ps
rm -f fq.ps
rm fm.txt
rm focalmechanism.csh~
rm gmt.history
open fq.pdf
