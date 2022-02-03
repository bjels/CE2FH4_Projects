clc; %clear cmd line
clear; %remove all previous variables

R1 = [1 2 3]; %define vector R1
R2 = [3 2 1]; %define vector R2

R1_dot_R2 = dot(R1,R2); %(a): finding dot product of R1 and R2
R2_dot_R2 = dot(R2,R2); %additional step: finding dot product of R2 and R2 (for the next line)

proj_R1_on_R2 = (R1_dot_R2/R2_dot_R2)*R2; %(b): calculating vector projection of R1 on R2

%calculating the magnitudes of R1 and R2
mod_R1 = norm(R1); 
mod_R2 = norm(R2); 

theta = acos(R1_dot_R2/((mod_R1)*(mod_R2))); %Finding the angle theta b/w r1 and R2
