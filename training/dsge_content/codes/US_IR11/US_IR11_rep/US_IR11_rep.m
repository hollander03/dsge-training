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
M_.fname = 'US_IR11_rep';
M_.dynare_version = '4.5.6';
oo_.dynare_version = '4.5.6';
options_.dynare_version = '4.5.6';
%
% Some global variables initialization
%
global_initialization;
diary off;
diary('US_IR11_rep.log');
M_.exo_names = 'epsa';
M_.exo_names_tex = 'epsa';
M_.exo_names_long = 'epsa';
M_.exo_names = char(M_.exo_names, 'epse');
M_.exo_names_tex = char(M_.exo_names_tex, 'epse');
M_.exo_names_long = char(M_.exo_names_long, 'epse');
M_.exo_names = char(M_.exo_names, 'epsz');
M_.exo_names_tex = char(M_.exo_names_tex, 'epsz');
M_.exo_names_long = char(M_.exo_names_long, 'epsz');
M_.exo_names = char(M_.exo_names, 'epsr');
M_.exo_names_tex = char(M_.exo_names_tex, 'epsr');
M_.exo_names_long = char(M_.exo_names_long, 'epsr');
M_.endo_names = 'a';
M_.endo_names_tex = 'a';
M_.endo_names_long = 'a';
M_.endo_names = char(M_.endo_names, 'lambda');
M_.endo_names_tex = char(M_.endo_names_tex, 'lambda');
M_.endo_names_long = char(M_.endo_names_long, 'lambda');
M_.endo_names = char(M_.endo_names, 'y');
M_.endo_names_tex = char(M_.endo_names_tex, 'y');
M_.endo_names_long = char(M_.endo_names_long, 'y');
M_.endo_names = char(M_.endo_names, 'z');
M_.endo_names_tex = char(M_.endo_names_tex, 'z');
M_.endo_names_long = char(M_.endo_names_long, 'z');
M_.endo_names = char(M_.endo_names, 'r');
M_.endo_names_tex = char(M_.endo_names_tex, 'r');
M_.endo_names_long = char(M_.endo_names_long, 'r');
M_.endo_names = char(M_.endo_names, 'pi');
M_.endo_names_tex = char(M_.endo_names_tex, 'pi');
M_.endo_names_long = char(M_.endo_names_long, 'pi');
M_.endo_names = char(M_.endo_names, 'e');
M_.endo_names_tex = char(M_.endo_names_tex, 'e');
M_.endo_names_long = char(M_.endo_names_long, 'e');
M_.endo_names = char(M_.endo_names, 'g');
M_.endo_names_tex = char(M_.endo_names_tex, 'g');
M_.endo_names_long = char(M_.endo_names_long, 'g');
M_.endo_names = char(M_.endo_names, 'q');
M_.endo_names_tex = char(M_.endo_names_tex, 'q');
M_.endo_names_long = char(M_.endo_names_long, 'q');
M_.endo_names = char(M_.endo_names, 'x');
M_.endo_names_tex = char(M_.endo_names_tex, 'x');
M_.endo_names_long = char(M_.endo_names_long, 'x');
M_.endo_names = char(M_.endo_names, 'inflationq');
M_.endo_names_tex = char(M_.endo_names_tex, 'inflationq');
M_.endo_names_long = char(M_.endo_names_long, 'inflationq');
M_.endo_names = char(M_.endo_names, 'interest');
M_.endo_names_tex = char(M_.endo_names_tex, 'interest');
M_.endo_names_long = char(M_.endo_names_long, 'interest');
M_.endo_names = char(M_.endo_names, 'output');
M_.endo_names_tex = char(M_.endo_names_tex, 'output');
M_.endo_names_long = char(M_.endo_names_long, 'output');
M_.endo_names = char(M_.endo_names, 'Z_au');
M_.endo_names_tex = char(M_.endo_names_tex, 'Z\_au');
M_.endo_names_long = char(M_.endo_names_long, 'Z_au');
M_.endo_partitions = struct();
M_.param_names = 'gamma';
M_.param_names_tex = 'gamma';
M_.param_names_long = 'gamma';
M_.param_names = char(M_.param_names, 'alfa');
M_.param_names_tex = char(M_.param_names_tex, 'alfa');
M_.param_names_long = char(M_.param_names_long, 'alfa');
M_.param_names = char(M_.param_names, 'rhopi');
M_.param_names_tex = char(M_.param_names_tex, 'rhopi');
M_.param_names_long = char(M_.param_names_long, 'rhopi');
M_.param_names = char(M_.param_names, 'rhog');
M_.param_names_tex = char(M_.param_names_tex, 'rhog');
M_.param_names_long = char(M_.param_names_long, 'rhog');
M_.param_names = char(M_.param_names, 'rhoa');
M_.param_names_tex = char(M_.param_names_tex, 'rhoa');
M_.param_names_long = char(M_.param_names_long, 'rhoa');
M_.param_names = char(M_.param_names, 'rhoe');
M_.param_names_tex = char(M_.param_names_tex, 'rhoe');
M_.param_names_long = char(M_.param_names_long, 'rhoe');
M_.param_names = char(M_.param_names, 'zeta');
M_.param_names_tex = char(M_.param_names_tex, 'zeta');
M_.param_names_long = char(M_.param_names_long, 'zeta');
M_.param_names = char(M_.param_names, 'beta');
M_.param_names_tex = char(M_.param_names_tex, 'beta');
M_.param_names_long = char(M_.param_names_long, 'beta');
M_.param_names = char(M_.param_names, 'psi');
M_.param_names_tex = char(M_.param_names_tex, 'psi');
M_.param_names_long = char(M_.param_names_long, 'psi');
M_.param_partitions = struct();
M_.exo_det_nbr = 0;
M_.exo_nbr = 4;
M_.endo_nbr = 14;
M_.param_nbr = 9;
M_.orig_endo_nbr = 14;
M_.aux_vars = [];
M_.Sigma_e = zeros(4, 4);
M_.Correlation_matrix = eye(4, 4);
M_.H = 0;
M_.Correlation_matrix_ME = 1;
M_.sigma_e_is_diagonal = 1;
M_.det_shocks = [];
options_.linear = 1;
options_.block=0;
options_.bytecode=0;
options_.use_dll=0;
M_.hessian_eq_zero = 1;
erase_compiled_function('US_IR11_rep_static');
erase_compiled_function('US_IR11_rep_dynamic');
M_.orig_eq_nbr = 14;
M_.eq_nbr = 14;
M_.ramsey_eq_nbr = 0;
M_.set_auxiliary_variables = exist(['./' M_.fname '_set_auxiliary_variables.m'], 'file') == 2;
M_.lead_lag_incidence = [
 1 8 0;
 0 9 22;
 2 10 23;
 0 11 0;
 3 12 0;
 4 13 24;
 5 14 0;
 0 15 0;
 6 16 25;
 0 17 0;
 0 18 0;
 0 19 0;
 0 20 0;
 7 21 0;]';
