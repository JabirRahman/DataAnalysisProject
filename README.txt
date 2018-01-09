# Our target was to calculate or at least have an idea of the magnitude
# of an earthquake just from the first three seconds of a P wave signal 
# I also tried to use almost all tools (except Python) that were instructed in the class
# My steps were like this-

# Selection of region (Mexico and Gulf of Mexico)
# Downloading data from IRIS as SEED files
# Correcting Instrument Response (useing Shell Scripting and SAC )
# Drawing focal mechanism for the events (Using GMT and AWK)
# Calculating the p wave max amplitude for the first three seconds of arrival
# (using Matlab)

# Derivation of an Equation myself to calculate the EQ magnitude
# using P wave amplitude for both Displacement and Velocity
# including the distance between the source and the station

# Using Excel to compare the calculated magnitude and True magnitude
# almost 50% events magnitude came very close to the actual magnitude.
# But some are higher enough. That's because I did not use the p wave
# arrival time precisely. The time range for collecting P wave amplitude
# was based on eye observation. I can condifently say that if the P wave
# arrival time can be detected correctly, the equation that we derived
# may give better results.

# I always emphasized on automating my code so that one doesn't
# need to manually do the work. I believe I could have done 
# a bit finer if there was like more time.


# Thank you Eric. The class really helped me. Also thanks for
# tolerting all my silly questions and helping me out. 
# It was truly good to have you as our professor.


##########################################################################

# RUNNING SCRIPTS
# Just running the process.csh should complete all the prepossing
# and gives global mechanism plot. It will also take the correcded
# displacement and velocity components to a Matlab directory.

# There are two matlab codes. One is a function to calculate the Magnitude
# Thecond one is to take the input and call the function
# 
# To calculate the magnitude for different stations, one needs 
# to change two input components name. The output will be Calculated
# Magnitude using my derived equation along with the actual magnitude 

# There is also a Excel file at the public folder that I used for comparing
# both magnitudes and plotting them in excel
 
