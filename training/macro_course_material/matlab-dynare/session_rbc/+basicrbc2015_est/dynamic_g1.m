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
    T = basicrbc2015_est.dynamic_g1_tt(T, y, x, params, steady_state, it_);
end
g1 = zeros(12, 23);
g1(1,7)=1;
g1(1,8)=(-(1-T(2)));
g1(1,10)=(-T(2));
g1(1,17)=(-1);
g1(2,8)=1;
g1(2,19)=(-1);
g1(2,20)=1/params(7);
g1(2,18)=(-1);
g1(3,7)=(-1);
g1(3,8)=params(7);
g1(3,9)=1;
g1(4,7)=(-(params(1)*1/T(1)));
g1(4,3)=params(1)*1/T(1);
g1(4,12)=1;
g1(5,10)=(-params(3));
g1(5,3)=(-(1-params(3)));
g1(5,11)=1;
g1(6,7)=1;
g1(6,9)=(-(1-params(1)));
g1(6,3)=(-params(1));
g1(6,13)=(-1);
g1(7,4)=(-params(4));
g1(7,13)=1;
g1(7,21)=(-1);
g1(8,5)=(-params(5));
g1(8,17)=1;
g1(8,22)=(-1);
g1(9,6)=(-params(6));
g1(9,18)=1;
g1(9,23)=(-1);
g1(10,7)=(-1);
g1(10,14)=1;
g1(11,1)=1;
g1(11,8)=(-1);
g1(11,15)=1;
g1(12,2)=1;
g1(12,10)=(-1);
g1(12,16)=1;

end
