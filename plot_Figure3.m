%Script for Figure3
clc;clear;close all;
load('../Data/Data-figure/Figure3.mat');
linestyle_list = ["-", "-.","--"];
color_list = [
    [0.69804 0.13333 0.13333 1]
    [0.3098 0.58039 0.80392 1]
    [128,0,128,255]/255
    [0,153,78,180]/255
    [9 2 250 180]/255
    [23 28 39 255]/255
    % [204,60,138,180]/255
    [255,102,0,100]/255
    ];

figure;
% m = 0.008, kc=0.45;
semilogx(X_list(1,:), Y_list(1,:), ...
    'color', color_list(1,:), ...
    'LineStyle',linestyle_list(2),'LineWidth', 1); 
hold on;
% m = 0.020, kc=0.15;
semilogx(X_list(4,:), Y_list(4,:),  ...
    'color', color_list(2,:), ...
    'LineStyle',linestyle_list(2),'LineWidth', 1); 
% SSenv = 0.05%; Zaveri_5; (x1,y15)
plot(x1,y15, ...
    'color', color_list(3,:), ...
    'LineStyle',linestyle_list(1),'LineWidth', 1,'Marker','o');
% SSenv = 0.1%, Wu_6; (x2,y26)
plot(x2,y26, ...
    'color', color_list(4,:), ...
    'LineStyle',linestyle_list(1),'LineWidth', 1,'Marker','d');
% SSenv = 0.1%, Hu_7 (x2,y27)
plot(x2,y27, ...
    'color', color_list(5,:), ...
    'LineStyle',linestyle_list(1),'LineWidth', 1,'Marker','+');
% SSenv = 0.2%, Yu_8 (x2,y28)
plot(x3,y38, ...
    'Color',color_list(6,:), ...
    'LineStyle',linestyle_list(1),'LineWidth',1,'Marker','*');
% SSenv = 0.1%, Tian_9 (x2,x29)
plot(x2,y29, ...
    'color', color_list(7,:), ...
    'LineStyle',linestyle_list(1),'LineWidth', 1,'Marker','s');

plot(x3,y35, ...
    'color', color_list(3,:), ...
    'LineStyle',linestyle_list(1),'LineWidth', 1,'Marker','o');
plot(x3,y36, ...
    'color', color_list(4,:), ...
    'LineStyle',linestyle_list(1),'LineWidth', 1,'Marker','d');
plot(x3,y37, ...
    'color', color_list(5,:), ...
    'LineStyle',linestyle_list(1),'LineWidth', 1,'Marker','+');
plot(x3,y39, ...
    'Color',color_list(7,:), ...
    'LineStyle',linestyle_list(1),'LineWidth',1,'Marker','s');
plot(x4,y47, ...
    'Color',color_list(5,:), ...
    'LineStyle',linestyle_list(1),'LineWidth',1,'Marker','+');
plot(x5,y55, ...
    'color', color_list(3,:), ...
    'LineStyle',linestyle_list(1),'LineWidth', 1,'Marker','o');


x_fill = [X_list(1,:) X_list(1,end:-1:1)]; 
y_fill = [Y_list(4,:),Y_list(1,end:-1:1)]; 
patch(x_fill, y_fill,'k','FaceAlpha',0.1,'EdgeColor','none');
L1=legend([label_list(1),label_list(4),label_list(5),label_list(6),label_list(7),label_list(8),label_list(9)]);
set(L1,'Box','off','Location','northwest','FontSize',7,'NumColumns',1);
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
set(gcf, 'units', 'centimeters', 'position', [0 0 10 7]);
print('-r1000','-dpng','../Figure/Figure3/Figure3_new.png');
