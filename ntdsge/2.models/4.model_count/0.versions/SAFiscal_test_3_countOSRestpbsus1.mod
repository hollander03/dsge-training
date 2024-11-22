%Small open economy model for SA with extended fiscal sector

%Dynare Version 4.5.0 used for calculations
%December, 2018

%% obs data for govt debt: gdebtgdp // conuterfactual estimation for govt spending 2X larger endogenous cyclical response to y and b
%% builds on test_2. Includes rrp in govt budget.
%% OSRs for government investment counterfactual for loss function with y, pbsusgapgdp: individual

%===================================================================================================
% Housekeeping
%===================================================================================================
%clear;
close all;

%===================================================================================================
% Declare endogenous variables                                          (89) 
%===================================================================================================

var

%---------------------------------------------------------------------------------------------------
% Prices                                                                (7)
%---------------------------------------------------------------------------------------------------
piC                 $\hat{\pi}_{C}$     % Consumer price inflation
piI                 $\hat{\pi}_{I}$     % Investment price deflator inflation
piH                 $\hat{\pi}_{H}$     % Domestic goods inflation (PPI)
piIM                $\hat{\pi}_{IM}$    % Imported good inflation
piX                 $\hat{\pi}_{X}$     % Export good inflation
piY                 $\hat{\pi}_{Y}$     % GDP deflator   
piCbar              $\hat{\bar{\pi}}^C$ % Possibly time varying inflation target

%---------------------------------------------------------------------------------------------------
% Marginal cost                                                         (1)
%---------------------------------------------------------------------------------------------------
mc                  $\hat{mc}$          % Marginal cost: domestic good

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
im                  $\hat{im}$              % Total imports
imC                 $\hat{im}^C$            % Imported consumption good
imI                 $\hat{im}^I$            % Imported investment good
x                   $\hat{x}$               % Exports
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
pbud                $\hat{p}^{bud}$         % primary budget
pbudsus             $\hat{p}^{sus}$         % primary budget (sustainable)
susgap              $\hat{p}^{gap}$         % fiscal sustainability gap
susgapgdp           $\hat{p}^{gapgdp}$      % fiscal sustainability gap % of gdp
by                  $\frac{b}{y}$           % Govt Debt-to-GDP

%---------------------------------------------------------------------------------------------------
% Foreign variables                                                     (4)
%---------------------------------------------------------------------------------------------------
ystar               $\hat{y}^*$             % Foreign output
rstar               $\hat{r}^*$             % Foreign interest rate
piYstar             $\hat{\pi}^*$           % Foreign (GDP deflator) inflation
bstar               $\hat{b}^*$             % Foreign government debt / foreign bonds (net foreign debt)
epsilonrstar                                % AR(1) process for MP innovation

%---------------------------------------------------------------------------------------------------
% Relative prices (relative to consumption good)                        (5)
%---------------------------------------------------------------------------------------------------
pY                  $\hat{p}_Y$             % Output price
pIM                 $\hat{p}_{IM}$          % Import price
pI                  $\hat{p}_I$             % Investment price
pH                  $\hat{p}_H$             % Domestic goods price
pX                  $\hat{p}_X$             % Export price

%---------------------------------------------------------------------------------------------------
% Miscellaneous                                                         (17)
%---------------------------------------------------------------------------------------------------
lambda              $\hat{\lambda}$             % Lagrange multiplier - consumption
Q                   $\hat{Q}$                   % Tobin's Q
s                   $\hat{s}$                   % Real (error: decalred as Nominal) exchange rate [CHECK: lower case s declared as real in appendix p. 52, Eq.A6]
gz                  $\hat{g}_z$                 % Trend growth / prodcutivity growth
epsilonRPG          $\hat{\varepsilon}^{RP}$    % Risk premium shock on domestic debt (domestic currency denominated) //  a risk premium shock over the policy rate for domestic-currency assets
epsilonRPstar       $\hat{\varepsilon}^{RP^*}$  % Risk premium shock on foreign debt (foreign currency denominated)   //  risk premium shock for foreign-currency assets, equivalent to a foreign demand shock
epsilon             $\hat{\varepsilon}$         % Transitory technology shock
epsilonN            $\hat{\varepsilon}^N$       % Labour supply/disutility shock
epsilonC            $\hat{\varepsilon}^C$       % Preference shock
epsilonI            $\hat{\varepsilon}^i$       % Investment specific technology shock
epsilonYstar        $\hat{\varepsilon}^{Y^*}$   % Foreign demand shock
epsilonpiYstar      $\hat{\varepsilon}^{\pi^*}$ % Foreign price shock
varphiW             $\hat{\phi}^W$              % Markup of real wage over MRS between consumption and leisure
varphiH             $\hat{\phi}^H$              % Markup of domestic price over MC
varphiX             $\hat{\phi}^X$              % Markup of export price over MC
varphistar          $\hat{\phi}^*$              % Foreign maurkup over foreign MC
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

piW                 $\hat{\pi}^w$               % Wage inflation    
dy
%d4y
%d4y_obs
%R4
%piC4
%piH4
%piC_4 
%piH_4 
rrp
rrpstar

%---------------------------------------------------------------------------------------------------
% Observed variables                                                    (23)
%---------------------------------------------------------------------------------------------------                                

dy_		
dc_	
dg_	
db_
gdebtgdp_
dx_		
dim_
dsr_    
dE_		
dw_		
R_				
di_		
diG_	
dtr_    
pi_im_
pi_x_  
pi_c_  
pi_cbar_ 
pi_h_   
dtauC_  
dtauN_  
dtauK_  
dy_star_
R_star_	
pi_Ystar_                

