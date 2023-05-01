%Nicholas Archon, nga425
%COE 347 - Introduction to Computational Fluid Dynamics
%OF4 - Determines Nozzle Efficiency
%Formulas taken from Rocket Propulsion Elements, 9th, Sutton & Biblarz.
clear;clc;close all;

gamma = 1.4; 
T01 = 1; 
ve = 0.3833;
PeP01 = 0.75; 
cp = 3.5; 
n_n = nozzleEff(ve,cp,T01,PeP01,gamma)

function n_n = nozzleEff(ve,cp,T01,PeP01,g)
    term1 = ve.^2; 
    term2 = 2.*cp.*T01;
    term3 = 1 - PeP01.^((g-1)./g); 

    n_n = term1./(term2.*term3); 
end 