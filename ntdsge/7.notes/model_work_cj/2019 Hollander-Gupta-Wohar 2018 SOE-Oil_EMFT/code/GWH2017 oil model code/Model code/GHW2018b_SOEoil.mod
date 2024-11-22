%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% MAIN WORKING ESTIMATION FILE 4 Oil mod. 1, 2 & 3
%%% SOENK-DSGE with Oil in consumption and production
%%% MP rule with headline inflation (core = M&S2005) 
%%% Alternative specs: l.o.p gap shock for oil (mod. 2); cross correlation estimation with l.o.p gap for oil (mod. 3)
%%% oil l.o.p gap = 0 full pass-through to productiona and consumption bundles as in Sanchez and others                   
%%% Topic: Small open economy New Keynesian DSGE model of South Africa with Oil in consumption and production
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
    oil_c            // consumption of oil
    c                // total consumption
    n                // labour supply

	int_b      (long_name='Nominal interest rate') // nominal interest rate
    e_dot      (long_name='{$\Delta$}NEER')        // change in nominal exchange rate

	v                // investment 
    k                // physical capital
    r_k              // real rate of return on physical capital

    pi_home    (long_name='Domestic inflation')         // domestic production inflation
	pi_foreign (long_name='Foreign inflation')          // foreign imported consumption goods inflation
	pi_oil     (long_name='Oil inflation (domestic)')   // oil inflation in domestic currency units
    pi_z             // core price inflation
    pi_tot     (long_name='Total (headline) inflation') // total headline domestic inflation
	pi_wage          // wage inflation
	mrs_w            // MRS btw consumption and labour
    w                // real domestic wage
    mc_h             // domestic real marginal cost of production
    psi_f            // lop gap

    y_h              // domestic output
	oil_h            // oil in production
    yx               // nested term in prod func with subst btw oil and capital

    pr_h             // relative price of domestic goods
    pr_f             // relative foreign import price (to domestic price level) ---> nifty algebra trick
    pr_o             // relative domestic price of oil 
    rer         (long_name='REER')     // real exchange rate
    pi_oil_star      // Oil inflation in foreign (dollar) currency units
    s                // terms of trade p_f - p_h // added

	y_star           // foreign IS Curve (output)
	pi_star          // foreign Phillips Curve (inflation)
    mc_star          // foreign real marginal cost
	int_b_star       // foreign Policy Rule (nominal interest rate)

    y          (long_name='Output')      // total gross domestic production (i.e., includes exports less imports)
    x                // exports to foreign economy
    m                // imports from foreign economy
    oil        (long_name='Oil')        // total oil usage in domestic economy // note: Assumption: SOE is price taker and consumption of oil relative to RoW negligible

    mew_b           // risk premium shock for domestic currency bonds   
    mew_b_star      // risk premium shock for foreign currency bonds
    xi_p            // domestic price shock
    a               // domestic productivity shock
                    // domestic MP shock	
    pr_o_star       // the relative [real] foreign price of oil (p_o_star - p_f_star) ---> stoch AR(1) process
    psi_o           // relative domestic price of oil deviations from  l.o.p
    //xi_p_star     // foreign inflation shock in foreign Phillips Curve (colinearity with a_star, excl.)
    a_star          // foreign productivity shock
                    // foreign MP shock
    ////xi_f_star   // foreign price elasticity shock on foreign demand for domestic goods
    ////phi_risk    // is the difference between mew_b and mew_b_star

    pr_o_star_obs
    y_star_obs
    pi_star_obs
    int_b_star_obs
    y_obs         (long_name='Output (obs)')
    pi_tot_obs    (long_name='Total (headline) inflation (obs)')
    int_b_obs     (long_name='Nominal interest rate (obs)')
    //rer_obs
    //oil_obs
;

%------------------------------------------------------------------------------------------------------------------------
% 2.  Exogenous Variables
%------------------------------------------------------------------------------------------------------------------------

varexo epsil_prostar $\epsilon_{o*}$  epsil_a_star $\epsilon_{a*}$ epsil_i_star $\epsilon_{i*}$ epsil_a $\epsilon_{a}$ epsil_p $\epsilon_{p}$ epsil_i $\epsilon_{i}$ epsil_d_star $\epsilon_{b*}$ epsil_d $\epsilon_{b}$;  //  epsil_psi $\epsilon_{\psi}$  epsil_p_star  epsil_f_star  

