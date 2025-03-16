%% Figure S9: AF(time)
clear;clc;close all;
load('../Data/Data-figure/FigureS9_AF_time.mat')
colorList=[255,48,48;30,93,134]./255;
figure;
plot(1:30,NFreal_daySS5, ...
    "Color",colorList(1,:), 'LineWidth', 1.2,'LineStyle','-');
hold on;
plot(1:30,NFpred_daySS5, ...
    "Color",colorList(1,:), 'LineWidth', 1.2,'LineStyle','--');
plot(1:30,NFreal_daySS1, ...
    "Color",colorList(2,:), 'LineWidth', 1.2,'LineStyle','-');
plot(1:30,NFpred_daySS1, ...
    "Color",colorList(2,:), 'LineWidth', 1.2,'LineStyle','--');
% scatter(1:duration_days,1-R2_day,10, 'r', 'MarkerFaceColor', 'r')
xlim([0 31]);
xticks(1 :30);
% xticklabels(["2020/4/1";'';'';'';'';'';'';'';''; ...
%     "2020/4/10";'';'';'';'';'';'';'';'';'';...
%     "2020/4/20";'';'';'';'';'';'';'';'';'';"2020/4/30"])
xticklabels(["1 April, 2020";'';'';'';'';'';'';'';''; ...
    "10 April, 2020";'';'';'';'';'';'';'';'';'';...
    "20 April, 2020";'';'';'';'';'';'';'';'';'';"30 April, 2020"])
xtickangle(0);
ylim([0 1]);
yticks([0  0.5  1]);
yticklabels({'0','50%','100%'})
xlabel('Date','FontName','Arial','FontSize',10.5);
ylabel('AF','FontName','Arial','FontSize',10.5);
%ylim([0, 4e-3]);
grid off;
L1=legend('SP2 real at SS_{env} = 0.05 %', ...
    'Predictions at SS_{env} = 0.05 %', ...
    'SP2 real at SS_{env} = 0.1 %', ...
    'Predictions at SS_{env} = 0.1 %');
set(L1,'Box','off','Location','North','FontSize',9,'NumColumns', 2);
set(L1,'linewidth',1.5);
set(gca,'Position',[.10 .17 .80 .80]);
set(gca,'xminortick','off');
tickLength = [0.01, 0.015]; 
set(gca, 'TickLength', tickLength);
set(gca,'linewidth',0.8);
set(gcf, 'unit', 'centimeters', 'position', [0 0 15 5.5]);
print('-r1000','-dpng','../Figure/FigureS9/FigureS9.png');
print('-r1000','-dpng','../Figure/FigureR15/FigureR15e.png');

%%
figure;
scatter(1:30,R2_day,10, 'r', 'MarkerFaceColor', 'r')
hold on;
xlim([0 31]);
xticks(1 :30);
% xticklabels(["2020/4/1";'';'';'';'';'';'';'';''; ...
%     "2020/4/10";'';'';'';'';'';'';'';'';'';...
%     "2020/4/20";'';'';'';'';'';'';'';'';'';"2020/4/30"])
xticklabels(["1 April, 2020";'';'';'';'';'';'';'';''; ...
    "10 April, 2020";'';'';'';'';'';'';'';'';'';...
    "20 April, 2020";'';'';'';'';'';'';'';'';'';"30 April, 2020"])

xtickangle(0);
ylim([0.9 1]);
yticks([0.9 0.95 1]);
% yticklabels({'0.','0.5','1'})
xlabel('Date','FontName','Arial','FontSize',10.5);
ylabel('R^2','FontName','Arial','FontSize',10.5);
%ylim([0, 4e-3]);
grid off;
box on;
set(gca,'Position',[.10 .25 .80 .72]);
set(gca,'xminortick','off');
tickLength = [0.01, 0.015]; 
set(gca, 'TickLength', tickLength);
set(gca,'linewidth',0.8);
set(gcf, 'unit', 'centimeters', 'position', [0 0 15 4]);
print('-r1000','-dpng','../Figure/FigureR15/FigureR15d.png');