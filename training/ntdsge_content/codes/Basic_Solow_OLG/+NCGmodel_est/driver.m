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
M_.fname = 'NCGmodel_est';
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
M_.exo_names(1) = {'e'};
M_.exo_names_tex(1) = {'e'};
M_.exo_names_long(1) = {'e'};
M_.endo_names = cell(4,1);
M_.endo_names_tex = cell(4,1);
M_.endo_names_long = cell(4,1);
M_.endo_names(1) = {'c'};
M_.endo_names_tex(1) = {'c'};
M_.endo_names_long(1) = {'c'};
M_.endo_names(2) = {'k'};
M_.endo_names_tex(2) = {'k'};
M_.endo_names_long(2) = {'k'};
M_.endo_names(3) = {'lab'};
M_.endo_names_tex(3) = {'lab'};
M_.endo_names_long(3) = {'lab'};
M_.endo_names(4) = {'z'};
M_.endo_names_tex(4) = {'z'};
M_.endo_names_long(4) = {'z'};
M_.endo_partitions = struct();
M_.param_names = cell(7,1);
M_.param_names_tex = cell(7,1);
M_.param_names_long = cell(7,1);
M_.param_names(1) = {'bet'};
M_.param_names_tex(1) = {'bet'};
M_.param_names_long(1) = {'bet'};
M_.param_names(2) = {'del'};
M_.param_names_tex(2) = {'del'};
M_.param_names_long(2) = {'del'};
M_.param_names(3) = {'alp'};
M_.param_names_tex(3) = {'alp'};
M_.param_names_long(3) = {'alp'};
M_.param_names(4) = {'rho'};
M_.param_names_tex(4) = {'rho'};
M_.param_names_long(4) = {'rho'};
M_.param_names(5) = {'the'};
M_.param_names_tex(5) = {'the'};
M_.param_names_long(5) = {'the'};
M_.param_names(6) = {'tau'};
M_.param_names_tex(6) = {'tau'};
M_.param_names_long(6) = {'tau'};
M_.param_names(7) = {'s'};
M_.param_names_tex(7) = {'s'};
M_.param_names_long(7) = {'s'};
M_.param_partitions = struct();
M_.exo_det_nbr = 0;
M_.exo_nbr = 1;
M_.endo_nbr = 4;
M_.param_nbr = 7;
M_.orig_endo_nbr = 4;
M_.aux_vars = [];
options_.varobs = cell(1, 1);
options_.varobs(1)  = {'z'};
options_.varobs_id = [ 4  ];
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
options_.linear = false;
options_.block = false;
options_.bytecode = false;
options_.use_dll = false;
options_.ramsey_policy = false;
options_.discretionary_policy = false;
M_.nonzero_hessian_eqs = [1 2 3];
M_.hessian_eq_zero = isempty(M_.nonzero_hessian_eqs);
M_.eq_nbr = 4;
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
 0 3 7;
 1 4 0;
 0 5 8;
 2 6 0;]';