%------------------------------------------------------------------------------------------------------------------------
% 3.  Parameters
%------------------------------------------------------------------------------------------------------------------------

parameters
	gamma_c $\gamma_{c}$
    gamma_o $\gamma_{o}$        
	eta_c   $\eta_{c}$
    eta_o   $\eta_{o}$ 
	beta_h  $\beta_{h}$
	phi     $\phi$
	sigma_c $\sigma_{c}$
    sigma_n $\sigma_{n}$
    epsilon_w $\xi_{w}$

    delt      $\delta$
    kappa_v   $\kappa_{v}$

    theta_w   $\theta_{w}$
    gamma_w   $\gamma_{w}$
	theta_h   $\theta_{h}$
    gamma_p   $\gamma_{p}$
    
    alph      $\alpha$
    vtheta    $\vartheta$
    nu        $\nu$

	theta_f  $\theta_{f}$
    beta_f   $\beta_{f}$
	
    kappa_pi $\kappa_{\pi}$
	kappa_y  $\kappa_{y}$
    rho_i

    phi_star $\phi^{*}$ 
	sigma_c_star $\gamma_{c}^{*}$
	sigma_n_star $\gamma_{n}^{*}$
	theta_star $\theta_{*}$
	gamma_star $\gamma_{p}^{*}$
	beta_star  $\beta_{*}$
	kappa_pi_star $\kappa_{\pi}^{*}$
	kappa_y_star  $\kappa_{y}^{*}$
    rho_i_star $\rho_{i*}$
	
    xi_f_star  $\xi_{f*}$

    CYh 
    CY 
    IY
    KY 
    XY 
    MY
    CfM
    OM
    OcO
    OhO

    rho_prostar $\rho_{o*}$
    rho_psi     $\rho_{{\psi}*}$
    rho_psicc   $\rho_{{\psi}^{o*}}$
    rho_a       $\rho_{a}$
    rho_p       $\rho_{p}$
	rho_d       $\rho_{b}$
    rho_a_star  $\rho_{a*}$
	//rho_p_star 
	rho_d_star  $\rho_{b*}$
    //rho_f_star

    pr_o_star_ss y_star_ss pi_star_ss int_b_star_ss y_ss pi_tot_ss int_b_ss %% rer_ss oil_ss
;

