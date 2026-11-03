function results = rbc_output_moments()
% Offline US/SA output moments; works in base MATLAB and GNU Octave.
% Two-sided HP is solved directly: (I + lambda*D''*D)*trend = log(output).
% This does not require readtable, datetime or an hpfilter package.
data_dir = fullfile(fileparts(mfilename('fullpath')), 'data');
files = {'us_rgdp_pc.csv','sa_rgdp.csv'};
countries = {'US','SA'};
results = struct();
for k=1:numel(files)
    fid=fopen(fullfile(data_dir,files{k}),'r');
    assert(fid>=0,['Cannot open ' files{k}]);
    raw=textscan(fid,'%s%f','Delimiter',',','HeaderLines',1);
    fclose(fid);
    dates=datenum(raw{1},'yyyy-mm-dd');
    keep=dates>=datenum(1993,1,1) & dates<=datenum(2024,10,1);
    dates=dates(keep); output=raw{2}(keep);
    assert(numel(output)==128 && all(isfinite(output)) && all(output>0), ...
        'Expected 128 positive quarterly observations from 1993Q1 to 2024Q4.');
    log_output=log(output);
    D=diff(speye(numel(output)),2);
    trend=(speye(numel(output))+1600*(D'*D))\log_output;
    cycle=log_output-trend;
    autocorrelation=corrcoef(cycle(2:end),cycle(1:end-1));
    results.(countries{k})=struct('dates',dates,'output',output, ...
        'log_output',log_output,'trend',trend,'cycle',cycle, ...
        'mean_cycle_pct',100*mean(cycle),'std_cycle_pct',100*std(cycle), ...
        'autocorrelation_1',autocorrelation(1,2));
    fprintf('%s, 1993Q1--2024Q4, N=%d: mean=%.6f%%, SD=%.4f%%, AR(1)=%.4f\n', ...
        countries{k},numel(cycle),100*mean(cycle),100*std(cycle),autocorrelation(1,2));
end
end
