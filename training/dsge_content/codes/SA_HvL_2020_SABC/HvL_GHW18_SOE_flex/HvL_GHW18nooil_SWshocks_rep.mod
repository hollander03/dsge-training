%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%MAIN WORKING ESTIMATION FILE 
%SOENK-DSGE (baseline) with no Oil in consumption and production 2015 %% reduces estbtest2.mod (+ added mew_b shock as in Steinbach et al. 2009)
%% MP rule (core inflation = headline) M&S2005
%% 7 shocks: NOTE: mew_b included but epsil_p_star excluded --- collinearity --- label foreign supply shock
%Date: 29 April 2016 /// 1 Novemeber 2017                            
%Topic: Small open economy New Keynesian DSGE model of South Africa with Oil in consumption and production (and possibly investment)
% Mode for HGW18 nooil model used %% Main working file
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%% MP rule for model comparisons: interest rate responds to deviations of inflation and output growth from steady
%%%%%%%%% same as Gerali eta l2010, GHW2018; similar to Ireland2011
%%%%%%%%% For comparison w/ SW (2007): add shocks to investment, wage setting and exogenous spending
%%%%%%%%% Exogenous spending shock proxies for Ireland's preference shock: both are "demand shocks"
%% Estimation Period: 1995Q1 - 2017Q2
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

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
    //pi_z           // core price inflation
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
    tb               // trade balance

    mew_b           // NB interest rate risk premium shock over domestic policy rate   
    mew_b_star      // risk premium shock for domestic bonds (like in our model)
    xi_v            // domestic investment specific shock
    xi_p            // domestic price shock
    xi_w            // domestic wage shock
    xi_ys
    a               // domestic productivity shock
    a_star          // foreign productivity shock

    y_star_obs
    pi_star_obs
    int_b_star_obs
    y_obs
    c_obs
    pi_tot_obs
    int_b_obs
    w_obs
    v_obs
    //rer_obs
    n_obs
    
    winflationa
    inflationa      // annualized total headline inflation
    interesta       // annualized interest rate
    ygap               // output gap

%%%%%% FLEX EQUILIBRIUM %%%%%%%

    cn_h              // consumption of home goods
    cn_f              // consumption of foreign goods
    cn                // total consumption
    nn                // labour supply

	intn_b            // natural interest rate

	vn                // investment 
    kn                // physical capital
    rn_k              // real rate of return on physical capital

	mrsn_w            // MRS btw consumption and labour
    wn                // real domestic wage

    yn_h              // domestic output

    prn_h             // relative price of domestic goods
    prn_f             // relative foreign import price (to domestic price level) ---> nifty algebra trick
    rern              // real exchange rate
    sn                // terms of trade p_f - p_h // added

	yn_star           // foreign IS Curve (output)
    intn_b_star       // foreign Policy Rule (nominal interest rate)

    yn                // total gross domestic production (i.e., includes exports less imports)
    xn                // exports to foreign economy
    mn                // imports from foreign economy
    tbn               // trade balance

;

%------------------------------------------------------------------------------------------------------------------------
% 2.  Exogenous Variables
%------------------------------------------------------------------------------------------------------------------------

varexo  epsil_a_star epsil_i_star epsil_a epsil_p epsil_w epsil_v epsil_ys epsil_i epsil_d_star epsil_d ;  //    

%------------------------------------------------------------------------------------------------------------------------
% 3.  Parameters
%------------------------------------------------------------------------------------------------------------------------

parameters
%%%%% fixed %%%%%%
	gamma_c 
    epsilon_w
    delt
    beta_h
    alph
    beta_f
    rho_ys
 
%%%%% Estimated %%%%%%        
	eta_c     	 
	phi 
	sigma_c 
    sigma_n

    kappa_v

    theta_w
    gamma_w 
	theta_h
    gamma_p
 
	theta_f 

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
    rho_w
    rho_v
    rho_ys cgy cgystar
    rho_a_star
	rho_d_star

    y_star_ss pi_star_ss int_b_star_ss y_ss c_ss pi_tot_ss int_b_ss w_ss v_ss n_ss //  rer_ss
