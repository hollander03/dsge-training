/* 
 * Filename: mod_baseline_paper1.mod
 * Description: Baseline two-agent model with trend inflation
 * Features: Price rigidities with wage rigidities turned off
 * Analysis: This code is geared to match Ascari style model with Bhatnagar two-agent setup.
 * Date: 01/07/2025
 */ 

%%%% This "v3" includes piT shock and MP shock persistence

%close all
set(0,'DefaultFigureWindowStyle','docked')

%=========================================================================
% Declare endogenous variables                                          
%=========================================================================

var

v            // Preference Shock Variable
c_R          // Consumption of Ricardian Households
c_NR         // Consumption of Non-Ricardian Households
C            // Total Aggregate Consumption
tau_C        // Consumption Tax Rate
int_rate     // Nominal Interest Rate
piC          // Inflation Rate
epsilon_i    // MP AR(1) shock
epsilon_p    // price "markup" shock in optimal reset price equation
%piC_optimal  // Optimal Inflation Rate
tau_w        // Labor Income Tax Rate
w            // Nominal Wage Rate
w_optimal    // Optimal Wage Rate
N            // Labor Supply
tr_NR        // Government Transfers to Non-Ricardian Households
h1           // Auxiliary Variable in Wage Setting (h1)
h2           // Auxiliary Variable in Wage Setting (h2)
mc           // Marginal Cost of Production
A            // Total Factor Productivity (TFP)
Y            // Total Output (GDP)
v_p          // Price Dispersion Variable
x1           // Auxiliary Variable in Price Setting (x1)
x2           // Auxiliary Variable in Price Setting (x2)
debt         // Government Debt Level
debtY
CII          // Consumption Inequality Index
G            // Government Spending
lambda       // Lagrange multiplier - the marginal utility at time t
W_R          // Welfare value Function of Ricardian Households
W_NR         // Welfare value Function of Non-Ricardian Households
W            // Overall Welfare Value Function
v_w          // Wage dispersion
Nd           // Labour demand
r            // Log transformed interest rate
tauW         // Log transformed labour tax
tauC         // Log transformed consumption tax
g            // Log transformed government spending 
pii          // Log transformed inflation
y            // Log transformed output
nd           // Log transformed labour demand
n            // Log transformed labour supply
d            // Log transformed government spending 
c            // Log transformed household consumption
v_hat        // Composite dispersion term
log_vp       // Log transformed price dispersion
log_vw       // Log transformed wage dispersion
log_vhat     // Log transformed composite dispersion 
p_star       // Reset price
piC_bar      // Net Quarterly Steady State Inflation (derived from trend inflation)
rp           // Risk Premium
A_tilde      // Effective aggregate productivity
Nd_tilde     // Effective aggregate labour demand 
log_At       // Log transformed effective aggregate productivity
Average_markup       // 
Marginal_markup      // 
Price_adjustment_gap //
average_markup       // 
marginal_markup      // 
price_adjustment_gap //

int_target
real_int_rate

piCann
piCann_bar

%%% Observable variabels
y_qq_obs          
piy_qq_obs
%y_yyq_obs          
%piy_yyq_obs
int_q_obs

debtY_obs
   
;


%=========================================================================
% Declare exogenous shocks                                         
%=========================================================================

varexo

epsilon_G_shock          // Government Spending Shock
epsilon_tauc_shock       // Consumption Tax Shock
epsilon_v_shock          // Preference Shock
epsilon_a_shock          // Productivity Shock
epsilon_tauw_shock       // Labor Tax Shock
epsilon_i_shock          // MP shock
%epsilon_w_shock         // Wage Elasticity Shock (commented out)
epsilon_p_shock          // Price Elasticity Shock
epsilon_tr_shock         // Transfers Shock
epsilon_rp_shock         // Risk Premium Shock 
epsilon_piT_shock        // Inflation target Shock 

%%% Measurement errors
me_y_obs 
me_piy_obs 
%me_int_obs
;

%=========================================================================
% Declare parameters                                        
%=========================================================================

parameters

