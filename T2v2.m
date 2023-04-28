%Nicholas Archon, nga425
%COE 347 - Introduction to Computational Fluid Dynamics
%OF4 - Determines T2 and V2 as a function of npe
%Formulas taken from Rocket Propulsion Elements, 9th, Sutton & Biblarz.

T01 = 1; 
PeP01 = 0.16; 
g = 1.4; 
cp = 3.5; 
npe = 0:0.01:1; 
T2 = polytropicTemp(PeP01,g,npe,T01)
v2 = exitVelocity(cp, T01, T2)

plot(npe,v2,'DisplayName','v2')
hold on 
plot(npe,T2,'DisplayName','T2')

function T2 = polytropicTemp(PeP01,g,npe,T01)
    term1 = ((g-1).*npe)./g;
    T2 = T01.*PeP01.^term1;
end 

function v2 = exitVelocity(cp, T01, T2)
    v2 = sqrt(2.*cp.*(T01-T2));
end 