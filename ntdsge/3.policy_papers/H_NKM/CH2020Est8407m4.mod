//MIU model with labour. With output gap --> natural (flexible) output + natural rate. 
// mvpyEst5907.mod runs with money supply shock in NBR equation
// mvpyEst5907Hetzel.mod model has money supply shock in money supply equation
// mvpyEst8407.mod runs with money supply shock in NBR equation
// mvpyEst.mod model has money supply shock in money supply equation
// 2018 version rerun with divisia MZM series 
// #option 1: annualized 3mtb and y-on-y pi (this option)
// #option 2: quarterly 3mtb and q-on-q pi
// #option 3: re-run original with seasonally adjusted series for MZM from St. Loius FRED MAIN
// NOTE: qualitatively very similar...some descrepancy for latent path of m... note crucial for argument
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

var m v p y r int int_T pii ytilde yn rn rmc h fr xi_z xi_ms xi_md n ytilde_obs pii_obs int_obs m_obs ; // xi_v xi_p rr_obs rr

varexo epsil_z epsil_i epsil_ms epsil_md;  // epsil_v epsil_p

parameters alppha betta eta_c eta_m eta_n theta_p
           nu_h nu_fr rho_h rho_fr FR RR s
           rho_z rho_i rho_ms rho_md  
           kapa_pi kapa_y
           ytilde_ss pii_ss int_ss m_ss ; // rho_v rr_ss rho_p

alppha = 0.67;  // 1 - 0.33
betta = 0.98;   //

eta_c = 2;      // 
eta_m = 3;      // see Walsh
eta_n = 1;      // Inverse of the Frisch elasticity of labour supply
theta_p = 0.75; // price stickiness
//nss = 0.3333; // steady state labour 1/3 p. 71 Walsh.

rho_h = 0.9;   //  nonborrowed reserve persistence 
rho_fr = 0.9;  //  free reserves shock
nu_h = 1;       // elasticity of nonborrowed reserves to nominal interest rate 100
nu_fr = 5;      // elasticity of free reserves to nominal interest rate        500
s = 0.01;      // corridor spread

//FR = 0.12;       // 1959/31 to 2007/Q3 0.120358 //
//RR = 38.62;        // 1959/Q1 to 2007/Q3 38.61817  //  
FR = 0.827;       // 1984/01 to 2007/11 0.827 // 2007/12 to 2016/10 1483.359377 (FR break) //
RR = 48.6;        // 1984/01 to 2007/11 48.6  // 2007/12 to 2016/10 101.6565283 (FR break) // 
//FR = 1483.36;       // 1984/01 to 2007/11 0.827 // 2007/12 to 2016/10 1483.359377 (FR break) //
//RR = 101.66;        // 1984/01 to 2007/11 48.6  // 2007/12 to 2016/10 101.6565283 (FR break) //

kapa_pi = 1.5;
kapa_y = 0.5;

rho_z = 0.9;     //  tech shock
//rho_p = 0.9;     //  price markup shock
rho_ms = 0.9;    //  money (reserve) supply shock
rho_md = 0.9;    //  money demand shock
rho_i = 0.9;       //  interest rate smoothing

%%% 1959--2019
//ytilde_ss = -0.0093688;  // 59-07 -0.005308
//pii_ss = 0.03175933;  // 0.0356682 59-07 
//int_ss = 0.0451627;  // 0.054865159-07 
//m_ss = 0.00992075210478;   // Div M4 qq // Div M4 yy 0.03972039795663 (1960-2019)
////rr_ss = -0.0129053;

%%% 1959--2007
//ytilde_ss = -0.006044476;  // 59-07 -0.005308
//pii_ss = 0.035619575;  // 0.0356682 59-07 
//int_ss = 0.0548643;  // 0.054865159-07 
//m_ss = 0.01095515;   // Div M4 qq //  Div M4 yy 0.04404494548513  (1960-2007) 
////rr_ss = -0.0129053;

%%% 1984--2007
ytilde_ss = -0.009089628;   // -0.00759341
pii_ss = 0.0247584962;      // 0.024899295
int_ss = 0.049102807;       // 0.049106316
m_ss = 0.01126364;              // Div M4 qq   // Div M4 yy 0.04481255385396 (1984-2007)
////rr_ss = -0.01728564;  // Div m4yy (07-19) 0.02286348820268

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

pii = betta*pii(+1) + kapatilde*ytilde;                // Phillips Curve

rmc = (1 + eta_n)*n + (eta_c - 1)*y;                   // labour market equilibrium and real marginal cost

rn = eta_c*(yn(+1) - yn);                              // natural rate

ytilde = y - yn;                                       // output gap

yn = ((1 + eta_n)/(eta_c + eta_n))*xi_z;               // natural (flexible) output

pii = p - p(-1);                                       // inflation defintion

m = h + (1/effrr)*(h - fr) + xi_ms;                    // money supply function                    

h = rho_h*h(-1) - nu_h*(int - int_T);                  // money (reserve) growth rule      

fr = rho_fr*fr(-1) - (nu_fr/s)*(int - int_T);          // free reserve growth rule  

int_T = rho_i*int_T(-1) + (1 - rho_i)*(kapa_pi*pii + kapa_y*ytilde) + epsil_i; // Monetary Policy rule

%%%%%%% Shocks %%%%%%%%

