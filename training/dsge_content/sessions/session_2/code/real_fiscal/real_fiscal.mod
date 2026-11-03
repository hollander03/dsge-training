// Workshop simulation of ntdsge_real.mod: fixed inherited calibration.
// Original model equations and parameter assignments are retained.
// See README.md before changing steady-state calibration.
%Flexible price equilibrium for the NT-DSGE model Small open economy model for SA with extended fiscal sector
%Dynare Version 6 used for calculations
%December, 2024

%% EXCLUDED SHOCKS FROM FLEX PRICE EQUILIBRIUM --> 9 of 21 excluded
%% ALSO CLOSED ECONOMY --> OPEN ECONOMY HAS NO IMPACT ON NATURAL / FLEX-PRICE EQUIL

% monetary policy
% var etaR;        % MP
% var etapiCbar;   % inflation target

% markup shocks
% var etavarphiH;   % domestic
% var etavarphiX;   % export
% var etavarphistar;  % import
% var etavarphiW;  % wage

% foreign economy
% var etaYstar;  % foreign tech
% var etaRPstar; % foreign RP / IS shock
% var etaRstar;  % foreign MP


%===================================================================================================
% Housekeeping
%===================================================================================================
%clear;
%close all;

%===================================================================================================
% Declare endogenous variables                                          (89)
%===================================================================================================

var

%---------------------------------------------------------------------------------------------------
% Input costs                                                           (2)
%---------------------------------------------------------------------------------------------------
rK                  $\hat{r}_K$         % Rental rate of capital
w                   $\hat{w}$           % Real wage

%---------------------------------------------------------------------------------------------------
% Production                                                            (6)
%---------------------------------------------------------------------------------------------------
N                   $\hat{N}$           % Labour
k                   $\hat{k}$           % Total private capital stock (produced by Ricardians)
kS                  $\hat{k}^s$         % Capital services
kG                  $\hat{k}_G$         % Government capital
ktilde              $\hat{\tilde{k}}$   % Total effective capital stock: kS + kG
u                   $\hat{u}$           % Capital utilisation

%---------------------------------------------------------------------------------------------------
% Components of aggregate demand                                        (11)
%---------------------------------------------------------------------------------------------------
y                   $\hat{y}$               % Output
c                   $\hat{c}$               % Total consumption
cI                  $\hat{c}^R$             % Ricardian consumption
cJ                  $\hat{c}^{NR}$          % Non-Ricardian consumption
i                   $\hat{i}$               % Private sector investment
iG                  $\hat{i}_G$             % Government investment
cItilde             $\hat{\tilde{c}}^R$     % Total effective consumption

%---------------------------------------------------------------------------------------------------
% Monetary policy                                                       (1)
%---------------------------------------------------------------------------------------------------
r                   $\hat{r}$               % Policy interest rate/nominal interest rate

%---------------------------------------------------------------------------------------------------
% Fiscal block                                                          (8)
%---------------------------------------------------------------------------------------------------
g                   $\hat{g}$               % Government consumption expenditure
tr                  $\hat{tr}$              % Total transfers
trI                 $\hat{tr}^R$            % Transfers to Ricardian households
trJ                 $\hat{tr}^{NR}$         % Transfers to Non-Ricardian households
tauC                $\hat{\tau}^c$          % Consumption tax rate
tauK                $\hat{\tau}^k$          % Capital tax rate
tauN                $\hat{\tau}^w$          % Labour tax rate
b                   $\hat{b}$               % Government debt / domestic bonds
by                  $\frac{b}{y}$           % Govt Debt-to-GDP

%---------------------------------------------------------------------------------------------------
% Foreign variables                                                     (4)
%---------------------------------------------------------------------------------------------------
ystar               $\hat{y}^*$             % Foreign output
rstar               $\hat{r}^*$             % Foreign interest rate

%---------------------------------------------------------------------------------------------------
% Miscellaneous                                                         (17)
%---------------------------------------------------------------------------------------------------
lambda              $\hat{\lambda}$             % Lagrange multiplier - consumption
Q                   $\hat{Q}$                   % Tobin's Q
gz                  $\hat{g}_z$                 % Trend growth / prodcutivity growth
epsilonRPG          $\hat{\varepsilon}^{RP}$    % Risk premium shock on domestic debt (domestic currency denominated) //  a risk premium shock over the policy rate for domestic-currency assets
epsilonRPstar       $\hat{\varepsilon}^{RP^*}$  % Risk premium shock on foreign debt (foreign currency denominated)   //  risk premium shock for foreign-currency assets, equivalent to a foreign demand shock
epsilon             $\hat{\varepsilon}$         % Transitory technology shock
epsilonN            $\hat{\varepsilon}^N$       % Labour supply/disutility shock
epsilonC            $\hat{\varepsilon}^C$       % Preference shock
epsilonI            $\hat{\varepsilon}^i$       % Investment specific technology shock
epsilonYstar        $\hat{\varepsilon}^{Y^*}$   % Foreign demand shock