%------------------------------------------------------------------------------------------------------------------------
% 3.  Calibration parameters values
%------------------------------------------------------------------------------------------------------------------------

	gamma_c = 0.2732;     // proxied by: MY. import share in home-foreign consumption // import share of foreign goods in non-fuel goods consumption
    gamma_o = 0.07;       // proxied by: OM*MY/CY. import share of oil in consumption
    eta_c =	0.6;          // Home-foreign substitution elasticity  // intertemporal elasticities of substitution for oil and foreign consumption
    eta_o = 0.2;          // Oil-core cons subst elasticity

	beta_h = 0.99;        // discount factor home    
	phi = 0.7;            // habit formation
    sigma_c	= 1;          // Relative Risk Aversion or inverse of the intertemporal elasticity of subst in consumption
    sigma_n = 3;          // elasticity of labour supply

    delt = 0.03;          // rate of depreciation
    kappa_v = 0.25;       // physical capital adjustment cost // Bernanke Gilchrist Gertler 1999 p.32-33

    epsilon_w = 5;        // wage elasticity of substitution
    theta_w	= 0.75;       // sticky wage adjustment
    gamma_w = 0.5;        // wage indexation

    theta_h	= 0.6;        // sticky domestic price adjustment
    gamma_p = 0.6;        // domestic price indexation
    
    alph =	0.7;          // share of labour in firm production
    vtheta = 0.9;         // relative share of capital wrt oil in production
    nu = 2;               // elasticity of substitution between capital and oil in production (see also M&S2005,p8)

    theta_f	= 0.8;        // foreign sticky price adjustment
    beta_f = 0.99;        // foreign discount factor

    kappa_pi = 1.5;       // weight on inflation in Taylor rule
    kappa_y	= 0.5;        // weight on output change in Taylor rule

    phi_star  = 0;        // foreign habit formation 
    sigma_c_star = 1;     // foreign RRA
    sigma_n_star = 3;     // foreign labour disutility
    
    theta_star 	= 0.75;   // foreign sticky price setting
    gamma_star  = 0;      // foreign price indexation
    beta_star = 0.99;     // foreign discount factor

    kappa_pi_star = 1.25; //foreign weight on inflation in foreign policy rule
	kappa_y_star = 0.5;   // foreign weight on output change in foreign policy rule

    xi_f_star = 2;        // elasticity of foreign demand (export equation) M&S2005 p.15 & Eq. (19), p.10. [Eq (43) in terms of trade section]

    CYh = 0.659;          // data=0.615. model = 0.659. Home consumption to home production ratio
    IY = 0.199;               // investment-Output ratio // data calibrated
    KY = (IY/delt);           // Capital-Output ratio 
    XY = 0.2792;              // Export-Output ratio // data calibrated
    MY = 0.2732;              // Import-Output ratio // data calibrated
    CY = (1 - IY - XY + MY);  // 0.795 Total consumption to total output ratio M&S2005 CY = 1 - IY - XY + MY
    OM = 0.16;                // Oil imports as share of total imports // data calibrated
    CfM = (1 - OM);           // 0.84 Cons of foreign goods to total imports ratio
    OcO = 0.75;               // Share of HH consumption of oil to total oil imports 
    OhO = 0.25;               // Share of Firm usage of oil to total oil imports

    rho_prostar = 0.95;      // relative foreign oil price shock
    rho_psi = 0.75;          // deviations from the l.o.p for the oil price in domestic currency units
    rho_psicc = 0.5;         // l.o.p cross-correlation with foreign real oil price shock --> use mean correlation from previous estimated model

    rho_a	=	0.75;        // productivity shock persistance parameter
    rho_p	=	0.75;        // price markup shock
    rho_i	=	0.75;        // MP policy shock smoothing

	rho_a_star 	= 0.75;      // foreign productivity shock persistance parameter
	//rho_p_star = 0.75;     // foreign price markup shock
    rho_i_star  = 0.75;      // degree of foreign policy smoothing
    rho_d_star 	= 0.75;      // risk premium shock on foreign currency bonds
    //rho_f_star = 0.75;     // foreign price elasticity shock
    rho_d	=	0.75;        // risk premium shock on domestic currency bonds

    pr_o_star_ss = 0.00822488;
    y_star_ss = 0.0028913917;     
    pi_star_ss = 0.00399311;     
    int_b_star_ss = 0.0057804112;
    y_ss = 0.00238535346;    
    pi_tot_ss = 0.013976856;
    int_b_ss = 0.022398;
    %%rer_ss = -0.00167405;
    %%oil_ss = 0.02875935;

%------------------------------------------------------------------------------------------------------------------------
% 4.  Model Linearised
%------------------------------------------------------------------------------------------------------------------------

model(linear);

        %%%%%-----Aggregate demand-----%%%%%

c_h = gamma_c*(eta_c - eta_o)*(rer - psi_f) - (gamma_c*(eta_c - eta_o) + eta_o)*pr_h + c; // domestic consumption of home goods

c_f = (1-gamma_c)*(eta_c - eta_o)*pr_h + (gamma_c - eta_c)*(rer - psi_f) + c;             // domestic consumption of foreign goods

oil_c = -eta_o*pr_o + c;                                                                  // consumption of oil

c = (1/(1+phi))*c(+1) + (phi/(1+phi))*(c(-1)) - ((1-phi)/(sigma_c*(1+phi)))*(int_b - pi_tot(+1) - mew_b);  //  Consumption Euler equation 

(sigma_c/(1-phi))*(c - phi*c(-1)) = (sigma_c_star/(1-phi_star))*(y_star - phi_star*y_star(-1)) + rer; // from UIP --> international risk sharing Steinbach et al. Eq 44 based on Eq 31 = consistent with model equations
%%%% note: int_b = int_b_star + e_dot(+1) + mew_b_star; // UIP condition ---> note: with domestic bonds and policy rate not equal must include relevant risk shock as in Steinbach et al 2009

