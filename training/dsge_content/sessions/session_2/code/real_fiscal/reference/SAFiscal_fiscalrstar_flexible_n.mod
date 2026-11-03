%Small open economy model for SA with extended fiscal sector

%Dynare Version 4.5.0 used for calculations
%December, 2018

%% obs data for govt debt: gdebtgdp // conuterfactual estimation for govt spending 2X larger endogenous cyclical response to y and b
%% builds on test_2. Includes rrp in govt budget.
%% CHECK: foreign/external rate missing? NOTE: RECENTLY UPDATED TO INCLUDE rrpstar in NFA equation in "...test_5.mod"
%% Based on SAFiscal_test_3_countactual.mod ... must update

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
% Marginal cost                                                         (1)
%---------------------------------------------------------------------------------------------------
mc_n                  $\hat{mc_n}$          % Marginal_n cost_n: domestic_n good_n

%---------------------------------------------------------------------------------------------------
% Input costs                                                           (2)
%---------------------------------------------------------------------------------------------------
rK_n                  $\hat{r_n}_K$         % Rental_n rate_n of_n capital_n
w_n                   $\hat{w_n}$           % Real_n wage_n

%---------------------------------------------------------------------------------------------------
% Production                                                            (6)
%---------------------------------------------------------------------------------------------------
N_n                   $\hat{N_n}$           % Labour_n
k_n                   $\hat{k_n}$           % Total_n private_n capital_n stock_n (produced by_n Ricardians)
kS_n                  $\hat{k_n}^s_n$         % Capital_n services_n
kG_n                  $\hat{k_n}_G$         % Government_n capital_n
ktilde_n              $\hat{\tilde{k_n}}$   % Total_n effective_n capital_n stock_n: kS_n + kG_n
u_n                   $\hat{u_n}$           % Capital_n utilisation_n

%---------------------------------------------------------------------------------------------------
% Components of aggregate demand                                        (11)
%---------------------------------------------------------------------------------------------------
y_n                   $\hat{y_n}$               % Output_n
c_n                   $\hat{c_n}$               % Total_n consumption_n
cI_n                  $\hat{c_n}^R$             % Ricardian_n consumption_n
cJ_n                  $\hat{c_n}^{NR}$          % Non-Ricardian_n consumption_n
i_n                   $\hat{i_n}$               % Private_n sector_n investment_n
iG_n                  $\hat{i_n}_G$             % Government_n investment_n
im_n                  $\hat{im_n}$              % Total_n imports_n
imC_n                 $\hat{im_n}^C$            % Imported_n consumption_n good_n
imI_n                 $\hat{im_n}^I$            % Imported_n investment_n good_n
x_n                   $\hat{x_n}$               % Exports_n
cItilde_n             $\hat{\tilde{c_n}}^R$     % Total_n effective_n consumption_n

%---------------------------------------------------------------------------------------------------
% Monetary policy                                                       (1)
%---------------------------------------------------------------------------------------------------
r_n                   $\hat{r_n}$               % Policy_n interest_n rate_n/nominal interest_n rate_n

%---------------------------------------------------------------------------------------------------
% Fiscal block                                                          (8)
%---------------------------------------------------------------------------------------------------
g_n                   $\hat{g_n}$               % Government_n consumption_n expenditure_n
tr_n                  $\hat{tr_n}$              % Total_n transfers_n
trI_n                 $\hat{tr_n}^R$            % Transfers_n to_n Ricardian_n households_n
trJ_n                 $\hat{tr_n}^{NR}$         % Transfers_n to_n Non-Ricardian_n households_n
tauC_n                $\hat{\tau}^c_n$          % Consumption_n tax_n rate_n
tauK_n                $\hat{\tau}^k_n$          % Capital_n tax_n rate_n
tauN_n                $\hat{\tau}^w_n$          % Labour_n tax_n rate_n
b_n                   $\hat{b_n}$               % Government_n debt_n / domestic_n bonds_n
pbud_n                $\hat{p}^{bud}$         % primary_n budget_n
pbudsus_n             $\hat{p}^{sus}$         % primary_n budget_n (sustainable)
susgap_n              $\hat{p}^{gap_n}$         % fiscal_n sustainability_n gap_n
susgapgdp_n           $\hat{p}^{gapgdp}$      % fiscal_n sustainability_n gap_n % of_n gdp_n
by_n                  $\frac{b_n}{y_n}$           % Govt_n Debt-to_n-GDP_n

