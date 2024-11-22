%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%MAIN WORKING ESTIMATION FILE 
%SOENK-DSGE (baseline) with no Oil in consumption and production 2015 %% reduces estbtest2.mod (+ added mew_b shock as in Steinbach et al. 2009)
%% MP rule (core inflation = headline) M&S2005
%% 7 shocks: NOTE: mew_b included but epsil_p_star excluded --- collinearity --- label foreign supply shock
%Date: 29 April 2016 /// 1 Novemeber 2017                            
%Topic: Small open economy New Keynesian DSGE model of South Africa with Oil in consumption and production (and possibly investment)
%%% 2021 - corrected timing on physical capital
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%------------------------------------------------------------------------------------------------------------------------
% 0. 
%------------------------------------------------------------------------------------------------------------------------

//clear;
//clc;
//close all;

%------------------------------------------------------------------------------------------------------------------------
% 1.  Variables
%------------------------------------------------------------------------------------------------------------------------

var 
    c_h              // consumption of home goods
    c_f              // consumption of foreign goods
    c                // total consumption
    n                // labour supply

	int_b            // nominal interest rate
    e_dot            // change in nominal exchange rate

	v                // investment 
    k                // physical capital
    r_k              // real rate of return on physical capital

    pi_home          // domestic production inflation
	pi_foreign       // foreign imported consumption goods inflation
    //pi_z             // core price inflation
    pi_tot           // total headline domestic inflation
	pi_wage          // wage inflation
	mrs_w            // MRS btw consumption and labour
    w                // real domestic wage
    mc_h             // domestic real marginal cost of production
    psi_f            // lop gap

    y_h              // domestic output

    pr_h             // relative price of domestic goods
    pr_f             // relative foreign import price (to domestic price level) ---> nifty algebra trick
    rer              // real exchange rate
    s                // terms of trade p_f - p_h // added

	y_star           // foreign IS Curve (output)
	pi_star          // foreign Phillips Curve (inflation)
    mc_star          // foreign real marginal cost
	int_b_star       // foreign Policy Rule (nominal interest rate)

    y                // total gross domestic production (i.e., includes exports less imports)
    x                // exports to foreign economy
    m                // imports from foreign economy

    mew_b            // NB interest rate risk premium shock over domestic policy rate (consider including) --> currently using mew_b_star    
    mew_b_star      // risk premium shock for domestic bonds (like in our model)
    xi_p            // domestic price shock
    a               // domestic productivity shock
                    // domestic MP shock
    //xi_p_star       // foreign inflation shock in foreign Phillips Curve
    a_star          // foreign productivity shock
                    // foreign MP shock
   ////xi_f_star       // foreign price elasticity shock on foreign demand for domestic goods
////phi_risk         // is the difference between mew_b and mew_b_star

    y_star_obs
    pi_star_obs
    int_b_star_obs
    y_obs
    pi_tot_obs
    int_b_obs
    //rer_obs
;

%------------------------------------------------------------------------------------------------------------------------
% 2.  Exogenous Variables
%------------------------------------------------------------------------------------------------------------------------

varexo  epsil_a_star  epsil_i_star epsil_a epsil_p epsil_i epsil_d_star epsil_d ;  //  epsil_prostar  epsil_p_star  epsil_psi  epsil_f_star  

%------------------------------------------------------------------------------------------------------------------------
% 3.  Parameters
%------------------------------------------------------------------------------------------------------------------------

parameters
	gamma_c          
	eta_c     
	beta_h 
	phi 
	sigma_c 
    sigma_n
    epsilon_w

    delt
    kappa_v

    theta_w
    gamma_w 
	theta_h
    gamma_p
    
    alph

	theta_f 
    beta_f
	
    kappa_pi
	kappa_y
    rho_i

    phi_star
	sigma_c_star 
	sigma_n_star 
	theta_star 
	gamma_star 
	beta_star 
	kappa_pi_star 
	kappa_y_star 
    rho_i_star
	
    xi_f_star

    CYh 
    CY 
    IY
    KY 
    XY 
    MY
    CfM

    rho_a 
    rho_p
	rho_d
    rho_a_star
	//rho_p_star 
	rho_d_star
    //rho_f_star

    y_star_ss pi_star_ss int_b_star_ss y_ss pi_tot_ss int_b_ss 
    //rer_ss
;

