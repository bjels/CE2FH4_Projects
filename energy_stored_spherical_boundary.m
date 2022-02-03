clc;
clear;

rho_s = 2*10^-6; %surface charge density
epsilon0 = 10^-9/(36*pi); %permittivity of free space

%setting bounds for both integrals
r = 2;
r_high = 3;
theta = 0;
theta_high = pi;
phi = 0;
phi_high = 2*pi;

%discretizing
r_stepSize = 1000; %discretizing r
theta_stepSize = 1000;
phi_stepSize = 1000;

%r, theta, and phi increments
dr = (r_high-r)/r_stepSize;
dtheta = (theta_high-theta)/theta_stepSize;
dphi = (phi_high-phi)/phi_stepSize;

energy = 0; %initialize energy

%Electric Energy Integral
for i = 1:r_stepSize
    r = r+dr;
    for j = 1:theta_stepSize
        theta = theta+dtheta;
        for k = 1:theta_stepSize
            D = rho_s/r^2; %set flux density to initial value
            E = D/epsilon0; %electric field
            energy = energy+ 0.5*D*E*r^2*sin(theta)*dr*dtheta*dphi; %updating the energy
        end
    end
    theta = 0; %reset theta
end
