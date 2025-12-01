function [Valatroot,centerror,numiters,root] = Bisection(F,LowerB,UpperB,Error,Iterations,varargin)
%The bisection method is a root-finding algorithm that iteratively reduces 
% the interval containing a root of a real-valued function. 
% The basic idea is to repeatedly divide the interval in half and then 
% select the subinterval where the function changes sign, guaranteeing that a 
% root exists within that subinterval. This process is repeated until a sufficiently accurate root is found.
% F = the function to be inputted
%LowerB= lower bound to be searched for a root
%UpperB = upper bound to be searched for a root
%Error = the desired percent error of the search function
%Iterations = max number of times the for loop can complete
%centerror =  actually outputted percent error
%Valatroot = actually outputted value of the function at the root
%numiters =  actually outputted number of iterations
%root = actually outputted value at the root
    if nargin < 3
        error('At least 3 input arguments required, The function, the lower bounds, and the upper bounds')
    end
test = (F(LowerB,varargin{:})).*(F(UpperB,varargin{:}));
    if test > 0
    error('No sign change')
    end
    if nargin < 4 || isempty(Error)
    Error = 0.0001;
    disp('Default Percent Error = 0.0001')
    end
    if nargin < 5 || isempty (Iterations)
    Iterations =  50;
    disp('Default Iterations = 50')
end
numiters = 0;
newbound = LowerB;
centerror = 100;

while(centerror>Error)
    boundold = newbound;
    newbound = (LowerB+UpperB)/2;
    numiters = numiters+1;
    if newbound ~=0
        centerror = abs((newbound-boundold)/newbound)*100;
    end
    test = ((F(LowerB,varargin{:})).*(F(newbound,varargin{:})));
    if test < 0
        UpperB = newbound;
    
    elseif test > 0
        LowerB = newbound;
    else
        centerror=0;
    end
    if centerror <= Error ||numiters >= Iterations
        break;
    end

end
root = newbound; 
Valatroot = F(newbound,varargin{:});
fprintf('Bisection coverged after %d iterations with a root value of %d \n with a percent error of %d with a function value of %d',numiters,root,centerror,Valatroot )

end
