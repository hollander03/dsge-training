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
M_.fname = 'basicrbc2015_est';
M_.dynare_version = '6.1';
oo_.dynare_version = '6.1';
options_.dynare_version = '6.1';
%
% Some global variables initialization
%
global_initialization;
M_.exo_names = cell(3,1);
M_.exo_names_tex = cell(3,1);
M_.exo_names_long = cell(3,1);
M_.exo_names(1) = {'epsilon'};
M_.exo_names_tex(1) = {'{\epsilon_z}'};
M_.exo_names_long(1) = {'TFP shock'};
M_.exo_names(2) = {'epsilon_g'};
M_.exo_names_tex(2) = {'{\epsilon_g}'};
M_.exo_names_long(2) = {'Govt shock'};
M_.exo_names(3) = {'epsilon_pref'};
M_.exo_names_tex(3) = {'{\epsilon_pref}'};
M_.exo_names_long(3) = {'Pref shock'};
M_.endo_names = cell(12,1);
M_.endo_names_tex = cell(12,1);
M_.endo_names_long = cell(12,1);
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
M_.endo_names(8) = {'y_obs'};
M_.endo_names_tex(8) = {'{\Delta y}'};
M_.endo_names_long(8) = {'output growth'};
M_.endo_names(9) = {'c_obs'};
M_.endo_names_tex(9) = {'{\Delta c}'};
M_.endo_names_long(9) = {'c_obs'};
M_.endo_names(10) = {'v_obs'};
M_.endo_names_tex(10) = {'{\Delta v}'};
M_.endo_names_long(10) = {'v_obs'};
M_.endo_names(11) = {'g'};
M_.endo_names_tex(11) = {'{g}'};
M_.endo_names_long(11) = {'Government'};
M_.endo_names(12) = {'pref'};
M_.endo_names_tex(12) = {'{pref}'};
M_.endo_names_long(12) = {'Preference'};
M_.endo_partitions = struct();
M_.param_names = cell(11,1);
M_.param_names_tex = cell(11,1);
M_.param_names_long = cell(11,1);
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
M_.param_names(5) = {'psi_g'};
M_.param_names_tex(5) = {'{\psi_g}'};
M_.param_names_long(5) = {'persistence Govt. shock'};
M_.param_names(6) = {'psi_pref'};
M_.param_names_tex(6) = {'{\psi_pref}'};
M_.param_names_long(6) = {'persistence Pref. shock'};
M_.param_names(7) = {'eta'};
M_.param_names_tex(7) = {'{\eta}'};
M_.param_names_long(7) = {'risk aversion'};
M_.param_names(8) = {'sigmae'};
M_.param_names_tex(8) = {'{\sigma_{e}}'};
M_.param_names_long(8) = {'i.i.d TFP shock'};
M_.param_names(9) = {'y_ss'};
M_.param_names_tex(9) = {'y\_ss'};
M_.param_names_long(9) = {'y_ss'};
M_.param_names(10) = {'c_ss'};
M_.param_names_tex(10) = {'c\_ss'};
M_.param_names_long(10) = {'c_ss'};
M_.param_names(11) = {'v_ss'};
M_.param_names_tex(11) = {'v\_ss'};
M_.param_names_long(11) = {'v_ss'};
M_.param_partitions = struct();
M_.exo_det_nbr = 0;
M_.exo_nbr = 3;
M_.endo_nbr = 12;
M_.param_nbr = 11;
M_.orig_endo_nbr = 12;
M_.aux_vars = [];
options_.varobs = cell(3, 1);
options_.varobs(1)  = {'y_obs'};
options_.varobs(2)  = {'c_obs'};
options_.varobs(3)  = {'v_obs'};
options_.varobs_id = [ 8 9 10  ];
M_.Sigma_e = zeros(3, 3);
M_.Correlation_matrix = eye(3, 3);
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
M_.eq_nbr = 12;
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
 0 7 0;
 1 8 19;
 0 9 0;
 2 10 0;
 3 11 0;
 0 12 20;
 4 13 0;
 0 14 0;
 0 15 0;
 0 16 0;
 5 17 0;
 6 18 0;]';
