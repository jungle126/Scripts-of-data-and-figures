%Script for Figure S11a
clc;clear;close all;
load('../Data/Data-figure/FigureS11a.mat');
linestyle_list = ["-.", "-","--"];
color_list = [
    [66,138,201]/255
    [239,125,122]/255
    [0,144,146]/255
    ];

figure;
% plot(x, y, 'r', 'LineWidth', 1.2);
semilogx(X_list(1,:), Y_list(1,:),  'color', color_list(1,:), 'LineStyle',linestyle_list(1),'LineWidth', 1); 
hold on;
semilogx(X_list(2,:), Y_list(2,:),  'color', color_list(2,:), 'LineStyle',linestyle_list(2),'LineWidth', 1); 
semilogx(X_list(3,:), Y_list(3,:),  'color', color_list(3,:), 'LineStyle',linestyle_list(3),'LineWidth', 1); 

L1=legend([label_list(1),label_list(2),label_list(3)]);
set(L1,'Box','off','Location','NorthWest','FontSize',7);
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

set(gca,'xminortick','on');
tickLength = [0.02, 0.03]; 
set(gca, 'TickLength', tickLength);
set(gca,'linewidth',0.8);
set(gcf, 'units', 'centimeters', 'position', [0 0 8.5 7]);
print('-r1000','-dpng','../Figure/FigureS11/FigureS11a.png');
%%
%Script for Figure S4b
clc;clear;close all;
load('../Data/Data-figure/FigureS11b.mat');
linestyle_list = ["-.", "-","--"];
color_list = [
    [66,138,201]/255
    [239,125,122]/255
    [0,144,146]/255
    ];

figure;
% plot(x, y, 'r', 'LineWidth', 1.2);
semilogx(X_list(1,:), Y_list(1,:),  'color', color_list(1,:), 'LineStyle',linestyle_list(1),'LineWidth', 1); 
hold on;
semilogx(X_list(2,:), Y_list(2,:),  'color', color_list(2,:), 'LineStyle',linestyle_list(2),'LineWidth', 1); 
semilogx(X_list(3,:), Y_list(3,:),  'color', color_list(3,:), 'LineStyle',linestyle_list(3),'LineWidth', 1); 

L1=legend([label_list(1),label_list(2),label_list(3)]);
set(L1,'Box','off','Location','NorthWest','FontSize',7);
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

set(gca,'xminortick','on');
tickLength = [0.02, 0.03]; 
set(gca, 'TickLength', tickLength);
set(gca,'linewidth',0.8);
set(gcf, 'units', 'centimeters', 'position', [0 0 8.5 7]);
print('-r1000','-dpng','../Figure/FigureS11/FigureS11b.png');