;

%------------------------------------------------------------------------------------------------------------------------
% 3.  Calibration parameters values
%------------------------------------------------------------------------------------------------------------------------

	gamma_c = 0.2732;      // proxied by: MY. import share in home-foreign consumption // import share of foreign goods in non-fuel goods consumption
    eta_c =	0.6;          // Home-foreign substitution elasticity  // intertemporal elasticities of substitution for oil and foreign consumption
    
	beta_h = 0.99;         // discount factor home  %% SW = = 0.998345741 %% IR = = 0.994129  
	phi = 0.7;              // habit formation
    sigma_c	= 1;        // Relative Risk Aversion or inverse of the intertemporal elasticity of subst in consumption
    sigma_n = 3;            // 1 or 3 elasticity of labour supply

    delt = 0.03;          // rate of depreciation
    kappa_v = 0.25;            // physical capital adjustment cost // Bernanke Gilchrist Gertler 1999 p.32-33

    epsilon_w = 5;          // wage elasticity of substitution
    theta_w	= 0.75;          // sticky wage adjustment
    gamma_w = 0.5;          // wage indexation

    theta_h	= 0.6;          // sticky domestic price adjustment
    gamma_p = 0.6;          // domestic price indexation
    
    alph =	0.7;            // share of labour in firm production

    theta_f	= 0.8;        // foreign sticky price adjustment
    beta_f = 0.99;          // foreign discount factor

    kappa_pi = 1.5;   // weight on inflation in Taylor rule
    kappa_y	= 0.5;        // weight on output change in Taylor rule

    phi_star  = 0;         // foreign habit formation 
    sigma_c_star = 1;        // foreign RRA
    sigma_n_star = 3;        // foreign labour disutility
    
    theta_star 	= 0.75;     // foreign sticky price setting
    gamma_star  = 0;       // foreign price indexation
    beta_star = 0.99;        // foreign discount factor

    kappa_pi_star = 1.25;   //foreign weight on inflation in foreign policy rule
	kappa_y_star = 0.5;    // foreign weight on output change in foreign policy rule

    xi_f_star = 0.5;      // elasticity of foreign demand (export equation) M&S2005 p.15 & Eq. (19), p.10. [Eq (43) in terms of trade section]

    CYh = 0.659;            // data=0.615. model = 0.659. Home consumption to home production ratio
    IY = 0.199;             // investment-Output ratio // data calibrated
    KY = (IY/delt);           // Capital-Output ratio 
    XY = 0.2792;            // Export-Output ratio // data calibrated
    MY = 0.2732;            // Import-Output ratio // data calibrated
    CY = (1 - IY - XY + MY);  // 0.795 Total consumption to total output ratio M&S2005 CY = 1 - IY - XY + MY
    CfM = 1;          //  Cons of foreign goods to total imports ratio

    rho_a	=	0.75;   // productivity shock persistance parameter
    rho_d	=	0.75;
    rho_p	=	0.75;   // price markup shock
    rho_w	=	0.75;   // wage markup shock
    rho_v	=	0.75;   // inve specfic shock
    rho_i	=	0.75;   // MP policy shock smoothing
    rho_ys = 0.815;      // exognous spending persistence
    cgy = 0;          // weight on domestic tech shock in exogenous spending
    cgystar = 0;      // weight on foreign tech shock in exogenous spending

	rho_a_star 	= 0.75;   // foreign productivity shock persistance parameter
    rho_i_star  = 0.75;     // degree of foreign policy smoothing
    rho_d_star 	= 0.75;   // foreign risk premium shock on domestic borrowing abroad

    y_star_ss = 0.0028913917;  //  
    pi_star_ss = 0.00399311;  //  
    int_b_star_ss = 0.0057804112;
    y_ss = 0.0023931;        //  
    c_ss = 0.0037278;
    v_ss = 0.006615576;
    w_ss = -0.0008587841;
    pi_tot_ss = 0.013976856;
    int_b_ss = 0.022398;
    //rer_ss = -0.0040266; // 
    n_ss = 0.001353937; //