M_.nstatic = 6;
M_.nfwrd   = 1;
M_.npred   = 4;
M_.nboth   = 3;
M_.nsfwrd   = 4;
M_.nspred   = 7;
M_.ndynamic   = 8;
M_.equations_tags = {
};
M_.static_and_dynamic_models_differ = 0;
M_.exo_names_orig_ord = [1:4];
M_.maximum_lag = 1;
M_.maximum_lead = 1;
M_.maximum_endo_lag = 1;
M_.maximum_endo_lead = 1;
oo_.steady_state = zeros(14, 1);
M_.maximum_exo_lag = 0;
M_.maximum_exo_lead = 0;
oo_.exo_steady_state = zeros(4, 1);
M_.params = NaN(9, 1);
M_.NNZDerivatives = [51; 0; -1];
M_.params( 1 ) = 0.3904;
gamma = M_.params( 1 );
M_.params( 2 ) = 0;
alfa = M_.params( 2 );
M_.params( 3 ) = 0.4153;
rhopi = M_.params( 3 );
M_.params( 4 ) = 0.1270;
rhog = M_.params( 4 );
M_.params( 5 ) = 0.9797;
rhoa = M_.params( 5 );
M_.params( 6 ) = 0;
rhoe = M_.params( 6 );
M_.params( 7 ) = 1.0046;
zeta = M_.params( 7 );
M_.params( 8 ) = 0.9987;
beta = M_.params( 8 );
M_.params( 9 ) = 0.10;
psi = M_.params( 9 );
steady;
oo_.dr.eigval = check(M_,options_,oo_);
%
% SHOCKS instructions
%
M_.exo_det_length = 0;
M_.Sigma_e(1, 1) = 75.3424;
options_.irf = 20;
var_list_ = char('output','inflationq','interest','x');
info = stoch_simul(var_list_);
save('US_IR11_rep_results.mat', 'oo_', 'M_', 'options_');
if exist('estim_params_', 'var') == 1
  save('US_IR11_rep_results.mat', 'estim_params_', '-append');
end
if exist('bayestopt_', 'var') == 1
  save('US_IR11_rep_results.mat', 'bayestopt_', '-append');
end
if exist('dataset_', 'var') == 1
  save('US_IR11_rep_results.mat', 'dataset_', '-append');
end
if exist('estimation_info', 'var') == 1
  save('US_IR11_rep_results.mat', 'estimation_info', '-append');
end
if exist('dataset_info', 'var') == 1
  save('US_IR11_rep_results.mat', 'dataset_info', '-append');
end
if exist('oo_recursive_', 'var') == 1
  save('US_IR11_rep_results.mat', 'oo_recursive_', '-append');
end


disp(['Total computing time : ' dynsec2hms(toc(tic0)) ]);
if ~isempty(lastwarn)
  disp('Note: warning(s) encountered in MATLAB/Octave code')
end
diary off
