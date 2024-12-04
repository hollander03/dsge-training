//Basic RBC model (see also, Sims RBC stylized facts)

var y ${y}$ (long_name='output') 
    c ${c}$ (long_name='consumption')
    n ${n}$ (long_name='hours') 
    v ${v}$ (long_name='investment') 
    k ${k}$ (long_name='capital')
    r ${r}$ (long_name='real rate') 
    z ${z}$ (long_name='TFP')
    y_obs ${\Delta y}$ (long_name='output growth')
    dc ${\Delta c^mod}$
    dv ${\Delta v^mod}$;


varexo epsilon ${\epsilon_z}$ (long_name='TFP shock');

parameters rho     ${\rho}$  (long_name='capital share') 
           bet      ${\beta}$   (long_name='discount factor')   
           delt     ${\delta}$  (long_name='depreciation rate')
           psi      ${\psi}$  (long_name='persistence TFP shock')
           eta      ${\eta}$  (long_name='risk aversion')
           sigmae   ${\sigma_{e}}$ (long_name='i.i.d TFP shock')
           y_ss ;

rho = 0.33;
bet = 0.99;
delt = 0.025;
psi = 0.95;
%set_param_value('psi',psi)
eta = 2;
sigmae = 0.01; // make 0.01 to corresp with basicrbc_sims instead of data implies 0.017
y_ss = 0.0063118193324634; 

model(linear);

#R = 1/bet;
#KY = rho/(R - (1-delt));
#CY = 1 - KY*delt;

[name='Resource constraint'] 
y = CY*c + delt*KY*v;                      // Aggregate Resource

[name='Euler equation']
%% c = c(+1) - (1/eta)*r(+1);              // consumption Euler eqn

(1/eta)*r(+1) = c(+1) - c;  
%% (1/eta) = elasticity of intertemporal consumption

[name='Labor FOC']
eta*c = y - n;                      // labor FOC

[name='real interest rate/firm FOC capital']
r = rho*(1/KY)*(y - k(-1));               // return on capital as a function of technology shock

[name='Law of motion capital'] 
k = (1-delt)*k(-1) + delt*v;              // cap acc eqn

[name='production function']
y = z + rho*k(-1) + (1-rho)*n;          // production function with labour normalized

[name='exogenous TFP process']
z = psi*z(-1) + epsilon;                    // AR(1) Technology stochastic process

//k = a + rho*k - c + (1-delt)*k(-1);    // following Sims

[name='Output growth (observed)']
y_obs = y - y(-1) + y_ss;

dc = c - c(-1);
dv = v - v(-1);

end;

steady;
check;

// define shocks for simulation

shocks;
var epsilon = sigmae^2;  // stderr 0.01; // var(epsilon) = 0.01^2
%var epsilon; stderr sigmae;
end;

estimated_params;
eta, inv_gamma_pdf, 1, 1;
psi, beta_pdf, 0.75, 0.1;
stderr epsilon, inv_gamma_pdf, 0.01, inf;
end ;



varobs y_obs ;

%estimation(datafile=data9519);
% The estimation uses Dynare version 6. For dynare version 4.6 use mode_compute=4
estimation(datafile=data9519, mh_nblocks=3, mh_replic=100000, mh_drop=0.5, mh_jscale=0.99,
           mode_compute=0, mode_check, mode_file=basicrbc2015_est_mode, // load_mh_file,  mode_file=, 
           bayesian_irf, irf=40, moments_varendo, conditional_variance_decomposition=[1:20],
           graph_format=(fig,pdf), nodisplay) y_obs dc dv y c n v k r z ;
