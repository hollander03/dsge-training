// Title: Shocks and Frictions in US Business Cycles: A Bayesian DSGE-Approach
// Authors: Smets, Frank and Raf Wouters
// Publication: The American Economic Review, June 2007, 97(3), 586-606.
// This file simulates the dynamic response of the model to specific shocks
// Replication of IRF to monetary policy shock (one standard deviation)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%% MP rule for model comparisons: interest rate responds to deviations of inflation and output growth from steady
%%%%%%%%% same as Gerali etal 2010, GHW2018; similar to Ireland2011
%%%%%%%%% Exogenous spending shock proxies for Ireland's preference shock: both are "demand shocks" ... 
%%%%%%%%% NB prelim results: possible compare pref shock to combined risk-premium and exog spend, because pref shock in Ireland enters into Euler equation, efficient output, and NKPC... therefore harder to proxy directly
%% STANDARDIZING CHANGES: dropped: zcap (variable capital utilization), proportional fixed costs, EXOG SPEND SHOCK IS I.I.D
%% CONSIDER: replacing exogenous spending shock with labour supply shock ---> NB likely lead to singularity issue in agg res constr w/ Y, C, I all obs
%% THEREFORE: possible keep as i.i.d ?
%% Estimation Period: 1995Q1 - 2017Q2
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

var lab_obs r_obs pi_obs y_obs c_obs inve_obs w_obs ewma epinfma zcapf rkf kf pkf cf invef 
    yf labf wf rrf mc zcap rk k pk c inve y lab pinf w r a  b g qs  ms  spinf 
    sw kpf kp pinf4 inflationa interesta ygap pi_wage winflationa;  //  l
 
varexo ea eb eqs eg em epinf ew ; //    el  
  
parameters curvw cgy curvp constelab constepinf constebeta cmaw cmap calfa 
           czcap cbeta csadjcost ctou csigma chabb   cfc cindw cprobw 
           cindp cprobp csigl clandaw   crpi crdy cry crr crhoa crhob 
           crhog crhoqs crhoms crhopinf crhow ctrend cg cgamma clandap cbetabar 
           cr cpie crk cw cikbar cik clk cky ciy ccy crkky cwhlc cwly
           y_ss pi_ss r_ss c_ss inve_ss w_ss lab_ss;  // g_ss crhol [parameters not in code: ccs cinvs crdpi]

// fixed parameters
ctou = 0.025;  //depreciation rate
clandaw = 1.5; // SS markup labor market %%% SOE and HL = 1.2 related to epsilon_w=5
cg = 0.197;     // calibrate to data;  Steinbach et al 0.197 exogenous spending GDP-ratio
curvp = 10;    //curvature Kimball aggregator goods market
curvw = 10;    //curvature Kimball aggregator labor market
y_ss = 0.002393097;
pi_ss = 0.013976856;
r_ss = 0.022398;
c_ss = 0.003727795;
inve_ss = 0.006615576;
w_ss = -0.000858784;
lab_ss = 0.001353938;
//g_ss = 0.002312112;

ctrend = 0;                     // remove from model, use mean values of observables // quarterly trend growth rate to GDP
cgamma = ctrend/100 + 1;
constebeta = 0.1657;
cbeta = 100/(constebeta + 100); //discount factor = 0.998345741 %% Ireland = = 0.994129  
constepinf = 0.7869;            //quarterly SS inflation rate
cpie = constepinf/100 + 1;
constelab = 0.5509;                  

calfa=0.1901;     %%% reestimate with 0.3              //capital share in production

// estimated parameters initialisation



csigma=1.3808;                  //intertemporal elasticity of substitution
//cfc = 1.6064; 
cfc = 1;                        // fixed costs
cgy = 0.5187;                   // weight on tech shock in exogenous spending process

csadjcost = 5.7606;             //investment adjustment cost
chabb =    0.7133;              // habit persistence 
cprobw =   0.7061;              //calvo parameter labor market
csigl =    1.8383;              // labour disutility
cprobp =   0.6523;              //calvo parameter goods market
cindw =    0.5845;              //indexation labor market
cindp =    0.2432;              //indexation goods market
czcap =    0.5462;              //capital utilization
crpi =     2.0443;              //Taylor rule reaction to inflation
crr =      0.8103;              //Taylor rule interest rate smoothing
cry =      0.0882;              //Taylor rule long run reaction to output gap
crdy =     0;                   // 0..2247 Taylor rule short run reaction to output gap

