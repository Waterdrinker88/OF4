%Nicholas Archon, nga425
%COE 347 - Introduction to Computational Fluid Dynamics
%OF4 - Determines Polytropic Efficiency
%Formulas taken from Rocket Propulsion Elements, 9th, Sutton & Biblarz.
clear;clc;close all;

gamma = 1.4; 
T01 = 1; 
ve = 0.3833;
PeP01 = 0.75; 
cp = 3.5; 
n_pe = polytropicEff(gamma,ve,cp,T01,PeP01)

function n_pe = polytropicEff(g,ve,cp,T01,PeP01)
    term1 = g./(g-1);
    term2 = log(1-(ve.^2)./(2.*cp.*T01));
    term3 = log(PeP01);

    n_pe = term1.*term2.*(1./term3); 
end 