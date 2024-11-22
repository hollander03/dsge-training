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
M_.fname = 'SamNet';
M_.dynare_version = '6.0';
oo_.dynare_version = '6.0';
options_.dynare_version = '6.0';
%
% Some global variables initialization
%
global_initialization;
M_.exo_names = cell(3,1);
M_.exo_names_tex = cell(3,1);
M_.exo_names_long = cell(3,1);
M_.exo_names(1) = {'ups_a'};
M_.exo_names_tex(1) = {'ups\_a'};
M_.exo_names_long(1) = {'ups_a'};
M_.exo_names(2) = {'ups_z'};
M_.exo_names_tex(2) = {'ups\_z'};
M_.exo_names_long(2) = {'ups_z'};
M_.exo_names(3) = {'ups_vareps'};
M_.exo_names_tex(3) = {'ups\_vareps'};
M_.exo_names_long(3) = {'ups_vareps'};
M_.endo_names = cell(19,1);
M_.endo_names_tex = cell(19,1);
M_.endo_names_long = cell(19,1);
M_.endo_names(1) = {'C'};
M_.endo_names_tex(1) = {'C'};
M_.endo_names_long(1) = {'C'};
M_.endo_names(2) = {'C_h'};
M_.endo_names_tex(2) = {'C\_h'};
M_.endo_names_long(2) = {'C_h'};
M_.endo_names(3) = {'C_e'};
M_.endo_names_tex(3) = {'C\_e'};
M_.endo_names_long(3) = {'C_e'};
M_.endo_names(4) = {'C_b'};
M_.endo_names_tex(4) = {'C\_b'};
M_.endo_names_long(4) = {'C_b'};
M_.endo_names(5) = {'H_h'};
M_.endo_names_tex(5) = {'H\_h'};
M_.endo_names_long(5) = {'H_h'};
M_.endo_names(6) = {'H_e'};
M_.endo_names_tex(6) = {'H\_e'};
M_.endo_names_long(6) = {'H_e'};
M_.endo_names(7) = {'N'};
M_.endo_names_tex(7) = {'N'};
M_.endo_names_long(7) = {'N'};
M_.endo_names(8) = {'W'};
M_.endo_names_tex(8) = {'W'};
M_.endo_names_long(8) = {'W'};
M_.endo_names(9) = {'q'};
M_.endo_names_tex(9) = {'q'};
M_.endo_names_long(9) = {'q'};
M_.endo_names(10) = {'D'};
M_.endo_names_tex(10) = {'D'};
M_.endo_names_long(10) = {'D'};
M_.endo_names(11) = {'L_e'};
M_.endo_names_tex(11) = {'L\_e'};
M_.endo_names_long(11) = {'L_e'};
M_.endo_names(12) = {'R_d'};
M_.endo_names_tex(12) = {'R\_d'};
M_.endo_names_long(12) = {'R_d'};
M_.endo_names(13) = {'R_l'};
M_.endo_names_tex(13) = {'R\_l'};
M_.endo_names_long(13) = {'R_l'};
M_.endo_names(14) = {'Sprd'};
M_.endo_names_tex(14) = {'Sprd'};
M_.endo_names_long(14) = {'Sprd'};
M_.endo_names(15) = {'Y'};
M_.endo_names_tex(15) = {'Y'};
M_.endo_names_long(15) = {'Y'};
M_.endo_names(16) = {'kappa'};
M_.endo_names_tex(16) = {'kappa'};
M_.endo_names_long(16) = {'kappa'};
M_.endo_names(17) = {'A'};
M_.endo_names_tex(17) = {'A'};
M_.endo_names_long(17) = {'A'};
M_.endo_names(18) = {'Z'};
M_.endo_names_tex(18) = {'Z'};
M_.endo_names_long(18) = {'Z'};
M_.endo_names(19) = {'vareps'};
M_.endo_names_tex(19) = {'vareps'};
M_.endo_names_long(19) = {'vareps'};
M_.endo_partitions = struct();
M_.param_names = cell(39,1);
M_.param_names_tex = cell(39,1);
M_.param_names_long = cell(39,1);
M_.param_names(1) = {'beta_h'};
M_.param_names_tex(1) = {'beta\_h'};
M_.param_names_long(1) = {'beta_h'};
M_.param_names(2) = {'beta_e'};
M_.param_names_tex(2) = {'beta\_e'};
M_.param_names_long(2) = {'beta_e'};
M_.param_names(3) = {'beta_b'};
M_.param_names_tex(3) = {'beta\_b'};
M_.param_names_long(3) = {'beta_b'};
M_.param_names(4) = {'m_e'};
M_.param_names_tex(4) = {'m\_e'};
M_.param_names_long(4) = {'m_e'};
M_.param_names(5) = {'m_n'};
M_.param_names_tex(5) = {'m\_n'};
M_.param_names_long(5) = {'m_n'};
M_.param_names(6) = {'j'};
M_.param_names_tex(6) = {'j'};
M_.param_names_long(6) = {'j'};
M_.param_names(7) = {'tau'};
M_.param_names_tex(7) = {'tau'};
M_.param_names_long(7) = {'tau'};
M_.param_names(8) = {'alpha'};
M_.param_names_tex(8) = {'alpha'};
M_.param_names_long(8) = {'alpha'};
M_.param_names(9) = {'rho_a'};
M_.param_names_tex(9) = {'rho\_a'};
M_.param_names_long(9) = {'rho_a'};
M_.param_names(10) = {'rho_z'};
M_.param_names_tex(10) = {'rho\_z'};
M_.param_names_long(10) = {'rho_z'};
M_.param_names(11) = {'rho_eps'};
M_.param_names_tex(11) = {'rho\_eps'};
M_.param_names_long(11) = {'rho_eps'};
M_.param_names(12) = {'chi_x'};
M_.param_names_tex(12) = {'chi\_x'};
M_.param_names_long(12) = {'chi_x'};
M_.param_names(13) = {'chi_y'};
M_.param_names_tex(13) = {'chi\_y'};
M_.param_names_long(13) = {'chi_y'};
M_.param_names(14) = {'chi_l'};
M_.param_names_tex(14) = {'chi\_l'};
M_.param_names_long(14) = {'chi_l'};
M_.param_names(15) = {'Omega_1'};
M_.param_names_tex(15) = {'Omega\_1'};
M_.param_names_long(15) = {'Omega_1'};
M_.param_names(16) = {'Omega_2'};
M_.param_names_tex(16) = {'Omega\_2'};
M_.param_names_long(16) = {'Omega_2'};
M_.param_names(17) = {'Omega_3'};
M_.param_names_tex(17) = {'Omega\_3'};
M_.param_names_long(17) = {'Omega_3'};
M_.param_names(18) = {'C_ss'};
M_.param_names_tex(18) = {'C\_ss'};
M_.param_names_long(18) = {'C_ss'};
M_.param_names(19) = {'C_hss'};
M_.param_names_tex(19) = {'C\_hss'};
M_.param_names_long(19) = {'C_hss'};
M_.param_names(20) = {'C_ess'};
M_.param_names_tex(20) = {'C\_ess'};
M_.param_names_long(20) = {'C_ess'};
M_.param_names(21) = {'C_bss'};
M_.param_names_tex(21) = {'C\_bss'};
M_.param_names_long(21) = {'C_bss'};
M_.param_names(22) = {'H_hss'};
M_.param_names_tex(22) = {'H\_hss'};
M_.param_names_long(22) = {'H_hss'};
M_.param_names(23) = {'H_ess'};
M_.param_names_tex(23) = {'H\_ess'};
M_.param_names_long(23) = {'H_ess'};
M_.param_names(24) = {'N_ss'};
M_.param_names_tex(24) = {'N\_ss'};
M_.param_names_long(24) = {'N_ss'};
M_.param_names(25) = {'W_ss'};
M_.param_names_tex(25) = {'W\_ss'};
M_.param_names_long(25) = {'W_ss'};
M_.param_names(26) = {'q_ss'};
M_.param_names_tex(26) = {'q\_ss'};
M_.param_names_long(26) = {'q_ss'};
M_.param_names(27) = {'D_ss'};
M_.param_names_tex(27) = {'D\_ss'};
M_.param_names_long(27) = {'D_ss'};
M_.param_names(28) = {'L_ess'};
M_.param_names_tex(28) = {'L\_ess'};
M_.param_names_long(28) = {'L_ess'};
M_.param_names(29) = {'R_dss'};
M_.param_names_tex(29) = {'R\_dss'};
M_.param_names_long(29) = {'R_dss'};
M_.param_names(30) = {'R_lss'};
M_.param_names_tex(30) = {'R\_lss'};
M_.param_names_long(30) = {'R_lss'};
M_.param_names(31) = {'Sprd_ss'};
M_.param_names_tex(31) = {'Sprd\_ss'};
M_.param_names_long(31) = {'Sprd_ss'};
M_.param_names(32) = {'Y_ss'};
M_.param_names_tex(32) = {'Y\_ss'};
M_.param_names_long(32) = {'Y_ss'};
M_.param_names(33) = {'kappa_ss'};
M_.param_names_tex(33) = {'kappa\_ss'};
M_.param_names_long(33) = {'kappa_ss'};
M_.param_names(34) = {'A_ss'};
M_.param_names_tex(34) = {'A\_ss'};
M_.param_names_long(34) = {'A_ss'};
M_.param_names(35) = {'Z_ss'};
M_.param_names_tex(35) = {'Z\_ss'};
M_.param_names_long(35) = {'Z_ss'};
M_.param_names(36) = {'vareps_ss'};
M_.param_names_tex(36) = {'vareps\_ss'};
M_.param_names_long(36) = {'vareps_ss'};
M_.param_names(37) = {'phi_le'};
M_.param_names_tex(37) = {'phi\_le'};
M_.param_names_long(37) = {'phi_le'};
M_.param_names(38) = {'phi_lb'};
M_.param_names_tex(38) = {'phi\_lb'};
M_.param_names_long(38) = {'phi_lb'};
M_.param_names(39) = {'eta'};
M_.param_names_tex(39) = {'eta'};
M_.param_names_long(39) = {'eta'};
M_.param_partitions = struct();
M_.exo_det_nbr = 0;
M_.exo_nbr = 3;
M_.endo_nbr = 19;
M_.param_nbr = 39;
M_.orig_endo_nbr = 19;
M_.aux_vars = [];
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
options_.linear = false;
options_.block = false;
options_.bytecode = false;
options_.use_dll = false;
options_.ramsey_policy = false;
options_.discretionary_policy = false;
M_.eq_nbr = 19;
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
 0 12 0;
 1 13 31;
 2 14 32;
 3 15 33;
 4 16 0;
 5 17 0;
 0 18 0;
 0 19 0;
 0 20 34;
 6 21 0;
 7 22 0;
 8 23 0;
 0 24 35;
 0 25 0;
 0 26 36;
 0 27 0;
 9 28 0;
 10 29 0;
 11 30 0;]';
