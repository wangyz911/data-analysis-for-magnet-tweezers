
%step ���������������򣨽ű���
%���ÿ����ֲ��Լ�������ԭ��������step�����������
%  ������ΪJ = ����=sum(k=1:N)��ʵ��ֵk-Ԥ��ֵk��^2  - W *
%  sum(k=1:N)delta(xk-x(k-1)),��һ�����������ǿ���ֵ���ڶ���������������step����W =
%  9sigma^2����ԭʼ���ݵķ��
%% Ԥ����ϵ���Լ��������
clc;
clear;
load test_data_two_states;
data_z = test_data_two_states(1:5000);
N = size(data_z,1);

%% ��ʼʹ�ö��ַ��������õ�ȫ�����ŵ�J
search_result = J_search(data_z,0.7);
%�õ�step��λ�ú͸���
step_position = find(search_result==1);
step_count = size(step_position,1);
%% �����ҵ���stepλ�õõ��������
fitted_data = get_fitted_data(data_z,step_position);
%�õ�̨�׵ĳ����Լ�ֵ����Ϣ
step_info = get_step_info(data_z,step_position);
%��ͼ
time_sequence = (1:N)/60;
plot(time_sequence,data_z,time_sequence,fitted_data);
%% ��פ��ʱ��ͳ��
[step_hist,step_fit_down,step_fit_mid,step_fit_up ] = step_hist(fitted_data,step_info);

