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
M_.fname = 'basicRBC2015';
M_.dynare_version = '4.5.6';
oo_.dynare_version = '4.5.6';
options_.dynare_version = '4.5.6';
%
% Some global variables initialization
%
global_initialization;
diary off;
diary('basicRBC2015.log');
M_.exo_names = 'epsilon';
M_.exo_names_tex = '{\epsilon_z}';
M_.exo_names_long = 'TFP shock';
M_.endo_names = 'y';
M_.endo_names_tex = '{y}';
M_.endo_names_long = 'output';
M_.endo_names = char(M_.endo_names, 'c');
M_.endo_names_tex = char(M_.endo_names_tex, '{c}');
M_.endo_names_long = char(M_.endo_names_long, 'consumption');
M_.endo_names = char(M_.endo_names, 'n');
M_.endo_names_tex = char(M_.endo_names_tex, '{n}');
M_.endo_names_long = char(M_.endo_names_long, 'hours');
M_.endo_names = char(M_.endo_names, 'v');
M_.endo_names_tex = char(M_.endo_names_tex, '{v}');
M_.endo_names_long = char(M_.endo_names_long, 'investment');
M_.endo_names = char(M_.endo_names, 'k');
M_.endo_names_tex = char(M_.endo_names_tex, '{k}');
M_.endo_names_long = char(M_.endo_names_long, 'capital');
M_.endo_names = char(M_.endo_names, 'r');
M_.endo_names_tex = char(M_.endo_names_tex, '{r}');
M_.endo_names_long = char(M_.endo_names_long, 'real rate');
M_.endo_names = char(M_.endo_names, 'z');
M_.endo_names_tex = char(M_.endo_names_tex, '{z}');
M_.endo_names_long = char(M_.endo_names_long, 'TFP');
M_.endo_partitions = struct();
M_.param_names = 'rho';
M_.param_names_tex = '{\rho}';
M_.param_names_long = 'capital share';
M_.param_names = char(M_.param_names, 'bet');
M_.param_names_tex = char(M_.param_names_tex, '{\beta}');
M_.param_names_long = char(M_.param_names_long, 'discount factor');
M_.param_names = char(M_.param_names, 'delt');
M_.param_names_tex = char(M_.param_names_tex, '{\delta}');
M_.param_names_long = char(M_.param_names_long, 'depreciation rate');
M_.param_names = char(M_.param_names, 'psi');
M_.param_names_tex = char(M_.param_names_tex, '{\psi}');
M_.param_names_long = char(M_.param_names_long, 'persistence TFP shock');
M_.param_names = char(M_.param_names, 'eta');
M_.param_names_tex = char(M_.param_names_tex, '{\eta}');
M_.param_names_long = char(M_.param_names_long, 'risk aversion');
M_.param_names = char(M_.param_names, 'sigmae');
M_.param_names_tex = char(M_.param_names_tex, '{\sigma_{e}}');
M_.param_names_long = char(M_.param_names_long, 'i.i.d TFP shock');
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
M_.sigma_e_is_diagonal = 1;
M_.det_shocks = [];
options_.linear = 1;
options_.block=0;
options_.bytecode=0;
options_.use_dll=0;
M_.hessian_eq_zero = 1;
erase_compiled_function('basicRBC2015_static');
erase_compiled_function('basicRBC2015_dynamic');
M_.orig_eq_nbr = 7;
M_.eq_nbr = 7;
M_.ramsey_eq_nbr = 0;
M_.set_auxiliary_variables = exist(['./' M_.fname '_set_auxiliary_variables.m'], 'file') == 2;
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
M_.equations_tags = {
  1 , 'name' , 'Resource constraint' ;
  2 , 'name' , 'Euler equation' ;
  3 , 'name' , 'Labor FOC' ;
  4 , 'name' , 'real interest rate/firm FOC capital' ;
  5 , 'name' , 'Law of motion capital' ;
  6 , 'name' , 'production function' ;
  7 , 'name' , 'exogenous TFP process' ;
};
M_.static_and_dynamic_models_differ = 0;
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
M_.NNZDerivatives = [22; -1; -1];
M_.params( 1 ) = 0.33;
rho = M_.params( 1 );
M_.params( 2 ) = 0.99;
bet = M_.params( 2 );
M_.params( 3 ) = 0.025;
delt = M_.params( 3 );
M_.params( 4 ) = 0.95;
psi = M_.params( 4 );
M_.params( 5 ) = 2;
eta = M_.params( 5 );
M_.params( 6 ) = 0.01;
sigmae = M_.params( 6 );
steady;
oo_.dr.eigval = check(M_,options_,oo_);
%
% SHOCKS instructions
%
M_.exo_det_length = 0;
M_.Sigma_e(1, 1) = M_.params(6)^2;
options_.nodisplay = 1;
options_.order = 1;
options_.periods = 200;
options_.graph_format = char('fig');
var_list_ = char();
info = stoch_simul(var_list_);
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
