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
g1 = zeros(17, 27);
g1(1,5)=1;
g1(1,6)=(-1);
g1(2,6)=1;
g1(2,22)=(-1);
g1(2,8)=T(1);
g1(3,6)=(-(params(3)/params(4)));
g1(3,7)=1;
g1(3,9)=params(1)*1/params(4);
g1(3,16)=(-1);
g1(4,10)=1;
g1(4,4)=1;
g1(4,16)=(-1);
g1(5,8)=(-1);
g1(5,9)=1;
g1(5,23)=(-1);
g1(6,10)=1;
g1(6,23)=(-params(1));
g1(6,11)=(-((1-params(6))*(1-params(6)*params(1))/params(6)));
g1(6,14)=(-1);
g1(7,5)=(-(params(3)+params(5)));
g1(7,11)=1;
g1(7,13)=1+params(5);
g1(8,11)=1;
g1(8,12)=1;
g1(9,1)=(-params(11));
g1(9,9)=1;
g1(9,10)=(-((1-params(11))*params(7)));
g1(9,15)=(-1);
g1(9,20)=(-((1-params(11))*params(8)));
g1(10,2)=(-params(9));
g1(10,13)=1;
g1(10,25)=(-1);
g1(11,3)=(-params(10));
g1(11,14)=1;
g1(11,26)=(-1);
g1(12,15)=1;
g1(12,27)=(-1);
g1(13,17)=1;
g1(13,18)=(-1);
g1(14,13)=(-(1+params(5)));
g1(14,17)=params(3)+params(5);
g1(15,18)=1;
g1(15,24)=(-1);
g1(15,19)=T(1);
g1(16,5)=(-1);
g1(16,17)=1;
g1(16,20)=1;
g1(17,7)=(-1);
g1(17,16)=1;
g1(17,21)=1;

end
