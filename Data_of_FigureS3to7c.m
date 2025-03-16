% The number fraction of activation BCc particles as a function of environmental supersaturation 
% reveals discrepancies between the results under kappa_c assumption (same kappa_c for every particles) and benchmark condition (different kappa_c for all particles).
%  Requirements:
%   Distribution of BCc particles from model: "d_model"
%   Distribution of BCc particles from partMC-MOSAIC: "d_PM"
%   Distribution of SScrit(Dp,Kappa) : "SS"
clc;
clear;
load('../Data/Data-figure/Figure2_SScrit_Dp_kappa.mat', 'SS'); %fixed path

load('../Data/Data-figure/FigureS7a_samekappac.mat');
d_PM = N;
load('../Data/Data-figure/FigureS7b_diffkappac.mat');
d_PM2 = N;
[X_PM,Y_PM] = func_frac_SS(d_PM,SS);
[X_PM2,Y_PM2] = func_frac_SS(d_PM2,SS);
X_PM = X_PM-1;
X_PM2 = X_PM2-1;
save('../Data/Data-figure/FigureS7c.mat','X_PM2','Y_PM2','X_PM','Y_PM');