M_.nstatic = 5;
M_.nfwrd   = 3;
M_.npred   = 8;
M_.nboth   = 3;
M_.nsfwrd   = 6;
M_.nspred   = 11;
M_.ndynamic   = 14;
M_.dynamic_tmp_nbr = [10; 3; 0; 0; ];
M_.equations_tags = {
  1 , 'name' , '1' ;
  2 , 'name' , '2' ;
  3 , 'name' , 'q' ;
  4 , 'name' , 'W' ;
  5 , 'name' , '5' ;
  6 , 'name' , 'Y' ;
  7 , 'name' , 'L_e' ;
  8 , 'name' , '8' ;
  9 , 'name' , '9' ;
  10 , 'name' , '10' ;
  11 , 'name' , 'D' ;
  12 , 'name' , '12' ;
  13 , 'name' , '13' ;
  14 , 'name' , 'kappa' ;
  15 , 'name' , 'Sprd' ;
  16 , 'name' , 'C' ;
  17 , 'name' , '17' ;
  18 , 'name' , 'vareps' ;
  19 , 'name' , '19' ;
};
M_.mapping.C.eqidx = [16 ];
M_.mapping.C_h.eqidx = [1 2 3 4 16 ];
M_.mapping.C_e.eqidx = [5 8 9 16 ];
M_.mapping.C_b.eqidx = [10 12 16 ];
M_.mapping.H_h.eqidx = [1 3 13 ];
M_.mapping.H_e.eqidx = [5 6 7 8 13 ];
M_.mapping.N.eqidx = [1 4 5 6 7 9 ];
M_.mapping.W.eqidx = [1 4 5 7 9 ];
M_.mapping.q.eqidx = [1 3 5 7 8 ];
M_.mapping.D.eqidx = [1 10 11 ];
M_.mapping.L_e.eqidx = [5 7 8 10 11 12 14 ];
M_.mapping.R_d.eqidx = [1 2 10 12 15 ];
M_.mapping.R_l.eqidx = [5 7 8 9 10 12 15 ];
M_.mapping.Sprd.eqidx = [15 ];
M_.mapping.Y.eqidx = [5 6 8 9 14 ];
M_.mapping.kappa.eqidx = [11 12 14 ];
M_.mapping.A.eqidx = [3 17 ];
M_.mapping.Z.eqidx = [6 19 ];
M_.mapping.vareps.eqidx = [11 18 ];
M_.mapping.ups_a.eqidx = [17 ];
M_.mapping.ups_z.eqidx = [19 ];
M_.mapping.ups_vareps.eqidx = [18 ];
M_.static_and_dynamic_models_differ = false;
M_.has_external_function = false;
M_.block_structure.time_recursive = false;
M_.block_structure.block(1).Simulation_Type = 3;
M_.block_structure.block(1).endo_nbr = 1;
M_.block_structure.block(1).mfs = 1;
M_.block_structure.block(1).equation = [ 17];
M_.block_structure.block(1).variable = [ 17];
M_.block_structure.block(1).is_linear = false;
M_.block_structure.block(1).NNZDerivatives = 2;
M_.block_structure.block(1).bytecode_jacob_cols_to_sparse = [0 1 ];
M_.block_structure.block(2).Simulation_Type = 1;
M_.block_structure.block(2).endo_nbr = 1;
M_.block_structure.block(2).mfs = 1;
M_.block_structure.block(2).equation = [ 18];
M_.block_structure.block(2).variable = [ 19];
M_.block_structure.block(2).is_linear = true;
M_.block_structure.block(2).NNZDerivatives = 2;
M_.block_structure.block(2).bytecode_jacob_cols_to_sparse = [1 2 ];
M_.block_structure.block(3).Simulation_Type = 3;
M_.block_structure.block(3).endo_nbr = 1;
M_.block_structure.block(3).mfs = 1;
M_.block_structure.block(3).equation = [ 19];
M_.block_structure.block(3).variable = [ 18];
M_.block_structure.block(3).is_linear = false;
M_.block_structure.block(3).NNZDerivatives = 2;
M_.block_structure.block(3).bytecode_jacob_cols_to_sparse = [0 1 ];
M_.block_structure.block(4).Simulation_Type = 8;
M_.block_structure.block(4).endo_nbr = 14;
M_.block_structure.block(4).mfs = 14;
M_.block_structure.block(4).equation = [ 4 6 11 7 13 14 2 1 5 12 3 8 9 10];
M_.block_structure.block(4).variable = [ 8 7 16 6 5 11 12 10 3 4 2 9 15 13];
M_.block_structure.block(4).is_linear = false;
M_.block_structure.block(4).NNZDerivatives = 82;
M_.block_structure.block(4).bytecode_jacob_cols_to_sparse = [4 5 6 7 8 9 10 11 15 16 17 18 19 20 21 22 23 24 25 26 27 28 37 38 39 40 41 42 ];
M_.block_structure.block(5).Simulation_Type = 1;
M_.block_structure.block(5).endo_nbr = 2;
M_.block_structure.block(5).mfs = 2;
M_.block_structure.block(5).equation = [ 16 15];
M_.block_structure.block(5).variable = [ 1 14];
M_.block_structure.block(5).is_linear = true;
M_.block_structure.block(5).NNZDerivatives = 2;
M_.block_structure.block(5).bytecode_jacob_cols_to_sparse = [3 4 ];
M_.block_structure.block(1).g1_sparse_rowval = int32([1 ]);
M_.block_structure.block(1).g1_sparse_colval = int32([1 ]);
M_.block_structure.block(1).g1_sparse_colptr = int32([1 2 ]);
M_.block_structure.block(2).g1_sparse_rowval = int32([]);
M_.block_structure.block(2).g1_sparse_colval = int32([]);
M_.block_structure.block(2).g1_sparse_colptr = int32([]);
M_.block_structure.block(3).g1_sparse_rowval = int32([1 ]);
M_.block_structure.block(3).g1_sparse_colval = int32([1 ]);
M_.block_structure.block(3).g1_sparse_colptr = int32([1 2 ]);
M_.block_structure.block(4).g1_sparse_rowval = int32([2 9 8 9 10 12 14 8 14 8 14 12 13 10 1 7 11 1 4 8 9 13 1 2 4 8 9 13 3 6 10 4 5 9 12 5 8 11 3 4 6 9 10 12 14 7 10 3 8 14 9 12 13 10 14 1 7 8 11 8 9 11 12 2 6 9 13 9 14 12 13 10 7 11 4 11 12 12 4 10 12 13 ]);
M_.block_structure.block(4).g1_sparse_colval = int32([4 4 5 6 6 6 6 7 7 8 8 9 9 10 11 11 11 15 15 15 15 15 16 16 16 16 16 16 17 17 17 18 18 18 18 19 19 19 20 20 20 20 20 20 20 21 21 22 22 22 23 23 23 24 24 25 25 25 25 26 26 26 26 27 27 27 27 28 28 37 37 38 39 39 40 40 40 41 42 42 42 42 ]);
M_.block_structure.block(4).g1_sparse_colptr = int32([1 1 1 1 3 4 8 10 12 14 15 18 18 18 18 23 29 32 36 39 46 48 51 54 56 60 64 68 70 70 70 70 70 70 70 70 70 72 73 75 78 79 83 ]);
M_.block_structure.block(5).g1_sparse_rowval = int32([]);
M_.block_structure.block(5).g1_sparse_colval = int32([]);
M_.block_structure.block(5).g1_sparse_colptr = int32([]);
M_.block_structure.variable_reordered = [ 17 19 18 8 7 16 6 5 11 12 10 3 4 2 9 15 13 1 14];
M_.block_structure.equation_reordered = [ 17 18 19 4 6 11 7 13 14 2 1 5 12 3 8 9 10 16 15];
M_.block_structure.incidence(1).lead_lag = -1;
M_.block_structure.incidence(1).sparse_IM = [
 1 5;
 1 10;
 1 12;
 2 2;
 3 2;
 4 2;
 5 6;
 5 11;
 6 6;
 8 3;
 8 11;
 9 3;
 10 10;
 10 11;
 10 12;
 12 4;
 12 11;
 17 17;
 18 19;
 19 18;
];
M_.block_structure.incidence(2).lead_lag = 0;
M_.block_structure.incidence(2).sparse_IM = [
 1 2;
 1 5;
 1 7;
 1 8;
 1 9;
 1 10;
 2 2;
 2 12;
 3 2;
 3 5;
 3 9;
 3 17;
 4 2;
 4 7;
 4 8;
 5 3;
 5 6;
 5 7;
 5 8;
 5 9;
 5 11;
 5 13;
 5 15;
 6 7;
 6 15;
 6 18;
 7 6;
 7 7;
 7 8;
 7 11;
 8 3;
 8 6;
 8 9;
 8 11;
 9 3;
 9 7;
 9 8;
 9 15;
 10 4;
 10 10;
 10 11;
 10 13;
 11 10;
 11 11;
 11 16;
 11 19;
 12 4;
 12 11;
 12 12;
 12 16;
 13 5;
 13 6;
 14 11;
 14 15;
 14 16;
 15 12;
 15 13;
 15 14;
 16 1;
 16 2;
 16 3;
 16 4;
 17 17;
 18 19;
 19 18;
];
M_.block_structure.incidence(3).lead_lag = 1;
M_.block_structure.incidence(3).sparse_IM = [
 2 2;
 3 2;
 3 9;
 7 9;
 7 13;
 8 3;
 8 9;
 8 13;
 8 15;
 9 3;
 9 13;
 12 4;
 12 13;
];
M_.block_structure.dyn_tmp_nbr = 5;
M_.state_var = [17 19 18 6 5 11 12 10 3 4 2 ];
M_.maximum_lag = 1;
M_.maximum_lead = 1;
M_.maximum_endo_lag = 1;
M_.maximum_endo_lead = 1;
oo_.steady_state = zeros(19, 1);
M_.maximum_exo_lag = 0;
M_.maximum_exo_lead = 0;
oo_.exo_steady_state = zeros(3, 1);
M_.params = NaN(39, 1);
M_.endo_trends = struct('deflator', cell(19, 1), 'log_deflator', cell(19, 1), 'growth_factor', cell(19, 1), 'log_growth_factor', cell(19, 1));
M_.NNZDerivatives = [101; -1; -1; ];
M_.dynamic_g1_sparse_rowval = int32([2 3 4 8 9 12 1 5 6 1 10 5 8 10 12 1 10 17 19 18 16 1 2 3 4 16 5 8 9 16 10 12 16 1 3 13 5 7 8 13 1 4 5 6 7 9 1 4 5 7 9 1 3 5 8 1 10 11 5 7 8 10 11 12 14 2 12 15 5 10 15 15 5 6 9 14 11 12 14 3 17 6 19 11 18 2 3 8 9 12 3 7 8 7 8 9 12 8 17 19 18 ]);
M_.dynamic_g1_sparse_colval = int32([2 2 2 3 3 4 5 6 6 10 10 11 11 11 11 12 12 17 18 19 20 21 21 21 21 21 22 22 22 22 23 23 23 24 24 24 25 25 25 25 26 26 26 26 26 26 27 27 27 27 27 28 28 28 28 29 29 29 30 30 30 30 30 30 30 31 31 31 32 32 32 33 34 34 34 34 35 35 35 36 36 37 37 38 38 40 40 41 41 42 47 47 47 51 51 51 51 53 58 59 60 ]);
M_.dynamic_g1_sparse_colptr = int32([1 1 4 6 7 8 10 10 10 10 12 16 18 18 18 18 18 19 20 21 22 27 31 34 37 41 47 52 56 59 66 69 72 73 77 80 82 84 86 86 88 90 91 91 91 91 91 94 94 94 94 98 98 99 99 99 99 99 100 101 102 ]);
M_.lhs = {
'C_h+D+q*(H_h-H_h(-1))'; 
'1'; 
'q'; 
'W'; 
'W*N+C_e+q*(H_e-H_e(-1))+R_l*L_e(-1)+phi_le/(2*L_ess)*(L_e-L_e(-1))^2'; 
'Y'; 
'L_e'; 
'q'; 
'Y*(1-alpha)'; 
'L_e+R_d(-1)*D(-1)+C_b+(L_e-L_e(-1))^2*phi_lb/(2*L_ess)'; 
'D'; 
'1-(1-kappa)+(L_e-L_e(-1))*phi_lb/L_ess'; 
'H_h+H_e'; 
'kappa'; 
'Sprd'; 
'C'; 
'log(A)'; 
'vareps'; 
'log(Z)'; 
};
M_.static_tmp_nbr = [4; 1; 0; 0; ];
M_.block_structure_stat.block(1).Simulation_Type = 3;
M_.block_structure_stat.block(1).endo_nbr = 1;
M_.block_structure_stat.block(1).mfs = 1;
M_.block_structure_stat.block(1).equation = [ 2];
M_.block_structure_stat.block(1).variable = [ 12];
M_.block_structure_stat.block(2).Simulation_Type = 3;
M_.block_structure_stat.block(2).endo_nbr = 1;
M_.block_structure_stat.block(2).mfs = 1;
M_.block_structure_stat.block(2).equation = [ 17];
M_.block_structure_stat.block(2).variable = [ 17];
M_.block_structure_stat.block(3).Simulation_Type = 3;
M_.block_structure_stat.block(3).endo_nbr = 1;
M_.block_structure_stat.block(3).mfs = 1;
M_.block_structure_stat.block(3).equation = [ 18];
M_.block_structure_stat.block(3).variable = [ 19];
M_.block_structure_stat.block(4).Simulation_Type = 3;
M_.block_structure_stat.block(4).endo_nbr = 1;
M_.block_structure_stat.block(4).mfs = 1;
M_.block_structure_stat.block(4).equation = [ 19];
M_.block_structure_stat.block(4).variable = [ 18];
M_.block_structure_stat.block(5).Simulation_Type = 6;
M_.block_structure_stat.block(5).endo_nbr = 11;
M_.block_structure_stat.block(5).mfs = 11;
M_.block_structure_stat.block(5).equation = [ 1 6 7 8 9 3 11 12 13 14 4];
M_.block_structure_stat.block(5).variable = [ 8 7 11 6 15 9 10 13 5 16 2];
M_.block_structure_stat.block(6).Simulation_Type = 3;
M_.block_structure_stat.block(6).endo_nbr = 1;
M_.block_structure_stat.block(6).mfs = 1;
M_.block_structure_stat.block(6).equation = [ 10];
M_.block_structure_stat.block(6).variable = [ 4];
M_.block_structure_stat.block(7).Simulation_Type = 3;
M_.block_structure_stat.block(7).endo_nbr = 1;
M_.block_structure_stat.block(7).mfs = 1;
M_.block_structure_stat.block(7).equation = [ 5];
M_.block_structure_stat.block(7).variable = [ 3];
M_.block_structure_stat.block(8).Simulation_Type = 1;
M_.block_structure_stat.block(8).endo_nbr = 2;
M_.block_structure_stat.block(8).mfs = 2;
M_.block_structure_stat.block(8).equation = [ 16 15];
M_.block_structure_stat.block(8).variable = [ 1 14];
M_.block_structure_stat.variable_reordered = [ 12 17 19 18 8 7 11 6 15 9 10 13 5 16 2 4 3 1 14];
M_.block_structure_stat.equation_reordered = [ 2 17 18 19 1 6 7 8 9 3 11 12 13 14 4 10 5 16 15];
M_.block_structure_stat.incidence.sparse_IM = [
 1 2;
 1 7;
 1 8;
 1 10;
 1 12;
 2 12;
 3 2;
 3 5;
 3 9;
 3 17;
 4 2;
 4 7;
 4 8;
 5 3;
 5 7;
 5 8;
 5 11;
 5 13;
 5 15;
 6 6;
 6 7;
 6 15;
 6 18;
 7 6;
 7 7;
 7 8;
 7 9;
 7 11;
 7 13;
 8 6;
 8 9;
 8 13;
 8 15;
 9 7;
 9 8;
 9 13;
 9 15;
 10 4;
 10 10;
 10 11;
 10 12;
 10 13;
 11 10;
 11 11;
 11 16;
 11 19;
 12 12;
 12 13;
 12 16;
 13 5;
 13 6;
 14 11;
 14 15;
 14 16;
 15 12;
 15 13;
 15 14;
 16 1;
 16 2;
 16 3;
 16 4;
 17 17;
 18 19;
 19 18;
];
M_.block_structure_stat.tmp_nbr = 5;
M_.block_structure_stat.block(1).g1_sparse_rowval = int32([1 ]);
M_.block_structure_stat.block(1).g1_sparse_colval = int32([1 ]);
M_.block_structure_stat.block(1).g1_sparse_colptr = int32([1 2 ]);
M_.block_structure_stat.block(2).g1_sparse_rowval = int32([1 ]);
M_.block_structure_stat.block(2).g1_sparse_colval = int32([1 ]);
M_.block_structure_stat.block(2).g1_sparse_colptr = int32([1 2 ]);
M_.block_structure_stat.block(3).g1_sparse_rowval = int32([1 ]);
M_.block_structure_stat.block(3).g1_sparse_colval = int32([1 ]);
M_.block_structure_stat.block(3).g1_sparse_colptr = int32([1 2 ]);
M_.block_structure_stat.block(4).g1_sparse_rowval = int32([1 ]);
M_.block_structure_stat.block(4).g1_sparse_colval = int32([1 ]);
M_.block_structure_stat.block(4).g1_sparse_colptr = int32([1 2 ]);
M_.block_structure_stat.block(5).g1_sparse_rowval = int32([1 3 5 11 1 2 3 5 11 3 7 10 2 3 4 9 2 4 5 10 3 4 6 1 7 3 4 5 8 6 9 7 8 10 1 6 11 ]);
M_.block_structure_stat.block(5).g1_sparse_colval = int32([1 1 1 1 2 2 2 2 2 3 3 3 4 4 4 4 5 5 5 5 6 6 6 7 7 8 8 8 8 9 9 10 10 10 11 11 11 ]);
M_.block_structure_stat.block(5).g1_sparse_colptr = int32([1 5 10 13 17 21 24 26 30 32 35 38 ]);
M_.block_structure_stat.block(6).g1_sparse_rowval = int32([1 ]);
M_.block_structure_stat.block(6).g1_sparse_colval = int32([1 ]);
M_.block_structure_stat.block(6).g1_sparse_colptr = int32([1 2 ]);
M_.block_structure_stat.block(7).g1_sparse_rowval = int32([1 ]);
M_.block_structure_stat.block(7).g1_sparse_colval = int32([1 ]);
M_.block_structure_stat.block(7).g1_sparse_colptr = int32([1 2 ]);
M_.block_structure_stat.block(8).g1_sparse_rowval = int32([]);
M_.block_structure_stat.block(8).g1_sparse_colval = int32([]);
M_.block_structure_stat.block(8).g1_sparse_colptr = int32([]);
M_.static_g1_sparse_rowval = int32([16 1 3 4 16 5 16 10 16 3 13 6 7 8 13 1 4 5 6 7 9 1 4 5 7 9 3 7 8 1 10 11 5 7 10 11 14 1 2 10 12 15 5 7 8 9 10 12 15 15 5 6 8 9 14 11 12 14 3 17 6 19 11 18 ]);
M_.static_g1_sparse_colval = int32([1 2 2 2 2 3 3 4 4 5 5 6 6 6 6 7 7 7 7 7 7 8 8 8 8 8 9 9 9 10 10 10 11 11 11 11 11 12 12 12 12 12 13 13 13 13 13 13 13 14 15 15 15 15 15 16 16 16 17 17 18 18 19 19 ]);
M_.static_g1_sparse_colptr = int32([1 2 6 8 10 12 16 22 27 30 33 38 43 50 51 56 59 61 63 65 ]);
M_.params(1) = 0.991;
beta_h = M_.params(1);
M_.params(2) = 0.94;
beta_e = M_.params(2);
M_.params(3) = 0.95;
beta_b = M_.params(3);
M_.params(39) = 0.7;
eta = M_.params(39);
M_.params(4) = 0.7;
m_e = M_.params(4);
M_.params(5) = 0.5;
m_n = M_.params(5);
M_.params(6) = 0.1;
j = M_.params(6);
M_.params(7) = 2;
tau = M_.params(7);
M_.params(8) = 0.1;
alpha = M_.params(8);
M_.params(9) = 0.8;
rho_a = M_.params(9);
M_.params(10) = 0.8;
rho_z = M_.params(10);
M_.params(11) = 0.9;
rho_eps = M_.params(11);
M_.params(32) = 0.3;
Y_ss = M_.params(32);
M_.params(34) = 1;
A_ss = M_.params(34);
M_.params(35) = 1;
Z_ss = M_.params(35);
M_.params(36) = 0;
vareps_ss = M_.params(36);
M_.params(37) = 0.05;
phi_le = M_.params(37);
M_.params(38) = 0.05;
phi_lb = M_.params(38);
M_.params(33) = 0.08;
kappa_ss = M_.params(33);
M_.params(12) = (-0.5);
chi_x = M_.params(12);
M_.params(13) = (-2.5);
chi_y = M_.params(13);
M_.params(14) = (-0.5);
chi_l = M_.params(14);
M_.params(33) = 0.105;
kappa_ss = M_.params(33);
M_.params(12) = (-0.5);
chi_x = M_.params(12);
M_.params(13) = (-2.5);
chi_y = M_.params(13);
M_.params(14) = (-0.5);
chi_l = M_.params(14);
M_.params(33) = 0.105;
kappa_ss = M_.params(33);
M_.params(12) = 0.5;
chi_x = M_.params(12);
M_.params(13) = 2.5;
chi_y = M_.params(13);
M_.params(14) = 0.5;
chi_l = M_.params(14);
M_.params(29) = 1/M_.params(1);
R_dss = M_.params(29);
M_.params(30) = 1/M_.params(3)-(1-M_.params(33))*(1/M_.params(3)-1/M_.params(1));
R_lss = M_.params(30);
M_.params(31) = M_.params(30)-M_.params(29);
Sprd_ss = M_.params(31);
M_.params(15) = 1-M_.params(2)-M_.params(4)*(1/M_.params(30)-M_.params(2));
Omega_1 = M_.params(15);
M_.params(16) = (1-M_.params(8))/(1+M_.params(5)*(1-M_.params(30)*M_.params(2)));
Omega_2 = M_.params(16);
M_.params(17) = 1+(1-M_.params(33))*(M_.params(29)-1)*(M_.params(4)*M_.params(2)*M_.params(8)*1/(M_.params(30)*M_.params(15)*M_.params(16))-M_.params(5));
Omega_3 = M_.params(17);
M_.params(23) = M_.params(2)*M_.params(8)*(1-M_.params(1))/(M_.params(2)*M_.params(8)*(1-M_.params(1))+M_.params(16)*M_.params(15)*M_.params(6)*M_.params(17));
H_ess = M_.params(23);
M_.params(22) = 1-M_.params(23);
H_hss = M_.params(22);
M_.params(26) = M_.params(2)*M_.params(8)*M_.params(32)/(M_.params(15)*M_.params(23));
q_ss = M_.params(26);
M_.params(28) = M_.params(23)*M_.params(4)*1/M_.params(30)*M_.params(26)-M_.params(32)*M_.params(5)*M_.params(16);
L_ess = M_.params(28);
M_.params(27) = (1-M_.params(33))*M_.params(28);
D_ss = M_.params(27);
M_.params(21) = (1-M_.params(29))*M_.params(27)+M_.params(28)*(M_.params(30)-1);
C_bss = M_.params(21);
M_.params(24) = 1/(1+M_.params(17)*M_.params(7));
N_ss = M_.params(24);
M_.params(25) = M_.params(16)*M_.params(32)/M_.params(24);
W_ss = M_.params(25);
M_.params(19) = M_.params(24)*M_.params(25)+(M_.params(29)-1)*M_.params(27);
C_hss = M_.params(19);
M_.params(20) = oo_.steady_state(15)+M_.params(28)*(1-M_.params(30))-M_.params(24)*M_.params(25);
C_ess = M_.params(20);
M_.params(18) = M_.params(19)+M_.params(20)+M_.params(21);
C_ss = M_.params(18);
%
% INITVAL instructions
%
options_.initval_file = false;
oo_.steady_state(1) = M_.params(18);
oo_.steady_state(2) = M_.params(19);
oo_.steady_state(3) = M_.params(20);
oo_.steady_state(4) = M_.params(21);
oo_.steady_state(5) = M_.params(22);
oo_.steady_state(6) = M_.params(23);
oo_.steady_state(7) = M_.params(24);
oo_.steady_state(8) = M_.params(25);
oo_.steady_state(9) = M_.params(26);
oo_.steady_state(10) = M_.params(27);
oo_.steady_state(11) = M_.params(28);
oo_.steady_state(12) = M_.params(29);
oo_.steady_state(13) = M_.params(30);
oo_.steady_state(14) = M_.params(31);
oo_.steady_state(15) = M_.params(32);
oo_.steady_state(16) = M_.params(33);
oo_.steady_state(17) = M_.params(34);
oo_.steady_state(18) = M_.params(35);
oo_.steady_state(19) = M_.params(36);
if M_.exo_nbr > 0
	oo_.exo_simul = ones(M_.maximum_lag,1)*oo_.exo_steady_state';
