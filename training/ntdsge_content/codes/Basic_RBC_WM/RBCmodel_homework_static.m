function [residual, g1, g2, g3] = RBCmodel_homework_static(y, x, params)
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
%                                          in order of declaration of the equations.
%                                          Dynare may prepend or append auxiliary equations, see M_.aux_vars
%   g1        [M_.endo_nbr by M_.endo_nbr] double    Jacobian matrix of the static model equations;
%                                                       columns: variables in declaration order
%                                                       rows: equations in order of declaration
%   g2        [M_.endo_nbr by (M_.endo_nbr)^2] double   Hessian matrix of the static model equations;
%                                                       columns: variables in declaration order
%                                                       rows: equations in order of declaration
%   g3        [M_.endo_nbr by (M_.endo_nbr)^3] double   Third derivatives matrix of the static model equations;
%                                                       columns: variables in declaration order
%                                                       rows: equations in order of declaration
%
%
% Warning : this file is generated automatically by Dynare
%           from model file (.mod)

residual = zeros( 9, 1);

%
% Model equations
%

uc__ = params(3)*y(2)^(-1);
ucp__ = params(3)*y(2)^(-1);
ul__ = (-params(4))*(1-y(4))^(-1);
fk__ = params(5)*y(1)/y(3);
fl__ = y(1)*(1-params(5))/y(4);
T48 = y(3)^params(5);
T49 = y(5)*T48;
T50 = y(4)^(1-params(5));
lhs =uc__;
rhs =params(1)*ucp__*(1-params(2)+y(6));
residual(1)= lhs-rhs;
lhs =y(7);
rhs =(-ul__)/uc__;
residual(2)= lhs-rhs;
lhs =y(3);
rhs =y(3)*(1-params(2))+y(8);
residual(3)= lhs-rhs;
lhs =y(1);
rhs =y(2)+y(8);
residual(4)= lhs-rhs;
lhs =y(1);
rhs =T49*T50;
residual(5)= lhs-rhs;
lhs =y(9);
rhs =1;
residual(6)= lhs-rhs;
lhs =y(7);
rhs =y(9)*fl__;
residual(7)= lhs-rhs;
lhs =y(6);
rhs =y(9)*fk__;
residual(8)= lhs-rhs;
lhs =log(y(5));
rhs =log(y(5))*params(6)+x(1);
residual(9)= lhs-rhs;
if ~isreal(residual)
  residual = real(residual)+imag(residual).^2;
end
if nargout >= 2,
  g1 = zeros(9, 9);

  %
  % Jacobian matrix
  %

T74 = params(3)*getPowerDeriv(y(2),(-1),1);
  g1(1,2)=T74-(1-params(2)+y(6))*params(1)*T74;
  g1(1,6)=(-(params(1)*ucp__));
  g1(2,2)=(-((-((-ul__)*T74))/(uc__*uc__)));
  g1(2,4)=(-((-((-params(4))*(-(getPowerDeriv(1-y(4),(-1),1)))))/uc__));
  g1(2,7)=1;
  g1(3,3)=1-(1-params(2));
  g1(3,8)=(-1);
  g1(4,1)=1;
  g1(4,2)=(-1);
  g1(4,8)=(-1);
  g1(5,1)=1;
  g1(5,3)=(-(T50*y(5)*getPowerDeriv(y(3),params(5),1)));
  g1(5,4)=(-(T49*getPowerDeriv(y(4),1-params(5),1)));
  g1(5,5)=(-(T48*T50));
  g1(6,9)=1;
  g1(7,1)=(-(y(9)*(1-params(5))/y(4)));
  g1(7,4)=(-(y(9)*(-(y(1)*(1-params(5))))/(y(4)*y(4))));
  g1(7,7)=1;
  g1(7,9)=(-fl__);
  g1(8,1)=(-(y(9)*params(5)/y(3)));
  g1(8,3)=(-(y(9)*(-(params(5)*y(1)))/(y(3)*y(3))));
  g1(8,6)=1;
  g1(8,9)=(-fk__);
  g1(9,5)=1/y(5)-params(6)*1/y(5);
  if ~isreal(g1)
    g1 = real(g1)+2*imag(g1);
  end
if nargout >= 3,
  %
  % Hessian matrix
  %

  g2 = sparse([],[],[],9,81);
if nargout >= 4,
  %
  % Third order derivatives
  %

  g3 = sparse([],[],[],9,729);
end
end
end
end
