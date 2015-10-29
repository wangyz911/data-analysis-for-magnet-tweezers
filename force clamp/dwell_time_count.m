function [ fitted_data_modi,down, up,good ] = dwell_time_count( data_z )
%���������ڽ���step����ϣ����ˣ�פ��ʱ���ͳ�ƣ������ո���פ��ʱ���ָ�����ͼ�������ʱ�䣬�����ڶ�̬ͳ�ơ�
%ʹ��ʱ����ʵ������޸�stepcheck��length_check�Ĵ�С��
%% �Եõ������ݽ����˲��������������ָ�����
%�趨����
N = size(data_z,1);
%% ��ʼʹ�ö��ַ��������õ�ȫ�����ŵ�J

        search_result = J_search(data_z,0.5);
        %�õ�step��λ�ú͸���
        step_position = find(search_result==1);

        % �����ҵ���stepλ�õõ��������
%         fitted_data = get_fitted_data(data_z,step_position);
%         figure;
%         plot(1:N,data_z,1:N,fitted_data,'LineWidth',2);
        %% ��Ư�Ƶ��µ�С��step�ϲ������������ɵļ��ϲ��˳���
        % �ҵ�Ư�Ƶ㣻
        step_info = get_step_info(data_z,step_position) ;
        %�˴��� step_shift��ʵֻ�г�ʼ�����ж�ѭ�����������ã��ҵ�һ���͹��ˣ������ڻ��������ҡ�
        step_check = 0.003;
        length_check = 5;
        step_shift = find(abs(diff(step_info(:,2)))<=step_check, 1);
        while (~isempty(step_shift))
            [ step_position,step_info, step_shift ] = shift_cor( data_z, step_position, step_check ,length_check);
        end
                %�����������ͼ��Ϊѡֵ��׼��
        fitted_data_modi = get_fitted_data(data_z,step_position);
        figure;
        plot(1:N,data_z,1:N,fitted_data_modi,'LineWidth',2);
       %����һ��������ƣ��û�����ѡ���Ƿ����һ�����ݽ��з������е�������Ư�ƣ����Ǻܺã���Ӧ�ò��á�
       disp('good data ?')
       good = str2double(input('1 or 0','s'));
       if good == 1
           
       
       
       
%% ��ͼ���ֶ�ȷ���м���̬����ѡȡ��ֵ������ֵ��ϵ��ÿһ�ι��࣬����������������ű������ָ����Ϲ�����


           disp('ȡ��˵������ȡ������ȷ��������̬���м�ĵ�')
           [~,threshold_y] = ginput(1);
%            threshold_y = (max(step_info(:,2))+min(step_info(:,2)))/2;
% ��Ҫ��취�ϲ�������ͬһ�������ڶε�פ��ʱ�䡣
           segment_up = step_info(:,2) > threshold_y(1,1);
           % ���ò�ֵķ����ҵ���Ե������up��-1���½��أ�1�������أ�����down���෴��
           dif_up = diff(segment_up);
           % Ԥ����һ��������󣬵�һ��������źϲ���ÿ�εĳ��ȣ��ڶ���������źϲ���ľ�ֵ�������˵�����£�����ֱ�Ӷ�up
           % ��down ���Ȩƽ����
           smooth_up = zeros(size(segment_up,1),2);
           smooth_down = zeros(size(segment_up,1),2);
           
           k_up = 1;
           k_down = 1;
           for p = 1:size(dif_up,1)
               if dif_up(p)==-1
                   %�ҵ��±�Ե���ϲ��յ㣩�����Ⱥϲ���ȡֵ����Ȩƽ��
                   smooth_up(p,1) = sum(step_info(k_up:p,1));
                   smooth_up(p,2) = step_info(k_up:p,2)'*step_info(k_up:p,1)/smooth_up(p,1);
                   k_down = p+1;
               elseif dif_up(p)==1
                   %�ҵ��ϱ�Ե���ϲ���㣩�������µ���㣬ע���ֵ�ֵ��ʵ�ʵ��������һ��������ʵ�������ǲ������+1
                   k_up = p+1;
                   smooth_down(p,1) = sum(step_info(k_down:p,1));
                   smooth_down(p,2) = step_info(k_down:p,2)'*step_info(k_down:p,1)/smooth_up(p,1);
               end
           end
        
           dwell_time_down = smooth_down(:,1);
           dwell_time_up = smooth_up(:,1);
           dwell_time_down(dwell_time_down==0)=[];
           dwell_time_up(dwell_time_up==0)=[];
           


           dwell_time_up = dwell_time_up./60;
           dwell_time_down = dwell_time_down./60;

           %��ͳ�Ƶ�ʱ����ָ�����
           [down,up] = createFit(dwell_time_down,dwell_time_up);
       else
           down = 0;
           up = 0;
       end

end

