%compute steady state of the model

function [ys,check] = SAFiscal_steadystate(ys,junk,do_steady_print,print_steady)


global M_


num_para=size(M_.params,1);
for idxxx=1:1:num_para
    define_string=[M_.param_names(idxxx,:),'=',sprintf('%20.20g',M_.params(idxxx)),';'];
    eval(define_string);
end



% Steady state calcuations
Rbar              = Pibar*gzbar/betta;
Rgovbar           = GovRSpread/400+Rbar;
betta             = Pibar*gzbar/Rgovbar;
epsRPGbar         = Rgovbar/Rbar;
Rcorppbar         = CorpGovSpread/400+Rgovbar;
epsRPKbar         = Rgovbar/Rcorppbar;
betastar          = betta;
sIM               = sIMC+sIMI;
sX                = sIM;
sC                = 1-sI-sG-sIG-sX+sIM;


% Computation of steady-state values for k, c, N and pI and calibration of psi, nuCbar, nuIbar and tauKbar
out_ss = SAFiscal_ss(betta, sigmaL, kappa,...
    gzbar, alfa,  varphiHbar, varphiWbar,...
    muC, muI, sI, sG, sIMC, ...
    sIMI, sX, pIMbar, ...
    sIG,nuG,alphaG,...
    nuK,alphaK,...
    sC,sTR,omega,...
    cJcISSratio,tauCrevYbar_target,tauNrevYbar_target,tauKrevYbar_target,...
    CorpGovSpread,Pibar,epsRPKbar,given_alphaG,given_alphaK,alphaG_target,alphaK_target);


%solution
kbar              = out_ss(1);
cbar              = out_ss(2);
Nbar              = out_ss(3);
pIbar             = out_ss(4);
psi               = out_ss(5);
nuCbar            = out_ss(6);
nuIbar            = out_ss(7);
tauKbar           = out_ss(8);
kGbar             = out_ss(9);
deltaG            = out_ss(10);
delta             = out_ss(11);
tauNbar           = out_ss(12);
cJbar             = out_ss(13);
cIbar             = out_ss(14);
trJbar            = out_ss(15);
trIbar            = out_ss(16);
tauCbar           = out_ss(17);
alphaK            = out_ss(18);
alphaG            = out_ss(19);
CorpGovSpread     = out_ss(20);

% Interest rates etc
Rbar              = Pibar*gzbar/betta;
Rgovbar           = GovRSpread/400+Rbar;
epsRPGbar         = Rgovbar/Rbar;
Rcorppbar         = CorpGovSpread/400+Rgovbar;
epsRPKbar         = Rgovbar/Rcorppbar;

% Relative prices
pHbar             = ((1-(1-nuCbar)*pIMbar^(1-muC))/nuCbar)^(1/(1-muC));
pYbar             = pHbar;
pGbar             = pHbar;
pIGbar            = pHbar;
pXbar             = pYbar;

% Capital
kSbar             = kbar;

% Real factor prices
rKbar             = 1/((1-tauKbar)*epsRPKbar)*(gzbar/betta-(1-delta)*epsRPKbar-tauKbar*delta*epsRPKbar)*pIbar;
wbar              = (1-alfa)/alfa*kbar/Nbar/gzbar/(1)*rKbar*(1+( (1-alphaK)/alphaK )^(1/nuK)*(kGbar/kbar)^( (nuK-1)/nuK ));

% Capital utilisation
gammau1         =   rKbar/pIbar; % [does not appear to follow the FOC steady state see Eq 3.5 and p.27] in ss u=1 and gammau1=rkbar
gammau2         =   gammau1/10; % [CHECK ...check Steinbach 2014]

% Final goods
qIbar             = (1-(1-delta)/gzbar)*kbar;
qCbar             = cbar;

% Composite capital
if nuK>1-1e-4 && nuK<1+1e-4
    ktildebar     = alphaK^(-alphaK)*(1-alphaK)^(-(1-alphaK))*kbar^alphaK*kGbar^(1-alphaK); %cobb douglas
else
    ktildebar     =( alphaK^(1/nuK)*kbar^( (nuK-1)/nuK )+ (1-alphaK)^(1/nuK)*kGbar^( (nuK-1)/nuK )     )^( nuK/(nuK-1) );
end

% Production
ybar              = gzbar^(-alfa)*ktildebar^alfa*Nbar^(1-alfa)-psi;