%---------------------------------------------------------------------------------------------------
% Foreign variables                                                     (4)
%---------------------------------------------------------------------------------------------------
ystar_n               $\hat{y_n}^*$             % Foreign_n output_n
rstar_n               $\hat{r_n}^*$             % Foreign_n interest_n rate_n

bstar_n               $\hat{b_n}^*$             % Foreign_n government_n debt_n / foreign_n bonds_n (net foreign_n debt_n)


%---------------------------------------------------------------------------------------------------
% Relative prices (relative to consumption good)                        (5)
%---------------------------------------------------------------------------------------------------
pY_n                  $\hat{p}_Y$             % Output_n price_n
pIM_n                 $\hat{p}_{IM}$          % Import_n price_n
pI_n                  $\hat{p}_I$             % Investment_n price_n
pH_n                  $\hat{p}_H$             % Domestic_n goods_n price_n
pX_n                  $\hat{p}_X$             % Export_n price_n

%---------------------------------------------------------------------------------------------------
% Miscellaneous                                                         (17)
%---------------------------------------------------------------------------------------------------
lambda_n              $\hat{\lambda_n}$             % Lagrange_n multiplier_n - consumption_n
Q_n                   $\hat{Q_n}$                   % Tobin's_n Q_n
s_n                   $\hat{s_n}$                   % Real_n (error: decalred_n as_n Nominal) exchange_n rate_n [CHECK: lower_n case_n s_n declared_n as_n real_n in_n appendix_n p. 52, Eq.A6]
gz                  $\hat{g_n}_z$                 % Trend_n growth_n / prodcutivity_n growth_n
epsilonRPG          $\hat{\varepsilon}^{RP}$    % Risk_n premium_n shock_n on_n domestic_n debt_n (domestic_n currency_n denominated) //  a risk premium_n shock_n over_n the policy_n rate_n for_n domestic_n-currency_n assets
epsilonRPstar       $\hat{\varepsilon}^{RP^*}$  % Risk_n premium_n shock_n on_n foreign_n debt_n (foreign_n currency_n denominated)   //  risk premium_n shock_n for_n foreign_n-currency_n assets, equivalent to_n a foreign_n demand_n shock_n
epsilon             $\hat{\varepsilon}$         % Transitory_n technology_n shock_n
epsilonN            $\hat{\varepsilon}^N_n$       % Labour_n supply/disutility shock_n
epsilonC            $\hat{\varepsilon}^C$       % Preference_n shock_n
epsilonI            $\hat{\varepsilon}^i_n$       % Investment_n specific_n technology_n shock_n
epsilonYstar        $\hat{\varepsilon}^{Y^*}$   % Foreign demand shock

E_n                   $\hat{E_n}$                   % Employment_n

epsilonG
epsiloniG
epsilontr
epsilontauC
epsilontauN
epsilontauK

%---------------------------------------------------------------------------------------------------
% Useful identities                                                      (4)
%---------------------------------------------------------------------------------------------------

piW_n                 $\hat{\pi}^w_n$               % Wage_n inflation_n
dy_n

rrp_n
rrpstar_n

%------------------------
% Fiscal r-star variables
%------------------------

fiscalr_n fiscalrreal_n rrpreal_n rreal_n fiscalrrpgap_n fiscalrgap_n

;

%===================================================================================================
% Declare exogenous variables % 20 shocks /
%===================================================================================================

