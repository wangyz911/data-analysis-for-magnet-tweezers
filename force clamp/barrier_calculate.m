function [ dx_folded, dx_unfolded ] = barrier_calculate( lifetime )
%��֪פ��ʱ�䣬���㷴Ӧ���� ��ʷʹ������ɣ�������dwell_time_analysis�ű����Ժ����ᱻ�����ű����ã�����������ĸ�ʽ�ܵ��ۡ�
%   Detailed explanation goes here

%% �õ�����
dwelltime = lifetime';
time_folded = dwelltime(1,:);
time_unfolded = dwelltime(2,:);
time_force = dwelltime(3,:);
%% ��ʱ��ȡ����������������� �����û�����������ƺ���׼�Ҳ���Ҫ��
time_folded_ln = log(time_folded);
time_unfolded_ln = log(time_unfolded);
fit_folded = polyfit(time_force,time_folded_ln,1);
fit_unfolded = polyfit(time_force,time_unfolded_ln,1);
Kb_T = 1.3806504e-2*(26.0+273.15); 
dx_folded = fit_folded(1)*Kb_T;
dx_unfolded = fit_unfolded(1)*Kb_T;
%% ��ͼ��ʾ���

time_force_s=time_force(1):0.01:time_force(end);
figure;
hold on
plot(time_force,time_folded_ln,'r','LineStyle','o');
plot(time_force_s,time_force_s.*fit_folded(1)+fit_folded(2),'r');
plot(time_force,time_unfolded_ln,'b','LineStyle','*');
plot(time_force_s,time_force_s.*fit_unfolded(1)+fit_unfolded(2),'b');
xlabel('Force / pN');
ylabel('ln(dwell_time) / s');
title('barrier_calculattion');

end