%------------------------------------------------------------------------------------------------------------------------
% 3.  Calibration parameters values
%------------------------------------------------------------------------------------------------------------------------

	gamma_c = 0.2732;      // proxied by: MY. import share in home-foreign consumption // import share of foreign goods in non-fuel goods consumption
    gamma_o = 0;           // 0.1 proxied by: OM*MY/CY. import share of oil in consumption
    eta_c =	0.6;           // Home-foreign substitution elasticity  // intertemporal elasticities of substitution for oil and foreign consumption
    
	beta_h = 0.99;          // discount factor home    
	phi = 0.7;              // habit formation
    sigma_c	= 1;            // Relative Risk Aversion or inverse of the intertemporal elasticity of subst in consumption
    sigma_n = 3;            // 1 or 3 elasticity of labour supply

    delt = 0.03;            // rate of depreciation
    kappa_v = 0.25;         // physical capital adjustment cost // Bernanke Gilchrist Gertler 1999 p.32-33

    epsilon_w = 5;          // wage elasticity of substitution
    theta_w	= 0.75;         // sticky wage adjustment
    gamma_w = 0.5;          // wage indexation

    theta_h	= 0.6;          // sticky domestic price adjustment
    gamma_p = 0.6;          // domestic price indexation
    
    alph =	0.7;            // share of labour in firm production

    theta_f	= 0.8;          // foreign sticky price adjustment
    beta_f = 0.99;          // foreign discount factor

    kappa_pi = 1.5;         // weight on inflation in Taylor rule
    kappa_y	= 0.5;          // weight on output change in Taylor rule

    phi_star  = 0;           // foreign habit formation 
    sigma_c_star = 1;        // foreign RRA
    sigma_n_star = 3;        // foreign labour disutility
    
    theta_star 	= 0.75;      // foreign sticky price setting
    gamma_star  = 0;         // foreign price indexation
    beta_star = 0.99;        // foreign discount factor

    kappa_pi_star = 1.25;   //foreign weight on inflation in foreign policy rule
	kappa_y_star = 0.5;     // foreign weight on output change in foreign policy rule

    xi_f_star = 4;            // elasticity of foreign demand (export equation) M&S2005 p.15 & Eq. (19), p.10. [Eq (43) in terms of trade section]

    CYh = 0.659;              // data=0.615. model = 0.659. Home consumption to home production ratio
    IY = 0.199;               // investment-Output ratio // data calibrated
    KY = (IY/delt);           // Capital-Output ratio 
    XY = 0.2792;              // Export-Output ratio // data calibrated
    MY = 0.2732;              // Import-Output ratio // data calibrated
    CY = (1 - IY - XY + MY);  // 0.795 Total consumption to total output ratio M&S2005 CY = 1 - IY - XY + MY
    CfM = 1;                  //  Cons of foreign goods to total imports ratio

    rho_a	=	0.75;   // productivity shock persistance parameter
    rho_p	=	0.75;   // price markup shock
    rho_i	=	0.75;   // MP policy shock smoothing

	rho_a_star 	= 0.75;   // foreign productivity shock persistance parameter
	//rho_p_star = 0.75;  // foreign price markup shock
    rho_i_star  = 0.75;   // degree of foreign policy smoothing
    rho_d_star 	= 0.75;   // foreign risk premium shock
    //rho_f_star = 0.75;  // foreign price elasticity shock
    rho_d	=	0.75;     // domestic risk premium shock

    y_star_ss = 0.0028913917;    
    pi_star_ss = 0.00399311;  
    int_b_star_ss = 0.0057804112;
    y_ss = 0.00238535346;     
    pi_tot_ss = 0.013976856;
    int_b_ss = 0.022398;
    %%rer_ss = -0.00167405; 

%------------------------------------------------------------------------------------------------------------------------
% 4.  Model Linearised
%------------------------------------------------------------------------------------------------------------------------

model(linear);

        %%%%%-----Aggregate demand-----%%%%%

c_h = gamma_c*(eta_c)*(pr_f) - (gamma_c*(eta_c))*pr_h + c; // domestic consumption of home goods

c_f = (1 - gamma_c)*(eta_c)*pr_h + (gamma_c - eta_c)*(pr_f) + c; // domestic consumption of foreign goods

c = (1/(1+phi))*c(+1) + (phi/(1+phi))*(c(-1)) - ((1-phi)/(sigma_c*(1+phi)))*(int_b - pi_tot(+1) - mew_b);  // Consumption Euler equation 