varexo

etag                $\hat{\eta}^{g_n}$             % Government_n consumption_n spending shock_n
etaiG               $\hat{\eta}^{i_G}$           % Government_n investment_n shock_n
etatr               $\hat{\eta}^{tr_n}$            % Transfer shock_n
etatauC             $\hat{\eta}^{\tau^c_n}$        % Consumption_n tax_n shock_n
etatauN             $\hat{\eta}^{\tau^w_n}$        % Labour_n tax_n shock_n
etatauK             $\hat{\eta}^{\tau^k_n}$        % Capital_n tax_n shock_n

etaYstar            $\hat{\eta}^{y_n^*}$           % Foreign_n demand_n shock_n

etagz               $\hat{\eta}^{g_z}$           % Permanent technology_n shock_n
etaepsilon          $\hat{\eta}^{\varepsilon}$   % Transitory_n tehcnology shock_n
etaN                $\hat{\eta}^{N_n}$             % labour supply (disutility) shock_n
etaC
etaI                $\hat{\eta}^{i_n}$             % Investment_n shock_n

etaRPG              $\hat{\eta}^{RP}$            % Domestic_n risk premium_n shock_n
etaRPstar           $\hat{\eta}^{RP^*}$          % Foreign_n risk premium_n shock_n

;

%===================================================================================================
% Declare parameters
%===================================================================================================

parameters

%-------------------------------------------------------------------------------------------------
%%%%%%%%% Core parameters %%%%%%%%%
%-------------------------------------------------------------------------------------------------

