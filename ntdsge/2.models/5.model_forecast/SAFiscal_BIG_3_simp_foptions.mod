%Small open economy model for SA with extended fiscal sector
%Dynare Version 4.5.0 used for calculations
%June, 2022

%% obs data for govt debt: gdebtgdp
%% based on SAFiscal_test_3.
%% CHECK: foreign/external rate missing? NOTE: RECENTLY UPDATED TO INCLUDE rrpstar in NFA equation in "...test_5.mod" -> unclear on best way forward.
%% CHECK equation (33) --> why Ricardian + government only?
%% CHECK Eqn (35) --> deltaG vs. Delta and look to seperate ``efficiency shock'' for government vs private inverstment or just scale (EPWP / Public investment targetted towards efficiency --> ie low base and low hanging fruit eg el;ectricity)

%% This file simplifies the transfers distrubtion and updates steady state values for government block (notably, tr2rot = 1 and sBbar = 2.0)

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
trJwelf
trJgap
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

gyratio
iGyratio
tryratio
tauCyratio
tauNyratio
tauKyratio

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
  omega	=	0.0593	;

 kappa	=	0.9307	;
 sigmaL	=	3.1608	;
			
			
 muC	=	1.4776	;

 mustar	=	0.5488	;
 thetaH	=	0.7393	;
 chiH	=	0.5237	;
 thetaX	=	0.7468	;
 chiX	=	0.6783	;
 thetaM	=	0.799	;
 chiM	=	0.6882	;
 thetaW	=	0.4474	;
 chiW	=	0.5259	;
 gammaB	=	0.0415	;
 phiR	=	0.8541	;
 phiPi	=	1.4916	;
 phiDY	=	0.3878	;
				
 thetatrY	=	0	; // orig: 0.2102 // perm: 0
 thetaGY	=	0.1146	;
 thetaiGY	=	0.1959 ; // orig: 0.1959 // opt all shocks: 132.101 w/ thetaCB=7.09351 // opt transfer shock only: 0.262975 w/ thetatauCB = 7.85963 
 thetatauCY	=	0.1722	;
 thetatauNY	=	0.2063	; // orig: 0.2063 // set to 0 for iG stiumulus so no PIT crowding out of cI & cJ
 thetatauKY	=	0.5441	;
 thetaGB	=	0.1622	; // orig: 0.1622 //
 thetaiGB	=	0.5964	; // orig: 0.5964 // set = -1 and -10 for iG stimulus
 thetatrB	=	0	; // orig: 0.3788 // perm: 0
 thetatauNB	=	0.6474	; // orig: 0.6474  // opt: 2.44725 w/ auto stab // 6.94555 single // 3.19806 w/ thetatauCB
 thetatauKB	=	0.1814	; // orig: 0.1814 // opt: 19.097 NOTE - only one instrument; rho is negative. see excel file
 thetatauCB	=	7.07097	; //  orig: 0.1031 // opt: 5.35259 w/ auto stab // opt: 7.07097 single // opt all: 7.09351 w/ thetaiGB // opt: 3.81995 w/ thetatauNB

 rhoepsG	=	0.8298	;
 rhoepsiG	=	0.7539	;
 rhoepstr	=	0.9999	; // orig: 0.4867 // perm: 0.00 // 0.9999
 rhoepstauC	=	0.3752	;
 rhoepstauN	=	0.8064	;
 rhoepstauK	=	0.3816	;
 xiE	=	0.5808	;
 rhoRPG	=	0.6459	;
 rhoRPstar	=	0.865	;
 rhogz	=	0.6792	;
 rhoepsilon	=	0.7549	;
 rhoN	=	0.7447	;
 rhoC	=	0.7601	;
 rhoI	=	0.6943	;
 rhovarphiW	=	0.5816	;
 rhovarphiH	=	0.5472	;
 rhovarphiX	=	0.9026	;
 rhovarphistar	=	0.526	;

 rhog	=	0.7915	;
 rhoiG	=	0.7833	;
 rhotr	=	0	; // original: 0.5112 // perm: 0 // 0.9999 see rhoepstr
 rhotauC	=	0.3228	; // original: 0.3228 // opt: 0.233321
 rhotauN	=	0.3347	; // original: 0.3347 // opt: 0.728861
 rhotauK	=	0.3837	; // original: 0.3837 // opt: -0.699124 when thetatauKB is jointly determined 5.08292

 rhoYstar	=	0.9776	;
 rhoepsrstar	=	0.5552	;


