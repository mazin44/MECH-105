function [A] = specialMatrix(n,m)
% This function should return a matrix A as described in the problem statement
% Inputs n is the number of rows, and m the number of columns
% It is recomended to first create the matrxix A of the correct size, filling it with zeros to start with is not a bad choice
A =zeros(n,m); % setting matrix to zerors
if nargin('specialMatrix')~=2
    error('input exactly two arguments') %error
end
% Now the real challenge is to fill in the correct values of A

for r = 1:n % for loop
    for p=1:m
        if r==1 %nested if . Row 1
            A(r,p)=p;
        elseif p==1 % Columb 1
            A(r,p)=r;
        else % remaining 
            A(r,p)=A(r-1,p)+A(r,p-1);
        end
    end
end
