% Description of script
%   This script is designed to save data as ".mat" file that describe the distribution of black carbon-containing (BCc) particles. 

%   data of Figure 1c: Generates a visual representation of the number concentration distribution of BC particles, showing the relationship between CT (coating thickness) and Dc (BC core diameter).
%   data of Figure 1d: Generates a visual representation of the number concentration distribution of BC particles, showing the relationship between Dp,dry (dry particle diameter) and kappa (hygroscopicity parameter).
%   data of Figure 2a: Generates a visual representation of the number concentration distribution of BC particles, showing the relationship between Dp,dry (dry particle diameter) and kappa (hygroscopicity parameter).
%   data of Figure 2d: Generates a visual representation of the number adjusted to SP2

%% N(Dc,Dp) distribution
% parameters set 
N=1; % total number concentration
pi=3.14;
% Dc distribution parameters for figure1c N(Dc,Dp)
sigma_g=1.6;  
D_gn=90; % nm
k=0.016; % CT distribution parameters
% set grid(km,Dp)
Dc_bin = 10;
CT_bin = 10;
Dc =5:Dc_bin:300;
CT = 5:CT_bin:300; % nm
[Dc_grid, CT_grid] = meshgrid(Dc, CT); 

% Function: n(Dc,CT)
fun_Dc_CT=@(Dc,CT) k*N/((2*pi)^0.5*Dc*log(sigma_g))*...
    exp(-0.5*(log(Dc)-log(D_gn))^2/(log(sigma_g)^2))*...
    exp(-k*CT);
n_Dc_CT = arrayfun(fun_Dc_CT, Dc_grid, CT_grid);
n_Dc_CT = n_Dc_CT*abs(CT_bin*Dc_bin); % n(kappa,Dp)dDpdkappa
% mapminmax(n,0,1);
n_Dc_CT = (n_Dc_CT-min(min(n_Dc_CT)))/(max(max(n_Dc_CT))-min(min(n_Dc_CT)));
n_Dc_CT = n_Dc_CT(end:-1:1,:);
save('../Data/Data-figure/Figure1c.mat','n_Dc_CT');
%% N(kappa,Dp) of Model (PM)
clc;clear;close all;
%parameters
sigma_g=1.6;  
D_gn=90; % nm
k=0.016; % CT distribution parameters
kappa_c = 0.58; %Coating thickness parameter for hygroscopicity
n_Dp_kappa=func_distribution(k,kappa_c,sigma_g,D_gn);
save('../Data/Data-figure/Figure1d.mat','n_Dp_kappa');
%%
save('../Data/Data-figure/Figure2a.mat','n_Dp_kappa');
%%
sigma_g=1.5;  
D_gn=90; % nm
k=0.016; % CT distribution parameters
kappa_c = 0.58; %Coating thickness parameter for hygroscopicity
Dc_filter = 90;
Dp_filter = 120;
Z=func_distribution_forSP2(k,kappa_c,sigma_g,D_gn,Dp_filter,Dc_filter);
n_Dp_kappa = Z;
save('../Data/Data-figure/Figure2d_model_for_SP2.mat','n_Dp_kappa');