M_.nstatic = 5;
M_.nfwrd   = 1;
M_.npred   = 5;
M_.nboth   = 1;
M_.nsfwrd   = 2;
M_.nspred   = 6;
M_.ndynamic   = 7;
M_.dynamic_tmp_nbr = [2; 0; 0; 0; ];
M_.equations_tags = {
  1 , 'name' , 'Resource constraint' ;
  2 , 'name' , 'Euler equation' ;
  3 , 'name' , 'Labor FOC' ;
  4 , 'name' , 'real interest rate/firm FOC capital' ;
  5 , 'name' , 'Law of motion capital' ;
  6 , 'name' , 'production function' ;
  7 , 'name' , 'exogenous TFP process' ;
  8 , 'name' , 'exogenous Government process' ;
  9 , 'name' , 'exogenous Pref process' ;
  10 , 'name' , 'Output growth (observed)' ;
  11 , 'name' , 'c_obs' ;
  12 , 'name' , 'v_obs' ;
};
M_.mapping.y.eqidx = [1 3 4 6 10 ];
M_.mapping.c.eqidx = [1 2 3 11 ];
M_.mapping.n.eqidx = [3 6 ];
M_.mapping.v.eqidx = [1 5 12 ];
M_.mapping.k.eqidx = [4 5 6 ];
M_.mapping.r.eqidx = [2 4 ];
M_.mapping.z.eqidx = [6 7 ];
M_.mapping.y_obs.eqidx = [10 ];
M_.mapping.c_obs.eqidx = [11 ];
M_.mapping.v_obs.eqidx = [12 ];
M_.mapping.g.eqidx = [1 8 ];
M_.mapping.pref.eqidx = [2 9 ];
M_.mapping.epsilon.eqidx = [7 ];
M_.mapping.epsilon_g.eqidx = [8 ];
M_.mapping.epsilon_pref.eqidx = [9 ];
M_.static_and_dynamic_models_differ = false;
M_.has_external_function = false;
M_.block_structure.time_recursive = false;
M_.block_structure.block(1).Simulation_Type = 1;
M_.block_structure.block(1).endo_nbr = 3;
M_.block_structure.block(1).mfs = 3;
M_.block_structure.block(1).equation = [ 7 8 9];
M_.block_structure.block(1).variable = [ 7 11 12];
M_.block_structure.block(1).is_linear = true;
M_.block_structure.block(1).NNZDerivatives = 6;
M_.block_structure.block(1).bytecode_jacob_cols_to_sparse = [1 2 3 4 5 6 ];
M_.block_structure.block(2).Simulation_Type = 8;
M_.block_structure.block(2).endo_nbr = 6;
M_.block_structure.block(2).mfs = 6;
M_.block_structure.block(2).equation = [ 6 1 3 5 4 2];
M_.block_structure.block(2).variable = [ 3 4 1 5 6 2];
M_.block_structure.block(2).is_linear = true;
M_.block_structure.block(2).NNZDerivatives = 18;
M_.block_structure.block(2).bytecode_jacob_cols_to_sparse = [4 7 8 9 10 11 12 17 18 ];
M_.block_structure.block(3).Simulation_Type = 1;
M_.block_structure.block(3).endo_nbr = 3;
M_.block_structure.block(3).mfs = 3;
M_.block_structure.block(3).equation = [ 12 11 10];
M_.block_structure.block(3).variable = [ 10 9 8];
M_.block_structure.block(3).is_linear = true;
M_.block_structure.block(3).NNZDerivatives = 3;
M_.block_structure.block(3).bytecode_jacob_cols_to_sparse = [4 5 6 ];
M_.block_structure.block(1).g1_sparse_rowval = int32([]);
M_.block_structure.block(1).g1_sparse_colval = int32([]);
M_.block_structure.block(1).g1_sparse_colptr = int32([]);
M_.block_structure.block(2).g1_sparse_rowval = int32([1 4 5 1 3 2 4 1 2 3 5 4 5 2 3 6 6 6 ]);
M_.block_structure.block(2).g1_sparse_colval = int32([4 4 4 7 7 8 8 9 9 9 9 10 11 12 12 12 17 18 ]);
M_.block_structure.block(2).g1_sparse_colptr = int32([1 1 1 1 4 4 4 6 8 12 13 14 17 17 17 17 17 18 19 ]);
M_.block_structure.block(3).g1_sparse_rowval = int32([]);
M_.block_structure.block(3).g1_sparse_colval = int32([]);
M_.block_structure.block(3).g1_sparse_colptr = int32([]);
M_.block_structure.variable_reordered = [ 7 11 12 3 4 1 5 6 2 10 9 8];
M_.block_structure.equation_reordered = [ 7 8 9 6 1 3 5 4 2 12 11 10];
M_.block_structure.incidence(1).lead_lag = -1;
M_.block_structure.incidence(1).sparse_IM = [
 4 5;
 5 5;
 6 5;
 7 7;
 8 11;
 9 12;
 11 2;
 12 4;
];
M_.block_structure.incidence(2).lead_lag = 0;
M_.block_structure.incidence(2).sparse_IM = [
 1 1;
 1 2;
 1 4;
 1 11;
 2 2;
 2 12;
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
 8 11;
 9 12;
 10 1;
 10 8;
 11 2;
 11 9;
 12 4;
 12 10;
];
M_.block_structure.incidence(3).lead_lag = 1;
M_.block_structure.incidence(3).sparse_IM = [
 2 2;
 2 6;
];
M_.block_structure.dyn_tmp_nbr = 1;
M_.state_var = [7 11 12 4 5 2 ];
M_.maximum_lag = 1;
M_.maximum_lead = 1;
M_.maximum_endo_lag = 1;
M_.maximum_endo_lead = 1;
oo_.steady_state = zeros(12, 1);
M_.maximum_exo_lag = 0;
M_.maximum_exo_lead = 0;
oo_.exo_steady_state = zeros(3, 1);
M_.params = NaN(11, 1);
M_.endo_trends = struct('deflator', cell(12, 1), 'log_deflator', cell(12, 1), 'growth_factor', cell(12, 1), 'log_growth_factor', cell(12, 1));
M_.NNZDerivatives = [38; 0; -1; ];
M_.dynamic_g1_sparse_rowval = int32([11 12 4 5 6 7 8 9 1 3 4 6 10 1 2 3 11 3 6 1 5 12 5 4 6 7 10 11 12 1 8 2 9 2 2 7 8 9 ]);
M_.dynamic_g1_sparse_colval = int32([2 4 5 5 5 7 11 12 13 13 13 13 13 14 14 14 14 15 15 16 16 16 17 18 19 19 20 21 22 23 23 24 24 26 30 37 38 39 ]);
M_.dynamic_g1_sparse_colptr = int32([1 1 2 2 3 6 6 7 7 7 7 8 9 14 18 20 23 24 25 27 28 29 30 32 34 34 35 35 35 35 36 36 36 36 36 36 36 37 38 39 ]);
M_.dynamic_g2_sparse_indices = int32([]);
M_.lhs = {
'y'; 
'1/eta*r(1)'; 
'c*eta'; 
'r'; 
'k'; 
'y'; 
'z'; 
'g'; 
'pref'; 
'y_obs'; 
'c_obs'; 
'v_obs'; 
};
M_.static_tmp_nbr = [2; 0; 0; 0; ];
M_.block_structure_stat.block(1).Simulation_Type = 3;
M_.block_structure_stat.block(1).endo_nbr = 1;
M_.block_structure_stat.block(1).mfs = 1;
M_.block_structure_stat.block(1).equation = [ 7];
M_.block_structure_stat.block(1).variable = [ 7];
M_.block_structure_stat.block(2).Simulation_Type = 3;
M_.block_structure_stat.block(2).endo_nbr = 1;
M_.block_structure_stat.block(2).mfs = 1;
M_.block_structure_stat.block(2).equation = [ 8];
M_.block_structure_stat.block(2).variable = [ 11];
M_.block_structure_stat.block(3).Simulation_Type = 3;
M_.block_structure_stat.block(3).endo_nbr = 1;
M_.block_structure_stat.block(3).mfs = 1;
M_.block_structure_stat.block(3).equation = [ 9];
M_.block_structure_stat.block(3).variable = [ 12];
M_.block_structure_stat.block(4).Simulation_Type = 1;
M_.block_structure_stat.block(4).endo_nbr = 2;
M_.block_structure_stat.block(4).mfs = 2;
M_.block_structure_stat.block(4).equation = [ 11 12];
M_.block_structure_stat.block(4).variable = [ 9 10];
M_.block_structure_stat.block(5).Simulation_Type = 3;
M_.block_structure_stat.block(5).endo_nbr = 1;
M_.block_structure_stat.block(5).mfs = 1;
M_.block_structure_stat.block(5).equation = [ 2];
M_.block_structure_stat.block(5).variable = [ 6];
M_.block_structure_stat.block(6).Simulation_Type = 6;
M_.block_structure_stat.block(6).endo_nbr = 5;
M_.block_structure_stat.block(6).mfs = 5;
M_.block_structure_stat.block(6).equation = [ 1 6 3 5 4];
M_.block_structure_stat.block(6).variable = [ 1 3 2 4 5];
M_.block_structure_stat.block(7).Simulation_Type = 1;
M_.block_structure_stat.block(7).endo_nbr = 1;
M_.block_structure_stat.block(7).mfs = 1;
M_.block_structure_stat.block(7).equation = [ 10];
M_.block_structure_stat.block(7).variable = [ 8];
M_.block_structure_stat.variable_reordered = [ 7 11 12 9 10 6 1 3 2 4 5 8];
M_.block_structure_stat.equation_reordered = [ 7 8 9 11 12 2 1 6 3 5 4 10];
M_.block_structure_stat.incidence.sparse_IM = [
 1 1;
 1 2;
 1 4;
 1 11;
 2 6;
 2 12;
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
 8 11;
 9 12;
 10 1;
 10 8;
 11 9;
 12 10;
];
M_.block_structure_stat.tmp_nbr = 1;
M_.block_structure_stat.block(1).g1_sparse_rowval = int32([1 ]);
M_.block_structure_stat.block(1).g1_sparse_colval = int32([1 ]);
M_.block_structure_stat.block(1).g1_sparse_colptr = int32([1 2 ]);
M_.block_structure_stat.block(2).g1_sparse_rowval = int32([1 ]);
M_.block_structure_stat.block(2).g1_sparse_colval = int32([1 ]);
M_.block_structure_stat.block(2).g1_sparse_colptr = int32([1 2 ]);
M_.block_structure_stat.block(3).g1_sparse_rowval = int32([1 ]);
M_.block_structure_stat.block(3).g1_sparse_colval = int32([1 ]);
M_.block_structure_stat.block(3).g1_sparse_colptr = int32([1 2 ]);
M_.block_structure_stat.block(4).g1_sparse_rowval = int32([]);
M_.block_structure_stat.block(4).g1_sparse_colval = int32([]);
M_.block_structure_stat.block(4).g1_sparse_colptr = int32([]);
M_.block_structure_stat.block(5).g1_sparse_rowval = int32([1 ]);
M_.block_structure_stat.block(5).g1_sparse_colval = int32([1 ]);
M_.block_structure_stat.block(5).g1_sparse_colptr = int32([1 2 ]);
M_.block_structure_stat.block(6).g1_sparse_rowval = int32([1 2 3 5 2 3 1 3 1 4 2 4 5 ]);
M_.block_structure_stat.block(6).g1_sparse_colval = int32([1 1 1 1 2 2 3 3 4 4 5 5 5 ]);
M_.block_structure_stat.block(6).g1_sparse_colptr = int32([1 5 7 9 11 14 ]);
M_.block_structure_stat.block(7).g1_sparse_rowval = int32([]);
M_.block_structure_stat.block(7).g1_sparse_colval = int32([]);
M_.block_structure_stat.block(7).g1_sparse_colptr = int32([]);
M_.static_g1_sparse_rowval = int32([1 3 4 6 10 1 3 3 6 1 5 4 5 6 2 4 6 7 10 11 12 1 8 2 9 ]);
M_.static_g1_sparse_colval = int32([1 1 1 1 1 2 2 3 3 4 4 5 5 5 6 6 7 7 8 9 10 11 11 12 12 ]);
M_.static_g1_sparse_colptr = int32([1 6 8 10 12 15 17 19 20 21 22 24 26 ]);
M_.params(1) = 0.33;
rho = M_.params(1);
M_.params(2) = 0.99;
bet = M_.params(2);
M_.params(3) = 0.025;
delt = M_.params(3);
M_.params(4) = 0.95;
psi = M_.params(4);
M_.params(5) = 0.75;
psi_g = M_.params(5);
M_.params(6) = 0.75;
psi_pref = M_.params(6);
M_.params(7) = 2;
eta = M_.params(7);
M_.params(8) = 0.01;
sigmae = M_.params(8);
M_.params(9) = 0.0063118193324634;
y_ss = M_.params(9);
M_.params(10) = 0.007867252260000;
c_ss = M_.params(10);
M_.params(11) = 0.008692268330000;
v_ss = M_.params(11);
steady;
oo_.dr.eigval = check(M_,options_,oo_);
%
% SHOCKS instructions
%
M_.exo_det_length = 0;
M_.Sigma_e(1, 1) = M_.params(8)^2;
if isempty(estim_params_)
    estim_params_.var_exo = zeros(0, 10);
    estim_params_.var_endo = zeros(0, 10);
    estim_params_.corrx = zeros(0, 11);
    estim_params_.corrn = zeros(0, 11);
    estim_params_.param_vals = zeros(0, 10);
