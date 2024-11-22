%
% Status : main Dynare file
%
% Warning : this file is generated automatically by Dynare
%           from model file (.mod)

if isoctave || matlab_ver_less_than('8.6')
    clear all
else
    clearvars -global
    clear_persistent_variables(fileparts(which('dynare')), false)
end
tic0 = tic;
% Define global variables.
global M_ options_ oo_ estim_params_ bayestopt_ dataset_ dataset_info estimation_info ys0_ ex0_
options_ = [];
M_.fname = 'basicRBC2015';
M_.dynare_version = '4.6.4';
oo_.dynare_version = '4.6.4';
options_.dynare_version = '4.6.4';
%
% Some global variables initialization
%
global_initialization;
diary off;
diary('basicRBC2015.log');
M_.exo_names = cell(1,1);
M_.exo_names_tex = cell(1,1);
M_.exo_names_long = cell(1,1);
M_.exo_names(1) = {'epsilon'};
M_.exo_names_tex(1) = {'{\epsilon_z}'};
M_.exo_names_long(1) = {'TFP shock'};
M_.endo_names = cell(7,1);
M_.endo_names_tex = cell(7,1);
M_.endo_names_long = cell(7,1);
M_.endo_names(1) = {'y'};
M_.endo_names_tex(1) = {'{y}'};
M_.endo_names_long(1) = {'output'};
M_.endo_names(2) = {'c'};
M_.endo_names_tex(2) = {'{c}'};
M_.endo_names_long(2) = {'consumption'};
M_.endo_names(3) = {'n'};
M_.endo_names_tex(3) = {'{n}'};
M_.endo_names_long(3) = {'hours'};
M_.endo_names(4) = {'v'};
M_.endo_names_tex(4) = {'{v}'};
M_.endo_names_long(4) = {'investment'};
M_.endo_names(5) = {'k'};
M_.endo_names_tex(5) = {'{k}'};
M_.endo_names_long(5) = {'capital'};
M_.endo_names(6) = {'r'};
M_.endo_names_tex(6) = {'{r}'};
M_.endo_names_long(6) = {'real rate'};
M_.endo_names(7) = {'z'};
M_.endo_names_tex(7) = {'{z}'};
M_.endo_names_long(7) = {'TFP'};
M_.endo_partitions = struct();
M_.param_names = cell(6,1);
M_.param_names_tex = cell(6,1);
M_.param_names_long = cell(6,1);
M_.param_names(1) = {'rho'};
M_.param_names_tex(1) = {'{\rho}'};
M_.param_names_long(1) = {'capital share'};
M_.param_names(2) = {'bet'};
M_.param_names_tex(2) = {'{\beta}'};
M_.param_names_long(2) = {'discount factor'};
M_.param_names(3) = {'delt'};
M_.param_names_tex(3) = {'{\delta}'};
M_.param_names_long(3) = {'depreciation rate'};
M_.param_names(4) = {'psi'};
M_.param_names_tex(4) = {'{\psi}'};
M_.param_names_long(4) = {'persistence TFP shock'};
M_.param_names(5) = {'eta'};
M_.param_names_tex(5) = {'{\eta}'};
M_.param_names_long(5) = {'risk aversion'};
M_.param_names(6) = {'sigmae'};
M_.param_names_tex(6) = {'{\sigma_{e}}'};
M_.param_names_long(6) = {'i.i.d TFP shock'};
M_.param_partitions = struct();
M_.exo_det_nbr = 0;
M_.exo_nbr = 1;
M_.endo_nbr = 7;
M_.param_nbr = 6;
M_.orig_endo_nbr = 7;
M_.aux_vars = [];
M_.Sigma_e = zeros(1, 1);
M_.Correlation_matrix = eye(1, 1);
M_.H = 0;
M_.Correlation_matrix_ME = 1;
M_.sigma_e_is_diagonal = true;
M_.det_shocks = [];
options_.linear = true;
options_.block = false;
options_.bytecode = false;
options_.use_dll = false;
options_.linear_decomposition = false;
M_.nonzero_hessian_eqs = [];
M_.hessian_eq_zero = isempty(M_.nonzero_hessian_eqs);
M_.orig_eq_nbr = 7;
M_.eq_nbr = 7;
M_.ramsey_eq_nbr = 0;
M_.set_auxiliary_variables = exist(['./+' M_.fname '/set_auxiliary_variables.m'], 'file') == 2;
M_.epilogue_names = {};
M_.epilogue_var_list_ = {};
M_.orig_maximum_endo_lag = 1;
M_.orig_maximum_endo_lead = 1;
M_.orig_maximum_exo_lag = 0;
M_.orig_maximum_exo_lead = 0;
M_.orig_maximum_exo_det_lag = 0;
M_.orig_maximum_exo_det_lead = 0;
M_.orig_maximum_lag = 1;
M_.orig_maximum_lead = 1;
M_.orig_maximum_lag_with_diffs_expanded = 1;
M_.lead_lag_incidence = [
 0 3 0;
 0 4 10;
 0 5 0;
 0 6 0;
 1 7 0;
 0 8 11;
 2 9 0;]';
