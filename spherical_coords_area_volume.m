clc;
clear;
 

V=0; %initialize volume to 0
S1=0; %initialize surface to 0
S2 = 0; %initialize surface to 0
S3=0; %initialize surface to 0
S4=0; %initialize surface to 0
S5=0; %initialize surface to 0
S6=0; %initialize surface to 0
 

r = 0; %initialize r to 0, its lower bound
theta = pi/4; %initialize theta to pi/4, its lower bound
phi=pi/4; %initialize phi to pi/4, its lower bound
 

%initialize step sizes
%chose 1000 b/c increase in step size gives more accurate result
r_stepSize = 1000;
theta_stepSize = 1000;
phi_stepSize = 1000;
 

%initialize differential increments for r, theta, & phi
%across their full defined boundaries
dr = (2-0)/r_stepSize;
dtheta = (pi/2-pi/4)/theta_stepSize;
dphi = (pi/2-pi/4)/phi_stepSize; 
 

%finding volume of enclosed surface:
for k = 1:r_stepSize
 for j = 1:theta_stepSize
 for i = 1:phi_stepSize
 V = V+r*r*dr*sin(theta)*dtheta*dphi;
 end
 theta = theta + dtheta;
 end
 r = r+dr;
 theta = pi/4;
end
disp(V)
 

theta = 0; %reset theta
 

%calculating area of S1
r1 = 2; %initializing upper bound of r
for k = 1:theta_stepSize
 for i = 1:phi_stepSize
 S1 = S1 + r1*sin(theta)*dtheta*dphi;
 end
 theta=theta+dtheta;
end
%defined an S2 in analytical calculations, but will not integrate b/c
%at S2 r = 0
 
r=2; % reset r
%calculating area of S3
theta1=pi/4;
for k = 1:r_stepSize
 r=r+dr;
 for i = 1:phi_stepSize
 S3 = S3 + r*sin(theta1)*dr*dphi;
 end
end
r=0; % reset r 
 

%calculating area of S4
theta2 = pi/2; %initializing upper bound of theta
for k = 1:r_stepSize
 r=r+dr;
 for i = 1:phi_stepSize
 S4 = S4 + r*sin(theta2)*dr*dphi;
 end
end
 
r=0; % reset r 
%calculating area of S5
for k = 1:r_stepSize
 for i = 1:theta_stepSize
 S5 = S5 + r*dtheta*dr;
 end
 r=r+dr;
end
S6 = S5; %the areas of S5 and S6 are equal
 
 

%final calculation of surface area
%add all integrated surfaces together
SA = S1 + S3 + S4 + S5 + S6;
disp(SA)