E                   $\hat{E}$                   % Employment

epsilonG
epsiloniG
epsilontr
epsilontauC
epsilontauN
epsilontauK

%---------------------------------------------------------------------------------------------------
% Useful identities                                                      (4)
%---------------------------------------------------------------------------------------------------

dy                                          % q/q GDP growth
d4y                                         % y/y GDP growth

rrp                                         % long rate (includes risk premium)

%---------------------------------------------------------------------------------------------------
% Fiscal sustainability & Fiscal r-star variables
%---------------------------------------------------------------------------------------------------
pbud                $\hat{p}^{bud}$         % primary budget
pbudsus             $\hat{p}^{sus}$         % primary budget (sustainable)
susgap              $\hat{p}^{gap}$         % fiscal sustainability gap
susgapgdp           $\hat{p}^{gapgdp}$      % fiscal sustainability gap % of gdp

fiscalr
fiscalrrpgap
fiscalrgap

%---------------------------------------------------------------------------------------------------
% observable variables
%---------------------------------------------------------------------------------------------------

dy_   dE_   dw_  dc_  di_  db_
gdebtgdp_  dg_ diG_ dtr_  dtauN_ dtauK_ dtauC_
dy_star_

;

%===================================================================================================
% Declare exogenous variables % 20 shocks /
%===================================================================================================

varexo

etag                $\hat{\eta}^{g}$             % Government consumption spending shock
etaiG               $\hat{\eta}^{i_G}$           % Government investment shock
etatr               $\hat{\eta}^{tr}$            % Transfer shock
etatauC             $\hat{\eta}^{\tau^c}$        % Consumption tax shock
etatauN             $\hat{\eta}^{\tau^w}$        % Labour tax shock
etatauK             $\hat{\eta}^{\tau^k}$        % Capital tax shock

etagz               $\hat{\eta}^{g_z}$           % Permanent technology shock
etaepsilon          $\hat{\eta}^{\varepsilon}$   % Transitory tehcnology shock
etaN                $\hat{\eta}^{N}$             % labour supply (disutility) shock
etaC
etaI                $\hat{\eta}^{i}$             % Investment shock

etaRPG              $\hat{\eta}^{RP}$            % Domestic risk premium shock
etaRPstar           $\hat{\eta}^{RP^*}$          % Foreign risk premium shock

etaYstar            $\hat{\eta}^{y^*}$           % Foreign Technology shock

;

%===================================================================================================
% Declare parameters
%===================================================================================================

parameters

%-------------------------------------------------------------------------------------------------
%%%%%%%%% Core parameters %%%%%%%%%
%-------------------------------------------------------------------------------------------------

//epsilonC
//epsilonN  // colinear with wage shock
ztilde

rhoepsG
rhoepsiG
rhoepstr
rhoepstauC
rhoepstauN
rhoepstauK

Rbar            $\bar{R}$
kappa           $\kappa$

sigmaL          $\sigma_L$
psi             $\psi$
omega           $\omega$
gammaI          $\gamma_I$
gammaB          $\gamma_{B}$
gammaBstar      $\gamma_{B^*}$
gammau2         $\gamma_{u,2}$
gammau1         $\gamma_{u,1}$
betta           $\beta$
betastar        $\beta^*$
alfa            $\alpha$
alphaG          $\alpha_G$
alphaK          $\alpha_K$
nuG             $\nu_G$
nuK             $\nu_K$
delta           $\delta$
deltaG          $\delta_G$

rKbar           $\bar{r}_K$
Rstarbar        $\bar{R}^*$

