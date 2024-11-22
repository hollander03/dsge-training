function [residual, g1, g2, g3] = SGU_2003_dynamic(y, x, params, steady_state, it_)
%
% Status : Computes dynamic model for Dynare
%
% Inputs :
%   y         [#dynamic variables by 1] double    vector of endogenous variables in the order stored
%                                                 in M_.lead_lag_incidence; see the Manual
%   x         [M_.exo_nbr by nperiods] double     matrix of exogenous variables (in declaration order)
%                                                 for all simulation periods
%   params    [M_.param_nbr by 1] double          vector of parameter values in declaration order
%   it_       scalar double                       time period for exogenous variables for which to evaluate the model
%
% Outputs:
%   residual  [M_.endo_nbr by 1] double    vector of residuals of the dynamic model equations in order of 
%                                          declaration of the equations
%   g1        [M_.endo_nbr by #dynamic variables] double    Jacobian matrix of the dynamic model equations;
%                                                           rows: equations in order of declaration
%                                                           columns: variables in order stored in M_.lead_lag_incidence
%   g2        [M_.endo_nbr by (#dynamic variables)^2] double   Hessian matrix of the dynamic model equations;
%                                                              rows: equations in order of declaration
%                                                              columns: variables in order stored in M_.lead_lag_incidence
%   g3        [M_.endo_nbr by (#dynamic variables)^3] double   Third order derivative matrix of the dynamic model equations;
%                                                              rows: equations in order of declaration
%                                                              columns: variables in order stored in M_.lead_lag_incidence
%
%
% Warning : this file is generated automatically by Dynare
%           from model file (.mod)

%
% Model equations
%

residual = zeros(14, 1);
T43 = exp(y(10))*exp(y(1))^params(8)*exp(y(6))^(1-params(8));
T64 = exp(y(5))-exp(y(6))^params(2)/params(2);
T67 = T64^(-params(1));
T74 = exp(y(6))^params(2)*params(2)^(-1);
T75 = 1+exp(y(5))-T74;
T78 = (-params(6))*T75^((-params(6))-1);
T91 = exp(y(6))^(params(2)-1);
T115 = 1+params(8)*exp(y(19))/exp(y(9))-params(5)+params(9)*(exp(y(20))-exp(y(9)));
T116 = y(17)*exp(y(21))*T115;
T177 = getPowerDeriv(T64,(-params(1)),1)*(-(exp(y(6))*getPowerDeriv(exp(y(6)),params(2),1)/params(2)));
T179 = (-(params(2)^(-1)*exp(y(6))*getPowerDeriv(exp(y(6)),params(2),1)));
T181 = (-params(6))*getPowerDeriv(T75,(-params(6))-1,1)*T179;
T207 = (-(exp(y(7))*(1-params(8))*exp(y(11))/exp(y(6))));
lhs =y(13);
rhs =(1+exp(y(4)))*y(3)-exp(y(7))+exp(y(5))+exp(y(8))+params(9)/2*(exp(y(9))-exp(y(1)))^2;
residual(1)= lhs-rhs;
lhs =exp(y(7));
rhs =T43;
residual(2)= lhs-rhs;
lhs =exp(y(9));
rhs =exp(y(8))+exp(y(1))*(1-params(5));
residual(3)= lhs-rhs;
lhs =exp(y(11));
rhs =y(17)*(1+exp(y(16)))*exp(y(21));
residual(4)= lhs-rhs;
lhs =exp(y(11));
rhs =T67-exp(y(18))*T78;
residual(5)= lhs-rhs;
lhs =exp(y(18));
rhs =(-y(22))+exp(y(24))*y(23);
residual(6)= lhs-rhs;
lhs =T67*T91+exp(y(18))*T78*(-T91);
rhs =exp(y(7))*(1-params(8))*exp(y(11))/exp(y(6));
residual(7)= lhs-rhs;
lhs =exp(y(11))*(1+params(9)*(exp(y(9))-exp(y(1))));
rhs =T116;
residual(8)= lhs-rhs;
lhs =y(10);
rhs =params(3)*y(2)+params(4)*x(it_, 1);
residual(9)= lhs-rhs;
lhs =y(17);
rhs =T75^(-params(6));
residual(10)= lhs-rhs;
lhs =y(12);
rhs =((exp(y(5))-T74)^(1-params(1))-1)/(1-params(1));
residual(11)= lhs-rhs;
lhs =exp(y(16));
rhs =params(12);
residual(12)= lhs-rhs;
lhs =y(14);
rhs =1-(exp(y(5))+exp(y(8)))/exp(y(7));
residual(13)= lhs-rhs;
lhs =y(15);
rhs =1/exp(y(7))*(y(3)-y(13));
residual(14)= lhs-rhs;
if nargout >= 2,
  g1 = zeros(14, 25);

  %
  % Jacobian matrix
  %

  g1(1,5)=(-exp(y(5)));
  g1(1,7)=exp(y(7));
  g1(1,8)=(-exp(y(8)));
  g1(1,1)=(-(params(9)/2*(-exp(y(1)))*2*(exp(y(9))-exp(y(1)))));
  g1(1,9)=(-(params(9)/2*exp(y(9))*2*(exp(y(9))-exp(y(1)))));
  g1(1,3)=(-(1+exp(y(4))));
  g1(1,13)=1;
  g1(1,4)=(-(exp(y(4))*y(3)));
  g1(2,6)=(-(exp(y(10))*exp(y(1))^params(8)*exp(y(6))*getPowerDeriv(exp(y(6)),1-params(8),1)));
  g1(2,7)=exp(y(7));
  g1(2,1)=(-(exp(y(6))^(1-params(8))*exp(y(10))*exp(y(1))*getPowerDeriv(exp(y(1)),params(8),1)));
  g1(2,10)=(-T43);
  g1(3,8)=(-exp(y(8)));
  g1(3,1)=(-(exp(y(1))*(1-params(5))));
  g1(3,9)=exp(y(9));
  g1(4,11)=exp(y(11));
  g1(4,21)=(-(y(17)*(1+exp(y(16)))*exp(y(21))));
  g1(4,16)=(-(exp(y(21))*y(17)*exp(y(16))));
  g1(4,17)=(-((1+exp(y(16)))*exp(y(21))));
  g1(5,5)=(-(exp(y(5))*getPowerDeriv(T64,(-params(1)),1)-exp(y(18))*(-params(6))*exp(y(5))*getPowerDeriv(T75,(-params(6))-1,1)));
  g1(5,6)=(-(T177-exp(y(18))*T181));
  g1(5,11)=exp(y(11));
  g1(5,18)=exp(y(18))*T78;
  g1(6,22)=1;
  g1(6,23)=(-exp(y(24)));
  g1(6,18)=exp(y(18));
  g1(6,24)=(-(exp(y(24))*y(23)));
  g1(7,5)=T91*exp(y(5))*getPowerDeriv(T64,(-params(1)),1)+exp(y(18))*(-T91)*(-params(6))*exp(y(5))*getPowerDeriv(T75,(-params(6))-1,1);
  g1(7,6)=T91*T177+T67*exp(y(6))*getPowerDeriv(exp(y(6)),params(2)-1,1)+exp(y(18))*((-T91)*T181+T78*(-(exp(y(6))*getPowerDeriv(exp(y(6)),params(2)-1,1))))-(-(exp(y(6))*exp(y(7))*(1-params(8))*exp(y(11))))/(exp(y(6))*exp(y(6)));
  g1(7,7)=T207;
  g1(7,11)=T207;
  g1(7,18)=exp(y(18))*T78*(-T91);
  g1(8,19)=(-(y(17)*exp(y(21))*params(8)*exp(y(19))/exp(y(9))));
  g1(8,1)=exp(y(11))*params(9)*(-exp(y(1)));
  g1(8,9)=exp(y(11))*params(9)*exp(y(9))-y(17)*exp(y(21))*((-(exp(y(9))*params(8)*exp(y(19))))/(exp(y(9))*exp(y(9)))+params(9)*(-exp(y(9))));
  g1(8,20)=(-(y(17)*exp(y(21))*params(9)*exp(y(20))));
  g1(8,11)=exp(y(11))*(1+params(9)*(exp(y(9))-exp(y(1))));
  g1(8,21)=(-T116);
  g1(8,17)=(-(exp(y(21))*T115));
  g1(9,2)=(-params(3));
  g1(9,10)=1;
  g1(9,25)=(-params(4));
  g1(10,5)=(-(exp(y(5))*getPowerDeriv(T75,(-params(6)),1)));
  g1(10,6)=(-(getPowerDeriv(T75,(-params(6)),1)*T179));
  g1(10,17)=1;
  g1(11,5)=(-(exp(y(5))*getPowerDeriv(exp(y(5))-T74,1-params(1),1)/(1-params(1))));
  g1(11,6)=(-(getPowerDeriv(exp(y(5))-T74,1-params(1),1)*T179/(1-params(1))));
  g1(11,12)=1;
  g1(12,16)=exp(y(16));
  g1(13,5)=exp(y(5))/exp(y(7));
  g1(13,7)=(-(exp(y(7))*(exp(y(5))+exp(y(8)))))/(exp(y(7))*exp(y(7)));
  g1(13,8)=exp(y(8))/exp(y(7));
  g1(13,14)=1;
  g1(14,7)=(-((y(3)-y(13))*(-exp(y(7)))/(exp(y(7))*exp(y(7)))));
  g1(14,3)=(-(1/exp(y(7))));
  g1(14,13)=1/exp(y(7));
  g1(14,15)=1;
end
if nargout >= 3,
  %
  % Hessian matrix
  %

  g2 = sparse([],[],[],14,625);
end
if nargout >= 4,
  %
  % Third order derivatives
  %

  g3 = sparse([],[],[],14,15625);
end
end