(sigma_c/(1-phi))*(c - phi*c(-1)) = (sigma_c_star/(1-phi_star))*(y_star - phi_star*y_star(-1)) + rer;      // UIP --> international risk sharing Steinbach et al. Eq 44 based on Eq 31 = consistent with model equations

%% kappa_v*(v(-1) - k(-1)) = kappa_v*beta_h*(v - k) + (1 - beta_h*(1 - delt))*(r_k) + (sigma_c)*(c - c(+1)); // Investment schedule
kappa_v*(v - k(-1)) = kappa_v*beta_h*(v(+1) - k) + (1 - beta_h*(1 - delt))*(r_k(+1)) + (sigma_c)*(c - c(+1)); 

        %%%%%-----Aggregate supply and inflation-----%%%%%%

    %-----(real) wage setting-----%

pi_wage - gamma_w*pi_tot(-1) = beta_h*pi_wage(+1) - theta_w*beta_h*gamma_w*pi_tot 
                             + (((1 - theta_w)*(1 - theta_w*beta_h))/(theta_w*(1 + epsilon_w*sigma_n)))*(mrs_w - w); // Wage inflation or Real wage setting

mrs_w =(sigma_c/(1-phi))*(c - phi*c(-1)) + sigma_n*(n); // marginal rate of substitution in domestic wage inflation equation

    %-----domestic production and inflation (for consumption goods)-----%

pi_home = (gamma_p/(1+gamma_p*beta_h))*pi_home(-1) + (beta_h/(1+ gamma_p*beta_h))*pi_home(+1) + ((1-theta_h)*(1-theta_h*beta_h))/(theta_h*(1 + gamma_p*beta_h))*(mc_h + xi_p); // domestic inflation

mc_h = (w - pr_h) - (y_h - n);   //  real marginal cost wrt FOC labour
mc_h = r_k - (y_h - k(-1));          //  real marginal cost wrt FOC capital

y_h = a + alph*n + (1 - alph)*k(-1); // Cobb-Douglas production function with oil, assume \nu=1

    %-----Imported Inflation & Inflation Aggregation-----%

pi_foreign = beta_f*pi_foreign(+1) + (((1 - theta_f)*(1 - theta_f*beta_f))/theta_f)*psi_f;	 // Imported inflation where psi_f measures the lop gap
psi_f = rer - pr_f;         // law of one price gap

//pi_z = pi_tot;     // M&S2005 core price inflation
//pi_z = (1-gamma_c)*pi_home + gamma_c*pi_foreign;             // core price inflation

    %-----Evolution of Relative Prices-----%

pr_h = pr_h(-1) + pi_home - pi_tot;         // M&S2005, p.25 // domestic price relative to domestic headline/total price level
rer = rer(-1) + e_dot + pi_star - pi_tot;   // M&S2005, p.25 // real exchange rate equation (REER)

0 = (1-gamma_c)*pr_h + (gamma_c)*(rer - psi_f);    // M&S2005 Eq.(A20)
pr_f = pr_f(-1) + pi_foreign - pi_tot;             // foreign import price relative to domestic headline/total price level
s = pr_f - pr_h;                                   // s = terms of trade --> import price relative to domestic price.

w = w(-1) + pi_wage - pi_tot;                      // real wage definition

    %-----Evolution of State variables-----%

%% k(+1) = (1 - delt)*k + delt*v;                     // capital accumlation equation
k = (1 - delt)*k(-1) + delt*v;

    %-----Policy rule------%

int_b = rho_i*int_b(-1) + (1 - rho_i)*(kappa_pi*pi_tot + kappa_y*(y - y(-1))) + epsil_i; // Monetary Policy rule with total inflation
//int_b = rho_i*int_b(-1) + (1 - rho_i)*(kappa_pi*pi_z + kappa_y*(y - y(-1))) + epsil_i; // Monetary Policy rule with core inflation

        %%%%%-----Foreign economy-----%%%%%%
%-----3 equation NK model-----%

y_star = (1/(1 + phi_star))*y_star(+1) 
       + (phi_star/(1 + phi_star))*(y_star(-1)) 
       - ((1 - phi_star)/(sigma_c_star*(1 + phi_star)))*(int_b_star - pi_star(+1) + mew_b_star);  //  foreign IS curve

