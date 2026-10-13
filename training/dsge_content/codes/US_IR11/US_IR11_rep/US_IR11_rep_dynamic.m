function [residual, g1, g2, g3] = US_IR11_rep_dynamic(y, x, params, steady_state, it_)
%
% Status : Computes dynamic model for Dynare
%
% Inputs :
%   y         [#dynamic variables by 1] double    vector of endogenous variables in the order stored
%                                                 in M_.lead_lag_incidence; see the Manual
%   x         [nperiods by M_.exo_nbr] double     matrix of exogenous variables (in declaration order)
%                                                 for all simulation periods
%   steady_state  [M_.endo_nbr by 1] double       vector of steady state values
%   params    [M_.param_nbr by 1] double          vector of parameter values in declaration order
%   it_       scalar double                       time period for exogenous variables for which to evaluate the model
%
% Outputs:
%   residual  [M_.endo_nbr by 1] double    vector of residuals of the dynamic model equations in order of 
%                                          declaration of the equations.
%                                          Dynare may prepend auxiliary equations, see M_.aux_vars
%   g1        [M_.endo_nbr by #dynamic variables] double    Jacobian matrix of the dynamic model equations;
%                                                           rows: equations in order of declaration
%                                                           columns: variables in order stored in M_.lead_lag_incidence followed by the ones in M_.exo_names
%   g2        [M_.endo_nbr by (#dynamic variables)^2] double   Hessian matrix of the dynamic model equations;
%                                                              rows: equations in order of declaration
%                                                              columns: variables in order stored in M_.lead_lag_incidence followed by the ones in M_.exo_names
%   g3        [M_.endo_nbr by (#dynamic variables)^3] double   Third order derivative matrix of the dynamic model equations;
%                                                              rows: equations in order of declaration
%                                                              columns: variables in order stored in M_.lead_lag_incidence followed by the ones in M_.exo_names
%
%
% Warning : this file is generated automatically by Dynare
%           from model file (.mod)

%
% Model equations
%

residual = zeros(14, 1);
T30 = params(7)^2+params(8)*params(1)^2;
lhs =y(8);
rhs =params(5)*y(1)+x(it_, 1);
residual(1)= lhs-rhs;
lhs =(params(7)-params(8)*params(1))*(params(7)-params(1))*y(9);
rhs =params(7)*params(1)*y(2)-T30*y(10)+params(7)*params(8)*params(1)*y(23)+y(8)*(params(7)-params(1))*(params(7)-params(5)*params(8)*params(1))-params(7)*params(1)*y(11);
residual(2)= lhs-rhs;
lhs =y(9);
rhs =y(12)+y(22)-y(24);
residual(3)= lhs-rhs;
lhs =y(14);
rhs =params(6)*y(5)+x(it_, 2);
residual(4)= lhs-rhs;
lhs =y(11);
rhs =x(it_, 3);
residual(5)= lhs-rhs;
lhs =(1+params(8)*params(2))*y(13);
rhs =y(14)+params(2)*y(4)+params(8)*y(24)-y(9)*params(9)+y(8)*params(9);
residual(6)= lhs-rhs;
lhs =y(12)-y(3);
rhs =y(13)*params(3)+params(4)*y(15)+x(it_, 4);
residual(7)= lhs-rhs;
lhs =y(15);
rhs =y(11)+y(10)-y(2);
residual(8)= lhs-rhs;
lhs =0;
rhs =params(7)*params(1)*y(6)-T30*y(16)+params(7)*params(8)*params(1)*y(25)+y(8)*params(8)*params(1)*(params(7)-params(1))*(1-params(5))-params(7)*params(1)*y(11);
residual(9)= lhs-rhs;
lhs =y(17);
rhs =y(10)-y(16);
residual(10)= lhs-rhs;
lhs =y(18);
rhs =y(13)*4;
residual(11)= lhs-rhs;
lhs =y(19);
rhs =y(12)*4;
residual(12)= lhs-rhs;
lhs =y(21);
rhs =y(11)+y(7);
residual(13)= lhs-rhs;
lhs =y(20);
rhs =y(10)+y(21);
residual(14)= lhs-rhs;
if nargout >= 2,
  g1 = zeros(14, 29);

  %
  % Jacobian matrix
  %

  g1(1,1)=(-params(5));
  g1(1,8)=1;
  g1(1,26)=(-1);
  g1(2,8)=(-((params(7)-params(1))*(params(7)-params(5)*params(8)*params(1))));
  g1(2,9)=(params(7)-params(8)*params(1))*(params(7)-params(1));
  g1(2,2)=(-(params(7)*params(1)));
  g1(2,10)=T30;
  g1(2,23)=(-(params(7)*params(8)*params(1)));
  g1(2,11)=params(7)*params(1);
  g1(3,9)=1;
  g1(3,22)=(-1);
  g1(3,12)=(-1);
  g1(3,24)=1;
  g1(4,5)=(-params(6));
  g1(4,14)=1;
  g1(4,27)=(-1);
  g1(5,11)=1;
  g1(5,28)=(-1);
  g1(6,8)=(-params(9));
  g1(6,9)=params(9);
  g1(6,4)=(-params(2));
  g1(6,13)=1+params(8)*params(2);
  g1(6,24)=(-params(8));
  g1(6,14)=(-1);
  g1(7,3)=(-1);
  g1(7,12)=1;
  g1(7,13)=(-params(3));
  g1(7,15)=(-params(4));
  g1(7,29)=(-1);
  g1(8,2)=1;
  g1(8,10)=(-1);
  g1(8,11)=(-1);
  g1(8,15)=1;
  g1(9,8)=(-(params(8)*params(1)*(params(7)-params(1))*(1-params(5))));
  g1(9,11)=params(7)*params(1);
  g1(9,6)=(-(params(7)*params(1)));
  g1(9,16)=T30;
  g1(9,25)=(-(params(7)*params(8)*params(1)));
  g1(10,10)=(-1);
  g1(10,16)=1;
  g1(10,17)=1;
  g1(11,13)=(-4);
  g1(11,18)=1;
  g1(12,12)=(-4);
  g1(12,19)=1;
  g1(13,11)=(-1);
  g1(13,7)=(-1);
  g1(13,21)=1;
  g1(14,10)=(-1);
  g1(14,20)=1;
  g1(14,21)=(-1);

if nargout >= 3,
  %
  % Hessian matrix
  %

  g2 = sparse([],[],[],14,841);
if nargout >= 4,
  %
  % Third order derivatives
  %

  g3 = sparse([],[],[],14,24389);
end
end
end
end
