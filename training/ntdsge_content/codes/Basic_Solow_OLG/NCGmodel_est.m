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
% Save empty dates and dseries objects in memory.
dates('initialize');
dseries('initialize');
% Define global variables.
global M_ options_ oo_ estim_params_ bayestopt_ dataset_ dataset_info estimation_info ys0_ ex0_
options_ = [];
M_.fname = 'NCGmodel_est';
M_.dynare_version = '4.5.6';
oo_.dynare_version = '4.5.6';
options_.dynare_version = '4.5.6';
%
% Some global variables initialization
%
global_initialization;
diary off;
diary('NCGmodel_est.log');
M_.exo_names = 'e';
M_.exo_names_tex = 'e';
M_.exo_names_long = 'e';
M_.endo_names = 'c';
M_.endo_names_tex = 'c';
M_.endo_names_long = 'c';
M_.endo_names = char(M_.endo_names, 'k');
M_.endo_names_tex = char(M_.endo_names_tex, 'k');
M_.endo_names_long = char(M_.endo_names_long, 'k');
M_.endo_names = char(M_.endo_names, 'lab');
M_.endo_names_tex = char(M_.endo_names_tex, 'lab');
M_.endo_names_long = char(M_.endo_names_long, 'lab');
M_.endo_names = char(M_.endo_names, 'z');
M_.endo_names_tex = char(M_.endo_names_tex, 'z');
M_.endo_names_long = char(M_.endo_names_long, 'z');
M_.endo_partitions = struct();
M_.param_names = 'bet';
M_.param_names_tex = 'bet';
M_.param_names_long = 'bet';
M_.param_names = char(M_.param_names, 'del');
M_.param_names_tex = char(M_.param_names_tex, 'del');
M_.param_names_long = char(M_.param_names_long, 'del');
M_.param_names = char(M_.param_names, 'alp');
M_.param_names_tex = char(M_.param_names_tex, 'alp');
M_.param_names_long = char(M_.param_names_long, 'alp');
M_.param_names = char(M_.param_names, 'rho');
M_.param_names_tex = char(M_.param_names_tex, 'rho');
M_.param_names_long = char(M_.param_names_long, 'rho');
M_.param_names = char(M_.param_names, 'the');
M_.param_names_tex = char(M_.param_names_tex, 'the');
M_.param_names_long = char(M_.param_names_long, 'the');
M_.param_names = char(M_.param_names, 'tau');
M_.param_names_tex = char(M_.param_names_tex, 'tau');
M_.param_names_long = char(M_.param_names_long, 'tau');
M_.param_names = char(M_.param_names, 's');
M_.param_names_tex = char(M_.param_names_tex, 's');
M_.param_names_long = char(M_.param_names_long, 's');
M_.param_partitions = struct();
M_.exo_det_nbr = 0;
M_.exo_nbr = 1;
M_.endo_nbr = 4;
M_.param_nbr = 7;
M_.orig_endo_nbr = 4;
M_.aux_vars = [];
options_.varobs = cell(1);
options_.varobs(1)  = {'z'};
options_.varobs_id = [ 4  ];
M_.Sigma_e = zeros(1, 1);
M_.Correlation_matrix = eye(1, 1);
M_.H = 0;
M_.Correlation_matrix_ME = 1;
M_.sigma_e_is_diagonal = 1;
M_.det_shocks = [];
options_.block=0;
options_.bytecode=0;
options_.use_dll=0;
M_.hessian_eq_zero = 0;
erase_compiled_function('NCGmodel_est_static');
erase_compiled_function('NCGmodel_est_dynamic');
M_.orig_eq_nbr = 4;
M_.eq_nbr = 4;
M_.ramsey_eq_nbr = 0;
M_.set_auxiliary_variables = exist(['./' M_.fname '_set_auxiliary_variables.m'], 'file') == 2;
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
M_.equations_tags = {
};
M_.static_and_dynamic_models_differ = 0;
M_.exo_names_orig_ord = [1:1];
M_.maximum_lag = 1;
M_.maximum_lead = 1;
M_.maximum_endo_lag = 1;
M_.maximum_endo_lead = 1;
oo_.steady_state = zeros(4, 1);
M_.maximum_exo_lag = 0;
M_.maximum_exo_lead = 0;
oo_.exo_steady_state = zeros(1, 1);
M_.params = NaN(7, 1);
M_.NNZDerivatives = [18; 45; -1];
M_.params( 1 ) = 0.987;
bet = M_.params( 1 );
M_.params( 5 ) = 0.357;
the = M_.params( 5 );
M_.params( 2 ) = 0.012;
del = M_.params( 2 );
M_.params( 3 ) = 0.4;
alp = M_.params( 3 );
M_.params( 6 ) = 2;
tau = M_.params( 6 );
M_.params( 4 ) = 0.95;
rho = M_.params( 4 );
M_.params( 7 ) = 0.007;
s = M_.params( 7 );
%
% INITVAL instructions
%
options_.initval_file = 0;
oo_.steady_state( 2 ) = 1;
oo_.steady_state( 1 ) = 1;
oo_.steady_state( 3 ) = 0.3;
oo_.steady_state( 4 ) = 0;
oo_.exo_steady_state( 1 ) = 0;
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
estim_params_.var_exo = [];
estim_params_.var_endo = [];
estim_params_.corrx = [];
estim_params_.corrn = [];
estim_params_.param_vals = [];
estim_params_.var_exo = [estim_params_.var_exo; 1, NaN, (-Inf), Inf, 4, 0.95, Inf, NaN, NaN, NaN ];
estim_params_.param_vals = [estim_params_.param_vals; 4, NaN, (-Inf), Inf, 1, 0.93, 0.02, NaN, NaN, NaN ];
estim_params_.param_vals = [estim_params_.param_vals; 5, NaN, (-Inf), Inf, 3, 0.3, 0.05, NaN, NaN, NaN ];
estim_params_.param_vals = [estim_params_.param_vals; 6, NaN, (-Inf), Inf, 3, 2.1, 0.3, NaN, NaN, NaN ];
options_.mh_jscale = 0.9;
options_.mh_replic = 10000;
options_.datafile = 'simudata';
options_.order = 1;
var_list_ = char();
oo_recursive_=dynare_estimation(var_list_);
save('NCGmodel_est_results.mat', 'oo_', 'M_', 'options_');
if exist('estim_params_', 'var') == 1
  save('NCGmodel_est_results.mat', 'estim_params_', '-append');
end
if exist('bayestopt_', 'var') == 1
  save('NCGmodel_est_results.mat', 'bayestopt_', '-append');
end
if exist('dataset_', 'var') == 1
  save('NCGmodel_est_results.mat', 'dataset_', '-append');
end
if exist('estimation_info', 'var') == 1
  save('NCGmodel_est_results.mat', 'estimation_info', '-append');
end
if exist('dataset_info', 'var') == 1
  save('NCGmodel_est_results.mat', 'dataset_info', '-append');
end
if exist('oo_recursive_', 'var') == 1
  save('NCGmodel_est_results.mat', 'oo_recursive_', '-append');
end


disp(['Total computing time : ' dynsec2hms(toc(tic0)) ]);
if ~isempty(lastwarn)
  disp('Note: warning(s) encountered in MATLAB/Octave code')
end
diary off
