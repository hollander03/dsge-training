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
    T = basicNKMtidy.dynamic_g1_tt(T, y, x, params, steady_state, it_);
end
g1 = zeros(17, 28);
g1(1,6)=1;
g1(1,7)=(-1);
g1(2,7)=1;
g1(2,23)=(-1);
g1(2,9)=T(1);
g1(3,7)=(-(params(3)/params(4)));
g1(3,8)=1;
g1(3,10)=params(1)*1/params(4);
g1(3,17)=(-1);
g1(4,11)=1;
g1(4,5)=1;
g1(4,17)=(-1);
g1(5,9)=(-1);
g1(5,10)=1;
g1(5,24)=(-1);
g1(6,11)=1;
g1(6,24)=(-params(1));
g1(6,12)=(-((1-params(6))*(1-params(6)*params(1))/params(6)));
g1(6,15)=(-1);
g1(7,6)=(-(params(3)+params(5)));
g1(7,12)=1;
g1(7,14)=1+params(5);
g1(8,12)=1;
g1(8,13)=1;
g1(9,1)=(-params(11));
g1(9,10)=1;
g1(9,11)=(-((1-params(11))*params(7)));
g1(9,16)=(-1);
g1(9,21)=(-((1-params(11))*params(8)));
g1(10,2)=(-params(9));
g1(10,14)=1;
g1(10,26)=(-1);
g1(11,3)=(-params(10));
g1(11,15)=1;
g1(11,27)=(-1);
g1(12,4)=(-params(12));
g1(12,16)=1;
g1(12,28)=(-1);
g1(13,18)=1;
g1(13,19)=(-1);
g1(14,14)=(-(1+params(5)));
g1(14,18)=params(3)+params(5);
g1(15,19)=1;
g1(15,25)=(-1);
g1(15,20)=T(1);
g1(16,6)=(-1);
g1(16,18)=1;
g1(16,21)=1;
g1(17,8)=(-1);
g1(17,17)=1;
g1(17,22)=1;

end