etaobsYstar	etaobsPiYstar	etaobsRstar	etaobsg	etaobsiG	etaobstr	etaobsR	
etaobsRPG	etaobsRPstar	etaobsgz	etaobsepsilon	etaobsN	etaobsC	etaobsI	
etaobsvarphiH	etaobsvarphiX	etaobsvarphistar	etaobsvarphiW	etaobstauC	
etaobstauN	etaobstauK	etaobspiCbar	meobs_E	meobs_w	meobs_pi_im	meobs_pi_x	
meobs_b    

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

etaYstar            $\hat{\eta}^{y^*}$           % Foreign demand shock
etaPiYstar          $\hat{\eta}^{\pi^*}$         % Foreign inflation shock
etaRstar            $\hat{\eta}^{R^*}$           % Foreign interest rate shock

etagz               $\hat{\eta}^{g_z}$           % Permanent technology shock
etaepsilon          $\hat{\eta}^{\varepsilon}$   % Transitory tehcnology shock
etaN                $\hat{\eta}^{N}$             % labour supply (disutility) shock
etaC
etaI                $\hat{\eta}^{i}$             % Investment shock
etavarphiH          $\hat{\eta}^{\phi^H}$        % Domestic price markup shock
etavarphiX          $\hat{\eta}^{\phi^X}$        % Export price markup shock
etavarphistar       $\hat{\eta}^{\phi^*}$        % Import/Foreign markup shock
etavarphiW          $\hat{\eta}^{\phi^W}$        % Wage markup shock
etaR                $\hat{\eta}^{R}$             % Interest rate shock

etaRPG              $\hat{\eta}^{RP}$            % Domestic risk premium shock
etaRPstar           $\hat{\eta}^{RP^*}$          % Foreign risk premium shock 
etapiCbar           $\hat{\bar{\eta}}^C$         % Inflation target shock
%etaztilde

% Measurement error

//me_y
me_c
//me_g  
me_E
me_w
me_i
//me_x
//me_im
//me_pi_h
me_pi_im
me_pi_x
//me_tauC
//me_tauN
//me_tauK
me_b
//me_ig
//me_tr
//me_s
me_piYstar
me_Ystar
me_Rstar 

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
//etaPiYstar
//etagz

rhoepsG
rhoepsiG
rhoepstr
rhoepstauC
rhoepstauN
rhoepstauK

Rbar            $\bar{R}$
kappa           $\kappa$
chiW            $\chi_W$
chiH            $\chi_H$
chiX            $\chi_X$
chiM            $\chi^M$
thetaW          $\theta_W$
thetaH          $\theta_H$
thetaX          $\theta_X$
thetaM          $\theta_M$
varphiWbar      $\bar{\phi}^W$
varphiHbar      $\bar{\phi}^H$
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
phiR            $\phi_R$
phiPi           $\phi_{\pi}$
phiY            $\phi_Y$
phiDPi          $\phi_{\Delta\pi}$
phiDY           $\phi_{\Delta Y}$
PiYstarbar      $\bar{\pi}_Y^*$
Pibar           $\bar{\pi}$
rKbar           $\bar{r}_K$
Rstarbar        $\bar{R}^*$
pIbar           $\bar{p}_I$
pHbar           $\bar{p}_H$
pIMbar          $\bar{p}_{IM}$
pCbar           $\bar{p}_C$
pYbar           $\bar{p}_Y$
pGbar           $\bar{p}_G$
pIGbar          $\bar{p}_{I_G}$    
pXbar           $\bar{p}_X$
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
rhovarphiW      $\rho_{\phi^W}$
rhovarphiH      $\rho_{\phi^H}$
rhovarphiX      $\rho_{\phi^X}$
rhovarphistar   $\rho_{\phi^*}$
rhopiC          $\rho_{\pi^C}$
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
rhopiYstar      $\rho_{\pi^*}$    
rhoYstar        $\rho_{Y^*}$
rhopiYstarpiYstar   $\rho_{\pi^*,\pi^*}$
rhopiYstarYstar     $\rho_{\pi^*,Y^*}$
piYstarbar      $\hat{\bar{\pi}}^*$
rhoepsrstar
kappapistar
kappaystar  
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
GovRSpread
epsRPGbar
CorpGovSpread
epsRPKbar
Rgovbar

;

%===================================================================================================
% Initialize parameters
%===================================================================================================

%%%%% estimated params fixed
 omega	=	0.103630862	;
 tr2rot	=	0.689010526	;
 kappa	=	0.950848099	;
 sigmaL	=	2.996936316	;
					
 muC	=	1.388091321	;

 mustar	=	0.632611725	;
 thetaH	=	0.729515013	;
 chiH	=	0.517666691	;
 thetaX	=	0.746974416	;
 chiX	=	0.684531451	;
 thetaM	=	0.775795152	;
 chiM	=	0.642727847	;
 thetaW	=	0.483006426	;
 chiW	=	0.512497013	;
 gammaB	=	0.038477396 ;
 phiR	=	0.871525583	;
 phiPi	=	1.567210076	;   // original 1.567210076  // OSR params 3.24392 opt // 2.13134 opt coord b,y // OSR params 3.12572 opt / 3.35216 opt coord b,pb^sus //
 phiDY	=	0.387040673	;   // original 0.387040673  // OSR params 1.32413 opt // 8.35792 opt coord b,y // OSR params 1.10191 opt / 1.20576 opt coord b,pb^sus //

 thetatrY	=	0.18859552	;		
 thetaGY	=	0.109816633	; // Original: 0.109816633// G.Consumption: OSR params 0.033229 pbsusgdp ,y  // 0.0210663 opt coord pbsusgdp, y // G.Invest: // OSR params -0.656391 b,y // OSR params 0.0347252  y,pb^sus 
 thetaiGY	=	0.186991	; // Original: 0.195265714 // OSR params 0.186991 pbsus,y  // OSR params 0.194994  y,pb^sus both // coord 0.189902  // x2 : 0.4 // x4 : 0.80 // 1.6 x8 
 thetatauCY	=	0.204056348	;
 thetatauNY	=	0.174579288	;
 thetatauKY	=	0.5297234	;
 thetaGB	=	0.180724061  ; // Original: 0.180724061 // G.Consumption: OSR params 0.327462 pbsusgdp ,y // 0.350575 opt coord pbsusgdp, y// OSR params 1.38299 b,y  // OSR params 0.324587  y,pb^sus  // x2 : 0.3614 // x4 : 0.7229 // 1.4458 x8 
 thetaiGB	=	1.00299    ; // Original: 0.56776651 // OSR params 1.00299 pbsus,y   // OSR params 0.582071  y,pb^sus coord 1.0261  // x2 : 1.1355 // x4 : 2.2711 // 4.5421 x8 
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
 rhovarphiW	=	0.565952847	;
 rhovarphiH	=	0.484783078	;
 rhovarphiX	=	0.656535086	;
 rhovarphistar	=	0.556944683	;
 rhog	=	0.872847324	;
 rhoiG	=	0.745476518	;
 rhotr	=	0.499480176	;
 rhotauC	=	0.308797902	;
 rhotauN	=	0.339682963	;
 rhotauK	=	0.369364096	;
 rhoYstar	=	0.968004002	;
 rhoepsrstar	=	0.508852246	;

