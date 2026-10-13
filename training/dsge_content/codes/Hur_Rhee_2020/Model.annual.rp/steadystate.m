function S = steadystate(P)

% S = steadystate(P)
%   Computes the deterministic steady state
% Input:
%   P : Structure of parameters
% Output:
%   S : structure of steady state values

S.pG = 1;
S.R = 1/P.bet;
S.Rstar = S.R;
S.rk = (1 - P.bet*(1 - P.delt))/(P.bet*(1 - P.tauk));
S.psi1 = S.rk*(1-P.tauk);
S.mc = 1/(1 + P.etap);
S.w = (S.mc*((1-P.alph)^(1-P.alph))*(P.alph^P.alph)*(S.rk^(-P.alph)))^(1/(1-P.alph));
S.KL = (S.w/S.rk)*P.alph/(1-P.alph);
S.OmegL = (S.KL^P.alph) - S.rk*(S.KL) - S.w;	% zero profit condition in steady state
% S.YL = S.KL^(-P.alph/(1-P.alph));   % modified, 02/15/17
S.YL = (S.KL^P.alph) - S.OmegL;
S.IL = P.delt*S.KL;
S.CL = S.YL*(1 - P.sgc) - S.IL;
S.ZL = ((1 - S.R)*P.sb - P.sgc)*S.YL + (P.tauc)*S.CL + P.taul*S.w + P.tauk*S.rk*S.KL;
S.CnL = ((1-P.taul)*S.w + S.ZL)/(1+P.tauc);   % modified, 02/15/17
S.CsL = (S.CL - P.muHH*S.CnL)/(1-P.muHH);

S.l = ((S.w*(1-P.taul)*((1 - P.thetac)^(-P.gamm))/((1+P.tauc)*(1+P.etaw)))*((S.CsL)^(-P.gamm)))^(1/(P.xi + P.gamm));
S.cs = S.CsL*S.l;
S.cn = S.CnL*S.l;
S.y = S.YL*S.l;
S.k = S.KL*S.l;
S.Omeg = S.OmegL*S.l;   % becomes omega for the new presentation
if abs(S.Omeg)<1e-10
    S.Omeg = 0;
end
S.c = S.CL*S.l;
S.inv = S.IL*S.l;
S.z = S.ZL*S.l;
S.zs = S.z;
S.zn = S.z;
S.b = P.sb*S.y;
S.gc = P.sgc*S.y;

S.ky = S.k/S.y;
S.cy = S.c/S.y;
S.ly = S.l/S.y;

S.cH = (1-P.nuc)*S.c;
S.cF = P.nuc*S.c;

%S.cHstar = S.cF;
S.iH = (1-P.nui)*S.inv;
S.iF = P.nui*S.inv;

%S.iHstar = S.iF;
S.gH = (1-P.nug)*S.gc;
S.gF = P.nug*S.gc;

%S.gHstar = S.gF;

S.im = S.cF + S.iF + S.gF;
S.ex = S.im;	% balanced trade at SS
S.nx = S.ex - S.im; % <<< 181215

S.ystar = log(134.2105419);  % data implied value

S.def = S.b*(1-S.R);
S.tl = S.w*S.l*P.taul;
S.tk = S.rk*S.k*P.tauk;
S.tc = S.c*P.tauc;