%------------------------------------------------------------------------------------------------------------------------
% 4.  Model Linearised
%------------------------------------------------------------------------------------------------------------------------

model(linear);

%%%%%%%%%%% FLEX EQUILIBRIUM START %%%%%%%%%%%%%

        %%%%%-----Aggregate demand-----%%%%%

cn_h = (gamma_c*(eta_c))*prn_f - (gamma_c*(eta_c))*prn_h + cn; // domestic consumption of home goods

cn_f = (1 - gamma_c)*(eta_c)*prn_h + (gamma_c - eta_c)*(prn_f) + cn; // domestic consumption of foreign goods

cn = (1/(1+phi))*cn(+1) + (phi/(1+phi))*(cn(-1)) - ((1-phi)/(sigma_c*(1+phi)))*(intn_b);  // Consumption Euler equation 

(sigma_c/(1-phi))*(cn - phi*cn(-1)) = (sigma_c_star/(1-phi_star))*(yn_star - phi_star*yn_star(-1)) + rern; // UIP --> international risk sharing Steinbach et al. Eq 44 based on Eq 31 = consistent with model equations

kappa_v*(vn(-1) - kn(-1)) = kappa_v*beta_h*(vn - kn) + (1 - beta_h*(1 - delt))*(rn_k) + (sigma_c)*(cn(-1) - cn) + xi_v; // Investment schedule

        %%%%%-----Aggregate supply and inflation-----%%%%%%

    %-----(real) wage setting-----%

mrsn_w = wn; // Wage inflation or Real wage setting

mrsn_w =(sigma_c/(1-phi))*(cn - phi*cn(-1)) + sigma_n*(nn); // marginal rate of substitution

    %-----domestic production and inflation (for consumption goods)-----%

(wn - prn_h) = (yn_h - nn);   //  real marginal cost =0 wrt FOC labour
rn_k = (yn_h - kn);   //  real marginal cost =0 wrt FOC capital

yn_h = a + alph*nn + (1 - alph)*kn; // Cobb-Douglas production function with oil, assume \nu=1

    %-----Evolution of Relative Prices-----%

rern = prn_f;                                // law of one price holds
0 = (1-gamma_c)*prn_h + (gamma_c)*(rern);    // M&S2005 Eq.(A20)
sn = prn_f - prn_h;                           // s = terms of trade --> import price relative to domestic price.

    %-----Evolution of State variables-----%

kn(+1) = (1 - delt)*kn + delt*vn;          // + delt*kappa_v*xi_v  //  capital accumlation equation


        %%%%%-----Foreign economy-----%%%%%%
%-----3 equation NK model-----%


yn_star = (1/(1 + phi_star))*yn_star(+1) 
       + (phi_star/(1 + phi_star))*(yn_star(-1)) 
       - ((1 - phi_star)/(sigma_c_star*(1 + phi_star)))*(intn_b_star);  //  foreign IS curve

yn_star = ((1 + sigma_n_star)/(sigma_c_star + sigma_n_star))*a_star;

        %%%%%-----Aggregate Equilibrium-----%%%%%% [CHECK]

yn_h = CYh*cn_h + (1-CYh)*xn; //  M&S2005  // aggregate domestic production equilibrium 

yn = CY*cn + KY*delt*vn + XY*xn - MY*mn + xi_ys;              // Aggregate resource constraint for domestic economy
xn = yn_star - xi_f_star*(prn_h - rern);              // Aggregate Export
mn = CfM*cn_f;                                        // Aggregate Imports
      
%%%%%%%%%%% FLEX EQUILIBRIUM END %%%%%%%%%%%%%
%%%%%%%%%%% FRICTIONS EQUILIBRIUM START %%%%%%%%%%%%%
                                          
        %%%%%-----Aggregate demand-----%%%%%

c_h = gamma_c*(eta_c)*(pr_f) - (gamma_c*(eta_c))*pr_h + c; // domestic consumption of home goods

c_f = (1 - gamma_c)*(eta_c)*pr_h + (gamma_c - eta_c)*(pr_f) + c; // domestic consumption of foreign goods