xi_z = rho_z*xi_z(-1) + epsil_z;           // AR(1) Technology stochastic process
//xi_p = rho_p*xi_p(-1) + epsil_p;           // AR(1) price markup stochastic process
//xi_i = rho_i*xi_i(-1) + epsil_i;         // AR(1) Interest rate stochastic process 
xi_ms = rho_ms*xi_ms(-1) + epsil_ms;       // AR(1) money (reserve) supply shock stochastic process    
xi_md = rho_md*xi_md(-1) + epsil_md;       // AR(1) money (reserve) demand stochastic process    
//rr = rho_p*rr(-1) + epsil_p;
                                                      

%%%%%-----Measurement equations-----%%%%%%

ytilde_obs = ytilde + ytilde_ss;
pii_obs = pii + pii_ss;
int_obs = int + int_ss;
m_obs = m - m(-1) + m_ss;
//rr_obs = rr - rr(-1) + rr_ss;

end;

steady;
check;

shocks;

var epsil_z; stderr 0.01; // var(epsil) = 0.01^2
//var epsil_p; stderr 0.01; // var(epsil) = 0.01^2
var epsil_i; stderr 0.01; // var(epsil) = 0.01^2
var epsil_ms; stderr 0.01; // var(epsil) = 0.01^2
var epsil_md; stderr 0.01; // var(epsil) = 0.01^2

end;



%------------------------------------------------------------------------------------------------------------------------
% 8.  Estimated paramaters // Impulse responses
%------------------------------------------------------------------------------------------------------------------------

estimated_params;

  %%Households
    eta_c, normal_pdf, 2, 0.5;       // coefficient of relative risk aversion
    eta_m, normal_pdf, 5, 0.2;           // inverse of interest elasticity of money demand
    eta_n, normal_pdf, 1, 0.2;           // Inverse of wage elasticity of labour supply

  %%Firms
    alppha, beta_pdf, 0.67, 0.05;           // labour share in production
    theta_p, beta_pdf, 0.75, 0.05;           // domestic price stickiness

  %%Monetary Regime
    nu_h, inv_gamma_pdf, 1, 10;       // elasticity of nonborrowed reserves to nominal interest rate 100
    nu_fr, inv_gamma_pdf, 10, 10;      // elasticity of free reserves to nominal interest rate        500
    rho_h, beta_pdf, 0.8, 0.1;   //  nonborrowed reserve persistence 
    rho_fr, beta_pdf, 0.8, 0.1;  //  free reserves shock

  %%Monetary Policy function
    kapa_pi, gamma_pdf, 1.5, 0.2;        // Taylor rule coefficient on pi
    kapa_y, beta_pdf, 0.5, 0.2;          //  Taylor rule coefficient on y

  %%coefficients of AR(1) shocks
    rho_z, beta_pdf, 0.8, 0.1;           // productivity shock persistance parameter
    //rho_p, beta_pdf, 0.8, 0.1;           // money demand shock !!!!!
    rho_i, beta_pdf, 0.8, 0.1;           // MP policy shock smoothing
    rho_ms, beta_pdf, 0.8, 0.1;          // money (reserve) supply shock
    rho_md, beta_pdf, 0.8, 0.1;           //  effective reserve requirement (money demand) shock --- see Eq. 23, p. 16

  %%innovations of the 5 shocks
    stderr epsil_z, inv_gamma_pdf, 0.02, 2;            // (1)  productivity shock
    //stderr epsil_p, inv_gamma_pdf, 0.02, 2;            // (2) money demand shock !!!!!
    stderr epsil_i, inv_gamma_pdf, 0.02, 2;            // (3) policy rate rule shock
    stderr epsil_ms, inv_gamma_pdf, 0.02, 2;           // (4) money (reserve) supply shock
    stderr epsil_md, inv_gamma_pdf, 0.02, 2;           // (5) money (reserve) demand shock  

end;

varobs ytilde_obs pii_obs int_obs m_obs;  // rr_obs

//load_mh_file, mode_file=CH2017mvpyEst8407Hetzel_mode, 
// CH2018Estimation5907ann incl updated MZM divisia series // CH2018Estimation5907ann VS CH2016Estimation5907 (%%% NB change ss values),  CH2016Estimation8407
//conditional_variance_decomposition=[1:20], forecast=8,  mode_file=CH2017mvpyEst5907Hetzel_mode, 
// //  

estimation(datafile=CH2020Estimation5919m4, first_obs=101 , nobs=94, mh_nblocks=3, mh_drop=0.5, mh_replic=100000, mh_jscale=0.375, // load_mh_file, 
           mode_compute=0, mode_file=CH2020Est8407_mode, mode_check, bayesian_irf, irf=20, moments_varendo, conditional_variance_decomposition=[1:20],
           graph_format=fig) m v p y int pii r ytilde h fr n;

// Shock Decomposition option

shock_groups(name=groups);
'Technology' = epsil_z;
'Interest rate' = epsil_i;  
'Money supply' = epsil_ms;   
'Money demand' = epsil_md;     
end;

//// Shock Decomposition option
 shock_decomposition(colormap=jet) m v p y int_obs pii_obs r ytilde_obs m_obs;    // rr_obs
 plot_shock_decomposition(graph_format=(fig), use_shock_groups=groups, colormap=jet, steadystate) m v p y int_obs pii_obs r ytilde_obs m_obs;

// //see HLbEstIdentification.mod for identification example
// //identification(parameter set = prior mode);
identification(advanced=1, max_dim_cova_group=2);
