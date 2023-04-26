%Nicholas Archon, nga425
%COE 347 - Introduction to Computational Fluid Dynamics
%OF4 - Viscous case
clear;clc;close all;

R = 1; %done in setup by making Mhat 8314.5; 
gamma = [1.1 1.2 1.3 1.4 1.5 1.67]; 
gamma(end) = 5/3; %special case for an ideal gas (ie He) 


cp = (gamma.*R)./(gamma-1)

plot(gamma,cp);

