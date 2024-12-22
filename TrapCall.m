% short script to call the Trapezoid function 
% to calculate the value of the integral

x = linspace(-2,4,50) ;
y = 1 - x - 4.*x.^3 + 2.*x.^5 ;

plot(x,y)
title('Plot of y = 1 - x - 4x^3 + 2x^5')
xlabel('x')
ylabel('y')

Y = @(x) 1 - x - 4.*x.^3 + 2.*x.^5 ;

%% Call function

% I = Trapezoid(Y,-2,4,1)
%    I = 5280 
%    Error = 378.261%


% I = Trapezoid(Y,-2,4,2)
%    I = 2634 
%    Error = 138.587 %


I = Trapezoid(Y,-2,4)
%    I = 1120.9038 
%    Error = 1.531 %





