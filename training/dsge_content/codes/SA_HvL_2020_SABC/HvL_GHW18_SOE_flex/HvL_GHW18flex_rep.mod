%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Date:                           
%Topic: Small open economy New Keynesian DSGE model for South Africa: flex price equilibrium
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

    an               // domestic productivity shock
    an_star          // foreign productivity shock

    yn_star_obs
    intn_b_star_obs
    yn_obs
    intn_b_obs
    //rern_obs
;

%------------------------------------------------------------------------------------------------------------------------
% 2.  Exogenous Variables
%------------------------------------------------------------------------------------------------------------------------

varexo  epsil_a_star epsil_a ;  

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

    delt
    kappa_v   
    alph
    beta_f

    phi_star
	sigma_c_star 
	sigma_n_star  
	beta_star	
    xi_f_star

    CYh 
    CY 
    IY
    KY 
    XY 
    MY
    CfM

    rho_a 
    rho_a_star

    y_star_ss int_b_star_ss y_ss int_b_ss 
    //rer_ss
;

%------------------------------------------------------------------------------------------------------------------------
% 3.  Calibration parameters values
%------------------------------------------------------------------------------------------------------------------------

	gamma_c = 0.2732;      // proxied by: MY. import share in home-foreign consumption // import share of foreign goods in non-fuel goods consumption
    eta_c =	0.6;           // Home-foreign substitution elasticity  // intertemporal elasticities of substitution for oil and foreign consumption
    
	beta_h = 0.99;          // discount factor home    
	phi = 0.7;              // habit formation
    sigma_c	= 1;            // Relative Risk Aversion or inverse of the intertemporal elasticity of subst in consumption
    sigma_n = 3;            // 1 or 3 elasticity of labour supply

    delt = 0.03;            // rate of depreciation
    kappa_v = 0.25;         // physical capital adjustment cost // Bernanke Gilchrist Gertler 1999 p.32-33
    alph =	0.7;            // share of labour in firm production
    beta_f = 0.99;          // foreign discount factor

    phi_star  = 0;         // foreign habit formation 
    sigma_c_star = 1;        // foreign RRA
    sigma_n_star = 3;        // foreign labour disutility  
    beta_star = 0.99;        // foreign discount factor
    xi_f_star = 4;      // elasticity of foreign demand (export equation) M&S2005 p.15 & Eq. (19), p.10. [Eq (43) in terms of trade section]

    CYh = 0.659;            // data=0.615. model = 0.659. Home consumption to home production ratio
    IY = 0.199;             // investment-Output ratio // data calibrated
    KY = (IY/delt);           // Capital-Output ratio 
    XY = 0.2792;            // Export-Output ratio // data calibrated
    MY = 0.2732;            // Import-Output ratio // data calibrated
    CY = (1 - IY - XY + MY);  // 0.795 Total consumption to total output ratio M&S2005 CY = 1 - IY - XY + MY
    CfM = 1;          //  Cons of foreign goods to total imports ratio

    rho_a	=	0.75;   // productivity shock persistance parameter
	rho_a_star 	= 0.75;   // foreign productivity shock persistance parameter

    y_star_ss = 0.0028913917;  
    int_b_star_ss = 0.0057804112;
    y_ss = 0.00238535346;        
    int_b_ss = 0.022398;
    %%rer_ss = -0.00167405; //  -0.0125654 (REER SARB(q) rounded ) // -0.00167405 (REER SARB(m) unround)

%------------------------------------------------------------------------------------------------------------------------
% 4.  Model Linearised
%------------------------------------------------------------------------------------------------------------------------

model(linear);

        %%%%%-----Aggregate demand-----%%%%%

cn_h = (gamma_c*(eta_c))*prn_f - (gamma_c*(eta_c))*prn_h + cn; // domestic consumption of home goods

cn_f = (1 - gamma_c)*(eta_c)*prn_h + (gamma_c - eta_c)*(prn_f) + cn; // domestic consumption of foreign goods