%%%%% calibrated params

betta	=	0.994	;

gammaBstar	=	0.01	;

nuG	=	1;
nuK	=	1;
muI	=	1.5;

gammaI  =  8;  %10.21586875; %8; 

kappastar           =  0.5;
chistar         =   0.2; 
thetastar       =   0.7;  
		
rhoIM	=	0.9	;
rhoX	=	0.9	;
rhopiC	=	0	;

rhopiYstarpiYstar	=	betta	;
betastar	=	betta	;
rhopiYstarYstar	=	0.1944	;
sigmastar	=	1.4817	;
sigmastarn	=	1.5	;
rhorstar	=	0.9012	;
rhopiYstar	=	0	;

piYstarbar	=	1.005	;
kappapistar	=	1.5	;
kappaystar	=	0.125	;
			
alfa	=	0.3	;
Pibar	=	1.01125	;
pIMbar	=	1	;
pCbar	=	1	;
gzbar	=	1.0066552	;
sbar	=	1	;
varphiWbar	=	1.05	;
varphiHbar	=	1.1	;

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

%% redundant

ztilde	=	0	;
GovRSpread	=	0	;
CorpGovSpread	=	0	;     

phiDPi	=	0.025119744	;
phiY	=	0.160768392	;

%===================================================================================================
% Model equations
%===================================================================================================

model(linear);

%-------------------------------------------------------------------------------------------------
%%%%%%%%% Core equations %%%%%%%%%
%-------------------------------------------------------------------------------------------------

%(1) Consumption FOC
lambda        = (kappa/gzbar)/(1-kappa/gzbar)*cItilde(-1) - (1/(1-kappa/gzbar))*cItilde
                - (kappa/gzbar)/(1-kappa/gzbar)*gz - tauCbar/(1+tauCbar)*tauC + 1/nuG*(cItilde-cI) + epsilonC;

%(2) Investment FOC
pI            =   Q + (gammaI*gzbar^2*(1+betta))*epsilonI
                  + gammaI*gzbar^2*(  betta*(  i(+1) - i) - (  i - i(-1) ) + betta*gz(+1)  - gz);

%(3) Capital FOC
Q             =   betta*(1-delta)*epsRPKbar/gzbar*Q(+1) + lambda(+1) - lambda - gz(+1)
                  - betta*(1-tauKbar)*rKbar/gzbar/pIbar*epsRPKbar*(  1/(1-tauKbar)*tauK(+1) - rK(+1) - u(+1))
                  + betta*delta*pIbar/gzbar*epsRPKbar*( tauKbar*pI(+1) + tauK(+1));

%(4) Euler for government bonds
%% lambda        =   lambda(+1) - gz(+1) + (r + epsilonRPG + gammaB*(b - y)) - piC(+1);
lambda        =   lambda(+1) - gz(+1) + (rrp) - piC(+1); // rrp = r + epsilonRPG + gammaB*(b - y)

%(5) UIP // bstar converted to net foreign *debt* for comparability and endogegenous debt responses moved into AR(1) processes for RPstar and RPG 
%% (r + epsilonRPG + gammaB*(b - y)) =   s(+1) - s + piY(+1) - piYstar(+1)
%%                            +   (rstar + epsilonRPstar + gammaBstar*lamRPstar*sbar/ybar*(bstar - y));    // lamRPstar* =1   [gammaBstar*lamRPstar*sbar/ybar = 0.0096]

(rrp) =   s(+1) - s + piY(+1) - piYstar(+1)
                            +   (rstar + epsilonRPstar + gammaBstar*lamRPstar*sbar/ybar*(bstar - y));

%%% gammaB*(b - y) // gammaBstar*lamRPstar*sbar/ybar*(bstar - y)
%%% epsilonRPG + r - rstar  =   s(+1) - s + piY(+1) - piYstar(+1)
%%%                         - gammaBstar*lamRPstar*sbar/ybar*bstar + epsilonRPstar; // lamRPstar* =1 
 
%(6) Capital accumulation 
k             =   (1-delta)/gzbar*k(-1) - (1-delta)/gzbar*gz
                          + (1-(1-delta)/gzbar)*(gammaI*gzbar^2*(1+betta))*epsilonI
                          + (1-(1-delta)/gzbar)*i;

%(7) Capacity utilisation 
rK             =   gammau2/gammau1*u + pI;


%(8) Capital services
kS             =    u   +   k(-1);


