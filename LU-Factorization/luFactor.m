function [L, U, P] = luFactor(A)
% luFactor(A)
%	LU decomposition with pivotiing
% inputs:
%	A = coefficient matrix
% outputs:
%	L = lower triangular matrix
%	U = upper triangular matrix
%       P = the permutation matrix

 [m,n]=size(A);
 
if m~=n
    error('size of row and column are not equal')
end

 L=eye(n);
    P=eye(n);
    U=A;
    for d=1:m-1
        pivot = max(abs(U(d:m,d)));
        for s=d:m
            if(abs(U(s,d))==pivot)
                INX = s;
               
            end
        end
        
       U([d,INX],d:m) = U([INX,d],d:m);
        L([d,INX],1:d-1) = L([INX,d],1:d-1);
        P([d,INX],:) = P([INX,d],:);
        
        for s=d+1:m
            L(s,d) = U(s,d)/U(d,d);
            U(s,d:m) = U(s,d:m)-L(s,d)*U(d,d:m);
        end
        
    end
