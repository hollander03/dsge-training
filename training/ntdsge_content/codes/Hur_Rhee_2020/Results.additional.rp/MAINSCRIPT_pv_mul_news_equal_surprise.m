clc;
format short g;
close all;
clear all;

tic

steps = 45; 

pvmul_calc_flag = 1;

cd ..
cd Baseline.lindet.rp

load finaldraw_info_rp.mat  

[ndraws,nparam] = size(finaldraw);

cd ..
cd Results.additional.rp

%% Calculate PV multipliers
if pvmul_calc_flag
%  ndraws = 2000;   
    multi_ugc_news_store = zeros(steps,3,ndraws);
    
    multi_ugc_surprise_store = zeros(steps,3,ndraws);
    
    for iter=1:ndraws
       %% PV multipliers with news equal
        cd ..
        cd Model.annual.news.equal.rp
        
        current_param = finaldraw(iter,:);
        current_param(1,23:35) = ones(1,13); 
        
        P = parameters(current_param);
        S = steadystate(P);
        
        P = parameters_news_weight14(current_param,S); % <<<
        V = variables;
        
        shock_num = [V.epsugc; V.epsuzsum];
        
        [T,M,eu] = linmodel(P,S,V);
        
        imf = zeros(steps,V.nvar,2);

        for i=1:2
            imf(1,:,i) = M(:,shock_num(i))';
            for tt=2:steps
                imf(tt,:,i) = (T*imf(tt-1,:,i)')';
            end
        end
        
        %==cumulative multipliers
        [multi_ugc_temp,~] = multipliers_news_surprise(P,S,steps,imf);

        multi_ugc_news_store(:,:,iter) = multi_ugc_temp;
         
        load news_weights.mat
        
        cd ..
        cd Results.additional.rp
        

       %% PV multipliers with surprise
        cd ..
        cd Model.annual.rp
        
        V = variables;
        imf = zeros(steps,V.nvar,2);
        
        for tt=1:steps
            for i=1:2
                current_param_surprise = current_param;
                if tt<=size(gc_weight,1)
                    current_param_surprise(27) = gc_weight(tt,1); 
                    current_param_surprise(31) = zsum_weight(tt,1); 
                else
                    current_param_surprise(27) = 0; 
                    current_param_surprise(31) = 0; 
                end

                P = parameters(current_param_surprise);
                S = steadystate(P);
                V = variables;
                
                shock_num = [V.epsugc; V.epsuzsum];

                [T,M,eu] = linmodel(P,S,V);
                
                if tt==1
                    imf(tt,:,i) = M(:,shock_num(i))';
                else
                    imf(tt,:,i) = (T*imf(tt-1,:,i)')' + M(:,shock_num(i))'; 
                end
            end
        end        
        
        %==cumulative multipliers
        [multi_ugc_temp,~] = multipliers_news_surprise(P,S,steps,imf);

        multi_ugc_surprise_store(:,:,iter) = multi_ugc_temp;
        
        cd ..
        cd Results.additional.rp
        
        if round(iter/10)==iter/10
            disp(iter)
            toc
        end
    end
    
    multi_ugc_gap_store = multi_ugc_surprise_store - multi_ugc_news_store;
    
    multi_ugc_news_dist = zeros(steps,3,6);
    
    multi_ugc_surprise_dist = zeros(steps,3,6);
    
    multi_ugc_gap_dist = zeros(steps,3,6);
    
    for i=1:steps
        for j=1:3
            multi_ugc_news_dist(i,j,1) = mean(multi_ugc_news_store(i,j,:));
            multi_ugc_news_dist(i,j,2) = quantile(multi_ugc_news_store(i,j,:),0.5);
            multi_ugc_news_dist(i,j,3) = quantile(multi_ugc_news_store(i,j,:),0.16);
            multi_ugc_news_dist(i,j,4) = quantile(multi_ugc_news_store(i,j,:),0.84);
            multi_ugc_news_dist(i,j,5) = quantile(multi_ugc_news_store(i,j,:),0.05);
            multi_ugc_news_dist(i,j,6) = quantile(multi_ugc_news_store(i,j,:),0.95);
            
            multi_ugc_surprise_dist(i,j,1) = mean(multi_ugc_surprise_store(i,j,:));
            multi_ugc_surprise_dist(i,j,2) = quantile(multi_ugc_surprise_store(i,j,:),0.5);
            multi_ugc_surprise_dist(i,j,3) = quantile(multi_ugc_surprise_store(i,j,:),0.16);
            multi_ugc_surprise_dist(i,j,4) = quantile(multi_ugc_surprise_store(i,j,:),0.84);
            multi_ugc_surprise_dist(i,j,5) = quantile(multi_ugc_surprise_store(i,j,:),0.05);
            multi_ugc_surprise_dist(i,j,6) = quantile(multi_ugc_surprise_store(i,j,:),0.95);
            
            multi_ugc_gap_dist(i,j,1) = mean(multi_ugc_gap_store(i,j,:));
            multi_ugc_gap_dist(i,j,2) = quantile(multi_ugc_gap_store(i,j,:),0.5);
            multi_ugc_gap_dist(i,j,3) = quantile(multi_ugc_gap_store(i,j,:),0.16);
            multi_ugc_gap_dist(i,j,4) = quantile(multi_ugc_gap_store(i,j,:),0.84);
            multi_ugc_gap_dist(i,j,5) = quantile(multi_ugc_gap_store(i,j,:),0.05);
            multi_ugc_gap_dist(i,j,6) = quantile(multi_ugc_gap_store(i,j,:),0.95);
            
        end
    end
    
    save pv_mul_news_equal14_surprise_dist.mat multi_ugc_news_dist  ...
                                       multi_ugc_surprise_dist  ...
                                       multi_ugc_gap_dist 
else
    load pv_mul_news_equal14_surprise_dist.mat
end

%% Impulse response plots
plotsteps = 45;

dt = (0:1:plotsteps-1)';
dt2 = (1:1:plotsteps-1)';

color0 = rgb('Black');
color1 = rgb('MediumBlue');
color2 = rgb('Crimson');
color3 = rgb('RoyalBlue');
color4 = rgb('ForestGreen');
color5 = rgb('Navy');
color6 = rgb('OrangeRed');
color7 = rgb('Purple');
color8 = rgb('MediumVioletRed');
color9 = rgb('Cyan');
color10 = rgb('Magenta');
color11 = rgb('Lime');
color12 = rgb('DarkCyan');
color13 = rgb('HotPink');
color14 = rgb('GreenYellow');
color15 = rgb('Salmon');
color16 = rgb('LightGray');
color17 = rgb('DarkGray');
color18 = rgb('DarkBlue');
color19 = rgb('MediumVioletRed');
color20 = rgb('DimGray');
color21 = rgb('Gold');

pobj = 2;
        
figure(1)

for j=1:3
    subplot(2,3,j)
    series1 = multi_ugc_news_dist(2:plotsteps,j,pobj);
    series2 = multi_ugc_surprise_dist(2:plotsteps,j,pobj);
    maxvar = 1.1*max(max(series1),max(series2));
    minvar1 = min(series1)-.1*abs(min(series1));
    minvar2 = min(series2)-.1*abs(min(series2));
    minvar = min(minvar1,minvar2);
    hold on
    plot(dt2,series2,'-', 'Color', color3, 'MarkerSize',3, 'linewidth',2);
    plot(dt2,series1,'--', 'Color', color2, 'MarkerSize',3, 'linewidth',2);
    plot(dt2,series2,'-', 'Color', color3, 'MarkerSize',3, 'linewidth',2);
    plot(dt2,series1,'--', 'Color', color2, 'MarkerSize',3, 'linewidth',2);
    plot(dt,zeros(plotsteps,1), 'Color', color0, 'MarkerSize',3, 'linewidth',1);
    hold off
    axis tight
    grid on
    if maxvar<=0
        ylim([minvar -maxvar*0.1])
    elseif minvar>=0
        ylim([-minvar*0.05 maxvar])
    else
        ylim([minvar maxvar])
    end
    xlim([dt(1) dt(end)])
    if j==1
        title('PV multiplier of output', 'fontsize', 10);
        ylabel('Govt. spending', 'fontsize', 10);
    elseif j==2
        title('PV multiplier of consumption', 'fontsize', 10);
    elseif j==3
        title('PV multiplier of investment', 'fontsize', 10);
    end
    if j==1
        hh = legend('Surprise','News','Location','NorthEast');
        set(hh,'box','off');
%         newPosition = [0.35 0.015 0.35 0.015];
%         newUnits = 'normalized';
%         set(hh,'Position', newPosition,'Units', newUnits);
    end
end

for j=1:3
    subplot(2,3,j+3)
    series1 = multi_ugc_gap_dist(2:plotsteps,j,pobj);
    series2 = multi_ugc_gap_dist(2:plotsteps,j,3);
    series3 = multi_ugc_gap_dist(2:plotsteps,j,4);
    maxvar = 1.1*max(max(series1),max(series3));
    minvar1 = min(series1)-.1*abs(min(series1));
    minvar2 = min(series2)-.1*abs(min(series2));
    minvar = min(minvar1,minvar2);
    hold on
    plot(dt2,series1,'-', 'Color', color4, 'MarkerSize',3, 'linewidth',1);
    plot(dt2,series2,'--', 'Color', color4, 'MarkerSize',3, 'linewidth',1);
    plot(dt2,series3,'--', 'Color', color4, 'MarkerSize',3, 'linewidth',1);
    plot(dt,zeros(plotsteps,1), 'Color', color0, 'MarkerSize',3, 'linewidth',1);
    hold off
    axis tight
    grid on
    if maxvar<=0
        ylim([minvar -maxvar*0.1])
    elseif minvar>=0
        ylim([-minvar*0.05 maxvar])
    else
        ylim([minvar maxvar])
    end
    xlim([dt(1) dt(end)])
    if j==1
        title('PV multiplier of output: gap', 'fontsize', 10);
        ylabel('Govt. spending', 'fontsize', 10);
    elseif j==2
        title('PV multiplier of consumption: gap', 'fontsize', 10);
    elseif j==3
        title('PV multiplier of investment: gap', 'fontsize', 10);
    end
    if j==1
        hh = legend('Surprise - News, median','[16%, 84%]','Location','SouthEast');
        set(hh,'box','off');
%         newPosition = [0.35 0.015 0.35 0.015];
%         newUnits = 'normalized';
%         set(hh,'Position', newPosition,'Units', newUnits);
    end
end

cd ..
%cd ..
cd HR.main.text

figure(1);
set(gcf, 'Units', 'inches');
set(gcf, 'Position', [0 0 9.8 4.7]);
set(gcf, 'renderer', 'painters');
set(gcf, 'PaperPositionMode', 'auto');
print(gcf, '-depsc2', '-painters', ['pvmul_ugc_equal14.eps'])
% close

cd ..
cd Results.additional.rp

