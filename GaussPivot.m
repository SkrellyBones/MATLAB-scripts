function[Xvalues] = GaussPivot(A,B)



[m,n] = size(A);
[Bm,Bn] = size(B);

if m ~= n
    error ('A must be a square matrix')
elseif (Bm ~= m || Bn ~= 1)
    error('B must be a column vector with the same number of rows as A')
end

AugA = [A B];

%increase the number of columns in AUgA by 1

NumCol = m + 1;

% begin forward elemination loop, the outer loop moves from one pivot row
% to the next. the next loop calculates a facotr for each row below the
% pivot row. the innermost loop uses this factor for each element in the
% row

for j = 1:m-1
    [Big,p] = max(abs(AugA(j:n,j)));
    Bigrow = p + j -1;

  if Bigrow ~= j 
        Newrow(1:NumCol) = AugA(j,1:NumCol);
        AugA(j,1:NumCol) = AugA(Bigrow, 1:NumCol);
        AugA(Bigrow, 1:NumCol) = Newrow(1:NumCol);
  end
    for i = j+1:m
        factor = AugA(i,j)/AugA(j,j);
       

        for k = 1:NumCol
            AugA(i,k) = factor*AugA(j,k) - AugA(i,k);
        end
    end
end




%Now start the back sub
%first find the nth value of the solution matrix

Xvalues(n) = AugA(n,NumCol)/AugA(n,m);

%backwards loop

for i = n-1:-1:1
    Eval = 0;

    %use the already known values

    for k = m:-1:i+1
        Eval = Eval + AugA(i,k)*Xvalues(k);
     
    end

    Xvalues(i) = (AugA(i,m+1) - Eval)/AugA(i,i);
end










