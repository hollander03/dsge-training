function residual = static_resid(T, y, x, params, T_flag)
% function residual = static_resid(T, y, x, params, T_flag)
%
% File created by Dynare Preprocessor from .mod file
%
% Inputs:
%   T         [#temp variables by 1]  double   vector of temporary terms to be filled by function
%   y         [M_.endo_nbr by 1]      double   vector of endogenous variables in declaration order
%   x         [M_.exo_nbr by 1]       double   vector of exogenous variables in declaration order
%   params    [M_.param_nbr by 1]     double   vector of parameter values in declaration order
%                                              to evaluate the model
%   T_flag    boolean                 boolean  flag saying whether or not to calculate temporary terms
%
% Output:
%   residual
%

if T_flag
    T = basicrbc2015_est.static_resid_tt(T, y, x, params);
end
residual = zeros(10, 1);
    residual(1) = (y(1)) - ((1-T(2))*y(2)+T(2)*y(4));
residual(2) = 1/params(5)*y(6);
    residual(3) = (y(2)*params(5)) - (y(1)-y(3));
    residual(4) = (y(6)) - ((y(1)-y(5))*params(1)*1/T(1));
    residual(5) = (y(5)) - ((1-params(3))*y(5)+params(3)*y(4));
    residual(6) = (y(1)) - (y(7)+params(1)*y(5)+y(3)*(1-params(1)));
    residual(7) = (y(7)) - (y(7)*params(4)+x(1));
    residual(8) = (y(8)) - (params(7));
residual(9) = y(9);
residual(10) = y(10);

end