M_.nstatic = 0;
M_.nfwrd   = 2;
M_.npred   = 2;
M_.nboth   = 0;
M_.nsfwrd   = 2;
M_.nspred   = 2;
M_.ndynamic   = 4;
M_.dynamic_tmp_nbr = [16; 16; 3; 0; ];
M_.equations_tags = {
  1 , 'name' , '1' ;
  2 , 'name' , 'c' ;
  3 , 'name' , 'k' ;
  4 , 'name' , 'z' ;
};
M_.mapping.c.eqidx = [1 2 3 ];
M_.mapping.k.eqidx = [1 2 3 ];
M_.mapping.lab.eqidx = [1 2 3 ];
M_.mapping.z.eqidx = [1 2 3 4 ];
M_.mapping.e.eqidx = [4 ];
M_.static_and_dynamic_models_differ = false;
M_.has_external_function = false;
M_.block_structure.time_recursive = false;
M_.block_structure.block(1).Simulation_Type = 1;
M_.block_structure.block(1).endo_nbr = 1;
M_.block_structure.block(1).mfs = 1;
M_.block_structure.block(1).equation = [ 4];
M_.block_structure.block(1).variable = [ 4];
M_.block_structure.block(1).is_linear = true;
M_.block_structure.block(1).NNZDerivatives = 2;
M_.block_structure.block(1).bytecode_jacob_cols_to_sparse = [1 2 ];
M_.block_structure.block(2).Simulation_Type = 8;
M_.block_structure.block(2).endo_nbr = 3;
M_.block_structure.block(2).mfs = 3;
M_.block_structure.block(2).equation = [ 3 2 1];
M_.block_structure.block(2).variable = [ 2 3 1];
M_.block_structure.block(2).is_linear = false;
M_.block_structure.block(2).NNZDerivatives = 12;
M_.block_structure.block(2).bytecode_jacob_cols_to_sparse = [1 4 5 6 8 9 ];
M_.block_structure.block(1).g1_sparse_rowval = int32([]);
M_.block_structure.block(1).g1_sparse_colval = int32([]);
M_.block_structure.block(1).g1_sparse_colptr = int32([]);
M_.block_structure.block(2).g1_sparse_rowval = int32([1 2 3 1 1 2 3 1 2 3 3 3 ]);
M_.block_structure.block(2).g1_sparse_colval = int32([1 1 1 4 5 5 5 6 6 6 8 9 ]);
M_.block_structure.block(2).g1_sparse_colptr = int32([1 4 4 4 5 8 11 11 12 13 ]);
M_.block_structure.variable_reordered = [ 4 2 3 1];
M_.block_structure.equation_reordered = [ 4 3 2 1];
M_.block_structure.incidence(1).lead_lag = -1;
M_.block_structure.incidence(1).sparse_IM = [
 1 2;
 1 4;
 2 2;
 2 4;
 3 2;
 3 4;
 4 4;
];
M_.block_structure.incidence(2).lead_lag = 0;
M_.block_structure.incidence(2).sparse_IM = [
 1 1;
 1 3;
 2 1;
 2 3;
 3 1;
 3 2;
 3 3;
 4 4;
];
M_.block_structure.incidence(3).lead_lag = 1;
M_.block_structure.incidence(3).sparse_IM = [
 1 1;
 1 3;
];
M_.block_structure.dyn_tmp_nbr = 17;
M_.state_var = [4 2 ];
M_.maximum_lag = 1;
M_.maximum_lead = 1;
M_.maximum_endo_lag = 1;
M_.maximum_endo_lead = 1;
oo_.steady_state = zeros(4, 1);
M_.maximum_exo_lag = 0;
M_.maximum_exo_lead = 0;
oo_.exo_steady_state = zeros(1, 1);
M_.params = NaN(7, 1);
M_.endo_trends = struct('deflator', cell(4, 1), 'log_deflator', cell(4, 1), 'growth_factor', cell(4, 1), 'log_growth_factor', cell(4, 1));
M_.NNZDerivatives = [18; 45; -1; ];
M_.dynamic_g1_sparse_rowval = int32([1 2 3 1 2 3 4 1 2 3 3 1 2 3 4 1 1 4 ]);
M_.dynamic_g1_sparse_colval = int32([2 2 2 4 4 4 4 5 5 5 6 7 7 7 8 9 11 13 ]);
M_.dynamic_g1_sparse_colptr = int32([1 1 4 4 8 11 12 15 16 17 17 18 18 19 ]);
M_.dynamic_g2_sparse_indices = int32([1 5 5 ;
1 5 7 ;
1 9 9 ;
1 9 2 ;
1 9 7 ;
1 9 11 ;
1 9 4 ;
1 2 2 ;
1 2 7 ;
1 2 11 ;
1 2 4 ;
1 7 7 ;
1 7 11 ;
1 7 4 ;
1 11 11 ;
1 11 4 ;
1 4 4 ;
2 2 2 ;
2 2 7 ;
2 2 4 ;
2 7 7 ;
2 7 4 ;
2 4 4 ;
3 2 2 ;
3 2 7 ;
3 2 4 ;
3 7 4 ;
3 4 4 ;
]);
M_.lhs = {
'(c^the*(1-lab)^(1-the))^(1-tau)/c'; 
'c'; 
'k'; 
'z'; 
};
M_.static_tmp_nbr = [11; 4; 0; 0; ];
M_.block_structure_stat.block(1).Simulation_Type = 3;
M_.block_structure_stat.block(1).endo_nbr = 1;
M_.block_structure_stat.block(1).mfs = 1;
M_.block_structure_stat.block(1).equation = [ 4];
M_.block_structure_stat.block(1).variable = [ 4];
M_.block_structure_stat.block(2).Simulation_Type = 6;
M_.block_structure_stat.block(2).endo_nbr = 3;
M_.block_structure_stat.block(2).mfs = 3;
M_.block_structure_stat.block(2).equation = [ 2 3 1];
M_.block_structure_stat.block(2).variable = [ 2 3 1];
M_.block_structure_stat.variable_reordered = [ 4 2 3 1];
M_.block_structure_stat.equation_reordered = [ 4 2 3 1];
M_.block_structure_stat.incidence.sparse_IM = [
 1 1;
 1 2;
 1 3;
 1 4;
 2 1;
 2 2;
 2 3;
 2 4;
 3 1;
 3 2;
 3 3;
 3 4;
 4 4;
];
M_.block_structure_stat.tmp_nbr = 15;
M_.block_structure_stat.block(1).g1_sparse_rowval = int32([1 ]);
M_.block_structure_stat.block(1).g1_sparse_colval = int32([1 ]);
M_.block_structure_stat.block(1).g1_sparse_colptr = int32([1 2 ]);
M_.block_structure_stat.block(2).g1_sparse_rowval = int32([1 2 3 1 2 3 1 2 3 ]);
M_.block_structure_stat.block(2).g1_sparse_colval = int32([1 1 1 2 2 2 3 3 3 ]);
M_.block_structure_stat.block(2).g1_sparse_colptr = int32([1 4 7 10 ]);
M_.static_g1_sparse_rowval = int32([1 2 3 1 2 3 1 2 3 1 2 3 4 ]);
M_.static_g1_sparse_colval = int32([1 1 1 2 2 2 3 3 3 4 4 4 4 ]);
M_.static_g1_sparse_colptr = int32([1 4 7 10 14 ]);
M_.params(1) = 0.987;
bet = M_.params(1);
M_.params(5) = 0.357;
the = M_.params(5);
M_.params(2) = 0.012;
del = M_.params(2);
M_.params(3) = 0.4;
alp = M_.params(3);
M_.params(6) = 2;
tau = M_.params(6);
M_.params(4) = 0.95;
rho = M_.params(4);
M_.params(7) = 0.007;
s = M_.params(7);
%
% INITVAL instructions
%
options_.initval_file = false;
oo_.steady_state(2) = 1;
oo_.steady_state(1) = 1;
oo_.steady_state(3) = 0.3;
oo_.steady_state(4) = 0;
oo_.exo_steady_state(1) = 0;
if M_.exo_nbr > 0
	oo_.exo_simul = ones(M_.maximum_lag,1)*oo_.exo_steady_state';