% Intermediate goods
hCbar             = nuCbar*(pHbar/pCbar)^(-muC)*qCbar;
hIbar             = nuIbar*(pHbar/pIbar)^(-muI)*qIbar;
hIGbar            = sIG*(pYbar*ybar)/pIGbar;
hGbar             = sG*(pYbar*ybar)/pGbar;
hbar              = hCbar+hIbar+hGbar+hIGbar;
imCbar            = (1-nuCbar)*(pIMbar/pCbar)^(-muC)*qCbar;
imIbar            = (1-nuIbar)*(pIMbar/pIbar)^(-muI)*qIbar;


% Expenditure components
cbar              = qCbar;
ibar              = qIbar;
gbar              = sG*(pYbar*ybar)/pGbar;
iGbar             = sIG*(pYbar*ybar)/pIGbar;
xbar              = ybar-hbar;
imbar             = imCbar+imIbar;

% Fiscal variables
bbar              = sBbar*pYbar*ybar;
trbar             = sTR*pYbar*ybar;
dtxbar            = tauNbar*wbar*Nbar+tauKbar*kbar/gzbar*(rKbar-delta*pIbar);
lumpbar           = (pGbar*gbar+pIGbar*iGbar+bbar/Pibar/gzbar+trbar-tauCbar*cbar-dtxbar-bbar/Rgovbar);

% Some useful checks for GDP ratios
lumpYbar            =   lumpbar/(pYbar*ybar);
trYbar              =   trbar/(pYbar*ybar);
tauKrevYbar         =   tauKbar*kbar/gzbar*(rKbar-delta*pIbar)/(pYbar*ybar);
tauNrevYbar         =   tauNbar*wbar*Nbar/(pYbar*ybar);
tauCrevYbar         =   tauCbar*cbar/(pYbar*ybar);
%tauCrevYbar         =   (tauCbar*(cbar+gbar))/(pYbar*ybar);
dtxrevYbar          =   dtxbar/(pYbar*ybar);
gYbar               =   pGbar*gbar/(pYbar*ybar);
iGYbar              =   pIGbar*iGbar/(pYbar*ybar);
intpayYbar          =   (Rgovbar-1)/(Rgovbar*gzbar*Pibar)*sBbar;
intpayYbarAnnual    =   (Rgovbar^4-1)/(Rgovbar^4*gzbar^4*Pibar^4)*sBbar/4;
govexpYbar          =   trYbar+gYbar+iGYbar+intpayYbar;
govrevYbar          =   tauCrevYbar+dtxrevYbar;
govDefYbar          =   sBbar*((gzbar*Pibar-1)/(Pibar*gzbar*Rgovbar));
govDefYbarAnnual    =   sBbar*((gzbar^4*Pibar^4-1)/(Pibar^4*gzbar^4*Rgovbar^4))/4;

% Total utility valued consumption
if nuG>1-1e-4 && nuG<1+1e-4
    cItildebar    = alphaG^(-alphaG)*(1-alphaG)^(-(1-alphaG))*cIbar^alphaG*gbar^(1-alphaG); %cobb douglas
else
    cItildebar   =( alphaG^(1/nuG)*cIbar^( (nuG-1)/nuG )+ (1-alphaG)^(1/nuG)*gbar^(  (nuG-1)/nuG))^(nuG/(nuG-1));
end

% Capital to output ratios
kYbar=kbar/(pYbar*ybar*4);
kGYbar=kGbar/(pYbar*ybar*4);

% Non-Ricardian/Ricardian Consumption and Transfers
cJcIbar     = cJbar/cIbar;
trJtrIbar   = trJbar/trIbar;

% Interest rates
RNominalAnnual                  =   400*(Rbar-1);
RgovNominalAnnual               =   400*(Rgovbar-1);
RKNominalPriorAgencyCostsAnnual =   400*(Rcorppbar-1);
RKRealPriorAgencyCostsAnnual    =   400*(Rcorppbar/Pibar-1);
RgovRealAnnual                  =   400*(Rgovbar/Pibar-1);
RKRealPostAgencyCostsAnnual     =   400*(Rcorppbar*epsRPKbar/Pibar-1);

% Foreign inflation and interest rate
PiYstarbar           =   1.005428463;
Rstarbar             =   1.010826176; %(PiYstarbar*gzbar)/betastar;
epsRPstarbar         =   ((1-epsRPGbar+gammaBstar)/gammaBstar)^gammaBstar;
RstarNominalAnnual   =   400*(Rstarbar-1);
RstarRealAnnual      =   400*(((1-gammaBstar*epsRPstarbar^(1/gammaBstar)+gammaBstar))*(Rstarbar/PiYstarbar))-400; %400*(Rstarbar/Pibar-1);

