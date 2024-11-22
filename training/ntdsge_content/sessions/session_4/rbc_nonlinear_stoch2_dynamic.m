function [residual, g1, g2, g3] = rbc_nonlinear_stoch2_dynamic(y, x, params, steady_state, it_)
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

residual = zeros(12, 1);
uc__ = params(3)*y(5)^(-params(5));
ucp__ = params(3)*y(16)^(-params(5));
ul__ = (-params(4))*(1-y(7))^(-params(6));
T63 = y(1)^params(7);
T64 = y(8)*T63;
T65 = y(7)^(1-params(7));
lhs =y(14);
rhs =params(7)*y(4)/y(1);
residual(1)= lhs-rhs;
lhs =y(15);
rhs =y(4)*(1-params(7))/y(7);
residual(2)= lhs-rhs;
lhs =uc__;
rhs =params(1)*ucp__*(1-params(2)+y(17))+y(13)-1;
residual(3)= lhs-rhs;
lhs =y(10);
rhs =(-ul__)/uc__;
residual(4)= lhs-rhs;
lhs =y(6);
rhs =y(1)*(1-params(2))+y(11);
residual(5)= lhs-rhs;
lhs =y(4);
rhs =y(5)+y(11);
residual(6)= lhs-rhs;
lhs =y(4);
rhs =T64*T65;
residual(7)= lhs-rhs;
lhs =y(12);
rhs =1;
residual(8)= lhs-rhs;
lhs =y(10);
rhs =y(15)*y(12)-(y(13)-1);
residual(9)= lhs-rhs;
lhs =y(9);
rhs =y(14)*y(12);
residual(10)= lhs-rhs;
lhs =log(y(8));
rhs =params(8)*log(y(2))+x(it_, 1);
residual(11)= lhs-rhs;
lhs =log(y(13));
rhs =params(9)*log(y(3))+x(it_, 2);
residual(12)= lhs-rhs;
if nargout >= 2,
  g1 = zeros(12, 19);

  %
  % Jacobian matrix
  %

T97 = params(3)*getPowerDeriv(y(5),(-params(5)),1);
  g1(1,4)=(-(params(7)/y(1)));
  g1(1,1)=(-((-(params(7)*y(4)))/(y(1)*y(1))));
  g1(1,14)=1;
  g1(2,4)=(-((1-params(7))/y(7)));
  g1(2,7)=(-((-(y(4)*(1-params(7))))/(y(7)*y(7))));
  g1(2,15)=1;
  g1(3,5)=T97;
  g1(3,16)=(-((1-params(2)+y(17))*params(1)*params(3)*getPowerDeriv(y(16),(-params(5)),1)));
  g1(3,17)=(-(params(1)*ucp__));
  g1(3,13)=(-1);
  g1(4,5)=(-((-((-ul__)*T97))/(uc__*uc__)));
  g1(4,7)=(-((-((-params(4))*(-(getPowerDeriv(1-y(7),(-params(6)),1)))))/uc__));
  g1(4,10)=1;
  g1(5,1)=(-(1-params(2)));
  g1(5,6)=1;
  g1(5,11)=(-1);
  g1(6,4)=1;
  g1(6,5)=(-1);
  g1(6,11)=(-1);
  g1(7,4)=1;
  g1(7,1)=(-(T65*y(8)*getPowerDeriv(y(1),params(7),1)));
  g1(7,7)=(-(T64*getPowerDeriv(y(7),1-params(7),1)));
  g1(7,8)=(-(T63*T65));
  g1(8,12)=1;
  g1(9,10)=1;
  g1(9,12)=(-y(15));
  g1(9,13)=1;
  g1(9,15)=(-y(12));
  g1(10,9)=1;
  g1(10,12)=(-y(14));
  g1(10,14)=(-y(12));
  g1(11,2)=(-(params(8)*1/y(2)));
  g1(11,8)=1/y(8);
  g1(11,18)=(-1);
  g1(12,3)=(-(params(9)*1/y(3)));
  g1(12,13)=1/y(13);
  g1(12,19)=(-1);

if nargout >= 3,
  %
  % Hessian matrix
  %

  g2 = sparse([],[],[],12,361);
if nargout >= 4,
  %
  % Third order derivatives
  %

  g3 = sparse([],[],[],12,6859);
end
end
end
end