// OLD //kappa_v*(v - k) = kappa_v*beta_h*(v(+1) - k(+1)) + (1 - beta_h*(1 - delt))*(r_k(+1)) + (sigma_c)*(c - c(+1)); // + (sigma_c/(1-phi))*((c - phi*c(-1)) - (c(+1) - phi*c)); // Investment schedule
//kappa_v*(v(-1) - k(-1)) = kappa_v*beta_h*(v - k) + (1 - beta_h*(1 - delt))*(r_k) + (sigma_c)*(c - c(+1)); // + (sigma_c/(1-phi))*((c - phi*c(-1)) - (c(+1) - phi*c));       // Investment schedule
%%%% note: above timing of investment schedule adjusted due to countercyclical investment. See article for reasons habit formation excluded in the stchastic discount factor 
kappa_v*(v - k(-1)) = kappa_v*beta_h*(v(+1) - k) + (1 - beta_h*(1 - delt))*(r_k(+1)) + (sigma_c)*(c - c(+1));
%%%% timing correction above and k elsewhere below ... compare with 2017b or 2018 version

        %%%%%-----Aggregate supply and inflation-----%%%%%%

    %-----(real) wage setting-----%

pi_wage - gamma_w*pi_tot(-1) = beta_h*pi_wage(+1) - theta_w*beta_h*gamma_w*pi_tot 
                             + (((1 - theta_w)*(1 - theta_w*beta_h))/(theta_w*(1 + epsilon_w*sigma_n)))*(mrs_w - w); // Wage inflation or Real wage setting

mrs_w =(sigma_c/(1-phi))*(c - phi*c(-1)) + sigma_n*(n); // marginal rate of substitution in domestic wage inflation equation

    %-----domestic production and inflation (for consumption goods)-----%

pi_home = (gamma_p/(1+gamma_p*beta_h))*pi_home(-1) + (beta_h/(1+ gamma_p*beta_h))*pi_home(+1) + ((1-theta_h)*(1-theta_h*beta_h))/(theta_h*(1 + gamma_p*beta_h))*(mc_h + xi_p); // domestic inflation

mc_h = (w - pr_h) - (y_h - n);                         // real marginal cost wrt FOC labour
mc_h = r_k - (y_h - nu*k(-1) - yx);                        // with vartheta not equal to 1 real marginal cost wrt FOC capital
mc_h = (pr_o - pr_h) - (y_h - nu*oil_h - yx);          // with vartheta not equal to 1 real marginal cost wrt FOC oil
yx = vtheta*(1 - nu)*k(-1) + (1 - vtheta)*(1 - nu)*oil_h;  // yx is the nested term in prod func with elastic subst btw oil and capital

y_h = a + alph*n + (1 - alph)*vtheta*k(-1) + (1 - alph)*(1 - vtheta)*oil_h; // Cobb-Douglas production function with oil

    %-----Imported Inflation & Inflation Aggregation-----%

pi_foreign = beta_f*pi_foreign(+1) + (((1 - theta_f)*(1 - theta_f*beta_f))/theta_f)*psi_f;	 // Imported inflation where psi_f measures the lop gap
psi_f = rer - pr_f;         // law of one price gap

////pi_tot = (1 - gamma_o)*(1 - gamma_c)*pi_home + (1 - gamma_o)*(gamma_c)*pi_foreign + gamma_o*pi_oil;  // total domestic headline inflation
pi_z = pi_tot - (gamma_o/(1-gamma_o))*(pr_o - pr_o(-1));                                                 // M&S2005 core price inflation
////pi_z = (1-gamma_c)*pi_home + gamma_c*pi_foreign;                                                     // core price inflation

    %-----Evolution of Relative Prices-----%

pr_h = pr_h(-1) + pi_home - pi_tot;             // M&S2005, p.25 // domestic price relative to domestic headline/total price level
pr_o = rer + pr_o_star + psi_o;                 // M&S2005, p.25 // domestic price of oil relative to domestic headline/total price level
rer = rer(-1) + e_dot + pi_star - pi_tot;       // M&S2005, p.25 // real exchange rate equation (REER)

0 = gamma_o*pr_o + (1-gamma_o)*(1-gamma_c)*pr_h + (1-gamma_o)*(gamma_c)*(rer - psi_f); // M&S2005 Eq.(A20)
pr_f = pr_f(-1) + pi_foreign - pi_tot;               // foreign import price relative to domestic headline/total price level
s = pr_f - pr_h;                                     // s = terms of trade --> import price relative to domestic price.

