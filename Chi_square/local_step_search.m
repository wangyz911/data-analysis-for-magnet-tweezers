function local_step_search(data_z,start_point, N)
%��ȡ���ݵĴ�С��Ϊ������׼��
data_size = size(data_z,1);

step_count = 0 ;
%Ԥ�����ж����߼���������stepʱΪ1��Ԥ��Ϊ0;
better = 0;
if data_size == 1
    %ֻ��һ���㣬����

else
    %����δ��step֮ǰ�ķ�����
    J_min = N*std(data_z)^2 + step_count * 9 * var(data_z);
    %��step��count + 1
    step_count = step_count + 1 ;
    %����step�ķָ��
    for k = 2:data_size
        data_A = data_z(1:k);
        data_B = data_z(k+1:end);
        J_A = size(data_A,1)*std(data_A)^2+ step_count * 9 * var(data_A);
        J_B = size(data_B,1)*std(data_B)^2+ step_count * 9 * var(data_B);
        J_step = J_A + J_B;
        if J_step < J_min
            %�ж����������õ�step��
            better = 1;
            %���켣һ��Ϊ2����һ�ε������֮ǰ���һ�£��ڶ������Ϊ��һ��������step��
            step_point = k;
            start_point2 = k+start_point;
            J_min=J_step; %�жϹ��Ƶ�λ���Ƿ���ȫ�����š�
                
        end
    end
        %��step ���ֵ�λ�ñ���ڽ�������С�
        if better == 1
            STEP_DETECT (step_point) = 1;
            % �Խ�����е���
            local_step_search(data_A,start_point,N);
            local_step_search(data_B,start_point2,N);
        end

            
        
    
    
        
end
end

