% data for Figure 1ab
% PartMC-MOSAIC Dc-dist. and CT-dist.
clc;
clear;
%load data
load('../Data/PartMC_DcDpKappaConc_Particle.mat');
%% CT distribution
CT = Dp-Dc;
% delt CT=0(Bare BC) Dc=0 (scattering particles)
Dc = Dc(CT ~= 0);
Dp = Dp(CT ~= 0);
Conc = Conc(CT ~= 0);
CT = CT(CT ~= 0);

Dp = Dp(Dc ~= 0);
CT = CT(Dc ~= 0);
Conc = Conc(Dc ~= 0);
Dc = Dc(Dc ~= 0);

% CT edge setting
CT_bin=10;
CT_edge_PM = 0:CT_bin:600;
CT_center_PM = (CT_edge_PM(1:end-1) + CT_edge_PM(2:end))/2; % CT center setting
h_counts = zeros(1, length(CT_edge_PM) - 1);

% count 
for i = 1:length(CT)
    bin_idx = find(CT(i) >= CT_edge_PM(1:end-1) & CT(i) < CT_edge_PM(2:end));
    if ~isempty(bin_idx)
        h_counts(bin_idx) = h_counts(bin_idx) + Conc(i);
    end
end

% Normalization 
Nnorm_CT_PM = h_counts/sum(h_counts);
lnnCT_PM = log(Nnorm_CT_PM);

% calculate the R2 and determine the fiting distribution.
x = CT_center_PM;
y = lnnCT_PM;
k = 0.016;
fun_CT=@(CT) k*exp(-k*CT);
fit_y = arrayfun(fun_CT, x);
fit_y = fit_y/sum(fit_y);
fit_y = log(fit_y);
PM_R2=1 - sum( (fit_y- y).^2 )./ sum( (y - mean(y)).^2 );
PM_k = k;
% Fiting
CT_PM_fit = x;
PM_nCT_fit = fit_y;

save('../Data/Data-figure/data_Figure1b_CTdist_PM.mat', ...
    'CT_center_PM','lnnCT_PM', ...
    'CT_PM_fit','PM_nCT_fit', ...
    "PM_k","PM_R2");
%% Dc distribution
Dc_edge_PM = 0:10:500;
Dc_center_PM = (Dc_edge_PM(1:end-1) + Dc_edge_PM(2:end))/2;
h_counts = zeros(1, length(Dc_edge_PM) - 1);
for i = 1:length(Dc)
    bin_idx = find(Dc(i) >= Dc_edge_PM(1:end-1) & Dc(i) < Dc_edge_PM(2:end));
    if ~isempty(bin_idx)
        h_counts(bin_idx) = h_counts(bin_idx) + Conc(i);
    end
end

% Max-min normalization
Nnorm_Dc_PM = (h_counts-min(h_counts))/(max(h_counts)-min(h_counts));
% Dc distribution parameter of PM
x = Dc_center_PM;
y = Nnorm_Dc_PM;
N=1; % total number concentration
sigma_g=1.6;  % Dc distribution parameters
D_gn=90; %nm
fun_NDc=@(Dc) N/((2*pi)^0.5*Dc*log(sigma_g)).*...
    exp(-0.5*(log(Dc)-log(D_gn))^2/(log(sigma_g)^2));
fit_y = arrayfun(fun_NDc, x);
% Max-min normalization
fit_y = (fit_y-min(fit_y))/(max(fit_y)-min(fit_y));
PM_R2=1 - sum( (fit_y- y).^2 )./ sum( (y - mean(y)).^2 );
PM_sigmag = sigma_g;
PM_Dgn = D_gn;

% fitLine of PM_Dc-dist
Dc_bin = 1;
Dc_PM_fit = 1:1:600;
% fitting of PM
% Function: n(Dc)
PM_nDc_fit = arrayfun(fun_NDc, Dc_PM_fit);
PM_nDc_fit = ...
    (PM_nDc_fit-min(min(PM_nDc_fit)))/(max(max(PM_nDc_fit)) ...
    -min(min(PM_nDc_fit)));
save('../Data/Data-figure/data_Figure1a_Dcdist_PM.mat', ...
    'Dc_center_PM','Nnorm_Dc_PM', ...
    'Dc_PM_fit','PM_nDc_fit', ...
    'PM_R2','PM_Dgn','PM_sigmag');