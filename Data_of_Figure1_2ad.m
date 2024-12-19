% Description of script
%   This script is designed to save data as ".mat" file that describe the distribution of black carbon-containing (BCc) particles. 

%   data of Figure 1a: Generates a visual representation of the Dc distribution of BC particles, showing the relationship between Dc and number concentration.
%   data of Figure 1b: Generates a visual representation of the CT distribution of BC particles, showing the relationship between CT and number concentration.
%   data of Figure 1c: Generates a visual representation of the number concentration distribution of BC particles, showing the relationship between CT (coating thickness) and Dc (BC core diameter).
%   data of Figure 1d: Generates a visual representation of the number concentration distribution of BC particles, showing the relationship between Dp,dry (dry particle diameter) and kappa (hygroscopicity parameter).
%   data of Figure 2a: Generates a visual representation of the number concentration distribution of BC particles, showing the relationship between Dp,dry (dry particle diameter) and kappa (hygroscopicity parameter).
%   data of Figure 2d: Generates a visual representation of the number adjusted to SP2

clc;clear;close all;
%%
% parameters set 
N=1; % total number concentration
pi=3.14;
% Dc distribution parameters
sigma_g=1.6;  
D_gn=89; % nm
k=0.016; % CT distribution parameters
kappa_c = 0.58; %Coating thickness parameter for hygroscopicity

%%
% set Dc range
Dc_bin = 1;
Dc_index = 1:Dc_bin:600;
% Function: n(Dc)
fun_Dc=@(Dc) N/((2*pi)^0.5*Dc*log(sigma_g))*...
    exp(-0.5*(log(Dc)-log(D_gn))^2/(log(sigma_g)^2));
n_Dc = arrayfun(fun_Dc, Dc_index);
n_Dc = (n_Dc-min(min(n_Dc)))/(max(max(n_Dc))-min(min(n_Dc)));
save('../Data/Data-figure/Figure1a.mat','Dc_index','n_Dc');
%%
% set CT range
CT_bin = 1;
CT_index = 1:1:600;
% Function: n(CT)
fun_CT=@(CT) exp(-k*CT);
n_CT = arrayfun(fun_CT, CT_index);
n_CT = (n_CT-min(min(n_CT)))/(max(max(n_CT))-min(min(n_CT)));
save('../Data/Data-figure/Figure1b.mat','CT_index','n_CT');
%%
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
%%
n_Dp_kappa=func_distribution(k,kappa_c,sigma_g,D_gn);
save('../Data/Data-figure/Figure1d.mat','n_Dp_kappa');
%%
save('../Data/Data-figure/Figure2a.mat','n_Dp_kappa');
%%
Dc_filter = 90;
Dp_filter = 140;
Z=func_distribution_forSP2(k,kappa_c,Dp_filter,Dc_filter);
n_Dp_kappa = Z;
save('../Data/Data-figure/Figure2d.mat','n_Dp_kappa');

