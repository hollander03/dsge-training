function [residual, g1, g2, g3] = rbc_nonlinear_stoch2_static(y, x, params)
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

residual = zeros( 12, 1);

%
% Model equations
%

uc__ = params(3)*y(2)^(-params(5));
ucp__ = params(3)*y(2)^(-params(5));
ul__ = (-params(4))*(1-y(4))^(-params(6));
T59 = y(3)^params(7);
T60 = y(5)*T59;
T61 = y(4)^(1-params(7));
lhs =y(11);
rhs =params(7)*y(1)/y(3);
residual(1)= lhs-rhs;
lhs =y(12);
rhs =y(1)*(1-params(7))/y(4);
residual(2)= lhs-rhs;
lhs =uc__;
rhs =params(1)*ucp__*(1-params(2)+y(6))+y(10)-1;
residual(3)= lhs-rhs;
lhs =y(7);
rhs =(-ul__)/uc__;
residual(4)= lhs-rhs;
lhs =y(3);
rhs =y(3)*(1-params(2))+y(8);
residual(5)= lhs-rhs;
lhs =y(1);
rhs =y(2)+y(8);
residual(6)= lhs-rhs;
lhs =y(1);
rhs =T60*T61;
residual(7)= lhs-rhs;
lhs =y(9);
rhs =1;
residual(8)= lhs-rhs;
lhs =y(7);
rhs =y(12)*y(9)-(y(10)-1);
residual(9)= lhs-rhs;
lhs =y(6);
rhs =y(11)*y(9);
residual(10)= lhs-rhs;
lhs =log(y(5));
rhs =log(y(5))*params(8)+x(1);
residual(11)= lhs-rhs;
lhs =log(y(10));
rhs =log(y(10))*params(9)+x(2);
residual(12)= lhs-rhs;
if ~isreal(residual)
  residual = real(residual)+imag(residual).^2;
end
if nargout >= 2,
  g1 = zeros(12, 12);

  %
  % Jacobian matrix
  %

T88 = params(3)*getPowerDeriv(y(2),(-params(5)),1);
  g1(1,1)=(-(params(7)/y(3)));
  g1(1,3)=(-((-(params(7)*y(1)))/(y(3)*y(3))));
  g1(1,11)=1;
  g1(2,1)=(-((1-params(7))/y(4)));
  g1(2,4)=(-((-(y(1)*(1-params(7))))/(y(4)*y(4))));
  g1(2,12)=1;
  g1(3,2)=T88-(1-params(2)+y(6))*params(1)*T88;
  g1(3,6)=(-(params(1)*ucp__));
  g1(3,10)=(-1);
  g1(4,2)=(-((-((-ul__)*T88))/(uc__*uc__)));
  g1(4,4)=(-((-((-params(4))*(-(getPowerDeriv(1-y(4),(-params(6)),1)))))/uc__));
  g1(4,7)=1;
  g1(5,3)=1-(1-params(2));
  g1(5,8)=(-1);
  g1(6,1)=1;
  g1(6,2)=(-1);
  g1(6,8)=(-1);
  g1(7,1)=1;
  g1(7,3)=(-(T61*y(5)*getPowerDeriv(y(3),params(7),1)));
  g1(7,4)=(-(T60*getPowerDeriv(y(4),1-params(7),1)));
  g1(7,5)=(-(T59*T61));
  g1(8,9)=1;
  g1(9,7)=1;
  g1(9,9)=(-y(12));
  g1(9,10)=1;
  g1(9,12)=(-y(9));
  g1(10,6)=1;
  g1(10,9)=(-y(11));
  g1(10,11)=(-y(9));
  g1(11,5)=1/y(5)-params(8)*1/y(5);
  g1(12,10)=1/y(10)-params(9)*1/y(10);
  if ~isreal(g1)
    g1 = real(g1)+2*imag(g1);
  end
if nargout >= 3,
  %
  % Hessian matrix
  %

  g2 = sparse([],[],[],12,144);
if nargout >= 4,
  %
  % Third order derivatives
  %

  g3 = sparse([],[],[],12,1728);
end
end
end
end
