% Fresh corrected ten-observable flex-price estimation; never loads legacy draws.
run_dir = fileparts(mfilename('fullpath'));
cd(run_dir);
addpath('/Applications/Dynare/6.1-arm64/matlab');
set(0, 'DefaultFigureVisible', 'off');
maxNumCompThreads(1); % Avoid multithreaded BLAS overhead for small model matrices.
diary('GHW2026_SOEnooil_SWshocks_flex_run.log');
try
    dynare GHW2026_SOEnooil_SWshocks_flex.mod noclearall
    save('GHW2026_SOEnooil_SWshocks_flex_completed.mat', 'M_', 'oo_', 'options_', '-v7.3');
    diary off;
catch run_error
    fprintf(2, '%s\n', getReport(run_error, 'extended'));
    diary off;
    rethrow(run_error);
end