ztilde

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
gammau2         $\gamma_{u_n,2}$
gammau1         $\gamma_{u_n,1}$
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
rKbar           $\bar{r_n}_K$
Rstarbar        $\bar{R}^*$
pIbar           $\bar{p}_I$
pHbar           $\bar{p}_H$
pIMbar          $\bar{p}_{IM}$
pCbar           $\bar{p}_C$
pYbar           $\bar{p}_Y$
pGbar           $\bar{p}_G$
pIGbar          $\bar{p}_{I_G}$
pXbar           $\bar{p}_X$
tauCbar         $\bar{\tau}^c_n$
tauKbar         $\bar{\tau}^k_n$
tauNbar         $\bar{\tau}^w_n$
trJbar          $\bar{tr_n}^{NR}$
trIbar          $\bar{tr_n}^{R}$
trbar           $\bar{tr_n}$
gzbar           $\bar{gz}$
sbar            $\bar{s_n}$
ybar            $\bar{y_n}$
kbar            $\bar{k_n}$
ktildebar       $\bar{\tilde{k_n}}$
kSbar           $\bar{k_n}^s_n$
kGbar           $\bar{k_n}_G$
ibar            $\bar{i_n}$
cbar            $\bar{c_n}$
cIbar           $\bar{c_n}^R$
cJbar           $\bar{c_n}^{NR}$
cItildebar      $\bar{\tilde{c_n}}^R$
gbar            $\bar{g_n}$
iGbar           $\bar{i_G}$
bbar            $\bar{b_n}$
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
imCbar          $\bar{im_n}^C$
imIbar          $\bar{im_n}^I$
xbar            $\bar{x_n}$
qCbar           $\bar{q}^C$
qIbar           $\bar{q}^I$
imbar           $\bar{im_n}$
wbar            $\bar{w_n}$
Nbar            $\bar{N_n}$
xiE             $\xi_E$
rhoRPG          $\rho_{RP}$
rhoRPstar       $\rho_{RP^*}$
rhogz           $\rho_{g_z}$
rhoepsilon      $\rho_{\epsilon}$
rhoI            $\rho_{i_n}$
rhoIM           $\rho_{im_n}$
rhoX            $\rho_{x_n}$
rhovarphiW      $\rho_{\phi^W}$
rhovarphiH      $\rho_{\phi^H}$
rhovarphiX      $\rho_{\phi^X}$
rhovarphistar   $\rho_{\phi^*}$
rhopiC          $\rho_{\pi^C}$
rhoC            $\rho_{C}$
rhoN            $\rho_{N_n}$
rhog            $\rho_{g_n}$
thetaGB         $\theta_{GB}$
thetaGY         $\theta_{GY}$
rhoiG           $\rho_{i_G}$
thetaiGB        $\theta_{i_GB}$
thetaiGY        $\theta_{i_GY}$
rhotr           $\rho_{tr_n}$
thetatrB        $\theta_{trB}$
thetatrY        $\theta_{trY}$
rhotauC         $\rho_{\tau^c_n}$
thetatauCB      $\theta_{\tau^cB}$
thetatauCY      $\theta_{\tau^cY}$
rhotauN         $\rho_{\tau^w_n}$
thetatauNB      $\theta_{\tau^wB}$
thetatauNY      $\theta_{\tau^wY}$
rhotauK         $\rho_{\tau^k_n}$
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
 phiPi	=	1.567210076	;     // OSR params 3.24392 opt / 2.13134 opt coord b_n,y_n // OSR params 3.12572 opt / 3.35216 opt coord b_n,pb^sus //
 phiDY	=	0.387040673	;     // OSR params 1.32413 opt / 8.35792 opt coord b_n,y_n // OSR params 1.10191 opt / 1.20576 opt coord b_n,pb^sus //

 thetatrY	=	0.18859552	;
 thetaGY	=	0.109816633	; // OSR params -0.656391 b_n,y_n // OSR params 0.0347252 b_n,pb^sus // Original: 0.109816633 // x2 : 0.22 // x4 : 0.44 // 0.80 x8
 thetaiGY	=	0.195265714	; // OSR params 0.148869 b_n,y_n  // OSR params  0.194994 b_n,pb^sus // Original: 0.195265714 // x2 : 0.4 // x4 : 0.80 // 1.6 x8
 thetatauCY	=	0.204056348	;
 thetatauNY	=	0.174579288	;
 thetatauKY	=	0.5297234	;
 thetaGB	=	0.180724061     ; // OSR params 1.38299 b_n,y_n  // OSR params 0.324587 b_n,pb^sus // Original: 0.180724061 // x2 : 0.3614 // x4 : 0.7229 // 1.4458 x8
 thetaiGB	=	0.56776651   ; // OSR params 0.66164 b_n,y_n   // OSR params 0.582071 b_n,pb^sus // Original: 0.56776651 // x2 : 1.1355 // x4 : 2.2711 // 4.5421 x8
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
nuG	=	1; // 1 %% from Kemp & Hollander the range is approx. 0.65 to_n 1.35
nuK	=	1; // 1 %% from Kemp & Hollander the range is approx. 0.65 to_n 1.35
muI	=	1.5;

gammaI  =  8;  %10.21586875; %8;

kappastar           =  0.5;
chistar         =   0.2;
thetastar       =   0.7;

rhoIM	=	0.9	;
rhoX	=	0.9	;

betastar	=	betta	;
sigmastar	=	1.4817	;
sigmastarn	=	1.5	;
rhorstar	=	0.9012	;

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

%(1) Consumption FOC (A.9)
lambda_n        = (kappa/gzbar)/(1-kappa/gzbar)*cItilde_n(-1) - (1/(1-kappa/gzbar))*cItilde_n
                - (kappa/gzbar)/(1-kappa/gzbar)*gz - tauCbar/(1+tauCbar)*tauC_n + 1/nuG*(cItilde_n-cI_n) + epsilonC;

%(2) Investment FOC
pI_n            =   Q_n + (gammaI*gzbar^2*(1+betta))*epsilonI
                  + gammaI*gzbar^2*(  betta*(  i_n(+1) - i_n) - (  i_n - i_n(-1) ) + betta*gz(+1)  - gz);

