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
M_.fname = 'Solow_SS_transition';
M_.dynare_version = '4.5.6';
oo_.dynare_version = '4.5.6';
options_.dynare_version = '4.5.6';
%
% Some global variables initialization
%
global_initialization;
diary off;
diary('Solow_SS_transition.log');
M_.endo_names = 'c';
M_.endo_names_tex = '{c}';
M_.endo_names_long = 'consumption (intensive form)';
M_.endo_names = char(M_.endo_names, 'k');
M_.endo_names_tex = char(M_.endo_names_tex, '{k}');
M_.endo_names_long = char(M_.endo_names_long, 'capital (intensive form)');
M_.endo_names = char(M_.endo_names, 'y');
M_.endo_names_tex = char(M_.endo_names_tex, '{y}');
M_.endo_names_long = char(M_.endo_names_long, 'output (intensive form)');
M_.endo_names = char(M_.endo_names, 'invest');
M_.endo_names_tex = char(M_.endo_names_tex, '{i}');
M_.endo_names_long = char(M_.endo_names_long, 'investment (intensive form)');
M_.endo_names = char(M_.endo_names, 'log_c');
M_.endo_names_tex = char(M_.endo_names_tex, '{\log c}');
M_.endo_names_long = char(M_.endo_names_long, 'log consumption (intensive form)');
M_.endo_names = char(M_.endo_names, 'log_k');
M_.endo_names_tex = char(M_.endo_names_tex, '{\log k}');
M_.endo_names_long = char(M_.endo_names_long, 'log capital (intensive form)');
M_.endo_names = char(M_.endo_names, 'log_y');
M_.endo_names_tex = char(M_.endo_names_tex, '{\log y}');
M_.endo_names_long = char(M_.endo_names_long, 'log output (intensive form)');
M_.endo_names = char(M_.endo_names, 'log_invest');
M_.endo_names_tex = char(M_.endo_names_tex, '{\log i}');
M_.endo_names_long = char(M_.endo_names_long, 'log investment (intensive form)');
M_.endo_names = char(M_.endo_names, 'g_k_aggregate');
M_.endo_names_tex = char(M_.endo_names_tex, '{\Delta K}');
M_.endo_names_long = char(M_.endo_names_long, 'Growth rate aggregate capital');
M_.endo_names = char(M_.endo_names, 'g_k_per_capita');
M_.endo_names_tex = char(M_.endo_names_tex, '{\Delta \tilde k}');
M_.endo_names_long = char(M_.endo_names_long, 'Growth rate capital per capita');
M_.endo_names = char(M_.endo_names, 'g_k_intensive');
M_.endo_names_tex = char(M_.endo_names_tex, '{\Delta k}');
M_.endo_names_long = char(M_.endo_names_long, 'Growth rate capital in intensive form');
M_.endo_partitions = struct();
M_.param_names = 's';
M_.param_names_tex = '{s}';
M_.param_names_long = 'saving rate';
M_.param_names = char(M_.param_names, 'alpha');
M_.param_names_tex = char(M_.param_names_tex, '{\alpha}');
M_.param_names_long = char(M_.param_names_long, 'capital share production function');
M_.param_names = char(M_.param_names, 'delta');
M_.param_names_tex = char(M_.param_names_tex, '{\delta}');
M_.param_names_long = char(M_.param_names_long, 'depreciation rate');
M_.param_names = char(M_.param_names, 'n');
M_.param_names_tex = char(M_.param_names_tex, '{n}');
M_.param_names_long = char(M_.param_names_long, 'population growth rate');
M_.param_names = char(M_.param_names, 'g');
M_.param_names_tex = char(M_.param_names_tex, '{g}');
M_.param_names_long = char(M_.param_names_long, 'technology growth rate');
M_.param_partitions = struct();
M_.exo_det_nbr = 0;
M_.exo_nbr = 0;
M_.endo_nbr = 11;
M_.param_nbr = 5;
M_.orig_endo_nbr = 11;
M_.aux_vars = [];
M_.predetermined_variables = [ 2 ];
M_.Sigma_e = zeros(0, 0);
M_.Correlation_matrix = eye(0, 0);
M_.H = 0;
M_.Correlation_matrix_ME = 1;
M_.sigma_e_is_diagonal = 1;
M_.det_shocks = [];
options_.block=0;
options_.bytecode=0;
options_.use_dll=0;
M_.hessian_eq_zero = 1;
erase_compiled_function('Solow_SS_transition_static');
erase_compiled_function('Solow_SS_transition_dynamic');
M_.orig_eq_nbr = 11;
M_.eq_nbr = 11;
M_.ramsey_eq_nbr = 0;
M_.set_auxiliary_variables = exist(['./' M_.fname '_set_auxiliary_variables.m'], 'file') == 2;
M_.lead_lag_incidence = [
 0 2;
 1 3;
 0 4;
 0 5;
 0 6;
 0 7;
 0 8;
 0 9;
 0 10;
 0 11;
 0 12;]';
