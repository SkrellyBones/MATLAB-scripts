% Script to calculate and plot the trajectory of a projectile

%initial velocity and launch angle
clc
V0 =input('Initial Velocity? (ft/s):') ; %feet per second, 100
T=input('Launch angle?(degrees):'); % angle in degrees
S= input('Starttime?(0-5):');
R= input('Runtime?(s):');
T= T*pi/180; % angle in radians
g=32.2; %feet per second^2
t= S:0.25:R; % R second time period starting at S 
             % split into increments of 0.25 seconds
X = V0*cos(T)*t; 
Y = V0*sin(T)*t-0.5*g*t.^2;




plot (X,Y)
title ('Trajectory of Projectile')
%xlim([0,R*100])
xlabel ('Distance (ft)')
ylabel ('Height (ft)')