tauCbar         $\bar{\tau}^c$
tauKbar         $\bar{\tau}^k$
tauNbar         $\bar{\tau}^w$
trJbar          $\bar{tr}^{NR}$
trIbar          $\bar{tr}^{R}$
trbar           $\bar{tr}$
gzbar           $\bar{gz}$
sbar            $\bar{s}$
ybar            $\bar{y}$
kbar            $\bar{k}$
ktildebar       $\bar{\tilde{k}}$
kSbar           $\bar{k}^s$
kGbar           $\bar{k}_G$
ibar            $\bar{i}$
cbar            $\bar{c}$
cIbar           $\bar{c}^R$
cJbar           $\bar{c}^{NR}$
cItildebar      $\bar{\tilde{c}}^R$
gbar            $\bar{g}$
iGbar           $\bar{i_G}$
bbar            $\bar{b}$
nuCbar          $\bar{\nu}_C$
nuIbar          $\bar{\nu}_I$
muC             $\mu_C$
muI             $\mu_I$
mustar          $\mu^*$
hbar            $\bar{h}$
hCbar           $\bar{h}^C$
hIbar           $\bar{h}^I$
hGbar           $\bar{h}^G$
hIGbar          $\bar{h}^{I_G}$
imCbar          $\bar{im}^C$
imIbar          $\bar{im}^I$
xbar            $\bar{x}$
qCbar           $\bar{q}^C$
qIbar           $\bar{q}^I$
imbar           $\bar{im}$
wbar            $\bar{w}$
Nbar            $\bar{N}$
xiE             $\xi_E$
rhoRPG          $\rho_{RP}$
rhoRPstar       $\rho_{RP^*}$
rhogz           $\rho_{g_z}$
rhoepsilon      $\rho_{\epsilon}$
rhoI            $\rho_{i}$
rhoIM           $\rho_{im}$
rhoX            $\rho_{x}$

rhoC            $\rho_{C}$
rhoN            $\rho_{N}$
rhog            $\rho_{g}$
thetaGB         $\theta_{GB}$
thetaGY         $\theta_{GY}$
rhoiG           $\rho_{i_G}$
thetaiGB        $\theta_{i_GB}$
thetaiGY        $\theta_{i_GY}$
rhotr           $\rho_{tr}$
thetatrB        $\theta_{trB}$
thetatrY        $\theta_{trY}$
rhotauC         $\rho_{\tau^c}$
thetatauCB      $\theta_{\tau^cB}$
thetatauCY      $\theta_{\tau^cY}$
rhotauN         $\rho_{\tau^w}$
thetatauNB      $\theta_{\tau^wB}$
thetatauNY      $\theta_{\tau^wY}$
rhotauK         $\rho_{\tau^k}$
thetatauKB      $\theta_{\tau^kB}$
thetatauKY      $\theta_{\tau^kY}$
sigmastar       $\sigma^*$
kappastar       $\kappa^*$
sigmastarn      $\sigma^*_n$
thetastar       $\theta_*$
chistar         $\chi^*$
rhorstar        $\rho_{R^*}$

rhoYstar        $\rho_{Y^*}$

rhoepsrstar

epsRPstarbar
lamRPstar

%-------------------------------------------------------------------------------------------------
%%%%%%%%% Calculation of steady state %%%%%%%%%
%-------------------------------------------------------------------------------------------------

tauNrevYbar_target
tauCrevYbar_target
tauKrevYbar_target
tauKrevYbar
tauNrevYbar
tauCrevYbar
given_alphaG     // CHECK
given_alphaK     // CHECK
alphaG_target
alphaK_target
cJcISSratio
cJcIbar
tr2rot
trJtrIbar
sC
sIMC
sIMI
sX
sI
sG
sIG
sTR
sBbar

epsRPGbar

epsRPKbar
Rgovbar

;

%===================================================================================================
% Initialize parameters
%===================================================================================================

%-------------------------------------------------------------------------------------------------
%%%%%%%%% estimated params from NT-DSGE model fixed for this (flexible price) RBC model %%%%%%%%%
%-------------------------------------------------------------------------------------------------

 omega	=	0.103630862	;
 tr2rot	=	0.689010526	;
 kappa	=	0.950848099	;
 sigmaL	=	2.996936316	;

 muC	=	1.388091321	;

 mustar	=	0.632611725	;

 gammaB	=	0.038477396 ;

 thetatrY	=	0.18859552	;
 thetaGY	=	0.109816633	;
 thetaiGY	=	0.195265714	;
 thetatauCY	=	0.204056348	;
 thetatauNY	=	0.174579288	;
 thetatauKY	=	0.5297234	;
 thetaGB	=	0.180724061 ;
 thetaiGB	=	0.56776651  ;
 thetatrB	=	0.476795906	;
 thetatauNB	=	0.254758939	;
 thetatauKB	=	0.174175636	;
 thetatauCB	=	0.195542651	;

 rhoepsG	=	0.75057545	;
 rhoepsiG	=	0.72063872	;
 rhoepstr	=	0.489992919	;
 rhoepstauC	=	0.429099232	;
 rhoepstauN	=	0.472535983	;
 rhoepstauK	=	0.373096432	;
 xiE	=	0.578804719	;
 rhoRPG	=	0.6896945	;
 rhoRPstar	=	0.842637254	;
 rhogz	=	0.633577953	;
 rhoepsilon	=	0.742024148	;
 rhoN	=	0.747021869	;
 rhoC	=	0.889994754	;
 rhoI	=	0.672859863	;

 rhog	=	0.872847324	;
 rhoiG	=	0.745476518	;
 rhotr	=	0.499480176	;
 rhotauC	=	0.308797902	;
 rhotauN	=	0.339682963	;
 rhotauK	=	0.369364096	;
 rhoYstar	=	0.968004002	;
 rhoepsrstar	=	0.508852246	;