crhoa =    0.9577;              // tech shock persistence
crhob =    0.2194;              // risk premium (EFP) shock persistence
crhog =    0.815;               // exog spending shock persistence // OLS est from Steinbach 0.815 // SW07 0.9767
crhoqs =   0.7113;              // investment specfic shock persistence
crhoms = 0;                     // fixed to zero // 0.1479 persistence captured in Taylor rule as in Ireland 2011 //
crhopinf = 0.8895;              // inflation (cost-push) shock persistence
crhow = 0.9688;                 // wage shock persistence
cmap = 0;                       // 0.7010 zero serial correlation of price shock
cmaw  = 0;                      // 0.8503 zero serial correlation of wage shock
//crhol = 0.5;  // labour supply shock

// derived from steady state
clandap=cfc;
cbetabar=cbeta*cgamma^(-csigma);
cr=cpie/(cbeta*cgamma^(-csigma));
crk=(cbeta^(-1))*(cgamma^csigma) - (1-ctou);
cw = (calfa^calfa*(1-calfa)^(1-calfa)/(clandap*crk^calfa))^(1/(1-calfa));
cikbar=(1-(1-ctou)/cgamma);
cik=(1-(1-ctou)/cgamma)*cgamma;
clk=((1-calfa)/calfa)*(crk/cw);
cky=cfc*(clk)^(calfa-1);
ciy=cik*cky;
ccy=1-cg-cik*cky;
crkky=crk*cky;
cwhlc=(1/clandaw)*(1-calfa)/calfa*crk*cky/ccy;
cwly=1-crk*cky;


model(linear); 

// Original Model Code:
// flexible economy

	      0*(1-calfa)*a + 1*a =  calfa*rkf+(1-calfa)*(wf)  ;
	      %%zcapf =  (1/(czcap/(1-czcap)))* rkf  ;
          zcapf = 0;
	      rkf =  (wf)+labf-kf ;
	      kf =  kpf(-1)+zcapf ;
          //investment Euler equation
	      invef = (1/(1+cbetabar*cgamma))* (  invef(-1) + cbetabar*cgamma*invef(+1) + (1/(cgamma^2*csadjcost))*pkf ) + qs ;
          pkf = - rrf - 0*b + (1/((1-chabb/cgamma)/(csigma*(1+chabb/cgamma))))*b + (crk/(crk+(1-ctou)))*rkf(+1) +  ((1-ctou)/(crk+(1-ctou)))*pkf(+1) ;
          //consumption Euler equation
	      cf = (chabb/cgamma)/(1+chabb/cgamma)*cf(-1) + (1/(1+chabb/cgamma))*cf(+1) - (1-chabb/cgamma)/(csigma*(1+chabb/cgamma))*(rrf+0*b) + b ;  // +((csigma-1)*cwhlc/(csigma*(1+chabb/cgamma)))*(labf-labf(+1))
          //aggregate resource constraint
	      yf = ccy*cf + ciy*invef + cg*g + crkky*zcapf ;
          // aggregate production function
	      yf = cfc*( calfa*kf+(1-calfa)*labf + a );
	      wf = csigl*(labf) + (1/(1-chabb/cgamma))*cf - (chabb/cgamma)/(1-chabb/cgamma)*cf(-1) ;  //  + l
        //accumulation of installed capital
	      kpf =  (1-cikbar)*kpf(-1)+(cikbar)*invef + (cikbar)*(cgamma^2*csadjcost)*qs ;

