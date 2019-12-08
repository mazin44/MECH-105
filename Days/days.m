function [nd] = days(mo, da, leap)
%days
%created on: Sep-10-2019
%created by: Mazin Al Hinai
%last modified: Sep-10-2019
%this function calculates the elapsed days in a year
%inputs:
%       mo = the month (1-12)
%       da = the day (1-31)
%       leap = (0 for non-leap year and 1 for leap year).
%output:
%       nd = number of elapsed days

mod1=[0 31 28 31 30 31 30 31 31 30 31 30 31];
mod2=[0 31 29 31 30 31 30 31 31 30 31 30 31];

if leap==1
    mod=mod2;
elseif leap==0
    mod=mod1;
else 
    error('invalide, 0 for non?leap year and 1 for leap year ')
end
if mo>0 && mo<=12    
mo=sum(mod(1:mo));
else
    error('invalide, enter values (1?12)')
end
if da>=0 && da<=mo+1 
nd=(mo)+da;
else
    error('invalide')
end

