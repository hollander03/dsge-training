%% Step 1. Load the QUARTERLY Data
close all
clear
%load('terl.mat')
%y = terl;
load('fiscaltax.mat')
%% save('fiscaltax.mat')
% y = log(cit(16:128,:));
% y = log(pit(16:128,:));
% y = log(vat(:,:));
% y = log(property(:,:));
% y = log(transtot(:,:));
% y = buddef;
y = log(totexp(:,:));
T = length(y);


figure
plot(y)
f0 = gca;
f0.XLim = [0,T];
%h1.XTick = 1:12:T;
f0.XTick = 1:4:T;
%h1.XTickLabel = datestr(dates(1:12:T),10);
title 'Your Data';
hold on

%% Step 2. Detrend the data using a 13-term moving average.

%sW13 = [1/24;repmat(1/12,11,1);1/24];
sW5 = [1/8;repmat(1/4,3,1);1/8];
yS = conv(y,sW5,'same');
%yS(1:6) = yS(7); yS(T-5:T) = yS(T-6);
yS(1:2) = yS(3); yS(T-1:T) = yS(T-2);

xt = y./yS; % multiplicative
% xt = y - yS; % log-additive

f1 = plot(yS,'r','LineWidth',2);
legend(f1,'5-Term Moving Average')
hold off

figure
f2 = plot(xt,'r','LineWidth',2);
legend(f2,'detrended series')
hold off

%% Step 3. Create seasonal indices.

%s = 12;
s = 4;
idx = cell(s,1); % Preallocation

for i = 1:s
 sidx{i,1} = i:s:T;
end

sidx{1:2};


%% Step 4a. Apply a stable seasonal filter.

sst = cellfun(@(x) mean(xt(x)),sidx);

% Put smoothed values back into a vector of length N
nc = floor(T/s); % no. complete years
rm = mod(T,s); % no. extra months
sst = [repmat(sst,nc,1);sst(1:rm)];

% Center the seasonal estimate (additive)
sBar = mean(sst); % for centering
sst = sst-sBar;

figure
plot(sst)
title 'Stable Seasonal Component';
f2 = gca;
f2.XLim = [0 T];
ylabel 'ylabel';
%f2.XTick = 1:12:T;
f2.XTick = 1:4:T;
%h2.XTickLabel = datestr(dates(1:12:T),10);
hold off

%% Step4b. Apply an S(3,3) filter. (non-stable)
% S3x3 seasonal filter
% Symmetric weights
sW3 = [1/9;2/9;1/3;2/9;1/9];
% Asymmetric weights for end of series
aW3 = [.259 .407;.37 .407;.259 .185;.111 0];

% Apply filter to each QUARTER
shat = NaN*y;
for i = 1:s
    ns = length(sidx{i});
    first = 1:4;
    last = ns - 3:ns;
    dat = xt(sidx{i});
    
    sd = conv(dat,sW3,'same');
    sd(1:2) = conv2(dat(first),1,rot90(aW3,2),'valid');
    sd(ns  -1:ns) = conv2(dat(last),1,aW3,'valid');
    shat(sidx{i}) = sd;
end

% 13-term moving average of filtered series
%sW13 = [1/24;repmat(1/12,11,1);1/24];
sW5 = [1/8;repmat(1/4,3,1);1/8];
sb = conv(shat,sW5,'same');
%sb(1:6) = sb(s+1:s+6); 
%sb(T-5:T) = sb(T-s-5:T-s);
sb(1:2) = sb(s+1:s+2); 
sb(T-1:T) = sb(T-s-1:T-s);

% Center to get final estimate
s33 = shat./sb;

figure
plot(s33)
f3 = gca;
f3.XLim = [0,T];
%h3.XTick = 1:12:T;
f3.XTick = 1:4:T;
%h3.XTickLabel = datestr(dates(1:12:T),10);
title 'Estimated Seasonal Component';
hold off

%% Step 5. Deseasonalize the series.

dt = y - sst;   % additive
% dt = y./(1+sst); % multiplicative
dt33 = y./s33;

figure
plot(dt)
hold
plot(dt33)
%plot(y)
title 'Deseasonalized Series';
ylabel 'ylabel';
f4 = gca;
f4.XLim = [0 T];
%h4.XTick = 1:12:T;
f4.XTick = 1:4:T;
%h4.XTickLabel = datestr(dates(1:12:T),10);
legend(f4,'dt','dt33')
hold off
%% Apply a 13-term Henderson filter.
% To get an improved estimate of the trend component, apply a 13-term Henderson filter to the seasonally adjusted series. The necessary symmetric and asymmetric weights are provided in the following code.

% Deseasonalize series
%dt33 = y./s33;
%dt = y./(1+sst);

% Henderson filter weights 13-term
%sWH = [-0.019;-0.028;0;.066;.147;.214;
%      .24;.214;.147;.066;0;-0.028;-0.019];
% 5-Term
sWH = [-0.073; 0.294; 0.558; 0.294; -0.073];
% Asymmetric weights for end of series
aWH = [-.034  -.017   .045   .148   .279   .421;
       -.005   .051   .130   .215   .292   .353;
        .061   .135   .201   .241   .254   .244;
        .144   .205   .230   .216   .174   .120;
        .211   .233   .208   .149   .080   .012;
        .238   .210   .144   .068   .002  -.058;
        .213   .146   .066   .003  -.039  -.092;
        .147   .066   .004  -.025  -.042  0    ;
        .066   .003  -.020  -.016  0      0    ;
        .001  -.022  -.008  0      0      0    ;
       -.026  -.011   0     0      0      0    ;
       -.016   0      0     0      0      0    ];

% Apply 5-term Henderson filter
first = 1:12;
last = T-11:T;
h5 = conv(dt33,sWH,'same');
h5(T-5:end) = conv2(dt33(last),1,aWH,'valid');
h5(1:6) = conv2(dt33(first),1,rot90(aWH,2),'valid');

% New detrended series
xt = y./h5;

figure
plot(y)
f5 = gca;
f5.XLim = [0,T];
%h5.XTick = 1:12:T;
f5.XTick = 1:4:T;
%h5.XTickLabel = datestr(dates(1:12:T),10);
title 'Your series';
hold on
plot(h5,'r','LineWidth',2);
legend('Original series','5-Term Henderson Filter')
hold off
%% plot for level or log-level transformation
% figure
% plot(diff(dt)./dt(1:end-1,:));
% hold on
% plot(diff(dt33)./dt33(1:end-1,:));
% legend('dt','dt33');
% hold off
figure
plot(diff(dt));
hold on
plot(diff(dt33));
legend('dt','dt33');
hold off
