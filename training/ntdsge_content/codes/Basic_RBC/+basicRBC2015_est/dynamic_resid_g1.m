function [residual, g1] = dynamic_resid_g1(T, y, x, params, steady_state, it_, T_flag)
% function [residual, g1] = dynamic_resid_g1(T, y, x, params, steady_state, it_, T_flag)
%
% Wrapper function automatically created by Dynare
%

    if T_flag
        T = basicrbc2015_est.dynamic_g1_tt(T, y, x, params, steady_state, it_);
    end
    residual = basicrbc2015_est.dynamic_resid(T, y, x, params, steady_state, it_, false);
    g1       = basicrbc2015_est.dynamic_g1(T, y, x, params, steady_state, it_, false);

end
