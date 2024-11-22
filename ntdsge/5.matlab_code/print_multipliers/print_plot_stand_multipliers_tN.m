%calculate and print fiscal multipliers

ybarbase=M_.params(loc(M_.param_names(:,:),'ybar'));
cbarbase=M_.params(loc(M_.param_names(:,:),'cbar'));
ibarbase=M_.params(loc(M_.param_names(:,:),'ibar'));
taubase=M_.params(loc(M_.param_names(:,:),'wbar'))*M_.params(loc(M_.param_names(:,:),'Nbar'));
tauNbase=M_.params(loc(M_.param_names(:,:),'tauNbar'))*M_.params(loc(M_.param_names(:,:),'wbar'))*M_.params(loc(M_.param_names(:,:),'Nbar'));

resp_mat_fis(1,:)=oo_.irfs.tauN_etatauN(:,1:100);
resp_mat_y(1,:)=oo_.irfs.y_etatauN(:,1:100);
resp_mat_c(1,:)=oo_.irfs.c_etatauN(:,1:100);
resp_mat_i(1,:)=oo_.irfs.i_etatauN(:,1:100);

Rbar_disc= 1.098; %1+M_.params(loc(M_.param_names(:,:),'Rgovbar'))/100;
disc=1/Rbar_disc;
disc_vec=disc.^[0:1:length(resp_mat_fis)-1];
disc_mat=repmat(disc_vec,size(resp_mat_y,1),1);

mult_cum_y=cumsum(ybarbase.*resp_mat_y,2)./cumsum(tauNbase.*taubase.*resp_mat_fis,2);
mult_pv_y=cumsum(disc_mat.*ybarbase.*resp_mat_y,2)./cumsum(disc_mat.*tauNbase.*taubase.*resp_mat_fis,2);

mult_cum_c=cumsum(cbarbase.*resp_mat_c,2)./cumsum(tauNbase.*taubase.*resp_mat_fis,2);
mult_pv_c=cumsum(disc_mat.*cbarbase.*resp_mat_c,2)./cumsum(disc_mat.*tauNbase.*taubase.*resp_mat_fis,2);

mult_cum_i=cumsum(ibarbase.*resp_mat_i,2)./cumsum(tauNbase.*taubase.*resp_mat_fis,2);
mult_pv_i=cumsum(disc_mat.*ibarbase.*resp_mat_i,2)./cumsum(disc_mat.*tauNbase.*taubase.*resp_mat_fis,2);


disp(' ');
disp('Standardized Fiscal Multipliers (present value):');
disp('-------------------------------------------------------------------------------------');
fprintf('                   Impact     4Q     8Q     16Q     20Q     64Q    Inf     Max     Min\n' );
fprintf('Output            : %3.2f\t %3.2f\t%3.2f\t%3.2f\t%3.2f\t%3.2f\t%3.2f\t%3.2f\t%3.2f\n',mult_pv_y(1,1),mult_pv_y(1,5),mult_pv_y(1,9),mult_pv_y(1,17),mult_pv_y(1,21),mult_pv_y(1,65),mult_pv_y(1,end),max(mult_pv_y(1,:)),min(mult_pv_y(1,:)));
disp(' ');


disp(' ');
disp('-------------------------------------------------------------------------------------');
fprintf('                   Impact     4Q     8Q     16Q     20Q     64Q    Inf     Max     Min\n' );
fprintf('Consumption            : %3.2f\t %3.2f\t%3.2f\t%3.2f\t%3.2f\t%3.2f\t%3.2f\t%3.2f\t%3.2f\n',mult_pv_c(1,1),mult_pv_c(1,5),mult_pv_c(1,9),mult_pv_c(1,17),mult_pv_c(1,21),mult_pv_c(1,65),mult_pv_c(1,end),max(mult_pv_c(1,:)),min(mult_pv_c(1,:)));
disp(' ');

disp(' ');
disp('-------------------------------------------------------------------------------------');
fprintf('                   Impact     4Q     8Q     16Q     20Q     64Q    Inf     Max     Min\n' );
fprintf('Investment            : %3.2f\t %3.2f\t%3.2f\t%3.2f\t%3.2f\t%3.2f\t%3.2f\t%3.2f\t%3.2f\n',mult_pv_i(1,1),mult_pv_i(1,5),mult_pv_i(1,9),mult_pv_i(1,17),mult_pv_i(1,21),mult_pv_i(1,65),mult_pv_i(1,end),max(mult_pv_i(1,:)),min(mult_pv_i(1,:)));
disp(' ');