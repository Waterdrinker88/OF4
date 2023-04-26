%Nicholas Archon, nga425
%COE 347 - Introduction to Computational Fluid Dynamics
%OF4 
clear;clc;close all;
%export parameters
plotResolution = 1000;
%mesh data 
nCells = 150000; 

steps = 23; 
processors = [1 2 4 8 16 32 64]; 
% N1data = [78.33 42.6 21.51 10.63 5.84 3.27 2.31]; %this is execution time
N1data_clockTime = [79 43 22 11 6 4 3];
N1processors = 1*processors;
N2data = 2; 
N2processors = 2*processors(end);
N4data = 1; 
N4processors = 4*processors(end);
N8data = 3; 
N8processors = 8*processors(end);
N16data = 3; 
N16processors = 16*processors(end);

collatedProcessors = [N1processors N2processors N4processors N8processors N16processors];
collatedData = [N1data_clockTime N2data N4data N8data N16data];
%everything = [collatedData' collatedProcessors']; NOT USING

T_P = (1/steps).*collatedData;
T1 = T_P(1);
speedUp = T1./T_P;
% plot(collatedProcessors,speedUp,'-dr','DisplayName', numCells);
plot(collatedProcessors,speedUp,'-dr');

% % % txt_PvsSpeedUp = 'P vs Speedup';
% % % figure('Name',txt_PvsSpeedUp);
% % % numCells = sprintf("Actual (%d Cells)",nCells);
% % % plot(collatedProcessors,speedUp,'-dr','DisplayName', numCells);
% % % xlabel('$P$','Interpreter', 'LaTeX');
% % % ylabel('$\frac{T(1)}{T(P)}$','Interpreter', 'LaTeX');
% % % xlim([0 N16processors]);
% % % ylim([0 N16processors]);
% % % set(gca,'TickLabelInterpreter','latex')
% % % title("\textbf{Number of Processors vs. Speedup}","$P$ vs. $\frac{T(1)}{T(P)}$",'Interpreter', 'LaTeX');
% % % legend('Interpreter','latex','Location','best');
% % % grid on 
% % % hold on 
% % % x = 0:0.1:N16processors; 
% % % y = x; 
% % % plot(x,y,'-k','DisplayName','100\% efficiency');
% % % plot(x,0.8*y,'--k','DisplayName','80\% efficiency');
% % % plot(x,0.6*y,'-.k','DisplayName','60\% efficiency');
% % % obj = gcf;
% % % filename = sprintf('Q7 %03s.jpg', txt_PvsSpeedUp);
% % % file = fullfile('C:\Users\nick4\Desktop\OF4\Practice\14-4\Report Data', filename);
% % % exportgraphics(obj, file,'Resolution',plotResolution); 
%filename = sprintf('Q7 %03s.svg', txt_PvsSpeedUp);
% saveas(obj,file,'svg')
%% efficiency 
efficiency = (1./collatedProcessors).*speedUp;
txt_PvsEfficiency = 'P vs Eff';
figure('Name',txt_PvsEfficiency);
plot(collatedProcessors,efficiency,'-square'); %unsure if should do loglog?? 
xlabel('$P$','Interpreter', 'LaTeX');
ylabel('$\%$ Efficiency','Interpreter', 'LaTeX');
set(gca,'TickLabelInterpreter','latex')
title("\textbf{Number of Processors vs. Efficiency}","$P$ vs. $\%$ Efficiency",'Interpreter', 'LaTeX');
grid on 
obj = gcf;
filename = sprintf('n-a %03s.jpg', txt_PvsSpeedUp);
file = fullfile('C:\Users\nick4\Desktop\OF4\Practice\14-4\Report Data', filename);
exportgraphics(obj, file,'Resolution',plotResolution); 
%filename = sprintf('Q7 %03s.svg', txt_PvsSpeedUp);
% saveas(obj,file,'svg')

Processors = string(collatedProcessors);
output = table(Processors',efficiency');
output.Properties.VariableNames = ["Processors","% Efficiency"];
tableTitle = txt_PvsEfficiency;
filename = sprintf('%03s.xlsb', tableTitle); 
file = fullfile('C:\Users\nick4\Desktop\OF4\Practice\14-4\Report Data', filename);
writetable(output,file);
