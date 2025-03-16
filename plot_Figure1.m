%Script for Figure1 (a, b, c, and d)
%%
clc;clear;close all
% Figure 1a：Dc distribution from SP2 and PartMC-MOSAIC(PM)
load('../Data/Data-figure/data_Figure1a_Dcdist_SP2.mat');
load('../Data/Data-figure/data_Figure1a_Dcdist_PM.mat');
% Color
colorList=[122,117,119;30,93,134]./255;
figure;
% SP2 and fiting line
plot(Dc_SP2_fit, SP2_nDc_fit, "Color",colorList(1,:), 'LineWidth', 1.2); %    
hold on
scatter(Dc_center_SP2(5:end),Nnorm_Dc_SP2(5:end),...
 10, colorList(1,:), 'MarkerFaceColor', colorList(1,:))
scatter(Dc_center_SP2(1:4),Nnorm_Dc_SP2(1:4),...
 10, colorList(1,:));%, 'MarkerFaceColor', colorList(1,:))

% PM and fitting line
plot(Dc_PM_fit, PM_nDc_fit,"Color",colorList(2,:) , 'LineWidth', 1.2); %    
scatter(Dc_center_PM,Nnorm_Dc_PM,10,...
    colorList(2,:), 'MarkerFaceColor', colorList(2,:)); % red points
set(gca, 'XScale', 'log');
xlim([0 300]);
xticks([0 1 10 100]);
ylim([0 1.51]);
yticks([0  0.5  1 1.5]);
xlabel('D_{c} (nm)','FontName','Arial','FontSize',10.5);
ylabel('Normalized n_1(D_c)','FontName','Arial','FontSize',10.5);
%ylim([0, 4e-3]);
grid off;
L1=legend('D_{gn} = 90 nm, \sigma_g = 1.5','SP2 (D_c > 90 nm)','SP2 (D_c \leq 90 nm)','D_{gn} = 90 nm, \sigma_g = 1.6','PartMC-MOSAIC');
set(L1,'Box','off','Location','NorthWest','FontSize',9);
set(L1,'linewidth',1.5);
set(gca,'Position',[.18 .18 .75 .75]);
set(gca,'xminortick','on');
tickLength = [0.02, 0.03]; 
set(gca, 'TickLength', tickLength);
set(gca,'linewidth',0.8);
set(gcf, 'unit', 'centimeters', 'position', [0 0 7.5 6.5]);
print('-r1000','-dpng','../Figure/Figure1/newFigure1a.png');
%%
clc;clear;close all;
load('../Data/Data-figure/data_Figure1b_CTdist_SP2.mat');
load('../Data/Data-figure/data_Figure1b_CTdist_PM.mat');
colorList=[122,117,119;30,93,134]./255;
figure;
% SP2 and fitting line
plot(CT_SP2_fit, SP2_nCT_fit, "Color",colorList(1,:), 'LineWidth', 1.2); %    
hold on
scatter(CT_center_SP2(4:end),lnnCT_SP2(4:end),...
 10, colorList(1,:), 'MarkerFaceColor', colorList(1,:));
scatter(CT_center_SP2(1:3),lnnCT_SP2(1:3),...
 10, colorList(1,:));%, 'MarkerFaceColor', colorList(1,:))
% PM and fitting line
% plot(CT_PM_fit, PM_nCT_fit,"Color",colorList(2,:) , 'LineWidth', 1.2); %    
scatter(CT_center_PM,lnnCT_PM,10,...
    colorList(2,:), 'MarkerFaceColor', colorList(2,:)); % red points
xlim([0 300]);
xticks([0 100 200 300]);
ylim([-8 0]);
% yticks([0 0.25 0.5 0.75 1]);
xlabel('CT (nm)','FontName','Arial','FontSize',10.5);
ylabel('ln(n(CT))','FontName','Arial','FontSize',10.5);
grid off;
L1=legend('m = 0.016 nm^{-1}','SP2 (CT > 30 nm)','SP2 (CT \leq 30 nm)','PartMC-MOSAIC');
set(L1,'Box','off','Location','NorthEast','FontSize',9);
set(gca,'xminortick','on');
tickLength = [0.02, 0.03]; 
set(gca, 'TickLength', tickLength);
set(gca,'linewidth',0.8);
set(gca,'Position',[.18 .18 .75 .75]);
set(gcf, 'unit', 'centimeters', 'position', [0 0 7.5 6.5]);
print('-r1000','-dpng','../Figure/Figure1/newFigure1b.png');

%% Figure 1c
clc;clear;close all;
load('../Data/Data-figure/Figure1c.mat');
% plot part
figure;
imagesc(n_Dc_CT);
shading flat %interp; % color smooth

colormap(nclCM(172,128));
% colormap(nclCM(232,128));
cb=colorbar; % add colorbar
cb.Ticks = [0 0.25 0.5 0.75 1];
cb.TickLabels = {'0', '0.25', '0.5', '0.75', '1'};
set(get(cb,'title'),'string','Normalized n(D_c,CT)');
% set(get(cb,'title'),'string','n(\kappa,D_{p,dry}) d\kappadD_{p,dry} (m^{-3})');
set(cb,'linewidth',0.8);
set(cb,'FontSize',7);
xticks([1 10 20 30]);
yticks([1 10 20 30]);
xticklabels({'0','100','200','300'});
yticklabels({ '300' ,'200' ,'100', ''});
ylabel('CT (nm)','FontName','Arial','FontSize',10.5); % 
xlabel('D_c (nm)','FontName','Arial','FontSize',10.5); % 
tickLength = [0.02, 0.03]; 
% set(gca,'Position',[.18 .18 .75 .75]);
set(gca, 'TickLength', tickLength);
set(gca,'linewidth',0.8);
set(gca,'Position',[.15 .18 .60 .74]);
set(gcf, 'unit', 'centimeters', 'position', [0 0 8.5 7]);
print('-r1000','-dpng','../Figure/Figure1/Figure1c.png');
%% Figure 1d
clear; clc;close all;
load('../Data/Data-figure/Figure1d.mat');
figure;
imagesc(n_Dp_kappa);
hold on;
colormap(nclCM(172,128));
cb=colorbar; % add colorbar
cb.Ticks = [0 0.25 0.5 0.75 1];
cb.TickLabels = {'0', '0.25', '0.5', '0.75', '1'};
set(get(cb,'title'),'string','Normalized n(\kappa,D_{p,dry})');
set(cb,'linewidth',0.8);
set(cb,'FontSize',7);
yticks([1 25 50 75 100]);
yticklabels({'1','0.75','0.5','0.25','0'});
ylabel('\kappa','FontSize',10.5);
xticks([1 20 40 60]);
xticklabels({'' '200' '400' '600'});
xlabel('D_{p,dry} (nm)','FontSize',10.5);
tickLength = [0.02, 0.03]; 
set(gca, 'TickLength', tickLength);
set(gca,'linewidth',0.8);
set(gca,'Position',[.15 .18 .60 .74]);
set(gcf, 'unit', 'centimeters', 'position', [0 0 8.5 7]);
print('-r1000','-dpng','../Figure/Figure1/Figure1d.png');