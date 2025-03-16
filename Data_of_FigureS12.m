
clc;clear;close all;
datapath = '../data/';
savepath = '../data/data-Figure/';
inputmat = 'SP2_proc_combine_BC_NJ04_DcDp.mat'; %
savemat = 'FigureS12_k_VFc.mat'; %
% set the first date and days
start_date = datetime('01-4月-2020'); % start day
duration_days = 32; % set 32 ays
% D_gn=89; % changeaccording to FigureS1
% sigma_g=1.43; % change according to FigureS1
% Dc_min=100; % Dc filter from 100 nm
% Dc_bin=10;
% Dc_max=600;
% CT_min=0;
% CT_bin=10;
% CT_max=600;

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

k_SP2 = zeros(1,duration_days);
VFc_SP2 = zeros(1,duration_days);
for i = 1:duration_days
    % cell is empty?
    if ~isempty(Dc_day{i}) && ~isempty(Dp_day{i})
        % 
        [k,VFc_i] = SP2data_Modelinput(Dc_day{i}, Dp_day{i});
        disp(i)
        k_SP2(i) = k;
        VFc_SP2(i) = VFc_i;
    else
        % NaN
        VFc_SP2(i) = NaN;
        k_SP2(i) = NaN;
    end
end
k_SP2 = abs(k_SP2);
VFc_SP2 = VFc_SP2(~isnan(VFc_SP2));
k_SP2 = k_SP2(~isnan(k_SP2));
pn=polyfit(VFc_SP2,k_SP2,1);
k_pred = polyval(pn,VFc_SP2);
R2 = 1-sum((k_SP2-k_pred).^2)/sum((k_SP2-mean(k_SP2)).^2);

save([savepath,savemat],'VFc_SP2','k_SP2',...
    'k_pred','R2');