c = (1/(1+phi))*c(+1) + (phi/(1+phi))*(c(-1)) - ((1-phi)/(sigma_c*(1+phi)))*(int_b - pi_tot(+1) - mew_b);  // - mew_b // Consumption Euler equation 

(sigma_c/(1-phi))*(c - phi*c(-1)) = (sigma_c_star/(1-phi_star))*(y_star - phi_star*y_star(-1)) + rer ; // UIP --> international risk sharing Steinbach et al. Eq 44 based on Eq 31 = consistent with model equations
//(int_b - int_b_star) - (mew_b_star - mew_b) = e_dot(+1);                                                     // UIP condition

kappa_v*(v(-1) - k(-1)) = kappa_v*beta_h*(v - k) + (1 - beta_h*(1 - delt))*(r_k) + (sigma_c)*(c(-1) - c) + xi_v; // Investment schedule
//kappa_v*(v - k) = kappa_v*beta_h*(v(+1) - k(+1)) + (1 - beta_h*(1 - delt))*(r_k(+1)) + (sigma_c/(1-phi))*((c - phi*c(-1)) - (c(+1) - phi*c)) + xi_v; // Investment schedule

        %%%%%-----Aggregate supply and inflation-----%%%%%%

    %-----(real) wage setting-----%

pi_wage - gamma_w*pi_tot(-1) = beta_h*pi_wage(+1) - theta_w*beta_h*gamma_w*pi_tot 
                             + (((1 - theta_w)*(1 - theta_w*beta_h))/(theta_w*(1 + epsilon_w*sigma_n)))*(mrs_w - w) + xi_w; // + epsil_w Wage inflation or Real wage setting

mrs_w =(sigma_c/(1-phi))*(c - phi*c(-1)) + sigma_n*(n); // marginal rate of substitution in domestic wage inflation equation

    %-----domestic production and inflation (for consumption goods)-----%

pi_home = (gamma_p/(1+gamma_p*beta_h))*pi_home(-1) + (beta_h/(1+ gamma_p*beta_h))*pi_home(+1) + ((1-theta_h)*(1-theta_h*beta_h))/(theta_h*(1 + gamma_p*beta_h))*(mc_h + xi_p); // domestic inflation

mc_h = (w - pr_h) - (y_h - n);   //  real marginal cost wrt FOC labour
mc_h = r_k - (y_h - k);   //  real marginal cost wrt FOC capital

y_h = a + alph*n + (1 - alph)*k; // Cobb-Douglas production function with oil, assume \nu=1

    %-----Imported Inflation & Inflation Aggregation-----%

pi_foreign = beta_f*pi_foreign(+1) + (((1 - theta_f)*(1 - theta_f*beta_f))/theta_f)*psi_f;	 // Imported inflation where psi_f measures the lop gap
psi_f = rer - pr_f;         // law of one price gap

    %-----Evolution of Relative Prices-----%

pr_h = pr_h(-1) + pi_home - pi_tot;         // M&S2005, p.25 // domestic price relative to domestic headline/total price level
rer = rer(-1) + e_dot + pi_star - pi_tot;   // M&S2005, p.25 // real exchange rate equation (REER)

0 = (1-gamma_c)*pr_h + (gamma_c)*(rer - psi_f);    // M&S2005 Eq.(A20)
pr_f = pr_f(-1) + pi_foreign - pi_tot;             // foreign import price relative to domestic headline/total price level
s = pr_f - pr_h;                                   // s = terms of trade --> import price relative to domestic price.

w = w(-1) + pi_wage - pi_tot;                      // real wage definition

    %-----Evolution of State variables-----%

k(+1) = (1 - delt)*k + delt*v;          // + delt*kappa_v*xi_v  // capital accumlation equation

    %-----Policy rule------%

int_b = rho_i*int_b(-1) + (1 - rho_i)*(kappa_pi*pi_tot + kappa_y*(y - y(-1))) + epsil_i; // Monetary Policy rule with total inflation

