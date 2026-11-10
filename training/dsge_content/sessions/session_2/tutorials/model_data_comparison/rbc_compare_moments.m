% Compare data and RBC sample moments (final Hansen_basicrbc_slides table).
% Run dynare basicrbc first, then run this script; or use its saved results.
% Works in base MATLAB / GNU Octave; no Econometrics Toolbox required.
% Model variables are already log deviations: DO NOT take their logs again.
% Both data and model must use quarterly, two-sided HP cycles, lambda=1600.
% Absolute SD means std(100*cycle), NOT a mean absolute deviation.

%% Settings and DATA FILE PLACEHOLDERS -- edit this section
comparison_dir = fileparts(mfilename('fullpath'));
model_results_file = ''; % Optional full path to basicrbc_results.mat.
hp_lambda = 1600;
model_burn_in = 0; % Extra initial simulated observations to discard.
% oo_.endo_simul already excludes Dynare's initialization/presample columns.
% For a longer simulation, rerun stoch_simul with more periods before use.

variable_names = {'Output'; 'Consumption'; 'Investment'; 'Hours'; 'Productivity (TFP)'};
model_names = {'y'; 'c'; 'v'; 'n'; 'z'};
% Here productivity means TFP (z), not labour productivity (y-n).
% EDIT THESE FIVE ROWS to include other data. Files go in the data folder.
% CSV format: date in column 1 (yyyy-mm-dd), numeric levels in column 2,
% one header row; quarterly dates must match the output observation dates.
% Use positive REAL LEVELS, not growth rates or already-filtered cycles.
% Missing entries may be NaN. Do not mix countries or per-capita definitions.
data_files = {'sa_rgdp.csv'; ''; ''; ''; ''}; % y, c, v, n, z
% To use US output instead, replace sa_rgdp.csv with us_rgdp_pc.csv.
% Example after adding matching consumption data: data_files{2} = 'sa_consumption.csv';
data_label = 'South Africa'; % Edit when switching country.
sample_start = datenum(1993,1,1);
sample_end = datenum(2024,10,1);
data_dir = fullfile(comparison_dir, 'data');

%% Read available data and align all supplied series to a common sample
assert(numel(data_files) == 5 && ~isempty(data_files{1}), 'Supply an output CSV.');
data_dates = cell(5,1);
data_levels = cell(5,1);
for j = 1:5
    if isempty(data_files{j}), continue; end
    fid = fopen(fullfile(data_dir, data_files{j}), 'r');
    assert(fid >= 0, ['Cannot open data file: ' data_files{j}]);
    raw = textscan(fid, '%s%f', 'Delimiter', ',', 'HeaderLines', 1);
    fclose(fid);
    data_dates{j} = datenum(raw{1}, 'yyyy-mm-dd');
    data_levels{j} = raw{2};
    assert(numel(unique(data_dates{j})) == numel(data_dates{j}), ...
        'Each data file must have unique dates.');
end
common_dates = sort(data_dates{1});
common_dates = common_dates(common_dates >= sample_start & common_dates <= sample_end);
levels = NaN(numel(common_dates),5);
available = ~cellfun(@isempty, data_files);
for j = 1:5
    if ~available(j), continue; end
    [found, idx] = ismember(common_dates, data_dates{j});
    levels(found,j) = data_levels{j}(idx(found));
end
keep = all(isfinite(levels(:,available)) & levels(:,available) > 0, 2);
common_dates = common_dates(keep);
levels = levels(keep,:);
assert(numel(common_dates) >= 8, 'Need at least 8 common positive quarterly observations.');
[year_q, month_q, ~] = datevec(common_dates);
quarter_index = 4*year_q + floor((month_q-1)/3);
assert(all(diff(quarter_index) == 1), ...
    'Common data must be consecutive quarters: check missing observations/dates.');