%(3) Capital FOC
Q_n             =   betta*(1-delta)*epsRPKbar/gzbar*Q_n(+1) + lambda_n(+1) - lambda_n - gz(+1)
                  - betta*(1-tauKbar)*rKbar/gzbar/pIbar*epsRPKbar*(  1/(1-tauKbar)*tauK_n(+1) - rK_n(+1) - u_n(+1))
                  + betta*delta*pIbar/gzbar*epsRPKbar*( tauKbar*pI_n(+1) + tauK_n(+1));

%(4) Euler for government bonds
lambda_n        =   lambda_n(+1) - gz(+1) + (rrp_n); // rrp = r + epsilonRPG + gammaB*(b - y)

%(5) UIP //

(rrp_n) =   s_n(+1) - s_n
                            +   (epsilonRPstar + gammaBstar*lamRPstar*sbar/ybar*(bstar_n - y_n));

%(6) Capital accumulation
k_n             =   (1-delta)/gzbar*k_n(-1) - (1-delta)/gzbar*gz
                          + (1-(1-delta)/gzbar)*(gammaI*gzbar^2*(1+betta))*epsilonI
                          + (1-(1-delta)/gzbar)*i_n;

%(7) Capacity utilisation
rK_n             =   gammau2/gammau1*u_n + pI_n;


%(8) Capital services
kS_n             =    u_n   +   k_n(-1);


%(9) Wage phillips

w_n   = (1/(1-tauNbar))*(tauN_n) + (sigmaL*(N_n + epsilonN) - lambda_n);


%(10) Production
y_n             =   (1+psi/ybar)*(  epsilon + alfa*(ktilde_n - gz) + (1-alfa)*N_n );


%(11) Firms cost minimisation
rK_n            =   gz + N_n +  w_n  - kS_n
                        - (nuK-1)/nuK*( ((1-alphaK)/alphaK )^(1/nuK)*(kGbar/kbar)^((nuK-1)/nuK ) )/
                        ( 1+((1-alphaK)/alphaK )^(1/nuK)*(kGbar/kbar)^( (nuK-1)/nuK ) )*( kG_n(-1)-kS_n );


%(12) Marginal cost
mc_n            =   - epsilon  +   alfa*rK_n   +   (1-alfa)*w_n   +   alfa*(kS_n - ktilde_n)
                    +  alfa   *   (nuK-1)/nuK     *    (   ((1-alphaK)/alphaK)^(1/nuK)    *     (kGbar/kbar)^((nuK-1)/nuK )      )   /
                        (     1  +   ((1-alphaK)/alphaK )^(1/nuK)    *     (kGbar/kbar)^((nuK-1)/nuK )      )     *      ( kG_n(-1)-kS_n );


%(17) Total consumption
c_n            =   nuCbar^(1/muC)*(hCbar/qCbar)^(1-1/muC)*(c_n - muC*pH_n) + (1-nuCbar)^(1/muC)*(imCbar/qCbar)^(1-1/muC)*imC_n;


%(18) Consumption price index
0        =   nuCbar*(pHbar/1)^(1-muC)*pH_n + (1-nuCbar)*(pIMbar/1)^(1-muC)*(  pIM_n );

%(19) Total investment
i_n            =   nuIbar^(1/muI)*(hIbar/qIbar)^(1-1/muI)*(i_n - muI*( pH_n - pI_n)) + (1-nuIbar)^(1/muI)*(imIbar/qIbar)^(1-1/muI)*imI_n;


%(20) Investment price index
pI_n            =   nuIbar*(pHbar/pIbar)^(1-muI)*pH_n
                          + (1-nuIbar)*(pIMbar/pIbar)^(1-muI)*(  pIM_n );

%(21) Total imports
im_n            =   imCbar/imbar*imC_n + imIbar/imbar*imI_n;