end
if ~isempty(find(estim_params_.param_vals(:,1)==4))
    error('Parameter psi has been specified twice in two concatenated ''estimated_params'' blocks. Depending on your intention, you may want to use the ''overwrite'' option or an ''estimated_params_remove'' block.')
end
estim_params_.param_vals = [estim_params_.param_vals; 4, NaN, (-Inf), Inf, 1, 0.75, 0.1, NaN, NaN, NaN ];
if ~isempty(find(estim_params_.param_vals(:,1)==5))
    error('Parameter psi_g has been specified twice in two concatenated ''estimated_params'' blocks. Depending on your intention, you may want to use the ''overwrite'' option or an ''estimated_params_remove'' block.')
end
estim_params_.param_vals = [estim_params_.param_vals; 5, NaN, (-Inf), Inf, 1, 0.75, 0.1, NaN, NaN, NaN ];
if ~isempty(find(estim_params_.param_vals(:,1)==6))
    error('Parameter psi_pref has been specified twice in two concatenated ''estimated_params'' blocks. Depending on your intention, you may want to use the ''overwrite'' option or an ''estimated_params_remove'' block.')
end
estim_params_.param_vals = [estim_params_.param_vals; 6, NaN, (-Inf), Inf, 1, 0.75, 0.1, NaN, NaN, NaN ];
if ~isempty(find(estim_params_.var_exo(:,1)==1))
    error('The standard deviation for epsilon has been specified twice in two concatenated ''estimated_params'' blocks. Depending on your intention, you may want to use the ''overwrite'' option or an ''estimated_params_remove'' block.')
