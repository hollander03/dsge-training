%
% Status : main Dynare file
%
% Warning : this file is generated automatically by Dynare
%           from model file (.mod)

clearvars -global
clear_persistent_variables(fileparts(which('dynare')), false)
tic0 = tic;
% Define global variables.
global M_ options_ oo_ estim_params_ bayestopt_ dataset_ dataset_info estimation_info
options_ = [];
M_.fname = 'basicrbc2015';
M_.dynare_version = '6.1';
oo_.dynare_version = '6.1';
options_.dynare_version = '6.1';
%
% Some global variables initialization
%
global_initialization;
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
M_.surprise_shocks = [];
M_.learnt_shocks = [];
M_.learnt_endval = [];
M_.heteroskedastic_shocks.Qvalue_orig = [];
M_.heteroskedastic_shocks.Qscale_orig = [];
M_.matched_irfs = {};
M_.matched_irfs_weights = {};
options_.linear = true;
options_.block = false;
options_.bytecode = false;
options_.use_dll = false;
options_.ramsey_policy = false;
options_.discretionary_policy = false;
M_.nonzero_hessian_eqs = [];
M_.hessian_eq_zero = isempty(M_.nonzero_hessian_eqs);
M_.eq_nbr = 7;
M_.ramsey_orig_eq_nbr = 0;
M_.ramsey_orig_endo_nbr = 0;
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
M_.block_structure.time_recursive = false;
M_.block_structure.block(1).Simulation_Type = 1;
M_.block_structure.block(1).endo_nbr = 1;
M_.block_structure.block(1).mfs = 1;
M_.block_structure.block(1).equation = [ 7];
M_.block_structure.block(1).variable = [ 7];
M_.block_structure.block(1).is_linear = true;
M_.block_structure.block(1).NNZDerivatives = 2;
M_.block_structure.block(1).bytecode_jacob_cols_to_sparse = [1 2 ];
M_.block_structure.block(2).Simulation_Type = 8;
M_.block_structure.block(2).endo_nbr = 6;
M_.block_structure.block(2).mfs = 6;
M_.block_structure.block(2).equation = [ 3 6 1 5 2 4];
M_.block_structure.block(2).variable = [ 3 1 4 5 2 6];
M_.block_structure.block(2).is_linear = true;
M_.block_structure.block(2).NNZDerivatives = 18;
M_.block_structure.block(2).bytecode_jacob_cols_to_sparse = [4 7 8 9 10 11 12 17 18 ];
M_.block_structure.block(1).g1_sparse_rowval = int32([]);
M_.block_structure.block(1).g1_sparse_colval = int32([]);
M_.block_structure.block(1).g1_sparse_colptr = int32([]);
M_.block_structure.block(2).g1_sparse_rowval = int32([2 4 6 1 2 1 2 3 6 3 4 4 1 3 5 6 5 5 ]);
M_.block_structure.block(2).g1_sparse_colval = int32([4 4 4 7 7 8 8 8 8 9 9 10 11 11 11 12 17 18 ]);
M_.block_structure.block(2).g1_sparse_colptr = int32([1 1 1 1 4 4 4 6 10 12 13 16 17 17 17 17 17 18 19 ]);
M_.block_structure.variable_reordered = [ 7 3 1 4 5 2 6];
M_.block_structure.equation_reordered = [ 7 3 6 1 5 2 4];
M_.block_structure.incidence(1).lead_lag = -1;
M_.block_structure.incidence(1).sparse_IM = [
 4 5;
 5 5;
 6 5;
 7 7;
];
M_.block_structure.incidence(2).lead_lag = 0;
M_.block_structure.incidence(2).sparse_IM = [
 1 1;
 1 2;
 1 4;
 2 2;
 3 1;
 3 2;
 3 3;
 4 1;
 4 6;
 5 4;
 5 5;
 6 1;
 6 3;
 6 7;
 7 7;
];
M_.block_structure.incidence(3).lead_lag = 1;
M_.block_structure.incidence(3).sparse_IM = [
 2 2;
 2 6;
];
M_.block_structure.dyn_tmp_nbr = 1;
M_.state_var = [7 5 ];
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
M_.dynamic_g1_sparse_rowval = int32([4 5 6 7 1 3 4 6 1 2 3 3 6 1 5 5 4 6 7 2 2 7 ]);
M_.dynamic_g1_sparse_colval = int32([5 5 5 7 8 8 8 8 9 9 9 10 10 11 11 12 13 14 14 16 20 22 ]);
M_.dynamic_g1_sparse_colptr = int32([1 1 1 1 1 4 4 5 9 12 14 16 17 18 20 20 21 21 21 21 22 22 23 ]);
M_.dynamic_g2_sparse_indices = int32([]);
M_.lhs = {
'y'; 
'1/eta*r(1)'; 
'c*eta'; 
'r'; 
'k'; 
'y'; 
'z'; 
};
M_.static_tmp_nbr = [2; 0; 0; 0; ];
M_.block_structure_stat.block(1).Simulation_Type = 3;
M_.block_structure_stat.block(1).endo_nbr = 1;
M_.block_structure_stat.block(1).mfs = 1;
M_.block_structure_stat.block(1).equation = [ 2];
M_.block_structure_stat.block(1).variable = [ 6];
M_.block_structure_stat.block(2).Simulation_Type = 3;
M_.block_structure_stat.block(2).endo_nbr = 1;
M_.block_structure_stat.block(2).mfs = 1;
M_.block_structure_stat.block(2).equation = [ 7];
M_.block_structure_stat.block(2).variable = [ 7];
M_.block_structure_stat.block(3).Simulation_Type = 6;
M_.block_structure_stat.block(3).endo_nbr = 5;
M_.block_structure_stat.block(3).mfs = 5;
M_.block_structure_stat.block(3).equation = [ 3 4 5 6 1];
M_.block_structure_stat.block(3).variable = [ 3 5 4 1 2];
M_.block_structure_stat.variable_reordered = [ 6 7 3 5 4 1 2];
M_.block_structure_stat.equation_reordered = [ 2 7 3 4 5 6 1];
M_.block_structure_stat.incidence.sparse_IM = [
 1 1;
 1 2;
 1 4;
 2 6;
 3 1;
 3 2;
 3 3;
 4 1;
 4 5;
 4 6;
 5 4;
 5 5;
 6 1;
 6 3;
 6 5;
 6 7;
 7 7;
];
M_.block_structure_stat.tmp_nbr = 1;
M_.block_structure_stat.block(1).g1_sparse_rowval = int32([1 ]);
M_.block_structure_stat.block(1).g1_sparse_colval = int32([1 ]);
M_.block_structure_stat.block(1).g1_sparse_colptr = int32([1 2 ]);
M_.block_structure_stat.block(2).g1_sparse_rowval = int32([1 ]);
M_.block_structure_stat.block(2).g1_sparse_colval = int32([1 ]);
M_.block_structure_stat.block(2).g1_sparse_colptr = int32([1 2 ]);
M_.block_structure_stat.block(3).g1_sparse_rowval = int32([1 4 2 3 4 3 5 1 2 4 5 1 5 ]);
M_.block_structure_stat.block(3).g1_sparse_colval = int32([1 1 2 2 2 3 3 4 4 4 4 5 5 ]);
M_.block_structure_stat.block(3).g1_sparse_colptr = int32([1 3 6 8 12 14 ]);
M_.static_g1_sparse_rowval = int32([1 3 4 6 1 3 3 6 1 5 4 5 6 2 4 6 7 ]);
M_.static_g1_sparse_colval = int32([1 1 1 1 2 2 3 3 4 4 5 5 5 6 6 7 7 ]);
M_.static_g1_sparse_colptr = int32([1 5 7 9 11 14 16 18 ]);
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
options_.graph_format = {'fig'};
options_.nodisplay = true;
options_.order = 1;
options_.periods = 200;
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
write_latex_parameter_table;
write_latex_definitions;
collect_latex_files;


