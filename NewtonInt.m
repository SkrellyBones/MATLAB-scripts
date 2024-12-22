function [FindValue] = NewtonInt(X,Y,FindX)
% Function NewtonInt will determine an interpolating polynomial based on
% Newton's method.

% Inputs:
% X= vector of independent values
% Y= Vector of dependent values
% FindX= the value of the independent variable for which the
% interpolation is computed
% Output:
% FindValue = the interpolated value

% Check that the two vectors are the same length

n = length(X);
if length(Y) ~= n
error('The two vectors must be the same length.')
end

% Initialize a n x n matrix with all zeros

b = zeros(n,n);

% Place all of the dependent values into the first column of the matrix.

b(:,1) = Y;

% Populate the matrix with the divided differences - Each column will have
% one less value than the previous column.

for j = 2:n
for i = 1:n+1-j
b(i,j) = (b(i+1,j-1) - b(i,j-1))/(X(i+j-1) - X(i)); %added colon here for final project
end
end

% Use the divided differences to calculate the interpolated value

FindValue = b(1,1);
for k = 2:n
xx = 1;
for i = 1:k-1
xx = xx*(FindX - X(i));
end
FindValue = FindValue + b(1,k)*xx;
%fprintf('With %d data points the estimated value of f(%4.2f) is %6.4f\n',k,FindX,FindValue)
end

end
% NewtonInt(X,Y,3.4)
% X=[3 4 2.5 5]
% Y=[6.5 2 7 0]