%(9) Wage phillips 
w             =   betta/(1+betta)*w(+1) + 1/(1+betta)*w(-1) + betta/(1+betta)*piC(+1) 
                            - (1+betta*chiW)/(1+betta)*piC + chiW/(1+betta)*piC(-1)
                            -betta*(1-chiW)/(1+betta)*piCbar(+1) + (1-chiW)/(1+betta)*piCbar
                            - 1/(1+betta)*( gz - betta*gz(+1))
                            - (1-betta*thetaW)*(1-thetaW)/((1+betta)*thetaW*(1+varphiWbar/(varphiWbar-1)*sigmaL))*
                           ( w - (1/(1-tauNbar))*(tauN)  - (sigmaL*(N + epsilonN) - lambda) ) + varphiW;    // epsilonN + 


%(10) Production
y             =   (1+psi/ybar)*(  epsilon + alfa*(ktilde - gz) + (1-alfa)*N );


%(11) Firms cost minimisation
rK            =   gz + N +  w  - kS
                        - (nuK-1)/nuK*( ((1-alphaK)/alphaK )^(1/nuK)*(kGbar/kbar)^((nuK-1)/nuK ) )/
                        ( 1+((1-alphaK)/alphaK )^(1/nuK)*(kGbar/kbar)^( (nuK-1)/nuK ) )*( kG(-1)-kS );


%(12) Marginal cost
mc            =   - epsilon  +   alfa*rK   +   (1-alfa)*w   +   alfa*(kS - ktilde)
                    +  alfa   *   (nuK-1)/nuK     *    (   ((1-alphaK)/alphaK)^(1/nuK)    *     (kGbar/kbar)^((nuK-1)/nuK )      )   /
                        (     1  +   ((1-alphaK)/alphaK )^(1/nuK)    *     (kGbar/kbar)^((nuK-1)/nuK )      )     *      ( kG(-1)-kS );
                
%(13) Inflation target
piCbar  =  rhopiC*piCbar(-1) + etapiCbar;


%(14) Domestic Phillips curve %% CHECK = PPI
piH - piCbar    =  betta/(1+betta*chiH)*(piH(+1) - piCbar(+1)) + chiH/(1+betta*chiH)*(piH(-1) - piCbar)
                    + betta*chiH/(1+betta*chiH)*(piCbar(+1) - piCbar)
                    + (1-betta*thetaH)*(1-thetaH)/(thetaH*(1+betta*chiH))*(mc - pH) + varphiH;


%(15) Export Phillips %% CHECK: local currency pricing / LOOP holds?
piX - piCbar     =   betta/(1+betta*chiX)*(piX(+1) - piCbar(+1)) + chiX/(1+betta*chiX)*(piX(-1) - piCbar)
                    + betta*chiX/(1+betta*chiX)*(piCbar(+1) - piCbar)
                    + (1-betta*thetaX)*(1-thetaX)/(thetaX*(1+betta*chiX))*(mc  - pX ) + varphiX;

%(16) Import Phillips %% CHECK: *(s + pY - pIM) // CHECK: paramter names same for foreign sector... 
piIM - piCbar   =   betta/(1+betta*chiM)*(piIM(+1) - piCbar(+1)) + chiM/(1+betta*chiM)*(piIM(-1) - piCbar)
                       + betta*chiM/(1+betta*chiM)*(piCbar(+1) - piCbar)
                       + (1-betta*thetaM)*(1-thetaM)/(thetaM*(1+betta*chiM))*(s + pY - pIM) + varphistar;


%(17) Total consumption
c            =   nuCbar^(1/muC)*(hCbar/qCbar)^(1-1/muC)*(c - muC*pH) + (1-nuCbar)^(1/muC)*(imCbar/qCbar)^(1-1/muC)*imC;
 

%(18) Consumption price index
0        =   nuCbar*(pHbar/1)^(1-muC)*pH + (1-nuCbar)*(pIMbar/1)^(1-muC)*(  pIM );

%(19) Total investment
i            =   nuIbar^(1/muI)*(hIbar/qIbar)^(1-1/muI)*(i - muI*( pH - pI)) + (1-nuIbar)^(1/muI)*(imIbar/qIbar)^(1-1/muI)*imI;


%(20) Investment price index
pI            =   nuIbar*(pHbar/pIbar)^(1-muI)*pH
                          + (1-nuIbar)*(pIMbar/pIbar)^(1-muI)*(  pIM );
              
%(21) Total imports
im            =   imCbar/imbar*imC + imIbar/imbar*imI;


%(22) Total exports
x             = - mustar*(  pX - pY - s ) + ystar + ztilde; 

%(23) Taylor rule / Monetary Policy
// r             =   phiR*r(-1)+ (1-phiR)*(piCbar + phiPi*(piC - piCbar) + phiY*y) + phiDPi*(piC - piC(-1))+ phiDY*(y - y(-1)) + etaR; //piC(-1) phiY*y(-1)
r             =   phiR*r(-1)+ (1-phiR)*(piCbar + phiPi*(piC - piCbar) + phiDY*(y - y(-1))) + etaR; 

%(24) Resource constraint (real) %%% why both? Is this the
y             =   hbar/ybar*(hCbar/hbar*(c - muC*pH) + hIbar/hbar*(i - muI*( pH - pI)) + hGbar/hbar*g+ hIGbar/hbar*iG) + xbar/ybar*x;


%(25) Resource Constraint Nominal 
pY + y        =   cbar/(pYbar*ybar)*( c ) + pIbar*ibar/(pYbar*ybar)*(  pI + i) + pIbar*kbar/(gzbar*pYbar*ybar)*gammau1*u
                          + pGbar*gbar/(pYbar*ybar)*(  pH + g) + pIGbar*iGbar/(pYbar*ybar)*(  pH + iG) + pXbar*xbar/(pYbar*ybar)*(  pX + x)
                          - pIMbar*imCbar/(pYbar*ybar)*(  pIM + imC )
                          - pIMbar*imIbar/(pYbar*ybar)*(  pIM + imI );

