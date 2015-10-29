function[ step_position ] = J_search(data_z,n)
%���ڷ�������step search ����,����һ���ɵ�����n �����Ʒ������ĳͷ�����
weight = n;
%��ȡ���ݵĴ�С
data_size = size(data_z,1);
%����һ��ȫ�ֱ���������step��λ����Ϣ
global STEP_POSITION;

STEP_POSITION = zeros(data_size,1);
%���ú������еݹ�����
local_step_search(data_z, 1 , weight);
%����������
search_result = STEP_POSITION;
%�õ�step��λ�ú͸���
step_position = find(search_result==1);
end

function local_step_search(data ,start_point , n)
%ȫ�ֱ������κ�һ��������ʹ��ʱ��Ҫ������һ��
global STEP_POSITION;
%��ȡ���ݵĴ�С��Ϊ������׼��
data_whole_size = size(data,1);
step_count = 0 ;
    %����δ��step֮ǰ�ķ�����,��Ϊ��ʼJֵ
J_min = (size(data,1)+step_count * 9* n )*var(data);

%Ԥ�����ж����߼���������stepʱΪ1��Ԥ��Ϊ0;
better = 0;
if data_whole_size <= 1
    %ֻ��һ���㣬����

else
    %����δ��step֮ǰ�ķ�����

    %��step��count + 1
    step_count = step_count + 1 ;
    %����step�ķָ��,����ʵ�����ÿ�����Ӷ������Լ������������ٶ�
    for k = 2:3:data_whole_size
        data_A = data(1:(k-1));
        data_B = data(k:end);
        J_A = (size(data_A,1)+ step_count * 9 * n)*var(data_A);
        J_B = (size(data_B,1)+ step_count * 9 * n)*var(data_B);
        J_step = J_A + J_B;
        if J_step < J_min
            
            %�ж����������õ�step��,����ѭ�������е���зָʼ����
            better = 1;
            %���켣һ��Ϊ2����һ�ε������֮ǰ���һ�£��ڶ������Ϊstep���ܵ������ϵ�λ��
            step_point = k;
            %�·��ֵ�step�����������ϵ�����
            step_position_temp = k+start_point-1;
             J_min=J_step; %�жϹ��Ƶ�λ���Ƿ���ȫ�����š�

        end
    end
        %��step ���ֵ�λ�ñ���ڽ�������С�
        if better == 1
            STEP_POSITION (step_point+start_point-1) = 1;
            % �Խ�����е���
            local_step_search(data(1:(step_point-1)),start_point,n);
            local_step_search(data(step_point:data_whole_size),step_position_temp, n);
        end

            
        
    
    
        
end
end

