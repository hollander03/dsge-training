function [multi_ugc,pvcomp_ugc] = multipliers_news_surprise(P,S,steps,imf)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Set-up and calculate impulse responses %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
V = variables;
    
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%     Compute multipliers       %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
r = S.R;
gc = S.gc;
c = S.c;
y = S.y;
iv = S.inv;
rk = S.rk;
k = S.k;
l = S.l;
w = S.w;
tauk = P.tauk;
taul = P.taul;
tauc = P.tauc;
z = S.z;

%====================================
%===== Govt consumption shock =======
%====================================
rtemp_ugc(:,1) = r*(1+0.04*imf(:,V.r,1));
GCtemp_ugc(:,1) = gc*(0.04*imf(:,V.gc,1));
Ctemp_ugc(:,1) = c*(0.04*imf(:,V.c,1));
Ytemp_ugc(:,1) = y*(0.04*imf(:,V.y,1));
Itemp_ugc(:,1) = iv*(0.04*imf(:,V.i,1));

% Construct discount factor
disc(1,1) = 1;
for i = 2:steps
    disc(i,1) = disc(i-1,1)*rtemp_ugc(i,1);
%     disc(i,1) = 1;
end

% Convert imuplse responses in goods units to PV
for i=1:steps
    discC_ugc(i,1) = Ctemp_ugc(i,1)/disc(i,1);
    discI_ugc(i,1) = Itemp_ugc(i,1)/disc(i,1);
    discY_ugc(i,1) = Ytemp_ugc(i,1)/disc(i,1);
    discGC_ugc(i,1) = GCtemp_ugc(i,1)/disc(i,1);
end
   
cumy_ugc = cumsum(discY_ugc)./cumsum(discGC_ugc);
cumc_ugc = cumsum(discC_ugc)./cumsum(discGC_ugc);
cumi_ugc = cumsum(discI_ugc)./cumsum(discGC_ugc);

pvy_ugc = cumsum(discY_ugc);
pvc_ugc = cumsum(discC_ugc);
pvi_ugc = cumsum(discI_ugc);
pvg_ugc = cumsum(discGC_ugc);

multi_ugc = [cumy_ugc cumc_ugc cumi_ugc];
pvcomp_ugc = [pvy_ugc pvc_ugc pvi_ugc pvg_ugc];

