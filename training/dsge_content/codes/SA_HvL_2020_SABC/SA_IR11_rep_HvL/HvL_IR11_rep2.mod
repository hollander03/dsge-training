//Replication file
//Ireland, Peter N. (2011): A New Keynesian Perspective on the Great Recession,
//      Journal of Money, Credit and Banking, Vol.43, No.1, 31-54.
//small-scale New Keynesian model
//implemented by M.Jancokova
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%% MP rule for model comparisons: interest rate responds to deviations of inflation and output growth from steady
%%%%%%%%% Ireland model: no MP trade-off wrt smoothing...does not solve
%%%%%%%%% THIS VERSION converts parameter names and specs wrt NK-SW model --> NKPC and Taylor-rule
%%%%%%%%% same as Gerali etal 2010, GHW2018; similar to Ireland2011
%% Estimation Period: 1995Q1 - 2017Q2
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

var b lambda y a r pi p yg q ygap inflationa interesta y_obs pi_obs r_obs; // Z_au

varexo epsb epsp epsa epsr;

parameters phi gamma_p rhor rhopi rhoyg rhob rhop zeta beta theta y_ss pi_ss r_ss; 

//Note: the cost-push shock and some related parameters are renormalized to make the 
//          innovation normally distributed with mean zero (see page 40 in the paper)

//estimated parameters (maximum likelihood estimates from Ireland; initial values)
phi=0.6;       //habit formation parameter
gamma_p=0.4;             //indexation parameter, for gamma_p=0 the price setting is purely forward looking
rhopi=2;       //response coefficient of the Taylor rule
rhoyg=1.5;        //response coefficient of the Taylor rule
rhor=0.85;           //persistence in MP rule // int rate smoothing parameter
rhob=0.81;        //persistence in the preference shock
rhop=0.45;             //persistence in the renormalized cost-push shock
theta=0.7;         //Phillips Curve Calvo parameter

%%%%% original Ireland psi equals ((1-theta)*(1-theta*beta))/theta in SW-NK and NKPC with calvo-type prices
%%%%% estimated psi = approx 0.58647 using matlab numerical solver

//calibrated parameters
zeta=1.002385353;     //drift of the AR(1) technology process
beta=0.994129;        //discount factor

y_ss = 0.00238535346;
pi_ss = 0.013976856;
r_ss = 0.022398;

model(linear);

//c=y;

//law of motion for the preference shock
b = rhob*b(-1) + epsb;

//marginal utility of consumption in terms of past, present and expected future output with habit formation in preferences
(zeta - beta*phi)*(zeta-phi)*lambda = phi*zeta*y(-1) - (zeta^2 + beta*phi^2)*y + beta*phi*zeta*y(+1) 
                                      + (zeta - beta*phi*rhob)*(zeta - phi)*b - phi*zeta*a;

//IS curve
lambda = r + lambda(+1) - pi(+1);

//law of motion for the renormalized cost-push shock 
p = rhop*p(-1) + epsp;

//law of motion for the technology shock
a = epsa;

//New Keynesian Phillips Curve
(1 + beta*gamma_p)*pi = gamma_p*pi(-1) + beta*pi(+1) - (((1-theta)*(1-theta*beta))/theta)*(lambda + b) + p;

//monetary policy rule
//r - r(-1) = rhopi*pi + rhoyg*yg + epsr;
r = rhor*r(-1) + (1 - rhor)*(rhopi*pi + rhoyg*yg) + epsr;
//r = rhor*r(-1) + rhopi*pi + rhoyg*yg + epsr;
//r = rhor*r(-1) + rhopi*pi + rhoyg*ygap + epsr;

//growth rate of output
yg = y - y(-1) + a;

//efficient level of output
0 = phi*zeta*q(-1) - (zeta^2 + beta*phi^2)*q + beta*phi*zeta*q(+1) + beta*phi*(zeta - phi)*(1-rhob)*b - phi*zeta*a;