%%%%% calibrated params

betta	=	0.9947	;

gammaBstar	=	0.05	;

nuG	=	1;
nuK	=	1; // 0.1 or 0.01 for complementarities --> very small effects for iG... nuG is larger
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
sigmastar	=	1; // 1.4817	;
sigmastarn	=	1.5	;
rhorstar	=	0.8	;
rhopiYstar	=	0	;

piYstarbar	=	1.005	;
kappapistar	=	1.5	;
kappaystar	=	0.125	;
			
alfa	=	0.3	;
Pibar	=	1.01125	;
pIMbar	=	1	;
pCbar	=	1	;
gzbar	=	1.00642386754; // 1.0066552	;
sbar	=	1	;
varphiWbar	=	1.05	;
varphiHbar	=	1.1	;

tauNrevYbar_target  =   0.0801; // 0.0827; % 2019 update 0.080121057 // 0.0827 %% 2018 orig 0.0900 %% model calibrate Harri 0.1337
tauCrevYbar_target  =   0.0578; // 0.07545; % 2019 update 0.057841773 // 0.07545 %% 2018 orig 0.0874 %% model calibrate Harri 0.1039
tauKrevYbar_target  =   0.0523; // 0.0531; % 2019 update 0.052319044 // 0.0531 %% 2018 orig 0.0587 %% model calibrate Harri 0.0371
given_alphaG        =   1;
given_alphaK        =   1;
alphaG_target       =   0.75;
alphaK_target       =   0.9;
cJcISSratio         =   0.8;
tr2rot              =   1;   % Set tr2rot = 1 // originally calibrated to DSGE paper est 0.46 
sIMC                =   0.224;    
sIMI                =   0.06;
sI                  =   0.126;
sG                  =   0.1829; // 0.195;  % 2019 update 0.1829 %% 2018 orig 0.1996 %% model calibrate Harri 0.195 (DOES NOT SOLVE SS w/ > 0.20)
sIG                 =   0.0560; // 0.0741; % 2019 update 0.05596 %% 2018 orig 0.0635 %% model calibrate Harri 0.057
sTR                 =   0.05; // 0.0565; % 2019 update 0.04661 %% 2018 orig 0.0464 %% model calibrate Harri 0.042
sBbar               =   2;    % set 50% gdebt/Y ratio -> 2 per quarter = 0.5 per annum (stock v flow) // original = 2.0 ? Not clear that this is G.Debt/Y --> implied steady states based on aBbar are reasonable

GovRSpread      =   0;
CorpGovSpread   =   0;      

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

%(5) UIP // bstar converted to net foreign *debt* for comparability 
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
                        - (nuK - 1)/nuK*( ((1-alphaK)/alphaK )^(1/nuK)*(kGbar/kbar)^((nuK - 1)/nuK ) )/
                        ( 1+((1-alphaK)/alphaK )^(1/nuK)*(kGbar/kbar)^( (nuK-1)/nuK ) )*( kG(-1) - kS );


%(12) Marginal cost
mc            =   - epsilon  +   alfa*rK   +   (1-alfa)*w   +   alfa*(kS - ktilde)
                    +  alfa   *   (nuK - 1)/nuK     *    (   ((1-alphaK)/alphaK)^(1/nuK)    *     (kGbar/kbar)^((nuK-1)/nuK )      )   /
                        (     1  +   ((1-alphaK)/alphaK )^(1/nuK)    *     (kGbar/kbar)^((nuK-1)/nuK )      )     *      ( kG(-1) - kS );
                
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

%(24) Resource constraint (real) %%% why both real and nominal? This may cause issues with inclusion of flex price equilibrium.
y             =   hbar/ybar*(hCbar/hbar*(c - muC*pH) + hIbar/hbar*(i - muI*( pH - pI)) + hGbar/hbar*g + hIGbar/hbar*iG) + xbar/ybar*x;


%(25) Resource Constraint Nominal 
pY + y        =   cbar/(pYbar*ybar)*( c ) + pIbar*ibar/(pYbar*ybar)*(  pI + i) + pIbar*kbar/(gzbar*pYbar*ybar)*gammau1*u
                          + pGbar*gbar/(pYbar*ybar)*(  pH + g) + pIGbar*iGbar/(pYbar*ybar)*(  pH + iG) + pXbar*xbar/(pYbar*ybar)*(  pX + x)
                          - pIMbar*imCbar/(pYbar*ybar)*(  pIM + imC )
                          - pIMbar*imIbar/(pYbar*ybar)*(  pIM + imI );

%(26) Net foreign assets --> convert bstar to net foreign debt.  CHECK: foreign/external rate missing? NOTE: RECENTLY UPDATED TO INCLUDE rrpstar in NFA equation in "...test_5.mod" ... see example below

% - (1/Rstarbar)*(bstar - rrpstar) + (1/(gzbar*PiYstarbar))*bstar(-1) =
%                          + pXbar*xbar/(sbar*pYbar)*(  pX + x - s - pY - ztilde)
%                          - pIMbar*imbar/(sbar*pYbar)*(  pIM + im - s - pY - ztilde);

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

%(32) Government / fiscal budget constraint %% CHECK formulation and should r and rrp not be r(-1) and rrp(-1)? This specification is discounting current b... see WP comments
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
                          + (1-alphaG)^(1/nuG)*(gbar/cItildebar)^((nuG-1)/nuG)*g; // CHECK equation (33) --> why Ricardian + government only?

%(34) Composite capital
ktilde        =   alphaK^(1/nuK)*(kbar/ktildebar)^((nuK-1)/nuK)*kS
                          + (1-alphaK)^(1/nuK)*(kGbar/ktildebar)^((nuK-1)/nuK)*kG(-1);

%(35) Public capital accumulation
kG            =   (1-deltaG)/gzbar*kG(-1) - (1-deltaG)/gzbar*gz
                          + (1-(1-deltaG)/gzbar)*iG
                          + (1-(1-deltaG)/gzbar)*(gammaI*gzbar^2*(1+betta))*epsilonI;  // CHECK Eqn (35) deltaG vs. Delta and look to seperate ``efficiency shock'' for government vs private or just scale

%(36) Total consumption (Ricardian + non-Ricardian)
c            =   (1-omega)*cIbar/cbar*cI + omega*cJbar/cbar*cJ;

%(37) Total transfers
% tr           =  (1-omega)*trIbar/trbar*trI + omega*trJbar/trbar*trJ; %% if tr2rot = 1 then trJ = tr --> better simplifying assumption
 tr           =  trJ;

%(38) Transfer distribution rule
tr2rot*trI   = (1-tr2rot)*trJ;          %% set tr2rot = 1 (trI = 0)

%(39) Non-Ricardian consumption
% 0            = (1+tauCbar)*cJbar*(tauCbar/(1+tauCbar)*tauC + cJ)
%             - (1-tauNbar)*wbar*Nbar*(w + N - (1/(1-tauNbar))*(tauN)) - trJbar*trJ;

0            = (1+tauCbar)*cJbar*(tauCbar/(1+tauCbar)*tauC + cJ)
             - (1-tauNbar)*wbar*Nbar*(w + N - (1/(1-tauNbar))*(tauN)) - trJ;

%% consider a government neutral optimal transfer as a minimum requirement for welfare - ie, stabilize the difference between before and after tax budegt constraint with transfers.

trJwelf      = cJbar*(tauCbar*tauC) + wbar*Nbar*(tauN);

trJgap       = trJ - trJwelf;

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
//epsilonI      =   rhoI*iG(-1) + etaI;

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