%-------------------------------------------------------------------------------------------------
%%%%% calibrated params %%%%%%%
%-------------------------------------------------------------------------------------------------

betta	=	0.994	;

gammaBstar	=	0.01	;

%% nuG tend to 0 implies that private and public consumption are perfect complements,
%% nuG tend to inf results in perfect substitutability
%% nuG tend to 1 implies the Cobb-Douglas case.
nuG	=	1; // 1 %% from Kemp & Hollander the range is approx. 0.65 to 1.35
nuK	=	1; // 1 %% from Kemp & Hollander the range is approx. 0.65 to 1.35
muI	=	1.5;

gammaI  =  8;

kappastar           =  0.5;
chistar         =   0.2;
thetastar       =   0.7;

rhoIM	=	0.9	;
rhoX	=	0.9	;

betastar	=	betta	;
sigmastar	=	1.4817	;
sigmastarn	=	1.5	;
rhorstar	=	0.9012	;

alfa	=	0.3	;

gzbar	=	1.0066552	;
sbar	=	1	;

tauNrevYbar_target	=	0.1337	;
tauCrevYbar_target	=	0.1039	;
tauKrevYbar_target	=	0.0371	;
given_alphaG	=	1	;
given_alphaK	=	1	;
alphaG_target	=	0.75	;
alphaK_target	=	0.9	;
cJcISSratio	=	0.8	;

sIMC	=	0.224	;
sIMI	=	0.06	;
sI	=	0.126	;
sG	=	0.195	;
sIG	=	0.057	;
sTR	=	0.042	;
sBbar	=	2	;

ztilde	=	0	;

%%%% STEADY STATE Calculated %% should check for any addittional redundant params %%

ztilde            =0;
rhoepsG           =0.75058;
rhoepsiG          =0.72064;
rhoepstr          =0.48999;
rhoepstauC        =0.4291;
rhoepstauN        =0.47254;
rhoepstauK        =0.3731;
Rbar              =1.0241;
kappa             =0.95085;

sigmaL            =2.9969;
psi               =0.37164;
omega             =0.10363;
gammaI            =8;
gammaB            =0.038477;
gammaBstar        =0.01;
gammau2           =0.0045419;
gammau1           =0.045419;
betta             =0.994;
betastar          =0.994;
alfa              =0.3;
alphaG            =0.75;
alphaK            =0.9;
nuG               =1;
nuK               =1;
delta             =0.015;
deltaG            =0.008;

rKbar             =0.045419;
Rstarbar          =1.0108;

tauCbar           =0.16704;
tauKbar           =0.20304;
tauNbar           =0.191;
trJbar            =0.099269;
trIbar            =0.16266;
trbar             =0.15609;
gzbar             =1.0067;
sbar              =1;
ybar              =3.7164;
kbar              =21.7679;
ktildebar         =28.9404;
kSbar             =21.7679;
kGbar             =14.5509;
ibar              =0.46827;
cbar              =2.3116;
cIbar             =2.3605;
cJbar             =1.8884;
cItildebar        =3.0833;
gbar              =0.72471;
iGbar             =0.21184;
bbar              =7.4329;
nuCbar            =0.63987;
nuIbar            =0.52381;
muC               =1.3881;
muI               =1.5;
mustar            =0.63261;
hbar              =2.661;
hCbar             =1.4791;
hIbar             =0.24528;
hGbar             =0.72471;
hIGbar            =0.21184;
imCbar            =0.83248;
imIbar            =0.22299;
xbar              =1.0555;
qCbar             =2.3116;
qIbar             =0.46827;
imbar             =1.0555;
wbar              =1.4369;
Nbar              =1.772;
xiE               =0.5788;
rhoRPG            =0.68969;
rhoRPstar         =0.84264;
rhogz             =0.63358;
rhoepsilon        =0.74202;
rhoI              =0.67286;
rhoIM             =0.9;
rhoX              =0.9;

