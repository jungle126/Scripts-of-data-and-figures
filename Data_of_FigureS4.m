% data of Figure S4
% AF(SSenv) under different size distribution of BC-core 
% different D_gn 
clc;clear;close all;
load('../Data/Data-figure/Figure2_SScrit_Dp_kappa.mat', 'SS');
sigma_g_list = [1.6];
D_gn_list = [70 90 150];
k_value = 0.016 ;
kappa_c_value = 0.30;
label_list = []; 
for i=1:length(sigma_g_list)
    sigma_g = sigma_g_list(i);
    for j=1:length(D_gn_list)
        D_gn = D_gn_list(j);
        n_kappa_Dp= func_distribution(k_value,kappa_c_value,sigma_g,D_gn);
        [X,Y] = func_frac_SS(n_kappa_Dp,SS);
        if i==1 && j==1
            X_list = X;
            Y_list = Y;
            label_list = strcat("D_{gn} = ", num2str(D_gn), ", \sigma_g = ", num2str(sigma_g));
        else
            X_list = [X_list;X];
            Y_list = [Y_list;Y];
            label_list = [label_list; strcat("D_{gn} = ", num2str(D_gn), ", \sigma_g = ", num2str(sigma_g))];
        end
    end
end
X_list = X_list-1;


save('../Data/Data-figure/FigureS4a.mat','X_list','Y_list','label_list');

%%
% different sigma_g 
clc;clear;close all;
load('../Data/Data-figure/Figure2_SScrit_Dp_kappa.mat', 'SS');
sigma_g_list = [1.3 1.6 1.9];
D_gn_list = [90];
k_value = 0.016 ;
kappa_c_value = 0.30;
label_list = []; 
for i=1:length(sigma_g_list)
    sigma_g = sigma_g_list(i);
    for j=1:length(D_gn_list)
        D_gn = D_gn_list(j);
        n_kappa_Dp= func_distribution(k_value,kappa_c_value,sigma_g,D_gn);
        [X,Y] = func_frac_SS(n_kappa_Dp,SS);
        if i==1 && j==1
            X_list = X;
            Y_list = Y;
            label_list = strcat("D_{gn} = ", num2str(D_gn), ", \sigma_g = ", num2str(sigma_g));
        else
            X_list = [X_list;X];
            Y_list = [Y_list;Y];
            label_list = [label_list; strcat("D_{gn} = ", num2str(D_gn), ", \sigma_g = ", num2str(sigma_g))];
        end
    end
end
X_list = X_list-1;


save('../Data/Data-figure/FigureS4b.mat','X_list','Y_list','label_list');
