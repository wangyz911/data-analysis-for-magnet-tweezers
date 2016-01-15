%���ű������׻�ͼר�ýű����Ƚ����ң��ֶ�ִ��,ʹ��ʱ��ע�͵���������ģ�飬�������������

%% ������չ����lnK vs F �Ա�ͼ
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
% ����
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
    
%% ��ԭʼ����ͼ����ֲ��Ŵ�ͼ��
% %������ֲ��Ŵ������
% %Ȼ�����������굥λ
% frame = 1:size(data_z,1);
% time = frame./60;
% figure;
% plot(time,data_z-0.5,'LineWidth',1);
% hold on 
% plot(time,data_d-0.5,'LineWidth',2);
% xlabel('time/s');
% ylabel('extension/��m')
% title('F = 6.38pN');

%% ��������е�ͼ�����Ͽ��ܵ�չ��ģ��
figure;
%fig1
subplot(3,1,1);
data1 = data_z(:,1);
time1 = (1:size(data1,1))./3600;
plot(time1,data1,'k');
hold on 
plot(time1,sigDEN(data1),'r');
ylabel('Extension/��m');
title('F = 8.4pN')
%fig2
subplot(3,1,2);
data2 = data_z(:,1);
time2 = (1:size(data2,1))./3600;
plot(time2,data2,'k');
hold on 
plot(time2,sigDEN(data2),'r');
ylabel('Extension/��m');
title('F = 9.2pN')
%fig3
subplot(3,1,3);
data3 = data_z(:,1);
time3 = (1:size(data3,1))./3600;
plot(time3,data3,'k');
hold on 
plot(time3,sigDEN(data3),'r');
ylabel('Extension/��m');
title('F=10.0pN')
%fig4
subplot(4,1,4);
data4 = data_z(:,1);
time4 = (1:size(data4,1))./3600;
plot(time4,data4,'k');
hold on 
plot(time4,sigDEN5(data4),'r');
ylabel('Ext.(��m)');
xlabel('Time(min)');

%% ������չ��ģʽ�ķ�Ӧ����ͼ
% չ������
% �ȵõ�ԭʼ����
%չ��1 
% k_unfold1_log = log(dwell_time_curve(:,5));
% k_fold1_log = log(dwell_time_curve(:,6));
% F1 = dwell_time_curve(:,3);
% 
% fit1_unfold = polyfit(F1,k_unfold1_log,1);
% fit1_fold = polyfit(F1,k_fold1_log,1);
% %չ��2
% k_unfold2_log = log(dwell_time_curve(:,5));
% k_fold2_log = log(dwell_time_curve(:,6));
% F2 = dwell_time_curve(:,3);
% 
% fit2_unfold = polyfit(F2,k_unfold2_log,1);
% fit2_fold = polyfit(F2,k_fold2_log,1);
% % ����Ҫ�ֱ���ͼ
% %չ�����ʱȽ�
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

%% ��פ��ʱ��ͼ��
