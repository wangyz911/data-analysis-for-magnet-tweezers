function [ dx_f,dG0_f,dx_u,dG0_u,k0_u,k0_f,G0,G0_u_minus_f,G0_uf,dx_m,dG0_m,k0_m] = FC_calculate_3( dwell_time_curve,T )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
force_line = dwell_time_curve(:,3);
k_unfold_line = dwell_time_curve(:,5);
k_fold_line = dwell_time_curve(:,6);
k_mid_line = dwell_time_curve(:,7);
%����δ��ֵ��Ϊ��ĵ�
force_line(force_line==0)=[];
k_unfold_line(k_unfold_line==0)=[];
k_fold_line(k_fold_line==0)=[];
k_mid_line(k_mid_line==0)=[];
% ȡ�ɶ�������
k_u_log = log(k_unfold_line);
k_f_log = log(k_fold_line);
k_m_log = log(k_mid_line);
%��������
% �Է�Ӧ������������ϵõ�dx �� dG������������Ϊ��Ȼ�����dGO��.
[fit_fold] = polyfit(force_line,k_f_log,1);
[fit_mid] = polyfit(force_line,k_m_log,1);
[fit_unfold]= polyfit(force_line,k_u_log,1);
Kb_T = 1.3806504e-2*(T+273.15); 
% ���շ������
dx_f = fit_fold(1)*Kb_T;
dG0_f = -fit_fold(2);
k0_f = exp(-dG0_f);
dx_u = fit_unfold(1)*Kb_T;
dG0_u = -fit_unfold(2);
k0_u = exp(-dG0_u);
dx_m = fit_mid(1)*Kb_T;
dG0_m = -fit_mid(2);
k0_m = exp(-dG0_m);

% �����ܻ���Ҫ��ȥ���������������ܺ�G4���������ܵȵȣ�ͳ��G_stretch
lnK = k_u_log./k_f_log;
dx_uf = dx_u-dx_f;
[G0,G0_uf] = G0_modi(lnK,force_line,T,dx_uf);
%��һ�ַ����������G0
G0_u_minus_f = dG0_u - dG0_f;
save('dwell_time_results.mat','dx_f','dG0_f','dx_u','dG0_u','k0_u','k0_f','G0','G0_u_minus_f','G0_uf','k0_m','dx_m','dG0_m');
%��ͼ
    figure;
    hold on;
    plot(force_line,k_u_log,'*');
    plot(force_line,polyval(fit_unfold,force_line),'b');
    plot(force_line,k_f_log,'o');
    plot(force_line,polyval(fit_fold,force_line),'r');
    plot(force_line,k_m_log,'+');
    plot(force_line,polyval(fit_mid,force_line),'k');
    title('rate-force');
    ylabel('lnk');
    xlabel('force/pN');
    legend('k_u(F)','fit k_u(F)','k_f(F)','fit k_f(F)','k_m_log','fit k_m(F)');
    h = gcf;
    saveas(h,'k_vs_force','fig');


end