%(26) Net foreign assets --> convert bstar to net foreign debt

- (1/Rstarbar)*bstar + (1/(gzbar*PiYstarbar))*bstar(-1) =
                          + pXbar*xbar/(sbar*pYbar)*(  pX + x - s - pY - ztilde)
                          - pIMbar*imbar/(sbar*pYbar)*(  pIM + im - s - pY - ztilde);

%1/Rstarbar*bstar = bstar(-1)/(gzbar*PiYstarbar)
%                          + pXbar*xbar/(sbar*pYbar)*(  pX + x - s - pY - ztilde)
%                          - pIMbar*imbar/(sbar*pYbar)*(  pIM + im - s - pY - ztilde);

%(27) Relative price: Consumption %% ? PPI
pH            =   pH(-1) + piH - piC;

%(28) Relative price: Export
pX            =   pX(-1)+ piX - piC;

%(29) Relative price: Domestic output (GDP deflator)
pY            =   pY(-1) + piY  - piC;

%(30) Relative price: Investment
pI            =   pI(-1) + piI - piC;

%(31) Relative price: Import
pIM           =   pIM(-1) + piIM - piC;

%(32) Government / fiscal budget constraint %% should r and rrp not be r(-1) and rrp(-1)?
pGbar*gbar/(pYbar*ybar)*(pH + g - pY - y) = cbar/(pYbar*ybar)*(tauC + tauCbar*(c - pY - y)) 
                                            + wbar*Nbar/(pYbar*ybar)*(tauN + tauNbar*(w + N - pY - y))
                                            - pIGbar*iGbar/(pYbar*ybar)*(pH + iG - pY - y)
                                            + rKbar*kbar/(gzbar*(pYbar*ybar))*(tauK + tauKbar*(u + rK + k(-1) - gz - pY - y))
                                            - pIbar*kbar/(gzbar*(pYbar*ybar))*(delta*tauK + tauKbar*gammau1*u + tauKbar*delta*(pI + k(-1) - gz - pY - y))
                                            %% + bbar/(Rgovbar*(pYbar*ybar))*(b - r - pY - y)  
                                            + bbar/(Rgovbar*(pYbar*ybar))*(b - rrp - pY - y)
                                            - bbar/(Pibar*gzbar*(pYbar*ybar))*(b(-1) - piC - gz - pY - y)
                                            - trbar/(pYbar*ybar)*(tr - pY - y);

%(32b) Fiscal Sustainability // pbud = primary balance // pbudsus = sustainable primary balance // susgap = sustainability gap

%(log(Rbar) - (log(gzbar) + log(Pibar)))*(pbudsus - y) = Rbar*(rrp - (dy + piY) + b(-1) - y(-1));
%(Rbar - (gzbar*Pibar))*(pbudsus - y) = Rbar*(rrp - (dy + piY) + b(-1) - y(-1));
%(gzbar*Pibar)*(b - y) + (Rbar - (gzbar*Pibar))*(pbudsus - y) = Rbar*(rrp - (dy + piY) + b(-1) - y(-1));
% susgap = pbudsus - pbud;

(pbudsus - y) = (rrp - (dy + piY) + b(-1) - y(-1)); %% primary bvalance required to prevent debt (de)accumulation at each point in time (i.e., for a given initial debt to gdp level)
susgap = pbud - pbudsus;
susgapgdp = (pbud - pbudsus) - y;

pbud = cbar/(pYbar*ybar)*(tauC + tauCbar*(c - pY - y)) 
                                            + wbar*Nbar/(pYbar*ybar)*(tauN + tauNbar*(w + N - pY - y))
                                            + rKbar*kbar/(gzbar*(pYbar*ybar))*(tauK + tauKbar*(u + rK + k(-1) - gz - pY - y))
                                            - pGbar*gbar/(pYbar*ybar)*(pH + g - pY - y)
                                            - pIGbar*iGbar/(pYbar*ybar)*(pH + iG - pY - y)
                                            - pIbar*kbar/(gzbar*(pYbar*ybar))*(delta*tauK + tauKbar*gammau1*u + tauKbar*delta*(pI + k(-1) - gz - pY - y))
                                            - trbar/(pYbar*ybar)*(tr - pY - y);

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
0        =(1+tauCbar)*cJbar*(tauCbar/(1+tauCbar)*tauC+cJ)
                         -(1-tauNbar)*wbar*Nbar*(w+N-(1/(1-tauNbar))*(tauN))-trJbar*trJ;

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

%(47) Wage markup shock
varphiW       =   rhovarphiW*varphiW(-1) + etavarphiW;

%(48) Domestic markup shock
varphiH       =   rhovarphiH*varphiH(-1) + etavarphiH;

%(49) Export markup shock
varphiX       =   rhovarphiX*varphiX(-1) + etavarphiX;

%(50) Import markup shock
varphistar    =   rhovarphistar*varphistar(-1) + etavarphistar;

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

%(57) Foreign prices
//piYstar      =       rhopiYstarpiYstar*piYstar(+1) + rhopiYstarYstar*ystar + epsilonpiYstar; 
piYstar        =       (chistar/(1 + chistar*betastar))*piYstar(-1) + (betastar/(1 + chistar*betastar))*piYstar(+1) 
               + ((1 - thetastar)*(1 - thetastar*betastar))/(thetastar*(1 + chistar*betastar))*((sigmastar + sigmastarn)*ystar - (1 + sigmastarn)*epsilonYstar); // mcstar subst out
%piYstar       =       betastar*piYstar(+1) + ((1-thetastar)*(1-thetastar*betastar))/(thetastar*(1 + betastar*chistar))*(mcstar); // + xi_p_star foreign Phillips Curve 
%mcstar        = (sigmastar + sigmastarn)*ystar - (1 + sigmastarn)*epsilonYstar;     // real marginal cost foreign economy 

