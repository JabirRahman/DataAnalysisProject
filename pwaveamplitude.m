% In this matlab script outr target is to read the processed sac data files
% and to find the P wave amplitude after P wave arrival for the first Few
% seconds.

% The function readsac.m has been obtained from internet long time ago.
% I forgot the name of the writer (Accept my apology). The credit for
% this function belongs to its coder.

close all
clear all
clc

% read the sac data files using readsac function. We are not using all
% data for this small projects. We will only use 5 signals for 5 different
% events.

% use rdsac to read sac file and assign the rdsac function's output to 
% veriables as vectors, use the name of two SAC data files for 
% displaceent and velocity accordingly
dis_f = '2017.033.00.52.37.0195.IU.SLBS.10.BHZ.M.SAC';
% again use rdsac function to read velocity data and assign data to veriabes
vel_f = '2017.033.00.52.37.0195.IU.SLBS.10.BHZ.M.SACnew.SAC'; 

% Set variables for time and data to get from both SAC files. 
[time1, data1] = readsac(dis_f);
[time2, data2]= readsac(vel_f);


% rdsac function is better to get the header data file. It gives an header
% in an organized manner
header_data = rdsac(dis_f);
header = header_data.HEADER;

[M_calculated, M_actual] = calmag(time1, time2, data1,data2, header)
