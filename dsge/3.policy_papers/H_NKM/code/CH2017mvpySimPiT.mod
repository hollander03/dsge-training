// MIU model with labour. With output gap --> natural (flexible) output + natural rate.

// RUNS: mvpyEst8407test.mod with money supply shock in money supply equation & price markup shock
// mvpyEst8407Hetzel.mod model with money supply shock in money supply equation & no price markup shock
// simulation model based on: CH2017mvpySimGFC.mod. Test target inflation shock: introduce AR(1) variable: piT

var m v p y r int int_T pii ytilde yn rn  h fr xi_z xi_ms xi_md xi_fr rmc n piiT; // xi_v 

varexo epsil_z epsil_i epsil_ms epsil_md epsil_fr epsil_PiiT;  // epsil_v 

parameters alppha betta eta_c eta_m eta_n theta_p
           nu_h nu_fr rho_h rho_fr FR RR s
           rho_z rho_i rho_ms rho_md rho_frs rho_PiiT
           kapa_pi kapa_y; // rho_v 

alppha = 0.668;  // 1 - 0.33
betta = 0.98;    //

eta_c = 3.39;   // 
eta_m = 5.094;    // see Walsh
eta_n = 0.972;    // Inverse of the Frisch elasticity of labour supply
theta_p = 0.868; // price stickiness
//nss = 0.3333;  // steady state labour 1/3 p. 71 Walsh.

rho_h = 0.413;   //  nonborrowed reserve persistence 
rho_fr = 0.184;  //  free reserves shock
nu_h = 11.51;   // 11.51 elasticity of nonborrowed reserves to nominal interest rate 100
nu_fr = 12;  // 11.61 elasticity of free reserves to nominal interest rate        500
s = 0.01;        // corridor spread

//FR = 0.12;     // 1959/31 to 2007/Q3 0.120358 //
//RR = 38.62;    // 1959/Q1 to 2007/Q3 38.61817  //  
FR = 0.827;      // 1984/01 to 2007/11 0.827 // 
RR = 48.6;       // 1984/01 to 2007/11 48.6  // 
//FR = 1483.36;    // 2007/12 to 2016/10 1483.359377 (FR break) //
//RR = 101.66;     // 2007/12 to 2016/10 101.6565283 (FR break) //

kapa_pi = 1.486;
kapa_y = 0.530;

rho_z = 0.756;   //  tech shock
rho_frs = 0.75;   // free reserve shock
rho_ms = 0.759;   //  money (reserve) supply shock
rho_md = 0.992;  //  money demand shock
rho_i = 0.996;   //  interest rate smoothing
rho_PiiT = 0.999; // pi target shock


model(linear);

#kapa = ((1-theta_p)*(1-theta_p*betta))/(theta_p);
#kapatilde = kapa*(eta_n + eta_c);
#effrr = 1/(FR/RR);   //  pre-GFC 0.017 vs. post-GFC 14.5919  #rr = 0.04679;  // prev=0.12. 1985-2007 = 0.04679
//#effrr = 0.12;

int = pii(+1) + (rn + eta_c*(ytilde(+1) - ytilde));    // Fisher Eqn unbounded
//int = max(pii(+1) + (rn + eta_c*(ytilde(+1) - ytilde)),0);    // Fisher Eqn   bounded

m - p = (eta_c/eta_m)*y - (1/eta_m)*int + xi_md;       // money demand function - xi_md shock captured by effective res. req. (rr)

v = (1/eta_m)*int + (1 - (eta_c/eta_m))*y;             // velocity derived from Equation of Exchange - xi_v

r = rn + eta_c*(ytilde(+1) - ytilde);                  // consumption Euler eqn

y = xi_z + alppha*n;                                   // production function with labour

//pii = betta*pii(+1)+ kapatilde*ytilde;                // Phillips Curve
(pii - piiT) = betta*(pii(+1) - piiT(+1)) + kapatilde*ytilde;                // Phillips Curve

rmc = (1 + eta_n)*n + (eta_c - 1)*y;                   // labour market equilibrium and real marginal cost

rn = eta_c*(yn(+1) - yn);                              // natural rate

ytilde = y - yn;                                       // output gap

yn = ((1 + eta_n)/(eta_c + eta_n))*xi_z;               // natural (flexible) output

//pii = p - p(-1);                                       // inflation defintion
(pii - piiT)  = p - p(-1);                               // inflation defintion assuming nonzero `Pitarget'

m = h + (1/effrr)*(h - fr) + xi_ms;                    // money supply function                    

h = rho_h*h(-1) - nu_h*(int - int_T);                  // money (reserve) growth rule      

fr = rho_fr*fr(-1) - (nu_fr/s)*(int - int_T) ;   // - xi_fr       // free reserve growth rule  

int_T = rho_i*int_T(-1) + (1 - rho_i)*(kapa_pi*(pii - piiT) + kapa_y*ytilde) + epsil_i; // Monetary Policy rule

%%%%%%% Shocks %%%%%%%%

xi_z = rho_z*xi_z(-1) + epsil_z;           // AR(1) Technology stochastic process
xi_fr = rho_frs*xi_fr(-1) + epsil_fr;           // AR(1) price markup stochastic process
//xi_i = rho_i*xi_i(-1) + epsil_i;         // AR(1) Interest rate stochastic process 
xi_ms = rho_ms*xi_ms(-1) + epsil_ms;       // AR(1) money (reserve) supply shock stochastic process    
xi_md = rho_md*xi_md(-1) + epsil_md;       // AR(1) money (reserve) demand stochastic process    
piiT = rho_PiiT*piiT(-1) - epsil_PiiT;     // negative AR(1) inflation target shock 1000 quarter persistence.

end;

shocks;

//var epsil_z; stderr 0.0372; // var(epsil) = 0.01^2
////var epsil_fr; stderr 0.0025; // var(epsil) = 0.01^2
//var epsil_i; stderr 0.0044; // var(epsil) = 0.01^2
//var epsil_ms; stderr 0.0717; // var(epsil) = 0.01^2
//var epsil_md; stderr 0.0135; // var(epsil) = 0.01^2
var epsil_PiiT; stderr 0.01; // var(epsil) = 0.01^2

end;

steady;
check;

stoch_simul(order=1, irf=40, graph_format=fig); // periods=100000,