%(58) Foreign output
//ystar         =           ystar(+1) - (1/sigmastar)*(rstar - piYstar(+1)) + epsilonYstar; 
ystar        =           (1/(1 + kappastar))*ystar(+1) + (kappastar/(1 + kappastar))*(ystar(-1)) 
                       - ((1 - kappastar)/(sigmastar*(1 + kappastar)))*(rstar - piYstar(+1) + epsilonRPstar);  //   foreign IS curve // ystar = cstar

%(59) Foreign interest rate
%rstar         =         rhorstar*rstar(-1) + (1 - rhorstar)*(kappapistar*piYstar + kappaystar*ystar) + etaRstar;
rstar        =         rhorstar*rstar(-1) + (1 - rhorstar)*(kappapistar*piYstar + kappaystar*(ystar - ystar(-1))) + epsilonrstar;  // Foreign Policy Rule

%(60) Foreign output shock
epsilonYstar   =         rhoYstar*epsilonYstar(-1) + etaYstar;

%(61) Foreign price shock
epsilonpiYstar =         rhopiYstar*epsilonpiYstar(-1) + etaPiYstar;

%(61b) Foreign price shock
epsilonrstar = rhoepsrstar*epsilonrstar(-1) + etaRstar;  // 


%-------------------------------------------------------------------------------------------------
%%%%%%%%% Miscellaneous %%%%%%%%%
%-------------------------------------------------------------------------------------------------

%(62) Employment equation
// E    =   betta/(1+betta)*E(+1) + 1/(1+betta)*E(-1) + (1-betta*xiE)*(1-xiE)/((1+betta)*xiE)*(N - E);
N + epsilonN  =  E + (xiE/((1 - betta*xiE)*(1 - xiE)))*((E - E(-1)) + betta*(E - E(+1)));    // (re-written ito N. Easier to see xiE=0 gives N=E)

%(63) Wage inflation
piW = w - w(-1);

%-------------------------------------------------------------------------------------------------
%%%%%%%%% Measurement equations %%%%%%%%%
%-------------------------------------------------------------------------------------------------

%(64) Output
dy_/100             =  y - y(-1) + gz + log(gzbar); // + me_y; // gzbar=1.0066552

%(65) Consumption
dc_/100             =   c - c(-1) + gz + log(gzbar+0.0014) + me_c;  // 0.00807162888


%(66) Government consumption
dg_/100             =   g - g(-1) + gz + log(gzbar-0.0006); // + me_g; // 0.00602793531

%(66) Government debt
db_/100             =   b - b(-1) + gz + log(gzbar+0.00529246) ; // + me_b  Actual is different: 1.194766034 % CHECK all.  0.01194766034

gdebtgdp_/100     = b - y + (41.131)/100 + me_b; //  use + (41.131)/100 for gdebtgdp_

%(67) Exports
dx_/100             =   x - x(-1) + gz + log(gzbar+0.0002); // + me_x;   // 0.00689387549
%%% dx_             =  - mustar*(  pX - pY - s ) + ystar - ystar(-1) + gz + log(gzbar+0.0002)*100; // + me_x;
 
%(68) Imports
dim_/100            =   im - im(-1) + gz + log(gzbar+0.0051); // + me_im;  // 0.01178454874

%(69) Employment
dE_/100             =   E - E(-1) + log(1.001519) + me_E;   // 0.00151911820

%(70) Real wages
dw_/100             =   w - w(-1) + gz + log(1.0049153) + me_w;  // 0.00491532762

%(71) Nominal interest rate
R_/100              =   r + log(Rbar);  // 0.023591164289214  // 0.02416772929

%(72) Private investment
di_/100             =   i - i(-1) + gz + log(1.0109017) + me_i; // 0.01090168655

%(73) Government investment
diG_/100            =   iG - iG(-1) + gz + log(1.01048); // + me_ig;   // 0.01048005548

%(74) Transfers
dtr_/100            =   tr - tr(-1) + gz + log(1.016321); // + me_tr;   // 0.01632059796

%(75) Import inflation
pi_im_/100          =   piIM + log(Pibar) + me_pi_im; %% error: was piI should be pi_IM %% PiIMbar?

%(75) Export inflation
pi_x_/100          =   piX + log(Pibar) + me_pi_x; %% included since params estimated

%(76) Consumption deflator
pi_c_/100           =   piC + log(Pibar); // %% PiCbar? or assumed all inflation at same level in data?

%(77) Inflation target
pi_cbar_/100        =   piCbar + log(Pibar); 

%(78) GDP deflator / PPI (domestic phillips curve) %% pi_h_ = PPI ; pi_y_ = GDP deflator piY ...
%pi_y_/100           =   piY + log(Pibar); // + me_pi_y;  
pi_h_/100           =   piH + log(Pibar); // + me_pi_h;  

%(79)
dtauC_/100          =   tauC - tauC(-1) + log(1.00011); // + me_tauC;    //  0.00010959479

%(80)
dtauN_/100          =   tauN - tauN(-1) + log(1.0004231); // + me_tauN;    // 0.00042309761

%(81)
dtauK_/100          =   tauK - tauK(-1) + log(1.0008117); // + me_tauK;    // 0.00081166700

%(82) Foreign output
dy_star_/100        =    ystar - ystar(-1) + log(1.00708) + me_Ystar; // % + me_ystar; // + ztilde - ztilde(-1)  + gz

%(83) Foreign interest rate
R_star_/100        =    rstar + log(Rstarbar) + me_Rstar;

%(84) Foreign inflation
pi_Ystar_/100       =   piYstar + log(piYstarbar) + me_piYstar;

%(85) Real (Error: previously Nominal) exchange rate
dsr_/100 =   s - s(-1) + log(1.00238565); // + me_s; // + piY - piYstar + 100*log(Pibar) - 100*log(piYstarbar)  // 0.00238564599

