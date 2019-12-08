function [root, fx, ea, iter] = FalsePosition(func, xl, xu, es, maxit, varargin)
%falsePosition
%created on: Oct-3-2019
%created by: Mazin Al Hinai
%last modified: Oct-3-2019
%falsePosition finds the root of a function using false position method
%inputs:
%       func= function
%       xl= lower guess
%       xu= upper guess
%       es= relative error
%       maxit= number of iterations
%output:
%       root= estimated location of the root
%       fx= function at the locstion of the root
%       ea= approximate relative error
%       iter = number of iterations 

if nargin<3
    error('use at least 3 input arguments')
end

test = func(xl,varargin{:})*func(xu,varargin{:});
if test>0
    error('sign does not change')
end

if nargin<4||isempty(es)
   es=0.0001;
end

if nargin<5||isempty(maxit), maxit=200;
end 

iter = 0;
xr = xl;
ea = 100;

while (1)
    xrold= xr;
    xr= xu-((func(xu)*(xl-xu))/(func(xl)-func(xu)));
    iter = iter + 1;
    if xr~= 0
        ea= abs((xr-xrold)/xr)*100;
    end
    test=func(xl,varargin{:})*func(xr,varargin{:});
    
    if test<0
        xu=xr;
    elseif test>0 
        xl=xr;
    else ea=0; end
    
    if ea<=es || iter >= maxit
       break
    end
end
root=xr;
fx=func(xr,varargin{:});
end
