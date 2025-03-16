clc;clear;close all;
% Figure S8 linear relationship of VFc and k
load('../data/data-Figure/FigureS12_k_VFc.mat');
colorList=[122,117,119;30,93,134]./255;
figure;
% SP2 and fiting line
scatter(VFc_SP2,k_SP2,...
 10, colorList(1,:), 'MarkerFaceColor', colorList(1,:));
hold on
plot(VFc_SP2, k_pred, "Color",'red', 'LineWidth', 1.2); %    
xlim([0.7 0.85]);
% xticks([0 1 10 100]);
ylim([0.01 0.025]);
% yticks([0  0.5  1 1.5]);
xlabel('VF_{coating}','FontName','Arial','FontSize',10.5);
ylabel('m (nm^{-1})','FontName','Arial','FontSize',10.5);
text(0.765,0.018,['R^2 = ',num2str(round(R2,2))]);
%ylim([0, 4e-3]);
grid off;
box on;
L1=legend('Daily results from SP2','Linear relationship');
set(L1,'Box','off','Location','NorthWest','FontSize',9);
set(L1,'linewidth',1.5);
set(gca,'Position',[.20 .20 .75 .75]);
set(gca,'xminortick','on');
tickLength = [0.02, 0.03]; 
set(gca, 'TickLength', tickLength);
set(gca,'linewidth',0.8);
set(gcf, 'unit', 'centimeters', 'position', [0 0 7.5 6.5]);
print('-r1000','-dpng','../Figure/FigureS12/FigureS12.png');
