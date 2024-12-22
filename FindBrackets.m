function [Brackets] = FindBrackets_CIT(func,xmin,xmax,steps)
%Function takes as input a function and searches for the roots.
%func is the function to be searched
%xmin and xmax are the limits of the search interval
%steps is number of steps in the search interval (default of 50)
%
%Returns the array Brackets giving the bracket for each sign change
%first column is the lower end of the bracket
%second column is the upper end of the bracket
%if no sign change is found the array is the empty set

%use switch case block code to check for the correct number of inputs
switch nargin %switch case if there are not enough inputs
        case 0
            error('Not enough input arguments.Needed inputs are function, lower and upper limits')
        case 1
            error('Not enough input arguments. Needed inputs are lower and upper limits of the search interval')
        case 2
            error('Not enough input arguments. Need upper limit of the search interval ')
        case 3
            steps = 50;
            fprintf('Number of steps defaults to %4d,',steps)
end
%create the row vector of x in the search interval and evaluate the
%function at each step

x = linspace(xmin,xmax,steps);
F = func(x);

%set the number of brackets to 0 and the array of bracket limits to the
%empty set

NumBrackets = 0;
Brackets = [];

n = length(x);

%use a for loop and an if statment to check for a sign change in the
%function

for i = 1:(n-1)
    if sign(F(i))~=sign(F(i+1))
        %if there is a sign change increase the number of brackets and
        %store the ends of the brackets in the array
        NumBrackets =  NumBrackets+1;
        Brackets(NumBrackets,1)=x(i);
        Brackets(NumBrackets,2)=x(i+1);

        %capture the value of the function at the bracket limit
        Brackets(NumBrackets,3)=F(i);
        Brackets(NumBrackets,4)=F(i+1);
    end
end

if isempty(NumBrackets)
    disp('No Brackets foundn CHeck the interval and/or increase the number of steps\n')
else
%if not an empty set, out the number of brackets and the array containing
%the information
disp('Number of Brackets: ')
disp(NumBrackets)
disp('---- average root values -- average function values --')

end

end