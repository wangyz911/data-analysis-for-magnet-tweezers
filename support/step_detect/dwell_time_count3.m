function [ down,mid, up ] = dwell_time_count3( data_z )
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
%% �Եõ������ݽ����˲��������������ָ�����
%�趨����
N = size(data_z,1);
%% ��ʼʹ�ö��ַ��������õ�ȫ�����ŵ�J

        search_result = J_search(data_z,0.7);
        %�õ�step��λ�ú͸���
        step_position = find(search_result==1);

%         % �����ҵ���stepλ�õõ��������
%         fitted_data = get_fitted_data(data_z,step_position);
%         %�����������ͼ��Ϊѡֵ��׼��
%         figure;
%         plot(1:N,data_z,1:N,fitted_data,'LineWidth',2);
        %% ��Ư�Ƶ��µ�С��step�ϲ������������ɵļ��ϲ��˳���
        % �ҵ�Ư�Ƶ㣻
        step_info = get_step_info(data_z,step_position) ;
        %�˴��� step_shift��ʵֻ�г�ʼ�����ж�ѭ�����������ã��ҵ�һ���͹��ˣ������ڻ��������ҡ�
        step_check = 0.005;
        length_check = 2;
        step_shift = find(abs(diff(step_info(:,2)))<=step_check, 1);
        while (~isempty(step_shift))
            [ step_position,step_info, step_shift ] = shift_cor( data_z, step_position, step_check ,length_check);
        end
                %�����������ͼ��Ϊѡֵ��׼��
        fitted_data_modi = get_fitted_data(data_z,step_position);
        figure;
        plot(1:N,data_z,1:N,fitted_data_modi,'LineWidth',2);        
        
%% ��ͼ���ֶ�ȷ���м���̬����ѡȡ��ֵ������ֵ��ϵ��ÿһ�ι��࣬����������������ű������ָ����Ϲ�����

           disp('ȡ��˵������ȡ������ȷ��������̬���м�ĵ�, �ӵ���ߴ�ȡ��')
           [~,threshold_y] = ginput(2);
           segment_down = step_info(:,2) < threshold_y(1,1);
           segment_mid = step_info(:,2)> threshold_y(1,1)&step_info(:,2) < threshold_y(2,1);
           segment_up = step_info(:,2)> threshold_y(2,1);
           dwell_time_down = step_info(segment_down,1);
           dwell_time_mid = step_info(segment_mid,1);
           dwell_time_up = step_info(segment_up,1);

           dwell_time_up = dwell_time_up./60;
           dwell_time_down = dwell_time_down./60;
           dwell_time_mid = dwell_time_mid./60;
           %��ͳ�Ƶ�ʱ����ָ�����
           [down,mid,up] = createFit3(dwell_time_down,dwell_time_mid,dwell_time_up);

end

