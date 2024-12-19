% Description of script
%   This script is designed to save data as ".mat" file that describe the SScrit(Dp,kappa) 
%   of black carbon-containing (BCc) particles. 

clc;clear;close all;
% set grid(km,Dp) must be same with the grid of n(Dp,kappa)
kappa_bin=0.01;
Dp_bin=10;
kappa = 0.995:-kappa_bin:0;
Dp = 5:Dp_bin:600; % nm
[Dp_grid,kappa_grid] = meshgrid(Dp,kappa);

% SS(km,Dp)
% get the matrix
SS = arrayfun(@(ki, Dp) fun_Si_ki_Dp(ki, Dp*1e-9), kappa_grid, Dp_grid); % Dp nm to m
save('../Data/Data-figure/Figure2_SScrit_Dp_kappa.mat','SS')

