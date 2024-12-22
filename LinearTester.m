

clc
% Raw data points (x,y)

x = [.4 .8 1.2 1.6 2 2.4] ;
y = [77 265 565 905 1420 1925] ;
n = length(x) ;

% Plot raw data

subplot(2,2,1),plot(x,y,'*k','MarkerSize',10)
xlim([0 2.5])
xlabel('x')
ylabel('y')
title('Raw Data: y as a function of x')

% Take log(base 10) of the raw data

Xlog = log10(x)
Ylog = log10(y)

% Plot the logarithmic data
subplot(2,2,2),plot(Xlog,Ylog,'or','MarkerSize',10)
xlim([-0.5 0.5])
ylim([1.5 3.5])
ylabel('log(y)')
xlabel('log(x)')
title('Logarithmic Data: log(y) vs log(x)')

% Plot on logarthmic scale (loglog)

subplot(2,2,3)
loglog(x,y,'+k')
ylim([10 5000])
xlim([0.3 3])
ylabel('log scale (y)')
xlabel('log scale (x)')
title('Raw Data on Logarithmic Scale')

SumLogX = sum(Xlog)
SumLogY = sum(Ylog)

LogXY = Xlog.*Ylog
SumLogXY = sum(LogXY)

LogX2 = Xlog.^2
SumLogX2 = sum(LogX2)

Beta = (n*SumLogXY - SumLogX*SumLogY)/(n*SumLogX2 - SumLogX^2)

LogAlpha = (SumLogY/n) - ((Beta*SumLogX)/n)

xl = linspace(-0.5,0.5,50) ;
yl = LogAlpha + Beta*xl ;

subplot(2,2,4)
plot(Xlog,Ylog,'*k',xl,yl)
title('Linearized Data')
xlabel('x')
ylabel('y')

% y = alpha * x^beta to fit raw data

alpha = 10^LogAlpha

x2 = linspace(0,2.5,50);
y2 = alpha * x2.^Beta ;
subplot(2,2,1)
plot(x,y,'*k',x2,y2)
title('Curved Raw Data')
xlabel('x')
ylabel('y')

