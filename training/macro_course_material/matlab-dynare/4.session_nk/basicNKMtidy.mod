// Monetary policy in Sticky versus Flexible Price Environments: basic NK Model with Labour and MIU

// Declare variables
var y c m r int pii mc x xi_z xi_p xi_i p
    yn cn rn ygap mreal; //  n xi_mu mn

// Declare exogenous shocks
varexo epsilon_z epsilon_p epsilon_i; //  epsilon_mu

// Define parameters
parameters betta delta eta_c eta_m eta_n theta_p kappa_pii kappa_y rho_z rho_p rho_i rho_iexo rho_mu phi_z sigmaz sigmap sigmai sigmamu;

// Parameter values
betta = 0.989;           // Discount factor
delta = 0.019;           // Depreciation rate
eta_c = 2;               // Risk aversion coefficient for consumption
eta_m = 3;               // Elasticity of money demand
eta_n = 1;               // Inverse Frisch elasticity of labour supply
theta_p = 0.75;          // Steady-state price stickiness
kappa_pii = 1.5;         // MP response to inflation
kappa_y = 0.35;          // MP response to output gap
rho_z = 0.95;            // Persistence of technology shock
rho_p = 0.75;            // Persistence of price shock
rho_i = 0;            // Persistence of monetary policy - Smoothing parameter in Taylor rule
rho_iexo = 0;            // Persistence of monetary policy shock  
rho_mu = 0;              // Persistence of money supply shock
phi_z = 0;               // Endogenous money supply response to tech shock
sigmaz = 0.01;           // Std. dev. of technology shock
sigmap = 0.0025;         // Std. dev. of price shock - quarterly rate
sigmai = 0.0025;         // Std. dev. of monetary policy shock - quarterly rate
sigmamu = 0.01;          // Std. dev. of money supply shock

// Model equations
model(linear);

// Auxiliary equations
# kappa = (1 - theta_p)*(1 - betta*theta_p)/theta_p;  // Price adjustment factor // kappa = 0.0861
# iss = 1/betta;                                     // Steady-state gross nominal interest rate = gross real interest rate since steady state pi=0

// Aggregate resource constraint
y = c; 

// Uncomment to include production function with labour. You need to add n as variable above
// y = n + xi_z;

// Consumption Euler equation
c = c(+1) - (1/eta_c)*r;

// Money demand function
// m is real below
// m = (eta_c/eta_m)*c - (1/eta_m)*(1/iss)*int;

// m is nominal below
 m - p = (eta_c/eta_m)*c - (1/eta_m)*(1/iss)*int;
 pii = p - p(-1);

// Fisher equation
int = r + pii(+1);

// New Keynesian Phillips curve
pii = betta*pii(+1) + kappa*mc + xi_p;

// Real marginal cost equation
mc = (eta_n + eta_c)*y - (1 + eta_n)*xi_z;

// Markup equation
x = -mc;

// Monetary policy rule
 int = rho_i*int(-1) + (1 - rho_i)*(kappa_pii*pii + kappa_y*ygap) + xi_i;
%% Uncomment to include output (y) in the policy rule
// int = rho_i*int(-1) + (1 - rho_i)*(kappa_pii*pii + kappa_y*y) + xi_i;
%% Uncomment to include output growth (y - y(-1)) in the policy rule
// int = rho_i*int(-1) + (1 - rho_i)*(kappa_pii*pii + kappa_y*(y - y(-1))) + xi_i;
%% Uncomment to include forward looking inflation and output responses in the policy rule
// int = rho_i*int(-1) + (1 - rho_i)*(kappa_pii*pii(+1) + kappa_y*ygap(+1)) + xi_i;
%% Uncomment to include backward looking inflation and output responses in the policy rule
// int = rho_i*int(-1) + (1 - rho_i)*(kappa_pii*pii(-1) + kappa_y*ygap(-1)) + xi_i;
%% Uncomment to run optimal policy rule with osr such that int=r=rn when pii=ygap=0
// int = rn + (kappa_pii*pii + kappa_y*ygap) + xi_i;

// Uncomment to include money growth rule (can only choose one rule at a time otherwise more quations and variables)
// m is real money, but central bank controls nominal taking into account pii
// m = rho_mu*(m(-1) - pii) - (1 - rho_mu)*(kappa_pii*pii + kappa_y*y) + xi_mu;
// Below specificatino depends on defintion of above money demand equation: if m is real (nominal) money then the central bank provides real (nominal) m balances to HHs
// assuming real m generates an equivalence result under osr with that of taylor rule
// m = rho_mu*(m(-1)) - (1 - rho_mu)*(kappa_pii*pii + kappa_y*y) + xi_mu;

// AR(1) processes for shocks
xi_z = rho_z*xi_z(-1) + epsilon_z;  // Technology shock
xi_p = rho_p*xi_p(-1) + epsilon_p;  // Price shock
// xi_mu = rho_mu*xi_mu(-1) + epsilon_mu;  // Money supply shock -> assumes AR(1) process ; for money supply rule convert to i.d.d
// xi_i = epsilon_i;  // i.i.d monetary policy shock -> can convert to AR(1) to check difference
xi_i = rho_iexo*xi_i(-1) + epsilon_i;  //

// Flexible price equilibrium
yn = cn;

// Uncomment to include production function with labour. You need to add nn as variable above
// yn = nn + xi_z;

// Labour market clearing in flexible price equilibrium
(eta_n + eta_c)*yn = (1 + eta_n)*xi_z;

// Flexible price Euler equation
cn = cn(+1) - (1/eta_c)*rn;

// Uncomment to include money demand in flexible price equilibrium
// mn = (eta_c/eta_m)*cn - (1/eta_m)*(1/iss)*rn;

// Output gap
ygap = y - yn;

// Real money supply
mreal = m - p; % to see what indetermincy of p looks like, plot m and p seperately

end;

// Define shocks for simulation // at least one shock
shocks;
 var epsilon_z = sigmaz^2;  // Variance of technology shock
 var epsilon_p = sigmap^2;  // Variance of price shock
 var epsilon_i = sigmai^2;  // Variance of monetary policy shock
// var epsilon_mu = sigmamu^2;  // Variance of money supply shock
end;

// Compute steady state and check model
 steady;
 check;

// Simulate model
stoch_simul(order=1, irf=40, graph_format=fig) y ygap mreal r int pii mc x c xi_z xi_p m p rn; //ygap pii int r; // xi_p; // , periods=150

// The code below estimates optimal parameters in the policy rule (given below), given weights on target variables, to minimise quadratic loss function 
// comment out int to get optimal policy params where no restriction on int rate volatility (int weight of 1 implies monetary authority prefers interest rate smoothing)
%optim_weights;
%ygap ((1 - theta_p)*(1 - betta*theta_p)/theta_p)*(eta_n + eta_c); // = kappa*(eta_n + eta_c)) = 0.2582 // 1; 
%pii 1;
//int 1; %% add weight on interest rate to see how optimal param values change with and without rho_i as on osr_param
%end;

// remove rho_i when not concerned about smoothing
% osr_params kappa_pii kappa_y  ; // rho_i rho_mu
% osr(order=1, irf=40, graph_format=fig) ygap pii int r;