//int_b = rho_i*int_b(-1) + kappa_pi*pi_tot + kappa_y*ygap + epsil_i; // Monetary Policy rule with total inflation and output gap

//int_b = rho_i*int_b(-1) + (1 - rho_i)*(kappa_pi*pi_z + kappa_y*(y - y(-1))) + epsil_i; // Monetary Policy rule with core inflation

        %%%%%-----Foreign economy-----%%%%%%
    %-----3 equation NK model-----%

y_star = (1/(1 + phi_star))*y_star(+1) 
       + (phi_star/(1 + phi_star))*(y_star(-1)) 
       - ((1 - phi_star)/(sigma_c_star*(1 + phi_star)))*(int_b_star - pi_star(+1) + mew_b_star);       //  foreign IS curve // note: c_star = y_star;

pi_star = (gamma_star/(1 + gamma_star*beta_star))*pi_star(-1) 
        + (beta_star/(1 + gamma_star*beta_star))*pi_star(+1) 
        + ((1-theta_star)*(1-theta_star*beta_star))/(theta_star*(1 + gamma_star*beta_star))*(mc_star); //  foreign Phillips Curve

mc_star = ((sigma_c_star/(1 - phi_star)) + sigma_n_star)*y_star 
        - ((sigma_c*phi)/(1 - phi_star))*y_star(-1) 
        - (1 + sigma_n_star)*a_star;                                                                   // real marginal cost foreign economy 

int_b_star = rho_i_star*int_b_star(-1)
           + (1 - rho_i_star)*(kappa_pi_star*pi_star + kappa_y_star*(y_star - y_star(-1))) + epsil_i_star;  // Foreign Policy Rule

        %%%%%-----Aggregate Equilibrium-----%%%%%% [CHECK]

y_h = CYh*c_h + (1-CYh)*x;                   //  M&S2005  // aggregate domestic production equilibrium 

y = CY*c + KY*delt*v + XY*x - MY*m + xi_ys;                       // Aggregate resource constraint for domestic economy
x = y_star - xi_f_star*(pr_h - rer);                      // Aggregate Export
m = CfM*c_f;                                              // Aggregate Imports

        %%%%%-----Stochastic processes-----%%%%%%

a = rho_a*a(-1) + epsil_a;                                // (1) domestic productivity shock
xi_p = rho_p*xi_p(-1) + epsil_p;                          // (2) domestic price markup shock
xi_w = rho_w*xi_w(-1) + epsil_w;                          // (3) domestic wage markup shock
xi_v = rho_v*xi_v(-1) + epsil_v;                          // (4) domestic investment shock
xi_ys = rho_ys*xi_ys(-1) + epsil_ys + cgy*epsil_a 
                                    + cgystar*epsil_a_star;   // (5) spending shock (a la SW (2007)) g = crhog*(g(-1)) + eg + cgy*ea;
                                                          // (6) plus policy rule epsil_i above
a_star = rho_a_star*a_star(-1) + epsil_a_star ;           // (7) foreign productivity shock in foreign IS curve
                                                          // (8) plus policy rule epsil_i_star above
mew_b_star = rho_d_star*mew_b_star(-1) + epsil_d_star;    // (9) Risk premium shock on foreign currency assets, equivalent to a negative demand shock
 
mew_b = rho_d*mew_b(-1) + epsil_d;                        // (10) Risk premium shock on domestic currency assets, equivalent to a negative demand shock

        %%%%%-----Measurement equations-----%%%%%%

y_star_obs = y_star - y_star(-1) + y_star_ss;            
pi_star_obs = pi_star + pi_star_ss;
int_b_star_obs = int_b_star + int_b_star_ss;
y_obs = y - y(-1) + y_ss;
c_obs = c - c(-1) + c_ss;
pi_tot_obs = pi_tot + pi_tot_ss;
int_b_obs = int_b + int_b_ss;
// rer_obs = rer - rer(-1) + rer_ss;
n_obs = n - n(-1) + n_ss;
w_obs = w - w(-1) + w_ss;
v_obs = v - v(-1) + v_ss;

tbn = xn - mn;                                     // Flex Price Trade balance
tb = x - m;                                        // Trade balance

