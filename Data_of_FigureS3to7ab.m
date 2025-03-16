% Description of script
%   This script is designed to save data as ".mat" file that describe the distribution 
%   of black carbon-containing (BCc) particles. 

%   data for Figure S7a£ºcore-shell (same kappa_c)
%   data for Figure S7b £ºvolume mixed kappa (different kappa_c)


clc;
clear;
load('../Data/FigureS7_meankappac.mat')
kc= sum(kappac.*conc)/sum(conc);
pi=3.14;
fun_km_Dp_Dc=@(Dp,Dc) kc.*(1-(Dc./Dp).^3); % function: km(Dp,Dc) under a constant kappa_c


% load data
load('../Data/FigureS7_DcDpConcKappa.mat');
% do filter Dc>0 and CT>0
condition = Dc > 0 & Dc < Dp; % filter BCc paticles
Conc = Conc(condition);
Dp = Dp(condition);
Dc = Dc(condition);
% % Figure S7b £ºdifferent kappa for particles (volume-weight method)
% kappa = kappa(condition); 

% data for Figure S7a£ºsame kappa for coating (core-shell) 
kappa = fun_km_Dp_Dc(Dp, Dc); % set a constant kappa_c

% get the distribution of n(Dp,kappa)
kappa_bin=0.01;
Dp_bin=10;
Yedges = 0:kappa_bin:1;
Xedges = 0:Dp_bin:600;
N = zeros(length(Yedges)-1,length(Xedges)-1);
for n = 1:length(Conc)
    Dpn=Dp(n);
    kappan=kappa(n);
    Concn = Conc(n);
    for i=2:length(Yedges)
        Y_min=Yedges(i-1);
        Y_max=Yedges(i);
        if (Y_min<kappan)&&(kappan<=Y_max)
            for j = 2:length(Xedges)
                X_min=Xedges(j-1);
                X_max=Xedges(j);
                if (X_min<Dpn)&&(Dpn<=X_max)
                    N(i-1,j-1)=N(i-1,j-1)+Concn;
                end
            end
        end
    end
end
%  histogram2   hist.BinCounts: x(kappa):0to1,y(Dp):600to0
N = N/abs(kappa_bin*Dp_bin); % n(kappa,Dp)=N/dkm_bin/dDp_bin
N = (N-min(min(N)))/(max(max(N))-min(min(N)));
N = N(end:-1:1, :);
% % data for Figure S2b £ºvolume mixed kappa (different kappa_c)
% save('../Data/Data-figure/FigureS7b_diffkappac.mat','N');

% data for Figure S7a£ºcore-shell (same kappa_c)
save('../Data/Data-figure/FigureS7a_samekappac.mat','N');