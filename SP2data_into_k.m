function [k,R2] = SP2data_into_k(Dc_list,Dp_list)
    CT_list = Dp_list-Dc_list;

    CT_edge = 0:10:600; % CT edge setting
    CT_center = (CT_edge(1:end-1) + CT_edge(2:end))/2; % CT center setting
    n_CT = histcounts(CT_list,CT_edge,"Normalization","probability");
    ln_n_CT = log(n_CT);
    validIndices = ~isinf(ln_n_CT);
    ln_n_CT=ln_n_CT(validIndices);
    CT_center=CT_center(validIndices);
    p = polyfit(CT_center(4:end), ln_n_CT(4:end), 1);
    x = CT_center(4:end);
    y = ln_n_CT(4:end);
    yy = polyval(p,x);
    yy = yy;
    R2 = 1-sum((y-yy).^2)/sum((y-mean(y)).^2);
    k = p(1);
    k =abs(k);
end