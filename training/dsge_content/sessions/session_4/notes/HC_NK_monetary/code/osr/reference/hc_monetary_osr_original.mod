//MIU model with labour. With output gap --> natural (flexible) output + natural rate.

// RUNS: mvpyEst8407test.mod with money supply shock in money supply equation & price markup shock
// mvpyEst8407Hetzel.mod model with money supply shock in money supply equation & no price markup shock

var m v p y r int int_T pii ytilde yn rn rmc h fr xi_z xi_ms n xi_md nomy xi_p; // xi_v

varexo epsil_z epsil_i epsil_ms epsil_md epsil_p;  // epsil_v

parameters alppha betta eta_c eta_m eta_n theta_p varepsilon
           nu_h nu_fr rho_h rho_fr FR RR s
           rho_z rho_i rho_ms rho_md rho_p
           kapa_pi kapa_y; // rho_v

alppha = 0.675;  // 1 - 0.33
betta = 0.98;    //

eta_c = 3.635;   //
eta_m = 4.92;    // see Walsh
eta_n = 0.98;    // Inverse of the Frisch elasticity of labour supply
theta_p = 0.873; // price stickiness
//nss = 0.3333;  // steady state labour 1/3 p. 71 Walsh.
varepsilon = 10; // steady state price elasticity --> 10% markup

rho_h = 0;   // 0.437  nonborrowed reserve persistence
rho_fr = 0;  // 0.201 free reserves shock
nu_h = 0;   // 11.374 elasticity of nonborrowed reserves to nominal interest rate 100
nu_fr = 0;  // 12.239 elasticity of free reserves to nominal interest rate        500
s = 0.01;        // corridor spread

//FR = 0.12;     // 1959/31 to 2007/Q3 0.120358 //
//RR = 38.62;    // 1959/Q1 to 2007/Q3 38.61817  //
FR = 0.827;      // 1984/01 to 2007/11 0.827 //
RR = 48.6;       // 1984/01 to 2007/11 48.6  //
//FR = 1483.36;    // 2007/12 to 2016/10 1483.359377 (FR break) //
//RR = 101.66;     // 2007/12 to 2016/10 101.6565283 (FR break) //

kapa_pi = 1.5;
kapa_y = 0.529;

rho_z = 0.763;   //  tech shock
rho_p = 0.75;   //  price markup shock
rho_ms = 0.77;   //  money (reserve) supply shock
rho_md = 0.992;  //  money demand shock
rho_i = 0.996;   //  interest rate smoothing


model(linear);

#kapa = ((1-theta_p)*(1-theta_p*betta))/(theta_p);
#kapatilde = kapa*(eta_n + eta_c);
#effrr = 1/(FR/RR);   //  pre-GFC 0.017 vs. post-GFC 14.5919  #rr = 0.04679;  // prev=0.12. 1985-2007 = 0.04679
//#effrr = 0.12;

int = pii(+1) + (rn + eta_c*(ytilde(+1) - ytilde));    // Fisher Eqn

m - p = (eta_c/eta_m)*y - (1/eta_m)*int + xi_md;       // money demand function - xi_md shock captured by effective res. req. (rr)

v = (1/eta_m)*int + (1 - (eta_c/eta_m))*y;             // velocity derived from Equation of Exchange - xi_v

r = rn + eta_c*(ytilde(+1) - ytilde);                  // consumption Euler eqn

y = xi_z + alppha*n;                                   // production function with labour

pii = betta*pii(+1) + kapatilde*ytilde + xi_p;                // Phillips Curve

rmc = (1 + eta_n)*n + (eta_c - 1)*y;                   // labour market equilibrium and real marginal cost

rn = eta_c*(yn(+1) - yn);                              // natural rate

ytilde = y - yn;                                       // output gap

yn = ((1 + eta_n)/(eta_c + eta_n))*xi_z;               // natural (flexible) output

pii = p - p(-1);                                       // inflation defintion

m = h + (1/effrr)*(h - fr) + xi_ms;                    // money supply function
//m = h + xi_ms;                                         // money supply function (no FR)

//h = rho_h*h(-1) - nu_h*(int - int_T);                  // money (reserve) growth rule
//h = rho_h*h(-1) - nu_h*(int - int_T) - (1 - rho_h)*(kapa_pi*pii + kapa_y*ytilde);  // money (reserve) growth rule with velocity offset
h = - v;

fr = rho_fr*fr(-1) - (nu_fr/s)*(int - int_T);            // free reserve growth rule

int_T = rho_i*int_T(-1) + (1 - rho_i)*(kapa_pi*pii + kapa_y*ytilde) + epsil_i; // Monetary Policy rule
//int_T = rn + kapa_pi*pii + kapa_y*ytilde; // modified Taylor rule for optimal policy

//int_T = rho_i*int_T(-1) + (1 - rho_i)*(p + y) + epsil_i; // Monetary Policy Nominal Income Targetting rule
//int_T = 0; // No Monetary rule (or constant rule)

//ytilde = - varepsilon*pii; // optimal poicy under discretion --> replace Taylor rule int_T
//ytilde = - varepsilon*p; // optimal poicy under commitment --> replace Taylor rule int_T

nomy = p + y;

%%%%%%% Shocks %%%%%%%%

xi_z = rho_z*xi_z(-1) + epsil_z;           // AR(1) Technology stochastic process
xi_p = rho_p*xi_p(-1) + epsil_p;           // AR(1) price markup stochastic process
//xi_i = rho_i*xi_i(-1) + epsil_i;         // AR(1) Interest rate stochastic process
xi_ms = rho_ms*xi_ms(-1) + epsil_ms;       // AR(1) money (reserve) supply shock stochastic process
xi_md = rho_md*xi_md(-1) + epsil_md;       // AR(1) money (reserve) demand stochastic process

end;

shocks;

//var epsil_z; stderr 0.038; // var(epsil) = 0.01^2
var epsil_p; stderr 0.01; // 0.0025 fr var(epsil) = 0.01^2
//var epsil_i; stderr 0.005; // var(epsil) = 0.01^2
//var epsil_ms; stderr 0.079; // var(epsil) = 0.01^2
//var epsil_md; stderr 0.018; // var(epsil) = 0.01^2

end;

steady;
check;

//stoch_simul(order=1, irf=20, graph_format=fig); // , periods=150

//stoch_simul(order=1, irf=40, graph_format=fig) ytilde pii nomy int p m v y int_T; // , periods=150

optim_weights;
ytilde ((((1-theta_p)*(1-theta_p*betta))/(theta_p))*(eta_n + eta_c))/10;
pii 1;
end;

osr_params rho_h rho_i kapa_y kapa_pi; // nu_h rho_h rho_i rho_fr kapa_y kapa_pi
osr(order=1, irf=40, graph_format=fig) ytilde pii nomy int p m v y int_T;

//planner_objective(pii^2 + (((((1-theta_p)*(1-theta_p*betta))/(theta_p))*(eta_n + eta_c))/10)*ytilde^2);
//discretionary_policy(planner_discount=0.98, order=1, instruments=(h)) ytilde pii nomy int p m v y int_T; //

//ramsey_policy(planner_discount=0.98, order=1, instruments=(h, int_T));
//eliminate_lagrange_multipliers;
