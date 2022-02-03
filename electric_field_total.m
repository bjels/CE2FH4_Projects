clc;
clear;

e0 = (1e-9)/(36*pi); %epsilon nought value
D = 2e-6; %surface charge density (aka rho_s)

%initialize discretization in the cylindrical directions
rho_stepSize = 1000;
phi_stepSize = 1000;

%initialize upper & lower boundaries of rho and phi
rho_lower = 0;
rho_upper = 1;
phi_lower = 0;
phi_upper = 2*pi;

%rho and phi increments
drho = (rho_upper-rho_lower)/rho_stepSize;
dphi = (phi_upper-phi_lower)/phi_stepSize;

%initialize E value (z component)
E = 0;

%find E using double integral
for j = 1:rho_stepSize
    rho = rho_lower+(j-1)*drho+drho/2; %increment rho from the center of a differential element
    for k = 1:phi_stepSize 
        E = E+((D*rho*drho*dphi)/(4*e0*pi*(rho^2+1)^(3/2))); %update E value with expression
    end
end

disp(E)
