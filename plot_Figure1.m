%Script for Figure1 (a, b, c, and d)
%%
clc;clear;close all
load('../Data/Data-figure/Figure1a.mat');
figure;
plot(Dc_index, n_Dc, 'k', 'LineWidth', 1.2); 
hold on
xlim([0 300]);
xticks([0 100 200 300]);
ylim([0 1.1]);
yticks([0 0.25 0.5 0.75 1]);
xlabel('D_{c} (nm)','FontName','Arial','FontSize',10.5);
ylabel('Normalized n(D_c)','FontName','Arial','FontSize',10.5);
%ylim([0, 4e-3]);
grid off;
L1=legend('D_c distribution');
set(L1,'Box','off','Location','East','FontSize',10.5)
set(L1,'linewidth',1.5);
set(gca,'Position',[.18 .18 .75 .75]);
set(gca,'xminortick','on');
tickLength = [0.02, 0.03]; 
set(gca, 'TickLength', tickLength);
set(gca,'linewidth',0.8);
set(gcf, 'unit', 'centimeters', 'position', [0 0 7.5 6.5]);
print('-r1000','-dpng','../Figure/Figure1/Figure1a.png');
%%
clc;clear;close all;
load('../Data/Data-figure/Figure1b.mat');
figure;
plot(CT_index, n_CT, 'k', 'LineWidth', 1.2); 
hold on
xlim([0 300]);
xticks([0 100 200 300]);
ylim([0 1.1]);
yticks([0 0.25 0.5 0.75 1]);
xlabel('CT (nm)','FontName','Arial','FontSize',10.5);
ylabel('Normalized n(CT)','FontName','Arial','FontSize',10.5);
grid off;
L1=legend('CT distribution');
set(L1,'Box','off','Location','East','FontSize',10.5)
set(gca,'xminortick','on');
tickLength = [0.02, 0.03]; 
set(gca, 'TickLength', tickLength);
set(gca,'linewidth',0.8);
set(gca,'Position',[.18 .18 .75 .75]);
set(gcf, 'unit', 'centimeters', 'position', [0 0 7.5 6.5]);
print('-r1000','-dpng','../Figure/Figure1/Figure1b.png');

%%
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
%%
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