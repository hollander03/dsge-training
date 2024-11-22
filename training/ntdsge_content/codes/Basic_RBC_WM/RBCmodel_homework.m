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
M_.fname = 'RBCmodel_homework';
M_.dynare_version = '4.5.6';
oo_.dynare_version = '4.5.6';
options_.dynare_version = '4.5.6';
%
% Some global variables initialization
%
global_initialization;
diary off;
diary('RBCmodel_homework.log');
M_.exo_names = 'epsa';
M_.exo_names_tex = '{\varepsilon^A}';
M_.exo_names_long = 'Productivity Shock';
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
M_.param_names = char(M_.param_names, 'ALPHA');
M_.param_names_tex = char(M_.param_names_tex, '{\alpha}');
M_.param_names_long = char(M_.param_names_long, 'Output Elasticity of Capital');
M_.param_names = char(M_.param_names, 'RHOA');
M_.param_names_tex = char(M_.param_names_tex, '{\rho^A}');
M_.param_names_long = char(M_.param_names_long, 'TFP persistence');
M_.param_names = char(M_.param_names, 'sigmae');
M_.param_names_tex = char(M_.param_names_tex, 'sigmae');
M_.param_names_long = char(M_.param_names_long, 'sigmae');
M_.param_partitions = struct();
M_.exo_det_nbr = 0;
M_.exo_nbr = 1;
M_.endo_nbr = 9;
M_.param_nbr = 7;
M_.orig_endo_nbr = 9;
M_.aux_vars = [];
M_.Sigma_e = zeros(1, 1);
M_.Correlation_matrix = eye(1, 1);
M_.H = 0;
M_.Correlation_matrix_ME = 1;
M_.sigma_e_is_diagonal = 1;
M_.det_shocks = [];
options_.block=0;
options_.bytecode=0;
options_.use_dll=0;
M_.hessian_eq_zero = 1;
erase_compiled_function('RBCmodel_homework_static');
erase_compiled_function('RBCmodel_homework_dynamic');
M_.orig_eq_nbr = 9;
M_.eq_nbr = 9;
M_.ramsey_eq_nbr = 0;
M_.set_auxiliary_variables = exist(['./' M_.fname '_set_auxiliary_variables.m'], 'file') == 2;
M_.lead_lag_incidence = [
 0 3 0;
 0 4 12;
 1 5 0;
 0 6 0;
 2 7 0;
 0 8 0;
 0 9 0;
 0 10 0;
 0 11 0;]';
M_.nstatic = 6;
M_.nfwrd   = 1;
M_.npred   = 2;
M_.nboth   = 0;
M_.nsfwrd   = 1;
M_.nspred   = 2;
M_.ndynamic   = 3;
M_.equations_tags = {
};
M_.static_and_dynamic_models_differ = 0;
M_.exo_names_orig_ord = [1:1];
M_.maximum_lag = 1;
M_.maximum_lead = 1;
M_.maximum_endo_lag = 1;
M_.maximum_endo_lead = 1;
oo_.steady_state = zeros(9, 1);
M_.maximum_exo_lag = 0;
M_.maximum_exo_lead = 0;
oo_.exo_steady_state = zeros(1, 1);
M_.params = NaN(7, 1);
M_.NNZDerivatives = [28; -1; -1];
M_.params( 5 ) = 0.35;
ALPHA = M_.params( 5 );
M_.params( 1 ) = 0.99;
BETA = M_.params( 1 );
M_.params( 2 ) = 0.025;
DELTA = M_.params( 2 );
M_.params( 3 ) = 1;
GAMMA = M_.params( 3 );
M_.params( 4 ) = 1.6;
PSI = M_.params( 4 );
M_.params( 6 ) = 0.9;
RHOA = M_.params( 6 );
M_.params( 7 ) = 1;
sigmae = M_.params( 7 );
%
% INITVAL instructions
%
options_.initval_file = 0;
oo_.steady_state( 5 ) = 1;
oo_.steady_state( 9 ) = 1;
oo_.steady_state( 6 ) = 0.03;
oo_.steady_state( 4 ) = 0.3333333333333333;
oo_.steady_state( 1 ) = 1.2;
oo_.steady_state( 2 ) = 0.9;
oo_.steady_state( 8 ) = 0.35;
oo_.steady_state( 3 ) = 12;
oo_.steady_state( 7 ) = 2.25;
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
M_.Sigma_e(1, 1) = M_.params(7)^2;
resid;
steady;
oo_.dr.eigval = check(M_,options_,oo_);
options_.order = 1;
options_.periods = 150;
var_list_ = char();
info = stoch_simul(var_list_);
figure
plot(0:40, [0 y_epsa'])
hold
plot(0:40, [0 c_epsa'])
plot(0:40, [0 k_epsa'])
plot(0:40, [0 l_epsa'])
plot(0:40, [0 a_epsa'])
plot(0:40, [0 r_epsa'])
plot(0:40, [0 w_epsa'])
plot(0:40, [0 iv_epsa'])
plot(0:40, [0 mc_epsa'])
title('Impulse responses to a technology shock')
legend('Output','Consumption','Capital','Employment','Technology shock', 'Rate of return','wage','Investment','mc')
ylabel('percentage deviations from steady state')
xlabel('quarters after shock')
write_latex_definitions;
write_latex_parameter_table;
collect_latex_files;
if system(['pdflatex -halt-on-error -interaction=batchmode ' M_.fname '_TeX_binder.tex'])
warning('TeX-File did not compile; you need to compile it manually')
end
save('RBCmodel_homework_results.mat', 'oo_', 'M_', 'options_');
if exist('estim_params_', 'var') == 1
  save('RBCmodel_homework_results.mat', 'estim_params_', '-append');
end
if exist('bayestopt_', 'var') == 1
  save('RBCmodel_homework_results.mat', 'bayestopt_', '-append');
end
if exist('dataset_', 'var') == 1
  save('RBCmodel_homework_results.mat', 'dataset_', '-append');
end
if exist('estimation_info', 'var') == 1
  save('RBCmodel_homework_results.mat', 'estimation_info', '-append');
end
if exist('dataset_info', 'var') == 1
  save('RBCmodel_homework_results.mat', 'dataset_info', '-append');
end
if exist('oo_recursive_', 'var') == 1
  save('RBCmodel_homework_results.mat', 'oo_recursive_', '-append');
end


disp(['Total computing time : ' dynsec2hms(toc(tic0)) ]);
if ~isempty(lastwarn)
  disp('Note: warning(s) encountered in MATLAB/Octave code')
end
diary off
