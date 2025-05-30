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
G0(j,V.ugc) = -1;
G0(j,V.y) = (1-P.rhogc)*P.psigc;   % added and modified, 08/07/17
G1(j,V.sb) = -(1-P.rhogc)*P.gammgc;
G1(j,V.gc) = P.rhogc;
%----------------------------------------------------
j=j+1;%	[20. Capital tax rate rule]
%----------------------------------------------------
G0(j,V.tauk) = 1;
G0(j,V.utk) = -1;
G0(j,V.y) = -(1-P.rhotk)*P.psitk;
G1(j,V.sb) = (1-P.rhotk)*P.gammtk;
G1(j,V.tauk) = P.rhotk;
%----------------------------------------------------
j=j+1;%	[21. Labor tax rate rule]
%----------------------------------------------------
G0(j,V.taul) = 1;
G0(j,V.utl) = -1;
G0(j,V.y) = -(1-P.rhotl)*P.psitl;
G1(j,V.sb) = (1-P.rhotl)*P.gammtl;
G1(j,V.taul) = P.rhotl;
%----------------------------------------------------
j=j+1;%	[22. Consumption tax rate rule]
%----------------------------------------------------
G0(j,V.tauc) = 1;
G0(j,V.utc) = -1;
G1(j,V.sb) = (1-P.rhotc)*P.gammtc;
G1(j,V.tauc) = P.rhotc;
%----------------------------------------------------
j=j+1;%	[23. Savers transfers]
%----------------------------------------------------
G0(j,V.zs) = 1;
G0(j,V.zsum) = -1; 
%----------------------------------------------------
j=j+1;%	[24. Non-savers transfers]
%----------------------------------------------------
G0(j,V.zn) = 1;
G0(j,V.zsum) = -1; 
%----------------------------------------------------
j=j+1;%	[25. Transfers rule]
%----------------------------------------------------
G0(j,V.zsum) = 1;
G0(j,V.uzsum) = -1;
G0(j,V.y) = (1-P.rhoz)*P.psiz;   % added and modified, 08/07/17
G1(j,V.sb) = -(1-P.rhoz)*P.gammz;
G1(j,V.zsum) = P.rhoz;
%----------------------------------------------------
j=j+1;%	[26. Home export Phillips equation]
%----------------------------------------------------
G0(j,V.piHstar) = P.lampix;
G0(j,V.xpiHstar) = -P.lampix*P.bet/(1+P.bet*P.chipx);
G0(j,V.mc) = -1;
G0(j,V.pHstar) = 1;
G0(j,V.s) = 1;
G1(j,V.piHstar) = P.lampix*P.chipx/(1+P.bet*P.chipx);
%----------------------------------------------------
j=j+1;%	[27. Net foreign asset evolution]
%----------------------------------------------------
G0(j,V.z) = S.y;
G0(j,V.im) = S.im;
G0(j,V.pF) = S.im;
G0(j,V.s) = -S.ex;
G0(j,V.ex) = -S.ex;
G0(j,V.pHstar) = -S.ex;
G1(j,V.z) = S.Rstar*S.y;
%----------------------------------------------------
j=j+1;%	[28. Consumption final good]
%----------------------------------------------------
G0(j,V.c) = 1;
G0(j,V.cH) = -(1-P.nuc);
G0(j,V.cF) = -P.nuc;
%----------------------------------------------------
j=j+1;%	[29. Consumption price index]
%----------------------------------------------------
G0(j,V.pH) = 1-P.nuc;
G0(j,V.pF) = P.nuc;
%----------------------------------------------------
j=j+1;%	[30. Foreign consumption demand]
%----------------------------------------------------
G0(j,V.cF) = 1;
G0(j,V.pF)= P.muc;
G0(j,V.c) = -1;
%----------------------------------------------------
j=j+1;%	[31. Investment final good]
%----------------------------------------------------
G0(j,V.i) = 1;
G0(j,V.u) = S.psi1/P.delt;
G0(j,V.iH) = -(1-P.nui);
G0(j,V.iF) = -P.nui;
%----------------------------------------------------
j=j+1;%	[32. Investment price index]
%----------------------------------------------------
G0(j,V.pH) = 1-P.nui;
G0(j,V.pF) = P.nui;
G0(j,V.pI) = -1;
%----------------------------------------------------
j=j+1;%	[33. Foreign investment demand]
%----------------------------------------------------
G0(j,V.iF) = 1;
G0(j,V.pF)= P.mui;
G0(j,V.i) = -1;
G0(j,V.u) = -S.psi1/P.delt;
%----------------------------------------------------
j=j+1;%	[34. Government final good]
%----------------------------------------------------
G0(j,V.gc) = 1;
G0(j,V.gH) = -(1-P.nug);
G0(j,V.gF) = -P.nug;
%----------------------------------------------------
j=j+1;%	[35. Government price index]
%----------------------------------------------------
G0(j,V.pH) = 1-P.nug;
G0(j,V.pF) = P.nug;
G0(j,V.pG) = -1;
%----------------------------------------------------
j=j+1;%	[36. Foreign government demand]
%----------------------------------------------------
G0(j,V.gF) = 1;
G0(j,V.pF)= P.mug;
G0(j,V.gc) = -1;
%----------------------------------------------------
j=j+1;%	[37. Home imports]
%----------------------------------------------------
G0(j,V.im) = S.im;
G0(j,V.cF) = -S.cF;
G0(j,V.iF) = -S.iF;
G0(j,V.gF) = -S.gF;
%----------------------------------------------------
j=j+1;%	[38. Domestic terms of trade]
%----------------------------------------------------
G0(j,V.TOT) = 1;
G0(j,V.pF) = -1;
G0(j,V.pHstar) = 1;
G0(j,V.s) = 1;
%----------------------------------------------------
j=j+1;%	[39. Home inflation relative price link]
%----------------------------------------------------
G0(j,V.piH) = 1;
G0(j,V.pH) = -1;
G0(j,V.piC) = -1;
G1(j,V.pH) = -1;
%----------------------------------------------------
j=j+1;%	[40. Export inflation relative price link]
%----------------------------------------------------
G0(j,V.piHstar) = 1;
G0(j,V.pHstar) = -1;
G0(j,V.piCstar) = -1;
G1(j,V.pHstar) = -1;
%----------------------------------------------------
j=j+1;%	[41. Nominal/real exchange link]
%----------------------------------------------------
G0(j,V.S) = 1;
G0(j,V.s) = -1;
G0(j,V.piC) = -1;
G0(j,V.piCstar) = 1;
G1(j,V.S) = 1;
G1(j,V.s) = -1;
%----------------------------------------------------
j=j+1;%	[42. Define XpiC]
%----------------------------------------------------
G0(j,V.piC) = 1;
G1(j,V.xpiC) = 1;
Pi(j,V.fepiC) = 1;
%----------------------------------------------------
j=j+1;%	[43. Define Xq]
%----------------------------------------------------
G0(j,V.q) = 1;
G1(j,V.xq) = 1;
Pi(j,V.feq) = 1;
%----------------------------------------------------
j=j+1;%	[44. Define Xrk]
%----------------------------------------------------
G0(j,V.rk) = 1;
G1(j,V.xrk) = 1;
Pi(j,V.ferk) = 1;
%----------------------------------------------------
j=j+1;%	[45. Define XI]
%----------------------------------------------------
G0(j,V.i) = 1;
G1(j,V.xi) = 1;
Pi(j,V.fei) = 1;
%----------------------------------------------------
j=j+1;%	[46. Define Xlambdas]
%----------------------------------------------------
G0(j,V.lambdas) = 1;
G1(j,V.xlambdas) = 1;
Pi(j,V.felambdas) = 1;
%----------------------------------------------------
j=j+1;%	[47. Define Xtauk]
%----------------------------------------------------
G0(j,V.tauk) = 1;
G1(j,V.xtauk) = 1;
Pi(j,V.fetauk) = 1;
%----------------------------------------------------
j=j+1;%	[48. Define Xw]
%----------------------------------------------------
G0(j,V.w) = 1;
G1(j,V.xw) = 1;
Pi(j,V.few) = 1;
%----------------------------------------------------
j=j+1;%	[49. Define XpiH]
%----------------------------------------------------
G0(j,V.piH) = 1;
G1(j,V.xpiH) = 1;
Pi(j,V.fepiH) = 1;
%----------------------------------------------------
j=j+1;%	[50. Define XpiHstar]
%----------------------------------------------------
G0(j,V.piHstar) = 1;
G1(j,V.xpiHstar) = 1;
Pi(j,V.fepiHstar) = 1;
%----------------------------------------------------
j=j+1;%	[51. Define XS]
%----------------------------------------------------
G0(j,V.s) = 1;
G1(j,V.xs) = 1;
Pi(j,V.fes) = 1;
%----------------------------------------------------
j=j+1;%	[52. Fisher equation]
%----------------------------------------------------
if P.omegap == 0 && P.etap == 0
    G0(j,V.piC) = 1;
