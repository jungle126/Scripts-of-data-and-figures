function [X_SS,Y_frac] = func_frac_SS(Z,SS)
%The function is used to combine with n(Dp,kappa) and SScrit(Dp,kappa) to capture how many BCc
%particles act as CCN under different  environmental supersaturations (SSenv)
%   input:
%   Z: distribution of BCc particles: n(Dp,kappa)
%   SS: distribution SScrit(Dp,kappa)

SS_thresholds = 1.00002:0.00002:1.01;
Sum_conc = zeros(1, length(SS_thresholds));
% Fraction of CCN
for i = 1:length(SS_thresholds)
    SS_value = SS_thresholds(i);
    % set the sun=0
    temp_sum = 0;
    % every r
    for r = 1:size(SS, 1)
        % find the col_index of where value less than SS_value
        col = find(SS(r, :) <= SS_value);
        if ~isempty(col)
            % sum the total number
            temp_sum = temp_sum + sum(Z(r, col));
        end
    end
    % compute the fraction (%)
    Sum_conc(i) = temp_sum/sum(sum(Z));
end
X_SS=SS_thresholds;
Y_frac=Sum_conc;
end

