% The number fraction of activation BCc particles as a function of environmental supersaturation 
% reveals discrepancies between the theoretical model and previous studies.
%  Requirements:
%  Distribution of SScrit(Dp,Kappa) : "SS"
clc;clear;close all;
load('../Data/Data-figure/Figure2_SScrit_Dp_kappa.mat', 'SS');
sigma_g = 1.6;
D_gn = 89;
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
            label_list = [label_list; strcat("k = ", num2str(k_value), ", \kappa_c = ", num2str(kappa_c_value))];
        end
    end
end
X_list = X_list-1;
label_list(5) = "Zaveri et al. (2010)";
label_list(6) = "Wu et al. (2019)";
label_list(7) = "Tian et al. (2024)";
label_list(8) = "Hu et al. (2021)";
%data
x1 = [0.0005 0.0005];
y11 = [0.025 0.055];
x2 = [0.001 0.001];
y22 = [0.17 0.49];
y23 = [0.27 0.57];
y24 = [0.16 0.32];
x3 = [0.002 0.002];
y31 = [0.32 0.58];
y32 = [0.54 0.84];
y33 = [0.39 0.79];
y34 = [0.5 0.7];
x4 = [0.003 0.003];
y44 = [0.61 0.79];
x5 = [0.005 0.005];
y51 = [0.68 0.88];

save('../Data/Data-figure/Figure3.mat','X_list','Y_list','label_list','x1','y11',...
    'x2','y22','y23','y24','x3','y31','y32','y33','y34',...
    'x4','y44','x5','y51');

%%
