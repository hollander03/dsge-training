function [residual, g1, g2, g3] = RBCmodel_homework_dynamic(y, x, params, steady_state, it_)
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

residual = zeros(9, 1);
uc__ = params(3)*y(4)^(-1);
ucp__ = params(3)*y(12)^(-1);
ul__ = (-params(4))*(1-y(6))^(-1);
fk__ = params(5)*y(3)/y(1);
fl__ = y(3)*(1-params(5))/y(6);
T52 = y(1)^params(5);
T53 = y(7)*T52;
T54 = y(6)^(1-params(5));
lhs =uc__;
rhs =params(1)*ucp__*(1-params(2)+y(8));
residual(1)= lhs-rhs;
lhs =y(9);
rhs =(-ul__)/uc__;
residual(2)= lhs-rhs;
lhs =y(5);
rhs =y(1)*(1-params(2))+y(10);
residual(3)= lhs-rhs;
lhs =y(3);
rhs =y(4)+y(10);
residual(4)= lhs-rhs;
lhs =y(3);
rhs =T53*T54;
residual(5)= lhs-rhs;
lhs =y(11);
rhs =1;
residual(6)= lhs-rhs;
lhs =y(9);
rhs =y(11)*fl__;
residual(7)= lhs-rhs;
lhs =y(8);
rhs =y(11)*fk__;
residual(8)= lhs-rhs;
lhs =log(y(7));
rhs =params(6)*log(y(2))+x(it_, 1);
residual(9)= lhs-rhs;
if nargout >= 2,
  g1 = zeros(9, 13);

  %
  % Jacobian matrix
  %

T80 = params(3)*getPowerDeriv(y(4),(-1),1);
  g1(1,4)=T80;
  g1(1,12)=(-((1-params(2)+y(8))*params(1)*params(3)*getPowerDeriv(y(12),(-1),1)));
  g1(1,8)=(-(params(1)*ucp__));
  g1(2,4)=(-((-((-ul__)*T80))/(uc__*uc__)));
  g1(2,6)=(-((-((-params(4))*(-(getPowerDeriv(1-y(6),(-1),1)))))/uc__));
  g1(2,9)=1;
  g1(3,1)=(-(1-params(2)));
  g1(3,5)=1;
  g1(3,10)=(-1);
  g1(4,3)=1;
  g1(4,4)=(-1);
  g1(4,10)=(-1);
  g1(5,3)=1;
  g1(5,1)=(-(T54*y(7)*getPowerDeriv(y(1),params(5),1)));
  g1(5,6)=(-(T53*getPowerDeriv(y(6),1-params(5),1)));
  g1(5,7)=(-(T52*T54));
  g1(6,11)=1;
  g1(7,3)=(-(y(11)*(1-params(5))/y(6)));
  g1(7,6)=(-(y(11)*(-(y(3)*(1-params(5))))/(y(6)*y(6))));
  g1(7,9)=1;
  g1(7,11)=(-fl__);
  g1(8,3)=(-(y(11)*params(5)/y(1)));
  g1(8,1)=(-(y(11)*(-(params(5)*y(3)))/(y(1)*y(1))));
  g1(8,8)=1;
  g1(8,11)=(-fk__);
  g1(9,2)=(-(params(6)*1/y(2)));
  g1(9,7)=1/y(7);
  g1(9,13)=(-1);

if nargout >= 3,
  %
  % Hessian matrix
  %

  g2 = sparse([],[],[],9,169);
if nargout >= 4,
  %
  % Third order derivatives
  %

  g3 = sparse([],[],[],9,2197);
end
end
end
end