// sticky price - wage economy
          //marginal cost
	      mc =  calfa*rk + (1-calfa)*(w) - 1*a - 0*(1 - calfa)*a ;
          // capital utilization 
	      %%zcap =  (1/(czcap/(1-czcap)))*rk ;
          zcap = 0;
          //rental rate of capital
	      rk =  w + lab - k ;
          // Capital installed used one period later in production 
	      k =  kp(-1) + zcap ;
          //investment Euler equation
	      inve = (1/(1+cbetabar*cgamma))* (  inve(-1) + cbetabar*cgamma*inve(+1) + (1/(cgamma^2*csadjcost))*pk ) + qs ;
          //arbitrage equation for value of capital
          pk = - r + pinf(+1) - 0*b +(1/((1-chabb/cgamma)/(csigma*(1+chabb/cgamma))))*b + (crk/(crk+(1-ctou)))*rk(+1) +  ((1-ctou)/(crk+(1-ctou)))*pk(+1) ;
          //consumption Euler equation
	      c = (chabb/cgamma)/(1+chabb/cgamma)*c(-1) + (1/(1+chabb/cgamma))*c(+1)  - (1-chabb/cgamma)/(csigma*(1+chabb/cgamma))*(r-pinf(+1) + 0*b) +b ;  //+((csigma-1)*cwhlc/(csigma*(1+chabb/cgamma)))*(lab-lab(+1))
          //aggregate resource constraint
	      y = ccy*c + ciy*inve + cg*g + 1*crkky*zcap ;
          // aggregate production function
	      y = cfc*( calfa*k + (1 - calfa)*lab + a );
          //Phillips Curve
	      pinf = (1/(1+cbetabar*cgamma*cindp))*(cbetabar*cgamma*pinf(+1) + cindp*pinf(-1) 
               + ((1-cprobp)*(1-cbetabar*cgamma*cprobp)/cprobp)/((cfc-1)*curvp+1)*(mc)) + spinf ; %%% cfrc=1 therefore curvp irrelevant
	      w =  (1/(1+cbetabar*cgamma))*w(-1)
               +(cbetabar*cgamma/(1+cbetabar*cgamma))*w(+1)
               +(cindw/(1+cbetabar*cgamma))*pinf(-1)
               -(1+cbetabar*cgamma*cindw)/(1+cbetabar*cgamma)*pinf
               +(cbetabar*cgamma)/(1+cbetabar*cgamma)*pinf(+1)
               +(1-cprobw)*(1-cbetabar*cgamma*cprobw)/((1+cbetabar*cgamma)*cprobw)*(1/((clandaw - 1)*curvw + 1))*
               (csigl*(lab) + (1/(1-chabb/cgamma))*c - ((chabb/cgamma)/(1-chabb/cgamma))*c(-1) - w) 
               + 1*sw ; //  + l

          //Monetary Policy Rule
	      //r = crpi*(1-crr)*pinf + cry*(1-crr)*(y-yf) + crdy*(y - yf - y(-1) + yf(-1)) + crr*r(-1) + ms  ;
            r = crr*r(-1) + crpi*(1-crr)*pinf + cry*(1-crr)*(y - y(-1)) + ms  ;
          //r = crr*r(-1) + crpi*pinf + cry*(y - y(-1)) + ms  ;
          //r = crr*r(-1) + crpi*pinf + cry*(y - yf) + ms;

	      a = crhoa*a(-1) + ea;
	      b = crhob*b(-1) + eb;
          %%// exogenous spending (also including net exports)
	      g = crhog*(g(-1)) + eg + cgy*ea;
%%g=0;
	      qs = crhoqs*qs(-1) + eqs;
%%qs=0;
	      ms = crhoms*ms(-1) + em;
          //cost push shock
	      spinf = crhopinf*spinf(-1) + epinfma - cmap*epinfma(-1);
	          epinfma=epinf;
	      sw = crhow*sw(-1) + ewma - cmaw*ewma(-1) ;
	          ewma=ew; 
          // l = crhol*l(-1) + el;

          //accumulation of installed capital
	      kp =  (1-cikbar)*kp(-1) + cikbar*inve + cikbar*cgamma^2*csadjcost*qs ;

// measurement equations

y_obs = y - y(-1) + y_ss;  //
c_obs = c - c(-1) + c_ss + ctrend;
inve_obs = inve - inve(-1) + inve_ss + ctrend;
w_obs = w - w(-1) + w_ss + ctrend;
//pi_obs = 1*(pinf) + constepinf;
pi_obs = 1*(pinf) + pi_ss;
//r_obs = 1*(r) + constebeta;
r_obs = 1*(r) + r_ss;
//lab_obs = lab + constelab;
lab_obs = lab + lab_ss;

pinf4 = pinf + pinf(-1) + pinf(-2) + pinf(-3);

//wage inflation
pi_wage = w - w(-1) + pinf;                      // nominal wage inflation definition
winflationa = pi_wage*4;

//annualized inflation and interest rate
inflationa = pinf*4;
interesta = r*4;
//output gap 
ygap = y - yf;
//output growth

end; 

shocks;

//productivity shock
var ea;
stderr 0.4582;

//wedge between FFR and return on assets
var eb;
stderr 0.2400;

// exogenous spending shock (govt + NX)
var eg;
stderr 0.5291;

//investment specific technology
var eqs;
stderr 0.4526;

var em; // monetary policy shock
stderr 0.2449;

var epinf; // price markeup shock
stderr 0.1410;

var ew; // wage markup shock
stderr 0.2446;

//var el; // labour supply shock
//stderr 0.2446;

end;


%%% stoch_simul(irf=20, graph_format=fig) y_obs inflationa interesta pinf r lab y ygap;