%Coef. UIP
lamRPstar=(epsRPstarbar^(1/gammaBstar))/(1+gammaBstar-gammaBstar*epsRPstarbar^(1/gammaBstar));

% Wage income as share of GDP
sWN     =   (wbar*Nbar)/(ybar*pYbar);

check=0;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%constructing the vector ys for Dynare%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
if check==0,%Dynare Switch indicating good steady state
    
    lambda=0;  Q=0;  rK=0; piC=0; s=0;   i=0;    w=0; N=0;    piH=0;     piX=0;    pY=0;   pIM=0; imI=0;     pI=0;  im=0;
    x=0; rgov=0;   GovIntPay=0;    r=0;  k=0;    y=0;  imC=0;   c=0;  cI=0;  cJ=0; trI=0;  trJ=0;
    bstar=0; pH=0; pX=0; piY=0;  piI=0; piIM=0;     rrp=0; rrpstar=0;    epsilonRPG=0; epsilonRPK=0;
    epsilonRPstar=0; gz=0; epsilon=0; epsilonI=0; epsilonX=0; epsilonIM=0; varphiW=0; varphiH=0;  varphiX=0; varphistar=0; epsilonIM=0;
    epsilonX=0; g=0; tr=0; iG=0; b=0;epsilontauC=0; epsilontauK=0; epsilontauN=0; epsilonG=0; epsiloniG=0; epsilontr=0; 
    epsilonC=0; epsilonN=0; cItilde=0; ktilde=0; kG=0; kS=0; u=0; E=0; piCbar=0;  mc=0; piW=0; tauN=0; tauK=0; tauC=0; 
    
    epsilonYstar=0; epsilonpiYstar=0; piYstar=0; ystar=0; rstar=0; epsilonrstar=0;
    
    epsilonG=0;
    epsiloniG=0;
    epsilontr=0;
    epsilontauN=0;
    epsilontauC=0;
    epsilontauK=0;
    
    ztilde=0;
    
    dy=0;
    d4y=0;
    d4y_obs=log(gzbar)*400;
    
    dy_=log(gzbar)*100;	
    dc_=log(gzbar+0.0014)*100;
    dg_=log(gzbar-0.0006)*100;
    db_=log(gzbar+0.00529246)*100; 
    gdebtgdpdt_ = 0;
    gdebtgdp_ = (41.131);
    dx_=log(gzbar+0.0002)*100;		
    dim_=log(gzbar+0.0051)*100;    
    dE_=log(1.001519)*100;		
    dw_ = log(1.0049153)*100;
    R_=100*log(Rbar);			
    di_=log(1.0109017)*100;		
    diG_=log(1.01048)*100;	
    dtr_=log(1.016321)*100;    
    pi_im_=log(Pibar)*100;
    pi_x_=log(Pibar)*100;
    pi_c_=log(Pibar)*100;
    pi_cbar_=log(Pibar)*100;
    pi_h_=log(Pibar)*100; 
    dtauC_=100*log(1.00011);
    dtauN_=100*log(1.0004231);  
    dtauK_=100*log(1.0008117);  
    dy_star_=log(1.00708)*100;
    R_star_=100*log(Rstarbar);	
    pi_Ystar_=100*log(piYstarbar);
    dsr_=100*log(1.00238565); %  + 100*log(Pibar) - 100*log(piYstarbar)
  
    
    % Put steady states into ys vector
    ys=NaN*ones(M_.orig_endo_nbr,1);
    
    
    for idyyy=1:1:M_.orig_endo_nbr, %number of endogenous variables
        define_string=['ys(idyyy)=',M_.endo_names(idyyy,:),';'];
        eval(define_string);
    end
    
    
end;

% Saving s.s. values that are used as params in static file
num_para=size(M_.params,1);
for idxxx=1:1:num_para
    define_string=['M_.params(idxxx)=',M_.param_names(idxxx,:),';'];
    eval(define_string);
end


% Print steady state if desired
if nargin==3,
    num_para=size(M_.params,1);
    disp(' ');
    disp('Parameters and Steady States:');
    disp('-----------------------------');
    disp(' ');
    for pppp=1:1:num_para
        disp([M_.param_names(pppp,:),'=',num2str(M_.params(pppp))]);
    end
end






