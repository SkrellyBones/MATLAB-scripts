function [X,Y] = Projectile(V0,T,R,S)
% Projectile computes the trajectory of a projectile defined by user input
%  V0 is initial velocity, T is the angle, R is the runtime and S is the
%  start time

T= T*pi/180; % angle in radians

g=32.2; %feet per second^2

t= S:0.25:R; % R second time period starting at S 
             % split into increments of 0.25 seconds

X = V0*cos(T)*t; 

Y = V0*sin(T)*t-0.5*g*t.^2;
outputArg1 = inputArg1;
outputArg2 = inputArg2;
end