end
estim_params_.var_exo = [estim_params_.var_exo; 1, NaN, (-Inf), Inf, 4, 0.01, Inf, NaN, NaN, NaN ];
if ~isempty(find(estim_params_.var_exo(:,1)==2))
    error('The standard deviation for epsilon_g has been specified twice in two concatenated ''estimated_params'' blocks. Depending on your intention, you may want to use the ''overwrite'' option or an ''estimated_params_remove'' block.')
end
estim_params_.var_exo = [estim_params_.var_exo; 2, NaN, (-Inf), Inf, 4, 0.01, Inf, NaN, NaN, NaN ];
if ~isempty(find(estim_params_.var_exo(:,1)==3))
    error('The standard deviation for epsilon_pref has been specified twice in two concatenated ''estimated_params'' blocks. Depending on your intention, you may want to use the ''overwrite'' option or an ''estimated_params_remove'' block.')
end
estim_params_.var_exo = [estim_params_.var_exo; 3, NaN, (-Inf), Inf, 4, 0.01, Inf, NaN, NaN, NaN ];
options_.bayesian_irf = true;
options_.conditional_variance_decomposition = [1;2;3;4;5;6;7;8;9;10;11;12;13;14;15;16;17;18;19;20;];
options_.datafile = 'data9519';
options_.graph_format = {'fig'};
options_.irf = 40;
options_.mh_drop = 0.5;
options_.mh_jscale = 0.99;
options_.mh_nblck = 3;
options_.mh_replic = 100000;
options_.mode_compute = 4;
options_.moments_varendo = true;
options_.order = 1;
var_list_ = {'y_obs';'c_obs';'v_obs';'y';'c';'n';'v';'k';'r';'z'};
oo_recursive_=dynare_estimation(var_list_);