%(22) Total exports
x_n             = - mustar*(  pX_n - pY_n - s_n ) + ystar_n + ztilde;


%(24) Resource constraint (real) %%% why both real and nominal? This may cause issues with inclusion of flex price equilibrium.
y_n             =   hbar/ybar*(hCbar/hbar*(c_n - muC*pH_n) + hIbar/hbar*(i_n - muI*( pH_n - pI_n)) + hGbar/hbar*g_n+ hIGbar/hbar*iG_n) + xbar/ybar*x_n;


%(25) Resource Constraint Nominal
pY_n + y_n        =   cbar/(pYbar*ybar)*( c_n ) + pIbar*ibar/(pYbar*ybar)*(  pI_n + i_n) + pIbar*kbar/(gzbar*pYbar*ybar)*gammau1*u_n
                          + pGbar*gbar/(pYbar*ybar)*(  pH_n + g_n) + pIGbar*iGbar/(pYbar*ybar)*(  pH_n + iG_n) + pXbar*xbar/(pYbar*ybar)*(  pX_n + x_n)
                          - pIMbar*imCbar/(pYbar*ybar)*(  pIM_n + imC_n )
                          - pIMbar*imIbar/(pYbar*ybar)*(  pIM_n + imI_n );

%(26) Net foreign assets --> convert bstar to net foreign debt. CHECK: foreign/external rate missing?

- (1/Rstarbar)*bstar_n + (1/(gzbar*PiYstarbar))*bstar_n(-1) =
                          + pXbar*xbar/(sbar*pYbar)*(  pX_n + x_n - s_n - pY_n - ztilde)
                          - pIMbar*imbar/(sbar*pYbar)*(  pIM_n + im_n - s_n - pY_n - ztilde);


%(32) Government / fiscal budget constraint %% CHECK formulation and should r and rrp not be r(-1) and rrp(-1)? This specification is discounting current b... see WP comments
pGbar*gbar/(pYbar*ybar)*(pH_n + g_n - pY_n - y_n) = cbar/(pYbar*ybar)*(tauC_n + tauCbar*(c_n - pY_n - y_n))
                                            + wbar*Nbar/(pYbar*ybar)*(tauN_n + tauNbar*(w_n + N_n - pY_n - y_n))
                                            - pIGbar*iGbar/(pYbar*ybar)*(pH_n + iG_n - pY_n - y_n)
                                            + rKbar*kbar/(gzbar*(pYbar*ybar))*(tauK_n + tauKbar*(u_n + rK_n + k_n(-1) - gz - pY_n - y_n))
                                            - pIbar*kbar/(gzbar*(pYbar*ybar))*(delta*tauK_n + tauKbar*gammau1*u_n + tauKbar*delta*(pI_n + k_n(-1) - gz - pY_n - y_n))
                                            %% + bbar/(Rgovbar*(pYbar*ybar))*(b - r - pY - y)
                                            + bbar/(Rgovbar*(pYbar*ybar))*(b_n - rrp_n - pY_n - y_n)
                                            - bbar/(Pibar*gzbar*(pYbar*ybar))*(b_n(-1)  - gz - pY_n - y_n)
                                            - trbar/(pYbar*ybar)*(tr_n - pY_n - y_n);

%(32b) Fiscal Sustainability // pbud = primary balance // pbudsus = sustainable primary balance // susgap = sustainability gap

%(log(Rbar) - (log(gzbar) + log(Pibar)))*(pbudsus - y) = Rbar*(rrp - (dy +  ) + b(-1) - y(-1));
%(Rbar - (gzbar*Pibar))*(pbudsus - y) = Rbar*(rrp - (dy +  ) + b(-1) - y(-1));
%(gzbar*Pibar)*(b - y) + (Rbar - (gzbar*Pibar))*(pbudsus - y) = Rbar*(rrp - (dy +  ) + b(-1) - y(-1));
% susgap = pbudsus - pbud;

