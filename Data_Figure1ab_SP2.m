% data for Figure 1ab
% SP2 Dc-dist. and CT-dist.
clc;
clear;
%load data
load('../Data/SP2_proc_combine_BC_NJ04_DcDp.mat');
% Obtain CT
data_cleaned.CT = data_cleaned.Dp-data_cleaned.Dc;
% delt CT=0 and Dc>90
data_cleaned = data_cleaned(data_cleaned.CT > 0, :);
data_cleaned = data_cleaned(data_cleaned.Dc > 90, :);
data_cleaned = data_cleaned(data_cleaned.Dp > 120, :);
CT_bin = 10;
CT_edge = 0:CT_bin:600; % CT edge setting
CT_center_SP2 = (CT_edge(1:end-1) + CT_edge(2:end))/2; % CT center setting
Nnorm_CT_SP2 = histcounts(data_cleaned.CT,CT_edge, ...
    "Normalization","probability"); % Normalization
lnnCT_SP2 = log(Nnorm_CT_SP2);

% fiting distribution and R2
x = CT_center_SP2;
y = lnnCT_SP2;
k=0.016;
fun_CT=@(CT) k*exp(-k*CT);
fit_y = arrayfun(fun_CT, x);
fit_y = fit_y/sum(fit_y);
fit_y = log(fit_y);

% R2 and k
SP2_R2=1 - sum( (fit_y(4:end)- y(4:end)).^2 )./ sum( (y(4:end) - mean(y(4:end))).^2 );
SP2_k = k;
% Fit distribution
CT_SP2_fit = x;
SP2_nCT_fit = fit_y;

save('../Data/Data-figure/data_Figure1b_CTdist_SP2.mat', ...
    'CT_center_SP2','lnnCT_SP2' ,...
    'CT_SP2_fit','SP2_nCT_fit', ...
    'SP2_k','SP2_R2');
%%
Dc_edge = 50:10:500; % Bounds of the interval for Dc after discretization
Dc_center_SP2 = (Dc_edge(1:end-1) + Dc_edge(2:end))/2;
h_counts = histcounts(data_cleaned.Dc,Dc_edge);
Nnorm_Dc_SP2 = (h_counts-min(h_counts))/(max(h_counts)-min(h_counts));
%% Dc distribution parameter of SP2
x = Dc_center_SP2(5:end);
y = Nnorm_Dc_SP2(5:end);

N=1; % total number concentration
sigma_g=1.5;  % Dc distribution parameters
D_gn=90; %nm

fun_NDc=@(Dc) N/((2*pi)^0.5*Dc*log(sigma_g)).*...
    exp(-0.5*(log(Dc)-log(D_gn))^2/(log(sigma_g)^2));

fit_y = arrayfun(fun_NDc, x);
fit_y = (fit_y-min(fit_y))/(max(fit_y)-min(fit_y));
% Dc distribution: sigma_g, Dgn, R2
SP2_R2=1 - sum( (fit_y- y).^2 )./ sum( (y - mean(y)).^2 );
SP2_sigmag = sigma_g;
SP2_Dgn = D_gn;

% fitLine of SP2_Dc-dist
Dc_bin = 1;
Dc_SP2_fit = 1:1:600;
% fitting of SP2
% Function: n(Dc)
SP2_nDc_fit = arrayfun(fun_NDc, Dc_SP2_fit);
SP2_nDc_fit = ...
    (SP2_nDc_fit-min(min(SP2_nDc_fit)))/(max(max(SP2_nDc_fit)) ...
    -min(min(SP2_nDc_fit)));

save('../Data/Data-figure/data_Figure1a_Dcdist_SP2.mat', ...
    'Dc_center_SP2','Nnorm_Dc_SP2', ...
    'Dc_SP2_fit','SP2_nDc_fit', ...
    'SP2_sigmag','SP2_Dgn','SP2_R2');


