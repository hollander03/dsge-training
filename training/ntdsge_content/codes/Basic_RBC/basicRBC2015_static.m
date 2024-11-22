function [residual, g1, g2, g3] = basicRBC2015_static(y, x, params)
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

residual = zeros( 7, 1);

%
% Model equations
%

R__ = 1/params(2);
KY__ = params(1)/(R__-(1-params(3)));
CY__ = 1-params(3)*KY__;
lhs =y(1);
rhs =CY__*y(2)+params(3)*KY__*y(4);
residual(1)= lhs-rhs;
residual(2) = 1/params(5)*y(6);
lhs =y(2)*params(5);
rhs =y(1)-y(3);
residual(3)= lhs-rhs;
lhs =y(6);
rhs =params(1)*1/KY__*(y(1)-y(5));
residual(4)= lhs-rhs;
lhs =y(5);
rhs =(1-params(3))*y(5)+params(3)*y(4);
residual(5)= lhs-rhs;
lhs =y(1);
rhs =y(7)+params(1)*y(5)+y(3)*(1-params(1));
residual(6)= lhs-rhs;
lhs =y(7);
rhs =y(7)*params(4)+x(1);
residual(7)= lhs-rhs;
if ~isreal(residual)
  residual = real(residual)+imag(residual).^2;
end
if nargout >= 2,
  g1 = zeros(7, 7);

  %
  % Jacobian matrix
  %

  g1(1,1)=1;
  g1(1,2)=(-CY__);
  g1(1,4)=(-(params(3)*KY__));
  g1(2,6)=1/params(5);
  g1(3,1)=(-1);
  g1(3,2)=params(5);
  g1(3,3)=1;
  g1(4,1)=(-(params(1)*1/KY__));
  g1(4,5)=params(1)*1/KY__;
  g1(4,6)=1;
  g1(5,4)=(-params(3));
  g1(5,5)=1-(1-params(3));
  g1(6,1)=1;
  g1(6,3)=(-(1-params(1)));
  g1(6,5)=(-params(1));
  g1(6,7)=(-1);
  g1(7,7)=1-params(4);
  if ~isreal(g1)
    g1 = real(g1)+2*imag(g1);
  end
if nargout >= 3,
  %
  % Hessian matrix
  %

  g2 = sparse([],[],[],7,49);
if nargout >= 4,
  %
  % Third order derivatives
  %

  g3 = sparse([],[],[],7,343);
end
end
end
end
