%Nicholas Archon, nga425
%COE 347 - Introduction to Computational Fluid Dynamics
%OF4 - Viscous case
clear;clc;close all;

A_c = in22m2(2.5); %Area of combustion chamber
A_t = in22m2(1); %Area of throat
A_e = in22m2(1.5); %Area of nozzle exhaust

D_c = A2D(A_c); 
D_t = A2D(A_t); 
D_e = A2D(A_e); 

Re_limit = 1400; 



function mu = findMu(Re,rho,D,v)
    mu = (rho.*v.*D)./Re; 
end 


function D = A2D(A)
    D = sqrt(4.*A./4);
end


function [m2] = in22m2(in2)
% Convert area from square inches to square meters.
% Chad A. Greene 2012
m2 = in2*0.00064516;
end 