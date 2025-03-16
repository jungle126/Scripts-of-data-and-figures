% data of Figure S10
% AF(SSenv) under different size distribution of coating thickness and kappa_C of coating 
% different slope k 
clc;clear;close all;
load('../Data/Data-figure/Figure2_SScrit_Dp_kappa.mat', 'SS');
sigma_g = 1.6;
D_gn = 90;
k_list = [0.008  0.016 0.020];
kappa_c_list = [0.30];
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
            label_list = strcat("m = ", num2str(k_value), ", \kappa_c = ", num2str(kappa_c_value));
        else
            X_list = [X_list;X];
            Y_list = [Y_list;Y];
            label_list = [label_list; strcat("m = ", num2str(k_value), ", \kappa_c = ", num2str(kappa_c_value))];
        end
    end
end
X_list = X_list-1;


save('../Data/Data-figure/FigureS10a.mat','X_list','Y_list','label_list');

%%
% different kappa_c 
clc;clear;close all;
load('../Data/Data-figure/Figure2_SScrit_Dp_kappa.mat', 'SS');
sigma_g = 1.6;
D_gn = 90;
k_list = [0.016];
kappa_c_list = [0.1 0.3 0.5];
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
            label_list = strcat("m = ", num2str(k_value), ", \kappa_c = ", num2str(kappa_c_value));
        else
            X_list = [X_list;X];
            Y_list = [Y_list;Y];
            label_list = [label_list; strcat("m = ", num2str(k_value), ", \kappa_c = ", num2str(kappa_c_value))];
        end
    end
end
X_list = X_list-1;


save('../Data/Data-figure/FigureS10b.mat','X_list','Y_list','label_list');
