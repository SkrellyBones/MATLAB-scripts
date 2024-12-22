function [I] = UnEqTrap(X,Y)
% UnEqTrap: Un-Equal Trapezoid -> Similar to Trapezoid function but
%           Intervals may be unequal

% This function uses the Trapezoidal Rule to estimate the value of the
% integral given by a set of data points, Intervals may be unequal


if nargin ~= 2
    error('Must include two inputs: \n vector of the independent variable; vector of the dependent variable')
end



n = length(X);

if (length(Y) ~= n)
    error('Vectors must have an equal number of elements.')
end



if any(diff(X)<0) 
    % ^ goes through x matrix and calculateds difference between successive elements
    %       ex: (x2 - x1 ; x3 - x2 ; x4 - x3 )
    error('Independent variable must be monotonically increasing')
end



I = 0;
for i = 1:n-1
    I = I + 0.5 * (Y(i+1) + Y(i)) * (X(i+1) - X(i));
end


end