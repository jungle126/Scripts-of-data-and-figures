%Script for Figure2e

clc;clear;close all;
% set grid(kappa,Dp) and the values of n(kappa,Dp)
kappa_bin=0.01;
Dp_bin=10;
kappa = 0.005:kappa_bin:1;
Dp = 5:Dp_bin:600; % nm

% 
load('../Data/Data-figure/Figure2e_SP2.mat');
N_SP2 = N;
load('../Data/Data-figure/Figure2_SScrit_Dp_kappa.mat', 'SS');
SS_thresholds = [1.005, 1.002, 1.001];

figure;
imagesc(N_SP2);
hold on;
colorlist = [
    [1 0 0]
    [0 1 1]
    [0 1 0]
    ];
% 对每个Si阈值进行循环
for i = 1:length(SS_thresholds)
    SS_value = SS_thresholds(i);
    Dp_list = [];
    kappa_list = [];
    for j= 1:length(Dp)
        [row, col] = find(SS(:,j) <= SS_value);
        if isempty(row)
            continue;
        end
        kappa_values = max(kappa(row));
        Dp_values = Dp(j);
        Dp_list = [Dp_list, Dp_values];
        kappa_list = [kappa_list, kappa_values];
    end
    X_ss =  [min(Dp_list/10), Dp_list/10];
    Y_ss = [1,kappa_list*100];
    plot(X_ss,Y_ss, 'Color', colorlist(i,:),'DisplayName', ['SS_{crit} = ' num2str(SS_value)], 'LineWidth', 0.5);
    hold on;
end
% L1=legend(['SS_{crit} = ' num2str((SS_thresholds(1)-1)*100) ' %'],['SS_{crit} = ' num2str((SS_thresholds(2)-1)*100)  ' %'],...
%     ['SS_{crit} = ' num2str((SS_thresholds(3)-1)*100)  ' %']);
% set(L1,'Box','off','Location','NorthWest','FontSize',7)
txt = 'SP2 Observation';
text(20,10,txt,'FontSize',7,'Color', 'w');

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
set(gcf, 'unit', 'centimeters', 'position', [0 0 7 6]);
print('-r1000','-dpng','../Figure/Figure2/Figure2e.png');