%------------------------------------------------------------------------------------------------------------------------
% 8.  Estimated paramaters // Impulse responses
%------------------------------------------------------------------------------------------------------------------------

estimated_params;

  %%Households
    chabb, beta_pdf, 0.7, 0.1;           // habit formation
    csigma, inv_gamma_pdf, 1.5, 0.5;     // coefficient of relative risk aversion // inverse intertemporal elasticity of substitution
    csigl, inv_gamma_pdf, 1.5, 0.5;     // labour disutility // inverse of the Frisch elasticity of labour supply

    csadjcost, inv_gamma_pdf, 5, 0.5;    //  5.7606 //investment adjustment cost

    cprobp, beta_pdf, 0.7, 0.1;          // Calvo Phillips Curve parameter   
    cindp, beta_pdf, 0.3, 0.1;           // price indexation Phillips Curve parameter
    cprobw, beta_pdf, 0.7, 0.1;          // Calvo Wage parameter   
    cindw, beta_pdf, 0.3, 0.1;           // wage indexation parameter

  %%coefficients of AR(1) shocks
    crpi, gamma_pdf, 1.5, 0.1;         //response coefficient of the Taylor rule
    cry, gamma_pdf, 0.5, 0.1;           //response coefficient of the Taylor rule

    crhoa, beta_pdf, 0.5, 0.1;          //persistence in the technology shock
    crhob, beta_pdf, 0.5, 0.1;          //persistence in the EFP shock
    //crhog, beta_pdf, 0.5, 0.1;          //persistence in the exogenous spending 
    crhoqs, beta_pdf, 0.5, 0.1;         //persistence in the invest specific
    crr, beta_pdf, 0.5, 0.1;            //persistence in the Taylor rule
    crhopinf, beta_pdf, 0.5, 0.1;       //persistence in the cost-push shock
    crhow, beta_pdf, 0.5, 0.1;          //persistence in the wage shock
    //crhol, beta_pdf, 0.5, 0.1;          //persistence in the labour supply shock

    cgy, beta_pdf, 0.5, 0.1;            //weight on technology shock in exo spending process
 
  %%innovations of the 7 shocks

    stderr ea, inv_gamma_pdf, 0.01, inf;      // technology shock
    stderr eb, inv_gamma_pdf, 0.01, inf;      // risk premium (EFP) shock // wedge btw policy rate and euler eqn "rate"
    stderr eg, inv_gamma_pdf, 0.01, inf;      // exogenous spending
    stderr eqs, inv_gamma_pdf, 0.01, inf;     // investment specific
    stderr em, inv_gamma_pdf, 0.01, inf;      // monetary policy shock
    stderr epinf, inv_gamma_pdf, 0.01, inf;   // cost-push shock
    stderr ew, inv_gamma_pdf, 0.01, inf;      // wage shock
    //stderr el, inv_gamma_pdf, 0.01, inf;      // labour supply shock

end;

%%estimated_params_init (use_calibration);
%%end;

varobs y_obs c_obs inve_obs w_obs lab_obs pi_obs r_obs ; 

// forecast=8, nodisplay, load_mh_file, mode_file=HvL_IR11_rep_mode,  conditional_variance_decomposition=[1:20],
// HvLEstimation3, mode_file=HvL_SW07_rep_mode, 
%% mode_check, bayesian_irf, irf=20, moments_varendo, conditional_variance_decomposition=[1:20],

estimation(datafile=SWEstimation7, mh_nblocks=3, mh_replic=50000, mh_drop=0.5, mh_jscale=0.48,
           mode_compute=0, load_mh_file, mode_file=HvL_SW07_rep_mode,  
           graph_format=fig) y_obs inflationa interesta ygap y c inve lab winflationa pinf r w;
                                                                    
shock_groups(name=groups);
'Demand' = eb, eqs, em;           
'Supply' = ea, epinf, ew;
'Exogenous spending' = eg;
end;

shock_groups(name=SWgroups);
'Technology' = ea;
'Markup' = epinf, ew;
'Monetary policy' = em;
'Demand' = eb, eqs, eg;
end;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%   use_shock_groups=groups, 
// Shock Decomposition option
shock_decomposition(colormap=jet) y_obs pi_obs r_obs ygap y;
plot_shock_decomposition(graph_format=fig, use_shock_groups=SWgroups, colormap=jet, steadystate) y_obs inflationa interesta ygap y;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
// //identification(parameter_set = prior_mode); //  prior_mean
//identification(advanced=1, max_dim_cova_group=2, parameter_set = posterior_mean);

//dynare HvL_GHW2018nooil_SWshocks.mod;