%(61b) Foreign monetary shock
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
dc_/100             =   c - c(-1) + gz + log(1.0078755167) + me_c;  //


%(66) Government consumption
dg_/100             =   g - g(-1) + gz + log(1.005512837); // + me_g; // 

%(66) Government debt
db_/100             =   b - b(-1) + gz + log(1.01224346) ; // + me_b; // 

gdebtgdp_/100     = b - y + (70.00)/100 + me_b;   //36.607        //  use + (41.131)/100 for gdebtgdp_

%(67) Exports
dx_/100             =   x - x(-1) + gz + log(1.005844978); // + me_x;   //
%%% dx_             =  - mustar*(  pX - pY - s ) + ystar - ystar(-1) + gz + log(gzbar+0.0002)*100; // + me_x;
 
%(68) Imports
dim_/100            =   im - im(-1) + gz + log(1.0110935565); // + me_im;  //

%(69) Employment
dE_/100             =   E - E(-1) + log(1.001702712) + me_E;   // 

%(70) Real wages
dw_/100             =   w - w(-1) + gz + log(1.00486) + me_w;  // 

%(71) Nominal interest rate
R_/100              =   r + log(Rbar);  // lRbar = //  Rbar = 1.0233536470151

%(72) Private investment
di_/100             =   i - i(-1) + gz + log(1.0098607) + me_i; // 1.00986066522794

%(73) Government investment
diG_/100            =   iG - iG(-1) + gz + log(1.00504773); // + me_ig;   // 1.00504773016376

%(74) Transfers
dtr_/100            =   tr - tr(-1) + gz + log(1.0121173); // + me_tr;   // 1.01211727421926

%(75) Import inflation
pi_im_/100          =   piIM + log(Pibar) + me_pi_im; // 1.01664807742594 %% error: was piI should be pi_IM %% PiIMbar?

%(75) Export inflation
pi_x_/100          =   piX + log(Pibar) + me_pi_x; // 1.01989208862472 %% included since params estimated

%(76) Consumption deflator
pi_c_/100           =   piC + log(Pibar); // 1.01453979809084 %% PiCbar? or assumed all inflation at same level in data?

%(77) Inflation target
pi_cbar_/100        =   piCbar + log(Pibar);  // 1.01125;  //  1.01125^4 ~ 4.5% inflation target (annualized)

%(78) GDP deflator / PPI (domestic phillips curve) %% pi_h_ = PPI ; pi_y_ = GDP deflator piY ...
%pi_y_/100           =   piY + log(Pibar); // + me_pi_y;  
pi_h_/100           =   piH + log(Pibar); // + me_pi_h;  //1.01516945880298

%(79)
dtauC_/100          =   tauC - tauC(-1) + log(1.000115); // + me_tauC;    //  1.0001150005893

%(80)
dtauN_/100          =   tauN - tauN(-1) + log(1.001309); // + me_tauN;    // 1.00130884826214

%(81)
dtauK_/100          =   tauK - tauK(-1) + log(1.00067); // + me_tauK;    // 1.00066991579267

%(82) Foreign output
dy_star_/100        =    ystar - ystar(-1) + log(1.00618) + me_Ystar; // 1.0061803498335 % + me_ystar; // + ztilde - ztilde(-1)  + gz

%(83) Foreign interest rate
R_star_/100        =    rstar + log(1.00607) + me_Rstar; // 1.00607006931005 // Rstarbar only relevant for NFA eqn ... consistency for foreign economy determ by piYstarbar and betastar = betta

%(84) Foreign inflation
pi_Ystar_/100       =   piYstar + log(piYstarbar) + me_piYstar; // 1.00549513942308

%(85) Real (Error: previously Nominal) exchange rate
dsr_/100 =   s - s(-1) + log(1.0021162); // + me_s; 1.00211616603574 // + piY - piYstar + 100*log(Pibar) - 100*log(piYstarbar)  // 0.00238564599

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

gyratio = pGbar*gbar/(pYbar*ybar)*(pH + g - pY - y);

iGyratio = pIGbar*iGbar/(pYbar*ybar)*(pH + iG - pY - y);