//annualized wage inflation
winflationa = pi_wage*4;
//annualized inflation and interest rate
inflationa = pi_tot*4;
interesta = int_b*4;
//output gap 
ygap = y - yn;
//output growth


end;

steady;
check;

shocks;

var epsil_a; //productivity shock
stderr 0.4582;

var epsil_p; // price markeup shock
stderr 0.1410;

var epsil_i; // monetary policy shock
stderr 0.2449;

var epsil_d;
stderr 0.2400;

var epsil_a_star;
stderr 0.4582;

var epsil_i_star;
stderr 0.2449;

var epsil_d_star;
stderr 0.2400;

var epsil_w; // wage markup shock
stderr 0.2446;

var epsil_v; // investment shock
stderr 0.2400;

var epsil_ys;     // exogenous spending shock (govt + NX)
stderr 0.5291;

end;

%% stoch_simul(irf=20, graph_format=fig) y_obs inflationa interesta ygap int_b pi_tot y yn ;

%------------------------------------------------------------------------------------------------------------------------
% 8.  Estimated paramaters // Impulse responses
%------------------------------------------------------------------------------------------------------------------------

estimated_params;

  %%Households
    eta_c, gamma_pdf, 1, 0.5;              // home-foreign substitution elasticity
    sigma_c, inv_gamma_pdf, 1.5, 0.5;      // coefficient of relative risk aversion
    sigma_n, gamma_pdf, 1.5, 0.5;           // elasticity of labour
    phi, beta_pdf, 0.7, 0.1;               // habit formation
    //gamma_c, beta_pdf, 0.25, 0.05;       // foreign import goods share in consumption

    sigma_c_star, inv_gamma_pdf, 1.5, 0.25;   // foreign coefficient of relative risk aversion
    sigma_n_star, gamma_pdf, 1.5, 0.5;       // foreign elasticity of labour
    phi_star, beta_pdf, 0.7, 0.1;       // calibrated to 0     // foreign habit formation
    
  %%Retailers and Unions
    theta_h, beta_pdf, 0.7, 0.1;           // domestic price stickiness
    gamma_p, beta_pdf, 0.3, 0.1;            // domestic degree of price indexation
    theta_w, beta_pdf, 0.7, 0.1;           // wage stickiness
    gamma_w, beta_pdf, 0.3, 0.1;           // degree of wage indexation
    theta_f, beta_pdf, 0.8, 0.1;           // foreign import price stickiness
    kappa_v, inv_gamma_pdf, 0.25, 0.5;    //  investment adjustment cost

    theta_star, beta_pdf, 0.7, 0.1;           // foreign price stickiness
    gamma_star, beta_pdf, 0.3, 0.1;       // calibrated to 0      // foreign degree of price indexation

  %%Monetary Policy function
    kappa_pi, gamma_pdf, 1.5, 0.1;        // domestic Taylor rule coefficient on pi
    kappa_y, beta_pdf, 0.5, 0.1;         // domestic Taylor rule coefficient on y

    kappa_pi_star, gamma_pdf, 1.5, 0.1;  // foreign Taylor rule coefficient on pi
    kappa_y_star, beta_pdf, 0.5, 0.1;    // foreign Taylor rule coefficient on y

  %%Oil imports and domestic exports 
    xi_f_star, gamma_pdf, 2, 0.5;        // elasticity of foreign demand (export equation) M&S2005p.15&Eq.(19),p.10          
    
  %%coefficients of AR(1) shocks
    rho_a, beta_pdf, 0.5, 0.1;           // productivity shock persistance parameter
    rho_d, beta_pdf, 0.5, 0.1;           // domestic risk premium shock
    rho_p, beta_pdf, 0.5, 0.1;           // price markup shock
	rho_w, beta_pdf, 0.5, 0.1;           // wage markup shock
	rho_v, beta_pdf, 0.5, 0.1;           // investment shock
	//rho_ys, beta_pdf, 0.5, 0.1;          // exogenous spending shock
    rho_i, beta_pdf, 0.5, 0.1;           // MP policy shock smoothing

	rho_a_star, beta_pdf, 0.5, 0.1;      // foreign productivity shock persistance parameter
    rho_i_star, beta_pdf, 0.5, 0.1;     // degree of foreign policy smoothing
    rho_d_star, beta_pdf, 0.5, 0.1;     // foreign risk premium shock on foreign currency assets
    //rho_f_star, beta_pdf, 0.5, 0.1;     // foreign price elasticity shock

    cgy, beta_pdf, 0.5, 0.1;             //weight on technology shock in exo spending process
    cgystar, beta_pdf, 0.5, 0.1;         //weight on technology shock in exo spending process

  %%innovations of the 7 shocks
    stderr epsil_a_star, inv_gamma_pdf, 0.01, inf;       // (9) foreign productivity shock in foreign IS curve   
    stderr epsil_i_star, inv_gamma_pdf, 0.01, inf;       // (8) foreign policy rule
    stderr epsil_a, inv_gamma_pdf, 0.01, inf;            // (1) domestic productivity shock
    stderr epsil_p, inv_gamma_pdf, 0.01, inf;            // (2) domestic price markup shock
    stderr epsil_w, inv_gamma_pdf, 0.01, inf;            // (3) domestic wage markup shock 
    stderr epsil_v, inv_gamma_pdf, 0.01, inf;            // (4) domestic investment shock 
    stderr epsil_i, inv_gamma_pdf, 0.01, inf;            // (5) domestic policy rule
    stderr epsil_d_star, inv_gamma_pdf, 0.01, inf;       // (7) Risk premium shock for domestic borrowing abroad, equivalent to a negative demand shock
    stderr epsil_d, inv_gamma_pdf, 0.01, inf;            // (6) risk premium
    stderr epsil_ys, inv_gamma_pdf, 0.01, inf;           // (10) exog spending shock