cn = (1/(1+phi))*cn(+1) + (phi/(1+phi))*(cn(-1)) - ((1-phi)/(sigma_c*(1+phi)))*(intn_b);  // Consumption Euler equation 

(sigma_c/(1-phi))*(cn - phi*cn(-1)) = (sigma_c_star/(1-phi_star))*(yn_star - phi_star*yn_star(-1)) + rern; // UIP --> international risk sharing Steinbach et al. Eq 44 based on Eq 31 = consistent with model equations

kappa_v*(vn(-1) - kn(-1)) = kappa_v*beta_h*(vn - kn) + (1 - beta_h*(1 - delt))*(rn_k) + (sigma_c)*(cn - cn(+1)); // Investment schedule

        %%%%%-----Aggregate supply and inflation-----%%%%%%

    %-----(real) wage setting-----%

mrsn_w = wn; // Wage inflation or Real wage setting

mrsn_w =(sigma_c/(1-phi))*(cn - phi*cn(-1)) + sigma_n*(nn); // marginal rate of substitution

    %-----domestic production and inflation (for consumption goods)-----%

(wn - prn_h) = (yn_h - nn);   //  real marginal cost =0 wrt FOC labour
rn_k = (yn_h - kn);   //  real marginal cost =0 wrt FOC capital

yn_h = an + alph*nn + (1 - alph)*kn; // Cobb-Douglas production function with oil, assume \nu=1

    %-----Evolution of Relative Prices-----%

rern = prn_f;                                // law of one price holds
0 = (1-gamma_c)*prn_h + (gamma_c)*(rern);    // M&S2005 Eq.(A20)
sn = prn_f - prn_h;                           // s = terms of trade --> import price relative to domestic price.

    %-----Evolution of State variables-----%

kn(+1) = (1 - delt)*kn + delt*vn;          // capital accumlation equation


        %%%%%-----Foreign economy-----%%%%%%
%-----3 equation NK model-----%


yn_star = (1/(1 + phi_star))*yn_star(+1) 
       + (phi_star/(1 + phi_star))*(yn_star(-1)) 
       - ((1 - phi_star)/(sigma_c_star*(1 + phi_star)))*(intn_b_star);  //  foreign IS curve

yn_star = ((1 + sigma_n_star)/(sigma_c_star + sigma_n_star))*an_star;

        %%%%%-----Aggregate Equilibrium-----%%%%%% [CHECK]

// note: c_star = y_star;

yn_h = CYh*cn_h + (1-CYh)*xn; //  M&S2005  // aggregate domestic production equilibrium 

yn = CY*cn + KY*delt*vn + XY*xn - MY*mn;                  // Aggregate resource constraint for domestic economy
xn = yn_star - xi_f_star*(prn_h - rern);                // Aggregate Export
mn = CfM*cn_f;                                         // Aggregate Imports
tbn = xn - mn;                                        // Trade balance

        %%%%%-----Stochastic processes-----%%%%%%

    %-----Three domestic shocks-----%

an = rho_a*an(-1) + epsil_a;                                // (3) domestic productivity shock
                                                        
    %-----Four foreign shocks-----%

an_star = rho_a_star*an_star(-1) + epsil_a_star ;           // (6) foreign productivity shock in foreign IS curve
                                                        
        %%%%%-----Measurement equations-----%%%%%%

yn_star_obs = yn_star - yn_star(-1) + y_star_ss;
intn_b_star_obs = intn_b_star + int_b_star_ss;

yn_obs = yn - yn(-1) + y_ss;
intn_b_obs = intn_b + int_b_ss;

//rern_obs = rern - rern(-1) + rer_ss;

end;

steady;
check;

shocks;
//productivity shock
var epsil_a;
stderr 0.4582;

var epsil_a_star;
stderr 0.4582;

end;

stoch_simul(irf=20, graph_format=fig) yn yn_obs intn_b_obs rn_k wn nn cn cn_h cn_f vn kn rern tbn xn mn;
