% Compare government-consumption SHOCK persistence at the inherited calibration.
% Run from this folder with Dynare on the MATLAB path.
% rhog (policy-instrument smoothing) is held fixed; rhoepsG is varied.
% Baseline oo_, M_ and options_ are restored, including if a comparison fails.
dynare real_fiscal noclearall nograph;
baseline_M = M_; baseline_oo = oo_; baseline_options = options_;
comparison_persistence = [0.5 0.9];
comparison_irfs = cell(size(comparison_persistence));
try
    for comparison_index=1:numel(comparison_persistence)
        M_=baseline_M; oo_=baseline_oo; options_=baseline_options;
        set_param_value('rhoepsG',comparison_persistence(comparison_index));
        [comparison_info,oo_,options_,M_] = stoch_simul(M_,options_,oo_,{'y';'c';'i';'g';'b'});
        assert(comparison_info(1)==0,'The comparison has no valid solution.');
        comparison_irfs{comparison_index}=oo_.irfs;
    end
catch comparison_error
    M_=baseline_M; oo_=baseline_oo; options_=baseline_options;
    rethrow(comparison_error);
end
M_=baseline_M; oo_=baseline_oo; options_=baseline_options;
comparison_figure=figure('Color','w');
tiledlayout(2,3,'TileSpacing','compact','Padding','compact');
comparison_variables={'y','c','i','g','b'};
for comparison_variable=1:numel(comparison_variables)
    nexttile; hold on;
    for comparison_index=1:numel(comparison_persistence)
        comparison_response=comparison_irfs{comparison_index}.([comparison_variables{comparison_variable} '_etag']);
        plot(0:numel(comparison_response)-1,100*comparison_response,'LineWidth',1.4);
    end
    yline(0,':'); grid on; title(comparison_variables{comparison_variable},'Interpreter','none');
    xlabel('Quarters after shock'); ylabel('100 x model deviation');
end
legend('rhoepsG = 0.5','rhoepsG = 0.9','Location','best');
sgtitle('Government-consumption shock persistence; instrument smoothing fixed');
exportgraphics(comparison_figure,'real_fiscal_persistence.png','Resolution',150);
save('real_fiscal_persistence_comparison.mat','comparison_persistence','comparison_irfs');
