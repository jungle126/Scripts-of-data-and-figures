% The number fraction of activation BCc particles as a function of environmental supersaturation 
% reveals discrepancies between the theoretical model and previous studies.
%  Requirements:
%  Distribution of SScrit(Dp,Kappa) : "SS"
clc;clear;close all;
load('../Data/Data-figure/Figure2_SScrit_Dp_kappa.mat', 'SS');
sigma_g = 1.6;
D_gn = 90;
k_list = [0.008  0.020];
kappa_c_list = [0.45  0.15];
label_list = []; 
for i=1:length(k_list)
    k_value = k_list(i);
    for j=1:length(kappa_c_list)
        kappa_c_value = kappa_c_list(j);
        n_kappa_Dp= func_distribution(k_value,kappa_c_value,sigma_g,D_gn);
        [X,Y] = func_frac_SS(n_kappa_Dp,SS);
        if i==1 && j==1
            X_list = X;
            Y_list = Y;
            label_list = strcat("k = ", num2str(k_value), ", \kappa_c = ", num2str(kappa_c_value));
        else
            X_list = [X_list;X];
            Y_list = [Y_list;Y];
            label_list = [label_list; strcat("m = ", num2str(k_value), ", \kappa_c = ", num2str(kappa_c_value))];
        end
    end
end
X_list = X_list-1;
label_list(5) = "Simulated by Zaveri et al. (2010)";
label_list(6) = "Observed by Wu et al. (2019)";
label_list(7) = "Observed by Hu et al. (2021)";
label_list(8) = "Observed by Yu et al. (2022)";
label_list(9) = "Observed by Tian et al. (2024)";
% label_list(5) = "Simulated by Zaveri et al.";
% label_list(6) = "Observed by Wu et al.";
% label_list(7) = "Observed by Hu et al.";
% label_list(8) = "Observed by Yu et al.";
% label_list(9) = "Observed by Tian et al.";
%data
% x1: mean: SSenv=0.05%
% x2: 0.1%; x3: 0.2%; x4: 0.3%; x5: 0.5%
% y?5: Zaveri; y?6: Wu; y?7: Hu; y?8: Yu
x1 = [0.0005 0.0005];
y15 = [0.025 0.055];
x2 = [0.001 0.001];
y26 = [0.17 0.49];
y27 = [0.16 0.32];
y29 = [0.27 0.57];
x3 = [0.002 0.002];
y35 = [0.32 0.58];
y36 = [0.54 0.84];
y37 = [0.5 0.7];
y38 = [0.46 0.54];
y39 = [0.39 0.79];
x4 = [0.003 0.003];
y47 = [0.61 0.79];
x5 = [0.005 0.005];
y55 = [0.68 0.88];

save('../Data/Data-figure/Figure3.mat', ...
    'X_list','Y_list','label_list',...
    'x1', 'y15', ...
    'x2', 'y26', 'y27', 'y29', ...
    'x3', 'y35', 'y36', 'y37', 'y38', 'y39', ...
    'x4', 'y47', ...
    'x5', 'y55');

%%
