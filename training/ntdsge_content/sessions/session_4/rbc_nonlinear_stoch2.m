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
M_.fname = 'rbc_nonlinear_stoch2';
M_.dynare_version = '4.5.6';
oo_.dynare_version = '4.5.6';
options_.dynare_version = '4.5.6';
%
% Some global variables initialization
%
global_initialization;
diary off;
diary('rbc_nonlinear_stoch2.log');
M_.exo_names = 'epsa';
M_.exo_names_tex = '{\varepsilon^A}';
M_.exo_names_long = 'Productivity Shock';
M_.exo_names = char(M_.exo_names, 'epsz');
M_.exo_names_tex = char(M_.exo_names_tex, 'epsz');
M_.exo_names_long = char(M_.exo_names_long, 'epsz');
M_.endo_names = 'y';
M_.endo_names_tex = '{Y}';
M_.endo_names_long = 'output';
M_.endo_names = char(M_.endo_names, 'c');
M_.endo_names_tex = char(M_.endo_names_tex, '{C}');
M_.endo_names_long = char(M_.endo_names_long, 'consumption');
M_.endo_names = char(M_.endo_names, 'k');
M_.endo_names_tex = char(M_.endo_names_tex, '{K}');
M_.endo_names_long = char(M_.endo_names_long, 'capital');
M_.endo_names = char(M_.endo_names, 'l');
M_.endo_names_tex = char(M_.endo_names_tex, '{L}');
M_.endo_names_long = char(M_.endo_names_long, 'labor');
M_.endo_names = char(M_.endo_names, 'a');
M_.endo_names_tex = char(M_.endo_names_tex, '{A}');
M_.endo_names_long = char(M_.endo_names_long, 'productivity');
M_.endo_names = char(M_.endo_names, 'r');
M_.endo_names_tex = char(M_.endo_names_tex, '{R}');
M_.endo_names_long = char(M_.endo_names_long, 'interest Rate');
M_.endo_names = char(M_.endo_names, 'w');
M_.endo_names_tex = char(M_.endo_names_tex, '{W}');
M_.endo_names_long = char(M_.endo_names_long, 'wage');
M_.endo_names = char(M_.endo_names, 'iv');
M_.endo_names_tex = char(M_.endo_names_tex, '{I}');
M_.endo_names_long = char(M_.endo_names_long, 'investment');
M_.endo_names = char(M_.endo_names, 'mc');
M_.endo_names_tex = char(M_.endo_names_tex, '{MC}');
M_.endo_names_long = char(M_.endo_names_long, 'marginal Costs');
M_.endo_names = char(M_.endo_names, 'z');
M_.endo_names_tex = char(M_.endo_names_tex, 'z');
M_.endo_names_long = char(M_.endo_names_long, 'z');
M_.endo_names = char(M_.endo_names, 'fk');
M_.endo_names_tex = char(M_.endo_names_tex, '{f_t^K}');
M_.endo_names_long = char(M_.endo_names_long, 'fk');
M_.endo_names = char(M_.endo_names, 'fl');
M_.endo_names_tex = char(M_.endo_names_tex, '{f_t^L}');
M_.endo_names_long = char(M_.endo_names_long, 'fl');
M_.endo_partitions = struct();
M_.param_names = 'BETA';
M_.param_names_tex = '{\beta}';
M_.param_names_long = 'Discount Factor';
M_.param_names = char(M_.param_names, 'DELTA');
M_.param_names_tex = char(M_.param_names_tex, '{\delta}');
M_.param_names_long = char(M_.param_names_long, 'Depreciation Rate');
M_.param_names = char(M_.param_names, 'GAMMA');
M_.param_names_tex = char(M_.param_names_tex, '{\gamma}');
M_.param_names_long = char(M_.param_names_long, 'Consumption Utility Weight');
M_.param_names = char(M_.param_names, 'PSI');
M_.param_names_tex = char(M_.param_names_tex, '{\psi}');
M_.param_names_long = char(M_.param_names_long, 'Labor Disutility Weight');
M_.param_names = char(M_.param_names, 'ETAC');
M_.param_names_tex = char(M_.param_names_tex, '{\eta^C}');
M_.param_names_long = char(M_.param_names_long, 'Risk Aversion');
M_.param_names = char(M_.param_names, 'ETAL');
M_.param_names_tex = char(M_.param_names_tex, '{\eta^L}');
M_.param_names_long = char(M_.param_names_long, 'Inverse Frisch Elasticity');
M_.param_names = char(M_.param_names, 'ALPHA');
M_.param_names_tex = char(M_.param_names_tex, '{\alpha}');
M_.param_names_long = char(M_.param_names_long, 'Output Elasticity of Capital');
M_.param_names = char(M_.param_names, 'RHOA');
M_.param_names_tex = char(M_.param_names_tex, '{\rho^A}');
M_.param_names_long = char(M_.param_names_long, 'Discount Factor');
M_.param_names = char(M_.param_names, 'RHOZ');
M_.param_names_tex = char(M_.param_names_tex, 'RHOZ');
M_.param_names_long = char(M_.param_names_long, 'RHOZ');
M_.param_partitions = struct();
M_.exo_det_nbr = 0;
M_.exo_nbr = 2;
M_.endo_nbr = 12;
M_.param_nbr = 9;
M_.orig_endo_nbr = 12;
M_.aux_vars = [];
M_.Sigma_e = zeros(2, 2);
M_.Correlation_matrix = eye(2, 2);
M_.H = 0;
M_.Correlation_matrix_ME = 1;
M_.sigma_e_is_diagonal = 1;
M_.det_shocks = [];
options_.block=0;
options_.bytecode=0;
options_.use_dll=0;
M_.hessian_eq_zero = 1;
erase_compiled_function('rbc_nonlinear_stoch2_static');
erase_compiled_function('rbc_nonlinear_stoch2_dynamic');
M_.orig_eq_nbr = 12;
M_.eq_nbr = 12;
M_.ramsey_eq_nbr = 0;
M_.set_auxiliary_variables = exist(['./' M_.fname '_set_auxiliary_variables.m'], 'file') == 2;
M_.lead_lag_incidence = [
 0 4 0;
 0 5 16;
 1 6 0;
 0 7 0;
 2 8 0;
 0 9 17;
 0 10 0;
 0 11 0;
 0 12 0;
 3 13 0;
 0 14 0;
 0 15 0;]';
