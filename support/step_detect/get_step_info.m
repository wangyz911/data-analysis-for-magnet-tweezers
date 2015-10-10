function [ step_info ] = get_step_info( data_z,step_position )
%�ú�����ͬʱָ��������ߺ�ԭʼ���ߵ�����£� ����õ�����step����Ϣ,info�е�һ���ǳ��ȣ��ڶ�����ֵ
%����step�ĳ��ȣ�ֵ

%Ԥ���ý������
info_size = size(step_position,1);
step_info = zeros(size(step_position,1)+1,2);
%���Ƚ�������õ�step�ĳ�����Ϣ(Ҳ����ʹ��diff����)
temp_length1 = zeros(info_size,1);
temp_length1(2:end) = step_position(1:(info_size-1));
temp_length2 = step_position(1:info_size);
step_info(1:info_size,1) = temp_length2-temp_length1 ;
%���һ��β�͵ĳ���Ϊ�����ܳ���ȥ���һ��step������
step_info(info_size+1,1) = size(data_z,1) - step_position(info_size);
%Ȼ��ͨ����ֵ�õ����̨�׵�ֵ
for i = 1:(info_size+1)
    if i<= info_size
        step_info(i,2) = mean(data_z((temp_length1(i)+1):temp_length2(i)));
    else step_info(i,2) = mean(data_z(step_position(info_size):end));
    end
end


end

