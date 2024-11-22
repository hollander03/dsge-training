function [residual, g1, g2] = SGU_2003_static(y, x, params)
%
% Status : Computes static model for Dynare
%
% Inputs : 
%   y         [M_.endo_nbr by 1] double    vector of endogenous variables in declaration order
%   x         [M_.exo_nbr by 1] double     vector of exogenous variables in declaration order
%   params    [M_.param_nbr by 1] double   vector of parameter values in declaration order
%
% Outputs:
%   residual  [M_.endo_nbr by 1] double    vector of residuals of the static model equations 
%                                          in order of declaration of the equations
%   g1        [M_.endo_nbr by M_.endo_nbr] double    Jacobian matrix of the static model equations;
%                                                     columns: variables in declaration order
%                                                     rows: equations in order of declaration
%   g2        [M_.endo_nbr by (M_.endo_nbr)^2] double   Hessian matrix of the static model equations;
%                                                       columns: variables in declaration order
%                                                       rows: equations in order of declaration
%
%
% Warning : this file is generated automatically by Dynare
%           from model file (.mod)

residual = zeros( 14, 1);

%
% Model equations
%

T36 = exp(y(6))*exp(y(5))^params(8)*exp(y(2))^(1-params(8));
T52 = exp(y(1))-exp(y(2))^params(2)/params(2);
T55 = T52^(-params(1));
T62 = exp(y(2))^params(2)*params(2)^(-1);
T63 = 1+exp(y(1))-T62;
T66 = (-params(6))*T63^((-params(6))-1);
T76 = exp(y(2))^(params(2)-1);
T91 = exp(y(7))*y(13)*(1+exp(y(3))*params(8)/exp(y(5))-params(5));
T148 = getPowerDeriv(T52,(-params(1)),1)*(-(exp(y(2))*getPowerDeriv(exp(y(2)),params(2),1)/params(2)));
T150 = (-(params(2)^(-1)*exp(y(2))*getPowerDeriv(exp(y(2)),params(2),1)));
T152 = (-params(6))*getPowerDeriv(T63,(-params(6))-1,1)*T150;
T178 = (-(exp(y(3))*(1-params(8))*exp(y(7))/exp(y(2))));
lhs =y(9);
rhs =y(9)*(1+exp(y(12)))-exp(y(3))+exp(y(1))+exp(y(4));
residual(1)= lhs-rhs;
lhs =exp(y(3));
rhs =T36;
residual(2)= lhs-rhs;
lhs =exp(y(5));
rhs =exp(y(4))+exp(y(5))*(1-params(5));
residual(3)= lhs-rhs;
lhs =exp(y(7));
rhs =exp(y(7))*(1+exp(y(12)))*y(13);
residual(4)= lhs-rhs;
lhs =exp(y(7));
rhs =T55-exp(y(14))*T66;
residual(5)= lhs-rhs;
lhs =exp(y(14));
rhs =(-y(8))+y(13)*exp(y(14));
residual(6)= lhs-rhs;
lhs =T55*T76+exp(y(14))*T66*(-T76);
rhs =exp(y(3))*(1-params(8))*exp(y(7))/exp(y(2));
residual(7)= lhs-rhs;
lhs =exp(y(7));
rhs =T91;
residual(8)= lhs-rhs;
lhs =y(6);
rhs =y(6)*params(3)+params(4)*x(1);
residual(9)= lhs-rhs;
lhs =y(13);
rhs =T63^(-params(6));
residual(10)= lhs-rhs;
lhs =y(8);
rhs =((exp(y(1))-T62)^(1-params(1))-1)/(1-params(1));
residual(11)= lhs-rhs;
lhs =exp(y(12));
rhs =params(12);
residual(12)= lhs-rhs;
lhs =y(10);
rhs =1-(exp(y(1))+exp(y(4)))/exp(y(3));
residual(13)= lhs-rhs;
residual(14) = y(11);
if ~isreal(residual)
  residual = real(residual)+imag(residual).^2;
