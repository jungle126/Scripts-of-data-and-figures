function Si = fun_Si_ki_Dp(ki, Dp)
% Usage Description:
% This function, fun_Si_ki_Dp, calculates the smallest saturation ratio (Si) required for the cloud condensation nucleus (CCN) activation of a particle with a dry diameter (Dp) and hygroscopicity (ki). The function takes two input arguments:
% - ki: the hygroscopicity constant of the particle
% - Dp: the dry diameter of the particle
%
% The function returns two output values:
% - Dw: the wet diameter of the particle at the point of activation
% - Si: the saturation ratio at the point of activation
%
% To use this function, simply call it with the desired values of ki and Dp, like so:
% [Dw, Si] = fun_Si_ki_Dp(ki, Dp);
%
% Ensure that the input values are in consistent units (typically meters for diameter and dimensionless for ki).


    % Define symbolic variables Dw and a
    syms Dw a;
    
    % Given constant value for a (can be adjusted as needed)
    a = 2.12e-9; % a is a constant value related to the surface tension, molar mass, gas constant, temperature, and water density

    % Define the expression for Si as a function of Dw, Dp, ki, and a
    Si = (Dw^3 - Dp^3) / (Dw^3 - Dp^3 * (1 - ki)) * exp(a / Dw);

    % Compute the derivative of Si with respect to Dw
    df_Dw = diff(Si, Dw);

    % Solve for Dw where the derivative df_Dw equals zero
    solutions_Dw = solve(df_Dw == 0, Dw);

    % Initialize Dw
    Dw = [];

    % Iterate through the solutions to find a real and positive solution that is greater than Dp
    for i = 1:length(solutions_Dw)
        double_Dw = double(solutions_Dw(i));
        if isreal(double_Dw) && double_Dw > Dp
            Dw = double_Dw; % Select the first solution that meets the criteria
            break; % Exit the loop once a suitable Dw is found
        end
    end

    % If no suitable Dw is found, return empty values for Dw and Si
    if isempty(Dw)
        Si = [];
        return;
    end

    % Evaluate Si using the found Dw
    Si = double(subs(Si, Dw));
    %disp(Si)
end

