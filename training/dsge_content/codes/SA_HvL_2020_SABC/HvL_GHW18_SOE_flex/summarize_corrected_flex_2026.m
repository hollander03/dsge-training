function summarize_corrected_flex_2026(reference7_results)
% Summarize completed corrected estimation. Optional: saved seven-observable results.
% No estimation is performed here. Never treats a mode file as posterior draws.
if nargin < 1, reference7_results = ''; end
base = fileparts(mfilename('fullpath'));
name = 'GHW2026_SOEnooil_SWshocks_flex';
results_file = fullfile(base,name,'Output',[name '_results.mat']);
assert(exist(results_file,'file')==2,'Corrected Dynare results do not exist yet.');
s = load(results_file);
assert(isfield(s.oo_,'posterior_mean'),'Posterior means not available: MCMC/postprocessing not complete.');
legacy = load(fullfile(base,'archive','HvL_GHW18nooil_SWshocks_rep_mode.mat'));
mode = load(fullfile(base,name,'Output',[name '_mode.mat']));
old7 = load(fullfile(base,'..','..','SA_GHW_2019_SOEoil','archive','GHW2018b_SOEoil_mode.mat'));
rows = cell(numel(mode.parameter_names),7);
for j = 1:numel(mode.parameter_names)
    nm = strtrim(mode.parameter_names{j});
    old_idx = find(strcmp(legacy.parameter_names,nm),1);
    seven_idx = find(strcmp(old7.parameter_names,nm),1);
    old_value=NaN; seven_value=NaN;
    if ~isempty(old_idx), old_value=legacy.xparam1(old_idx); end
    if ~isempty(seven_idx), seven_value=old7.xparam1(seven_idx); end
    if any(strcmp(cellstr(s.M_.exo_names),nm)), group='shocks_std'; else, group='parameters'; end
    post_mean=s.oo_.posterior_mean.(group).(nm);
    low=s.oo_.posterior_hpdinf.(group).(nm);
    high=s.oo_.posterior_hpdsup.(group).(nm);
    rows(j,:)={nm,old_value,mode.xparam1(j),post_mean,low,high,seven_value};
end
out=fullfile(base,'comparison_2026');
T=cell2table(rows,'VariableNames',{'name','legacy10_mode','corrected10_mode', ...
    'corrected10_posterior_mean','corrected10_hpd_lower','corrected10_hpd_upper','archived7_mode'});
writetable(T,fullfile(out,'parameter_comparison.csv'));
% Export available Bayesian mean IRFs; these are posterior means, not mode IRFs.
assert(isfield(s.oo_,'PosteriorIRF') && isfield(s.oo_.PosteriorIRF,'dsge'), ...
    'Bayesian IRFs not yet available.');
mean_irfs=s.oo_.PosteriorIRF.dsge.Mean;
keys=fieldnames(mean_irfs); rr={};
for j=1:numel(keys)
    path=mean_irfs.(keys{j});
    for t=1:numel(path), rr(end+1,:)={keys{j},t,path(t)}; end %#ok<AGROW>
end
writetable(cell2table(rr,'VariableNames',{'variable_shock','quarter','posterior_mean'}), ...
    fullfile(out,'corrected10_bayesian_irfs.csv'));
if ~isempty(reference7_results)
    seven=load(reference7_results);
    assert(isfield(seven,'oo_') && isfield(seven.oo_,'posterior_mean'), ...
        'Reference file must contain posterior summaries, not only a mode.');
    % Preserve the reference path, so any later comparison is attributable.
    fid=fopen(fullfile(out,'reference7_results_path.txt'),'w');
    fprintf(fid,'%s\n',reference7_results); fclose(fid);
end
fprintf('Wrote corrected posterior and IRF tables to %s\n',out);
end
