function [ step_position_modi,step_info, step_shift ] = shift_cor( data_z, step_position, step_check,length_check )
% ����������������ϳ���������������Ư�Ƶ��µĲ�����С��step�������פ��ʱ��ͳ�Ƶľ��ȣ��ú���Ŀǰ����dwell time
% count�����е��á�
% ��������У���һ����������ͼ�ã��ڶ��������������ã����������ж�ѭ���á�

        % �ҵ�Ư�Ƶ㣻
        step_info = get_step_info(data_z,step_position) ;
        step_shift = find(abs(diff(step_info(:,2)))<=step_check|step_info(2:end,1) < length_check);
        % ��СԾ��ϲ�����,���������ǣ�̨�����˵�ֵ��ȡ����ֵ�ͳ��ȵļ�Ȩƽ���������ȼӵ�һ���ϣ� ��һ�˳��ȵ���0.
        for k = step_shift'

%             step_info(k+1,2)=step_info(k:(k+1),2)'*step_info(k:(k+1),1)/sum(step_info(k:(k+1),1));
%             step_info(k,2) = step_info(k+1,2);
%             step_info(k+1,1) = step_info(k+1,1)+step_info(k,1);
            step_info(k,1) = 0;

        end
        % �õ��µ�step_position_modi
        step_small = step_info(:,1)==0;
        %����һ������ʹ��������ƥ�䡣
        step_small(end) = [];
        step_position(step_small) = [];

        step_position_modi = step_position;
        %ȷ��step_info�����µ�step_position��ƥ��
        step_info = get_step_info(data_z,step_position_modi) ;

end