susgap_n = pbud_n - pbudsus_n;
susgapgdp_n = (pbud_n - pbudsus_n) - y_n;

pbud_n = cbar/(pYbar*ybar)*(tauC_n + tauCbar*(c_n - pY_n - y_n))
                                            + wbar*Nbar/(pYbar*ybar)*(tauN_n + tauNbar*(w_n + N_n - pY_n - y_n))
                                            + rKbar*kbar/(gzbar*(pYbar*ybar))*(tauK_n + tauKbar*(u_n + rK_n + k_n(-1) - gz - pY_n - y_n))
                                            - pGbar*gbar/(pYbar*ybar)*(pH_n + g_n - pY_n - y_n)
                                            - pIGbar*iGbar/(pYbar*ybar)*(pH_n + iG_n - pY_n - y_n)
                                            - pIbar*kbar/(gzbar*(pYbar*ybar))*(delta*tauK_n + tauKbar*gammau1*u_n + tauKbar*delta*(pI_n + k_n(-1) - gz - pY_n - y_n))
                                            - trbar/(pYbar*ybar)*(tr_n - pY_n - y_n);

%(32c) Fiscal Rstar //


fiscalrrpgap_n = rrpreal_n - fiscalrreal_n;
fiscalrgap_n = rreal_n - fiscalrreal_n;

%(33) Valued consumption
cItilde_n        =   alphaG^(1/nuG)*(cIbar/cItildebar)^((nuG-1)/nuG)*cI_n
                          + (1-alphaG)^(1/nuG)*(gbar/cItildebar)^((nuG-1)/nuG)*g_n;

%(34) Composite capital
ktilde_n        =   alphaK^(1/nuK)*(kbar/ktildebar)^((nuK-1)/nuK)*kS_n
                          + (1-alphaK)^(1/nuK)*(kGbar/ktildebar)^((nuK-1)/nuK)*kG_n(-1);

%(35) Public capital accumulation
kG_n            =   (1-deltaG)/gzbar*kG_n(-1) - (1-deltaG)/gzbar*gz
                          + (1-(1-deltaG)/gzbar)*iG_n
                          + (1-(1-deltaG)/gzbar)*(gammaI*gzbar^2*(1+betta))*epsilonI;

%(36) Total consumption (Ricardian + non-Ricardian)
c_n            =   (1-omega)*cIbar/cbar*cI_n + omega*cJbar/cbar*cJ_n;

%(37) Total transfers
tr_n           =  (1-omega)*trIbar/trbar*trI_n + omega*trJbar/trbar*trJ_n;

%(38) Transfer distribution rule
tr2rot*trI_n   = (1-tr2rot)*trJ_n;

%(39) Non-Ricardian consumption
0            = (1+tauCbar)*cJbar*(tauCbar/(1+tauCbar)*tauC_n + cJ_n)
             - (1-tauNbar)*wbar*Nbar*(w_n + N_n - (1/(1-tauNbar))*(tauN_n)) - trJbar*trJ_n;

%-------------------------------------------------------------------------------------------------
%%%%%%%%% Shock processes %%%%%%%%%
%-------------------------------------------------------------------------------------------------

%(40) Preference shock
epsilonC    =   rhoC*epsilonC(-1) + etaC;

%(41) Labour shock
epsilonN    =   rhoN*epsilonN(-1) + etaN; //

%(42) Domestic risk premium shock // CHECK: function of domestic debt?
epsilonRPG    =   rhoRPG*epsilonRPG(-1) + etaRPG;             // + gammaB*b_n

%(43) Foreign risk premium shock // CHECK: function of foreign debt?
epsilonRPstar =   rhoRPstar*epsilonRPstar(-1) + etaRPstar;    // + gammaBstar*lamRPstar*sbar/ybar*bstar_n

%(44) Permanent technology shock
gz            =   rhogz*gz(-1) + etagz;

