#!/bin/csh                                                                      
# This script will process data using sac to remove instrument response         
cd /gaia/home/mrhman13/Public/DataAproject/coredata 
echo "Removing Instrument Response....."
set name1="IU"
set name2="IM"
sac << END                                                                     # After plotting without cutting we have selcted to take this portion of data
# because we only need three seconds after p arrival 
# read all the sac files 
r *$name1*.SAC
# use rmean to remove the mean
rmean                                                                          
# taper both ends to zero                                                      
taper                                                                          
# remove the linear trend                                                      
rtrend
# remove instrument response and get the signal as velocity                    
# use band-pass filter to remove unwanted noises 
# keep the frequency limits below Nyquest frequency
transfer from evalresp to none freqlimits 0.1 0.2 8 15
xlim off 
qdp off
# write over the signals with the processed
w over
r *.SAC
plot1                                                                           
xlabel on "Time, s"
ylabel on "Displacement, nm"
title on "Time series data, corrected for instrument response"
saveimg dataplot.pdf
quit
END

# The signals from the IM network are not good for our purpose
# we are removing those signals and only processed the signals from IU network
rm *$name2*.SAC
open dataplot.pdf