pi_oil = pr_o - pr_o(-1) + pi_tot;                   // oil price inflation in domestic currency unit of account 
pi_oil_star = pr_o_star - pr_o_star(-1) + pi_star;   // oil price inflation in foreign (dollar) currency unit of account  

w = w(-1) + pi_wage - pi_tot;                        // real wage definition

    %-----Evolution of State variables-----%

// k(+1) = (1 - delt)*k + delt*v;                       // capital accumlation equation
k = (1 - delt)*k(-1) + delt*v;  

    %-----Policy rule------%

int_b = rho_i*int_b(-1) + (1 - rho_i)*(kappa_pi*pi_tot + kappa_y*(y - y(-1))) + epsil_i; // Monetary Policy rule with total inflation
//int_b = rho_i*int_b(-1) + (1 - rho_i)*(kappa_pi*pi_z + kappa_y*(y - y(-1))) + epsil_i; // Monetary Policy rule with core inflation

        %%%%%-----Foreign economy-----%%%%%%
%-----3 equation NK model-----%

y_star = (1/(1 + phi_star))*y_star(+1) 
       + (phi_star/(1 + phi_star))*(y_star(-1)) 
       - ((1 - phi_star)/(sigma_c_star*(1 + phi_star)))*(int_b_star - pi_star(+1) + mew_b_star);  //   foreign IS curve

pi_star = (gamma_star/(1 + gamma_star*beta_star))*pi_star(-1) 
        + (beta_star/(1 + gamma_star*beta_star))*pi_star(+1) 
        + ((1-theta_star)*(1-theta_star*beta_star))/(theta_star*(1 + gamma_star*beta_star))*(mc_star); // + xi_p_star foreign Phillips Curve 

mc_star = ((sigma_c_star/(1 - phi_star)) + sigma_n_star)*y_star 
        - ((sigma_c*phi)/(1 - phi_star))*y_star(-1) 
        - (1 + sigma_n_star)*a_star;                               // real marginal cost foreign economy 

int_b_star = rho_i_star*int_b_star(-1)
           + (1 - rho_i_star)*(kappa_pi_star*pi_star + kappa_y_star*(y_star - y_star(-1))) + epsil_i_star;  // Foreign Policy Rule

        %%%%%-----Aggregate Equilibrium-----%%%%%% [CHECK]

%%%% note: c_star = y_star;
y_h = CYh*c_h + (1-CYh)*x;                                    // Aggregate domestic production equilibrium 
y = CY*c + KY*delt*v + XY*x - MY*m;                           // Aggregate resource constraint for domestic economy
x = y_star - xi_f_star*(pr_h - rer);                          // Aggregate Export
m = CfM*c_f + OM*oil;                                         // Aggregate Imports
oil = OcO*oil_c + OhO*oil_h;                                  // Aggragte Oil

        %%%%%-----Stochastic processes-----%%%%%%

    %-----One/Two oil shocks-----%

pr_o_star = rho_prostar*pr_o_star(-1) + epsil_prostar;        // (1) relative foreign price of oil
//psi_o = rho_psi*psi_o(-1) - rho_psicc*pr_o_star(-1);        //  + epsil_psi (oil mod. 2 & 3)  
psi_o = 0;                                                    //  + epsil_psi (oil mod. 1) 

    %-----Three domestic shocks-----%

a = rho_a*a(-1) + epsil_a;                                    // (2) domestic productivity shock
xi_p = rho_p*xi_p(-1) + epsil_p;                              // (3) domestic price markup shock
                                                              // (4) plus policy rule epsil_i above

    %-----Five foreign shocks-----%

a_star = rho_a_star*a_star(-1) + epsil_a_star ;               // (5) foreign productivity shock in foreign IS curve
////xi_p_star = rho_p_star*xi_p_star(-1) + epsil_p_star;      // foreign price markup shock in foreign Ph-Curve
                                                              // (6) plus policy rule epsil_i_star above
