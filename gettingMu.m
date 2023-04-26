%Nicholas Archon, nga425
%COE 347 - Introduction to Computational Fluid Dynamics
%OF4 - Viscous case
clear;clc;close all;

A = 1;
D = findDiameter(A);

v_t = 6.8; 
rho_t = 0.55; 
Re = 1400; 

mu = rho_t*v_t*D/Re



function D = findDiameter(A)
    Din2 = sqrt(4*A/pi); 
    u = symunit;
    length = unitConvert(Din2*u.in,u.m);
    D = double(separateUnits(length));
end 