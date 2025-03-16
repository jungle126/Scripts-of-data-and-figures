% Data for time evolution of NF under SS()
clear,clc,close all;

% seperate into 30 days, meanwhile 4/5 and 4/25 lack data.
datapath = '../data/';
savepath = '../data/data-Figure/';
inputmat = 'SP2_proc_combine_BC_NJ04_DcDp.mat'; %
savemat = 'FigureS9_AF_time.mat'; %
% set the first date and days
start_date = datetime('01-4月-2020'); % start day
duration_days = 30; % set 30 ays
load([datapath,inputmat]);
filter_aged_index = data_cleaned.Dp>120 & data_cleaned.Dc > 90 & data_cleaned.Dp>data_cleaned.Dc;
data_cleaned = data_cleaned(filter_aged_index,:);

% 
Dc_day = cell(duration_days, 1);
Dp_day = cell(duration_days, 1);
% 
for day = 1:duration_days
    % initial and end time
    startOfTheDay = start_date  + days(day-1);
    endOfTheDay = start_date  + days(day) - seconds(1);
    filter_time_index = data_cleaned.Time >= startOfTheDay & data_cleaned.Time <= endOfTheDay;
    
    % get Dc and Dp
    Dc_day{day} = data_cleaned.Dc(filter_time_index);
    Dp_day{day} = data_cleaned.Dp(filter_time_index);
end
%% Set list of value
k_day = zeros(1,duration_days);
% SSenv=0.1%
NFreal_daySS1 = zeros(1,duration_days);
NFpred_daySS1 = zeros(1,duration_days);
% SSenv=0.2%
NFreal_daySS5 = zeros(1,duration_days);
NFpred_daySS5 = zeros(1,duration_days);
R2_day = zeros(1,duration_days);
%% Calculate
% get SS(kappa,Dp)
load('../Data/Data-figure/Figure2_SScrit_Dp_kappa.mat');
SS_dist = SS;
% set parameters (same with SP2 data)
D_gn = 90;
sigma_g = 1.5; 
kappa_c = 0.58; 
Dp_filter=120;
Dc_filter=90;
for i = 1:duration_days
    disp(i)
    % cell is empty?
    if ~isempty(Dc_day{i}) && ~isempty(Dp_day{i})
        % No. 1: calculate k
        [k,R2] = SP2data_into_k(Dc_day{i}, Dp_day{i});
        k_day(i)=k;
        R2_day(i)=R2;
        % No. 2: calculate NFpred  
        Np_dist = func_distribution_forSP2(k,kappa_c,sigma_g,D_gn,Dp_filter,Dc_filter);
        NFpred_daySS1(i) = NF_fromdist(Np_dist,SS_dist,1.001);
        NFpred_daySS5(i) = NF_fromdist(Np_dist,SS_dist,1.0005);
        % No. 3: calculate NFreal
        % N(kappa,Dp)
        N_dist = SP2_dist(Dc_day{i}, Dp_day{i},kappa_c);
        NFreal_daySS1(i) = NF_fromdist(N_dist,SS_dist,1.001);
        NFreal_daySS5(i) = NF_fromdist(N_dist,SS_dist,1.0005);

    else
        % NaN
        k_day(i) = NaN;
        NFreal_daySS1(i) = NaN;
        NFreal_daySS5(i) = NaN;
        NFpred_daySS1(i) = NaN;
        NFpred_daySS5(i) = NaN;
        R2_day(i)=NaN;
    end
end
save([savepath,savemat],'k_day','R2_day',...
    'NFreal_daySS1','NFreal_daySS5',...
    'NFpred_daySS1','NFpred_daySS5');

%% Get NF from N(kappa,Dp), SS(kappa,Dp), and SSenv
function NF = NF_fromdist(N_dist,SS_dist,SSenv)
    % set the sun=0
    temp_sum = 0;
    % every r
    for r = 1:size(SS_dist, 1)
        % find the col_index of where value less than SS_value
        col = find(SS_dist(r, :) <= SSenv);
        if ~isempty(col)
            % sum the total number
            temp_sum = temp_sum + sum(N_dist(r, col));
        end
    end
    % compute the fraction (%)
    NF = temp_sum/sum(sum(N_dist));
end

%% Get N(kappa,Dp) from k, Dgn, sigmag, and kappa_c
% function n_kappa_Dp= func_distribution(k,kappa_c,sigma_g,D_gn)


%% Get N(kappa,Dp) from Dc and Dp list and the kappa_c
function N_dist = SP2_dist(Dc_list,Dp_list,kappa_c)
    kappa_bin=0.01;
    Dp_bin=10;
    Yedges = 0:kappa_bin:1;
    Xedges = 0:Dp_bin:600;
    fun_km_Dp_Dc=@(Dp,Dc) kappa_c.*(1-(Dc./Dp).^3);
    kappa = fun_km_Dp_Dc(Dp_list, Dc_list);
    N= histcounts2(kappa,Dp_list,Yedges,Xedges);
    N = N/abs(kappa_bin*Dp_bin); % n(kappa,Dp)=N/dkm_bin/dDp_bin
    N = (N-min(min(N)))/(max(max(N))-min(min(N)));
    N = N(end:-1:1, :);
    N_dist=N;
end
%% Obtain k from the CT distribution
% [k,VFc] = SP2data_Modelinput(Dc_list,Dp_list)

