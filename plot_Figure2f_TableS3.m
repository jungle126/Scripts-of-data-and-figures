%Script for Figure2f+Table S3
clc;clear;close all;
load('../Data/Data-figure/Figure2f.mat');
%%
figure;
% plot(x, y, 'r', 'LineWidth', 1.2);
semilogx(X_model, Y_model, 'r-.', 'LineWidth', 1.2); 
% set(gca,'Xscale','log','Yscale','line');
hold on
semilogx(X_SP2, Y_SP2, 'k', 'LineWidth', 1.2); 

L1=legend(['Theoretical Model'],['SP2 Observation']);
set(L1,'Box','off','Location','NorthWest','FontSize',7)

xlim([0,0.01]);
ylim([0, 1]);
xticks([0.0001 0.001 0.01]);
xticklabels({'0.01%','0.1%','1%'});
yticks([0 0.5 1]);
yticklabels({'0','50%','100%'});
xlabel('SS_{env}','FontName','Arial','FontSize',10.5);
ylabel('AF','FontName','Arial','FontSize',10.5);
grid off;
% L1=legend('CT distribution');
% set(L1,'Box','off','Location','East','FontSize',7)
set(gca,'xminortick','on');
tickLength = [0.02, 0.03]; 
set(gca, 'TickLength', tickLength);
set(gca,'linewidth',0.8);
set(gcf, 'unit', 'centimeters', 'position', [0 0 6 6]);
print('-r1000','-dpng','../Figure/Figure2/Figure2f.png');

SS_thresholds = [1.0050, 1.0020, 1.0010];
X_model=X_model+1;
X_SP2=X_SP2+1;

for i = 1:length(SS_thresholds)
    SS_value = SS_thresholds(i);
    Fra_list(i,1) = Y_model(X_model(:) == SS_value);
    Fra_list(i,2) = Y_SP2(X_SP2(:) ==  SS_value);
end

% Table S3

disp(min(abs(Y_model- Y_SP2)))
disp(max(abs(Y_model- Y_SP2)))
disp(mean(abs(Y_model- Y_SP2)))
