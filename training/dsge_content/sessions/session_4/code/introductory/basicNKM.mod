//Money in flexible price environments: MIU model with labour

var y c m r int pii mc x xi_z xi_p 
    yn cn  rn ygap ; //  xi_i n xi_mu   mn

varexo epsilon_z epsilon_p epsilon_i ; // epsilon_mu

parameters  betta delta eta_c eta_m eta_n theta_p kappa_pii kappa_y rho_z rho_p rho_i rho_mu phi_z sigmaz sigmap sigmai sigmamu;

betta = 0.989;   //
delta = 0.019;  //0.025

eta_c = 2;      //2
eta_m = 3;      //
eta_n = 1;      // Inverse of the Frisch elasticity of labour supply
theta_p = 0.75; // steady state money growth rate

kappa_pii = 1.5;  // MP response to inflation
kappa_y = 0.35;   //MP response to output

rho_z = 0.95;     //  tech shock
rho_p = 0.75;    //  price shock
rho_i = 0.75;    // MP shock
phi_z = 0;      //   endogenous evolotion of money supply in resp to tech shock
rho_mu = 0.75;
sigmaz = 0.01; //  0.34 make 0.01 to corresp with basicrbc_sims instead of data implies 0.017
sigmamu = 0.01; // 0.09 make 0.01 to corresp with basicrbc_sims instead of data implies 0.017
sigmap = 0.01; // make 0.01 to corresp with basicrbc_sims instead of data implies 0.017
sigmai = 0.01;


model(linear);

#kappa = (1 - theta_p)*(1 - betta*theta_p)/theta_p;  
#iss = 1/betta;  // with zero steady state inflation iss = rss

y = c;                     // Aggregate Resource

//y = n + xi_z;                 // production function with labour

c = c(+1) - (1/eta_c)*r;    // consumption Euler eqn

m = (eta_c/eta_m)*c - (1/eta_m)*(1/iss)*int;      // money demand function

int = r + pii(+1);                                    // Fisher Eqn

pii = betta*pii(+1) + kappa*mc + xi_p;               // NK phillips curve rule        

mc = (eta_n + eta_c)*y - (1 + eta_n)*xi_z;      // real marginal cost eqn

x = -mc;                                        // markup equals the inverse of the real marginal cost

%% int = rho_i*int(-1) + (1 - rho_i)*(kappa_pii*pii + kappa_y*y) + epsilon_i;    // MP int rate rule with iid shock
int = rho_i*int(-1) + (1 - rho_i)*(kappa_pii*pii + kappa_y*ygap) + epsilon_i;    // MP int rate rule with iid shock

//m = rho_mu*(m(-1) - pii) - (1 - rho_mu)*(kappa_pii*pii + kappa_y*y) + epsilon_mu;                               // money growth rule  

xi_z = rho_z*xi_z(-1) + epsilon_z;                     // AR(1) Technology stochastic process
xi_p = rho_p*xi_p(-1) + epsilon_p;                    // AR(1) price shock
//xi_mu = rho_mu*xi_mu(-1) + epsilon_mu;                // AR(1) Money supply shock
//xi_i = epsilon_i;                                     // iid MP shock


%%%%% FLEX PRICE EQUIL %%%%%

yn = cn;                     // Aggregate Resource

//yn = nn + xi_z;                 // production function with labour
(eta_n + eta_c)*yn = (1 + eta_n)*xi_z;   // 

cn = cn(+1) - (1/eta_c)*rn;    // consumption Euler eqn

%% mn = (eta_c/eta_m)*cn - (1/eta_m)*(1/iss)*rn;      // money demand function

ygap = y - yn;

%%%% FLEX PRICE EQUIL %%%%%

end;

// define shocks for simulation

shocks;
var epsilon_z = sigmaz^2;  // stderr 0.017; // var(epsilon) = 0.017^2
//var epsilon_p = sigmap^2;  // stderr 0.017; // var(epsilon) = 0.017^2
//var epsilon_i = sigmai^2;  // stderr 0.017; // var(epsilon) = 0.017^2
//var epsilon_mu = sigmamu^2;  // stderr 0.017; // var(epsilon) = 0.017^2
end;

steady;
check;

stoch_simul(order=1,irf=22); // , periods=150