M_.nstatic = 7;
M_.nfwrd   = 2;
M_.npred   = 3;
M_.nboth   = 0;
M_.nsfwrd   = 2;
M_.nspred   = 3;
M_.ndynamic   = 5;
M_.equations_tags = {
  3 , 'name' , 'intertemporal optimality (Euler)' ;
  4 , 'name' , 'labor supply' ;
  5 , 'name' , 'capital accumulation' ;
  6 , 'name' , 'market clearing' ;
  7 , 'name' , 'production function' ;
  8 , 'name' , 'marginal costs' ;
  9 , 'name' , 'labor demand' ;
  10 , 'name' , 'capital demand' ;
  11 , 'name' , 'total factor productivity' ;
};
M_.static_and_dynamic_models_differ = 0;
M_.exo_names_orig_ord = [1:2];
M_.maximum_lag = 1;
M_.maximum_lead = 1;
M_.maximum_endo_lag = 1;
M_.maximum_endo_lead = 1;
oo_.steady_state = zeros(12, 1);
M_.maximum_exo_lag = 0;
M_.maximum_exo_lead = 0;
oo_.exo_steady_state = zeros(2, 1);
M_.params = NaN(9, 1);
M_.NNZDerivatives = [37; -1; -1];
M_.params( 7 ) = 0.35;
ALPHA = M_.params( 7 );
M_.params( 1 ) = 0.99;
BETA = M_.params( 1 );
M_.params( 2 ) = 0.025;
DELTA = M_.params( 2 );
M_.params( 3 ) = 1;
GAMMA = M_.params( 3 );
M_.params( 4 ) = 1.6;
PSI = M_.params( 4 );
M_.params( 8 ) = 0.9;
RHOA = M_.params( 8 );
M_.params( 5 ) = 2;
ETAC = M_.params( 5 );
M_.params( 6 ) = 1;
ETAL = M_.params( 6 );
M_.params( 9 ) = 0.5;
RHOZ = M_.params( 9 );
steady;
oo_.dr.eigval = check(M_,options_,oo_);
%
% SHOCKS instructions
%
M_.exo_det_length = 0;
M_.Sigma_e(1, 1) = 0.0016;
M_.Sigma_e(2, 2) = 0.0001;
options_.irf = 20;
options_.order = 1;
var_list_ = char('y','c','iv','a','r','fk','l','fl','z');
info = stoch_simul(var_list_);
save('rbc_nonlinear_stoch2_results.mat', 'oo_', 'M_', 'options_');
if exist('estim_params_', 'var') == 1
  save('rbc_nonlinear_stoch2_results.mat', 'estim_params_', '-append');
end
if exist('bayestopt_', 'var') == 1
  save('rbc_nonlinear_stoch2_results.mat', 'bayestopt_', '-append');
end
if exist('dataset_', 'var') == 1
  save('rbc_nonlinear_stoch2_results.mat', 'dataset_', '-append');
end
if exist('estimation_info', 'var') == 1
  save('rbc_nonlinear_stoch2_results.mat', 'estimation_info', '-append');
end
if exist('dataset_info', 'var') == 1
  save('rbc_nonlinear_stoch2_results.mat', 'dataset_info', '-append');
end
if exist('oo_recursive_', 'var') == 1
  save('rbc_nonlinear_stoch2_results.mat', 'oo_recursive_', '-append');
end


disp(['Total computing time : ' dynsec2hms(toc(tic0)) ]);
if ~isempty(lastwarn)
  disp('Note: warning(s) encountered in MATLAB/Octave code')
end
diary off