rhoC              =0.88999;
rhoN              =0.74702;
rhog              =0.87285;
thetaGB           =0.18072;
thetaGY           =0.10982;
rhoiG             =0.74548;
thetaiGB          =0.56777;
thetaiGY          =0.19527;
rhotr             =0.49948;
thetatrB          =0.4768;
thetatrY          =0.1886;
rhotauC           =0.3088;
thetatauCB        =0.19554;
thetatauCY        =0.20406;
rhotauN           =0.33968;
thetatauNB        =0.25476;
thetatauNY        =0.17458;
rhotauK           =0.36936;
thetatauKB        =0.17418;
thetatauKY        =0.52972;
sigmastar         =1.4817;
kappastar         =0.5;
sigmastarn        =1.5;
thetastar         =0.7;
chistar           =0.2;
rhorstar          =0.9012;

rhoYstar          =0.968;

rhoepsrstar       =0.50885;

epsRPstarbar      =1;
lamRPstar         =1;
tauNrevYbar_target=0.1337;
tauCrevYbar_target=0.1039;
tauKrevYbar_target=0.0371;
tauKrevYbar       =0.035936;
tauNrevYbar       =0.13086;
tauCrevYbar       =0.1039;
given_alphaG      =1;
given_alphaK      =1;
alphaG_target     =0.75;
alphaK_target     =0.9;
cJcISSratio       =0.8;
cJcIbar           =0.8;
tr2rot            =0.68901;
trJtrIbar         =0.61029;
sC                =0.622;
sIMC              =0.224;
sIMI              =0.06;
sX                =0.284;
sI                =0.126;
sG                =0.195;
sIG               =0.057;
sTR               =0.042;
sBbar             =2;

epsRPGbar         =1;

epsRPKbar         =0.98876;
Rgovbar           =1.0241;

%===================================================================================================
% Model equations
%===================================================================================================

model(linear);

%-------------------------------------------------------------------------------------------------
%%%%%%%%% Core equations %%%%%%%%%
%-------------------------------------------------------------------------------------------------

%(1) Consumption FOC (A.9)
lambda        = (kappa/gzbar)/(1-kappa/gzbar)*cItilde(-1) - (1/(1-kappa/gzbar))*cItilde
                - (kappa/gzbar)/(1-kappa/gzbar)*gz - tauCbar/(1+tauCbar)*tauC + 1/nuG*(cItilde-cI) + epsilonC;

%(2) Investment FOC
0            =   Q + (gammaI*gzbar^2*(1+betta))*epsilonI
                  + gammaI*gzbar^2*(  betta*(  i(+1) - i) - (  i - i(-1) ) + betta*gz(+1)  - gz);

%(3) Capital FOC
Q             =   betta*(1-delta)*epsRPKbar/gzbar*Q(+1) + lambda(+1) - lambda - gz(+1)
                  - betta*(1-tauKbar)*rKbar/gzbar*epsRPKbar*(  1/(1-tauKbar)*tauK(+1) - rK(+1) - u(+1))
                  + betta*delta/gzbar*epsRPKbar*( tauK(+1));

%(4) Euler for government bonds

lambda        =   lambda(+1) - gz(+1) + (rrp);

%(5) UIP // bstar converted to net foreign *debt* for comparability and endogegenous debt responses moved into AR(1) processes for RPstar and RPG

% (rrp) =   s(+1) - s  +   (rstar + epsilonRPstar + gammaBstar*lamRPstar*sbar/ybar*(bstar - y));


%(6) Capital accumulation
k             =   (1-delta)/gzbar*k(-1) - (1-delta)/gzbar*gz
                          + (1-(1-delta)/gzbar)*(gammaI*gzbar^2*(1+betta))*epsilonI
                          + (1-(1-delta)/gzbar)*i;

%(7) Capacity utilisation
rK             =   gammau2/gammau1*u ;


%(8) Capital services
kS             =    u   +   k(-1);


%(9) Wage setting FOC
w - (1/(1-tauNbar))*(tauN) = (sigmaL*(N + epsilonN) - lambda) ;    // epsilonN +

%(10) Production
y             =   (1+psi/ybar)*(  epsilon + alfa*(ktilde - gz) + (1-alfa)*N );


%(11) Firms cost minimisation
rK            =   gz + N +  w  - kS
                        - (nuK-1)/nuK*( ((1-alphaK)/alphaK )^(1/nuK)*(kGbar/kbar)^((nuK-1)/nuK ) )/
                        ( 1+((1-alphaK)/alphaK )^(1/nuK)*(kGbar/kbar)^( (nuK-1)/nuK ) )*( kG(-1)-kS );



%(17) Total consumption
% c            =   nuCbar^(1/muC)*(hCbar/qCbar)^(1-1/muC)*(c ) + (1-nuCbar)^(1/muC)*(imCbar/qCbar)^(1-1/muC)*imC;