beta              // Discount Factor
sigma             // inverse elasticity of intertemporal substitution (inverse EIS) OR coefficient of realtive risk aversion (coefficient of RRA)
b                 // Habit Formation Parameter
omega             // Consumption share of Non-Ricardian Households
omega_w           // Welfare share of Non-Ricardian Households
eta               // Inverse of Frisch Elasticity of Labor Supply
psi               // Weight on Labor Disutility
phi_w             // Wage Stickiness Parameter (Calvo Probability)
phi_p             // Price Stickiness Parameter (Calvo Probability)
gamma_wy           // Labor Tax Endogenous Responsiveness to Output
gamma_cy           // Consumption Tax Endogenous Responsiveness to Output
gamma_gy           // Government Spending Endogenous Responsiveness to Output
gamma_try          // Government Transfers to Non-Ricardians HHs Endogenous Responsiveness to Output
gamma_wd           // Labor Tax Endogenous Responsiveness to Debt
gamma_cd           // Consumption Tax Endogenous Responsiveness to Debt
gamma_gd           // Government Spending Endogenous Responsiveness to Deb
gamma_trd          // Government Transfers to Non-Ricardians HHs Endogenous Responsiveness to Debt
phi_pi            // Inflation Coefficient in Taylor Rule
phi_y             // Output Coefficient in Taylor Rule
rho_i             // Interest Rate Smoothing Parameter
rho_i_shock             // MP shock persistence
rho_w             // Persistence of Labor Tax Rate
rho_c             // Persistence of Consumption Tax Rate
rho_g             // Persistence of Government Spending
rho_a             // Productivity Shock Persistence
rho_v             // Preference Shock Persistence
rho_epsilon_w     // Wage Markup Shock Persistence
rho_p     // Price Markup Shock Persistence
rho_piT   // inflaiton target persistence
G_target          // Target Government Spending Level
Y_target          // Target Output Level
debtY_target      // Target Debt to Output ratio
%int_target        // Target Nominal Interest Rate
tau_w_target      // Target Labor Tax Rate
tau_C_target      // Target Consumption Tax Rate
zeta_w            // Wage Indexation Parameter
zeta_p            // Price Indexation Parameter
epsilon_w         // Elasticity of Substitution Among Labor Types
epsilon_pm         // Elasticity of Substitution Among Goods
rho_tr            // Persistence of Social Transfers
tr_NR_target      // Transfers to Non-Ricardian HHs as share of output target
%piC_bar           // Net Quarterly Steady State Inflation (derived from trend inflation)
trend_inflation   // Annual trend inflation rate (e.g., 0, 2, 4, 6)
rho_rp            // Risk Premium Shock Persistence
gamma_rp          // Government Spending Endogenous Responsiveness to Debt

rp_bar
real_int_rate_target

;

%=========================================================================
% Assign parameter values                                        
%=========================================================================