pi_star = (gamma_star/(1 + gamma_star*beta_star))*pi_star(-1) 
        + (beta_star/(1 + gamma_star*beta_star))*pi_star(+1) 
        + ((1-theta_star)*(1-theta_star*beta_star))/(theta_star*(1 + gamma_star*beta_star))*(mc_star); //  + xi_p_star  foreign Phillips Curve

mc_star = ((sigma_c_star/(1 - phi_star)) + sigma_n_star)*y_star 
        - ((sigma_c*phi)/(1 - phi_star))*y_star(-1) 
        - (1 + sigma_n_star)*a_star;                               // real marginal cost foreign economy 

int_b_star = rho_i_star*int_b_star(-1)
           + (1 - rho_i_star)*(kappa_pi_star*pi_star + kappa_y_star*(y_star - y_star(-1))) + epsil_i_star;  // Foreign Policy Rule


        %%%%%-----Aggregate Equilibrium-----%%%%%% [CHECK]

// note: c_star = y_star;

y_h = CYh*c_h + (1-CYh)*x; //  M&S2005  // aggregate domestic production equilibrium 

y = CY*c + KY*delt*v + XY*x - MY*m;                           // Aggregate resource constraint for domestic economy
x = y_star - xi_f_star*(pr_h - rer);                          // Aggregate Export
m = CfM*c_f;                                                  // Aggregate Imports

        %%%%%-----Stochastic processes-----%%%%%%

    %-----Three domestic shocks-----%

a = rho_a*a(-1) + epsil_a;                                // (1) domestic productivity shock
xi_p = rho_p*xi_p(-1) + epsil_p;                          // (2) domestic price markup shock
                                                          // (3) plus policy rule epsil_i above
    %-----Four foreign shocks-----%

a_star = rho_a_star*a_star(-1) + epsil_a_star ;           // (5) foreign productivity shock in foreign IS curve
//xi_p_star = rho_p_star*xi_p_star(-1) + epsil_p_star;    // foreign price markup shock in foreign Ph-Curve
                                                          // (7) plus policy rule epsil_i_star above
mew_b_star = rho_d_star*mew_b_star(-1) + epsil_d_star;    // (6) foreign risk premium shock
mew_b = rho_d*mew_b(-1) + epsil_d;                        // (4) domestic risk premium shock

        %%%%%-----Measurement equations-----%%%%%%

y_star_obs = y_star - y_star(-1) + y_star_ss;
pi_star_obs = pi_star + pi_star_ss;
int_b_star_obs = int_b_star + int_b_star_ss;

y_obs = y - y(-1) + y_ss;
pi_tot_obs = pi_tot + pi_tot_ss;
int_b_obs = int_b + int_b_ss;

//rer_obs = rer - rer(-1) + rer_ss;

end;

%------------------------------------------------------------------------------------------------------------------------
% 8.  Estimated paramaters // Impulse responses
%------------------------------------------------------------------------------------------------------------------------