%(45) Transitory technology shock
epsilon       =   rhoepsilon*epsilon(-1) + etaepsilon;

%(46) Investment efficiency shock
epsilonI      =   rhoI*epsilonI(-1) + etaI;


%(51) Government consumption shock
g_n =  rhog*g_n(-1) -  thetaGY*y_n  -  thetaGB*b_n(-1)  + epsilonG;

%(52) Government investment shock
iG_n =  rhoiG*iG_n(-1) -  thetaiGY*y_n -  thetaiGB*b_n(-1) + epsiloniG;

%(53) Goverment transfer shock
tr_n =  rhotr*tr_n(-1) - thetatrY*y_n  -  thetatrB*b_n(-1) + epsilontr;

%(54) Consumption tax shock
tauC_n = rhotauC*tauC_n(-1) +   thetatauCB*b_n(-1) + thetatauCY*y_n +  epsilontauC ;

%(55) Labour tax shock
tauN_n =  rhotauN*tauN_n(-1)  +   thetatauNB*b_n(-1)  +  thetatauNY*y_n +  epsilontauN;

%(56) Capital tax shock
tauK_n = rhotauK*tauK_n(-1) + thetatauKB*b_n(-1)  +  thetatauKY*y_n  +  epsilontauK;


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
ystar_n        =           (1/(1 + kappastar))*ystar_n(+1) + (kappastar/(1 + kappastar))*(ystar_n(-1))
                       - ((1 - kappastar)/(sigmastar*(1 + kappastar)))*(rstar_n + epsilonRPstar);  //   foreign IS curve

0       = (sigmastar + sigmastarn)*ystar_n - (1 + sigmastarn)*epsilonYstar;     // real marginal cost foreign economy

%(60) Foreign output shock
epsilonYstar   =         rhoYstar*epsilonYstar(-1) + etaYstar;


%-------------------------------------------------------------------------------------------------
%%%%%%%%% Miscellaneous %%%%%%%%%
%-------------------------------------------------------------------------------------------------

%(62) Employment equation
// E_n    =   betta/(1+betta)*E_n(+1) + 1/(1+betta)*E_n(-1) + (1-betta*xiE)*(1-xiE)/((1+betta)*xiE)*(N_n - E_n);
N_n + epsilonN  =  E_n + (xiE/((1 - betta*xiE)*(1 - xiE)))*((E_n - E_n(-1)) + betta*(E_n - E_n(+1)));    // (re-written ito N_n. Easier to_n see xiE=0 gives N_n=E_n)

%(63) Wage inflation
piW_n = w_n - w_n(-1);

%-------------------------------------------------------------------------------------------------
%%%%%%%%% Measurement equations %%%%%%%%%
%-------------------------------------------------------------------------------------------------



%-------------------------------------------------------------------------------------------------
%%%%%%%%% Identities %%%%%%%%%
%-------------------------------------------------------------------------------------------------

%(87)
dy_n = y_n - y_n(-1);

%(95)
rrp_n = r_n + epsilonRPG + gammaB*(b_n - y_n);

%(96)
rrpstar_n = rstar_n + epsilonRPstar + gammaBstar*lamRPstar*sbar/ybar*(bstar_n - y_n);

by_n = b_n - y_n;


% + bbar/(Rgovbar*(pYbar*ybar))*(b - rrp - pY - y)
% - bbar/(Pibar*gzbar*(pYbar*ybar))*(b(-1) -   - gz - pY - y)

%===================================================================================================
end;
%===================================================================================================

%===================================================================================================
% Compute the steady state
%===================================================================================================


%steady;
SAFiscal_fiscalrstar_flexible_n_steadystate([],[],1); %print steady state and_n parameters
%resid(1);
steady;

check;

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

stoch_simul(order=1, irf=40, nograph, nodisplay, graph_format=fig) b_n y_n r_n rrp_n by_n susgapgdp_n fiscalrreal_n fiscalrrpgap_n ; //
