
%close all;

% Only plot IRFs to the technology shock
shock_label = 'epsilon_z';
shock_title = 'Technology Shock';

vars_to_plot = {'y', 'ygap', 'r', 'rn', 'int', 'pii', 'p', 'xi_z'}; % 'mreal', 
plot_titles = {'Output', 'Output gap', 'Real interest rate', ...
               'Natural interest rate', 'Nominal interest rate', 'Inflation', ...
               'Price level', 'Technology shock'};  % 'Real money supply', 

scale_400 = ismember(vars_to_plot, {'r', 'rn', 'int', 'pii'}); % Annualize selected variables
n_vars = length(vars_to_plot);

figure('Name', ['IRFs to ', shock_title]);
for v = 1:n_vars
    subplot(3, 3, v);
    varname = vars_to_plot{v};
    series = eval(['oo_.irfs.', varname, '_', shock_label]);
    series = series(:);  % Ensure column vector

    if scale_400(v)
        series = 400 * series;
    else
        series = 100 * series;
    end

    plot(0:length(series), [0; series], 'b-', 'LineWidth', 1.5); % Add initial zero
    title(plot_titles{v});
    xlabel('Quarters');
    grid on;
end