Td = numel(common_dates);
Dd = diff(speye(Td),2);
log_levels = log(levels(:,available));
data_cycles = NaN(Td,5);
data_cycles(:,available) = log_levels - ...
    (speye(Td) + hp_lambda*(Dd'*Dd)) \ log_levels;
data_sd_pct = 100*std(data_cycles,0,1).';
data_corr_y = NaN(5,1);
for j = 1:5
    if available(j) && data_sd_pct(j) > 0 && data_sd_pct(1) > 0
        R = corrcoef(data_cycles(:,j), data_cycles(:,1));
        data_corr_y(j) = R(1,2);
    end
end

%% Obtain the current Dynare simulation or load saved results
if ~isempty(model_results_file)
    model_source = load(model_results_file, 'M_', 'oo_');
elseif exist('M_', 'var') && exist('oo_', 'var')
    model_source = struct('M_', M_, 'oo_', oo_);
else
    % Desktop layout first, then the repository layout.
    candidates = {fullfile(comparison_dir, 'basicrbc', 'Output', 'basicrbc_results.mat'), ...
        fullfile(comparison_dir, '..', '..', 'code', 'basic_rbc', ...
        'basicrbc', 'Output', 'basicrbc_results.mat')};
    model_results_file = '';
    for j = 1:numel(candidates)
        if exist(candidates{j}, 'file') == 2
            model_results_file = candidates{j};
            break
        end
    end
    assert(~isempty(model_results_file), ...
        'Run dynare basicrbc first, or set model_results_file to its results MAT file.');
    model_source = load(model_results_file, 'M_', 'oo_');
end
assert(isfield(model_source, 'M_') && isfield(model_source, 'oo_'), ...
    'Results must contain M_ and oo_.');
assert(isfield(model_source.oo_, 'endo_simul') && ...
    ~isempty(model_source.oo_.endo_simul), ...
    'No simulated series: rerun stoch_simul with periods greater than zero.');
endo_names = cellstr(model_source.M_.endo_names);
sim = model_source.oo_.endo_simul;
assert(size(sim,1) == numel(endo_names), 'Unexpected Dynare simulation dimensions.');
assert(isscalar(model_burn_in) && model_burn_in >= 0 && ...
    model_burn_in == floor(model_burn_in), 'model_burn_in must be a nonnegative integer.');
assert(size(sim,2) - model_burn_in >= 8, 'Need at least 8 retained simulated quarters.');
model_series = zeros(size(sim,2) - model_burn_in, numel(model_names));
for j = 1:numel(model_names)
    idx = find(strcmp(strtrim(endo_names), model_names{j}));
    assert(numel(idx) == 1, ['Missing or duplicate model variable: ' model_names{j}]);
    model_series(:,j) = sim(idx, model_burn_in+1:end).';
end
assert(all(isfinite(model_series(:))), 'Model simulation contains nonfinite values.');

%% Apply the same two-sided HP convention to every model variable
T = size(model_series,1);
D = diff(speye(T),2);
model_trend = (speye(T) + hp_lambda*(D'*D)) \ model_series;
model_cycles = model_series - model_trend;
model_sd_pct = 100*std(model_cycles,0,1).'; % Sample SD (N-1 denominator).
assert(model_sd_pct(1) > 0, 'Output cycle has zero variance.');
model_relative_sd = model_sd_pct / model_sd_pct(1);
model_corr_y = NaN(numel(model_names),1);
for j = 1:numel(model_names)
    if model_sd_pct(j) > 0
        R = corrcoef(model_cycles(:,j), model_cycles(:,1));
        model_corr_y(j) = R(1,2);
    end
end
assert(isequal(size(data_sd_pct),[5 1]) && isequal(size(data_corr_y),[5 1]), ...
    'Data placeholders must be 5-by-1 column vectors.');
assert(all(isnan(data_sd_pct) | (isfinite(data_sd_pct) & data_sd_pct >= 0)), ...
    'Data SDs must be nonnegative finite numbers or NaN.');
assert(all(isnan(data_corr_y) | (isfinite(data_corr_y) & abs(data_corr_y) <= 1)), ...
    'Data correlations must lie between -1 and 1, or be NaN.');
data_relative_sd = NaN(5,1);
if isfinite(data_sd_pct(1)) && data_sd_pct(1) > 0
    data_relative_sd = data_sd_pct / data_sd_pct(1);
end

%% Display comparison and retain a numeric matrix for later use
% Columns: data SD, model SD, data relative SD, model relative SD,
%          data correlation with output, model correlation with output.
comparison_moments = [data_sd_pct, model_sd_pct, data_relative_sd, ...
    model_relative_sd, data_corr_y, model_corr_y];
fprintf('\n%s\n', data_label);
fprintf('Data: %d quarters, %s to %s.\n', Td, datestr(common_dates(1), 'yyyy-mm-dd'), datestr(common_dates(end), 'yyyy-mm-dd'));
fprintf('Model: %d simulated quarters; two-sided HP, lambda=%g; burn-in=%d.\n', ...
    T, hp_lambda, model_burn_in);
fprintf('Sample moments of the current calibration/simulation (not theoretical moments).\n');
if isfield(model_source.M_, 'param_names')
    fprintf('Model parameters:\n');
    parameter_names = cellstr(model_source.M_.param_names);
    for j = 1:numel(parameter_names)
        fprintf('  %s = %.6g\n', strtrim(parameter_names{j}), model_source.M_.params(j));
    end
end
fprintf('\n%-20s %9s %9s %9s %9s %9s %9s\n', ...
    'Variable', 'SD data %', 'SD model%', 'Rel data', 'Rel model', 'Corr data', 'Corr model');
for j = 1:numel(variable_names)
    fprintf('%-20s %9.3f %9.3f %9.3f %9.3f %9.3f %9.3f\n', ...
        variable_names{j}, comparison_moments(j,:));
end
fprintf('\nNaN = data not supplied (or correlation undefined for a constant series).\n');
fprintf('Relative SD = SD(variable)/SD(output); correlation is contemporaneous.\n');
fprintf('Compare consistent real/per-capita definitions, quarterly samples and filters.\n');
fprintf('Model moments vary with calibration, simulation length and random seed.\n');