end
if M_.exo_det_nbr > 0
	oo_.exo_det_simul = ones(M_.maximum_lag,1)*oo_.exo_det_steady_state';
end
steady;
oo_.dr.eigval = check(M_,options_,oo_);
%
% SHOCKS instructions
%
M_.exo_det_length = 0;
M_.Sigma_e(2, 2) = (0.01)^2;
options_.irf = 20;
options_.nograph = true;
options_.order = 1;
var_list_ = {};
[info, oo_, options_, M_] = stoch_simul(M_, options_, oo_, var_list_);
m1.Y_Basel_II = Y_ups_z;
save('mod1_Basel_II_ups_z.mat','-struct','m1')
m1.Y_Basel_II_high = Y_ups_z;
save('mod1_Basel_II_high_ups_z.mat','-struct','m1')
m1.Y_Basel_III = Y_ups_z;
save('mod1_Basel_III_ups_z.mat','-struct','m1')
m1.C_Basel_II = C_ups_z;
save('mod1_Basel_II_ups_z.mat','-struct','m1')
m1.C_Basel_II_high = C_ups_z;
save('mod1_Basel_II_high_ups_z.mat','-struct','m1')
m1.C_Basel_III = C_ups_z;
save('mod1_Basel_III_ups_z.mat','-struct','m1')
m1.C_h_Basel_II = C_h_ups_z;
save('mod1_Basel_II_ups_z.mat','-struct','m1')
m1.C_h_Basel_II_high = C_h_ups_z;
save('mod1_Basel_II_high_ups_z.mat','-struct','m1')
m1.C_h_Basel_III = C_h_ups_z;
save('mod1_Basel_III_ups_z.mat','-struct','m1')
m1.C_e_Basel_II = C_e_ups_z;
save('mod1_Basel_II_ups_z.mat','-struct','m1')
m1.C_e_Basel_II_high = C_e_ups_z;
save('mod1_Basel_II_high_ups_z.mat','-struct','m1')
m1.C_e_Basel_III = C_e_ups_z;
save('mod1_Basel_III_ups_z.mat','-struct','m1')
m1.C_b_Basel_II = C_b_ups_z;
save('mod1_Basel_II_ups_z.mat','-struct','m1')
m1.C_b_Basel_II_high = C_b_ups_z;
save('mod1_Basel_II_high_ups_z.mat','-struct','m1')
m1.C_b_Basel_III = C_b_ups_z;
save('mod1_Basel_III_ups_z.mat','-struct','m1')
m1.H_h_Basel_II = H_h_ups_z;
save('mod1_Basel_II_ups_z.mat','-struct','m1')
m1.H_h_Basel_II_high = H_h_ups_z;
save('mod1_Basel_II_high_ups_z.mat','-struct','m1')
m1.H_h_Basel_III = H_h_ups_z;
save('mod1_Basel_III_ups_z.mat','-struct','m1')
m1.H_e_Basel_II = H_e_ups_z;
save('mod1_Basel_II_ups_z.mat','-struct','m1')
m1.H_e_Basel_II_high = H_e_ups_z;
save('mod1_Basel_II_high_ups_z.mat','-struct','m1')
m1.H_e_Basel_III = H_e_ups_z;
save('mod1_Basel_III_ups_z.mat','-struct','m1')
m1.N_Basel_II = N_ups_z;
save('mod1_Basel_II_ups_z.mat','-struct','m1')
m1.N_Basel_II_high = N_ups_z;
save('mod1_Basel_II_high_ups_z.mat','-struct','m1')
m1.N_Basel_III = N_ups_z;
save('mod1_Basel_III_ups_z.mat','-struct','m1')
m1.W_Basel_II = W_ups_z;
save('mod1_Basel_II_ups_z.mat','-struct','m1')
m1.W_Basel_II_high = W_ups_z;
save('mod1_Basel_II_high_ups_z.mat','-struct','m1')
m1.W_Basel_III = W_ups_z;
save('mod1_Basel_III_ups_z.mat','-struct','m1')
m1.q_Basel_II = q_ups_z;
save('mod1_Basel_II_ups_z.mat','-struct','m1')
m1.q_Basel_II_high = q_ups_z;
save('mod1_Basel_II_high_ups_z.mat','-struct','m1')
m1.q_Basel_III = q_ups_z;
save('mod1_Basel_III_ups_z.mat','-struct','m1')
m1.D_Basel_II = D_ups_z;
save('mod1_Basel_II_ups_z.mat','-struct','m1')
m1.D_Basel_II_high = D_ups_z;
save('mod1_Basel_II_high_ups_z.mat','-struct','m1')
m1.D_Basel_III = D_ups_z;
save('mod1_Basel_III_ups_z.mat','-struct','m1')
m1.L_e_Basel_II = L_e_ups_z;
save('mod1_Basel_II_ups_z.mat','-struct','m1')
m1.L_e_Basel_II_high = L_e_ups_z;
save('mod1_Basel_II_high_ups_z.mat','-struct','m1')
m1.L_e_Basel_III = L_e_ups_z;
save('mod1_Basel_III_ups_z.mat','-struct','m1')
m1.R_d_Basel_II = R_d_ups_z;
save('mod1_Basel_II_ups_z.mat','-struct','m1')
m1.R_d_Basel_II_high = R_d_ups_z;
save('mod1_Basel_II_high_ups_z.mat','-struct','m1')
m1.R_d_Basel_III = R_d_ups_z;
save('mod1_Basel_III_ups_z.mat','-struct','m1')
m1.R_l_Basel_II = R_l_ups_z;
save('mod1_Basel_II_ups_z.mat','-struct','m1')
m1.R_l_Basel_II_high = R_l_ups_z;
save('mod1_Basel_II_high_ups_z.mat','-struct','m1')
m1.R_l_Basel_III = R_l_ups_z;
save('mod1_Basel_III_ups_z.mat','-struct','m1')
m1.Sprd_Basel_II = Sprd_ups_z;
save('mod1_Basel_II_ups_z.mat','-struct','m1')
m1.Sprd_Basel_II_high = Sprd_ups_z;
save('mod1_Basel_II_high_ups_z.mat','-struct','m1')
m1.Sprd_Basel_III = Sprd_ups_z;
save('mod1_Basel_III_ups_z.mat','-struct','m1')
m1.kappa_Basel_II = kappa_ups_z;
save('mod1_Basel_II_ups_z.mat','-struct','m1')
m1.kappa_Basel_II_high = kappa_ups_z;
save('mod1_Basel_II_high_ups_z.mat','-struct','m1')
m1.kappa_Basel_III = kappa_ups_z;
save('mod1_Basel_III_ups_z.mat','-struct','m1')
load('mod1_Basel_II_ups_z.mat')
load('mod1_Basel_II_high_ups_z.mat')
load('mod1_Basel_III_ups_z.mat')
fig1 = figure;
subplot(4,3,1); 
plot(Y_Basel_II,'k','Marker','*','LineWidth',0.4,'MarkerSize',1.5); hold on; 
plot(Y_Basel_II_high,'--b','LineWidth',0.7); hold on;
plot(Y_Basel_III,'r','LineWidth',0.7); hold on;
title('Output','FontSize',5);
set(gca,'FontSize',5);
subplot(4,3,2); 
plot(C_h_Basel_II,'k','Marker','*','LineWidth',0.4,'MarkerSize',1.5); hold on;
plot(C_h_Basel_II_high,'--b','LineWidth',0.7); hold on;          
plot(C_h_Basel_III,'r','LineWidth',0.7); hold on;
title('Consumption: Households','FontSize',5);
set(gca,'FontSize',5);
subplot(4,3,3); 
plot(C_e_Basel_II,'k','Marker','*','LineWidth',0.4,'MarkerSize',1.5); hold on; 
plot(C_e_Basel_II_high,'--b','LineWidth',0.7); hold on;          
plot(C_e_Basel_III,'r','LineWidth',0.7); hold on;
title('Consumption: Entrep','FontSize',5);
set(gca,'FontSize',5);
subplot(4,3,4); 
plot(C_b_Basel_II,'k','Marker','*','LineWidth',0.4,'MarkerSize',1.5); hold on;
plot(C_b_Basel_II_high,'--b','LineWidth',0.7); hold on;          
plot(C_b_Basel_III,'r','LineWidth',0.7); hold on;
title('Consumption: Bankers','FontSize',5);
set(gca,'FontSize',5);
subplot(4,3,5); 
plot(N_Basel_II,'k','Marker','*','LineWidth',0.4,'MarkerSize',1.5); hold on; 
plot(N_Basel_II_high,'--b','LineWidth',0.7); hold on;          
plot(N_Basel_III,'r','LineWidth',0.7); hold on;
title('Labour','FontSize',5);
set(gca,'FontSize',5);
subplot(4,3,6); 
plot(q_Basel_II,'k','Marker','*','LineWidth',0.4,'MarkerSize',1.5); hold on;
plot(q_Basel_II_high,'--b','LineWidth',0.7); hold on;
plot(q_Basel_III,'r','LineWidth',0.7); hold on;
title('House Prices','FontSize',5);
set(gca,'FontSize',5);
subplot(4,3,7); 
plot(H_h_Basel_II,'k','Marker','*','LineWidth',0.4,'MarkerSize',1.5); hold on;
plot(H_h_Basel_II_high,'--b','LineWidth',0.7); hold on; 
plot(H_h_Basel_III,'r','LineWidth',0.7); hold on;
title('Housing: Households','FontSize',5);
set(gca,'FontSize',5);
subplot(4,3,8); 
plot(H_e_Basel_II,'k','Marker','*','LineWidth',0.4,'MarkerSize',1.5); hold on; 
plot(H_e_Basel_II_high,'--b','LineWidth',0.7); hold on; 
plot(H_e_Basel_III,'r','LineWidth',0.7); hold on;
title('Housing: Entrep','FontSize',5);
set(gca,'FontSize',5);
subplot(4,3,9); 
plot(D_Basel_II,'k','Marker','*','LineWidth',0.4,'MarkerSize',1.5); hold on;
plot(D_Basel_II_high,'--b','LineWidth',0.7); hold on;
plot(D_Basel_III,'r','LineWidth',0.7); hold on;
title('Deposits','FontSize',5);
set(gca,'FontSize',5);
subplot(4,3,10); 
plot(L_e_Basel_II,'k','Marker','*','LineWidth',0.4,'MarkerSize',1.5); hold on;
plot(L_e_Basel_II_high,'--b','LineWidth',0.7); hold on;
plot(L_e_Basel_III,'r','LineWidth',0.7); hold on;
title('Loans to Entrep','FontSize',5);
set(gca,'FontSize',5);
subplot(4,3,11); 
plot(Sprd_Basel_II,'k','Marker','*','LineWidth',0.4,'MarkerSize',1.5); hold on;
plot(Sprd_Basel_II_high,'--b','LineWidth',0.7); hold on;
plot(Sprd_Basel_III,'r','LineWidth',0.7); hold on;
title('Spread','FontSize',5);
set(gca,'FontSize',5);  
subplot(4,3,12); 
plot(kappa_Basel_II,'k','Marker','*','LineWidth',0.4,'MarkerSize',1.5); hold on;
plot(kappa_Basel_II_high,'--b','LineWidth',0.7); hold on;
plot(kappa_Basel_III,'r','LineWidth',0.7); hold on;
title('Capital Requirement','FontSize',5);
set(gca,'FontSize',5);
set(fig1,'Units','Inches');
pos = get(fig1,'Position');
set(fig1,'PaperPositionMode','Auto','PaperUnits','Inches','PaperSize',[pos(3), pos(4)])
print(fig1,'IRFs_Base_z','-dpdf','-r400')