estimated_params;

  %%Households
    eta_c, gamma_pdf, 1, 0.5;            // home-foreign substitution elasticity
    sigma_c, inv_gamma_pdf, 2, 0.5;      // coefficient of relative risk aversion
    //sigma_n, gamma_pdf, 3, 0.5;        // elasticity of labour
    //phi, beta_pdf, 0.5, 0.1;           // habit formation
    gamma_c, beta_pdf, 0.25, 0.05;       // foreign import goods share in consumption

    sigma_c_star, inv_gamma_pdf, 1, 0.25;   // foreign coefficient of relative risk aversion
    //sigma_n_star, gamma_pdf, 3, 0.5;      // foreign elasticity of labour
    //phi_star, beta_pdf, 0.25, 0.1;        // calibrated to 0  // foreign habit formation
    
  %%Retailers and Unions
    theta_h, beta_pdf, 0.6, 0.05;           // domestic price stickiness
    gamma_p, beta_pdf, 0.6, 0.05;           // domestic degree of price indexation
    //theta_w, beta_pdf, 0.75, 0.05;        // wage stickiness
    //gamma_w, beta_pdf, 0.5, 0.05;         // degree of wage indexation
    theta_f, beta_pdf, 0.8, 0.05;           // foreign import price stickiness

    theta_star, beta_pdf, 0.75, 0.1;        // foreign price stickiness
    //gamma_star, beta_pdf, 0.25, 0.1;      // calibrated to 0 // foreign degree of price indexation

  %% Investment adjustment cost
    //kappa_v, gamma_pdf, 0.25, 0.25;           //  Investment adjustment cost

  %%Monetary Policy function
    kappa_pi, gamma_pdf, 1.5, 0.1;          // domestic Taylor rule coefficient on pi
    kappa_y, beta_pdf, 0.5, 0.1;            // domestic Taylor rule coefficient on y

    kappa_pi_star, gamma_pdf, 1.5, 0.1;  // foreign Taylor rule coefficient on pi
    kappa_y_star, beta_pdf, 0.5, 0.1;    // foreign Taylor rule coefficient on y

  %%Oil imports and domestic exports 
    xi_f_star, gamma_pdf, 2, 0.5;        // elasticity of foreign demand (export equation) M&S2005p.15&Eq.(19),p.10          
    
  %%coefficients of AR(1) shocks
    rho_a, beta_pdf, 0.75, 0.1;           // productivity shock persistance parameter
    rho_d, beta_pdf, 0.75, 0.1;
    rho_p, beta_pdf, 0.75, 0.1;           // price markup shock
    rho_i, beta_pdf, 0.75, 0.1;           // MP policy shock smoothing

	rho_a_star, beta_pdf, 0.75, 0.1;      // foreign productivity shock persistance parameter
	//rho_p_star, beta_pdf, 0.75, 0.1;    // foreign price markup shock
    rho_i_star, beta_pdf, 0.75, 0.1;      // degree of foreign policy smoothing
    rho_d_star, beta_pdf, 0.75, 0.1;      // foreign risk premium shock
    //rho_f_star, beta_pdf, 0.75, 0.1;    // foreign price elasticity shock

  %%innovations of the 7 shocks
    stderr epsil_a_star, inv_gamma_pdf, 0.01, inf;       // (5) foreign productivity shock in foreign IS curve 
    //stderr epsil_p_star, inv_gamma_pdf, 0.01, inf;     // foreign price markup shock in foreign Ph-Curve     
    stderr epsil_i_star, inv_gamma_pdf, 0.01, inf;       // (6) foreign policy rule
    stderr epsil_a, inv_gamma_pdf, 0.01, inf;            // (1) domestic productivity shock
    stderr epsil_p, inv_gamma_pdf, 0.01, inf;            // (2) domestic price markup shock
    stderr epsil_i, inv_gamma_pdf, 0.01, inf;            // (3) domestic policy rule
    stderr epsil_d_star, inv_gamma_pdf, 0.01, inf;       // (7) Foreign risk premium shock, equivalent to a negative demand shock
    stderr epsil_d, inv_gamma_pdf, 0.01, inf;            // (4) Domestic risk premium shock, equivalent to a negative demand shock

end;

//estimated_params_init(use_calibration);
//end;

varobs  y_star_obs pi_star_obs int_b_star_obs y_obs pi_tot_obs int_b_obs; // rer_obs 

estimation(datafile=GHWEstimation6, mh_nblocks=3, load_mh_file, // mh_replic=100000, mh_drop=0.5, mh_jscale=0.27,  // 0.30
           mode_compute=0, mode_check, mode_file=GHW2018_SOEnooil_mh_mode,  // mode_file=GHW2017_SOEnooil_mode, 
           bayesian_irf, irf=20, moments_varendo, conditional_variance_decomposition=[1:20],
           graph_format=fig, nodisplay) y pi_tot int_b pi_home pi_foreign  rer e_dot  y_star pi_star int_b_star c v k n;

shock_groups(name=nooil);
'Foreign supply' = epsil_a_star;
//'Foreign price markup' = epsil_p_star;     
'Foreign monetary policy' = epsil_i_star;
'Technology' = epsil_a;           
'Price markup' = epsil_p;
'Monetary policy' = epsil_i;
'Foreign risk premium' = epsil_d_star;
'Domestic risk premium' = epsil_d;
end;

// Shock Decomposition option
shock_decomposition(colormap=jet) y_obs pi_tot_obs int_b_obs;
plot_shock_decomposition(graph_format=(fig), use_shock_groups=nooil, colormap=jet, steadystate) y_obs pi_tot_obs int_b_obs;

// //identification(parameter set = prior mode);
identification(advanced=1, max_dim_cova_group=2);
