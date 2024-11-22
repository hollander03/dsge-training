function [residual, g1, g2, g3] = NCGmodel_est_dynamic(y, x, params, steady_state, it_)
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

residual = zeros(4, 1);
T10 = y(3)^params(5);
T14 = (1-y(5))^(1-params(5));
T15 = T10*T14;
T18 = T15^(1-params(6));
T22 = y(7)^params(5);
T25 = (1-y(8))^(1-params(5));
T26 = T22*T25;
T27 = T26^(1-params(6));
T29 = params(1)*T27/y(7);
T37 = params(3)*exp(y(2))*y(1)^(params(3)-1);
T39 = y(5)^(1-params(3));
T43 = 1+T37*T39-params(2);
T48 = exp(y(2))*(1-params(3))*params(5)/(1-params(5));
T49 = y(1)^params(3);
T52 = y(5)^(-params(3));
T54 = (1-y(5))*T48*T49*T52;
lhs =T18/y(3);
rhs =T29*T43;
residual(1)= lhs-rhs;
lhs =y(3);
rhs =T54;
residual(2)= lhs-rhs;
lhs =y(4);
rhs =(1-params(3))*y(5)*exp(y(2))*T49-y(3)+y(1)*(1-params(2));
residual(3)= lhs-rhs;
lhs =y(6);
rhs =y(2)*params(4)+params(7)*x(it_, 1);
residual(4)= lhs-rhs;
if nargout >= 2,
  g1 = zeros(4, 9);

  %
  % Jacobian matrix
  %

T73 = getPowerDeriv(y(3),params(5),1);
T74 = T14*T73;
T75 = getPowerDeriv(T15,1-params(6),1);
T76 = T74*T75;
T81 = getPowerDeriv(y(7),params(5),1);
T82 = T25*T81;
T83 = getPowerDeriv(T26,1-params(6),1);
T84 = T82*T83;
T89 = params(1)*(y(7)*T84-T27)/(y(7)*y(7));
T93 = params(3)*exp(y(2))*getPowerDeriv(y(1),params(3)-1,1);
T94 = T39*T93;
T97 = getPowerDeriv(y(1),params(3),1);
T108 = (-(getPowerDeriv(1-y(5),1-params(5),1)));
T109 = T10*T108;
T112 = getPowerDeriv(y(5),1-params(3),1);
T113 = T37*T112;
T116 = getPowerDeriv(y(5),(-params(3)),1);
T125 = (-(getPowerDeriv(1-y(8),1-params(5),1)));
T126 = T22*T125;
T129 = params(1)*T83*T126/y(7);
  g1(1,3)=(y(3)*T76-T18)/(y(3)*y(3));
  g1(1,7)=(-(T43*T89));
  g1(1,1)=(-(T29*T94));
  g1(1,5)=T75*T109/y(3)-T29*T113;
  g1(1,8)=(-(T43*T129));
  g1(1,2)=(-(T29*T37*T39));
  g1(2,3)=1;
  g1(2,1)=(-((1-y(5))*T52*T48*T97));
  g1(2,5)=(-((-(T48*T49*T52))+(1-y(5))*T48*T49*T116));
  g1(2,2)=(-T54);
  g1(3,3)=1;
  g1(3,1)=(-(1-params(2)+(1-params(3))*y(5)*exp(y(2))*T97));
  g1(3,4)=1;
  g1(3,5)=(-((1-params(3))*exp(y(2))*T49));
  g1(3,2)=(-((1-params(3))*y(5)*exp(y(2))*T49));
  g1(4,2)=(-params(4));
  g1(4,6)=1;
  g1(4,9)=(-params(7));

if nargout >= 3,
  %
  % Hessian matrix
  %

  v2 = zeros(45,3);
