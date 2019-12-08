function [I] = Simpson(x, y)
% Numerical evaluation of integral by Simpson's 1/3 Rule
% Inputs
%   x = the vector of equally spaced independent variable
%   y = the vector of function values with respect to x
% Outputs:
%   I = the numerical integral calculated
t = min(x);
d = max(x);
j = length(x);

if length(x) ~= length(y)
    error('length do not match for x and y')
end

if sum(x==linspace(t, d, j))~=j
    error('not linear spaced x')
end

if mod(j,2) == 1
te = ones(1,j);
te(2:2:end-1) =4;
te(3:2:end-2) =2;
d = x(3);
I = (d-t)/6*(te*y');

else
te = ones(1,j-1);
te(2:2:end-1) =4;
te(3:2:end-2) =2;
d = x(2);
I= (d-t)/6*(te*y(1:end-1)')+1/2*(x(2)-x(1))*(y(end)+y(end-1));
warning('use the trapezoidal rule on last interval')
end