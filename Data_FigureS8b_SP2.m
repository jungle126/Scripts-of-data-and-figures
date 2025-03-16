% Data of Figure S8: difference of figure2d-2e
clc;clear;close all;
% set grid(kappa,Dp) and the values of n(Dp,kappa)
% must be same as that if SScrit(Dp,kappa) in script "Data_of_figure2and3_SScrit_Dp_kappa.m"
kappa_bin=0.01;
Dp_bin=10;
kappa = 0.005:kappa_bin:1;
Dp = 5:Dp_bin:600; % nm
load('../Data/Data-figure/Figure2e_SP2.mat');
N_SP2 = N;
load('../Data/Data-figure/Figure2d_model_for_SP2.mat');
N_model = n_Dp_kappa;
N_dif = N_model-N_SP2;
save('../Data/Data-figure/FigureS8b_SP2_dif.mat','N_dif');