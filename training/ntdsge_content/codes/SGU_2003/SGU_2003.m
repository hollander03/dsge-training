%
% Status : main Dynare file 
%
% Warning : this file is generated automatically by Dynare
%           from model file (.mod)

clear all
tic;
global M_ oo_ options_ ys0_ ex0_ estimation_info
options_ = [];
M_.fname = 'SGU_2003';
%
% Some global variables initialization
%
global_initialization;
diary off;
diary('SGU_2003.log');
M_.exo_names = 'e';
M_.exo_names_tex = 'e';
M_.exo_names_long = 'e';
M_.endo_names = 'c';
M_.endo_names_tex = 'c';
M_.endo_names_long = 'c';
M_.endo_names = char(M_.endo_names, 'h');
M_.endo_names_tex = char(M_.endo_names_tex, 'h');
M_.endo_names_long = char(M_.endo_names_long, 'h');
M_.endo_names = char(M_.endo_names, 'y');
M_.endo_names_tex = char(M_.endo_names_tex, 'y');
M_.endo_names_long = char(M_.endo_names_long, 'y');
M_.endo_names = char(M_.endo_names, 'i');
M_.endo_names_tex = char(M_.endo_names_tex, 'i');
M_.endo_names_long = char(M_.endo_names_long, 'i');
M_.endo_names = char(M_.endo_names, 'k');
M_.endo_names_tex = char(M_.endo_names_tex, 'k');
M_.endo_names_long = char(M_.endo_names_long, 'k');
M_.endo_names = char(M_.endo_names, 'a');
M_.endo_names_tex = char(M_.endo_names_tex, 'a');
M_.endo_names_long = char(M_.endo_names_long, 'a');
M_.endo_names = char(M_.endo_names, 'lambda');
M_.endo_names_tex = char(M_.endo_names_tex, '{\lambda}');
M_.endo_names_long = char(M_.endo_names_long, 'lambda');
M_.endo_names = char(M_.endo_names, 'util');
M_.endo_names_tex = char(M_.endo_names_tex, 'util');
M_.endo_names_long = char(M_.endo_names_long, 'util');
M_.endo_names = char(M_.endo_names, 'd');
M_.endo_names_tex = char(M_.endo_names_tex, 'd');
M_.endo_names_long = char(M_.endo_names_long, 'd');
M_.endo_names = char(M_.endo_names, 'tb_y');
M_.endo_names_tex = char(M_.endo_names_tex, 'tb\_y');
M_.endo_names_long = char(M_.endo_names_long, 'tb_y');
M_.endo_names = char(M_.endo_names, 'ca_y');
M_.endo_names_tex = char(M_.endo_names_tex, 'ca\_y');
M_.endo_names_long = char(M_.endo_names_long, 'ca_y');
M_.endo_names = char(M_.endo_names, 'r');
M_.endo_names_tex = char(M_.endo_names_tex, 'r');
M_.endo_names_long = char(M_.endo_names_long, 'r');
M_.endo_names = char(M_.endo_names, 'beta_fun');
M_.endo_names_tex = char(M_.endo_names_tex, 'beta\_fun');
M_.endo_names_long = char(M_.endo_names_long, 'beta_fun');
M_.endo_names = char(M_.endo_names, 'eta');
M_.endo_names_tex = char(M_.endo_names_tex, 'eta');
M_.endo_names_long = char(M_.endo_names_long, 'eta');
M_.param_names = 'gamma';
M_.param_names_tex = '{\gamma}';
M_.param_names_long = 'gamma';
M_.param_names = char(M_.param_names, 'omega');
M_.param_names_tex = char(M_.param_names_tex, '{\omega}');
M_.param_names_long = char(M_.param_names_long, 'omega');
M_.param_names = char(M_.param_names, 'rho');
M_.param_names_tex = char(M_.param_names_tex, '{\gamma}');
M_.param_names_long = char(M_.param_names_long, 'rho');
M_.param_names = char(M_.param_names, 'sigma_tfp');
M_.param_names_tex = char(M_.param_names_tex, '{\sigma_{a}}');
M_.param_names_long = char(M_.param_names_long, 'sigma_tfp');
M_.param_names = char(M_.param_names, 'delta');
M_.param_names_tex = char(M_.param_names_tex, '{\delta}');
M_.param_names_long = char(M_.param_names_long, 'delta');
M_.param_names = char(M_.param_names, 'psi_1');
M_.param_names_tex = char(M_.param_names_tex, '{\psi_1}');
M_.param_names_long = char(M_.param_names_long, 'psi_1');
M_.param_names = char(M_.param_names, 'psi_2');
M_.param_names_tex = char(M_.param_names_tex, '{\psi_2}');
M_.param_names_long = char(M_.param_names_long, 'psi_2');
M_.param_names = char(M_.param_names, 'alpha');
M_.param_names_tex = char(M_.param_names_tex, '{\alpha}');
M_.param_names_long = char(M_.param_names_long, 'alpha');
M_.param_names = char(M_.param_names, 'phi');
M_.param_names_tex = char(M_.param_names_tex, '{\phi}');
M_.param_names_long = char(M_.param_names_long, 'phi');
M_.param_names = char(M_.param_names, 'psi_3');
M_.param_names_tex = char(M_.param_names_tex, '{\psi_3}');
M_.param_names_long = char(M_.param_names_long, 'psi_3');
M_.param_names = char(M_.param_names, 'psi_4');
M_.param_names_tex = char(M_.param_names_tex, '{\psi_4}');
M_.param_names_long = char(M_.param_names_long, 'psi_4');
M_.param_names = char(M_.param_names, 'r_bar');
M_.param_names_tex = char(M_.param_names_tex, '{\bar r}');
M_.param_names_long = char(M_.param_names_long, 'r_bar');
M_.param_names = char(M_.param_names, 'd_bar');
M_.param_names_tex = char(M_.param_names_tex, '{\bar d}');
M_.param_names_long = char(M_.param_names_long, 'd_bar');
M_.exo_det_nbr = 0;
M_.exo_nbr = 1;
M_.endo_nbr = 14;
M_.param_nbr = 13;
M_.orig_endo_nbr = 14;
M_.aux_vars = [];
M_.Sigma_e = zeros(1, 1);
M_.Correlation_matrix = eye(1, 1);
M_.H = 0;
M_.Correlation_matrix_ME = 1;
M_.sigma_e_is_diagonal = 1;
options_.block=0;
options_.bytecode=0;
options_.use_dll=0;
erase_compiled_function('SGU_2003_static');
erase_compiled_function('SGU_2003_dynamic');
M_.lead_lag_incidence = [
 0 5 0;
 0 6 0;
 0 7 19;
 0 8 0;
 1 9 20;
 2 10 0;
 0 11 21;
 0 12 22;
 3 13 0;
 0 14 0;
 0 15 0;
 4 16 0;
 0 17 23;
 0 18 24;]';
