function [I] = Simpsons(func,Lower,Upper,n)
% This function uses the simpsons Rule to estimate the value of the
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
    n = 20;
    fprintf('Number of intervals will defalt to %3d ',n)
elseif nargin ==4
    if(rem(n,2) ==1)
        error('number of intervals must be even')
    end
end

%% Check that limits are correct

if ~(Upper > Lower)
    error('Upper limit must be greater than lowe limit')
end

%% Compute the constant width for each interval

width = (Upper - Lower)/n;
I = 0;


%loop for terms multiplied by 4
for i = 2:2:n
    x = Lower + (i-1)*width;
    I = I + 4*func(x);
end

%loop for terms multiplied by 2
for k = 3:2:n-1
    x = Lower + (k-1)*width;
    I = I + 2*func(x);
end


%% Add in function values at limits and multiply by width

I = (width/3) * (I+func(Lower) +func(Upper));

%% Error
 
Error = abs((1104-I)/1104) * 100 ;

%% Output estimated value of the integral along with error

fprintf('With %3d intervals, the estimated value of the integral is %7.4f with a percent error of %6.3f%%\n',n,I,Error)


end