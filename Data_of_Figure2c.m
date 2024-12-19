% The number fraction of activation BCc particles as a function of environmental supersaturation 
% reveals discrepancies between the theoretical model and PartMC-MOSAIC simulation.
%  Requirements:
%   Distribution of BCc particles from model: "d_model"
%   Distribution of BCc particles from partMC-MOSAIC: "d_PM"
%   Distribution of SScrit(Dp,Kappa) : "SS"

clc;clear;close all;
load('../Data/Data-figure/Figure2_SScrit_Dp_kappa.mat', 'SS');
load('../Data/Data-figure/Figure2a_model.mat');
d_model = n_Dp_kappa;
load('../Data/Data-figure/Figure2b_PartMC.mat');
d_PM = N;
[X_model,Y_model] = func_frac_SS(d_model,SS);
[X_PM,Y_PM] = func_frac_SS(d_PM,SS);
X_model = X_model-1;
X_PM = X_PM-1;
save('../Data/Data-figure/Figure2c.mat','X_model','Y_model','X_PM','Y_PM');