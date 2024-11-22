function P = parameters(param)

% P = parameters(param)
%   Defines model parameters
% Output:
%   P : Structure of model parameters

%---calibrated-------------------------------------------------------------
P.alph = 0.4;             % 1.alph: capital share, o.k.
P.bet =  0.99;              % 2.bet: time preference, o.k.
P.labpsi = 1;               % 3.labpsi: scaling of steady state labor
P.sgc = 0.15;              % 4.sgc: government consumption to output ratio, o.k.
P.taul = 0.10;              % 5.taul: steady state labor tax rate, o.k.
P.tauk = 0.19;              % 6.tauk: steady state capital tax rate, o.k.
P.tauc = 0.10;              % 7.tauc: steady state consumption tax rate, o.k.
P.sb = 1.082;         % 8.sb: quarterly government debt to output ratio, o.k. <<< check
P.nuc = 0.442 ;             % 9.nuc: share of imports in goods, o.k.
P.nui = 0.442;              %10.nui: share of imports in investment, o.k.
P.nug = 0.442;              %11.nug: share of imports in government goods
P.delt = 0.025;             %12.delt: steady state private capital depreciation, o.k.
P.etaw = 0.143;       %13.etaw: wage markup, o.k.
P.etap = 0.143;       %14.etap: price markup, o.k.
%P.muHH = 0.0;                 %15.muHH: share of non-saving households
%P.thetac = 0;               %16.thetac: habit formation on consumption, o.k.
P.chiw = 0;                 %17.chiw: wage indexation
P.chip = 0;                 %18.chip: price indexation, o.k.
P.chipx = 0;                %19.chipx: price indexation
P.chipim = 0;               %20.chipim: import price indexation
P.phis = 0;                 %21.phis: Taylor rule nominal exchange rate coefficient, o.k.
%P.gamm = 1;        % 1.gamm: inverse intertemporal preference, o.k.
%P.xi = 1;          % 2.xi: inverse Frisch elasticity, o.k.
%P.gammz = 0;      %28.gammaz: response of transfers to debt-output ratio
%P.psitc = 0;      %31.psitc: response of consumption tax rate to output
%P.psigc = 0;      %48.psigc: response of government consumption to output
%P.psiz = 0;       %49.psiz: response of transfers to output