M_.nstatic = 10;
M_.nfwrd   = 0;
M_.npred   = 1;
M_.nboth   = 0;
M_.nsfwrd   = 0;
M_.nspred   = 1;
M_.ndynamic   = 1;
M_.equations_tags = {
  1 , 'name' , 'Law of motion capital' ;
  2 , 'name' , 'resource constraint' ;
  3 , 'name' , 'behavioral rule savings' ;
  4 , 'name' , 'production function' ;
  5 , 'name' , 'Definition log output' ;
  6 , 'name' , 'Definition log consumption' ;
  7 , 'name' , 'Definition log investment' ;
  8 , 'name' , 'Definition capital decided upon today' ;
  9 , 'name' , 'Definition capital growth rate between today and tomorrow ' ;
  10 , 'name' , 'Definition capital per capita growth rate between today and tomorrow' ;
  11 , 'name' , 'Definition aggregate capital growth rate between today and tomorrow' ;
};
M_.static_and_dynamic_models_differ = 0;
M_.exo_names_orig_ord = [1:0];
M_.maximum_lag = 1;
M_.maximum_lead = 0;
M_.maximum_endo_lag = 1;
M_.maximum_endo_lead = 0;
oo_.steady_state = zeros(11, 1);
M_.maximum_exo_lag = 0;
M_.maximum_exo_lead = 0;
oo_.exo_steady_state = zeros(0, 1);
M_.params = NaN(5, 1);
M_.NNZDerivatives = [25; 0; -1];
M_.params( 1 ) = 0.2;
s = M_.params( 1 );
M_.params( 2 ) = 0.3;
alpha = M_.params( 2 );
M_.params( 3 ) = 0.1;
delta = M_.params( 3 );
M_.params( 4 ) = 0.01;
n = M_.params( 4 );
M_.params( 5 ) = 0.02;
g = M_.params( 5 );
g_initial=0.02;
%
% INITVAL instructions
%
options_.initval_file = 0;
oo_.steady_state( 2 ) = 0.9*((M_.params(3)+M_.params(4)+M_.params(5)+M_.params(4)*M_.params(5))/M_.params(1))^(1/(M_.params(2)-1));
oo_.steady_state( 3 ) = oo_.steady_state(2)^M_.params(2);
oo_.steady_state( 1 ) = (1-M_.params(1))*oo_.steady_state(3);
oo_.steady_state( 4 ) = oo_.steady_state(3)-oo_.steady_state(1);
oo_.steady_state( 7 ) = log(oo_.steady_state(3));
oo_.steady_state( 5 ) = log(oo_.steady_state(1));
oo_.steady_state( 8 ) = log(oo_.steady_state(4));
oo_.steady_state( 6 ) = log(oo_.steady_state(2));
oo_.steady_state( 11 ) = 0;
oo_.steady_state( 10 ) = M_.params(5)+oo_.steady_state(11);
oo_.steady_state( 9 ) = M_.params(4)+M_.params(5)+oo_.steady_state(11);
if M_.exo_nbr > 0
	oo_.exo_simul = ones(M_.maximum_lag,1)*oo_.exo_steady_state';
end
if M_.exo_det_nbr > 0
	oo_.exo_det_simul = ones(M_.maximum_lag,1)*oo_.exo_det_steady_state';
end
%
% ENDVAL instructions
%
ys0_= oo_.steady_state;
ex0_ = oo_.exo_steady_state;
oo_.steady_state( 2 ) = ((M_.params(3)+M_.params(4)+M_.params(5)+M_.params(4)*M_.params(5))/M_.params(1))^(1/(M_.params(2)-1));
oo_.steady_state( 3 ) = oo_.steady_state(2)^M_.params(2);
oo_.steady_state( 1 ) = (1-M_.params(1))*oo_.steady_state(3);
oo_.steady_state( 4 ) = oo_.steady_state(3)-oo_.steady_state(1);
oo_.steady_state( 7 ) = log(oo_.steady_state(3));
oo_.steady_state( 5 ) = log(oo_.steady_state(1));
oo_.steady_state( 8 ) = log(oo_.steady_state(4));
oo_.steady_state( 6 ) = log(oo_.steady_state(2));
oo_.steady_state( 11 ) = 0;
oo_.steady_state( 10 ) = M_.params(5)+oo_.steady_state(11);
oo_.steady_state( 9 ) = M_.params(4)+M_.params(5)+oo_.steady_state(11);
resid;
options_.periods = 200;
perfect_foresight_setup;
perfect_foresight_solver;
var_list_ = char('log_k');
rplot(var_list_);
var_list_ = char('log_c');
rplot(var_list_);
var_list_ = char('log_y');
rplot(var_list_);
save('Solow_SS_transition_results.mat', 'oo_', 'M_', 'options_');
if exist('estim_params_', 'var') == 1
  save('Solow_SS_transition_results.mat', 'estim_params_', '-append');
end
if exist('bayestopt_', 'var') == 1
  save('Solow_SS_transition_results.mat', 'bayestopt_', '-append');
end
if exist('dataset_', 'var') == 1
  save('Solow_SS_transition_results.mat', 'dataset_', '-append');
end
if exist('estimation_info', 'var') == 1
  save('Solow_SS_transition_results.mat', 'estimation_info', '-append');
end
if exist('dataset_info', 'var') == 1
  save('Solow_SS_transition_results.mat', 'dataset_info', '-append');
end
if exist('oo_recursive_', 'var') == 1
  save('Solow_SS_transition_results.mat', 'oo_recursive_', '-append');
end


disp(['Total computing time : ' dynsec2hms(toc(tic0)) ]);
if ~isempty(lastwarn)
  disp('Note: warning(s) encountered in MATLAB/Octave code')
end
diary off
