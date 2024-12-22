function [Root, ApproxE, NumIt] =  ModSecant_CIT(func,InitialX,delta,RelativeE,MaxIt)

clc
if nargin <2
    error ('Number of two inputs required')
elseif nargin <3
    RelativeE = 0.0001;
    MaxIt = 50;
    delta = 10^-6;
    disp('Defaults: Maxit = 50, delta = 10^-6 and Relative E = 0.0001')
elseif nargin <4
    RelativeE = 0.0001;
    MaxIt = 50;
    disp('Defaults: Maxit = 50 and Relative E = 0.0001')
elseif nargin <5
    MaxIt = 50;
    disp ('Default max iterations = 50')
end
NumIt = 0;
Xnew = InitialX;

for i = 1:MaxIt
    Xold = Xnew;
    Xnew = Xold - (func(Xold)*delta*Xold)/(func(Xold+delta*Xold) - func(Xold));
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



   


