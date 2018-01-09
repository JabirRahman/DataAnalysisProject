#!/bin/csh/
# our target is to pre-process the earhtquake(EQ) data with this shell script
# First, set the name of all the events as simple names
set one="2017-02-02_mb4.8_Near_Coast_Of_Guerrero,_Mexico.893665.seed"
set two="2017-03-29_mb4.3_Off_Coast_Of_Jalisco,_Mexico.871223.seed"
set three="2017-03-29_mb4.6_Off_Coast_Of_Jalisco,_Mexico.396043.seed"
set four="2017-05-16_mb4.9_Off_Coast_Of_Michoacan,_Mexico.208982.seed"
set five="2017-05-20_mb4.7_Off_Coast_Of_Jalisco,_Mexico.167799.seed"
set six="2017-05-27_mb4.7_Revilla_Gigedo_Islands_Region.113517.seed"
set seven="2017-05-30_mb4.5_Revilla_Gigedo_Islands_Region.64185.seed"
set eight="2017-06-25_mb4.3_Revilla_Gigedo_Islands_Region.641703.seed"
set nine="2017-07-24_mb4.0_Gulf_Of_California.273425.seed"
set ten="2017-07-24_mb4.2_Gulf_Of_California.315301.seed"
set eleven="2017-07-24_mb4.3_Gulf_Of_California.56280.seed" 

# Set necessary paths and primary commands for easy use and call
# useful tips, dont put space after veriable name, shell creates problem
set pathone="/gaia/home/mrhman13/Downloads/EQDATA"
set pathtwo="/gaia/home/mrhman13/Public/DataAproject/coredata"
set commandone="cp *BHZ *BHZ*.SAC $pathtwo"
# first check the target directory and clean it from any sac files
# our target directory here is coredata 
cd $pathtwo
rm *.SAC 
cd $pathone

# use rdseed to extract seed data files, Response files and polezero files 
rdseed -d -R -p -f $one
rdseed -d -R -p -f $two
rdseed -d -R -p -f $three
rdseed -d -R -p -f $four
rdseed -d -R -p -f $five
rdseed -d -R -p -f $six
rdseed -d -R -p -f $seven
rdseed -d -R -p -f $eight
rdseed -d -R -p -f $nine
rdseed -d -R -p -f $ten
rdseed -d -R -p -f $eleven

# Copy only the Z components and respective response files into a separate directory
eval "$commandone" 
echo "Completed copying Response files and SAC files for Z components"

# In this step we will remove the instrument response from the data set
# read all sac files
echo "Correcing instrument Response using SAC...."
cd /gaia/home/mrhman13/Public/DataAproject/
csh focalmechanism.csh
csh saccommand.csh
csh saccommandTwo.csh