oo_.time = toc(tic0);
disp(['Total computing time : ' dynsec2hms(oo_.time) ]);
if ~exist([M_.dname filesep 'Output'],'dir')
    mkdir(M_.dname,'Output');
end
save([M_.dname filesep 'Output' filesep 'basicrbc2015_results.mat'], 'oo_', 'M_', 'options_');
if exist('estim_params_', 'var') == 1
  save([M_.dname filesep 'Output' filesep 'basicrbc2015_results.mat'], 'estim_params_', '-append');
end
if exist('bayestopt_', 'var') == 1
  save([M_.dname filesep 'Output' filesep 'basicrbc2015_results.mat'], 'bayestopt_', '-append');
end
if exist('dataset_', 'var') == 1
  save([M_.dname filesep 'Output' filesep 'basicrbc2015_results.mat'], 'dataset_', '-append');
end
if exist('estimation_info', 'var') == 1
  save([M_.dname filesep 'Output' filesep 'basicrbc2015_results.mat'], 'estimation_info', '-append');
end
if exist('dataset_info', 'var') == 1
  save([M_.dname filesep 'Output' filesep 'basicrbc2015_results.mat'], 'dataset_info', '-append');
end
if exist('oo_recursive_', 'var') == 1
  save([M_.dname filesep 'Output' filesep 'basicrbc2015_results.mat'], 'oo_recursive_', '-append');
end
if exist('options_mom_', 'var') == 1
  save([M_.dname filesep 'Output' filesep 'basicrbc2015_results.mat'], 'options_mom_', '-append');
end
if ~isempty(lastwarn)
  disp('Note: warning(s) encountered in MATLAB/Octave code')
end