%(19) Total investment
% i            =   nuIbar^(1/muI)*(hIbar/qIbar)^(1-1/muI)*(i ) + (1-nuIbar)^(1/muI)*(imIbar/qIbar)^(1-1/muI)*imI;

% imI = i ;


%(21) Total imports
% im            =   imCbar/imbar*imC + imIbar/imbar*imI;


%(22) Total exports
% x             = mustar*( s ) + ystar + ztilde;


% (24) Resource constraint (real) %%% why both real and nominal? This may cause issues with inclusion of flex price equilibrium.

y             =   hbar/ybar*(hCbar/hbar*(c ) + hIbar/hbar*(i ) + hGbar/hbar*g + hIGbar/hbar*iG); % + xbar/ybar*x;


% (25) Resource Constraint Nominal
 y        =   cbar/(ybar)*( c ) + ibar/(ybar)*( i) + kbar/(gzbar*ybar)*gammau1*u
                          + gbar/(ybar)*( g) + iGbar/(ybar)*( iG); % + xbar/(ybar)*( x) ;
                          % - imCbar/(ybar)*(  imC )
                          % - imIbar/(ybar)*(  imI );

%(26) Net foreign assets --> convert bstar to net foreign debt. CHECK: foreign/external rate missing?

% - (1/Rstarbar)*bstar + (1/(gzbar))*bstar(-1) =
%                          + xbar/(sbar)*(  x - s  - ztilde)
%                          - imbar/(sbar)*( im - s  - ztilde);


%(32) Government / fiscal budget constraint %% CHECK formulation and should r and rrp not be r(-1) and rrp(-1)? This specification is discounting current b... see WP comments
gbar/(ybar)*( g - y) = cbar/(ybar)*(tauC + tauCbar*(c - y))
                                            + wbar*Nbar/(ybar)*(tauN + tauNbar*(w + N - y))
                                            - iGbar/(ybar)*(iG - y)
                                            + rKbar*kbar/(gzbar*(ybar))*(tauK + tauKbar*(u + rK + k(-1) - gz - y))
                                            - kbar/(gzbar*(ybar))*(delta*tauK + tauKbar*gammau1*u + tauKbar*delta*(k(-1) - gz - y))
                                            %% + bbar/(Rgovbar*(ybar))*(b - r - y)
                                            + bbar/(Rgovbar*(ybar))*(b - rrp - y)
                                            - bbar/(gzbar*(ybar))*(b(-1) - gz - y)
                                            - trbar/(ybar)*(tr - y);


%(33) Valued consumption
cItilde        =   alphaG^(1/nuG)*(cIbar/cItildebar)^((nuG-1)/nuG)*cI
                          + (1-alphaG)^(1/nuG)*(gbar/cItildebar)^((nuG-1)/nuG)*g;

%(34) Composite capital
ktilde        =   alphaK^(1/nuK)*(kbar/ktildebar)^((nuK-1)/nuK)*kS
                          + (1-alphaK)^(1/nuK)*(kGbar/ktildebar)^((nuK-1)/nuK)*kG(-1);

%(35) Public capital accumulation
kG            =   (1-deltaG)/gzbar*kG(-1) - (1-deltaG)/gzbar*gz
                          + (1-(1-deltaG)/gzbar)*iG
                          + (1-(1-deltaG)/gzbar)*(gammaI*gzbar^2*(1+betta))*epsilonI;

%(36) Total consumption (Ricardian + non-Ricardian)
c            =   (1-omega)*cIbar/cbar*cI + omega*cJbar/cbar*cJ;

%(37) Total transfers
tr           =  (1-omega)*trIbar/trbar*trI + omega*trJbar/trbar*trJ;

%(38) Transfer distribution rule
tr2rot*trI   = (1-tr2rot)*trJ;

%(39) Non-Ricardian consumption
0            = (1+tauCbar)*cJbar*(tauCbar/(1+tauCbar)*tauC + cJ)
             - (1-tauNbar)*wbar*Nbar*(w + N - (1/(1-tauNbar))*(tauN)) - trJbar*trJ;

%-------------------------------------------------------------------------------------------------
%%%%%%%%% Shock processes %%%%%%%%%
%-------------------------------------------------------------------------------------------------

%(40) Preference shock
epsilonC    =   rhoC*epsilonC(-1) + etaC;

%(41) Labour shock
epsilonN    =   rhoN*epsilonN(-1) + etaN; //

%(42) Domestic risk premium shock // CHECK: function of domestic debt?
epsilonRPG    =   rhoRPG*epsilonRPG(-1) + etaRPG;             // + gammaB*b

