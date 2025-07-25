function g1 = dynamic_g1(T, y, x, params, steady_state, it_, T_flag)
% function g1 = dynamic_g1(T, y, x, params, steady_state, it_, T_flag)
%
% File created by Dynare Preprocessor from .mod file
%
% Inputs:
%   T             [#temp variables by 1]     double   vector of temporary terms to be filled by function
%   y             [#dynamic variables by 1]  double   vector of endogenous variables in the order stored
%                                                     in M_.lead_lag_incidence; see the Manual
%   x             [nperiods by M_.exo_nbr]   double   matrix of exogenous variables (in declaration order)
%                                                     for all simulation periods
%   steady_state  [M_.endo_nbr by 1]         double   vector of steady state values
%   params        [M_.param_nbr by 1]        double   vector of parameter values in declaration order
%   it_           scalar                     double   time period for exogenous variables for which
%                                                     to evaluate the model
%   T_flag        boolean                    boolean  flag saying whether or not to calculate temporary terms
%
% Output:
%   g1
%

if T_flag
    T = basicNKM.dynamic_g1_tt(T, y, x, params, steady_state, it_);
end
g1 = zeros(14, 23);
g1(1,4)=1;
g1(1,5)=(-1);
g1(2,5)=1;
g1(2,18)=(-1);
g1(2,7)=T(1);
g1(3,5)=(-(params(3)/params(4)));
g1(3,6)=1;
g1(3,8)=params(1)*1/params(4);
g1(4,7)=(-1);
g1(4,8)=1;
g1(4,19)=(-1);
g1(5,9)=1;
g1(5,19)=(-params(1));
g1(5,10)=(-((1-params(6))*(1-params(6)*params(1))/params(6)));
g1(5,13)=(-1);
g1(6,4)=(-(params(3)+params(5)));
g1(6,10)=1;
g1(6,12)=1+params(5);
g1(7,10)=1;
g1(7,11)=1;
g1(8,1)=(-params(11));
g1(8,8)=1;
g1(8,9)=(-((1-params(11))*params(7)));
g1(8,17)=(-((1-params(11))*params(8)));
g1(8,23)=(-1);
g1(9,2)=(-params(9));
g1(9,12)=1;
g1(9,21)=(-1);
g1(10,3)=(-params(10));
g1(10,13)=1;
g1(10,22)=(-1);
g1(11,14)=1;
g1(11,15)=(-1);
g1(12,12)=(-(1+params(5)));
g1(12,14)=params(3)+params(5);
g1(13,15)=1;
g1(13,20)=(-1);
g1(13,16)=T(1);
g1(14,4)=(-1);
g1(14,14)=1;
g1(14,17)=1;

end
