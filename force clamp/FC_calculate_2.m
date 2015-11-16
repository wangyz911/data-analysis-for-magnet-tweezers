function [ dx_f,dG0_f,dx_u,dG0_u,k0_u,k0_f,G0,G0_u_minus_f,G0_uf] = FC_calculate_2( dwell_time_curve,T )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
force_line = dwell_time_curve(:,3);
k_unfold_line = dwell_time_curve(:,5);
k_fold_line = dwell_time_curve(:,6);
%消除未赋值而为零的点
force_line(force_line==0)=[];
k_unfold_line(k_unfold_line==0)=[];
k_fold_line(k_fold_line==0)=[];
k_u_log = log(k_unfold_line);
k_f_log = log(k_fold_line);
% 对反应速率做线性拟合得到dx 和 dG（还需修正成为自然情况下dGO）.
[fit_fold] = polyfit(force_line,k_f_log,1);
[fit_unfold]= polyfit(force_line,k_u_log,1);
Kb_T = 1.3806504e-2*(T+273.15); 
% 最终分析结果
dx_f = fit_fold(1)*Kb_T;
dG0_f = -fit_fold(2);
k0_f = exp(-dG0_f);
dx_u = fit_unfold(1)*Kb_T;
dG0_u = -fit_unfold(2);
k0_u = exp(-dG0_u);
% 自由能还需要减去单链的拉伸自由能和G4拉伸自由能等等，统称G_stretch
lnK = k_u_log./k_f_log;
dx_uf = dx_u-dx_f;
[G0,G0_uf] = G0_modi(lnK,force_line,T,dx_uf);
%另一种方法计算出的G0
G0_u_minus_f = dG0_u - dG0_f;


save('dwell_time_results.mat','dx_f','dG0_f','dx_u','dG0_u','k0_u','k0_f','G0','G0_u_minus_f','G0_uf');
%作图
    figure;
    hold on;
    plot(force_line,k_u_log,'*');
    plot(force_line,polyval(fit_unfold,force_line),'b');
    plot(force_line,k_f_log,'o');
    plot(force_line,polyval(fit_fold,force_line),'r');
    title('rate-force');
    ylabel('lnk');
    xlabel('force/pN');
    legend('ku(f)','fit ku(f)','kf(f)','fit kf(f)')
    h = gcf;
    saveas(h,'k_vs_force','fig');


end

