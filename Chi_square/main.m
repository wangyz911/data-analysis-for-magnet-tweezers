clc;
clear all;
%��������
load test_data_two_states;

%��ȡ��������������
test=test_data_two_states(1:20000);
%�õ����ݴ�С
size_test=size(test,1);
%�õ����ݶ�Ӧ��ʱ������
time_test=1:size_test;

%�õ�step��λ����Ϣ
step_position_bool=mixed_chi_square(test,1.8);
%��ȡstep��λ����Ϣ
step_position=find(step_position_bool==1);
%�õ�step�ĸ���
position_size=size(step_position,1);
%����step��Ϣ��ϳ�step������
fitted_candidate=get_fitted_candidate(test,step_position);
%�õ�ÿ��step�ĳ��ȣ�ֵ����׼��
[step_length,state_value,state_std]=get_step_length(test,step_position);
%�����ͼ
plot(time_test,test,'b',time_test,fitted_candidate,'r');