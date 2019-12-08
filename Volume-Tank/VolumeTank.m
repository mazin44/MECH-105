% Specify the variables needed to solve this problem (ie. height of each section, diameter, radiaus, ...)
%   It is alwasy easier to work with variables (diameter_cyl = 25) than to use numbers everywhere, since a 
%   diameter indicates something specific but the number 25 could mean anything


% Specify the height of the water
h = 20
% You can comment / uncomment lines below for testing. This will overwrite the previous line for h = 20.
% For submission, make sure all of the following lines are commented out and h = 20! (OR IT IS MARKED AS WRONG)
h_up = 14;
rb= 46/2;
rs= 25/2;
h_down= 19;


% Now compute the volume. Using conditional statments you will want to first check the height makes sense,
% and then solve the volume depending on what portion of the tank has been filled.
% Make sure that your volume is stored in the variable v! (OR IT WILL BE MARKED AS WRONG)
% You may find it more convenient to move v around in you code, it is only given here to indicate what variable to use.

%h=input('Hieght of water level\n');
if h<=19 && h>0
    h_up=h;
    h_down=0;
elseif h<33 && h>19
    h_up=19;
    h_down=h-19;

else
    fprintf('error, please try typing in a povitive ineger from 0 to 33.')
end
rh = h_down*(23-12.5)/14+12.5;
v_f = pi/3*(h-19)*(rh^2+rs^2+rh*rs);
v_c = pi*rs^2*19;
v = v_f+v_c;
fprintf('the volume of the water would equal to %d m^3\n', v)
    