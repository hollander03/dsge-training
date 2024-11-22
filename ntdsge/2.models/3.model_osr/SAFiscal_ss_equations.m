%Core system of nonlinear equations


function  f = SAFiscal_ss_equations(y, beta, sigmaL, kappa, gz, alpha, varphiH, varphiW,...
    muC, muI, sI, sG, sIMC ,sIMI, sX, pIM,...
    sIG,nuG, alphaG, nuK, alphaK,...
    sC,sTR,omega,cJcISSratio,tauCrevYbar_target,tauNrevYbar_target,tauKrevYbar_target,...
    corp_gov_spread2,pibar,epsRPK2,given_alphaG,given_alphaK,alphaG_target,alphaK_target)


%guesses
k     = exp(y( 1));
c     = exp(y( 2));
N     = exp(y( 3));
pI    = exp(y( 4));
psi   = exp(y( 5));
nuC   = exp(y( 6))/(1+exp(y( 6)));
nuI   = exp(y( 7))/(1+exp(y( 7)));
tauK  = y(8);
kG    = exp(y( 9));
deltaG= exp(y( 10))/(1+exp(y( 10)));
delta = exp(y( 11))/(1+exp(y( 11)));
tauN  = y(12);
cJ    = exp(y( 13));
cI    = exp(y( 14));
trJ   = y( 15); %% converted to exp in _ss.m file... not here, bad steady state
trI   = y( 16); %% converted to exp in _ss.m file... not here, bad steady state
tauC  = y(17);
alphaK= exp(y( 18))/(1+exp(y( 18)));
alphaG= exp(y( 19))/(1+exp(y( 19)));
corp_gov_spread=abs(y(20));


Rcorppbar      =corp_gov_spread/400+1+8.5/400;
epsRPK         =(1+8.2/400)/Rcorppbar;

%domestic homogenous good relative price
pH    = ((1-(1-nuC)*pIM^(1-muC))/nuC)^(1/(1-muC));

%composite capital stock
if nuK>1-1e-4 && nuK<1+1e-4
    ktilde= alphaK^(-alphaK)*(1-alphaK)^(-(1-alphaK))*k^alphaK*kG^(1-alphaK); %cobb douglas
else
    ktilde=( alphaK^(1/nuK)*k^( (nuK-1)/nuK )+ (1-alphaK)^(1/nuK)*kG^( (nuK-1)/nuK )     )^( nuK/(nuK-1) ); %CES
end

%relative price output and output
pY    = pH;
y     = (ktilde/gz)^alpha*N^(1-alpha)-psi;

%rel. price gov. cons and gov cons.
pG    = pH;
hG    = sG*pY*y/pG;

%gov. invest
pIG    = pH;
hIG    = sIG*pY*y/pIG;

%exports
x     = sX*y;  % because PX = PH = PY

%rental rate
rK    = 1/((1-tauK)*epsRPK)*(gz/beta-(1-delta)*epsRPK-tauK*delta*epsRPK)*pI;

%labor market equilibrium coefficient
Xi    = gz*alpha/(1-alpha)*(1+tauC)/(1-tauN)*(1-kappa/gz)*(pI/rK)*varphiW*alphaG^(-1/nuG);

%total utility valued consumption
if nuG>1-1e-4 && nuG<1+1e-4
    cItilde   = alphaG^(-alphaG)*(1-alphaG)^(-(1-alphaG))*cI^alphaG*hG^(1-alphaG); %cobb douglas
else
    cItilde   =( alphaG^(1/nuG)*cI^( (nuG-1)/nuG )+ (1-alphaG)^(1/nuG)*hG^(  (nuG-1)/nuG))^(nuG/(nuG-1));
end

%wage
w    =    (1-alpha)/alpha*k/N/gz/(1)*rK*(1+( (1-alphaK)/alphaK )^(1/nuK)*(kG/k)^( (nuK-1)/nuK ));


%%%%%%%%%%%%%%%%%%%%%%
%system of equations%%
%%%%%%%%%%%%%%%%%%%%%%

% Labor market
equ1= Xi*N^(sigmaL+1)*cI/(k*pI)*(cItilde/cI)^((nuG-1)/nuG) - 1 - ( (1-alphaK)/alphaK )^(1/nuK)*(kG/k)^( (nuK-1)/nuK ) ;

% Capital market
equ2= alpha - gz^(alpha-1)*( (1+( (1-alphaK)/alphaK )^(1/nuK)*(kG/k)^( (nuK-1)/nuK ))/ktilde^alpha  )*rK*varphiH/pH*k/(N^(1-alpha));

% Feasibility
equ3=((gz-1+delta)/gz*k)^(1-1/muI)*(1-(1-nuI)*(pIM/pI)^(1-muI))- nuI^(1/muI)*( gz^(-alpha)*N^(1-alpha)*ktilde^alpha-psi-x-nuC*pH^(-muC)*c-hG-hIG)^(1-1/muI);

% Relative prices
equ4=pH/pI - ((1-(1-nuI)*(pIM/pI)^(1-muI))/nuI)^(1/(1-muI));

% Zero profits
equ5=1-1/varphiH*(1+psi/y);%*( alpha*(1+( (1-alphaK)/alphaK )^(1/nuK)*(kG/k)^( (nuK-1)/nuK ))^(-1)+1-alpha );

% Priv. cons. import share
equ6=pIM*(1-nuC)*(pIM)^(-muC)*c/(pY*y)- sIMC;

% Priv. invest. import share
equ7=pIM*(1-nuI)*(pIM/pI)^(-muI)*(1-(1-delta)/gz)*k/(pY*y) - sIMI;

% Investment share
equ8=pI*(1-(1-delta)/gz)*k/(pY*y) - sI;

% Pub. investment share
equ9=pIG*(1-(1-deltaG)/gz)*kG/(pY*y) - sIG;

% Depreciation rate public capital
equ10=deltaG-0.008;

% Depreciation rate private capital
equ11=delta-0.015;

% Labour tax revenues
%equ12=dtx_ybar_bar-dtx_ybar_target;
equ12=tauNrevYbar_target-tauN*w*N/(pY*y);

% Total consumption - ricardian and non-ricardian
equ13=(1-omega)*cI+omega*cJ-c;

% Non-ricardian consumption
equ14=(1-tauN)*w*N+trJ-(1+tauC)*cJ;

% Total transfers - ricardian and non-ricaridan
equ15=((1-omega)*trI+omega*trJ)/(y*pY)-sTR;

% cJ/cI ratio
equ16=cJ/cI-cJcISSratio;

% Consumption tax revenues
%equ17=tauCrevYbar_target-tauC*(c+hG)/(pY*y);
equ17=tauCrevYbar_target-tauC*c/(pY*y);

% Set alphaK to desired value
if given_alphaK==1,
    equ18=alphaK_target-alphaK;
else
    error('not implemented here');
end

% Set alphaG to desired value
if given_alphaG==1,
    equ19=alphaG-alphaG_target;
else
    error('not implemented here');
end

% Steady state capital tax rate
%equ20=tauK-0.202;
equ20 = tauKrevYbar_target-tauK*k/gz*(rK-delta*pI)/(pY*y);


% Equations
f     = [equ1;equ2;equ3;equ4;equ5;equ6;equ7;equ8;equ9;equ10;equ11;...
    equ12;equ13;equ14;equ15;equ16;equ17;equ18;equ19;equ20];