beta          = 0.9884;     % calibrated to 1/mean(real_rate_obs)
sigma         = 2;          % 1 implies log utility
b             = 0.75;       % Tweak to see how results shift
omega         = 0.1; %= 0.5;   
omega_w       = 0.5; %= 0.5;   
eta           = 2;       
psi           = 3;
phi_w         = 0; %= 0.25; %= 0.70;    
phi_p         = 0.75; %= 0.75; %= 0.66;     
gamma_wy      = 0.08; %= 0.10; %= 0.025;              % Try between 0.05-0.10
gamma_cy      = 0.20; %= 0.03; %= 0.10; %= 0.025; 
gamma_gy      = 0.05; %= 0.10; %= 0.025; %= 0;   
gamma_try     = 0.16; %= 0.0; %= 0.025; %= 0;
gamma_wd      = 0.11; %= 0.10; %= 0.025;              % Try between 0.05-0.10
gamma_cd      = 0.21; %= 0.05; %= 0.10; %= 0.025; 
gamma_gd      = 0.12; %= 0.10; %= 0.025; %= 0;   
gamma_trd     = 0.36; %= 0.05; %= 0.0; %= 0.025; %= 0;   
phi_pi        = 2.5; %= 5; %= 3.5; %2;  %= 1.5;       % Requires a high phi_pi for all charts to generate sensibly (informed by Ascari's determinacy region)
phi_y         = 0.25; %= 0.5/4;     
rho_i         = 0.75;                          % Try between 0.80-0.95
rho_i_shock   = 0.75;     
rho_w         = 0.42; 
rho_c         = 0.24;
rho_g         = 0.82;
rho_a         = 0.75;     
rho_v         = 0.75;    
rho_epsilon_w = 0.75;      
rho_p         = 0.75; 
rho_piT       = 0.75;   // inflaiton target persistence  
rho_rp        = 0.75;   
rho_tr        = 0.5;       
G_target      = 0.195;   
Y_target      = 1;        
debtY_target   = 1.6; %= 0.6;  
tau_w_target  = 0.191;   
tau_C_target  = 0.167;    
zeta_w        = 0; %= 0.1; %= 0.25; %= 0.58;      % Helps ensure a unqiue solution otherwise a very high phi_p is required to match Ascari charts. 
zeta_p        = 0.1; %= 0.25; %= 0.24;     
epsilon_w     = 6; %= 10;       
epsilon_pm     = 11; %= 10;       
tr_NR_target  = 0.035;
gamma_rp      = 0.001; %= 0.025; %= 0.0418; %= 0;

rp_bar        = 0;
real_int_rate_target = (1/beta) - 1;

trend_inflation = 6 ; // 1.534980668262*4 % pinned at 6 not 6.12 for full sample  % For baseline replication = 0; later set to 2,4,6,... %piC_bar = ((1 + trend_inflation/100)^(1/4) - 1);

% piC_bar     = (1+trend_inflation/400)-1;

%int_target     = (1/beta)*(1+piC_bar)-1; %%int_target     = (1/beta)*(1+piC)-1;
%int_target     = (1/beta)*(1+trend_inflation/400)-1; %%int_target     = (1/beta)*(1+piC)-1;


%=========================================================================
% Model equations                                     
%=========================================================================


model;

% (1): Definition of Marginal Utility of Consumption
lambda = v / ((1 + tau_C) * (c_R - b * c_R(-1))^(sigma)); 

% (2): Euler Equation for Ricardian Consumers
lambda = beta * lambda(+1) * (((1 + int_rate) * (1 + rp)) / (1 + piC(+1)));

% (3): Budget Constraint for Non-Ricardian Consumers
(1 + tau_C) * c_NR = (1 - tau_w) * w * Nd + tr_NR;

% (4): Aggregate Consumption
C = (1 - omega) * c_R + omega * c_NR;

% (5): Total Transfers

%tr_NR = (1 - rho_tr) * tr_NR_target + rho_tr * tr_NR(-1) -
%        (1 - rho_tr) * gamma_trd * ((debt/Y)-(debtY_target)) - 
%        (1 - rho_tr) * gamma_try * (Y-Y_target) +
%        epsilon_tr_shock;

log(tr_NR) = (1 - rho_tr) * log(tr_NR_target) + rho_tr * log(tr_NR(-1)) -
        (1 - rho_tr) * gamma_trd * (log(debt/Y)-log(debtY_target)) - 
        (1 - rho_tr) * gamma_try * (log(Y)-log(Y_target)) + 
        epsilon_tr_shock;

% (6): Optimal Wage Setting (Nonlinear)
w_optimal^(1 + epsilon_w * eta) = 
    ((epsilon_w / (epsilon_w - 1)) * (h1 / h2)) / (1 - tau_w); 

% (7): H1 Definition
h1 = psi * w^(epsilon_w * (1 + eta)) * Nd^(1 + eta) +
         beta * phi_w * (1 + piC(+1))^(epsilon_w * (1 + eta)) * 
         (1 + piC)^(-zeta_w * epsilon_w * (1 + eta)) * h1(+1);

% (8): H2 Definition
h2 = lambda * w^(epsilon_w) * Nd + 
    beta * phi_w * (1 + piC(+1))^(epsilon_w - 1) *
    (1 + piC)^(zeta_w * (1 - epsilon_w)) * h2(+1);

% (9): Marginal Cost
mc = w / A; 

% (10): Resource Constraint
Y = C + G; 

% (11): Production Function
%Y = (A * Nd) / v_p;
Nd = (Y/A) * v_p;
    
% (12): Price Dispersion Variable (Nonlinear)
%%v_p = (1 - phi_p) * (p_star)^(-epsilon_p) + 
%%phi_p * (1 + piC(-1))^(-epsilon_p * zeta_p) * (1 + piC)^(epsilon_p) * v_p(-1);

v_p = (1+piC)^(epsilon_p) * ( 
        (1-phi_p)*p_star^(-epsilon_p)  +  
        phi_p*(1+piC(-1))^(-epsilon_p*zeta_p) * v_p(-1) );


% (13): Wage Dynamics (Nonlinear)
w^(1 - epsilon_w) = (1 - phi_w) * w_optimal^(1 - epsilon_w) +
    phi_w * (1 + piC)^(epsilon_w - 1) * (1 + piC(-1))^(zeta_w * (1 - epsilon_w)) * 
    w(-1)^(1 - epsilon_w);    

% (14): Inflation Dynamics (Nonlinear)
(1 + piC)^(1 - epsilon_p) = (1 - phi_p) * (p_star)^(1 - epsilon_p)
    + phi_p * (1 + piC(-1))^(zeta_p * (1 - epsilon_p)); 

% (15): Optimal Price Setting (Nonlinear)
p_star = (epsilon_p / (epsilon_p - 1)) * (x1 / x2); % + epsilon_p_shock

% (16): x1 Definition
x1 = lambda * mc * Y + phi_p * beta * (1 + piC)^(-zeta_p * epsilon_p) *
     (1 + piC(+1))^(epsilon_p) * x1(+1);

% (17): x2 Definition
x2 = lambda * Y + phi_p * beta * (1 + piC)^(zeta_p * (1 - epsilon_p)) *
     (1 + piC(+1))^(epsilon_p - 1) * x2(+1);

% (18): Monetary Policy Rule  
%log(1+int_rate) = (1-rho_i)*log(1+int_target)
%                + rho_i*log(1+int_rate(-1))
%                + phi_pi * ( log(1+piC) - log(1+piC_bar) )   
%                + phi_y  * log(Y/Y(-1))
%                % + phi_y  * (Y/Y_target)
%                + epsilon_i_shock;

%(1+int_rate) = (1+int_target)^(1-rho_i)*(1+int_rate(-1))^(rho_i)*(((1+piC)/(1+piC_bar))^(phi_pi)*(Y/Y(-1))^phi_y)^(1-rho_i)*exp(epsilon_i);
(1+int_rate) = (1+int_target)^(1-rho_i)*(1+int_rate(-1))^(rho_i)*(((1+piCann)/(1+piCann_bar))^(phi_pi)*(Y/Y(-1))^phi_y)^(1-rho_i)*exp(epsilon_i);
%(1+int_rate) = (1+int_target)^(1-rho_i)*(1+int_rate(-1))^(rho_i)*(((1+piC)/(1+piC_bar))^(phi_pi)*(Y/Y(-1))^phi_y)*exp(epsilon_i); 

piCann = piC + piC(-1) + piC(-2) + piC(-3);
piCann_bar = piC_bar + piC_bar(-1) + piC_bar(-2) + piC_bar(-3);

%log(1+int_rate) = rho_i * log(1 + int_rate(-1)) + (1 - rho_i) * log(1 + int_target) 
%                + (1 - rho_i) * (phi_pi * ( log(1 + piC) - log(1 + piC_bar)) + phi_y  * log(Y/Y(-1)))
%                + epsilon_i_shock;

%int_rate = rho_i * int_rate(-1) + (1 - rho_i) * int_target
%                + (1 - rho_i) * ( phi_pi * ( piC - piC_bar ) + phi_y  * ( y - y(-1) ) ) + epsilon_i_shock;

epsilon_i = rho_i_shock*epsilon_i(-1) + epsilon_i_shock;

% (19): Government Budget Constraint
%G + tr_NR + ( ((1 + int_rate(-1)) * (1 + rp)) / (1 + piC) ) * debt(-1) = tau_w * w * N + tau_C * C + debt; 
G + tr_NR + ( ((1 + int_rate(-1)) * (1 + rp(-1))) / (1 + piC) ) * debt(-1) = tau_w * w * N + tau_C * C + debt; 

 debtY = debt/Y;

% (20): Labor Tax Rate Rule
tau_w = (1 - rho_w) * tau_w_target + rho_w * tau_w(-1) +
      (1 - rho_w) * gamma_wd * ((debt/Y)-(debtY_target)) +
      (1 - rho_w) * gamma_wy * (Y-Y_target) + epsilon_tauw_shock;

% (21): Consumption Tax Rate Rule
tau_C = (1 - rho_c) * tau_C_target + rho_c * tau_C(-1) +
        (1 - rho_c) * gamma_cd * ((debt/Y)-(debtY_target)) + 
        (1 - rho_c) * gamma_cy * (Y-Y_target) + epsilon_tauc_shock;

% (22): Government Spending Rule

%G = (1 - rho_g) * (G_target) + rho_g * (G(-1)) -
%        (1 - rho_g) * gamma_gd * ((debt/Y)-(debtY_target)) - 
%        (1 - rho_g) * gamma_gy * ((Y)-(Y_target)) + epsilon_G_shock;

log(G) = (1 - rho_g) * log(G_target) + rho_g * log(G(-1)) -
        (1 - rho_g) * gamma_gd * (log(debt/Y)-log(debtY_target)) - 
        (1 - rho_g) * gamma_gy * (log(Y)-log(Y_target)) + 
        epsilon_G_shock;

% (23): Productivity Process
log(A) = rho_a * log(A(-1)) + epsilon_a_shock;

% (24): Preference Shock Process
log(v) = rho_v * log(v(-1)) + epsilon_v_shock;
    
% (25): Consumption Inequality Index
CII = c_R / c_NR;

% (26): Labor Demand and Labour Supply Equation
N = Nd * v_w;
    
% (27): Value Function for Ricardian Households // standardised to log for both households -> this version estimates EIS param
W_R = ( v * log(c_R - b * c_R(-1)) - 
    (psi * Nd^(1 + eta) * v_w) / (1 + eta)) + beta * W_R(+1);

%W_R = ( v * log(c_R - b * c_R(-1)) - 
%    (psi * N^(1 + eta) * v_w) / (1 + eta)) + beta * W_R(+1);

% (28): Value Function for Non-Ricardian Households
W_NR = ( v * log(c_NR - b * c_NR(-1)) -
    (psi * Nd^(1 + eta)) / (1 + eta) ) + beta * W_NR(+1);

%W_NR = ( v * log(c_NR - b * c_NR(-1)) -
%    (psi * N^(1 + eta)) / (1 + eta) ) + beta * W_NR(+1);

%W_NR = ( v * log(c_NR - b * c_NR(-1)) -
%    (psi * Nd^(1 + eta) * v_w) / (1 + eta)) + beta * W_NR(+1);

% (29): Overall Value Function
%W = phi_w * W_NR + (1 - phi_w) * W_R;
W = omega_w * W_NR + (1 - omega_w) * W_R;

% (30): Wage-Related Variable Dynamics
v_w = (1 - phi_w) * (w_optimal / w)^(-epsilon_w * (1 + eta)) +
    phi_w * ((w / w(-1) * (1 + piC))^(epsilon_w * (1 + eta)) *
    (1 + piC(-1))^(-zeta_w * epsilon_w * (1 + eta))) * v_w(-1);

% (31): Risk Premium Shock Process
% rp = rho_rp * rp(-1) + (1 - rho_rp) * gamma_rp * ((debt / Y) - debtY_target) + epsilon_rp_shock;
% rp = rho_rp * rp(-1) + gamma_rp * (debtY - debtY_target) + epsilon_rp_shock;
% rp = rho_rp * rp(-1) + epsilon_rp_shock;

%log(1+rp) = rho_rp*log(1+rp(-1))
%            % + (1-rho_rp)*log(1+rp_bar)
%            + gamma_rp * log(debtY/debtY_target) + epsilon_rp_shock ;

(1+rp) = (1+rp(-1))^rho_rp*(1+rp_bar)^(1-rho_rp)*(debtY/debtY_target)^gamma_rp*exp(epsilon_rp_shock) ;

% (31): Wage Markup Shock Process
%log(epsilon_w) = rho_epsilon_w * log(epsilon_w(-1)) + epsilon_w_shock;

% (32): Price Markup Shock Process
% log(epsilon_p) = rho_p * log(epsilon_p(-1)) + (1 - rho_p)*log(epsilon_pm) + epsilon_p_shock;

 epsilon_p = rho_p * epsilon_p(-1) + (1 - rho_p)*(epsilon_pm) + epsilon_p_shock;

% (**) Trend Inflation Features

(1 + piC_bar) = (1 + piC_bar(-1))^(rho_piT)*(1 + trend_inflation/400)^(1 - rho_piT)*exp(epsilon_piT_shock); // ^(1/4);   // Add here to allow the iteration under different trend_inflation

%(1 + int_target)     = (1/beta)*(1+trend_inflation/400);
(1 + int_target)     = (1/beta)*(1+piC_bar);

(1 + real_int_rate) = (1 + int_rate) / (1 + piC(+1)); 

% piC_bar = rho_piT*piC_bar(-1) + (1 - rho_piT)*trend_inflation/400 + epsilon_piT_shock;  

% piC_bar = rho_piT*piC_bar(-1) + (1 - rho_piT)*steady_state(piC) + epsilon_piT_shock;   // + (1 - rho_piT)*trend_inflation/400 Add here to allow the iteration under different trend_inflation

v_hat    = v_w * (v_p);      % composite mis‐allocation
%A_tilde  = A / v_hat;      % effective productivity
A_tilde  = A / v_p;      % effective productivity
Nd_tilde = N / v_w;       % effective labour demand (because N = Nd * v_w)

log_At = log(A_tilde);

%log_vp = log(1/v_p);
log_vp = log(v_p);
log_vw = log(v_w);
log_vhat = log_vw + log_vp;

%v_hat    = (1/v_p) * v_w;      % composite mis‐allocation
%A_tilde  = A / v_hat;      % effective productivity
%Nd_tilde = Nd / v_w;       % effective labour demand
%vp = log(v_hat);

Average_markup = 1/mc;
Marginal_markup = p_star/mc;
Price_adjustment_gap = 1/p_star;

average_markup = log(Average_markup);
marginal_markup = log(Marginal_markup);
price_adjustment_gap = log(Price_adjustment_gap);


% (**) Log Transformations
r = log(1 + int_rate);
tauW = log(1 + tau_w);
tauC = log(1 + tau_C);
g = log(G);
pii = log(1 + piC);
y = log(Y);
nd = log(Nd); 
n = log(N); 
d = log(debt); 
c = log(C);

% Measurement equations

y_qq_obs/100 - 0.556603479733/100 = y - y(-1) + me_y_obs;

%piy_qq_obs/100 - 1.534980668262/100 =  pii - steady_state(pii) + me_piy_obs;
piy_qq_obs/100 - 1.534980668262/100 =  piC - steady_state(piC) + me_piy_obs;
% piy_qq_obs/100 =  piC; // + me_piy_obs;   

debtY_obs/100 - 40/100 =  debtY - steady_state(debtY);

%int_q_obs/100 - 1.783573627297/100 = r - steady_state(r) ;
int_q_obs/100 - 1.783573627297/100 = int_rate - steady_state(int_rate) ;
%int_q_obs/100 - 1.783573627297/100 = int_rate  ;

%y_yyq_obs/100 - 0.433066317614/100 = y - y(-1) + me_y_obs;
%piy_yyq_obs/100 - 1.326442491652/100 =  piC - steady_state(pii) + me_piy_obs;
%int_q_obs/100 - 1.536469699943/100 = r - steady_state(r) ;


%% Full-sample 2000-2024 qq: 0.556603479733	1.534980668262	1.783573627297
%% Sub-sample 2010-2019 : 0.423917499198	1.336122534768	1.536469699943
%% Sub-Sampel 2010-2024 qq : 0.351187799899	1.306819013283	1.499342738301
%% yy: 0.433066317614	1.326442491652	1.536469699943

%%% Transformation from my Ascari estimation
%piy_qq_obs/100 - 1.306819013283/100 = (exp(pii) - 1) - (exp(steady_state(pii)) - 1) + me_piy_obs;
%% int_q_obs/100 - 1.499342738301/100 = exp(int); %% CHECK me eqn... prev. excl the - 1
%% int_q_obs/100 - 1.499342738301/100 = (exp(int) - 1) - (exp(steady_state(int)) - 1) + me_int_obs;

%y_yyq_obs/100 - 0.433066317614/100	 = y - y(-1);
%piy_yyq_obs/100 - 1.326442491652/100 = exp(pii) - 1;
%int_q_obs/100 - 1.536469699943/100 = exp(int) - 1;

end;

%=========================================================================
% Initial values                                   
%=========================================================================

initval;

v           = 1;                           
C           = Y_target - G_target;                          
c_R         = 1;                           
c_NR        = 1;  
%c_R         = (1 - omega) * C ; 
%c_NR        = (omega) * C ;  
%c_NR = ((1 - tau_w) * w * Nd + tr_NR)/(1 + tau_C);                            
% C           = (1 - omega) * c_R + omega * c_NR; 
c           = log(C);
tau_C       = tau_C_target;
tauC        = log(1 + tau_C);

piC_bar     = trend_inflation/400;
%piC_bar     = ((1 + trend_inflation/100)^(1/4) - 1);   // included

piC         = piC_bar;
piCann_bar  = piC_bar*4;
piCann      = piCann_bar;  
pii         = log(1 + piC);  

%piC          = trend_inflation/400;
%piC_bar = piC;                                                               

epsilon_p   = epsilon_pm;
p_star = ((1-phi_p*(1+piC_bar)^(epsilon_p-1))/(1-phi_p))^(1/(1-epsilon_p));

real_int_rate = real_int_rate_target; // 1/beta - 1
int_target      =  ((1/beta)*(1 + piC_bar) - 1);
int_rate    = int_target;                       
r           = log(1 + int_rate);                                          
                       
tau_w       = tau_w_target;                    
tauW        = log(1 + tau_w);                       
tr_NR       = tr_NR_target;                         
h1          = 1;                           
h2          = 1;     
w_optimal   = ((epsilon_w/(epsilon_w-1))*h1/h2/(1-tau_w))^(1/(1+epsilon_w*eta));  
w           = w_optimal;                  
%w = 1;
%w_optimal = w;
lambda      = 1;                              
A           = 1;            
mc          = w/A;                    
Y           = Y_target;
%Y           = C + G_target; 
%Y           = 1;
y           = log(Y);                  
v_p         = ((1-phi_p)/(1-phi_p*(1+piC_bar)^epsilon_p)) * p_star^(-epsilon_p); 
%v_p         = ((1-phi_p)/(1-phi_p*(1+piC)^epsilon_p)) * p_star^(-epsilon_p);   
%v_p         = 1;
%vp          = 0;                         
x1          = 1;                                
x2          = 1;                               
debtY       = debtY_target; 
debt        = debtY*Y;  
d           = log(debt);                    
CII         = c_R / c_NR;                      
G           = G_target;                       
g           = log(G);
W_R         = 1;                               
W_NR        = 1;                               
W = (1 - omega_w) * W_R + (omega_w) * W_NR;                       
%v_w         = ((1 - phi_w) * (w_optimal/w)^(-epsilon_w*(1+eta))) / (1 - phi_w*(1+piC_bar)^(epsilon_w*(1+eta)));   
%v_w         = ((1 - phi_w) * (w_optimal/w)^(-epsilon_w*(1+eta))) / (1 - phi_w*(1+piC)^(epsilon_w*(1+eta)));                
v_w         = 1;

%Nd = ( ((epsilon_w-1)/epsilon_w)*(1/psi)*(1/lambda)*mc*(1-tau_w)
%         *((1-phi_w*(1+piC_bar)^((epsilon_w-1)*(1-zeta_w)))/(1-phi_w))^((1+epsilon_w*eta)/(1-epsilon_w))
%         *((1-phi_w*beta*(1+piC_bar)^((epsilon_w-1)*(1-zeta_w)))/(1-phi_w*beta*(1+piC_bar)^(epsilon_w*(1+eta)*(1-zeta_w)))) )^(1/eta);

Nd          = (Y/A)*v_p;
N           = Nd*v_w;
%Nd          = 1/3;
%N           = Nd*v_w;
nd          = log(Nd); 

rp          = rp_bar;
%epsilon_p   = epsilon_pm;
epsilon_i   = 0;


%v_hat    = v_p * v_w;      % composite mis‐allocation
%A_tilde  = A / v_hat;      % effective productivity
%Nd_tilde = Nd / v_w;       % effective labour demand

v_hat    = v_w * (v_p);      % composite mis‐allocation
A_tilde  = A / v_p;      % effective productivity
%A_tilde  = A / (v_p);      % effective productivity
Nd_tilde = N / v_w;       % effective labour demand

log_At = 0;

log_vp = 0;
log_vw = 0;
log_vhat = 0;


Average_markup = 1/mc;
Marginal_markup = p_star/mc;
Price_adjustment_gap = 1/p_star;

average_markup = 0;
marginal_markup = 0;
price_adjustment_gap = 0;

y_qq_obs = 0.556603479733;
piy_qq_obs = 1.534980668262;
int_q_obs = 1.783573627297;

debtY_obs = 40; 

%y_yyq_obs = 0.433066317614;
%piy_yyq_obs = 1.326442491652;
%int_q_obs = 1.536469699943;

%% Full-sample 2000-2024 qq: 0.556603479733	1.534980668262	1.783573627297
%% Sub-sample 2010-2019 qq : 0.423917499198	1.336122534768	1.536469699943
%% Sub-Sampel 2010-2024 qq : 0.351187799899	1.306819013283	1.499342738301
%% yy: 0.433066317614	1.326442491652	1.536469699943


end;

%=========================================================================
% Compute steady state                                    
%=========================================================================

steady; 

%=========================================================================
% Check for residuals and model diagnostics                                  
%=========================================================================

resid;
check;


shocks;

var epsilon_a_shock; stderr 0.01;          // Productivity Shock
var epsilon_p_shock; stderr 0.01;         // Price Markup Shock
var epsilon_v_shock; stderr 0.01;          // Preference Shock
var epsilon_i_shock; stderr 0.01;          // Monetary Policy shock

var epsilon_piT_shock; stderr 0;          // Inflation Target shock

var epsilon_rp_shock; stderr 0.01;         // Risk Premium Shock 
%% var epsilon_wm_shock; stderr 0;         // Wage Markup Shock

var epsilon_G_shock; stderr 0;          // Government Spending Shock
var epsilon_tr_shock; stderr 0;         // Transfers Shock

var epsilon_tauc_shock; stderr 0;       // Consumption Tax Shock
var epsilon_tauw_shock; stderr 0;       // Labor Tax Shock
 
var me_y_obs; stderr 0;
var me_piy_obs; stderr 0;
% var me_int_obs; stderr 0;
end;


% stoch_simul(order=1, irf=20, graph_format=fig) y piC int_rate v_p debt rp debtY y_qq_obs piy_qq_obs int_q_obs ; 

%/*

estimated_params;

%% household
//beta, beta_pdf, 0.985, 0.0025;
//b, beta_pdf, 0.5, 0.1;             // habit formation
sigma, inv_gamma_pdf, 2, 0.25;       // Inverse EIS of consumption
%eta, inv_gamma_pdf, 3, 0.25;         // Inverse of Frisch Elasticity of Labor Supply 
omega, beta_pdf, 0.1, 0.05;          // Consumption share of Non-Ricardian Households

%% firm
phi_p, beta_pdf, 0.75, 0.1;
zeta_p, beta_pdf, 0.5, 0.1;

%% union -> zero wage rigidities in this version 

%% monetary policy
rho_i, beta_pdf, 0.75, 0.1;
phi_pi, normal_pdf, 1.5, 0.5;
phi_y, beta_pdf, 0.5, 0.1;

//trend_inflation, normal_pdf, 4.5, 0.5;
rho_piT, beta_pdf, 0.75, 0.05;

%% Fiscal Policy
//rho_g, beta_pdf, 0.75, 0.1; 
//rho_tr, beta_pdf, 0.75, 0.1;
//gamma_rp, inv_gamma_pdf, 0.001, 0.01;

%% Shock persistence

rho_a, beta_pdf, 0.75, 0.1;
rho_p, beta_pdf, 0.75, 0.1;       // AR(1) for markup
rho_v, beta_pdf, 0.75, 0.1;
rho_i_shock, beta_pdf, 0.75, 0.1;
rho_rp, beta_pdf, 0.75, 0.1;   

%% Shock innovations

stderr epsilon_a_shock, inv_gamma_pdf, 0.01, inf;    // Productivity Shock
stderr epsilon_p_shock, inv_gamma_pdf, 0.01, inf;   // Price markup / cost-push
stderr epsilon_v_shock, inv_gamma_pdf, 0.01, inf;    // Preference Shock
stderr epsilon_i_shock, inv_gamma_pdf, 0.01, inf;    // MP shock
stderr epsilon_piT_shock, inv_gamma_pdf, 0.01, inf;    // MP shock
stderr epsilon_rp_shock, inv_gamma_pdf, 0.01, inf;  // Risk Premium Shock : choose either preference or RP shock for small-scale estimation -> equivalence

% stderr epsilon_G_shock, inv_gamma_pdf, 0.01, inf;    // Productivity Shock
% stderr epsilon_tr_shock, inv_gamma_pdf, 0.01, inf;   // Price markup / cost-push

  // measurement errors:
% stderr me_y_obs, inv_gamma_pdf, 0.001, 0.005;
% stderr me_piy_obs, inv_gamma_pdf, 0.001, 0.005;
% stderr me_int_obs, inv_gamma_pdf, 0.001, 0.005;

end ;

varobs y_qq_obs piy_qq_obs int_q_obs  ; //   debtY_obs

%estimated_params_init(use_calibration);
%end;

% The estimation uses Dynare version 6. For dynare version 4.6 use mode_compute=4 
% first_obs=41, nobs=40, 

estimation(datafile=Estimation0024qq, mh_replic=100000, mh_nblocks=2, mh_drop=0.5, mh_jscale=0.45, // load_mh_file,  mh_replic=300000 
           mode_compute=5, mode_check, // mode_file=mod_base_p1_estqq_PiTshock_v3_mh_mode,  //   
           plot_priors=0, bayesian_irf, irf=20, moments_varendo, conditional_variance_decomposition=[1:20],  
           graph_format=fig, nodisplay) y pii real_int_rate v_p debt rp debtY Nd c_R c_NR w piC piCann r int_rate y_qq_obs piy_qq_obs int_q_obs  ; // Utility A zeta  % y_yyq_obs piy_yyq_obs int_q_obs ; // nodisplay // (fig,pdf)


// Shock Decomposition option 

shock_groups(name=groups);
'Technology' = epsilon_a_shock;   //   
'Markup' = epsilon_p_shock;
'Preference' = epsilon_v_shock;  
'Risk Premium' = epsilon_rp_shock;
%'G. Spending' = epsilon_G_shock, epsilon_tr_shock;  
%'G. Revenue' = etatauC, etatauN, etatauK; 
'Monetary Policy' = epsilon_i_shock; 
%'Inflation Target' = epsilon_piT_shock; 
end;

//// Shock Decomposition option
% shock_decomposition(colormap=jet) pii r Y ;    // rr_obs
% plot_shock_decomposition(graph_format=(fig), use_shock_groups=groups, colormap=jet, steadystate) y_qq_obs piy_qq_obs int_q_obs v_p debt rp debtY y real_int_rate;



// //identification(parameter_set = prior_mode);
% identification(advanced=1, max_dim_cova_group=2, parameter_set = posterior_mean);



%*/