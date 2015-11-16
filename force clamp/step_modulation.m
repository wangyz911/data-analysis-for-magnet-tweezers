function [ fitted_data,stepsize,step_std,state_find ] = step_modulation( data_z,step_position)
% ��������������С��������step�ķ�������һЩ���䣬ͨ�����ȷ�ϵ����м���̨����ֵλ�����Ķ���Ȼ�������ͬһ��̬��Сstep����ֵ��ƽ���ͳ��ȵĵ��ӡ�
%�������ܣ����������data_z��ԭʼ���ݣ���������fitted_data
%����������step_position��step_detect�ĵ�һ�������
%���������stepsize��һ����������С��step����ͬ���������step�ĳ��ȣ�state_num��״̬����step_std�ǲ����ı�׼�
% ������ר�Ŷ�����������Ϊ�˴�����̬�������
%% �������ݣ���ͼ�������м���״̬����ֵλ��
% �˴���һ����̬���ã����step_positionֵΪ0������step_detect���ң�������ֳɵ�step_position,��ֱ�Ӳ���
if size(step_position,1) < 2
    step_position = J_search(data_z,0.7);
end
% ����step_position�����ó�ԭʼ���

fitted_data = get_fitted_data(data_z,step_position);
N = size(data_z,1);
figure;
plot(1:N,data_z,1:N,fitted_data,'LineWidth',2);
% ȷ���ж��ٸ�̬
disp('how many states ?')
state_num = str2double(input('states = ','s'));
th_n = state_num-1;
% Ԥ���þ���������������������ꡣ
state_find = zeros(size(fitted_data,1),state_num);
%���������ѭ��������֮�ʣ�����˼·�ǣ���ֵ1��data��Ϊ����ֵ1С�ͱ���ֵ1��Ĳ��֣���Ĳ�����ȥ����ֵ2�ֳɱ���ֵ2С�ʹ�Ĳ��֡������õ����С�
% ����ͨ���������Եõ��߼������������󲻳��С���������һ�ס�

[~,threshold_y] = ginput(th_n);
%% ������ֵ����data��ÿ���ֵ�data ��ֵ����ƽ����ÿ��̬��Ծ�Ĳ����ͱ�׼�
for i = 1:th_n
    if i==1
    state_find(:,i) = fitted_data < threshold_y(i);
    elseif i>1
        state_find(:,i)=fitted_data < threshold_y(i)&fitted_data > threshold_y(i-1);
    end
    state_find(:,i+1)=fitted_data> threshold_y(i);
end
% Ԥ���þ��󱣴�ÿ��״̬�ľ�ֵ�ͱ�׼��
state_mean = zeros(state_num,1);
state_std = state_mean;
for j=1:state_num
    a=fitted_data(state_find(:,j) == 1);
    state_mean(j) = mean(a);
    state_std(j) = std(a);
end
%���㲽��
stepsize = diff(state_mean);
step_std = sqrt(state_std(1:(state_num-1)).^2 + state_std(2:state_num).^2);

%% �����µ�fitted data ��ͼ��Ч����
for k = 1:state_num
    fitted_data(state_find(:,k)==1)= state_mean(k);
end;

plot((1:N)./60,data_z,(1:N)./60,fitted_data,'LineWidth',2);

