function [T,M,eu] = linmodel(P,S,V)

% [T,M,eu] = linmodel(P,S,V)
%   Solves the log-linear model with GENSYS
% Inputs:
%     P     :   Structure of parameters
%     S     :   Structure of steady state values
%     V     :   Structure of variable locations and names
% Output:
%     T     :   Transition matrix
%     M     :   Impact matrix
%     eu	:   [existence, uniqueness]

%----------------------------------------------------------
%   Initialize GENSYS components
% Cast the system in Gensys form
% G0*X(t) = G1*X(t-1) + Psi*e(t) + Pi*eta(t) + CC
%----------------------------------------------------------
G0 = zeros(V.nvar);
G1 = zeros(V.nvar);
Psi = zeros(V.nvar,V.nshock);
Pi = zeros(V.nvar,V.nfore);
CC = zeros(V.nvar,1);
j = 0;
%----------------------------------------------------
j=j+1;%	[1. Savers' Lambda (Lagrangian multiplier)]
%----------------------------------------------------
G0(j,V.lambdas) = -1;
G0(j,V.ub) = 1;
G0(j,V.tauc) = -P.tauc/(1+P.tauc);
G0(j,V.cs) = -P.gamm/(1-P.thetac);
G1(j,V.cs) = -P.gamm*P.thetac/(1-P.thetac);
%----------------------------------------------------
j=j+1;%	[2. Euler Equation for domestic bonds]
%----------------------------------------------------
if P.omegap == 0 && P.etap == 0
    G0(j,V.lambdas) = 1;
    G0(j,V.r) = -1;
    G0(j,V.xlambdas) = -1;
else
    G0(j,V.lambdas) = 1;
    G0(j,V.R) = -1;
    G0(j,V.xlambdas) = -1;
    G0(j,V.xpiC) = 1;
end
%----------------------------------------------------
j=j+1;%	[3. Investment FOC]
%----------------------------------------------------
G0(j,V.i) = (1+P.bet)*P.s;
G0(j,V.ui) = -1; 
G0(j,V.xi) = -P.bet*P.s;
G0(j,V.q) = -1;
G0(j,V.pI) = 1;
G1(j,V.i) = P.s;
%----------------------------------------------------
j=j+1;%	[4. Tobin's Q equation]
%----------------------------------------------------
G0(j,V.q) = 1;
G0(j,V.lambdas) = 1;
G0(j,V.xlambdas) = -1;
G0(j,V.xq) = -P.bet*(1-P.delt);
G0(j,V.xrk) = -P.bet*S.rk*(1-P.tauk);
G0(j,V.xtauk) = P.tauk*P.bet*S.rk;
%----------------------------------------------------
j=j+1;%	[5. Capital accumulation equation]
%----------------------------------------------------
G0(j,V.kbar) = 1;
G0(j,V.i) = -P.delt;
G1(j,V.kbar) = 1-P.delt;
%----------------------------------------------------
j=j+1;%	[6. Effective capital]
%----------------------------------------------------
G0(j,V.k) = 1;
G0(j,V.u) = -1;
G1(j,V.kbar) = 1;
%----------------------------------------------------
j=j+1;%	[7. Capacity Utilization]
%----------------------------------------------------
G0(j,V.u) = -1;
G0(j,V.rk) = P.psiparam;
G0(j,V.tauk) = -P.psiparam*P.tauk/(1-P.tauk);
G0(j,V.pI) = -P.psiparam;
%----------------------------------------------------
j=j+1;%	[8. Home domestic Phillips equation]
%----------------------------------------------------
G0(j,V.piH) = P.lampi;
G0(j,V.xpiH) = -P.lampi*P.bet/(1+P.bet*P.chip);
G0(j,V.mc) = -1;
G0(j,V.pH) = 1;
G1(j,V.piH) = P.lampi*P.chip/(1+P.bet*P.chip);
%----------------------------------------------------
j=j+1;%	[9. Unions FOC for wage]
%----------------------------------------------------
G0(j,V.w) = P.lamwage + 1;
G0(j,V.xw) = -P.lamwage*P.bet/(1+P.bet);
G0(j,V.xpiC) = -P.lamwage*P.bet/(1+P.bet);
G0(j,V.piC) = P.lamwage*(1 + P.bet*P.chiw)/(1 + P.bet);
G0(j,V.l) = -P.xi;
G0(j,V.lambdas) = 1;
G0(j,V.taul) = -(P.taul/(1-P.taul));
G0(j,V.ub) = -1;
G1(j,V.w) = P.lamwage/(1+P.bet);
G1(j,V.piC) = P.lamwage*P.chiw/(1 + P.bet);
%----------------------------------------------------
j=j+1;%	[10. Aggregate wage evolution ]
%----------------------------------------------------
G0(j,V.w) = 1;
G0(j,V.wtilde) = (P.omegaw - 1);
G0(j,V.piC) = P.omegaw;
G1(j,V.w) = P.omegaw;
G1(j,V.piC) = P.omegaw*P.chiw;
%----------------------------------------------------
j=j+1;%	[11. Marginal cost]
%----------------------------------------------------
G0(j,V.mc) = 1;
G0(j,V.rk) = -P.alph;
G0(j,V.w) = P.alph-1;
G0(j,V.ua) = 1;
%----------------------------------------------------
j=j+1;%	[12. Production function]
%----------------------------------------------------
G0(j,V.y) = 1;
G0(j,V.k) = -((S.y+S.Omeg)/S.y)*P.alph;
G0(j,V.l) = -((S.y+S.Omeg)/S.y)*(1-P.alph);
G0(j,V.ua) = -((S.y+S.Omeg)/S.y);
%----------------------------------------------------
j=j+1;%	[13. Production factors]
%----------------------------------------------------
G0(j,V.rk) = 1;
G0(j,V.w) = -1;
G0(j,V.k) = 1;
G0(j,V.l) = -1;
%----------------------------------------------------
j=j+1;%	[14. Taylor rule]
%----------------------------------------------------
G0(j,V.R) = 1;
G0(j,V.piC) = -(1-P.rhor)*P.phipi;
G0(j,V.y) = -(1-P.rhor)*P.phiy;
G0(j,V.S) = -(1-P.rhor)*P.phis; % er response
G0(j,V.um) = -1;
G1(j,V.R) = P.rhor;
%----------------------------------------------------
j=j+1;%	[15. Consumption aggregation]
%----------------------------------------------------
G0(j,V.c) = S.c;
G0(j,V.cs) = -(1-P.muHH)*S.cs;
G0(j,V.cn) = -P.muHH*S.cn;
%----------------------------------------------------
j=j+1;%	[16. Non-savers household's budget]
%----------------------------------------------------
G0(j,V.cn) = S.cn*(1+P.tauc);
G0(j,V.tauc) = P.tauc*S.cn;
G0(j,V.w) = -S.w*S.l*(1-P.taul);
G0(j,V.l) = -S.w*S.l*(1-P.taul);
G0(j,V.taul) = S.w*S.l*P.taul;
G0(j,V.zn) = -S.zn;
%----------------------------------------------------
j=j+1;%	[17. Aggregate resouce constraint]
%----------------------------------------------------
G0(j,V.y) = S.y;
G0(j,V.cH) = -S.cH;
G0(j,V.iH) = -S.iH;
G0(j,V.gH) = -S.gH;
G0(j,V.ex) = -S.ex; % this line is modified, 3/1/2017
%----------------------------------------------------
j=j+1;%	[18. Government budget constraint]
%----------------------------------------------------
if P.omegap == 0 && P.etap == 0
    G0(j,V.b) = P.sb;
    G0(j,V.gc) = -P.sgc*S.pG;
    G0(j,V.pG) = -P.sgc*S.pG; % <<< 180705
    G0(j,V.tauk) = P.tauk*S.rk*S.ky;
    G0(j,V.rk) = P.tauk*S.rk*S.ky;
    G0(j,V.k) = P.tauk*S.rk*S.ky;
    G0(j,V.taul) = P.taul*S.w*S.ly;
    G0(j,V.w) = P.taul*S.w*S.ly;
    G0(j,V.l) = P.taul*S.w*S.ly;
    G0(j,V.c) = P.tauc*S.cy;
    G0(j,V.tauc) = P.tauc*S.cy;
    G0(j,V.zsum) = -S.z/S.y;
    G1(j,V.r) = S.R*P.sb;
    G1(j,V.b) = S.R*P.sb;
else
    G0(j,V.b) = P.sb;
    G0(j,V.gc) = -P.sgc*S.pG;
    G0(j,V.pG) = -P.sgc*S.pG; % <<< 180705
    G0(j,V.tauk) = P.tauk*S.rk*S.ky;
    G0(j,V.rk) = P.tauk*S.rk*S.ky;
    G0(j,V.k) = P.tauk*S.rk*S.ky;
    G0(j,V.taul) = P.taul*S.w*S.ly;
    G0(j,V.w) = P.taul*S.w*S.ly;
    G0(j,V.l) = P.taul*S.w*S.ly;
    G0(j,V.c) = P.tauc*S.cy;
    G0(j,V.tauc) = P.tauc*S.cy;
    G0(j,V.zsum) = -S.z/S.y;
    G0(j,V.piC) = S.R*P.sb; 
    G1(j,V.R) = S.R*P.sb;
    G1(j,V.b) = S.R*P.sb;
end
%----------------------------------------------------
j=j+1;%	[19. Government consumption rule]
%----------------------------------------------------
G0(j,V.gc) = 1;
G0(j,V.y) = (1-P.rhogc)*P.psigc;   % added and modified, 08/07/17
G1(j,V.sb) = -(1-P.rhogc)*P.gammgc;
G1(j,V.gc) = P.rhogc;
%---modified below
G0(j,V.ugc) = -P.theta0gc;
G1(j,V.ugc) = P.theta1gc;
G1(j,V.u1gc) = P.theta2gc;
G1(j,V.u2gc) = P.theta3gc;
G1(j,V.u3gc) = P.theta4gc;
G1(j,V.u4gc) = P.theta5gc;
G1(j,V.u5gc) = P.theta6gc;
G1(j,V.u6gc) = P.theta7gc;
G1(j,V.u7gc) = P.theta8gc;
G1(j,V.u8gc) = P.theta9gc;
G1(j,V.u9gc) = P.theta10gc;
G1(j,V.u10gc) = P.theta11gc;
G1(j,V.u11gc) = P.theta12gc;
G1(j,V.u12gc) = P.theta13gc;
G1(j,V.u13gc) = P.theta14gc;
G1(j,V.u14gc) = P.theta15gc;
G1(j,V.u15gc) = P.theta16gc;
G1(j,V.u16gc) = P.theta17gc;
G1(j,V.u17gc) = P.theta18gc;
G1(j,V.u18gc) = P.theta19gc;
G1(j,V.u19gc) = P.theta20gc;
G1(j,V.u20gc) = P.theta21gc;
G1(j,V.u21gc) = P.theta22gc;
G1(j,V.u22gc) = P.theta23gc;
G1(j,V.u23gc) = P.theta24gc;
G1(j,V.u24gc) = P.theta25gc;
G1(j,V.u25gc) = P.theta26gc;
G1(j,V.u26gc) = P.theta27gc;
G1(j,V.u27gc) = P.theta28gc;
G1(j,V.u28gc) = P.theta29gc;
G1(j,V.u29gc) = P.theta30gc;
G1(j,V.u30gc) = P.theta31gc;
G1(j,V.u31gc) = P.theta32gc;
G1(j,V.u32gc) = P.theta33gc;
G1(j,V.u33gc) = P.theta34gc;
G1(j,V.u34gc) = P.theta35gc;
G1(j,V.u35gc) = P.theta36gc;
G1(j,V.u36gc) = P.theta37gc;
G1(j,V.u37gc) = P.theta38gc;
G1(j,V.u38gc) = P.theta39gc;
G1(j,V.u39gc) = P.theta40gc;
G1(j,V.u40gc) = P.theta41gc;
G1(j,V.u41gc) = P.theta42gc;
G1(j,V.u42gc) = P.theta43gc;
G1(j,V.u43gc) = P.theta44gc;
%----------------------------------------------------
j=j+1;%	[20-62. Dummies for lagged government consumption]
%----------------------------------------------------
G1(j,V.ugc) = 1;
G0(j,V.u1gc) = 1;

j=j+1;
G0(j,V.u2gc) = 1;
G1(j,V.u1gc) = 1;

j=j+1;
G0(j,V.u3gc) = 1;
G1(j,V.u2gc) = 1;

j=j+1;
G0(j,V.u4gc) = 1;
G1(j,V.u3gc) = 1;

j=j+1;
G0(j,V.u5gc) = 1;
G1(j,V.u4gc) = 1;

j=j+1;
G0(j,V.u6gc) = 1;
G1(j,V.u5gc) = 1;

j=j+1;
G0(j,V.u7gc) = 1;
G1(j,V.u6gc) = 1;

j=j+1;
G0(j,V.u8gc) = 1;
G1(j,V.u7gc) = 1;

j=j+1;
G0(j,V.u9gc) = 1;
G1(j,V.u8gc) = 1;

j=j+1;
G0(j,V.u10gc) = 1;
G1(j,V.u9gc) = 1;

j=j+1;
G0(j,V.u11gc) = 1;
G1(j,V.u10gc) = 1;

j=j+1;
G0(j,V.u12gc) = 1;
G1(j,V.u11gc) = 1;

j=j+1;
G0(j,V.u13gc) = 1;
G1(j,V.u12gc) = 1;

j=j+1;
G0(j,V.u14gc) = 1;
G1(j,V.u13gc) = 1;

j=j+1;
G0(j,V.u15gc) = 1;
G1(j,V.u14gc) = 1;

j=j+1;
G0(j,V.u16gc) = 1;
G1(j,V.u15gc) = 1;

j=j+1;
G0(j,V.u17gc) = 1;
G1(j,V.u16gc) = 1;

j=j+1;
G0(j,V.u18gc) = 1;
G1(j,V.u17gc) = 1;

j=j+1;
G0(j,V.u19gc) = 1;
G1(j,V.u18gc) = 1;

j=j+1;
G0(j,V.u20gc) = 1;
G1(j,V.u19gc) = 1;

j=j+1;
G0(j,V.u21gc) = 1;
G1(j,V.u20gc) = 1;

j=j+1;
G0(j,V.u22gc) = 1;
G1(j,V.u21gc) = 1;

j=j+1;
G0(j,V.u23gc) = 1;
G1(j,V.u22gc) = 1;

j=j+1;
G0(j,V.u24gc) = 1;
G1(j,V.u23gc) = 1;

j=j+1;
G0(j,V.u25gc) = 1;
G1(j,V.u24gc) = 1;

j=j+1;
G0(j,V.u26gc) = 1;
G1(j,V.u25gc) = 1;

j=j+1;
G0(j,V.u27gc) = 1;
G1(j,V.u26gc) = 1;

j=j+1;
G0(j,V.u28gc) = 1;
G1(j,V.u27gc) = 1;

j=j+1;
G0(j,V.u29gc) = 1;
G1(j,V.u28gc) = 1;

j=j+1;
G0(j,V.u30gc) = 1;
G1(j,V.u29gc) = 1;

j=j+1;
G0(j,V.u31gc) = 1;
G1(j,V.u30gc) = 1;

j=j+1;
G0(j,V.u32gc) = 1;
G1(j,V.u31gc) = 1;

j=j+1;
G0(j,V.u33gc) = 1;
G1(j,V.u32gc) = 1;

j=j+1;
G0(j,V.u34gc) = 1;
G1(j,V.u33gc) = 1;

j=j+1;
G0(j,V.u35gc) = 1;
G1(j,V.u34gc) = 1;

j=j+1;
G0(j,V.u36gc) = 1;
G1(j,V.u35gc) = 1;

j=j+1;
G0(j,V.u37gc) = 1;
G1(j,V.u36gc) = 1;

j=j+1;
G0(j,V.u38gc) = 1;
G1(j,V.u37gc) = 1;

j=j+1;
G0(j,V.u39gc) = 1;
G1(j,V.u38gc) = 1;

j=j+1;
G0(j,V.u40gc) = 1;
G1(j,V.u39gc) = 1;

j=j+1;
G0(j,V.u41gc) = 1;
G1(j,V.u40gc) = 1;

j=j+1;
G0(j,V.u42gc) = 1;
G1(j,V.u41gc) = 1;

j=j+1;
G0(j,V.u43gc) = 1;
G1(j,V.u42gc) = 1;
%----------------------------------------------------
j=j+1;%	[63. Capital tax rate rule]
%----------------------------------------------------
G0(j,V.tauk) = 1;
G0(j,V.utk) = -1;
G0(j,V.y) = -(1-P.rhotk)*P.psitk;
G1(j,V.sb) = (1-P.rhotk)*P.gammtk;
G1(j,V.tauk) = P.rhotk;
%----------------------------------------------------
j=j+1;%	[64. Labor tax rate rule]
%----------------------------------------------------
G0(j,V.taul) = 1;
G0(j,V.utl) = -1;
G0(j,V.y) = -(1-P.rhotl)*P.psitl;
G1(j,V.sb) = (1-P.rhotl)*P.gammtl;
G1(j,V.taul) = P.rhotl;
%----------------------------------------------------
j=j+1;%	[65. Consumption tax rate rule]
%----------------------------------------------------
G0(j,V.tauc) = 1;
G0(j,V.utc) = -1;
G1(j,V.sb) = (1-P.rhotc)*P.gammtc;
G1(j,V.tauc) = P.rhotc;
%----------------------------------------------------
j=j+1;%	[66. Savers transfers]
%----------------------------------------------------
G0(j,V.zs) = 1;
G0(j,V.zsum) = -1; 
%----------------------------------------------------
j=j+1;%	[67. Non-savers transfers]
%----------------------------------------------------
G0(j,V.zn) = 1;
G0(j,V.zsum) = -1; 
%----------------------------------------------------
j=j+1;%	[68. Transfers rule]
%----------------------------------------------------
G0(j,V.zsum) = 1;
G0(j,V.y) = (1-P.rhoz)*P.psiz;   % added and modified, 08/07/17
G1(j,V.sb) = -(1-P.rhoz)*P.gammz;
G1(j,V.zsum) = P.rhoz;
%---modified below
G0(j,V.uzsum) = -P.theta0z;
G1(j,V.uzsum) = P.theta1z;
G1(j,V.u1zsum) = P.theta2z;
G1(j,V.u2zsum) = P.theta3z;
G1(j,V.u3zsum) = P.theta4z;
G1(j,V.u4zsum) = P.theta5z;
G1(j,V.u5zsum) = P.theta6z;
G1(j,V.u6zsum) = P.theta7z;
G1(j,V.u7zsum) = P.theta8z;
G1(j,V.u8zsum) = P.theta9z;
G1(j,V.u9zsum) = P.theta10z;
G1(j,V.u10zsum) = P.theta11z;
G1(j,V.u11zsum) = P.theta12z;
G1(j,V.u12zsum) = P.theta13z;
G1(j,V.u13zsum) = P.theta14z;
G1(j,V.u14zsum) = P.theta15z;
G1(j,V.u15zsum) = P.theta16z;
G1(j,V.u16zsum) = P.theta17z;
G1(j,V.u17zsum) = P.theta18z;
G1(j,V.u18zsum) = P.theta19z;
G1(j,V.u19zsum) = P.theta20z;
G1(j,V.u20zsum) = P.theta21z;
G1(j,V.u21zsum) = P.theta22z;
G1(j,V.u22zsum) = P.theta23z;
G1(j,V.u23zsum) = P.theta24z;
G1(j,V.u24zsum) = P.theta25z;
G1(j,V.u25zsum) = P.theta26z;
G1(j,V.u26zsum) = P.theta27z;
G1(j,V.u27zsum) = P.theta28z;
G1(j,V.u28zsum) = P.theta29z;
G1(j,V.u29zsum) = P.theta30z;
G1(j,V.u30zsum) = P.theta31z;
G1(j,V.u31zsum) = P.theta32z;
G1(j,V.u32zsum) = P.theta33z;
G1(j,V.u33zsum) = P.theta34z;
G1(j,V.u34zsum) = P.theta35z;
G1(j,V.u35zsum) = P.theta36z;
G1(j,V.u36zsum) = P.theta37z;
G1(j,V.u37zsum) = P.theta38z;
G1(j,V.u38zsum) = P.theta39z;
G1(j,V.u39zsum) = P.theta40z;
G1(j,V.u40zsum) = P.theta41z;
G1(j,V.u41zsum) = P.theta42z;
G1(j,V.u42zsum) = P.theta43z;
G1(j,V.u43zsum) = P.theta44z;
%----------------------------------------------------
j=j+1;%	[69-111. Dummies for lagged government consumption]
%----------------------------------------------------
G1(j,V.uzsum) = 1;
G0(j,V.u1zsum) = 1;

j=j+1;
G0(j,V.u2zsum) = 1;
G1(j,V.u1zsum) = 1;

j=j+1;
G0(j,V.u3zsum) = 1;
G1(j,V.u2zsum) = 1;

j=j+1;
G0(j,V.u4zsum) = 1;
G1(j,V.u3zsum) = 1;

j=j+1;
G0(j,V.u5zsum) = 1;
G1(j,V.u4zsum) = 1;

j=j+1;
G0(j,V.u6zsum) = 1;
G1(j,V.u5zsum) = 1;

j=j+1;
G0(j,V.u7zsum) = 1;
G1(j,V.u6zsum) = 1;

j=j+1;
G0(j,V.u8zsum) = 1;
G1(j,V.u7zsum) = 1;

j=j+1;
G0(j,V.u9zsum) = 1;
G1(j,V.u8zsum) = 1;

j=j+1;
G0(j,V.u10zsum) = 1;
G1(j,V.u9zsum) = 1;

j=j+1;
G0(j,V.u11zsum) = 1;
G1(j,V.u10zsum) = 1;

j=j+1;
G0(j,V.u12zsum) = 1;
G1(j,V.u11zsum) = 1;

j=j+1;
G0(j,V.u13zsum) = 1;
G1(j,V.u12zsum) = 1;

j=j+1;
G0(j,V.u14zsum) = 1;
G1(j,V.u13zsum) = 1;

j=j+1;
G0(j,V.u15zsum) = 1;
G1(j,V.u14zsum) = 1;

j=j+1;
G0(j,V.u16zsum) = 1;
G1(j,V.u15zsum) = 1;

j=j+1;
G0(j,V.u17zsum) = 1;
G1(j,V.u16zsum) = 1;

j=j+1;
G0(j,V.u18zsum) = 1;
G1(j,V.u17zsum) = 1;

j=j+1;
G0(j,V.u19zsum) = 1;
G1(j,V.u18zsum) = 1;

j=j+1;
G0(j,V.u20zsum) = 1;
G1(j,V.u19zsum) = 1;

j=j+1;
G0(j,V.u21zsum) = 1;
G1(j,V.u20zsum) = 1;

j=j+1;
G0(j,V.u22zsum) = 1;
G1(j,V.u21zsum) = 1;

j=j+1;
G0(j,V.u23zsum) = 1;
G1(j,V.u22zsum) = 1;

j=j+1;
G0(j,V.u24zsum) = 1;
G1(j,V.u23zsum) = 1;

j=j+1;
G0(j,V.u25zsum) = 1;
G1(j,V.u24zsum) = 1;

j=j+1;
G0(j,V.u26zsum) = 1;
G1(j,V.u25zsum) = 1;

j=j+1;
G0(j,V.u27zsum) = 1;
G1(j,V.u26zsum) = 1;

j=j+1;
G0(j,V.u28zsum) = 1;
G1(j,V.u27zsum) = 1;

j=j+1;
G0(j,V.u29zsum) = 1;
G1(j,V.u28zsum) = 1;

j=j+1;
G0(j,V.u30zsum) = 1;
G1(j,V.u29zsum) = 1;

j=j+1;
G0(j,V.u31zsum) = 1;
G1(j,V.u30zsum) = 1;

j=j+1;
G0(j,V.u32zsum) = 1;
G1(j,V.u31zsum) = 1;

j=j+1;
G0(j,V.u33zsum) = 1;
G1(j,V.u32zsum) = 1;

j=j+1;
G0(j,V.u34zsum) = 1;
G1(j,V.u33zsum) = 1;

j=j+1;
G0(j,V.u35zsum) = 1;
G1(j,V.u34zsum) = 1;

j=j+1;
G0(j,V.u36zsum) = 1;
G1(j,V.u35zsum) = 1;

j=j+1;
G0(j,V.u37zsum) = 1;
G1(j,V.u36zsum) = 1;

j=j+1;
G0(j,V.u38zsum) = 1;
G1(j,V.u37zsum) = 1;

j=j+1;
G0(j,V.u39zsum) = 1;
G1(j,V.u38zsum) = 1;

j=j+1;
G0(j,V.u40zsum) = 1;
G1(j,V.u39zsum) = 1;

j=j+1;
G0(j,V.u41zsum) = 1;
G1(j,V.u40zsum) = 1;

j=j+1;
G0(j,V.u42zsum) = 1;
G1(j,V.u41zsum) = 1;

j=j+1;
G0(j,V.u43zsum) = 1;
G1(j,V.u42zsum) = 1;
%----------------------------------------------------
j=j+1;%	[112. Home export Phillips equation]
%----------------------------------------------------
G0(j,V.piHstar) = P.lampix;
G0(j,V.xpiHstar) = -P.lampix*P.bet/(1+P.bet*P.chipx);
G0(j,V.mc) = -1;
G0(j,V.pHstar) = 1;
G0(j,V.s) = 1;
G1(j,V.piHstar) = P.lampix*P.chipx/(1+P.bet*P.chipx);
%----------------------------------------------------
j=j+1;%	[113. Net foreign asset evolution]
%----------------------------------------------------
G0(j,V.z) = S.y;
G0(j,V.im) = S.im;
G0(j,V.pF) = S.im;
G0(j,V.s) = -S.ex;
G0(j,V.ex) = -S.ex;
G0(j,V.pHstar) = -S.ex;
G1(j,V.z) = S.Rstar*S.y;
%----------------------------------------------------
j=j+1;%	[114. Consumption final good]
%----------------------------------------------------
G0(j,V.c) = 1;
G0(j,V.cH) = -(1-P.nuc);
G0(j,V.cF) = -P.nuc;
%----------------------------------------------------
j=j+1;%	[115. Consumption price index]
%----------------------------------------------------
G0(j,V.pH) = 1-P.nuc;
G0(j,V.pF) = P.nuc;
%----------------------------------------------------
j=j+1;%	[116. Foreign consumption demand]
%----------------------------------------------------
G0(j,V.cF) = 1;
G0(j,V.pF)= P.muc;
G0(j,V.c) = -1;
%----------------------------------------------------
j=j+1;%	[117. Investment final good]
%----------------------------------------------------
G0(j,V.i) = 1;
G0(j,V.u) = S.psi1/P.delt;
G0(j,V.iH) = -(1-P.nui);
G0(j,V.iF) = -P.nui;
%----------------------------------------------------
j=j+1;%	[118. Investment price index]
%----------------------------------------------------
G0(j,V.pH) = 1-P.nui;
G0(j,V.pF) = P.nui;
G0(j,V.pI) = -1;
%----------------------------------------------------
j=j+1;%	[119. Foreign investment demand]
%----------------------------------------------------
G0(j,V.iF) = 1;
G0(j,V.pF)= P.mui;
G0(j,V.i) = -1;
G0(j,V.u) = -S.psi1/P.delt;
%----------------------------------------------------
j=j+1;%	[120. Government final good]
%----------------------------------------------------
G0(j,V.gc) = 1;
G0(j,V.gH) = -(1-P.nug);
G0(j,V.gF) = -P.nug;
%----------------------------------------------------
j=j+1;%	[121. Government price index]
%----------------------------------------------------
G0(j,V.pH) = 1-P.nug;
G0(j,V.pF) = P.nug;
G0(j,V.pG) = -1;
%----------------------------------------------------
j=j+1;%	[122. Foreign government demand]
%----------------------------------------------------
G0(j,V.gF) = 1;
G0(j,V.pF)= P.mug;
G0(j,V.gc) = -1;
%----------------------------------------------------
j=j+1;%	[123. Home imports]
%----------------------------------------------------
G0(j,V.im) = S.im;
G0(j,V.cF) = -S.cF;
G0(j,V.iF) = -S.iF;
G0(j,V.gF) = -S.gF;
%----------------------------------------------------
j=j+1;%	[124. Domestic terms of trade]
%----------------------------------------------------
G0(j,V.TOT) = 1;
G0(j,V.pF) = -1;
G0(j,V.pHstar) = 1;
G0(j,V.s) = 1;
%----------------------------------------------------
j=j+1;%	[125. Home inflation relative price link]
%----------------------------------------------------
G0(j,V.piH) = 1;
G0(j,V.pH) = -1;
G0(j,V.piC) = -1;
G1(j,V.pH) = -1;
%----------------------------------------------------
j=j+1;%	[126. Export inflation relative price link]
%----------------------------------------------------
G0(j,V.piHstar) = 1;
G0(j,V.pHstar) = -1;
G0(j,V.piCstar) = -1;
G1(j,V.pHstar) = -1;
%----------------------------------------------------
j=j+1;%	[127. Nominal/real exchange link]
%----------------------------------------------------
G0(j,V.S) = 1;
G0(j,V.s) = -1;
G0(j,V.piC) = -1;
G0(j,V.piCstar) = 1;
G1(j,V.S) = 1;
G1(j,V.s) = -1;
%----------------------------------------------------
j=j+1;%	[128. Define XpiC]
%----------------------------------------------------
G0(j,V.piC) = 1;
G1(j,V.xpiC) = 1;
Pi(j,V.fepiC) = 1;
%----------------------------------------------------
j=j+1;%	[129. Define Xq]
%----------------------------------------------------
G0(j,V.q) = 1;
G1(j,V.xq) = 1;
Pi(j,V.feq) = 1;
%----------------------------------------------------
j=j+1;%	[130. Define Xrk]
%----------------------------------------------------
G0(j,V.rk) = 1;
G1(j,V.xrk) = 1;
Pi(j,V.ferk) = 1;
%----------------------------------------------------
j=j+1;%	[131. Define XI]
%----------------------------------------------------
G0(j,V.i) = 1;
G1(j,V.xi) = 1;
Pi(j,V.fei) = 1;
%----------------------------------------------------
j=j+1;%	[132. Define Xlambdas]
%----------------------------------------------------
G0(j,V.lambdas) = 1;
G1(j,V.xlambdas) = 1;
Pi(j,V.felambdas) = 1;
%----------------------------------------------------
j=j+1;%	[133. Define Xtauk]
%----------------------------------------------------
G0(j,V.tauk) = 1;
G1(j,V.xtauk) = 1;
Pi(j,V.fetauk) = 1;
%----------------------------------------------------
j=j+1;%	[134. Define Xw]
%----------------------------------------------------
G0(j,V.w) = 1;
G1(j,V.xw) = 1;
Pi(j,V.few) = 1;
%----------------------------------------------------
j=j+1;%	[135. Define XpiH]
%----------------------------------------------------
G0(j,V.piH) = 1;
G1(j,V.xpiH) = 1;
Pi(j,V.fepiH) = 1;
%----------------------------------------------------
j=j+1;%	[136. Define XpiHstar]
%----------------------------------------------------
G0(j,V.piHstar) = 1;
G1(j,V.xpiHstar) = 1;
Pi(j,V.fepiHstar) = 1;
%----------------------------------------------------
j=j+1;%	[137. Define XS]
%----------------------------------------------------
G0(j,V.s) = 1;
G1(j,V.xs) = 1;
Pi(j,V.fes) = 1;
%----------------------------------------------------
j=j+1;%	[138. Fisher equation]
%----------------------------------------------------
if P.omegap == 0 && P.etap == 0
    G0(j,V.piC) = 1;
else
    G0(j,V.r) = 1;
    G0(j,V.R) = -1;
    G0(j,V.xpiC) = 1;
end
%----------------------------------------------------
j=j+1;%	[139. After tax real wage rate]
%----------------------------------------------------
G0(j,V.atlw) = 1;
G0(j,V.w) = -1;
G0(j,V.taul) = P.taul/(1-P.taul);
%----------------------------------------------------
j=j+1;%	[140. Labor tax revenue]
%----------------------------------------------------
G0(j,V.Tl) = 1;
G0(j,V.w) = -1;
G0(j,V.taul) = -1;
G0(j,V.l) = -1;
%----------------------------------------------------
j=j+1;%	[141. Capital tax revenue]
%----------------------------------------------------
G0(j,V.Tk) = 1;
G0(j,V.rk) = -1;
G0(j,V.tauk) = -1;
G0(j,V.k) = -1;
%----------------------------------------------------
j=j+1;%	[142. Consumption tax revenue]
%----------------------------------------------------
G0(j,V.Tc) = 1;
G0(j,V.c) = -1;
G0(j,V.tauc) = -1;
%----------------------------------------------------
j=j+1;%	[143. UIP condition (exchange rate)] <<< i added rp shock 180309
%----------------------------------------------------
G0(j,V.Rstar) = -1/P.gzeta;
G0(j,V.R) = 1/P.gzeta;
G0(j,V.s) = 1/P.gzeta;
G0(j,V.xs) = -1/P.gzeta;
G0(j,V.xpiC) = -1/P.gzeta;
G0(j,V.xpiCstar) = 1/P.gzeta;
G0(j,V.z) = 1;
G0(j,V.urp) = -1/P.gzeta; 
%----------------------------------------------------
j=j+1;%	[144. Debt/output ratio]
%----------------------------------------------------
G0(j,V.sb) = 1;
G0(j,V.y) = 1;
G0(j,V.b) = -1;
%----------------------------------------------------
j=j+1;%	[145. Domestic exports]
%----------------------------------------------------
G0(j,V.ex) = 1;
G0(j,V.pHstar) = P.mux; 
G0(j,V.ystar) = -1;
%----------------------------------------------------
j=j+1;%	[146. Define XpiCstar]
%----------------------------------------------------
G0(j,V.piCstar) = 1;
G1(j,V.xpiCstar) = 1;
Pi(j,V.fepiCstar) = 1;
%----------------------------------------------------
j=j+1;%	[147. Tech. shock]
%----------------------------------------------------
G0(j,V.ua) = 1;
G1(j,V.ua) = P.rhoa;
Psi(j,V.epsua) = P.siga;
%----------------------------------------------------
j=j+1;%	[148. Monetary policy shock]
%----------------------------------------------------
G0(j,V.um) = 1;
Psi(j,V.epsum) = P.sigm;
%----------------------------------------------------
j=j+1;%	[149. Preference shock]
%----------------------------------------------------
G0(j,V.ub) = 1;
G1(j,V.ub) = P.rhob; 
Psi(j,V.epsub) = P.sigb;
%----------------------------------------------------
j=j+1;%	[150. Investment shock]
%----------------------------------------------------
G0(j,V.ui) = 1;
G1(j,V.ui) = P.rhoi;
Psi(j,V.epsui) = P.sigi;
%----------------------------------------------------
j=j+1;%	[151. government spending shock]
%----------------------------------------------------
G0(j,V.ugc) = 1;
Psi(j,V.epsugc) = P.siggc;
%----------------------------------------------------
j=j+1;%	[152. tk shock]
%----------------------------------------------------
G0(j,V.utk) = 1;
Psi(j,V.epsutk) = P.sigtk;
%----------------------------------------------------
j=j+1;%	[153. tl shock]
%----------------------------------------------------
G0(j,V.utl) = 1;
Psi(j,V.epsutl) = P.sigtl;
%----------------------------------------------------
j=j+1;%	[154. tc shock]
%----------------------------------------------------
G0(j,V.utc) = 1;
Psi(j,V.epsutc) = P.sigtc;
%----------------------------------------------------
j=j+1;%	[155. Z shock]
%----------------------------------------------------
G0(j,V.uzsum) = 1;
Psi(j,V.epsuzsum) = P.sigz;
%----------------------------------------------------
j=j+1;% [156. ystar shock]
%----------------------------------------------------
G0(j,V.ystar) = 1;
G1(j,V.ystar) = P.rhoystar;
Psi(j,V.epsystar) = P.sigystar;
%----------------------------------------------------
j=j+1;% [157. piCstar shock]
%----------------------------------------------------
G0(j,V.piCstar) = 1;
G1(j,V.piCstar) = P.rhopiCstar;
Psi(j,V.epspiCstar) = P.sigpiCstar;
%----------------------------------------------------
j=j+1;% [158. Rstar shock]
%----------------------------------------------------
G0(j,V.Rstar) = 1;
G1(j,V.Rstar) = P.rhoRstar;
Psi(j,V.epsRstar) = P.sigRstar;
%----------------------------------------------------
j=j+1;% [159. risk premium shock] % <<< i added this 180309
%----------------------------------------------------
G0(j,V.urp) = 1;
G1(j,V.urp) = P.rhorp;
Psi(j,V.epsurp) = P.sigrp;
%----------------------------------------------------
j=j+1;%	[160. Primary deficit]
%----------------------------------------------------
G0(j,V.def) = S.def;
G0(j,V.Tl) = S.tl;
G0(j,V.Tk) = S.tk;
G0(j,V.Tc) = S.tc;
G0(j,V.gc) = -S.gc;
G0(j,V.zsum) = -S.z;
%----------------------------------------------------
j=j+1;%	[161. Import price Phillips curve]
%----------------------------------------------------
G0(j,V.piF) = P.lampim;
G0(j,V.xpiF) = -P.lampim*P.bet/(1+P.bet*P.chipim);
G0(j,V.s) = -1;
G0(j,V.pF) = 1;     % pF is the relative price
G1(j,V.piF) = P.lampim*P.chipim/(1+P.bet*P.chipim);
%----------------------------------------------------
j=j+1;%	[162. Import price inflation link to the relative price]
%----------------------------------------------------
G0(j,V.piF) = 1;
G0(j,V.piC) = -1;
G0(j,V.pF) = -1;
G1(j,V.pF) = -1;
%----------------------------------------------------
j=j+1;%	[163. Define XpiF]
%----------------------------------------------------
G0(j,V.piF) = 1;
G1(j,V.xpiF) = 1;
Pi(j,V.fepiF) = 1;

%----------------------------------------------------
j=j+1;%	[164. Net exports] <<< 181215
%----------------------------------------------------
G0(j,V.nx) = 1;
G0(j,V.ex) = -1;
G0(j,V.im) = 1;

%% Obtain solution
%----------------------------------------------------------
%   Solve Linear Model
%----------------------------------------------------------
[T,~,M,~,~,~,~,eu] = gensys(G0,G1,CC,Psi,Pi);  