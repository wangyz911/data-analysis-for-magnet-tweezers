function [ fitted_data ] = get_fitted_data( data_z,step_position )
%������������֪�����ݹ켣���ҵ���step�õ����ݵ�step���������

%�������ݣ�ȷ��һ���ж��ٶ�
segment_number = size(step_position ,1)+1;
%Ԥ������Ͻ������
total_data_number = size(data_z,1);
fitted_data = zeros(total_data_number,1);
step_segment_with_end = [1; step_position; total_data_number];
%���ֶν���ֱ�������
for i = 1:segment_number
    fitted_data(step_segment_with_end(i):step_segment_with_end(i+1))=mean(data_z(step_segment_with_end(i):step_segment_with_end(i+1)));
end


end

