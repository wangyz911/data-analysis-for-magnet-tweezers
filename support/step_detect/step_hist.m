function [ step_hist,step_fit_down,step_fit_mid,step_fit_up ] = step_hist( fitted_data,step_info )
%�Ѿ�������ϳ���step����Ҫͳ�ƴ����۵�̬��չ��̬��פ��ʱ��ֲ�

%�������ݣ�Ԥ����ʱ������,��ͼ
time_se = 1:size(fitted_data,1);
figure;
plot(time_se,fitted_data);
%�������ͼ�ж��ж��ٸ�̬��Ȼ����ͼ�ϱ궨����ֵ��ע����ֵ�������±궨
disp('how many threshold ?')
state_number = str2double(input('number = ','s'));
threshold_number = state_number-1;
    [~,threshold_y] = ginput(threshold_number);
%Ԥ���ý������N�����У���һ��Ϊup̬���������������
step_hist = zeros(size(step_info,1),state_number);
%���step�ж�������̨�׳��ȹ��ൽԤ��������
if state_number == 2
    %��̬����������̨�׸�����ֵ������̨�׵ĳ��ȷ���up��1���������down��2
    for i = 1:size(step_info,1)
    if step_info(i,2) >threshold_y(1,1)
        step_hist(i,1) = step_info(i,1);
    else step_hist(i,2) = step_info(i,1);
    end
    end
    step_hist = step_hist./60;
    step_up = step_hist(:,1);
    step_up(step_up == 0) = [];
   
    step_down = step_hist(:,2);
    step_down(step_down == 0) = [];
    %��ָ�����
    figure;                                                                    %���Ҫ��ֱ��ͼ����Ԥ��һ��ͼ��������ø�������ͼ��
[step_fit_down,step_fit_up]=createFit(step_down,step_up);
%��̬������м�ֱ̬��ȱʡΪ0
step_fit_mid = 0;

elseif state_number == 3
    %��̬��������̨�׸�����ֵ1�����䳤�ȷ���up��1�����������1��������ֵ2������middle��2���������down��3
    for i = 1:size(step_info,1)
    if step_info(i,2) >threshold_y(1,1)
        step_hist(i,1) = step_info(i,1);
    elseif step_info(i,2) > threshold_y(1,2)
        step_hist(i,2) = step_info(i,1);
    else step_hist(i,3) = step_info(i,1);
    end
    end
    step_hist = step_hist./60;
    step_up = step_hist(:,1);
    step_up(step_up == 0) = [];
    step_mid = step_hist(:,2);
    step_mid(step_up == 0) = [];
   
    step_down = step_hist(:,3);
    step_down(step_down == 0) = [];
    %������̬��ָ�����
    figure;                                                                    %���Ҫ��ֱ��ͼ����Ԥ��һ��ͼ��������ø�������ͼ��
    [step_fit_down,step_fit_mid,step_fit_up]=createFit(step_down,step_mid,step_up);
else
    disp('�����������');
end

end