%(43) Foreign risk premium shock // CHECK: function of foreign debt?
epsilonRPstar =   rhoRPstar*epsilonRPstar(-1) + etaRPstar;    // + gammaBstar*lamRPstar*sbar/ybar*bstar

%(44) Permanent technology shock
gz            =   rhogz*gz(-1) + etagz;

%(45) Transitory technology shock
epsilon       =   rhoepsilon*epsilon(-1) + etaepsilon;

%(46) Investment efficiency shock
epsilonI      =   rhoI*epsilonI(-1) + etaI;

%(51) Government consumption shock
g =  rhog*g(-1) -  thetaGY*y  -  thetaGB*b(-1)  + epsilonG;

%(52) Government investment shock
iG =  rhoiG*iG(-1) -  thetaiGY*y -  thetaiGB*b(-1) + epsiloniG;

%(53) Goverment transfer shock
tr =  rhotr*tr(-1) - thetatrY*y  -  thetatrB*b(-1) + epsilontr;

%(54) Consumption tax shock
tauC = rhotauC*tauC(-1) +   thetatauCB*b(-1) + thetatauCY*y +  epsilontauC ;

%(55) Labour tax shock
tauN =  rhotauN*tauN(-1)  +   thetatauNB*b(-1)  +  thetatauNY*y +  epsilontauN;

%(56) Capital tax shock
tauK = rhotauK*tauK(-1) + thetatauKB*b(-1)  +  thetatauKY*y  +  epsilontauK;


epsilonG = rhoepsG*epsilonG(-1) + etag;
epsiloniG = rhoepsiG*epsiloniG(-1) + etaiG;
epsilontr = rhoepstr*epsilontr(-1) + etatr;
epsilontauC = rhoepstauC*epsilontauC(-1) + etatauC;
epsilontauN = rhoepstauN*epsilontauN(-1) + etatauN;
epsilontauK = rhoepstauK*epsilontauK(-1) + etatauK;


%-------------------------------------------------------------------------------------------------
%%%%%%%%% Foreign economy %%%%%%%%%
%-------------------------------------------------------------------------------------------------

%(58) Foreign output

ystar = (1 + sigmastarn)/(sigmastar + sigmastarn)*epsilonYstar;     // real marginal cost foreign economy

ystar        =           (1/(1 + kappastar))*ystar(+1) + (kappastar/(1 + kappastar))*(ystar(-1))
                       - ((1 - kappastar)/(sigmastar*(1 + kappastar)))*(rstar + epsilonRPstar);  //   foreign IS curve // ystar = cstar

%(60) Foreign output shock
epsilonYstar   =         rhoYstar*epsilonYstar(-1) + etaYstar;

%-------------------------------------------------------------------------------------------------
%%%%%%%%% Miscellaneous %%%%%%%%%
%-------------------------------------------------------------------------------------------------

%(62) Employment equation
// E    =   betta/(1+betta)*E(+1) + 1/(1+betta)*E(-1) + (1-betta*xiE)*(1-xiE)/((1+betta)*xiE)*(N - E);
N + epsilonN  =  E + (xiE/((1 - betta*xiE)*(1 - xiE)))*((E - E(-1)) + betta*(E - E(+1)));    // (re-written ito N. Easier to see xiE=0 gives N=E)

%-------------------------------------------------------------------------------------------------
%%%%%%%%% Fiscal sustainability & Fiscal r-star %%%%%%%%%
%-------------------------------------------------------------------------------------------------

%(32b) Fiscal Sustainability // pbud = primary balance // pbudsus = sustainable primary balance // susgap = sustainability gap

(pbudsus - y) = (rrp - (dy ) + b(-1) - y(-1)); %% primary balance required to prevent debt (de)accumulation at each point in time (i.e., for a given initial debt to gdp level)
susgap = pbud - pbudsus;
susgapgdp = (pbud - pbudsus) - y;

pbud = cbar/(ybar)*(tauC + tauCbar*(c - y))
                                            + wbar*Nbar/(ybar)*(tauN + tauNbar*(w + N - y))
                                            + rKbar*kbar/(gzbar*(ybar))*(tauK + tauKbar*(u + rK + k(-1) - gz - y))
                                            - gbar/(ybar)*( g - y)
                                            - iGbar/(ybar)*( iG - y)
                                            - kbar/(gzbar*(ybar))*(delta*tauK + tauKbar*gammau1*u + tauKbar*delta*(k(-1) - gz - y))
                                            - trbar/(ybar)*(tr - y);

%(32c) Fiscal Rstar //

// fiscalr = dy + piY + ((pbud - y) - (b(-1) - y(-1))); // note: technically this should be the lagged real rate (unless we discounting current debt:CHECK) but we are looking at the prevailing fiscal rstar at time t

