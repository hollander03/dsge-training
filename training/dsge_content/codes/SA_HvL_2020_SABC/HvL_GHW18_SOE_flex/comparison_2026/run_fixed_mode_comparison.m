% Pure equation effect: same archived legacy mode and one-SD shocks in both runs.
comparison_dir = fileparts(mfilename('fullpath'));
cd(comparison_dir);
addpath('/Applications/Dynare/6.1-arm64/matlab');
set(0,'DefaultFigureVisible','off');
dynare fixed_mode_legacy.mod noclearall
dynare fixed_mode_corrected.mod noclearall
old = load('fixed_mode_legacy_irfs.mat');
new = load('fixed_mode_corrected_irfs.mat');
keys = fieldnames(old.oo_.irfs);
rows = cell(numel(keys),6);
for j=1:numel(keys)
    nm = keys{j}; a = old.oo_.irfs.(nm)(:); b = new.oo_.irfs.(nm)(:);
    [~,ia] = max(abs(a)); [~,ib] = max(abs(b));
    rows(j,:) = {nm,a(1),b(1),a(ia),b(ib),max(abs(b-a))};
end
T=cell2table(rows,'VariableNames',{'variable_shock','legacy_impact','corrected_impact', ...
    'legacy_signed_peak','corrected_signed_peak','max_abs_difference'});
writetable(T,'fixed_legacy_mode_irf_comparison.csv');
% One chart of the foreign productivity shock; both curves use the SAME parameter vector.
f=figure('Visible','off'); tiledlayout(2,3);
vars={'y_star','pi_star','int_b_star','y','pi_tot','int_b'};
for j=1:numel(vars)
    nexttile; key=[vars{j} '_epsil_a_star'];
    plot(1:20,old.oo_.irfs.(key),'-',1:20,new.oo_.irfs.(key),'--');
    title(vars{j},'Interpreter','none'); xlabel('Quarter'); grid on;
end
legend('Legacy equation','Corrected equation');
sgtitle('Foreign productivity: fixed legacy mode, one-SD shock');
exportgraphics(f,'fixed_legacy_mode_foreign_tfp_irfs.png','Resolution',180);
close(f);
