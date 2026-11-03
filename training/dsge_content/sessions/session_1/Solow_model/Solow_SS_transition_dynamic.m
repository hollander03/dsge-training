function [residual, g1, g2, g3] = Solow_SS_transition_dynamic(y, x, params, steady_state, it_)
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

residual = zeros(11, 1);
lhs =(1+params(4)+params(5)+params(4)*params(5))*y(3);
rhs =y(5)+(1-params(3))*y(1);
residual(1)= lhs-rhs;
lhs =y(5)+y(2);
rhs =y(4);
residual(2)= lhs-rhs;
lhs =y(2);
rhs =y(4)*(1-params(1));
residual(3)= lhs-rhs;
lhs =y(4);
rhs =y(1)^params(2);
residual(4)= lhs-rhs;
lhs =y(8);
rhs =log(y(4));
residual(5)= lhs-rhs;
lhs =y(6);
rhs =log(y(2));
residual(6)= lhs-rhs;
lhs =y(9);
rhs =log(y(5));
residual(7)= lhs-rhs;
lhs =y(7);
rhs =log(y(3));
residual(8)= lhs-rhs;
lhs =y(12);
rhs =log(y(3))-log(y(1));
residual(9)= lhs-rhs;
lhs =y(11);
rhs =params(5)+y(12);
residual(10)= lhs-rhs;
lhs =y(10);
rhs =params(4)+params(5)+y(12);
residual(11)= lhs-rhs;
if nargout >= 2,
  g1 = zeros(11, 12);

  %
  % Jacobian matrix
  %

  g1(1,1)=(-(1-params(3)));
  g1(1,3)=1+params(4)+params(5)+params(4)*params(5);
  g1(1,5)=(-1);
  g1(2,2)=1;
  g1(2,4)=(-1);
  g1(2,5)=1;
  g1(3,2)=1;
  g1(3,4)=(-(1-params(1)));
  g1(4,1)=(-(getPowerDeriv(y(1),params(2),1)));
  g1(4,4)=1;
  g1(5,4)=(-(1/y(4)));
  g1(5,8)=1;
  g1(6,2)=(-(1/y(2)));
  g1(6,6)=1;
  g1(7,5)=(-(1/y(5)));
  g1(7,9)=1;
  g1(8,3)=(-(1/y(3)));
  g1(8,7)=1;
  g1(9,1)=1/y(1);
  g1(9,3)=(-(1/y(3)));
  g1(9,12)=1;
  g1(10,11)=1;
  g1(10,12)=(-1);
  g1(11,10)=1;
  g1(11,12)=(-1);

if nargout >= 3,
  %
  % Hessian matrix
  %

  g2 = sparse([],[],[],11,144);
if nargout >= 4,
  %
  % Third order derivatives
  %

  g3 = sparse([],[],[],11,1728);
end
end
end
end