end
if M_.exo_det_nbr > 0
	oo_.exo_det_simul = ones(M_.maximum_lag,1)*oo_.exo_det_steady_state';
end
%
% SHOCKS instructions
%
M_.exo_det_length = 0;
M_.Sigma_e(1, 1) = (1)^2;
steady;
oo_.dr.eigval = check(M_,options_,oo_);
if isempty(estim_params_)
    estim_params_.var_exo = zeros(0, 10);
    estim_params_.var_endo = zeros(0, 10);
    estim_params_.corrx = zeros(0, 11);
    estim_params_.corrn = zeros(0, 11);
    estim_params_.param_vals = zeros(0, 10);
end
if ~isempty(find(estim_params_.var_exo(:,1)==1))
    error('The standard deviation for e has been specified twice in two concatenated ''estimated_params'' blocks. Depending on your intention, you may want to use the ''overwrite'' option or an ''estimated_params_remove'' block.')
end
estim_params_.var_exo = [estim_params_.var_exo; 1, NaN, (-Inf), Inf, 4, 0.5, Inf, NaN, NaN, NaN ];
if ~isempty(find(estim_params_.param_vals(:,1)==4))
    error('Parameter rho has been specified twice in two concatenated ''estimated_params'' blocks. Depending on your intention, you may want to use the ''overwrite'' option or an ''estimated_params_remove'' block.')
