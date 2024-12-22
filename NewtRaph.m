function [Root, ApproxE, NumIt] =  NewtRaph_CIT(func,derf,InitialX,RelativeE,MaxIt)

clc
if nargin <3
    error ('Number of three inputs required')
elseif nargin <4
    RelativeE = 0.000001;
    MaxIt = 50;
    disp('Defaults: Maxit = 50 and Relative E = 0.000001')
elseif nargin <5
    MaxIt = 50;
    disp ('Default max iterations = 50')
end
NumIt = 0;
Xnew = InitialX;

for i = 1:MaxIt
    Xold = Xnew;
    Xnew = Xold - func(Xold)/derf(Xold);
    NumIt = NumIt+1;
    fprintf('\n Old x %10.7f New x %10.7f iterations %4d ',Xold,Xnew,NumIt)

    if Xnew ~=0
        ApproxE = abs((Xnew-Xold)/Xnew)*100;
        fprintf("\n Percent error = %10.7f",ApproxE)
        if ApproxE <= RelativeE || NumIt >= MaxIt
            break
        end
    end
end

Root = Xnew;
fprintf('\n Root found: %7.4f with an error of %10.8f after %4d iterations', Root, ApproxE, NumIt)

end



   


