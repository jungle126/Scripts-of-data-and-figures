%Script for FigureS7c
clc;clear;close all;
load('../Data/Data-figure/FigureS7c.mat');
figure;
semilogx(X_PM, Y_PM, 'b', 'LineWidth', 1.2); 
% set(gca,'Xscale','log','Yscale','line');
hold on
semilogx(X_PM2, Y_PM2, 'k', 'LineWidth', 1.2); 
hold on
L1=legend(['Results under \kappa_{c} simplification (same \kappa_{c} for all paticles)'],['Particle-resolved results (different \kappa_{c} for individual paticles)']);
% L1=legend(['Theoretical Model'],['Uniform coating components'],['Non-uniform coating components']);
set(L1,'Box','off','Location','NorthWest','FontSize',10.5)

xlim([0,0.01]);
ylim([0, 1]);
xticks([0.0001 0.001 0.01]);
xticklabels({'0.01%','0.1%','1%'});
yticks([0 0.5 1]);
yticklabels({'0','50%','100%'});
% xlabel('SS_{env}','FontName','Arial','FontSize',10.5);
xlabel('SS_{env}','FontName','Arial','FontSize',10.5);

ylabel('AF','FontName','Arial','FontSize',10.5);
grid off;
% L1=legend('CT distribution');
% set(L1,'Box','off','Location','East','FontSize',7)
set(gca,'xminortick','on');
tickLength = [0.02, 0.03]; 
set(gca, 'TickLength', tickLength);
set(gca,'linewidth',0.8);
set(gcf, 'units', 'centimeters', 'position', [0 0 17 6.5]);
print('-r1000','-dpng','../Figure/FigureS7/FigureS7c.png');

% Table in FigureS2
disp(min(abs(Y_PM2- Y_PM)))
disp(max(abs(Y_PM2- Y_PM)))
disp(mean(abs(Y_PM2- Y_PM)))