%-------------------------------------------------------------------------------------------------
%%%%%%%%% Identities %%%%%%%%%
%-------------------------------------------------------------------------------------------------

%(87)
dy = y - y(-1);

%(88)
%d4y = dy + dy(-1) + dy(-2) + dy(-3);

%(89)
%d4y_obs = dy_ + dy_(-1) + dy_(-2) +dy_(-3);

%(90)
%R4      =   4*Rbar*r;

%(91)
%piC4    =   4*Pibar*piC;

%(92)
%piH4    =   4*Pibar*piH;

%(93)
%piC_4    =   piC + piC(-1) + piC(-2) + piC(-3);

%(94)
%piH_4    =   piH + piH(-1) + piH(-2) + piH(-3);

%(95)
rrp = r + epsilonRPG + gammaB*(b - y);

%(96)
rrpstar = rstar + epsilonRPstar + gammaBstar*lamRPstar*sbar/ybar*(bstar - y);

by = b - y;

% observed shocks

etaYstar	=	etaobsYstar	;
0	=	etaobsPiYstar	;  // etaPiYstar
etaRstar	=	etaobsRstar	;
etag	=	etaobsg	;
etaiG	=	etaobsiG	;
etatr	=	etaobstr	;
etaR	=	etaobsR	;
etaRPG	=	etaobsRPG	;
etaRPstar	=	etaobsRPstar	;
etagz	=	etaobsgz	;
etaepsilon	=	etaobsepsilon	;
etaN	=	etaobsN	;
etaC	=	etaobsC	;
etaI	=	etaobsI	;
etavarphiH	=	etaobsvarphiH	;
etavarphiX	=	etaobsvarphiX	;
etavarphistar	=	etaobsvarphistar	;
etavarphiW	=	etaobsvarphiW	;
etatauC	=	etaobstauC	;
etatauN	=	etaobstauN	;
etatauK	=	etaobstauK	;
etapiCbar	=	etaobspiCbar	;
me_E	=	meobs_E	;
me_w	=	meobs_w	;
me_pi_im	=	meobs_pi_im	;
me_pi_x	=	meobs_pi_x	;
me_b	=	meobs_b	;

%===================================================================================================
end; 
%===================================================================================================

%===================================================================================================
% Compute the steady state
%===================================================================================================


%steady;
SAFiscal_steadystate_count_3([],[],1); %print steady state and parameters
%resid(1);
steady;

check;

%==========================================================================
shocks;
%==========================================================================
% Explain 15% of variation

//var me_y;       stderr	sqrt((0.3565113557/100)/(100/15))         ;	
var me_c;       stderr	sqrt((0.4928579668/100)/(100/10))         ;
var me_w;       stderr	sqrt((2.6396945775/100)/(100/10))         ;	
var me_E;       stderr	sqrt((0.4677243071/100)/(100/10))         ;
var me_i;       stderr	sqrt((6.1015204344/100)/(100/10))         ;
//var me_x;       stderr	sqrt((25.3794811631/100)/(100/15))         ;
//var me_im;      stderr	sqrt((13.9154776656/100)/(100/15))         ;
var me_pi_im;    stderr	sqrt((1.3913173421/100)/(100/10))         ;
var me_pi_x;    stderr	sqrt((1.3913173421/100)/(100/10))         ;  // CHECK
//var me_pi_h;    stderr	sqrt((1.5888635216/100)/(100/15))         ;
var me_b;       stderr	sqrt((5.563550628/100)/(100/5))         ;
//var me_g;       stderr	sqrt((0.8064222755/100)/(100/15))         ;
//var me_ig;      stderr	sqrt((18.4004932754/100)/(100/15))         ;
//var me_tr;      stderr	sqrt((65.5705740993/100)/(100/15))         ;
//var me_tauN;    stderr	sqrt((1.1589729086/100)/(100/15))         ;
//var me_tauK;    stderr	sqrt((5.3070449191/100)/(100/15))         ;	
//var me_tauC;    stderr	sqrt((1.5280035865/100)/(100/15))         ;
////var me_s;       stderr	sqrt((4.862528236/100)/(100/15))         ;	

var me_piYstar;   stderr (0.002687438/(100/10)); // measurement error for foreign inflation
var me_Ystar;     stderr (0.004832584/(100/10)); // measurement error for foreign output
var me_Rstar;     stderr (0.005117566/(100/10)); // measurement error for foreign rate

var	etaYstar;	stderr	0.005923996	;
				
var	etaRstar;	stderr	0.001271066	;
var	etag;	stderr	0.00619333	;
var	etaiG;	stderr	0.039485063	;
var	etatr;	stderr	0.083414022	;
var	etaR;	stderr	0.002191473	;
var	etaRPG;	stderr	0.003846913	;
var	etaRPstar;	stderr	0.001767061	;
var	etagz;	stderr	0.003013929	;
var	etaepsilon;	stderr	0.005565292	;
var	etaN;	stderr	0.005887254	;
var	etaC;	stderr	0.034214136	;
var	etaI;	stderr	0.004235552	;
var	etavarphiH;	stderr	0.003736476	;
var	etavarphiX;	stderr	0.003483422	;
var	etavarphistar;	stderr	0.006428746	;
var	etavarphiW;	stderr	0.002959809	;
var	etatauC;	stderr	0.011506069	;
var	etatauN;	stderr	0.010207681	;
var	etatauK;	stderr	0.021075837	;
var	etapiCbar;	stderr	0.003770639	;


%---------------------------------------------------------------------------------------------------
end;
%---------------------------------------------------------------------------------------------------

%===================================================================================================
% Estimate parameters
%===================================================================================================
%--------------------------------------------------------------------------
estimated_params;
%--------------------------------------------------------------------------

% Structural shocks 20