oo_.time = toc(tic0);
disp(['Total computing time : ' dynsec2hms(oo_.time) ]);
if ~exist([M_.dname filesep 'Output'],'dir')
    mkdir(M_.dname,'Output');
end
save([M_.dname filesep 'Output' filesep 'basicrbc2015_est_results.mat'], 'oo_', 'M_', 'options_');
if exist('estim_params_', 'var') == 1
  save([M_.dname filesep 'Output' filesep 'basicrbc2015_est_results.mat'], 'estim_params_', '-append');
end
if exist('bayestopt_', 'var') == 1
  save([M_.dname filesep 'Output' filesep 'basicrbc2015_est_results.mat'], 'bayestopt_', '-append');
end
if exist('dataset_', 'var') == 1
  save([M_.dname filesep 'Output' filesep 'basicrbc2015_est_results.mat'], 'dataset_', '-append');
end
if exist('estimation_info', 'var') == 1
  save([M_.dname filesep 'Output' filesep 'basicrbc2015_est_results.mat'], 'estimation_info', '-append');
end
if exist('dataset_info', 'var') == 1
  save([M_.dname filesep 'Output' filesep 'basicrbc2015_est_results.mat'], 'dataset_info', '-append');
end
if exist('oo_recursive_', 'var') == 1
  save([M_.dname filesep 'Output' filesep 'basicrbc2015_est_results.mat'], 'oo_recursive_', '-append');
end
if exist('options_mom_', 'var') == 1
  save([M_.dname filesep 'Output' filesep 'basicrbc2015_est_results.mat'], 'options_mom_', '-append');
end
if ~isempty(lastwarn)
  disp('Note: warning(s) encountered in MATLAB/Octave code')
end
