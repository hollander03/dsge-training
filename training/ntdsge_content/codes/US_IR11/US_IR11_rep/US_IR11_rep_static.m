function [residual, g1, g2, g3] = US_IR11_rep_static(y, x, params)
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

residual = zeros( 14, 1);

%
% Model equations
%

T29 = params(7)^2+params(8)*params(1)^2;
lhs =y(1);
rhs =y(1)*params(5)+x(1);
residual(1)= lhs-rhs;
lhs =(params(7)-params(8)*params(1))*(params(7)-params(1))*y(2);
rhs =params(7)*params(1)*y(3)-y(3)*T29+y(3)*params(7)*params(8)*params(1)+y(1)*(params(7)-params(1))*(params(7)-params(5)*params(8)*params(1))-params(7)*params(1)*y(4);
residual(2)= lhs-rhs;
lhs =y(2);
rhs =y(2)+y(5)-y(6);
residual(3)= lhs-rhs;
lhs =y(7);
rhs =y(7)*params(6)+x(2);
residual(4)= lhs-rhs;
lhs =y(4);
rhs =x(3);
residual(5)= lhs-rhs;
lhs =y(6)*(1+params(8)*params(2));
rhs =y(7)+y(6)*params(2)+params(8)*y(6)-y(2)*params(9)+y(1)*params(9);
residual(6)= lhs-rhs;
lhs =0;
rhs =y(6)*params(3)+params(4)*y(8)+x(4);
residual(7)= lhs-rhs;
lhs =y(8);
rhs =y(4);
residual(8)= lhs-rhs;
lhs =0;
rhs =params(7)*params(1)*y(9)-T29*y(9)+params(7)*params(8)*params(1)*y(9)+y(1)*params(8)*params(1)*(params(7)-params(1))*(1-params(5))-params(7)*params(1)*y(4);
residual(9)= lhs-rhs;
lhs =y(10);
rhs =y(3)-y(9);
residual(10)= lhs-rhs;
lhs =y(11);
rhs =y(6)*4;
residual(11)= lhs-rhs;
lhs =y(12);
rhs =y(5)*4;
residual(12)= lhs-rhs;
lhs =y(14);
rhs =y(4)+y(14);
residual(13)= lhs-rhs;
lhs =y(13);
rhs =y(3)+y(14);
residual(14)= lhs-rhs;
if ~isreal(residual)
  residual = real(residual)+imag(residual).^2;
end
if nargout >= 2,
  g1 = zeros(14, 14);

  %
  % Jacobian matrix
  %

  g1(1,1)=1-params(5);
  g1(2,1)=(-((params(7)-params(1))*(params(7)-params(5)*params(8)*params(1))));
  g1(2,2)=(params(7)-params(8)*params(1))*(params(7)-params(1));
  g1(2,3)=(-(params(7)*params(8)*params(1)+params(7)*params(1)-T29));
  g1(2,4)=params(7)*params(1);
  g1(3,5)=(-1);
  g1(3,6)=1;
  g1(4,7)=1-params(6);
  g1(5,4)=1;
  g1(6,1)=(-params(9));
  g1(6,2)=params(9);
  g1(6,6)=1+params(8)*params(2)-(params(8)+params(2));
  g1(6,7)=(-1);
  g1(7,6)=(-params(3));
  g1(7,8)=(-params(4));
  g1(8,4)=(-1);
  g1(8,8)=1;
  g1(9,1)=(-(params(8)*params(1)*(params(7)-params(1))*(1-params(5))));
  g1(9,4)=params(7)*params(1);
  g1(9,9)=(-(params(7)*params(8)*params(1)+params(7)*params(1)-T29));
  g1(10,3)=(-1);
  g1(10,9)=1;
  g1(10,10)=1;
  g1(11,6)=(-4);
  g1(11,11)=1;
  g1(12,5)=(-4);
  g1(12,12)=1;
  g1(13,4)=(-1);
  g1(14,3)=(-1);
  g1(14,13)=1;
  g1(14,14)=(-1);
  if ~isreal(g1)
    g1 = real(g1)+2*imag(g1);
  end
if nargout >= 3,
  %
  % Hessian matrix
  %

  g2 = sparse([],[],[],14,196);
if nargout >= 4,
  %
  % Third order derivatives
  %

  g3 = sparse([],[],[],14,2744);
end
end
end
end
