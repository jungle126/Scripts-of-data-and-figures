%Script for FigureS1
clc;clear;close all;
load('../Data/Data-figure/FigureS1.mat');

kappa_bin = 0:0.01:1;
kappa_mid = 0.005:0.01:1;
N= histcounts(kappac,kappa_bin);
frequency = N./sum(N);
kappac_avg = sum(kappac.*conc)/sum(conc);
kappac_max = max(kappac);
kappac_min = min(kappac);

%%
figure;
hold on
bar(kappa_mid,frequency,0.9,'stacked');
hold on
plot([kappac_avg,kappac_avg],[0,1],'r');
scatter(kappac_avg,0.25,'r*');
xlim([0.5,0.65]);
ylim([0 ,0.5]);
% xticks([0.0001 0.001 0.01]);
% xticklabels({'0.01%','0.1%','1%'});
yticks([0 0.25 0.5]);
yticklabels({'0','25%','50%'});
% xlabel('SS_{env}','FontName','Arial','FontSize',10.5);
xlabel('\kappa_{c}','FontName','Arial','FontSize',10.5);

ylabel('Frequency','FontName','Arial','FontSize',10.5);
box on;
% grid off;
% L1=legend('CT distribution');
% set(L1,'Box','off','Location','East','FontSize',7)
set(gca,'xminortick','on');
tickLength = [0.02, 0.03]; 
set(gca, 'TickLength', tickLength);
set(gca,'linewidth',0.8);
set(gcf, 'units', 'centimeters', 'position', [0 0 8.5 5]);
print('-r1000','-dpng','../Figure/FigureS1/FigureS1b.png');
%%
figure;
hold on
plot(kappac,'k');
plot([1 240],[kappac_max kappac_max],'r--');
plot([1 240],[kappac_min kappac_min],'b--');

xlim([0,240]);
ylim([0 ,1]);
xticks([0:120:240]);
% xticklabels({'0.01%','0.1%','1%'});
yticks([0 0.25 0.5 0.75 1]);
% yticklabels({'0','25%','50%'});
% xlabel('SS_{env}','FontName','Arial','FontSize',10.5);
xlabel('Simulation Time (hour)','FontName','Arial','FontSize',10.5);

ylabel('\kappa_{c}','FontName','Arial','FontSize',10.5);
box on;
% grid off;
% L1=legend('CT distribution');
% set(L1,'Box','off','Location','East','FontSize',7)
set(gca,'yminortick','on');
tickLength = [0.01, 0.01]; 
set(gca, 'TickLength', tickLength);
set(gca,'linewidth',0.8);
set(gcf, 'units', 'centimeters', 'position', [0 0 8.5 5]);
print('-r1000','-dpng','../Figure/FigureS1/FigureS1a.png');