M_.nstatic = 3;
M_.nfwrd   = 2;
M_.npred   = 2;
M_.nboth   = 0;
M_.nsfwrd   = 2;
M_.nspred   = 2;
M_.ndynamic   = 4;
M_.dynamic_tmp_nbr = [2; 0; 0; 0; ];
M_.model_local_variables_dynamic_tt_idxs = {
};
M_.equations_tags = {
  1 , 'name' , 'Resource constraint' ;
  2 , 'name' , 'Euler equation' ;
  3 , 'name' , 'Labor FOC' ;
  4 , 'name' , 'real interest rate/firm FOC capital' ;
  5 , 'name' , 'Law of motion capital' ;
  6 , 'name' , 'production function' ;
  7 , 'name' , 'exogenous TFP process' ;
};
M_.mapping.y.eqidx = [1 3 4 6 ];
M_.mapping.c.eqidx = [1 2 3 ];
M_.mapping.n.eqidx = [3 6 ];
M_.mapping.v.eqidx = [1 5 ];
M_.mapping.k.eqidx = [4 5 6 ];
M_.mapping.r.eqidx = [2 4 ];
M_.mapping.z.eqidx = [6 7 ];
M_.mapping.epsilon.eqidx = [7 ];
M_.static_and_dynamic_models_differ = false;
M_.has_external_function = false;
M_.state_var = [5 7 ];
M_.exo_names_orig_ord = [1:1];
M_.maximum_lag = 1;
M_.maximum_lead = 1;
M_.maximum_endo_lag = 1;
M_.maximum_endo_lead = 1;
oo_.steady_state = zeros(7, 1);
M_.maximum_exo_lag = 0;
M_.maximum_exo_lead = 0;
oo_.exo_steady_state = zeros(1, 1);
M_.params = NaN(6, 1);
M_.endo_trends = struct('deflator', cell(7, 1), 'log_deflator', cell(7, 1), 'growth_factor', cell(7, 1), 'log_growth_factor', cell(7, 1));
M_.NNZDerivatives = [22; 0; -1; ];
M_.static_tmp_nbr = [2; 0; 0; 0; ];
M_.model_local_variables_static_tt_idxs = {
};
M_.params(1) = 0.33;
rho = M_.params(1);
M_.params(2) = 0.99;
bet = M_.params(2);
M_.params(3) = 0.025;
delt = M_.params(3);
M_.params(4) = 0.95;
psi = M_.params(4);
M_.params(5) = 2;
eta = M_.params(5);
M_.params(6) = 0.01;
sigmae = M_.params(6);
steady;
oo_.dr.eigval = check(M_,options_,oo_);
%
% SHOCKS instructions
%
M_.exo_det_length = 0;
M_.Sigma_e(1, 1) = M_.params(6)^2;
options_.nodisplay = true;
options_.order = 1;
options_.periods = 200;
options_.graph_format = {'fig'};
var_list_ = {};
[info, oo_, options_, M_] = stoch_simul(M_, options_, oo_, var_list_);
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
eta_params = 1:0.1:5;
for i=1:length(eta_params)
set_param_value('eta',eta_params(i));
options_.nograph = true;
options_.noprint = true;
options_.order = 1;
options_.periods = 200;
var_list_ = {};
[info, oo_, options_, M_] = stoch_simul(M_, options_, oo_, var_list_);
if info(1)~=0 
error('Simulation failed for parameter draw')
end
y_epsilon_mat(:,i) = oo_.irfs.y_epsilon.';
c_epsilon_mat(:,i) = oo_.irfs.c_epsilon.';
r_epsilon_mat(:,i) = oo_.irfs.r_epsilon.';
end
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
for i=1:200
set_dynare_seed(i);
options_.nograph = true;
options_.noprint = true;
options_.order = 1;
options_.periods = 200;
var_list_ = {};
[info, oo_, options_, M_] = stoch_simul(M_, options_, oo_, var_list_);
y_sim(:,i) = oo_.endo_simul(1,:).';
end
figure
plot([101:200], y_sim(:,101:200))
hold off
save('basicRBC2015_results.mat', 'oo_', 'M_', 'options_');
if exist('estim_params_', 'var') == 1
  save('basicRBC2015_results.mat', 'estim_params_', '-append');
end
if exist('bayestopt_', 'var') == 1
  save('basicRBC2015_results.mat', 'bayestopt_', '-append');
end
if exist('dataset_', 'var') == 1
  save('basicRBC2015_results.mat', 'dataset_', '-append');
end
if exist('estimation_info', 'var') == 1
  save('basicRBC2015_results.mat', 'estimation_info', '-append');
end
if exist('dataset_info', 'var') == 1
  save('basicRBC2015_results.mat', 'dataset_info', '-append');
end
if exist('oo_recursive_', 'var') == 1
  save('basicRBC2015_results.mat', 'oo_recursive_', '-append');
end


disp(['Total computing time : ' dynsec2hms(toc(tic0)) ]);
if ~isempty(lastwarn)
  disp('Note: warning(s) encountered in MATLAB/Octave code')
end
diary off
