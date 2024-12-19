%Script for FigureS2b
close all;clc;clear;
% set grid(kappa,Dp) and the values of n(kappa,Dp)
kappa_bin=0.01;
Dp_bin=10;
kappa = 0.005:kappa_bin:1;
Dp = 5:Dp_bin:600; % nm

load('../Data/Data-figure/FigureS2b_diffkappac.mat');
N_PM = N;
load('../Data/Data-figure/Figure2_SScrit_Dp_kappa.mat', 'SS');
SS_thresholds = [1.005, 1.002, 1.001];

figure;
imagesc(N_PM);
hold on;
colorlist = [
    [1 1 1]
    [0 1 1]
    [0 1 0]
    ];

colormap(nclCM(172,128));
% colormap(nclCM(232,128));
cb=colorbar; % add colorbar
cb.Ticks = [0 0.25 0.5 0.75 1];
cb.TickLabels = {'0', '0.25', '0.5', '0.75', '1'};
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
set(gcf, 'unit', 'centimeters', 'position', [0 0 8.5 7]);
print('-r1000','-dpng','../Figure/FigureS2/FigureS2b.png');


