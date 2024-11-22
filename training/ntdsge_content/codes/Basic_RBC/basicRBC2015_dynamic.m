function [residual, g1, g2, g3] = basicRBC2015_dynamic(y, x, params, steady_state, it_)
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

residual = zeros(7, 1);
R__ = 1/params(2);
KY__ = params(1)/(R__-(1-params(3)));
CY__ = 1-params(3)*KY__;
lhs =y(3);
rhs =CY__*y(4)+params(3)*KY__*y(6);
residual(1)= lhs-rhs;
lhs =1/params(5)*y(11);
rhs =y(10)-y(4);
residual(2)= lhs-rhs;
lhs =y(4)*params(5);
rhs =y(3)-y(5);
residual(3)= lhs-rhs;
lhs =y(8);
rhs =params(1)*1/KY__*(y(3)-y(1));
residual(4)= lhs-rhs;
lhs =y(7);
rhs =(1-params(3))*y(1)+params(3)*y(6);
residual(5)= lhs-rhs;
lhs =y(3);
rhs =y(9)+params(1)*y(1)+y(5)*(1-params(1));
residual(6)= lhs-rhs;
lhs =y(9);
rhs =params(4)*y(2)+x(it_, 1);
residual(7)= lhs-rhs;
if nargout >= 2,
  g1 = zeros(7, 12);

  %
  % Jacobian matrix
  %

  g1(1,3)=1;
  g1(1,4)=(-CY__);
  g1(1,6)=(-(params(3)*KY__));
  g1(2,4)=1;
  g1(2,10)=(-1);
  g1(2,11)=1/params(5);
  g1(3,3)=(-1);
  g1(3,4)=params(5);
  g1(3,5)=1;
  g1(4,3)=(-(params(1)*1/KY__));
  g1(4,1)=params(1)*1/KY__;
  g1(4,8)=1;
  g1(5,6)=(-params(3));
  g1(5,1)=(-(1-params(3)));
  g1(5,7)=1;
  g1(6,3)=1;
  g1(6,5)=(-(1-params(1)));
  g1(6,1)=(-params(1));
  g1(6,9)=(-1);
  g1(7,2)=(-params(4));
  g1(7,9)=1;
  g1(7,12)=(-1);

if nargout >= 3,
  %
  % Hessian matrix
  %

  g2 = sparse([],[],[],7,144);
if nargout >= 4,
  %
  % Third order derivatives
  %

  g3 = sparse([],[],[],7,1728);
end
end
end
end
