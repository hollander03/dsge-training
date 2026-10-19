//Money in flexible price environments: MIU model with labour

var y c x k n m r int pii z mu;

varexo epsilon_z epsilon_mu;

parameters alppha betta delta eta_c eta_m eta_n theta_m nss rho_z rho_mu phi_z sigmaz sigmamu a ;

a = 0.01;        // require less than 0.01 for MIU to match money shock in CIA // 0.9 cons share relative to money in utility func
alppha = 0.36;  //0.33
betta = 0.989;   //
delta = 0.019;  //0.025

eta_c = 2;      //2
eta_m = 3;      //
eta_n = 1;      // Inverse of the Frisch elasticity of labour supply
theta_m = 0.01; // steady state money growth rate
nss = 0.3333;       // steady state labour 1/3 p. 71 Walsh.

rho_z = 0.95;     //  tech shock
rho_mu = 0.75;    //  money shock
phi_z = 0;      //   endogenous evolotion of money supply in resp to tech shock
sigmaz = 0.01; // 0.34 make 0.01 to corresp with basicrbc_sims instead of data implies 0.017
sigmamu = 0.01; // 0.9 make 0.01 to corresp with basicrbc_sims instead of data implies 0.017


model(linear);

#rss = 1/betta - 1;   // steady state real rate
#piss = theta_m;  // steady state inflation rate
#iss = (1 + piss - betta)/betta;    // steady state nominal rate
#YK = (1/alppha)*(rss + 1 - (1 - delta));  // output-capital ratio
#CK = YK - delta;                  // cons-capital ratio
#NK = (YK)^(1/(1-alppha));         //emply-capital ratio

#MC = ((a/(1-a))*(iss/(1 + iss)))^(-(1/eta_m));   // steady state money-consumption ratio   
#NL = nss/(1-nss);               // labour-leisure steady state ratio

#gam = 1/(1 + ((1- a)/a)*((MC)^(1 - eta_m)));
#omega_one = gam*eta_c + (1 - gam)*eta_m;
#omega_two = (eta_m - eta_c)*(1 - gam);


y = z + alppha*k(-1) + (1 - alppha)*n;      // production function with labour

YK*y = CK*c + delta*x;                     // Aggregate Resource

k = (1-delta)*k(-1) + delta*x;             // cap acc eqn

r = alppha*(YK)*(y(+1) - k);            // return on capital // MP_capital

omega_one*c = omega_one*c(+1) - (r + omega_two*(m(+1) - m));    // consumption Euler eqn

y - (omega_one*c - omega_two*m) = (1 + eta_n*NL)*n;       // FOC for labour

int = r + pii(+1);                                    // Fisher Eqn

m = c - (1/eta_m)*(1/iss)*int;                       // money demand function

m = m(-1) - pii + mu;                               // money growth rule        

z = rho_z*z(-1) + epsilon_z;                     // AR(1) Technology stochastic process
mu = rho_mu*mu(-1) + phi_z*z(-1) + epsilon_mu;   // AR(1) Money supply shock


end;

// define shocks for simulation

shocks;
var epsilon_z = sigmaz^2;  // stderr 0.017; // var(epsilon) = 0.017^2
var epsilon_mu = sigmamu^2;  // stderr 0.017; // var(epsilon) = 0.017^2
end;

steady;
check;

stoch_simul(order=1,irf=22); // , periods=150