fiscalr = dy + 0.25*((pbud - y) - (b(-1) - y(-1))); // scale the fiscal balance sheet effect by 1/4 (because it’s quarterly PB flow over the stock… more comparable )
% fiscalrreal = fiscalr ; // Real fiscal r-star
% rrpreal = rrp ; // This is the prevail real rate with RP to compare with the prevailing fiscal rstar
% rreal = r ; // This is the prevail real rate without RP to compare with the prevailing fiscal rstar

% fiscalrrpgap = rrpreal - fiscalrreal;
% fiscalrgap = rreal - fiscalrreal;

fiscalrrpgap = rrp - fiscalr;
fiscalrgap = r - fiscalr;

%-------------------------------------------------------------------------------------------------
%%%%%%%%% Identities %%%%%%%%%
%-------------------------------------------------------------------------------------------------

%(87)
dy = y - y(-1);
d4y = dy + dy(-1) + dy(-2) + dy(-3);

%(95)
rrp = r + epsilonRPG + gammaB*(b - y);

%(96)
% rrpstar = rstar + epsilonRPstar + gammaBstar*lamRPstar*sbar/ybar*(bstar - y);

by = b - y;

%-------------------------------------------------------------------------------------------------
%%%%%%%%% Measurement equations %%%%%%%%%
%-------------------------------------------------------------------------------------------------

%(64) Output
dy_/100             =  y - y(-1) + gz + log(gzbar) ; // + me_y; // gzbar=1.0066552

%(65) Consumption
dc_/100             =   c - c(-1) + gz + log(gzbar+0.0014) ; // + me_c;  // 0.00807162888


%(66) Government consumption
dg_/100             =   g - g(-1) + gz + log(gzbar-0.0006) ; // + me_g; // 0.00602793531

%(66) Government debt
db_/100             =   b - b(-1) + gz + log(gzbar+0.00529246) ; // + me_b  Actual is different: 1.194766034 % CHECK all.  0.01194766034

gdebtgdp_/100     = b - y + (41.131)/100 ; // + me_b; //  use + (41.131)/100 for gdebtgdp_


%(69) Employment
dE_/100             =   E - E(-1) + log(1.001519) ; // + me_E;   // 0.00151911820

%(70) Real wages
dw_/100             =   w - w(-1) + gz + log(1.0049153) ; //  + me_w;  // 0.00491532762


%(72) Private investment
di_/100             =   i - i(-1) + gz + log(1.0109017) ; // + me_i; // 0.01090168655

%(73) Government investment
diG_/100            =   iG - iG(-1) + gz + log(1.01048) ; // + me_ig;   // 0.01048005548

%(74) Transfers
dtr_/100            =   tr - tr(-1) + gz + log(1.016321) ; // + me_tr;   // 0.01632059796


%(79)
dtauC_/100          =   tauC - tauC(-1) + log(1.00011) ; // + me_tauC;    //  0.00010959479

%(80)
dtauN_/100          =   tauN - tauN(-1) + log(1.0004231) ; // + me_tauN;    // 0.00042309761

%(81)
dtauK_/100          =   tauK - tauK(-1) + log(1.0008117) ; // + me_tauK;    // 0.00081166700

%(82) Foreign output
dy_star_/100        =    ystar - ystar(-1) + log(1.00708) ; // + me_Ystar; // % + me_ystar; // + ztilde - ztilde(-1)  + gz


%===================================================================================================
end;
%===================================================================================================

%===================================================================================================
% Compute the steady state
%===================================================================================================


%SAFiscal_fiscalrstar_steadystate([],[],1); %print steady state and parameters % NOT NECESSARY HERE
steady;
check;
%resid;


%==========================================================================
shocks;
%==========================================================================

var	etaYstar;	stderr	0.005923996	;

var	etag;	stderr	0.00619333	;
var	etaiG;	stderr	0.039485063	;
var	etatr;	stderr	0.083414022	;

var	etaRPG;	stderr	0.003846913	;
var	etaRPstar;	stderr	0.001767061	;
var	etagz;	stderr	0.003013929	;
var	etaepsilon;	stderr	0.005565292	;
var	etaN;	stderr	0.005887254	;
var	etaC;	stderr	0.034214136	;
var	etaI;	stderr	0.004235552	;

var	etatauC;	stderr	0.011506069	;
var	etatauN;	stderr	0.010207681	;
var	etatauK;	stderr	0.021075837	;

%---------------------------------------------------------------------------------------------------
end;
%---------------------------------------------------------------------------------------------------


stoch_simul(order=1, irf=40, nograph, nodisplay) y c cI cJ i N g iG tr tauC tauN tauK b by r rrp;
