function [dydx,dydx2] = Derivative(x,y)

n = length(x);
if length(y) ~= n
    error('Vectors must be of same length')
end

if any(diff(diff(x))~=0)
    error('Vector x must have equal spacing')
end

if n < 4
    error('Vector must have at least 4 datapoints');
end

dx = x(2) - x(1);

for i = 1:n
    if i ==1 %forward differencing first datapoint
        dydx(i) = (-y(3) + 4*y(2) - 3*y(1))/(2*dx);
        dydx2(i) = (-y(4) +4*y(3) - 5*y(2) + 2*y(1))/(dx^2);
    elseif i==n %backwards differencing last datapoint
        dydx(i) = (3*y(n) - 4*y(n-1) + y(n-2))/(2*dx);
        dydx2(i) = (2*y(n) - 5*y(n-1) + 4*y(n-2)- y(n-3))/(dx^2);
    else %central differencing all other datapoints
        dydx(i) = (y(i+1) - y(i-1))/(2*dx);
        dydx2(i) = (y(i+1) - 2*y(i) + y(i-1))/(dx^2);
    end
end





end