function [I] = Trapezoid(func,Lower,Upper,n)
% This function uses the Trapezoidal Rule to estimate the value of the
% integral

%% Inputs:
%       func = anonymous function to be integrated
%       Lower = lower limit of integration
%       Upper = upper limit of integration
%       n = number of intervals (default to 20)

%% Output:
%       I = estimated value of the integral

%% Check for correct number of inputs
% nargin = number of arguements

if nargin < 3
    error('Must include at least 3 inputs: the function, lower and upper limits of integration')
elseif nargin ==3
    n = 20
    fprintf('Number of intervals will defalt to %3d ',n)
end

%% Check that limits are correct

if ~(Upper > Lower)
    error('Upper limit must be greater than lowe limit')
end

%% Compute the constant width for each interval

width = (Upper - Lower)/n;
I = 0;

%% For each value of x not at the limits, need two times the function value

if n ~= 1
    for i = 1:n-1
        x = Lower + i*width
        I = I + 2*func(x)
    end
end

%% Add in function values at limits and multiply by width

I = .5 * width * (I + func(Lower) + func(Upper))

%% Error
 
Error = abs((1104-I)/1104) * 100 ;

%% Output estimated value of the integral along with error

fprintf('With %3d intervals, the estimated value of the integral is %7.4f \n',n,I)
fprintf('with a percent error of %6.3f%%',Error)

end