end;

%%estimated_params_init (use_calibration);
%%end;

%%varobs  y_star_obs pi_star_obs int_b_star_obs y_obs pi_tot_obs int_b_obs; //   GHWEstimation6
varobs  y_star_obs pi_star_obs int_b_star_obs y_obs c_obs v_obs w_obs pi_tot_obs int_b_obs n_obs; //  GHWEstimation10SW
%%varobs  y_star_obs pi_star_obs int_b_star_obs y_obs c_obs v_obs w_obs pi_tot_obs int_b_obs rer_obs; //  GHWEstimation10

//load_mh_file, mode_file=GH2015_SOEnooil_est_mode, mode_file=GHW2017b_SOEnooil_mode
//moments_varendo, conditional_variance_decomposition=[1:20], , forecast=8, nodisplay
//, nodisplay

estimation(datafile=GHWEstimation10SW, mh_nblocks=3, mh_replic=100000, mh_drop=0.5, mh_jscale=0.35, 
           mode_compute=0, mode_file=HvL_GHW18nooil_SWshocks_rep_mode, mode_check, bayesian_irf, irf=20, moments_varendo, conditional_variance_decomposition=[1:20],
           graph_format=fig) y_obs inflationa interesta ygap y c v n winflationa pi_wage pi_home pi_foreign tb rer e_dot s k ;

shock_groups(name=groups);
'Foreign' = epsil_a_star, epsil_i_star, epsil_d_star;
'Domestic demand' = epsil_i, epsil_d, epsil_v;
'Domestic supply' = epsil_a, epsil_p, epsil_w;
'Exogenous spending' = epsil_ys;           
end;

//// Shock Decomposition option
 shock_decomposition(colormap=jet) y_obs pi_tot_obs int_b_obs ygap y;
 plot_shock_decomposition(graph_format=(fig), use_shock_groups=groups, colormap=jet, steadystate) y_obs inflationa interesta y ygap;

// //see HLbEstIdentification.mod for identification example
// //identification(parameter_set = prior_mode);
%% identification(advanced=1, max_dim_cova_group=2, parameter_set = posterior_mean);

//dynare GHW2017ctest_SOEoil.mod;
//dynare GHW2017_SOEoil.mod;