end
if nargout >= 2,
  g1 = zeros(14, 14);

  %
  % Jacobian matrix
  %

  g1(1,1)=(-exp(y(1)));
  g1(1,3)=exp(y(3));
  g1(1,4)=(-exp(y(4)));
  g1(1,9)=1-(1+exp(y(12)));
  g1(1,12)=(-(y(9)*exp(y(12))));
  g1(2,2)=(-(exp(y(6))*exp(y(5))^params(8)*exp(y(2))*getPowerDeriv(exp(y(2)),1-params(8),1)));
  g1(2,3)=exp(y(3));
  g1(2,5)=(-(exp(y(2))^(1-params(8))*exp(y(6))*exp(y(5))*getPowerDeriv(exp(y(5)),params(8),1)));
  g1(2,6)=(-T36);
  g1(3,4)=(-exp(y(4)));
  g1(3,5)=exp(y(5))-exp(y(5))*(1-params(5));
  g1(4,7)=exp(y(7))-exp(y(7))*(1+exp(y(12)))*y(13);
  g1(4,12)=(-(exp(y(7))*exp(y(12))*y(13)));
  g1(4,13)=(-((1+exp(y(12)))*exp(y(7))));
  g1(5,1)=(-(exp(y(1))*getPowerDeriv(T52,(-params(1)),1)-exp(y(14))*(-params(6))*exp(y(1))*getPowerDeriv(T63,(-params(6))-1,1)));
  g1(5,2)=(-(T148-exp(y(14))*T152));
  g1(5,7)=exp(y(7));
  g1(5,14)=exp(y(14))*T66;
  g1(6,8)=1;
  g1(6,13)=(-exp(y(14)));
  g1(6,14)=exp(y(14))-y(13)*exp(y(14));
  g1(7,1)=T76*exp(y(1))*getPowerDeriv(T52,(-params(1)),1)+exp(y(14))*(-T76)*(-params(6))*exp(y(1))*getPowerDeriv(T63,(-params(6))-1,1);
  g1(7,2)=T76*T148+T55*exp(y(2))*getPowerDeriv(exp(y(2)),params(2)-1,1)+exp(y(14))*((-T76)*T152+T66*(-(exp(y(2))*getPowerDeriv(exp(y(2)),params(2)-1,1))))-(-(exp(y(2))*exp(y(3))*(1-params(8))*exp(y(7))))/(exp(y(2))*exp(y(2)));
  g1(7,3)=T178;
  g1(7,7)=T178;
  g1(7,14)=exp(y(14))*T66*(-T76);
  g1(8,3)=(-(exp(y(7))*y(13)*exp(y(3))*params(8)/exp(y(5))));
  g1(8,5)=(-(exp(y(7))*y(13)*(-(exp(y(5))*exp(y(3))*params(8)))/(exp(y(5))*exp(y(5)))));
  g1(8,7)=exp(y(7))-T91;
  g1(8,13)=(-(exp(y(7))*(1+exp(y(3))*params(8)/exp(y(5))-params(5))));
  g1(9,6)=1-params(3);
  g1(10,1)=(-(exp(y(1))*getPowerDeriv(T63,(-params(6)),1)));
  g1(10,2)=(-(getPowerDeriv(T63,(-params(6)),1)*T150));
  g1(10,13)=1;
  g1(11,1)=(-(exp(y(1))*getPowerDeriv(exp(y(1))-T62,1-params(1),1)/(1-params(1))));
  g1(11,2)=(-(getPowerDeriv(exp(y(1))-T62,1-params(1),1)*T150/(1-params(1))));
  g1(11,8)=1;
  g1(12,12)=exp(y(12));
  g1(13,1)=exp(y(1))/exp(y(3));
  g1(13,3)=(-(exp(y(3))*(exp(y(1))+exp(y(4)))))/(exp(y(3))*exp(y(3)));
  g1(13,4)=exp(y(4))/exp(y(3));
  g1(13,10)=1;
  g1(14,11)=1;
  if ~isreal(g1)
    g1 = real(g1)+2*imag(g1);
  end
end
if nargout >= 3,
  %
  % Hessian matrix
  %

  g2 = sparse([],[],[],14,196);
end
end
