%本脚本是文献绘图专用脚本，比较杂乱，分段执行,使用时请注释掉其他功能模块，避免变量重名。

%% 作两个展开的lnK vs F 对比图
k_unfold1 = dwell_time_curve(:,5);
k_fold1 = dwell_time_curve(:,6);
F1 = dwell_time_curve(:,3);
lnK1 = log(k_unfold1./k_fold1);
fit1 = polyfit(F1,lnK1,1);
K1 = exp(lnK1);
err1 = 0.05*F1;


k_unfold2 = dwell_time_curve(:,5);
k_fold2 = dwell_time_curve(:,6);
F2 = dwell_time_curve(:,3);
lnK2 = log(k_unfold2./k_fold2);
fit2 = polyfit(F2,lnK2,1);
K2 = exp(lnK2);
% 误差部分
err2 = 0.05*F2;

force = 0:15;
    figure;
    hold on;
    errorbar(K1,F1,err1,'*');
    semilogx(exp(polyval(fit1,force)),force,'b');
    errorbar(K2,F2,err2,'o');
    semilogx(exp(polyval(fit2,force)),force,'r');

    xlabel('K');
    ylabel('Force(pN)');
    view(90,-90);
    legend('unfold 1','fit 1','unfold 2','fit 2');
    hold off;
    
%% 画原始数据图及其局部放大图像。
% %先载入局部放大的数据
% %然后修正横坐标单位
% frame = 1:size(data_z,1);
% time = frame./60;
% figure;
% plot(time,data_z-0.5,'LineWidth',1);
% hold on 
% plot(time,data_d-0.5,'LineWidth',2);
% xlabel('time/s');
% ylabel('extension/μm')
% title('F = 6.38pN');

%% 画多个并列的图，配上可能的展开模型
figure;
%fig1
subplot(3,1,1);
data1 = data_z(:,1);
time1 = (1:size(data1,1))./3600;
plot(time1,data1,'k');
hold on 
plot(time1,sigDEN(data1),'r');
ylabel('Extension/μm');
title('F = 8.4pN')
%fig2
subplot(3,1,2);
data2 = data_z(:,1);
time2 = (1:size(data2,1))./3600;
plot(time2,data2,'k');
hold on 
plot(time2,sigDEN(data2),'r');
ylabel('Extension/μm');
title('F = 9.2pN')
%fig3
subplot(3,1,3);
data3 = data_z(:,1);
time3 = (1:size(data3,1))./3600;
plot(time3,data3,'k');
hold on 
plot(time3,sigDEN(data3),'r');
ylabel('Extension/μm');
title('F=10.0pN')
%fig4
subplot(4,1,4);
data4 = data_z(:,1);
time4 = (1:size(data4,1))./3600;
plot(time4,data4,'k');
hold on 
plot(time4,sigDEN5(data4),'r');
ylabel('Ext.(μm)');
xlabel('Time(min)');

%% 画两种展开模式的反应速率图
% 展开速率
% 先得到原始数据
%展开1 
% k_unfold1_log = log(dwell_time_curve(:,5));
% k_fold1_log = log(dwell_time_curve(:,6));
% F1 = dwell_time_curve(:,3);
% 
% fit1_unfold = polyfit(F1,k_unfold1_log,1);
% fit1_fold = polyfit(F1,k_fold1_log,1);
% %展开2
% k_unfold2_log = log(dwell_time_curve(:,5));
% k_fold2_log = log(dwell_time_curve(:,6));
% F2 = dwell_time_curve(:,3);
% 
% fit2_unfold = polyfit(F2,k_unfold2_log,1);
% fit2_fold = polyfit(F2,k_fold2_log,1);
% % 按需要分别作图
% %展开速率比较
%     figure;
%     hold on;
%     plot(F1,k_unfold1_log,'*');
%     plot(F1,polyval(fit1_unfold,F1),'b');
%     plot(F2,k_unfold2_log,'o');
%     plot(F2,polyval(fit2_unfold,F2),'r');
% 
%     ylabel('unfolding rate');
%     xlabel('force/pN');
%     legend('unfold 1','fit 1','unfold 2','fit 2');

%% 画驻留时间图像
