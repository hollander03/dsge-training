function P = parameters_news_weight(param,S)

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
news_hor = 4;  % in years

%===obtain weights: govt. spending
gc_weight_temp = zeros(news_hor,1);

%gc_weight_temp(1,1) = 0;    % modified for pure news, makes mul bigger
%gc_weight_temp(1,1) = 1;    % modified on 180401

%for i=2:news_hor
for i=1:news_hor
    %gc_weight_temp(i,1) = 1/(S.R^(i-1));
    gc_weight_temp(i,1) = 1/news_hor;
end

gc_weight = [gc_weight_temp/sum(gc_weight_temp); zeros(45-news_hor,1)];

%===obtain weights: transfers
zsum_weight_temp = zeros(news_hor,1);

%zsum_weight_temp(1,1) = 0;    % modified for pure news
%zsum_weight_temp(1,1) = 1;    % modified on 180401

%for i=2:news_hor
for i=1:news_hor
    %zsum_weight_temp(i,1) = 1/(S.R^(i-1));
    zsum_weight_temp(i,1) = 1/news_hor;
end

zsum_weight = [zsum_weight_temp/sum(zsum_weight_temp); zeros(45-news_hor,1)];
%---added for news shocks--------------------------------------------------
P.theta0gc = gc_weight(1,1);
P.theta1gc = gc_weight(2,1);
P.theta2gc = gc_weight(3,1);
P.theta3gc = gc_weight(4,1);
P.theta4gc = gc_weight(5,1);
P.theta5gc = gc_weight(6,1);
P.theta6gc = gc_weight(7,1);
P.theta7gc = gc_weight(8,1);
P.theta8gc = gc_weight(9,1);
P.theta9gc = gc_weight(10,1);
P.theta10gc = gc_weight(11,1);
P.theta11gc = gc_weight(12,1);
P.theta12gc = gc_weight(13,1);
P.theta13gc = gc_weight(14,1);
P.theta14gc = gc_weight(15,1);
P.theta15gc = gc_weight(16,1);
P.theta16gc = gc_weight(17,1);
P.theta17gc = gc_weight(18,1);
P.theta18gc = gc_weight(19,1);
P.theta19gc = gc_weight(20,1);
P.theta20gc = gc_weight(21,1);
P.theta21gc = gc_weight(22,1);
P.theta22gc = gc_weight(23,1);
P.theta23gc = gc_weight(24,1);
P.theta24gc = gc_weight(25,1);
P.theta25gc = gc_weight(26,1);
P.theta26gc = gc_weight(27,1);
P.theta27gc = gc_weight(28,1);
P.theta28gc = gc_weight(29,1);
P.theta29gc = gc_weight(30,1);
P.theta30gc = gc_weight(31,1);
P.theta31gc = gc_weight(32,1);
P.theta32gc = gc_weight(33,1);
P.theta33gc = gc_weight(34,1);
P.theta34gc = gc_weight(35,1);
P.theta35gc = gc_weight(36,1);
P.theta36gc = gc_weight(37,1);
P.theta37gc = gc_weight(38,1);
P.theta38gc = gc_weight(39,1);
P.theta39gc = gc_weight(40,1);
P.theta40gc = gc_weight(41,1);
P.theta41gc = gc_weight(42,1);
P.theta42gc = gc_weight(43,1);
P.theta43gc = gc_weight(44,1);
P.theta44gc = gc_weight(45,1);

P.theta0z = zsum_weight(1,1);
P.theta1z = zsum_weight(2,1);
P.theta2z = zsum_weight(3,1);
P.theta3z = zsum_weight(4,1);
P.theta4z = zsum_weight(5,1);
P.theta5z = zsum_weight(6,1);
P.theta6z = zsum_weight(7,1);
P.theta7z = zsum_weight(8,1);
P.theta8z = zsum_weight(9,1);
P.theta9z = zsum_weight(10,1);
P.theta10z = zsum_weight(11,1);
P.theta11z = zsum_weight(12,1);
P.theta12z = zsum_weight(13,1);
P.theta13z = zsum_weight(14,1);
P.theta14z = zsum_weight(15,1);
P.theta15z = zsum_weight(16,1);
P.theta16z = zsum_weight(17,1);
P.theta17z = zsum_weight(18,1);
P.theta18z = zsum_weight(19,1);
P.theta19z = zsum_weight(20,1);
P.theta20z = zsum_weight(21,1);
P.theta21z = zsum_weight(22,1);
P.theta22z = zsum_weight(23,1);
P.theta23z = zsum_weight(24,1);
P.theta24z = zsum_weight(25,1);
P.theta25z = zsum_weight(26,1);
P.theta26z = zsum_weight(27,1);
P.theta27z = zsum_weight(28,1);
P.theta28z = zsum_weight(29,1);
P.theta29z = zsum_weight(30,1);
P.theta30z = zsum_weight(31,1);
P.theta31z = zsum_weight(32,1);
P.theta32z = zsum_weight(33,1);
P.theta33z = zsum_weight(34,1);
P.theta34z = zsum_weight(35,1);
P.theta35z = zsum_weight(36,1);
P.theta36z = zsum_weight(37,1);
P.theta37z = zsum_weight(38,1);
P.theta38z = zsum_weight(39,1);
P.theta39z = zsum_weight(40,1);
P.theta40z = zsum_weight(41,1);
P.theta41z = zsum_weight(42,1);
P.theta42z = zsum_weight(43,1);
P.theta43z = zsum_weight(44,1);
P.theta44z = zsum_weight(45,1);
%--------------------------------------------------------------------------
save news_weights.mat gc_weight zsum_weight