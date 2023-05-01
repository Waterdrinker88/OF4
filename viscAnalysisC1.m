%Nicholas Archon, nga425
%COE 347 - Introduction to Computational Fluid Dynamics
%OF4 - Viscous case
clear;clc;close all;
plotResolution = 500; 
% OF_Data = readmatrix('C:\Users\nick4\Desktop\OF4\26-4\case-2-cp2\DATA\exitProperites.csv');
OF_DataCell = readmatrix('C:\Users\nick4\Desktop\OF4\28-4\case-1\outletData_good.csv');
%velocity data 
UxRaw = OF_DataCell(:,10); 
UxRaw(end) = []; 


yPos = OF_DataCell(:,5); 
yPos(end) = [];
txt = 'Ux_vs.r2D';
figure('Name',txt);
plot(yPos,UxRaw,'-o');
title("$\textbf{Axial Velocity Magnitude vs Radial Position, case-1}$","$U_x$ vs. $r$",'Interpreter', 'LaTeX');
xlabel('$r$','Interpreter','latex')
ylabel('$U_x$','Interpreter','latex')
set(gca,'TickLabelInterpreter','latex')
obj = gcf;
filename = sprintf('C1-%03s.jpg', txt);
file = fullfile('C:\Users\nick4\Desktop\OF4\Visualisaitons', filename);
exportgraphics(obj, file,'Resolution',plotResolution); 
%filename = sprintf('Q7 %03s.svg', txt_PvsSpeedUp);
% saveas(obj,file,'svg')
%% surface plot
n = length(yPos);
theta = linspace(0,2*pi,n).';
x0 = yPos';
y0 = UxRaw';

x = x0.*cos(theta);
y = x0.*sin(theta);
z = repmat(y0,[n,1]);

txt = 'Ux_vs.r3D';
figure('Name',txt);
hh = surf(x,y,z,'edgecolor', 'none','FaceAlpha',0.75,"FaceColor", ...
    'interp',"FaceLighting", 'flat',"BackFaceLighting", 'lit');
%should also show a plot with edges/wireframe to show boundary layer


title("$\textbf{Axial Velocity Magnitude vs Radial Position, case-1}$","$U_x$ vs. $r$",'Interpreter', 'LaTeX');
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
obj = gcf;
filename = sprintf('C1-%03s.jpg', txt);
file = fullfile('C:\Users\nick4\Desktop\OF4\Visualisaitons', filename);
exportgraphics(obj, file,'Resolution',plotResolution); 


