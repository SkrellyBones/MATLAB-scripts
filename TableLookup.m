function[Xvalue,Yvalue] = TableLookup(X,Y,Xvalue)
%finds the neighboring x values for use in interpolation function
%and then linearly interpolates the y value
clc
%make sure the two vectors are the same length
n = length(X);
if length(Y) ~= n
    error('Vectors are not the same length');
end
%check that value is in the range of data
if (Xvalue < X(1) || Xvalue > X(n))
    error('x value outside range of data provided')
end
%find neighboring datapoints by doing a bisection search
iLower = 1;
iUpper = n;
for i = 1:n
    iMid = fix((iUpper+iLower)/2);

    if(X(iMid) < Xvalue)
        iLower = iMid;
    else
        iUpper = iMid;
    end
    if ((iUpper - iLower) <= 1)
        I = iLower;
        break;
    end
end
%perform the linear interpolation using the ith value of x
Yvalue = Y(I) + (Y(I+1)-Y(I)/X(I+1) - X(I)) * (Xvalue-X(I));

end

