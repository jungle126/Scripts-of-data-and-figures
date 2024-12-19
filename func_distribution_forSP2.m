function n_kappa_Dp_VSP2= func_distribution_forSP2(k,kappa_c,Dp_filter,Dc_filter)
%This function is used to get the number concentration distribution (n(kappa,Dp) adjusted to the size range of SP2
%Inputs:
% k: a parameter of coating thickness distribution of BC aerosols
% kappa_c: a constant, hygroscopicity parameter of coating components
% Dp_filter & Dc_filter: the size range of SP2
% Outputs:
% n_kappa_Dp: n(kappa,Dp)A matrix where each element corresponds to the normalized distribution of particles for a given kappa and Dp combination.

N=1;
pi=3.14;
% kappa_c=0.65;
sigma_g=1.6;
D_gn=89; %nm
% k=0.016;

% set grid(kappa,Dp) and the values of n(kappa,Dp)
kappa_bin=0.01;
Dp_bin=10;
kappa = 0.005:kappa_bin:1;
Dp = 5:Dp_bin:600; % nm
%[kappa_grid, Dp_grid] = meshgrid(kappa, Dp); %x: kappa; y: Dp
[Dp_grid,kappa_grid] = meshgrid(Dp,kappa); %x: Dp; y: kappa

% n(km,Dp) dkm dDp
fun_kappa_Dp=@(kappa,Dp) k*N/3/(2*pi)^0.5/(kappa_c-kappa)/log(sigma_g)*...
    exp(k*Dp*((1-kappa/kappa_c)^(1/3)-1)-(log(1-kappa/kappa_c)+3*log(Dp/D_gn))^2/18/(log(sigma_g))^2);

% get the matrix
Z = arrayfun(fun_kappa_Dp, kappa_grid, Dp_grid); % n(kappa,Dp)
Z(kappa_grid >= kappa_c) = 0;
% Z = Z*abs(kappa_bin*Dp_bin); % n(kappa,Dp)dDpdkappa
Z = (Z-min(min(Z)))/(max(max(Z))-min(min(Z)));
Z = Z(end:-1:1,:);
n_kappa_Dp_VSP2=Z;
n_kappa_Dp_VSP2(:,1:Dp_filter/10) = zeros(100,Dp_filter/10);
kappa_T = kappa(end:-1:1);
max_kappa_for_Dp = kappa_c.*(1-Dc_filter^3./Dp.^3);
for i=Dp_filter/10:length(n_kappa_Dp_VSP2(1,:))
    max_kappa = max_kappa_for_Dp(i);
    kappa_index = find(kappa_T > max_kappa);
        if ~isempty(kappa_index)
            % 
            n_kappa_Dp_VSP2(kappa_index,i)=0;
        end

end

