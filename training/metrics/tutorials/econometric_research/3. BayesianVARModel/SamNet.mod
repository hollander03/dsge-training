%----------------------------------------------------------------
% First Essay - Baseline Model
%----------------------------------------------------------------
%----------------------------------------------------------------
% Defining Scenarios: Active scenario defined by =1, Inactive = 0 
%----------------------------------------------------------------

@#define mod1_rr=1

@#if mod1_rr==1

@#define Basel_II=1
@#define Basel_II_high=1
@#define Basel_III=1

%After running all scenarios set = 1 to plot IRFs
@#define plot_IRF=1
%----------------------------------------------------------------
% Defining Variables and Parameters
%----------------------------------------------------------------
var C C_h C_e C_b H_h H_e N W q D L_e R_d R_l Sprd Y kappa A Z vareps;

varexo ups_a             //Housing Demand shock
       ups_z             //Technology shock
       ups_vareps;       //Redistribution shock

parameters beta_h beta_e beta_b m_e m_n j tau alpha rho_a rho_z rho_eps chi_x chi_y chi_l Omega_1 Omega_2 Omega_3
           C_ss C_hss C_ess C_bss H_hss H_ess N_ss W_ss q_ss D_ss L_ess R_dss R_lss Sprd_ss Y_ss 
           kappa_ss A_ss Z_ss vareps_ss phi_le phi_lb eta;

%----------------------------------------------------------------
% Assigning parameters values based on the literature
%----------------------------------------------------------------

beta_h = 0.991;
beta_e = 0.94;
beta_b = 0.95;
eta = 0.7; 
m_e = 0.7; 
m_n = 0.5; 
j = 0.1;
tau = 2;
alpha = 0.1; //0.1
rho_a = 0.8;
rho_z = 0.8;
rho_eps = 0.9;
Y_ss = 0.3;
A_ss = 1;
Z_ss = 1;
vareps_ss = 0;
phi_le = 0.05;  //0.05 for tech shock, 0.5 for Capital shock & Housing Shock
phi_lb = 0.05;  //0.05 for tech shock, 0.5 for Capital shock & Housing Shock

% Policy parameters(Different Basel Regimes)
@#if Basel_II==1
kappa_ss = 0.08;
chi_x = -0.5;
chi_y = -2.5;
chi_l = -0.5; 
@#endif

% Policy parameters(Different Basel Regimes)
@#if Basel_II_high==1
kappa_ss = 0.105;
chi_x = -0.5;
chi_y = -2.5;
chi_l = -0.5; 
@#endif

@#if Basel_III==1
kappa_ss = 0.105; 
chi_x = 0.5;
chi_y = 2.5;
chi_l = 0.5;
@#endif

R_dss = 1/beta_h;
R_lss = 1/beta_b - (1-kappa_ss)*((1/beta_b) - (1/beta_h));
Sprd_ss = R_lss - R_dss;
Omega_1 = 1 - beta_e - m_e*((1/R_lss)-beta_e);
Omega_2 = (1 - alpha)/(1 + m_n*(1 - beta_e*R_lss));
Omega_3 = 1 + (R_dss - 1)*(1-kappa_ss)*((alpha*beta_e*m_e)*(1/(R_lss*Omega_1*Omega_2)) - m_n);
H_ess = (alpha*beta_e*(1 - beta_h))/(alpha*beta_e*(1 - beta_h) + j*Omega_1*Omega_2*Omega_3);
H_hss = 1 - H_ess;
q_ss = (alpha*beta_e*Y_ss)/(Omega_1*H_ess);
L_ess = m_e*(1/R_lss)*q_ss*H_ess - m_n*Omega_2*Y_ss;
D_ss = (1-kappa_ss)*L_ess;
C_bss = (1-R_dss)*D_ss + (R_lss-1)*L_ess;
N_ss = 1/(1 + tau*Omega_3);
W_ss = Omega_2*(Y_ss/N_ss);
C_hss = W_ss*N_ss + (R_dss-1)*D_ss;
C_ess = Y + (1-R_lss)*L_ess - W_ss*N_ss;
C_ss = C_hss + C_ess + C_bss;

%----------------------------------------------------------------
% Defining the model
%----------------------------------------------------------------

model;
//Households
C_h + D + q*(H_h - H_h(-1)) = W*N + R_d(-1)*D(-1);         //HH Budget Constraint 
 
1 = beta_h*((C_h - eta*C_h(-1))/(C_h(+1) - eta*C_h))*R_d;  //HH FOC Deposits 
 
q = j*A*((C_h - eta*C_h(-1))/((1-eta)*H_h)) + beta_h*((C_h - eta*C_h(-1))/(C_h(+1) - eta*C_h))*q(+1); //HH FOC Real Estate 

W = (tau/(1 - N))*((C_h - eta*C_h(-1))/(1-eta));            //HH FOC Labour 

//Entrepreneurs
C_e + q*(H_e - H_e(-1)) + R_l*L_e(-1) + W*N + (phi_le/(2*L_ess))*(L_e - L_e(-1))^2 = Y + L_e;    //Entrep Budget Constraint