else
    G0(j,V.r) = 1;
    G0(j,V.R) = -1;
    G0(j,V.xpiC) = 1;
end
%----------------------------------------------------
j=j+1;%	[53. After tax real wage rate]
%----------------------------------------------------
G0(j,V.atlw) = 1;
G0(j,V.w) = -1;
G0(j,V.taul) = P.taul/(1-P.taul);
%----------------------------------------------------
j=j+1;%	[54. Labor tax revenue]
%----------------------------------------------------
G0(j,V.Tl) = 1;
G0(j,V.w) = -1;
G0(j,V.taul) = -1;
G0(j,V.l) = -1;
%----------------------------------------------------
j=j+1;%	[55. Capital tax revenue]
%----------------------------------------------------
G0(j,V.Tk) = 1;
G0(j,V.rk) = -1;
G0(j,V.tauk) = -1;
G0(j,V.k) = -1;
%----------------------------------------------------
j=j+1;%	[56. Consumption tax revenue]
%----------------------------------------------------
G0(j,V.Tc) = 1;
G0(j,V.c) = -1;
G0(j,V.tauc) = -1;
%----------------------------------------------------
j=j+1;%	[57. UIP condition (exchange rate)] <<< i added rp shock 180309
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
j=j+1;%	[58. Debt/output ratio]
%----------------------------------------------------
G0(j,V.sb) = 1;
G0(j,V.y) = 1;
G0(j,V.b) = -1;
%----------------------------------------------------
j=j+1;%	[59. Domestic exports]
%----------------------------------------------------
G0(j,V.ex) = 1;
G0(j,V.pHstar) = P.mux; 
G0(j,V.ystar) = -1;
%----------------------------------------------------
j=j+1;%	[60. Define XpiCstar]
%----------------------------------------------------
G0(j,V.piCstar) = 1;
G1(j,V.xpiCstar) = 1;
Pi(j,V.fepiCstar) = 1;
%----------------------------------------------------
j=j+1;%	[61. Tech. shock]
%----------------------------------------------------
G0(j,V.ua) = 1;
G1(j,V.ua) = P.rhoa;
Psi(j,V.epsua) = P.siga;
%----------------------------------------------------
j=j+1;%	[62. Monetary policy shock]
%----------------------------------------------------
G0(j,V.um) = 1;
Psi(j,V.epsum) = P.sigm;
%----------------------------------------------------
j=j+1;%	[63. Preference shock]
%----------------------------------------------------
G0(j,V.ub) = 1;
G1(j,V.ub) = P.rhob; 
Psi(j,V.epsub) = P.sigb;
%----------------------------------------------------
j=j+1;%	[64. Investment shock]
%----------------------------------------------------
G0(j,V.ui) = 1;
G1(j,V.ui) = P.rhoi;
Psi(j,V.epsui) = P.sigi;
%----------------------------------------------------
j=j+1;%	[65. government spending shock]
%----------------------------------------------------
G0(j,V.ugc) = 1;
Psi(j,V.epsugc) = P.siggc;
%----------------------------------------------------
j=j+1;%	[66. tk shock]
%----------------------------------------------------
G0(j,V.utk) = 1;
Psi(j,V.epsutk) = P.sigtk;
%----------------------------------------------------
j=j+1;%	[67. tl shock]
%----------------------------------------------------
G0(j,V.utl) = 1;
Psi(j,V.epsutl) = P.sigtl;
%----------------------------------------------------
j=j+1;%	[68. tc shock]
%----------------------------------------------------
G0(j,V.utc) = 1;
Psi(j,V.epsutc) = P.sigtc;
%----------------------------------------------------
j=j+1;%	[69. Z shock]
%----------------------------------------------------
G0(j,V.uzsum) = 1;
Psi(j,V.epsuzsum) = P.sigz;
%----------------------------------------------------
j=j+1;% [70. ystar shock]
%----------------------------------------------------
G0(j,V.ystar) = 1;
G1(j,V.ystar) = P.rhoystar;
Psi(j,V.epsystar) = P.sigystar;
%----------------------------------------------------
j=j+1;% [71. piCstar shock]
%----------------------------------------------------
G0(j,V.piCstar) = 1;
G1(j,V.piCstar) = P.rhopiCstar;
Psi(j,V.epspiCstar) = P.sigpiCstar;
%----------------------------------------------------
j=j+1;% [72. Rstar shock]
%----------------------------------------------------
G0(j,V.Rstar) = 1;
G1(j,V.Rstar) = P.rhoRstar;
Psi(j,V.epsRstar) = P.sigRstar;
%----------------------------------------------------
j=j+1;% [73. risk premium shock] <<< i added this 180309
%----------------------------------------------------
G0(j,V.urp) = 1;
G1(j,V.urp) = P.rhorp;
Psi(j,V.epsurp) = P.sigrp;
%----------------------------------------------------
j=j+1;%	[74. Primary deficit]
%----------------------------------------------------
G0(j,V.def) = S.def;
G0(j,V.Tl) = S.tl;
G0(j,V.Tk) = S.tk;
G0(j,V.Tc) = S.tc;
G0(j,V.gc) = -S.gc;
G0(j,V.zsum) = -S.z;
%----------------------------------------------------
j=j+1;%	[75. Import price Phillips curve]
%----------------------------------------------------
G0(j,V.piF) = P.lampim;
G0(j,V.xpiF) = -P.lampim*P.bet/(1+P.bet*P.chipim);
G0(j,V.s) = -1;
G0(j,V.pF) = 1;     % pF is the relative price
G1(j,V.piF) = P.lampim*P.chipim/(1+P.bet*P.chipim);
%----------------------------------------------------
j=j+1;%	[76. Import price inflation link to the relative price]
%----------------------------------------------------
G0(j,V.piF) = 1;
G0(j,V.piC) = -1;
G0(j,V.pF) = -1;
G1(j,V.pF) = -1;
%----------------------------------------------------
j=j+1;%	[77. Define XpiF]
%----------------------------------------------------
G0(j,V.piF) = 1;
G1(j,V.xpiF) = 1;
Pi(j,V.fepiF) = 1;

%----------------------------------------------------
j=j+1;%	[78. Net exports] <<< 181215
%----------------------------------------------------
G0(j,V.nx) = 1;
G0(j,V.ex) = -1;
G0(j,V.im) = 1;

%% Obtain solution
%----------------------------------------------------------
%   Solve Linear Model
%----------------------------------------------------------
[T,~,M,~,~,~,~,eu] = gensys(G0,G1,CC,Psi,Pi);  