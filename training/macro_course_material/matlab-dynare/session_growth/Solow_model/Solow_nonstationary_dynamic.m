function [residual, g1, g2, g3] = Solow_nonstationary_dynamic(y, x, params, steady_state, it_)
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
T30 = (x(it_, 1)*x(it_, 2))^(1-params(2));
T71 = y(4)/x(it_, 2);
T72 = y(16)/x(it_+1, 2)-T71;
T77 = y(4)/(x(it_, 1)*x(it_, 2));
T78 = y(16)/(x(it_+1, 2)*x(it_+1, 1))-T77;
T85 = y(1)^params(2);
T94 = y(1)/x(it_, 2);
T95 = y(3)/x(it_+1, 2)-T94;
T99 = y(1)/(x(it_, 1)*x(it_, 2));
T100 = y(3)/(x(it_+1, 2)*x(it_+1, 1))-T99;
lhs =y(3);
rhs =y(5)+(1-params(3))*y(1);
residual(1)= lhs-rhs;
lhs =y(5)+y(2);
rhs =y(4);
residual(2)= lhs-rhs;
lhs =y(2);
rhs =y(4)*(1-params(1));
residual(3)= lhs-rhs;
lhs =y(4);
rhs =T30*T85;
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
lhs =y(10);
rhs =(y(3)-y(1))/y(1);
residual(9)= lhs-rhs;
lhs =y(11);
rhs =T95/T94;
residual(10)= lhs-rhs;
lhs =y(12);
rhs =T100/T99;
residual(11)= lhs-rhs;
lhs =y(13);
rhs =(y(16)-y(4))/y(4);
residual(12)= lhs-rhs;
lhs =y(14);
rhs =T72/T71;
residual(13)= lhs-rhs;
lhs =y(15);
rhs =T78/T77;
residual(14)= lhs-rhs;
if nargout >= 2,
  g1 = zeros(14, 18);

  %
  % Jacobian matrix
  %

T166 = getPowerDeriv(x(it_, 1)*x(it_, 2),1-params(2),1);
  g1(1,1)=(-(1-params(3)));
  g1(1,3)=1;
  g1(1,5)=(-1);
  g1(2,2)=1;
  g1(2,4)=(-1);
  g1(2,5)=1;
  g1(3,2)=1;
  g1(3,4)=(-(1-params(1)));
  g1(4,1)=(-(T30*getPowerDeriv(y(1),params(2),1)));
  g1(4,4)=1;
  g1(4,17)=(-(T85*x(it_, 2)*T166));
  g1(4,18)=(-(T85*x(it_, 1)*T166));
  g1(5,4)=(-(1/y(4)));
  g1(5,8)=1;
  g1(6,2)=(-(1/y(2)));
  g1(6,6)=1;
  g1(7,5)=(-(1/y(5)));
  g1(7,9)=1;
  g1(8,3)=(-(1/y(3)));
  g1(8,7)=1;
  g1(9,1)=(-(((-y(1))-(y(3)-y(1)))/(y(1)*y(1))));
  g1(9,3)=(-(1/y(1)));
  g1(9,10)=1;
  g1(10,1)=(-((T94*(-(1/x(it_, 2)))-T95*1/x(it_, 2))/(T94*T94)));
  g1(10,3)=(-(1/x(it_+1, 2)/T94));
  g1(10,11)=1;
  g1(10,18)=(-((T94*(-((-y(1))/(x(it_, 2)*x(it_, 2))))-T95*(-y(1))/(x(it_, 2)*x(it_, 2)))/(T94*T94)));
  g1(10,18)=(-((-y(3))/(x(it_+1, 2)*x(it_+1, 2))/T94));
  g1(11,1)=(-((T99*(-(1/(x(it_, 1)*x(it_, 2))))-T100*1/(x(it_, 1)*x(it_, 2)))/(T99*T99)));
  g1(11,3)=(-(1/(x(it_+1, 2)*x(it_+1, 1))/T99));
  g1(11,12)=1;
  g1(11,17)=(-((T99*(-((-(x(it_, 2)*y(1)))/(x(it_, 1)*x(it_, 2)*x(it_, 1)*x(it_, 2))))-T100*(-(x(it_, 2)*y(1)))/(x(it_, 1)*x(it_, 2)*x(it_, 1)*x(it_, 2)))/(T99*T99)));
  g1(11,17)=(-((-(y(3)*x(it_+1, 2)))/(x(it_+1, 2)*x(it_+1, 1)*x(it_+1, 2)*x(it_+1, 1))/T99));
  g1(11,18)=(-((T99*(-((-(x(it_, 1)*y(1)))/(x(it_, 1)*x(it_, 2)*x(it_, 1)*x(it_, 2))))-T100*(-(x(it_, 1)*y(1)))/(x(it_, 1)*x(it_, 2)*x(it_, 1)*x(it_, 2)))/(T99*T99)));
  g1(11,18)=(-((-(y(3)*x(it_+1, 1)))/(x(it_+1, 2)*x(it_+1, 1)*x(it_+1, 2)*x(it_+1, 1))/T99));
  g1(12,4)=(-(((-y(4))-(y(16)-y(4)))/(y(4)*y(4))));
  g1(12,16)=(-(1/y(4)));
  g1(12,13)=1;
  g1(13,4)=(-((T71*(-(1/x(it_, 2)))-T72*1/x(it_, 2))/(T71*T71)));
  g1(13,16)=(-(1/x(it_+1, 2)/T71));
  g1(13,14)=1;
  g1(13,18)=(-((T71*(-((-y(4))/(x(it_, 2)*x(it_, 2))))-T72*(-y(4))/(x(it_, 2)*x(it_, 2)))/(T71*T71)));
  g1(13,18)=(-((-y(16))/(x(it_+1, 2)*x(it_+1, 2))/T71));
  g1(14,4)=(-((T77*(-(1/(x(it_, 1)*x(it_, 2))))-T78*1/(x(it_, 1)*x(it_, 2)))/(T77*T77)));
  g1(14,16)=(-(1/(x(it_+1, 2)*x(it_+1, 1))/T77));
  g1(14,15)=1;
  g1(14,17)=(-((T77*(-((-(y(4)*x(it_, 2)))/(x(it_, 1)*x(it_, 2)*x(it_, 1)*x(it_, 2))))-T78*(-(y(4)*x(it_, 2)))/(x(it_, 1)*x(it_, 2)*x(it_, 1)*x(it_, 2)))/(T77*T77)));
  g1(14,17)=(-((-(x(it_+1, 2)*y(16)))/(x(it_+1, 2)*x(it_+1, 1)*x(it_+1, 2)*x(it_+1, 1))/T77));
  g1(14,18)=(-((T77*(-((-(y(4)*x(it_, 1)))/(x(it_, 1)*x(it_, 2)*x(it_, 1)*x(it_, 2))))-T78*(-(y(4)*x(it_, 1)))/(x(it_, 1)*x(it_, 2)*x(it_, 1)*x(it_, 2)))/(T77*T77)));
  g1(14,18)=(-((-(x(it_+1, 1)*y(16)))/(x(it_+1, 2)*x(it_+1, 1)*x(it_+1, 2)*x(it_+1, 1))/T77));

if nargout >= 3,
  %
  % Hessian matrix
  %

  g2 = sparse([],[],[],14,324);
if nargout >= 4,
  %
  % Third order derivatives
  %

  g3 = sparse([],[],[],14,5832);
end
end
end
end