mew_b_star = rho_d_star*mew_b_star(-1) + epsil_d_star;        // (7) Risk premium shock for domestic borrowing abroad, equivalent to a negative demand shock
mew_b = rho_d*mew_b(-1) + epsil_d;                            // (8) Domestic Risk premium shock for domestic borrowing abroad, equivalent to a negative demand shock
////xi_f_star = rho_f_star*xi_f_star(-1) + epsil_f_star;      // foreign price elasticity shock  on foreign deman for domestic goods                                                      

        %%%%%-----Measurement equations-----%%%%%%

pr_o_star_obs = pr_o_star - pr_o_star(-1) + pr_o_star_ss;
y_star_obs = y_star - y_star(-1) + y_star_ss;
pi_star_obs = pi_star + pi_star_ss;
int_b_star_obs = int_b_star + int_b_star_ss;

y_obs = y - y(-1) + y_ss;
pi_tot_obs = pi_tot + pi_tot_ss;
int_b_obs = int_b + int_b_ss;

//rer_obs = rer - rer(-1) + rer_ss;
//oil_obs = oil - oil(-1) + oil_ss;

end;


%------------------------------------------------------------------------------------------------------------------------
% 8.  Estimated paramaters // Impulse responses
%------------------------------------------------------------------------------------------------------------------------

estimated_params;

  %%Households
    eta_c, gamma_pdf, 0.6, 0.05;              // home-foreign substitution elasticity
    eta_o, gamma_pdf, 0.2, 0.05;              // oil-core cons substitution elasticity
    sigma_c, inv_gamma_pdf, 1, 0.2;           // coefficient of relative risk aversion
    //sigma_n, gamma_pdf, 3, 0.5;             // elasticity of labour
    //phi, beta_pdf, 0.7, 0.05;               // habit formation

    sigma_c_star, inv_gamma_pdf, 1, 0.2;      // foreign coefficient of relative risk aversion
    //phi_star, beta_pdf, 0.7, 0.05;          // calibrated to 0 // foreign habit formation
    nu, gamma_pdf, 2, 0.25;                   // elasticity of substitution between oil  and capital  

  %%Retailers and Unions
    theta_h, beta_pdf, 0.6, 0.05;             // domestic price stickiness
    gamma_p, beta_pdf, 0.6, 0.05;             // domestic degree of price indexation
    //theta_w, beta_pdf, 0.75, 0.1;           // wage stickiness
    //gamma_w, beta_pdf, 0.5, 0.1;            // degree of wage indexation
    theta_f, beta_pdf, 0.8, 0.05;             // foreign import price stickiness

    theta_star, beta_pdf, 0.75, 0.1;          // foreign price stickiness
    //gamma_star, beta_pdf, 0.5, 0.1;         // calibrated to 0 // foreign degree of price indexation

  %% Investment adjustment cost
    //kappa_v, gamma_pdf, 0.25, 0.25;           //  Investment adjustment cost

  %%Monetary Policy function
    kappa_pi, gamma_pdf, 1.5, 0.2;            // domestic Taylor rule coefficient on pi
    kappa_y, beta_pdf, 0.5, 0.2;              // domestic Taylor rule coefficient on y

    kappa_pi_star, gamma_pdf, 1.5, 0.2;       // foreign Taylor rule coefficient on pi
    kappa_y_star, beta_pdf, 0.5, 0.2;         // foreign Taylor rule coefficient on y

  %%Oil imports and domestic exports 
    xi_f_star, gamma_pdf, 2, 0.5;        // elasticity of foreign demand (export equation) M&S2005p.15&Eq.(19),p.10          
    //OcO, beta_pdf, 0.8, 0.1;           // Share of HH consumption of oil to total oil imports 
    //OhO, beta_pdf, 0.2, 0.1;           // Share of Firm usage of oil to total oil imports

  %%coefficients of AR(1) shocks
    rho_prostar, beta_pdf, 0.75, 0.1;       // relative foreign oil price shock
    //rho_psi, beta_pdf, 0.75, 0.1;         // deviations from the l.o.p for the oil price in domestic currency units
    //rho_psicc, beta_pdf, 0.5, 0.1;        // cross-correlation l.o.p gap for oil
    rho_a, beta_pdf, 0.75, 0.1;             // productivity shock persistance parameter
    rho_d, beta_pdf, 0.75, 0.1;             // domestic risk premium shock
    rho_p, beta_pdf, 0.75, 0.1;             // price markup shock
    rho_i, beta_pdf, 0.75, 0.1;             // MP policy shock smoothing

	rho_a_star, beta_pdf, 0.75, 0.1;        // foreign productivity shock persistance parameter
	//rho_p_star, beta_pdf, 0.75, 0.1;      // foreign price markup shock
    rho_i_star, beta_pdf, 0.75, 0.1;        // degree of foreign policy smoothing
    rho_d_star, beta_pdf, 0.75, 0.1;        // foreign risk premium shock
    //rho_f_star, beta_pdf, 0.75, 0.1;      // foreign price elasticity shock

  %%innovations of the 9 shocks
    stderr epsil_prostar, inv_gamma_pdf, 0.1, inf;      // (1) relative foreign price of oil
    //stderr epsil_psi, inv_gamma_pdf, 0.01, inf;       // domestic oil price markup shock l.o.o.p
    stderr epsil_a, inv_gamma_pdf, 0.01, inf;           // (2) domestic productivity shock
    stderr epsil_p, inv_gamma_pdf, 0.01, inf;           // (3) domestic price markup shock
    stderr epsil_i, inv_gamma_pdf, 0.01, inf;           // (4) domestic policy rule
    stderr epsil_a_star, inv_gamma_pdf, 0.01, inf;      // (5) foreign productivity shock in foreign IS curve 
    //stderr epsil_p_star, inv_gamma_pdf, 0.01, inf;    // foreign price markup shock in foreign Ph-Curve     
    stderr epsil_i_star, inv_gamma_pdf, 0.01, inf;      // (6) foreign policy rule
    stderr epsil_d_star, inv_gamma_pdf, 0.01, inf;      // (7) Foreign risk premium shock, equivalent to a negative demand shock
    stderr epsil_d, inv_gamma_pdf, 0.01, inf;           // (8) domestic risk premium shock, equivalent to a negative demand shock

