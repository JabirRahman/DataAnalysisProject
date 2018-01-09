#!/bin/csh
clear
# In this script, we will use sac to read the velocity SAC data
# that we processed before with saccommand.csh and to convert it to
# velocity. So that we can use both displacement and velocity
# Data files for our calculation

# copy displacement data files from coredata directory to new directory
# so that data does not mess up
set sourcepath=/gaia/home/mrhman13/Public/DataAproject/coredata
set targetpath=/gaia/home/mrhman13/Public/DataAproject/VelData
# first clean the target directory
cd $targetpath
rm *.SAC
rm *BHZ
cd $sourcepath
cp *.SAC *BHZ $targetpath
echo "Displacement Data has been Copied"
cd $targetpath

# Now use sac transfer function again to transfer the data from
# displacement to velocity
sac << END
# read all sac files
r *.SAC

# transfer all sac data from displacement to velocity
transfer from none to vel

# write over the displacement data to velocity data
w append new.SAC
r *new*.SAC
p1
saveimg velsac.pdf
quit
END
echo "Displacement data have been converted to Velocity and copied to Matlab projectsacdata directory"
cp *new*.SAC /gaia/home/mrhman13/Documents/MATLAB/projectsacdata
open velsac.pdf