M_.nstatic = 5;
M_.nfwrd   = 5;
M_.npred   = 3;
M_.nboth   = 1;
M_.nsfwrd   = 6;
M_.nspred   = 4;
M_.ndynamic   = 9;
M_.equations_tags = {
};
M_.static_and_dynamic_models_differ = 0;
M_.exo_names_orig_ord = [1:1];
M_.maximum_lag = 1;
M_.maximum_lead = 1;
M_.maximum_endo_lag = 1;
M_.maximum_endo_lead = 1;
oo_.steady_state = zeros(14, 1);
M_.maximum_exo_lag = 0;
M_.maximum_exo_lead = 0;
oo_.exo_steady_state = zeros(1, 1);
M_.params = NaN(13, 1);
M_.NNZDerivatives = zeros(3, 1);
M_.NNZDerivatives(1) = 57;
M_.NNZDerivatives(2) = -1;
M_.NNZDerivatives(3) = -1;
M_.params( 1 ) = 2;
gamma = M_.params( 1 );
M_.params( 2 ) = 1.455;
omega = M_.params( 2 );
M_.params( 6 ) = 0;
psi_1 = M_.params( 6 );
M_.params( 8 ) = 0.32;
alpha = M_.params( 8 );
M_.params( 9 ) = 0.028;
phi = M_.params( 9 );
M_.params( 12 ) = 0.04;
r_bar = M_.params( 12 );
M_.params( 5 ) = 0.1;
delta = M_.params( 5 );
M_.params( 3 ) = 0.42;
rho = M_.params( 3 );
M_.params( 4 ) = 0.0129;
sigma_tfp = M_.params( 4 );
M_.params( 7 ) = 0.000742;
psi_2 = M_.params( 7 );
M_.params( 13 ) = 0.7442;
d_bar = M_.params( 13 );
M_.params( 10 ) = 0.00074;
psi_3 = M_.params( 10 );
M_.params( 11 ) = 0;
psi_4 = M_.params( 11 );
resid(1);
oo_.dr.eigval = check(M_,options_,oo_);
steady;
%
% SHOCKS instructions
%
make_ex_;
M_.exo_det_length = 0;
M_.Sigma_e(1, 1) = (1)^2;
options_.irf = 0;
options_.order = 1;
var_list_=[];
info = stoch_simul(var_list_);
y_pos=strmatch('y',M_.endo_names,'exact');
c_pos=strmatch('c',M_.endo_names,'exact');
i_pos=strmatch('i',M_.endo_names,'exact');
h_pos=strmatch('h',M_.endo_names,'exact');
tb_y_pos=strmatch('tb_y',M_.endo_names,'exact');
ca_y_pos=strmatch('ca_y',M_.endo_names,'exact');
fprintf('\nstd(y):              \t %2.1f \n',sqrt(oo_.var(y_pos,y_pos))*100)
fprintf('std(c):                \t %2.1f \n',sqrt(oo_.var(c_pos,c_pos))*100)
fprintf('std(i):                \t %2.1f \n',sqrt(oo_.var(i_pos,i_pos))*100)
fprintf('std(h):                \t %2.1f \n',sqrt(oo_.var(h_pos,h_pos))*100)
fprintf('std(tb/y):             \t %2.1f \n',sqrt(oo_.var(tb_y_pos,tb_y_pos))*100)
if ~isempty(ca_y_pos)
fprintf('std(ca/y):             \t %2.1f \n',sqrt(oo_.var(ca_y_pos,ca_y_pos))*100)
else 
fprintf('std(ca/y):             \t %2.1f \n',sqrt(oo_.var(ca_y_pos,ca_y_pos))*100)
end
fprintf('corr(y_t,y_t-1):       \t %3.2f \n',oo_.autocorr{1}(y_pos,y_pos))
fprintf('corr(c_t,c_t-1):       \t %3.2f \n',oo_.autocorr{1}(c_pos,c_pos))
fprintf('corr(i_t,i_t-1):       \t %4.3f \n',oo_.autocorr{1}(i_pos,i_pos))
fprintf('corr(h_t,h_t-1):       \t %3.2f \n',oo_.autocorr{1}(h_pos,h_pos))
fprintf('corr(tb/y_t,tb/y_t-1): \t %3.2f \n',oo_.autocorr{1}(tb_y_pos,tb_y_pos))
if ~isempty(ca_y_pos)
fprintf('corr(ca/y_t,ca/y_t-1): \t %3.2f \n',oo_.autocorr{1}(ca_y_pos,ca_y_pos))
else 
fprintf('corr(ca/y_t,ca/y_t-1): \t %3.2f \n',NaN)
end
fprintf('corr(c_t,y_t):         \t %3.2f \n',oo_.gamma_y{1}(c_pos,y_pos)/sqrt(oo_.var(c_pos,c_pos)*oo_.var(y_pos,y_pos)))
fprintf('corr(i_t,y_t):         \t %3.2f \n',oo_.gamma_y{1}(i_pos,y_pos)/sqrt(oo_.var(i_pos,i_pos)*oo_.var(y_pos,y_pos)))
fprintf('corr(h_t,y_t):         \t %2.1f \n',oo_.gamma_y{1}(h_pos,y_pos)/sqrt(oo_.var(h_pos,h_pos)*oo_.var(y_pos,y_pos)))
fprintf('corr(tb/y_t,y_t):      \t %4.3f \n',oo_.gamma_y{1}(tb_y_pos,y_pos)/sqrt(oo_.var(tb_y_pos,tb_y_pos)*oo_.var(y_pos,y_pos)))
if ~isempty(ca_y_pos)
fprintf('corr(ca/y_t,y_t):      \t %4.3f \n',oo_.gamma_y{1}(ca_y_pos,y_pos)/sqrt(oo_.var(ca_y_pos,ca_y_pos)*oo_.var(y_pos,y_pos)))
else 
fprintf('corr(ca/y_t,y_t):      \t %4.3f \n',NaN)
end
%
% SHOCKS instructions
%
make_ex_;
M_.exo_det_length = 0;
M_.Sigma_e(1, 1) = (1/M_.params(4))^2;
options_.irf = 10;
options_.order = 1;
var_list_=[];
info = stoch_simul(var_list_);
save('SGU_2003_results.mat', 'oo_', 'M_', 'options_');
if exist('estim_params_', 'var') == 1
  save('SGU_2003_results.mat', 'estim_params_', '-append');
end
if exist('bayestopt_', 'var') == 1
  save('SGU_2003_results.mat', 'bayestopt_', '-append');
end
if exist('dataset_', 'var') == 1
  save('SGU_2003_results.mat', 'dataset_', '-append');
end
if exist('estimation_info', 'var') == 1
  save('SGU_2003_results.mat', 'estimation_info', '-append');
end


disp(['Total computing time : ' dynsec2hms(toc) ]);
if ~isempty(lastwarn)
  disp('Note: warning(s) encountered in MATLAB/Octave code')
end
diary off
