clc;
clear;

eo = 1e-9/(36*pi); %permittivity of free space
Q = 5e-9; %inner charge
L = 0.01; %cable length
rho_inner = 0.001; %radius rho_inner
rho_outer = 0.005; %radius rho_outer
phi_lower = 0; %lower phi boundary
phi_upper = 2*pi; %upper phi boundary
rho_stepSize = 1000; 
phi_stepSize = 1000; 
drho = (rho_outer-rho_inner)/rho_stepSize; %rho increments
dphi = (phi_upper-phi_lower)/phi_stepSize;

W = 0; %initialize the energy
for i = 1:rho_stepSize
    rho = rho_inner+(i-1)*drho+drho/2;
    for j = 1: phi_stepSize
        er = rho*10^3; %relative permittivity
        E = Q/(2*pi*eo*er*rho*L);
        D = Q/(2*pi*rho*L);
        dW = 0.5*D*E*rho*drho*dphi*L;
        W = W+dW; %continually update energy value
    end
end
C = Q^2/(2*W); %find capacitance with final energy value
disp(C)