%---estimated--------------------------------------------------------------
P.omegaw = param(1,1);      % 4.omegaw: prob that union cannot reset optimal wage, o.k.
P.omegap = param(1,2);      % 5.omegap: prob that intermediate firm cannot reset optimal price, o.k.
P.muc = param(1,3);         % 5.muc: elasticity of substitution between home and foreign consumption goods, o.k.
P.mui = param(1,4);         % 6.mui: elasticity of substitution between home and foreign investment goods, o.k.
P.mug = param(1,5);         % 7.mug: elasticity of substitution between home and foreign government goods
P.phipi = param(1,6);       % 8.phipi: Taylor rule inflation coefficient, o.k.
P.phiy = param(1,7);       % 9.phiy: Taylor rule output coefficient, o.k.
P.gpsi = param(1,8);       %10.gpsi: capital utilization cost; gpsi = 1 --> constant utilizaton rate, o.k.
P.s = param(1,9);          %11.s: s'' in the investment adjustment cost function; s --> 0 implies no costs, o.k.
P.rhoa = param(1,10);       %12.rhoa: serial correlation on technology
P.rhob = param(1,11);       %13.rhob: serial correlation on preference shock
P.rhoi = param(1,12);       %14.rhoi: serial correlation on investment shock
P.rhor = param(1,13);       %15.rhor: serial correlation on monetary policy shock, o.k.
P.rhogc = param(1,14);      %16.rhogc: serial correlation on government consumption
P.rhotk = param(1,15);      %17.rhotk: serial correlation on capital tax rate
P.rhotl = param(1,16);      %18.rhotl: serial correlation on labor tax rate
P.rhotc = param(1,17);      %19.rhotc: serial correlation on consumption tax rate
P.rhoz = param(1,18);       %20.rhoz: serial correlation on transfers
P.rhoystar = param(1,19);   %21.rhocHstar: serial correlation on exported consumption
P.rhopiCstar = param(1,20);	%22.rhopiCstar: serial correlation on foreign CPI
P.rhoRstar = param(1,21);   %23.rhoRstar: serial correlation on foreign interest rate
P.rhorp = param(1,22);      %22.rhorp: serial correlation on risk premium % <<< 180309
P.siga = param(1,23);       %32.siga: technology standard deviation
P.sigm = param(1,24);       %33.sigm: monetary policy standard deviation
P.sigb = param(1,25);       %34.sigb: preference standard deviation
P.sigi = param(1,26);       %35.sigi: investment standard deviation
P.siggc = param(1,27);      %36.siggc: GC standard deviation
P.sigtk = param(1,28);      %37.sigtk: capital tax standard deviation
P.sigtl = param(1,29);      %38.sigtl: labor tax standard deviation
P.sigtc = param(1,30);      %39.sigtc: consumption tax standard deviation
P.sigz = param(1,31);       %40.sigz: transfers standard deviation
P.sigystar = param(1,32);	%41.sigcHstar: exported consumption goods standard deviation
P.sigpiCstar = param(1,33);	%42.sigpiCstar: foreign CPI standard deviation
P.sigRstar = param(1,34);	%43.sigRstar: foreign interest rate standard deviation
P.sigrp = param(1,35);       %35.sigrp: risk premium standard deviation % <<< 180309
P.omegapx = param(1,36);	%44.omegapx: prob that intermediate firm cannot reset optimal price, o.k.
P.gzeta = param(1,37);      %45.
P.mux = param(1,38);        %46.mux: domestic exports elasiticity of export goods price, o.k.
P.omegapim = param(1,39);	%47.omegapim: prob that foreign intermediate firm cannot reset optimal price, o.k.
P.gamm = param(1,40);        % 1.gamm: inverse intertemporal preference, o.k.
P.xi = param(1,41);          % 2.xi: inverse Frisch elasticity, o.k.
P.thetac = param(1,42);       % 3.thetac: habit formation on consumption
P.muHH = param(1,43);        % 4.muHH: share of non-saving households
P.gammgc = param(1,44);     %24.gammagc: response of GC to debt-output ratio
P.gammtk = param(1,45);     %25.gammatk: response of capital tax rate to debt-output ratio
P.gammtl = param(1,46);     %26.gammatl: response of labor tax rate to debt-output ratio
P.gammtc = param(1,47);     %27.gammatc: response of consumption tax rate to debt-output ratio (fixed)
P.gammz = param(1,48);      %28.gammaz: response of transfers to debt-output ratio
P.psigc = param(1,49);      %48.psigc: response of government consumption to output
P.psitk = param(1,50);      %29.psitk: response of capital tax rate to output
P.psitl = param(1,51);      %30.psitl: response of labor rate to output
P.psitc = param(1,52);      %31.psitc: response of consumption tax rate to output
P.psiz = param(1,53);       %49.psiz: response of transfers to output
%---derived----------------------------------------------------------------
P.psiparam = (1-P.gpsi)/P.gpsi;
P.lampi = (P.omegap*(1+P.bet*P.chip))/((1-P.omegap*P.bet)*(1-P.omegap));
if P.etaw == 0 && P.omegaw == 0
    P.lamwage = 0;
else
    P.lamwage = P.omegaw*(1 + P.bet)*(1 + (1 + (1/P.etaw))*P.xi)/((1 - P.bet*P.omegaw)*(1-P.omegaw));
end
P.lampix = (P.omegapx*(1+P.bet*P.chipx))/((1-P.omegapx*P.bet)*(1-P.omegapx));
P.lampim = (P.omegapim*(1+P.bet*P.chipim))/((1-P.omegapim*P.bet)*(1-P.omegapim));
%--------------------------------------------------------------------------