//output gap 
ygap = y - q;

//annualized inflation and interest rate
inflationa = pi*4;
interesta = r*4;

//output and outputgap in levels
//Z_au = a + Z_au(-1);
//output = y + Z_au;
%%%% measurement equations
y_obs = y - y(-1) + y_ss + a;  // 
pi_obs = pi + pi_ss;            // 
r_obs = r + r_ss;               // 

end;

steady;
check;

shocks;
var epsb=(0.0868*100)^2;      //preference shock
var epsp=(0.0017*100)^2;      //renormalized cost-push shock
var epsa=(0.0095*100)^2;      //technology shock
var epsr=(0.0014*100)^2;      //monetary policy shock
end;

stoch_simul(irf=20, graph_format=fig) y_obs inflationa interesta yg ygap;


%%%%%%%%% uncomment /* ... */ and comment out stoch sim to estimate. will need datafile and mode_file; otherwise rerun on new data
/*

%------------------------------------------------------------------------------------------------------------------------
% 8.  Estimated paramaters // Impulse responses
%------------------------------------------------------------------------------------------------------------------------

estimated_params;

  %%Households
    phi, beta_pdf, 0.5, 0.1;         // habit formation
    gamma_p, beta_pdf, 0.3, 0.1;          // indexation parameter, for gamma_p=0 the price setting is purely forward looking
    theta, beta_pdf, 0.7, 0.1;           // Phillips Curve parameter; equals the model parameters (theta-1)/phi in Ireland      

  %%coefficients of AR(1) shocks
    rhopi, gamma_pdf, 2, 0.1;          //response coefficient of the Taylor rule
    rhoyg, gamma_pdf, 1.5, 0.1;           //response coefficient of the Taylor rule
    rhor, beta_pdf, 0.5, 0.1;           // persistence in the Taylor rule
    rhob, beta_pdf, 0.5, 0.1;            //persistence in the preference shock
    rhop, beta_pdf, 0.5, 0.1;            //persistence in the renormalized cost-push shock

  %%innovations of the 9 shocks
    stderr epsb, inv_gamma_pdf, 0.01, inf;      //preference shock
    stderr epsp, inv_gamma_pdf, 0.01, inf;      //renormalized cost-push shock
    stderr epsa, inv_gamma_pdf, 0.01, inf;      //technology shock
    stderr epsr, inv_gamma_pdf, 0.01, inf;      //monetary policy shock

end;

%%estimated_params_init (use_calibration);
%%end;

varobs y_obs pi_obs r_obs; 

// forecast=8, nodisplay, load_mh_file, mode_file=H2017_SOE_mode, conditional_variance_decomposition=[1:20],
%%% mode_file=HvL_IR11_rep_mode, 
estimation(datafile=HvLEstimation3, mh_nblocks=3, mh_replic=100000, mh_drop=0.5, mh_jscale=0.65,
           mode_compute=0, mode_file=HvL_IR11_rep2_mode, mode_check, bayesian_irf, irf=20, moments_varendo, conditional_variance_decomposition=[1:20],
           graph_format=fig) y_obs inflationa interesta ygap y q lambda yg;  // b a p r pi

//shock_groups(name=groups);
//'Preference' = epsb;
//'Technology' = epsa;           
//'Price markup' = epsp;
//'Monetary policy' = epsr;
//end;

// Shock Decomposition option
shock_decomposition(colormap=jet) y_obs pi_obs r_obs ygap y;
plot_shock_decomposition(graph_format=(fig), colormap=jet, steadystate) y_obs inflationa interesta ygap y;
//plot_shock_decomposition(graph_format=(fig), use_shock_groups=netoil, colormap=jet, steadystate) y_obs pi_tot_obs int_b_obs;
// //identification(parameter_set = prior_mode); //  prior_mean
//identification(advanced=1, max_dim_cova_group=2, parameter_set = posterior_mean);

//dynare HvL_SW07_rep.mod;

*/