Y = Z*((H_e(-1))^alpha)*(N^(1-alpha));                       //Entrep Production Function 

L_e = m_e*(q(+1)/R_l(+1))*H_e - m_n*W*N;                     //Entrep Collateral Constraint 

q = beta_e*((C_e - eta*C_e(-1))/(C_e(+1) - eta*C_e))*(alpha*Y(+1)/H_e + (1-m_e)*q(+1)) + m_e*(q(+1)/R_l(+1)) - m_e*(phi_le/L_ess)*(q(+1)/R_l(+1))*(L_e - L_e(-1)); //Entrep FOC Real Estate 

(1-alpha)*Y = W*N*(1 + m_n*(1-beta_e*((C_e - eta*C_e(-1))/(C_e(+1) - eta*C_e))*R_l(+1)));   //Entrep FOC Labour

//Bankers
C_b + R_d(-1)*D(-1) + L_e  + (phi_lb/(2*L_ess))*(L_e - L_e(-1))^2 = D + R_l*L_e(-1);   //Bankers Budget Constraint

D = (1 - kappa)*L_e - vareps;                                 //Bankers Capital Requirement/Collateral Constraint 

1 - (1-kappa) + (phi_lb/L_ess)*(L_e - L_e(-1)) = beta_b*((C_b - eta*C_b(-1))/(C_b(+1) - eta*C_b))*(R_l(+1) - (1-kappa)*R_d);  //Bankers FOC Deposits and Lending 

//Housing Market
H_e + H_h = 1;                                                //Total Real Estate Normalized to 1 

//Macroprudential Rule
//kappa = kappa_ss*(Y/Y_ss)^chi_y;
kappa = kappa_ss*((L_e/Y)/(L_ess/Y_ss))^chi_x;                //Macroprudential Rule 
//kappa = kappa_ss*(L_e/L_ess)^chi_l;

//Interest rate spread
Sprd = R_l - R_d;                                              //Interest rate spread 

//Total Consumption
C = C_h + C_e + C_b;                                           //Total Consumption 

//Shock Processes
log(A) = rho_a*log(A(-1)) + ups_a;                             //Housing Demand Shock 

vareps = rho_eps*vareps(-1) + ups_vareps;                      //Bank Capital shock

log(Z) = rho_z*log(Z(-1)) + ups_z;                             //Technology Shock 

end;

%----------------------------------------------------------------
% Define Initial Values
%---------------------------------------------------------------
initval;
C = C_ss;
C_h = C_hss;
C_e = C_ess;
C_b = C_bss;
H_h = H_hss;
H_e = H_ess;
N = N_ss;
W = W_ss;
q = q_ss;
D = D_ss;
L_e = L_ess;
R_d = R_dss;
R_l = R_lss;
Sprd = Sprd_ss;
Y = Y_ss;
kappa = kappa_ss;
A = A_ss;
Z = Z_ss;
vareps = vareps_ss;

end;

steady;

check;

%---------------------------------------------------------------
%  Define shock variances
%---------------------------------------------------------------

shocks;
var ups_z; stderr 0.01;   
//var ups_vareps; stderr 0.01;
//var ups_a; stderr 0.01;    
end;

%---------------------------------------------------------------
% Generate IRFs 
%---------------------------------------------------------------

stoch_simul(order=1, irf=20, nograph);

%---------------------------------------------------------------
% Generate IRFs graphs
%---------------------------------------------------------------

%---------------------------------------------------------------
% Saving IRFs in mat file 
%---------------------------------------------------------------
@#for var in ["Y", "C", "C_h", "C_e", "C_b", "H_h", "H_e", "N", "W", "q", "D", "L_e", "R_d", "R_l", "Sprd", "kappa"]    
@#if Basel_II==1
m1.@{var}_Basel_II = @{var}_ups_z;
save('mod1_Basel_II_ups_z.mat','-struct','m1')
@#endif

@#if Basel_II_high==1
m1.@{var}_Basel_II_high = @{var}_ups_z;
save('mod1_Basel_II_high_ups_z.mat','-struct','m1')
@#endif

@#if Basel_III==1
m1.@{var}_Basel_III = @{var}_ups_z;
save('mod1_Basel_III_ups_z.mat','-struct','m1')
@#endif

@#endfor

%---------------------------------------------------------------
% Load data
%---------------------------------------------------------------
@#if plot_IRF==1
load('mod1_Basel_II_ups_z.mat')
load('mod1_Basel_II_high_ups_z.mat')
load('mod1_Basel_III_ups_z.mat')

