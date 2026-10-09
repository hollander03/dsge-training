clear
%close all
% clc
load('SAFiscal_NTDSGE_sim2_results.mat')

%% PRINT ALL PARAMETER VALUES

paramNames = M_.param_names;
paramValues = M_.params;
% Display variable names and values
for i = 1:length(paramNames)
    fprintf('%s: %f\n', paramNames(i, :), paramValues(i));
end

%% PRINT ALL STEADY STATE VALUES FOR VARIABLES
% 
% variableNames = M_.endo_names;
% variableValuesSS = oo_.steady_state;
% % Display variable names and values
% for i = 1:length(variableNames)
%     fprintf('%s: %f\n', variableNames(i, :), variableValuesSS(i));
% end