tryratio = trbar/(pYbar*ybar)*(tr - pY - y);

tauCyratio = cbar/(pYbar*ybar)*(tauC + tauCbar*(c - pY - y));

tauNyratio = wbar*Nbar/(pYbar*ybar)*(tauN + tauNbar*(w + N - pY - y));

tauKyratio = rKbar*kbar/(gzbar*(pYbar*ybar))*(tauK + tauKbar*(u + rK + k(-1) - gz - pY - y))
           - pIbar*kbar/(gzbar*(pYbar*ybar))*(delta*tauK + tauKbar*gammau1*u + tauKbar*delta*(pI + k(-1) - gz - pY - y));

% + bbar/(Rgovbar*(pYbar*ybar))*(b - rrp - pY - y)
% - bbar/(Pibar*gzbar*(pYbar*ybar))*(b(-1) - piC - gz - pY - y)

%===================================================================================================
end; 
%===================================================================================================

%===================================================================================================
% Compute the steady state
%===================================================================================================
 
%steady;
SAFiscal_steadystate_3_simpl([],[],1); %print steady state and parameters % NOTE: "_3_simpl" is the same as "_3" but with trJwelf && trJgap = 0
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

var	etaYstar;	stderr	0.0103	;
				
var	etaRstar;	stderr	0.0016	;
var	etag;	stderr	0.0069	;
var	etaiG;	stderr	0.0376	;
var	etatr;	stderr	0.0538	;
var	etaR;	stderr	0.0031	;
var	etaRPG;	stderr	0.0053	;
var	etaRPstar;	stderr	0.002	;
var	etagz;	stderr	0.0029	;
var	etaepsilon;	stderr	0.0056	;
var	etaN;	stderr	0.0058	;
var	etaC;	stderr	0.0082	;
var	etaI;	stderr	0.0035	;
var	etavarphiH;	stderr	0.0045	;
var	etavarphiX;	stderr	0.0034	;
var	etavarphistar;	stderr	0.0064	;
var	etavarphiW;	stderr	0.003	;
var	etatauC;	stderr	0.0064	;
var	etatauN;	stderr	0.0182	;
var	etatauK;	stderr	0.016	;
var	etapiCbar;	stderr	0.0048	;


%---------------------------------------------------------------------------------------------------
end;
%---------------------------------------------------------------------------------------------------

%===================================================================================================
% Estimate parameters
%===================================================================================================
%--------------------------------------------------------------------------
estimated_params;
%--------------------------------------------------------------------------

% Structural shocks

stderr etaYstar,        inv_gamma_pdf, 0.01, inf;
//stderr etaPiYstar,      inv_gamma_pdf, 0.01, inf;
stderr etaRstar,        inv_gamma_pdf, 0.01, inf;
stderr etag,            inv_gamma_pdf, 0.01, inf;
stderr etaiG,           inv_gamma_pdf, 0.01, inf;
stderr etatr,           inv_gamma_pdf, 0.01, inf;
stderr etaR,            inv_gamma_pdf, 0.01, inf;
stderr etaRPG,          inv_gamma_pdf, 0.01, inf;
stderr etaRPstar,       inv_gamma_pdf, 0.01, inf;
stderr etagz,           inv_gamma_pdf, 0.01, inf;
stderr etaepsilon,      inv_gamma_pdf, 0.01, inf;
stderr etaN,            inv_gamma_pdf, 0.01, inf;
stderr etaC,            inv_gamma_pdf, 0.01, inf;
stderr etaI,            inv_gamma_pdf, 0.01, inf;
stderr etavarphiH,      inv_gamma_pdf, 0.01, inf;
stderr etavarphiX,      inv_gamma_pdf, 0.01, inf;
stderr etavarphistar,   inv_gamma_pdf, 0.01, inf;
stderr etavarphiW,      inv_gamma_pdf, 0.01, inf;
stderr etatauC,         inv_gamma_pdf, 0.01, inf;
stderr etatauN,         inv_gamma_pdf, 0.01, inf;
stderr etatauK,         inv_gamma_pdf, 0.01, inf;
stderr etapiCbar,       inv_gamma_pdf, 0.01, inf;