T140 = getPowerDeriv(T15,1-params(6),2);
T141 = T74*T140;
T156 = getPowerDeriv(T26,1-params(6),2);
T157 = T82*T156;
T234 = getPowerDeriv(y(1),params(3),2);
  v2(1,1)=1;
  v2(1,2)=21;
  v2(1,3)=(y(3)*y(3)*(T76+y(3)*(T75*T14*getPowerDeriv(y(3),params(5),2)+T74*T141)-T76)-(y(3)*T76-T18)*(y(3)+y(3)))/(y(3)*y(3)*y(3)*y(3));
  v2(2,1)=1;
  v2(2,2)=61;
  v2(2,3)=(-(T43*params(1)*(y(7)*y(7)*(T84+y(7)*(T83*T25*getPowerDeriv(y(7),params(5),2)+T82*T157)-T84)-(y(7)*T84-T27)*(y(7)+y(7)))/(y(7)*y(7)*y(7)*y(7))));
  v2(3,1)=1;
  v2(3,2)=7;
  v2(3,3)=(-(T89*T94));
  v2(4,1)=1;
  v2(4,2)=55;
  v2(4,3)=  v2(3,3);
  v2(5,1)=1;
  v2(5,2)=1;
  v2(5,3)=(-(T29*T39*params(3)*exp(y(2))*getPowerDeriv(y(1),params(3)-1,2)));
  v2(6,1)=1;
  v2(6,2)=39;
  v2(6,3)=(y(3)*(T109*T141+T75*T73*T108)-T75*T109)/(y(3)*y(3));
  v2(7,1)=1;
  v2(7,2)=23;
  v2(7,3)=  v2(6,3);
  v2(8,1)=1;
  v2(8,2)=43;
  v2(8,3)=(-(T89*T113));
  v2(9,1)=1;
  v2(9,2)=59;
  v2(9,3)=  v2(8,3);
  v2(10,1)=1;
  v2(10,2)=37;
  v2(10,3)=(-(T29*T93*T112));
  v2(11,1)=1;
  v2(11,2)=5;
  v2(11,3)=  v2(10,3);
  v2(12,1)=1;
  v2(12,2)=41;
  v2(12,3)=(T109*T109*T140+T75*T10*getPowerDeriv(1-y(5),1-params(5),2))/y(3)-T29*T37*getPowerDeriv(y(5),1-params(3),2);
  v2(13,1)=1;
  v2(13,2)=70;
  v2(13,3)=(-(T43*params(1)*(y(7)*(T126*T157+T83*T81*T125)-T83*T126)/(y(7)*y(7))));
  v2(14,1)=1;
  v2(14,2)=62;
  v2(14,3)=  v2(13,3);
  v2(15,1)=1;
  v2(15,2)=64;
  v2(15,3)=(-(T94*T129));
  v2(16,1)=1;
  v2(16,2)=8;
  v2(16,3)=  v2(15,3);
  v2(17,1)=1;
  v2(17,2)=68;
  v2(17,3)=(-(T113*T129));
  v2(18,1)=1;
  v2(18,2)=44;
  v2(18,3)=  v2(17,3);
  v2(19,1)=1;
  v2(19,2)=71;
  v2(19,3)=(-(T43*params(1)*(T126*T126*T156+T83*T22*getPowerDeriv(1-y(8),1-params(5),2))/y(7)));
  v2(20,1)=1;
  v2(20,2)=16;
  v2(20,3)=(-(T37*T39*T89));
  v2(21,1)=1;
  v2(21,2)=56;
  v2(21,3)=  v2(20,3);
  v2(22,1)=1;
  v2(22,2)=10;
  v2(22,3)=(-(T29*T94));
  v2(23,1)=1;
  v2(23,2)=2;
  v2(23,3)=  v2(22,3);
  v2(24,1)=1;
  v2(24,2)=14;
  v2(24,3)=(-(T29*T113));
  v2(25,1)=1;
  v2(25,2)=38;
  v2(25,3)=  v2(24,3);
  v2(26,1)=1;
  v2(26,2)=17;
  v2(26,3)=(-(T37*T39*T129));
  v2(27,1)=1;
  v2(27,2)=65;
  v2(27,3)=  v2(26,3);
  v2(28,1)=1;
  v2(28,2)=11;
  v2(28,3)=(-(T29*T37*T39));
  v2(29,1)=2;
  v2(29,2)=1;
  v2(29,3)=(-((1-y(5))*T52*T48*T234));
  v2(30,1)=2;
  v2(30,2)=37;
  v2(30,3)=(-((-(T52*T48*T97))+(1-y(5))*T48*T97*T116));
  v2(31,1)=2;
  v2(31,2)=5;
  v2(31,3)=  v2(30,3);
  v2(32,1)=2;
  v2(32,2)=41;
  v2(32,3)=(-((-(T48*T49*T116))+(-(T48*T49*T116))+(1-y(5))*T48*T49*getPowerDeriv(y(5),(-params(3)),2)));
  v2(33,1)=2;
  v2(33,2)=10;
  v2(33,3)=(-((1-y(5))*T52*T48*T97));
  v2(34,1)=2;
  v2(34,2)=2;
  v2(34,3)=  v2(33,3);
  v2(35,1)=2;
  v2(35,2)=14;
  v2(35,3)=(-((-(T48*T49*T52))+(1-y(5))*T48*T49*T116));
  v2(36,1)=2;
  v2(36,2)=38;
  v2(36,3)=  v2(35,3);
  v2(37,1)=2;
  v2(37,2)=11;
  v2(37,3)=(-T54);
  v2(38,1)=3;
  v2(38,2)=1;
  v2(38,3)=(-((1-params(3))*y(5)*exp(y(2))*T234));
  v2(39,1)=3;
  v2(39,2)=37;
  v2(39,3)=(-((1-params(3))*exp(y(2))*T97));
  v2(40,1)=3;
  v2(40,2)=5;
  v2(40,3)=  v2(39,3);
  v2(41,1)=3;
  v2(41,2)=10;
  v2(41,3)=(-((1-params(3))*y(5)*exp(y(2))*T97));
  v2(42,1)=3;
  v2(42,2)=2;
  v2(42,3)=  v2(41,3);
  v2(43,1)=3;
  v2(43,2)=14;
  v2(43,3)=(-((1-params(3))*exp(y(2))*T49));
  v2(44,1)=3;
  v2(44,2)=38;
  v2(44,3)=  v2(43,3);
  v2(45,1)=3;
  v2(45,2)=11;
  v2(45,3)=(-((1-params(3))*y(5)*exp(y(2))*T49));
  g2 = sparse(v2(:,1),v2(:,2),v2(:,3),4,81);
if nargout >= 4,
  %
  % Third order derivatives
  %

  g3 = sparse([],[],[],4,729);
end
end
end
end
