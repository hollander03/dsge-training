function fig = plot_real_fiscal_irfs(shock)
% Plot one original one-standard-deviation fiscal shock after dynare real_fiscal.
% Example: plot_real_fiscal_irfs('etag'); export uses the current working folder.
if nargin < 1, shock = 'etag'; end
shock = char(shock);
allowed = {'etag','etaiG','etatr','etatauC','etatauN','etatauK'};
assert(ismember(shock,allowed),'Choose etag, etaiG, etatr, etatauC, etatauN or etatauK.');
results = evalin('base','oo_');
variables = {'y','c','i','N','g','iG','tr','b','by','r','rrp'};
labels = {'Output','Consumption','Private investment','Labour','Govt consumption', ...
    'Public investment','Transfers','Government debt','Debt/output (log)', ...
    'Risk-free rate','Risk-adjusted rate'};
fig = figure('Name',['Real fiscal model: ' shock],'Color','w','Position',[100 100 1400 900]);
tiledlayout(3,4,'TileSpacing','loose','Padding','loose');
for k=1:numel(variables)
    field = [variables{k} '_' shock];
    assert(isfield(results.irfs,field),['Missing IRF ' field '. Run dynare real_fiscal first.']);
    response = results.irfs.(field);
    nexttile; plot(0:numel(response)-1,100*response,'LineWidth',1.4);
    yline(0,':'); grid on; title(labels{k},'FontSize',11); xlabel('Quarters');
    ylabel('100 x model deviation');
end
sgtitle(['Real fiscal DSGE: ' shock ' (original shock size)'],'Interpreter','none');
exportgraphics(fig,['real_fiscal_' shock '.png'],'Resolution',150);
end