%corr etatauN, etatauK,  beta_pdf, 0, 0.3,-1,1;

end;

 estimated_params_init(use_calibration);
 end;

%--------------------------------------------------------------------------
varobs 
%--------------------------------------------------------------------------

dy_  dc_  di_  dE_  pi_c_  dw_   R_                  //   NYFED obs plus dw_ obs 5 // other for SW obs:        
pi_im_  pi_x_                               // open economy 2  
gdebtgdp_   dg_ diG_ dtr_  dtauN_ dtauK_ dtauC_    // Government   6 + 1 (debt)  db_   
 dy_star_ R_star_ pi_Ystar_               // Foreign variables 3
pi_cbar_                                    // Other: MP target  1  
;                                           // dsr_   dx_ dim_   pi_h_   // 20 max

%--------------------------------------------------------------------------
options_.plot_priors=0; // mode_file=SAFiscal_mh_mode, load_mh_file, 
// estimation(order=1, datafile=data_18q4_V2, mode_file=SAFiscal_mh_mode, mh_replic=300000, mh_drop=0.1, mh_jscale=0.23, mh_nblocks=2, mode_compute=4, graph_format=fig);   
// paste in model command line to check collinearity issues: model_diagnostics(M_,options_,oo_) 
// options_.debug=1; % print_info.m % mode_check, 
%--------------------------------------------------------------------------

%estimation(datafile=data_19q4_V2, nobs=104, load_mh_file, mh_replic=0, mh_nblocks=3, mh_drop=0.5, // mh_jscale=0.225,  // load_mh_file, mh_replic=100000,     mh_replic=200000, mh_jscale=0.2,  
%           mode_compute=0, mode_file=SAFiscal_BIG_3_simp_mh_mode, // mode_check,          //  mode_file=Copy_of_SAFiscal_BIG_3_simp_mode (latest) ,  mode_file=SAFiscal_test_3_mode ,  Copy_2_of_SAFiscal_mode, (latest), Copy_9_of_SAFiscal_mode
%           bayesian_irf, irf=20, moments_varendo, conditional_variance_decomposition=[1:20],
%           graph_format=fig) b y r g iG tr gdebtgdp_ db_ dy_ R_ dg_ diG_ dtr_ rrp rrpstar c cI cJ i N piW s susgapgdp by trJgap tauC tauN tauK; // x im piY piC piIM  pbud pbudsus susgap

// Forecast // , nodisplay
estimation(datafile=data_19q4_V2, load_mh_file, mh_replic=0, mh_drop=0.5, mh_nblocks=1, mh_jscale=0.2, // load_mh_file, mh_replic=50000, mh_jscale=0.2,
           forecast=40, mode_compute=0, // mode_file=SAFiscal_BIG_3b_simp_mh_mode, // mode_check,                      // mode_file=SAFiscal_test_3_mh_mode (latest) ,  Copy_2_of_SAFiscal_mode, (latest), Copy_9_of_SAFiscal_mode
           // bayesian_irf, irf=20, // moments_varendo, conditional_variance_decomposition=[1:20],
           graph_format=fig) s dsr_ gdebtgdp_ cJ tr b y rrp R_ dtr_ N E susgapgdp cI i piC g iG by trJgap tauC tauN tauK epsilontr gyratio iGyratio tryratio tauCyratio tauNyratio tauKyratio ; //b y r g iG tr gdebtgdp_ db_ dy_ R_ dg_ diG_ dtr_ rrp rrpstar c cI cJ i x im piY piC piIM N piW s susgapgdp by pbud pbudsus susgap; //  

% forecast b y r g iG tr db_ dy_ dg_ diG_ dtr_ rrp rrpstar gdebtgdp_;
% conditional_forecast ;

conditional_forecast_paths;

% var gdebtgdp_ ;
% periods 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20 ;
% values 56.7, 58.3, 61.4, 62.2, 63.4, 81.80, 82.16, 82.51, 82.87, 83.23, 83.60, 83.96, 84.32, 84.69, 85.06, 85.43, 85.80, 86.18, 86.55, 86.93;