oo_.time = toc(tic0);
disp(['Total computing time : ' dynsec2hms(oo_.time) ]);
if ~exist([M_.dname filesep 'Output'],'dir')
    mkdir(M_.dname,'Output');
end
save([M_.dname filesep 'Output' filesep 'SamNet_results.mat'], 'oo_', 'M_', 'options_');
if exist('estim_params_', 'var') == 1
  save([M_.dname filesep 'Output' filesep 'SamNet_results.mat'], 'estim_params_', '-append');
end
if exist('bayestopt_', 'var') == 1
  save([M_.dname filesep 'Output' filesep 'SamNet_results.mat'], 'bayestopt_', '-append');
end
if exist('dataset_', 'var') == 1
  save([M_.dname filesep 'Output' filesep 'SamNet_results.mat'], 'dataset_', '-append');
end
if exist('estimation_info', 'var') == 1
  save([M_.dname filesep 'Output' filesep 'SamNet_results.mat'], 'estimation_info', '-append');
end
if exist('dataset_info', 'var') == 1
  save([M_.dname filesep 'Output' filesep 'SamNet_results.mat'], 'dataset_info', '-append');
end
if exist('oo_recursive_', 'var') == 1
  save([M_.dname filesep 'Output' filesep 'SamNet_results.mat'], 'oo_recursive_', '-append');
end
if exist('options_mom_', 'var') == 1
  save([M_.dname filesep 'Output' filesep 'SamNet_results.mat'], 'options_mom_', '-append');
end
if ~isempty(lastwarn)
  disp('Note: warning(s) encountered in MATLAB/Octave code')
end
