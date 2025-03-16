% Data of Figure S8: difference of figure2a-2b
clc;clear;close all;
% set grid(kappa,Dp) and the values of n(Dp,kappa)
% must be same as that if SScrit(Dp,kappa) in script "Data_of_figure2and3_SScrit_Dp_kappa.m"
kappa_bin=0.01;
Dp_bin=10;
kappa = 0.005:kappa_bin:1;
Dp = 5:Dp_bin:600; % nm
load('../Data/Data-figure/Figure2b_PartMC.mat');
N_PM = N;
load('../Data/Data-figure/Figure2a.mat');
N_model = n_Dp_kappa;
N_dif = N_model-N_PM;
save('../Data/Data-figure/FigureS8a_PM_dif.mat','N_dif');