end;

//estimated_params_init(use_calibration);
//end;

varobs pr_o_star_obs y_star_obs pi_star_obs int_b_star_obs y_obs pi_tot_obs int_b_obs; // rer_obs oil_obs

//load_mh_file, GHW2017b_SOEoil_mode, %%%%% forecast=8, nodisplay 
//conditional_variance_decomposition=[1:20],
//, nodisplay 

%options_.plot_priors=0;

estimation(datafile=GHWEstimation7, mh_drop=0.5, mh_nblocks=3, mh_replic=100000, mh_jscale=0.35, // load_mh_file,  mh_jscale=0.26 (original)
           mode_compute=0, mode_check, mode_file=GHW2018b_SOEoil_mh_mode, // mode_file=GHW2017b_SOEoil_mode, 
           bayesian_irf, irf=20, moments_varendo, conditional_variance_decomposition=[1:20],
           graph_format=fig, nodisplay) y pi_tot int_b pi_home pi_foreign pi_oil rer e_dot oil y_star pi_star int_b_star oil_c oil_h v k n;

shock_groups(name=netoil);
'Real oil price (net)' = epsil_prostar;      // , epsil_psi    
'Foreign supply' = epsil_a_star;
//'Foreign price markup' = epsil_p_star;     
'Foreign monetary policy' = epsil_i_star;
'Technology' = epsil_a;           
'Price markup' = epsil_p;
'Monetary policy' = epsil_i;
'Foreign risk premium' = epsil_d_star;
'Domestic risk premium' = epsil_d;
end;

%%%% Shock Decomposition option
shock_decomposition(colormap=jet) y_obs pi_tot_obs int_b_obs;
plot_shock_decomposition(graph_format=(fig), use_shock_groups=netoil, colormap=jet, steadystate) y_obs pi_tot_obs int_b_obs;

%%%% identification(parameter_set = prior_mode); //  prior_mean
identification(advanced=1, max_dim_cova_group=2, parameter_set = posterior_mean);

%----------------------------------------------------------------
% generate LaTeX output
%----------------------------------------------------------------

%write_latex_static_model ;
%write_latex_dynamic_model;
%write_latex_parameter_table;
%write_latex_definitions;
%% write_latex_prior_table;
%% generate_trace_plots(1);
%collect_latex_files;
%if system(['pdflatex -halt-on-error -interaction=batchmode ' M_.fname '_TeX_binder.tex'])
%    error('TeX-File did not compile.')
%end