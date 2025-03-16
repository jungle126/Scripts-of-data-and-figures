function [k,VFc] = SP2data_Modelinput(Dc_list,Dp_list)
Size_cell = size(Dc_list);
N = Size_cell(1);
V_BC_particle=pi.*Dc_list.^3/6;
V_P_particle = pi.*Dp_list.^3/6;
V_BC_sum = sum(V_BC_particle)*1e-27; %nm^3->m*3
V_C_sum = sum(V_P_particle)*1e-27-V_BC_sum;
VFc = V_C_sum/(V_C_sum+V_BC_sum);
CT_list = Dp_list-Dc_list;

CT_edge = 0:10:600; % CT edge setting
CT_center = (CT_edge(1:end-1) + CT_edge(2:end))/2; % CT center setting
n_CT = histcounts(CT_list,CT_edge,"Normalization","probability");
ln_n_CT = log(n_CT);
validIndices = ~isinf(ln_n_CT);
ln_n_CT=ln_n_CT(validIndices);
CT_center=CT_center(validIndices);
p = polyfit(CT_center(4:end), ln_n_CT(4:end), 1);
k = p(1);
k =abs(k);
end