end
estim_params_.param_vals = [estim_params_.param_vals; 4, NaN, (-Inf), Inf, 1, 0.5, 0.1, NaN, NaN, NaN ];
if ~isempty(find(estim_params_.param_vals(:,1)==5))
    error('Parameter the has been specified twice in two concatenated ''estimated_params'' blocks. Depending on your intention, you may want to use the ''overwrite'' option or an ''estimated_params_remove'' block.')
end
estim_params_.param_vals = [estim_params_.param_vals; 5, NaN, (-Inf), Inf, 3, 0.7, 0.1, NaN, NaN, NaN ];
if ~isempty(find(estim_params_.param_vals(:,1)==6))
    error('Parameter tau has been specified twice in two concatenated ''estimated_params'' blocks. Depending on your intention, you may want to use the ''overwrite'' option or an ''estimated_params_remove'' block.')
end
estim_params_.param_vals = [estim_params_.param_vals; 6, NaN, (-Inf), Inf, 3, 4, 1, NaN, NaN, NaN ];
options_.datafile = 'simudata';
options_.mh_jscale = 0.9;
options_.mh_replic = 10000;
options_.mode_compute = 5;
options_.order = 1;
var_list_ = {};
oo_recursive_=dynare_estimation(var_list_);


oo_.time = toc(tic0);
disp(['Total computing time : ' dynsec2hms(oo_.time) ]);
if ~exist([M_.dname filesep 'Output'],'dir')
    mkdir(M_.dname,'Output');
end
save([M_.dname filesep 'Output' filesep 'NCGmodel_est_results.mat'], 'oo_', 'M_', 'options_');
if exist('estim_params_', 'var') == 1
  save([M_.dname filesep 'Output' filesep 'NCGmodel_est_results.mat'], 'estim_params_', '-append');
end
if exist('bayestopt_', 'var') == 1
  save([M_.dname filesep 'Output' filesep 'NCGmodel_est_results.mat'], 'bayestopt_', '-append');
end
if exist('dataset_', 'var') == 1
  save([M_.dname filesep 'Output' filesep 'NCGmodel_est_results.mat'], 'dataset_', '-append');
end
if exist('estimation_info', 'var') == 1
  save([M_.dname filesep 'Output' filesep 'NCGmodel_est_results.mat'], 'estimation_info', '-append');
end
if exist('dataset_info', 'var') == 1
  save([M_.dname filesep 'Output' filesep 'NCGmodel_est_results.mat'], 'dataset_info', '-append');
end
if exist('oo_recursive_', 'var') == 1
  save([M_.dname filesep 'Output' filesep 'NCGmodel_est_results.mat'], 'oo_recursive_', '-append');
end
if exist('options_mom_', 'var') == 1
  save([M_.dname filesep 'Output' filesep 'NCGmodel_est_results.mat'], 'options_mom_', '-append');
end
if ~isempty(lastwarn)
  disp('Note: warning(s) encountered in MATLAB/Octave code')
end