%var dtr_ ;
%periods 1:20 ;
%var tr ;
%periods 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20 ;
%values 0.00, 0.25, 0.50, 0.75, 1.00, 1.25, 1.50, 1.75, 2.00, 2.25, 2.50, 2.75, 3.00, 3.25, 3.50, 3.75, 4.00, 4.25, 4.5, 4.75 ;

% var dtr_ ;
% periods 1, 2, 3:20 ;
% values	0.00, 25, 25 ;

 var dtr_ ;
 periods 1, 2, 3:20 ;
 values	6.25, 6.25, 6.25 ;

% var susgapgdp ;
% periods 1:20 ;
% values	0 ;

% var R_ ;
% periods 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15:40 ;
% values	2.290460666,	2.291439686,	2.256284325,	2.175960206,	2.047158191,	1.879969559,	1.687429292,	1.477933722,	1.249143988,	1.009601873,	0.765800094,	0.513943565,	0.271225603,	0.016502198, 0 ;

%-0.897927277, 
%-1.429809751, -1.879318002, -2.188264995, -2.444319299, -2.662157618, -2.841356438,
%-2.991923175, -3.127724125, -3.244547493, -3.348048934, -3.446893775, -3.534339001, -3.614858792, -3.694348614;


end;

conditional_forecast(parameter_set = calibration, conf_sig = 0.68, controlled_varexo = (etatr), replic = 10000); // etaR etatauN etatauC etatauN etatauK posterior_mean %% etaiG, etaC, etaN, etag, etaI, etaepsilon, etagz), , etaR

plot_conditional_forecast(periods = 40) gdebtgdp_ cJ tr b y rrp R_ dtr_ N E susgapgdp cI i piC g iG trJgap tauC tauN tauK epsilontr gyratio iGyratio tryratio tauCyratio tauNyratio tauKyratio; // b y r g iG tr db_ dy_ dg_ diG_ dtr_ rrp rrpstar gdebtgdp_ dE_ c piY piC susgapgdp by pbud pbudsus susgap;

load conditional_forecasts.mat

%%% TBD %%%

% save BIG_3_simp_foreplots_tauCBthetaiGB10efficNOTAX.mat forecasts

%%% DONE %%%

%save BIG_3_simp_foreplots_tauCBopt.mat forecasts
%save BIG_3_simp_foreplots_tauCBtauNBopt.mat forecasts

%save BIG_3_simp_foreplots_tauCBthetaiGB10.mat forecasts
%save BIG_3_simp_foreplots_tauCBthetaiGB10effic.mat forecasts
%save BIG_3_simp_foreplots_tauCBthetaiGB10efficNoPIT.mat forecasts


%%% OTHER %%%

%save BIG_3_simp_foreplots_perm.mat forecasts
%save BIG_3_simp_foreplots_permANT.mat forecasts
%save BIG_3_simp_foreplots_permZLB.mat forecasts

%save BIG_3_simp_foreplots_tauCB.mat forecasts 
%save BIG_3_simp_foreplots_tauNB.mat forecasts
%save BIG_3_simp_foreplots_tauKB.mat forecasts

% save BIG_3_simp_foreplots_tauCBthetaiGYoptall.mat forecasts
%save BIG_3_simp_foreplots_tauCBthetaiGB.mat forecasts

%save BIG_3_simp_foreplots_tauCBthetaiGB10comp.mat forecasts % baseline is 10-to-1 "tauCBthetaiGB10" stimulus w/ nuK = 0.1 % orig = 1 (cobb-douglas)
%save BIG_3_simp_foreplots_tauCBthetaiGB100comp.mat forecasts   % w/ nuK = 0.001

%save BIG_3_simp_foreplots_tauCBalladj.mat forecasts %% ie shock is instrument

%save BIG_3_simp_foreplots_tauNBcond.mat forecasts
%save BIG_3_simp_foreplots_tauKBcond.mat forecasts