%---------------------------------------------------------------
% Generate IRFs graphs
%---------------------------------------------------------------
fig1 = figure;

    subplot(4,3,1); 
          plot(Y_Basel_II,'k','Marker','*','LineWidth',0.4,'MarkerSize',1.5); hold on; 
          plot(Y_Basel_II_high,'--b','LineWidth',0.7); hold on;
          plot(Y_Basel_III,'r','LineWidth',0.7); hold on;
          title('Output','FontSize',5);
          set(gca,'FontSize',5);

    subplot(4,3,2); 
          plot(C_h_Basel_II,'k','Marker','*','LineWidth',0.4,'MarkerSize',1.5); hold on;
          plot(C_h_Basel_II_high,'--b','LineWidth',0.7); hold on;          
          plot(C_h_Basel_III,'r','LineWidth',0.7); hold on;
          title('Consumption: Households','FontSize',5);
          set(gca,'FontSize',5);

    subplot(4,3,3); 
          plot(C_e_Basel_II,'k','Marker','*','LineWidth',0.4,'MarkerSize',1.5); hold on; 
          plot(C_e_Basel_II_high,'--b','LineWidth',0.7); hold on;          
          plot(C_e_Basel_III,'r','LineWidth',0.7); hold on;
          title('Consumption: Entrep','FontSize',5);
          set(gca,'FontSize',5);

    subplot(4,3,4); 
          plot(C_b_Basel_II,'k','Marker','*','LineWidth',0.4,'MarkerSize',1.5); hold on;
          plot(C_b_Basel_II_high,'--b','LineWidth',0.7); hold on;          
          plot(C_b_Basel_III,'r','LineWidth',0.7); hold on;
          title('Consumption: Bankers','FontSize',5);
          set(gca,'FontSize',5);

    subplot(4,3,5); 
          plot(N_Basel_II,'k','Marker','*','LineWidth',0.4,'MarkerSize',1.5); hold on; 
          plot(N_Basel_II_high,'--b','LineWidth',0.7); hold on;          
          plot(N_Basel_III,'r','LineWidth',0.7); hold on;
          title('Labour','FontSize',5);
          set(gca,'FontSize',5);
          
    subplot(4,3,6); 
          plot(q_Basel_II,'k','Marker','*','LineWidth',0.4,'MarkerSize',1.5); hold on;
          plot(q_Basel_II_high,'--b','LineWidth',0.7); hold on;
          plot(q_Basel_III,'r','LineWidth',0.7); hold on;
          title('House Prices','FontSize',5);
          set(gca,'FontSize',5);
          
    subplot(4,3,7); 
          plot(H_h_Basel_II,'k','Marker','*','LineWidth',0.4,'MarkerSize',1.5); hold on;
          plot(H_h_Basel_II_high,'--b','LineWidth',0.7); hold on; 
          plot(H_h_Basel_III,'r','LineWidth',0.7); hold on;
          title('Housing: Households','FontSize',5);
          set(gca,'FontSize',5);
           
    subplot(4,3,8); 
          plot(H_e_Basel_II,'k','Marker','*','LineWidth',0.4,'MarkerSize',1.5); hold on; 
          plot(H_e_Basel_II_high,'--b','LineWidth',0.7); hold on; 
          plot(H_e_Basel_III,'r','LineWidth',0.7); hold on;
          title('Housing: Entrep','FontSize',5);
          set(gca,'FontSize',5);
          
    subplot(4,3,9); 
          plot(D_Basel_II,'k','Marker','*','LineWidth',0.4,'MarkerSize',1.5); hold on;
          plot(D_Basel_II_high,'--b','LineWidth',0.7); hold on;
          plot(D_Basel_III,'r','LineWidth',0.7); hold on;
          title('Deposits','FontSize',5);
          set(gca,'FontSize',5);
          
    subplot(4,3,10); 
          plot(L_e_Basel_II,'k','Marker','*','LineWidth',0.4,'MarkerSize',1.5); hold on;
          plot(L_e_Basel_II_high,'--b','LineWidth',0.7); hold on;
          plot(L_e_Basel_III,'r','LineWidth',0.7); hold on;
          title('Loans to Entrep','FontSize',5);
          set(gca,'FontSize',5);
                   
    subplot(4,3,11); 
          plot(Sprd_Basel_II,'k','Marker','*','LineWidth',0.4,'MarkerSize',1.5); hold on;
          plot(Sprd_Basel_II_high,'--b','LineWidth',0.7); hold on;
          plot(Sprd_Basel_III,'r','LineWidth',0.7); hold on;
          title('Spread','FontSize',5);
          set(gca,'FontSize',5);  
          //legend({'Basel II','Basel II (High CAR)','Basel III'},'FontSize',4,'Location','Best','Box','off');
              
   subplot(4,3,12); 
          plot(kappa_Basel_II,'k','Marker','*','LineWidth',0.4,'MarkerSize',1.5); hold on;
          plot(kappa_Basel_II_high,'--b','LineWidth',0.7); hold on;
          plot(kappa_Basel_III,'r','LineWidth',0.7); hold on;
          title('Capital Requirement','FontSize',5);
          set(gca,'FontSize',5);
          
set(fig1,'Units','Inches');
pos = get(fig1,'Position');
set(fig1,'PaperPositionMode','Auto','PaperUnits','Inches','PaperSize',[pos(3), pos(4)])
print(fig1,'IRFs_Base_z','-dpdf','-r400')

@#endif
@#endif