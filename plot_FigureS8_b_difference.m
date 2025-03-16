
% Figure S8
clc;clear;close all;
load('../Data/Data-figure/FigureS8b_SP2_dif.mat');
figure;
imagesc(N_dif);
txt = 'Difference of model and SP2';
text(5,10,txt,'FontSize',7,'Color', 'k');

colormap(nclCM(156,20));
% colormap(nclCM(232,128));
cb=colorbar; % add colorbar
clim([-1,1]);
cb.Ticks = [-1 -0.5 0 0.5 1];
% cb.TickLabels = {'-1', '0',  '1'};
set(get(cb,'title'),'string','Normalized n(\kappa,D_{p,dry})');
% set(get(cb,'title'),'string','n(\kappa,D_{p,dry}) d\kappadD_{p,dry} (m^{-3})');
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
set(gcf, 'unit', 'centimeters', 'position', [0 0 7 6]);
print('-r1000','-dpng','../Figure/FigureS8/Figure8b_dif.png');

