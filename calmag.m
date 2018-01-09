function [M_calculated, M_actual] = calmag(time1, time2, data1,data2, header)

% This function is to calculate the manitude of earthquake events

% Input:
%       time1 = time vector for displacement signal
%       time2 = time vector for velocity signal
%       data1 = time series data vector for displacement signal
%       data2 = time series data vector for velocity signal
%

% Output:
%        M_calculated = magnitude of event.
%        M_actual  = actual magnitude that we got from sac header

% Set the time range around the p arrival time to get the highest value of 
% displacement and velocity within that range
timerange1 = (time1 >100 & time1 <104);
timerange2 = (time2 >100 & time2 <104);

% calculate the max value of displacement and velocity for that particular
%range
dis_max = max(data1(timerange1));
vel_max = max(data2(timerange2));
distance = header.DIST;

% use some assertions here
assert (dis_max ~= 0)
assert (vel_max ~= 0) 

if isempty(distance)
    disp ('Distance variable is ematy')
end
% Now calculate the earthquake magnitude with the equation we derived
M_calculated = (4.5 + (1.37*log(dis_max)) + (1.88*log((distance)/111)) - (log(vel_max)));

M_actual = header.MAG;
end