stderr	etaYstar	,	inv_gamma_pdf	,	0.005987742	,	0.00044868	;
%% stderr	etaPiYstar	,	inv_gamma_pdf	,	0	,	0	;						
stderr	etaRstar	,	inv_gamma_pdf	,	0.001271361	,	0.0000712	;
stderr	etag	,	inv_gamma_pdf	,	0.00622733	,	0.000590092	;
stderr	etaiG	,	inv_gamma_pdf	,	0.039399131	,	0.002814988	;
stderr	etatr	,	inv_gamma_pdf	,	0.08364913	,	0.006497063	;
stderr	etaR	,	inv_gamma_pdf	,	0.002221042	,	0.000172309	;
stderr	etaRPG	,	inv_gamma_pdf	,	0.003706435	,	0.000936403	;
stderr	etaRPstar	,	inv_gamma_pdf	,	0.001744312	,	0.000227622	;
stderr	etagz	,	inv_gamma_pdf	,	0.00303709	,	0.000589031	;
stderr	etaepsilon	,	inv_gamma_pdf	,	0.005636394	,	0.002213838	;
stderr	etaN	,	inv_gamma_pdf	,	0.006087941	,	0.003115995	;
stderr	etaC	,	inv_gamma_pdf	,	0.042043764	,	0.01531813	;
stderr	etaI	,	inv_gamma_pdf	,	0.004226592	,	0.001213194	;
stderr	etavarphiH	,	inv_gamma_pdf	,	0.003727777	,	0.000761207	;
stderr	etavarphiX	,	inv_gamma_pdf	,	0.003549978	,	0.00090525	;
stderr	etavarphistar	,	inv_gamma_pdf	,	0.00642374	,	0.001286733	;
stderr	etavarphiW	,	inv_gamma_pdf	,	0.003107253	,	0.000736959	;
stderr	etatauC	,	inv_gamma_pdf	,	0.011461132	,	0.000943313	;
stderr	etatauN	,	inv_gamma_pdf	,	0.010334144	,	0.000876405	;
stderr	etatauK	,	inv_gamma_pdf	,	0.02077295	,	0.001699496	;
stderr	etapiCbar	,	inv_gamma_pdf	,	0.00376964	,	0.000268993	;
stderr	me_E	,	inv_gamma_pdf	,	0.001	,	inf	;
stderr	me_w	,	inv_gamma_pdf	,	0.001	,	inf	;
stderr	me_pi_im	,	inv_gamma_pdf	,	0.001	,	inf	;
stderr	me_pi_x	,	inv_gamma_pdf	,	0.001	,	inf	;
stderr	me_b	,	inv_gamma_pdf	,	0.001	,	inf	;

%corr etatauN, etatauK,  beta_pdf, 0, 0.3,-1,1;

end;

// estimated_params_init(use_calibration);
// end;

%--------------------------------------------------------------------------
varobs 
%--------------------------------------------------------------------------

etaobsYstar		etaobsRstar	etaobsg	etaobsiG	etaobstr	etaobsR	      // etaobsPiYstar
etaobsRPG	etaobsRPstar	etaobsgz	etaobsepsilon	etaobsN	etaobsC	etaobsI	
etaobsvarphiH	etaobsvarphiX	etaobsvarphistar	etaobsvarphiW	etaobstauC	
etaobstauN	etaobstauK	etaobspiCbar 
meobs_E	meobs_w	meobs_pi_im	meobs_pi_x meobs_b
;     

%--------------------------------------------------------------------------
options_.plot_priors=0; // mode_file=SAFiscal_mh_mode, load_mh_file, 
// estimation(order=1, datafile=data_18q4_V2, mode_file=SAFiscal_mh_mode, mh_replic=300000, mh_drop=0.1, mh_jscale=0.23, mh_nblocks=2, mode_compute=4, graph_format=fig);   
// paste in model command line to check collinearity issues: model_diagnostics(M_,options_,oo_) 
// options_.debug=1; % print_info.m % mode_check, 
%--------------------------------------------------------------------------

estimation(datafile=data_18q4_V2_shocks3,  load_mh_file, // mh_nblocks=2, mh_replic=150000, mh_drop=0.5, mh_jscale=0.1, //
           mode_compute=0, mode_file=SAFiscal_test_2_count_mode, // mode_check,                      // mode_file=Copy_2_of_SAFiscal_mode, (latest), Copy_9_of_SAFiscal_mode
           moments_varendo, conditional_variance_decomposition=[1:20], // bayesian_irf, irf=20, 
           graph_format=fig, nodisplay) b y r g iG tr gdebtgdp_ db_ dy_ R_ dg_ diG_ dtr_ rrp rrpstar c cI cJ i x im piY piC piIM N piW s susgapgdp by pbud pbudsus susgap; //  

// Shock Decomposition option 

shock_groups(name=groups);
'Technology and Labour' = etaepsilon, etagz, etaN;   //   
'Markup' = etavarphiW, etavarphiH, etavarphiX, etavarphistar;
'Demand' = etaRPG, etaI, etaC;    
'G. Spending' = etag, etaiG, etatr;   
'G. Revenue' = etatauC, etatauN, etatauK; 
'Monetary Policy' = etaR, etapiCbar;  
'Foreign' = etaYstar, etaRstar, etaRPstar;  // etaPiYstar, 
end;

//// Shock Decomposition option
% shock_decomposition(colormap=jet) bstar susgap;    // rr_obs
% plot_shock_decomposition(graph_format=(fig), use_shock_groups=groups, colormap=jet, steadystate) b y r g by susgapgdp;

// //see HLbEstIdentification.mod for identification example
// //identification(parameter set = prior mode);
// identification(advanced=1, max_dim_cova_group=2);

%%write_latex_original_model
%write_latex_static_model ;
%write_latex_dynamic_model ;

// dynare SAFiscal_test_3_countOSRestby.mod
