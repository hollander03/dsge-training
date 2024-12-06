// Money in Flexible Price Environments: MIU Model with Labour

// Declare variables
var y c m r int pii mc x xi_z xi_p 
    yn cn rn ygap; // xi_i n xi_mu mn

// Declare exogenous shocks
varexo epsilon_z epsilon_p epsilon_i; // epsilon_mu

// Define parameters
parameters betta delta eta_c eta_m eta_n theta_p kappa_pii kappa_y rho_z rho_p rho_i rho_mu phi_z sigmaz sigmap sigmai sigmamu;

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
rho_i = 0.75;            // Persistence of monetary policy shock
rho_mu = 0.75;           // Persistence of money supply shock
phi_z = 0;               // Endogenous money supply response to tech shock
sigmaz = 0.01;           // Std. dev. of technology shock
sigmap = 0.01;           // Std. dev. of price shock
sigmai = 0.01;           // Std. dev. of monetary policy shock
sigmamu = 0.01;          // Std. dev. of money supply shock

// Model equations
model(linear);

// Auxiliary equations
# kappa = (1 - theta_p)*(1 - betta*theta_p)/theta_p;  // Price adjustment factor
# iss = 1/betta;                                     // Steady-state nominal interest rate

// Aggregate resource constraint
y = c; 

// Uncomment to include production function with labour. You need to add n as variable above
// y = n + xi_z;

// Consumption Euler equation
c = c(+1) - (1/eta_c)*r;

// Money demand function
m = (eta_c/eta_m)*c - (1/eta_m)*(1/iss)*int;

// Fisher equation
int = r + pii(+1);

// New Keynesian Phillips curve
pii = betta*pii(+1) + kappa*mc + xi_p;

// Real marginal cost equation
mc = (eta_n + eta_c)*y - (1 + eta_n)*xi_z;

// Markup equation
x = -mc;

// Monetary policy rule
// Uncomment to include output (y) in the policy rule
// int = rho_i*int(-1) + (1 - rho_i)*(kappa_pii*pii + kappa_y*y) + epsilon_i;
int = rho_i*int(-1) + (1 - rho_i)*(kappa_pii*pii + kappa_y*ygap) + epsilon_i;
// int = rn + (kappa_pii*pii + kappa_y*ygap) + epsilon_i;

// Uncomment to include money growth rule
// m = rho_mu*(m(-1) - pii) - (1 - rho_mu)*(kappa_pii*pii + kappa_y*y) + epsilon_mu;

// AR(1) processes for shocks
xi_z = rho_z*xi_z(-1) + epsilon_z;  // Technology shock
xi_p = rho_p*xi_p(-1) + epsilon_p;  // Price shock
// xi_mu = rho_mu*xi_mu(-1) + epsilon_mu;  // Money supply shock
// xi_i = epsilon_i;  // IID monetary policy shock

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

end;

// Define shocks for simulation
shocks;
 var epsilon_z = sigmaz^2;  // Variance of technology shock
// var epsilon_p = sigmap^2;  // Variance of price shock
 var epsilon_i = sigmai^2;  // Variance of monetary policy shock
// var epsilon_mu = sigmamu^2;  // Variance of money supply shock
end;

// Compute steady state and check model
 steady;
 check;

// Simulate model
% stoch_simul(order=1, irf=40) ygap pii int r; // xi_p; // , periods=150

optim_weights;
ygap 1; // kappa*(eta_n + eta_c))/10;
pii 1;
end;

osr_params kappa_pii kappa_y ; 
osr(order=1, irf=40, graph_format=fig) ygap pii int r;