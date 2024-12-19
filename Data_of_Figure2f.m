% The number fraction of activation BCc particles as a function of environmental supersaturation 
% reveals discrepancies between the theoretical model and SP2 observation.
%  Requirements:
%   Distribution of BCc particles from model with the same range of SP2: "d_model"
%   Distribution of BCc particles from SP2: "d_SP2"
%   Distribution of SScrit(Dp,Kappa) : "SS"
clc;
clear;
close all;

load('../Data/Data-figure/Figure2_SScrit_Dp_kappa.mat', 'SS');
SS = SS;
load('../Data/Data-figure/Figure2d_model_for_SP2.mat');
d_model = n_Dp_kappa;
load('../Data/Data-figure/Figure2e_SP2.mat');
d_SP2 = N;
[X_model,Y_model] = func_frac_SS(d_model,SS);
[X_SP2,Y_SP2] = func_frac_SS(d_SP2,SS);
X_model = X_model-1;
X_SP2 = X_SP2-1;
save('../Data/Data-figure/Figure2f.mat','X_model','Y_model','X_SP2','Y_SP2');
