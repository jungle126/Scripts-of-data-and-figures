% Description of script
%   This script is designed to save data as ".mat" file that describe the distribution 
%   of black carbon-containing (BCc) particles. 
%   n(Dp,kappa) of BCc particles from SP2 observation under core-shell assumption
clc;
clear;
pi=3.14;
kc=0.58;
fun_km_Dp_Dc=@(Dp,Dc) kc.*(1-(Dc./Dp).^3);
% load data
load('../Data/SP2_proc_combine_BC_NJ04_DcDp.mat');
data_cleaned.CT = data_cleaned.Dp-data_cleaned.Dc;
% delt CT=0
data_cleaned = data_cleaned(data_cleaned.CT > 0, :);
data_cleaned = data_cleaned(data_cleaned.Dc > 90, :);
data_cleaned = data_cleaned(data_cleaned.Dp > 140, :);

% calculate kappaa
data_cleaned.kappa = fun_km_Dp_Dc(data_cleaned.Dp, data_cleaned.Dc);
%%%
kappa_bin=0.01;
Dp_bin=10;
Yedges = 0:kappa_bin:1;
Xedges = 0:Dp_bin:600;
%  histogram2   hist.BinCounts: x(kappa):0to1,y(Dp):600to0
N= histcounts2(data_cleaned.kappa,data_cleaned.Dp,Yedges,Xedges);
N = N/abs(kappa_bin*Dp_bin); % n(kappa,Dp)=N/dkm_bin/dDp_bin
N = (N-min(min(N)))/(max(max(N))-min(min(N)));
N = N(end:-1:1, :);
save('../Data/Data-figure/Figure2e_SP2.mat','N');