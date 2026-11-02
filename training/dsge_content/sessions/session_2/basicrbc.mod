//Basic RBC model (see also, Sims RBC stylized facts)

var y ${y}$ (long_name='output') 
    c ${c}$ (long_name='consumption')
    n ${n}$ (long_name='hours') 
    v ${v}$ (long_name='investment') 
    k ${k}$ (long_name='capital')
    r ${r}$ (long_name='real rate') 
    z ${z}$ (long_name='TFP');

varexo epsilon ${\epsilon_z}$ (long_name='TFP shock');

parameters rho    ${\rho}$   (long_name='capital share') 
           bet    ${\beta}$  (long_name='discount factor')   
           delt   ${\delta}$ (long_name='depreciation rate')
           psi    ${\psi}$   (long_name='persistence TFP shock')
           eta    ${\eta}$   (long_name='risk aversion')
           sigmae ${\sigma_{e}}$ (long_name='i.i.d TFP shock');

rho = 0.33;
bet = 0.99;
delt = 0.025;
psi = 0.95; %set_param_value('psi',psi)
eta = 2;
sigmae = 0.01; // normalized 1% shock

model(linear);

#R = 1/bet;
#KY = rho/(R - (1-delt));
#CY = 1 - KY*delt;

[name='Resource constraint'] 
y = CY*c + delt*KY*v;             

[name='Euler equation']
%% c = c(+1) - (1/eta)*r(+1);             

(1/eta)*r(+1) = c(+1) - c;  // (1/eta) = elasticity of intertemporal consumption

[name='Labor FOC']
eta*c = y - n;                      

[name='real interest rate/firm FOC capital']
r = rho*(1/KY)*(y - k(-1));               // return on capital as a function of technology shock

[name='Law of motion capital'] 
k = (1-delt)*k(-1) + delt*v;             

[name='production function']
y = z + rho*k(-1) + (1-rho)*n;         

[name='exogenous TFP process']
z = psi*z(-1) + epsilon;                 // AR(1) stochastic process

end;

steady;
check;

// define shocks for simulation

shocks;
var epsilon = sigmae^2;  // stderr 0.01; // var(epsilon) = 0.01^2
%var epsilon; stderr sigmae;
end;

% set_dynare_seed(ss);

// Below are different simulation and figure plotting options to select from:

%-------------------------------------------------------------
% Theoretical moments (default: periods=0)
%-------------------------------------------------------------

% stoch_simul(order=1, periods=0, nodisplay); // for theoretical moments

%-------------------------------------------------------------
% Simulate periods. Note: results should tend to the theoretical moments as the number of simulated periods tends to infinity (or sufficiently large number)
%-------------------------------------------------------------

stoch_simul(order=1, periods=200, graph_format=fig, nodisplay); // , periods=1000, graph_format=(fig, pdf), 

%-------------------------------------------------------------
% Plot IRFs to a 1.0% s.d. technology shock
%-------------------------------------------------------------

figure
plot([0:options_.irf], [0 oo_.irfs.y_epsilon]*100)
hold on
plot([0:options_.irf], [0 oo_.irfs.c_epsilon]*100)
plot([0:options_.irf], [0 oo_.irfs.v_epsilon]*100)
plot([0:options_.irf], [0 oo_.irfs.k_epsilon]*100)
plot([0:options_.irf], [0 oo_.irfs.n_epsilon]*100)
plot([0:options_.irf], [0 oo_.irfs.r_epsilon]*100)
plot([0:options_.irf], [0 oo_.irfs.z_epsilon]*100)
title('Impulse responses to a technology shock')
legend('Output','Consumption','Investment','Capital','Employment','Rate of return','Technology shock')
ylabel('percentage deviations from steady state')
xlabel('quarters after shock')
hold off

%-------------------------------------------------------------
% Create loop to over parameter values. NOTE: this can also be performed using the macro language (see guide)
%-------------------------------------------------------------

eta_params = 1:0.1:5;
for i=1:length(eta_params)
% eta = eta_params(i);
set_param_value('eta',eta_params(i));
stoch_simul(order=1, periods=200, noprint, nograph);
    if info(1)~=0 // strongly advised to always check the error flag
    error('Simulation failed for parameter draw')
    end
y_epsilon_mat(:,i) = oo_.irfs.y_epsilon.';
c_epsilon_mat(:,i) = oo_.irfs.c_epsilon.';
r_epsilon_mat(:,i) = oo_.irfs.r_epsilon.';
end

%-------------------------------------------------------------
% plot 3D IRFs for loop over range of parameter values
%-------------------------------------------------------------

label_interval = 5;
label_indices = 1:label_interval:length(eta_params);
label_values = eta_params(label_indices);
figure
surf(y_epsilon_mat(1:options_.irf, :)); 
xlabel('\eta'); ylabel('period'); zlabel('output');
set(gca, 'XTick', label_indices, 'XTickLabel', label_values);
hold off

figure
surf(c_epsilon_mat(1:options_.irf, :)); 
xlabel('\eta'); ylabel('period'); zlabel('consumption');
set(gca, 'XTick', label_indices, 'XTickLabel', label_values);
hold off

figure
surf(r_epsilon_mat(1:options_.irf, :)); 
xlabel('\eta'); ylabel('period'); zlabel('return on capital');
set(gca, 'XTick', label_indices, 'XTickLabel', label_values);
hold off

%-------------------------------------------------------------
% Create loop to simulate 200 series with 200 observations for output
%-------------------------------------------------------------

for i=1:200
set_dynare_seed(i);
stoch_simul(order=1, periods=200, noprint, nograph);
y_sim(:,i) = oo_.endo_simul(1,:).';
end

%-------------------------------------------------------------
% Plot simulated series across all seeds
%-------------------------------------------------------------

figure
plot([101:200], y_sim(:,101:200))
hold off

%-------------------------------------------------------------
% generate LaTeX output
%-------------------------------------------------------------

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
