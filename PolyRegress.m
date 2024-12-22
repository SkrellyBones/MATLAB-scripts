% Polynomial regression script
% Read and import data from an Excel file

path = "C:\Users\aweso\OneDrive\Documents\Week7Data.xlsx"
A = xlsread(path)

n = length(A)

% Compute all necessary sums for the coefficient matrix

% Sum of x and Sum of y

SumX = sum(A(1:n,1))   % first column
SumY = sum(A(1:n,2))   % second column

% Sum of x^2, Sum of x^3, Sum of x^4

SumX2 = sum(A(1:n,1).^2)
SumX3 = sum(A(1:n,1).^3)
SumX4 = sum(A(1:n,1).^4)

% Sum of yx and sum of yx^2

SumYX = sum(A(1:n,2).*A(1:n,1))
SumYX2 = sum(A(1:n,2).*A(1:n,1).^2)

% Make the coefficient matrix, call it Sums

Sums = [n SumX SumX2;SumX SumX2 SumX3;SumX2 SumX3 SumX4]

% Make the solution matrix, call it Sol

Sol = [SumY; SumYX; SumYX2]

% Use the Gauss elimination with pivoting function to solve

a = GaussPivot(Sums,Sol)

% Polynomial fit is y = a0 + a1*x + a2*x^2

fprintf('The equation of the curve is y = %6.4f + %6.4f*x + %6.4f*x^2',a)

% Compute the curve using the x values from the orginal matrix A.

y = a(1) + a(2).*A(1:n,1) + a(3).*A(1:n,1).^2

% Plot the original data and fitted curve

plot(A(1:n,1),A(1:n,2),'*k',A(1:n,1),y)
xlim([0.5 2.5])

% Calculate the average relative percent error

E = sum(abs((A(1:n,2)-y)./A(1:n,2))) * 100;
E = E/n;
fprintf('\n the average relative percent error is %7.4f %%',E)



