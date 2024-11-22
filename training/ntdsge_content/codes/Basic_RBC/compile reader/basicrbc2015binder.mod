//Basic RBC model (see also, Sims RBC stylized facts)

var y ${y}$ (long_name='output') 
    c ${c}$ (long_name='consumption')
    n ${n}$ (long_name='hours') 
    i ${i}$ (long_name='investment') 
    k ${k}$ (long_name='capital')
    r ${r}$ (long_name='real rate') 
    z ${z}$ (long_name='TFP');

varexo epsilon ${\epsilon_z}$ (long_name='TFP shock');

parameters rho     ${\rho}$  (long_name='capital share') 
           bet      ${\beta}$   (long_name='discount factor')   
           delt     ${\delta}$  (long_name='depreciation rate')
           psi      ${\psi}$  (long_name='persistence TFP shock')
           eta      ${\gamma}$  (long_name='risk aversion') 
           sigmae   ${\sigma_{e}}$ (long_name='i.i.d TFP shock');

% comment:  (1/eta) = intertemporal elasticity of substitution            

rho = 0.33;
bet = 0.99;
delt = 0.025;
psi = 0.95;
eta = 2;
sigmae = 0.01;

model(linear);

#R = 1/bet;
#KY = rho/(R - (1-delt));
#CY = 1 - KY*delt;

[name='Resource constraint'] 
y = CY*c + delt*KY*i;                      

[name='Euler equation']
(1/eta)*r(+1) = c(+1) - c;    

[name='Labor FOC']
eta*c = y - n;                     

[name='real interest rate/firm FOC capital']
r = rho*(1/KY)*(y - k(-1));               

[name='Law of motion capital'] 
k = (1-delt)*k(-1) + delt*i;              

[name='production function']
y = z + rho*k(-1) + (1-rho)*n;          

[name='exogenous TFP process']
z = psi*z(-1) + epsilon;                    

end;

shocks;
var epsilon = sigmae^2;
end;

steady;
check;

stoch_simul(order=1, periods=150, nodisplay);

%stoch_simul(order=1); // for theoretical moments

%----------------------------------------------------------------
% Plot IRFs to a 1.0% s.d. technology shock
%----------------------------------------------------------------

figure
plot([0:options_.irf], [0 oo_.irfs.y_epsilon]*100)
hold
plot([0:options_.irf], [0 oo_.irfs.c_epsilon]*100)
plot([0:options_.irf], [0 oo_.irfs.i_epsilon]*100)
plot([0:options_.irf], [0 oo_.irfs.k_epsilon]*100)
plot([0:options_.irf], [0 oo_.irfs.n_epsilon]*100)
plot([0:options_.irf], [0 oo_.irfs.r_epsilon]*100)
plot([0:options_.irf], [0 oo_.irfs.z_epsilon]*100)
title('Impulse responses to a technology shock')
legend('Output','Consumption','Investment','Capital','Employment','Rate of return','Technology shock')
ylabel('percentage deviations from steady state')
xlabel('quarters after shock')