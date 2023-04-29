%Nicholas Archon, nga425
%COE 347 - Introduction to Computational Fluid Dynamics
%OF4 - Viscous case
clear;clc;close all;
% OF_Data = readmatrix('C:\Users\nick4\Desktop\OF4\26-4\case-2-cp2\DATA\exitProperites.csv');
OF_DataCell = readmatrix('C:\Users\nick4\Desktop\OF4\26-4\case-2-cp2\DATA\exitProperitesSegmentCenter.csv');
%velocity data 
UxRaw = OF_DataCell(:,10); 
UxRaw(end) = []; 
% Ux = rmmissing(UxRaw)
% a = linspace(0,1,length(Ux)); 

yPos = OF_DataCell(:,5); 
yPos(end) = [];
txt = 'Ux_vs.r2D';
figure('Name',txt);
plot(yPos,UxRaw,'-o');
title("$\textbf{Axial Velocity Magnitude vs Radial Position}$","$U_x$ vs. $r$",'Interpreter', 'LaTeX');
xlabel('$r$','Interpreter','latex')
ylabel('$U_x$','Interpreter','latex')
set(gca,'TickLabelInterpreter','latex')




%% surface plot
n = length(yPos);
theta = linspace(0,2*pi,n).';
x0 = yPos';
y0 = UxRaw';

x = x0.*cos(theta);
y = x0.*sin(theta);
z = repmat(y0,[n,1]);

% surf(x,y,z,'edgecolor', 'none','FaceAlpha',0.4)txt = 'Ux_vs.r';
txt = 'Ux_vs.r';
figure('Name',txt);
hh = surf(x,y,z,'edgecolor', 'none','FaceAlpha',0.75,"FaceColor", ...
    'interp',"FaceLighting", 'flat',"BackFaceLighting", 'lit');
%should also show a plot with edges/wireframe to show boundary layer


title("$\textbf{Axial Velocity Magnitude vs Radial Position}$","$U_x$ vs. $r$",'Interpreter', 'LaTeX');
xlabel('r','Interpreter','latex')
ylabel('r','Interpreter','latex')
zlabel('$U_x$','Interpreter','latex')

set(gca,'TickLabelInterpreter','latex')
colormap("turbo")

light               % create a light
lighting gouraud    % preferred method for lighting curved surfaces
box off;
grid off;
axis equal;
hAxis = gca;
hAxis.XRuler.FirstCrossoverValue  = 0; % X crossover with Y axis
hAxis.XRuler.SecondCrossoverValue  = 0; % X crossover with Z axis
hAxis.YRuler.FirstCrossoverValue  = 0; % Y crossover with X axis
hAxis.YRuler.SecondCrossoverValue  = 0; % Y crossover with Z axis
hAxis.ZRuler.FirstCrossoverValue  = 0; % Z crossover with X axis
hAxis.ZRuler.SecondCrossoverValue = 0; % Z crossover with Y axis
