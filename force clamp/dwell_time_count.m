function [ down, up,good ] = dwell_time_count( data_z,step_position )
%本函数用于进行step的拟合，过滤，驻留时间的统计，并最终给出驻留时间的指数拟合图像和特征时间，仅用于二态统计。
%使用时根据实际情况修改stepcheck和length_check的大小。
%% 对得到的数据进行滤波处理，并分类进行指数拟合
%设定参数
N = size(data_z,1);
%% 开始使用二分法迭代，得到全局最优的J

% 如果有现成的step_position，就不用计算了。
if size(step_position,1) < 2
    step_position = J_search(data_z,0.7);
end
% 根据找到的step位置得到拟合曲线
step_info = get_step_info(data_z,step_position);
fitted_data = get_fitted_data(data_z,step_position);
figure;
plot(1:N,data_z,1:N,fitted_data,'LineWidth',2);
%%%%%%%%%%%%%%%%%%%%%%%%%%%滤除只有几个点的跃变，因为后面会统一调制，所以这里暂时不需要了。
%         %% 将漂移导致的小的step合并，将个别点造成的尖峰合并滤除。
%         % 找到漂移点；
%         step_info = get_step_info(data_z,step_position) ;
%         %此处的 step_shift其实只有初始化和判定循环条件的作用，找到一个就够了，函数内还会重新找。
%         step_check = 0.003;
%         length_check = 5;
%         step_shift = find(abs(diff(step_info(:,2)))<=step_check, 1);
%         while (~isempty(step_shift))
%             [ step_position,step_info, step_shift ] = shift_cor( data_z, step_position, step_check ,length_check);
%         end
%                 %对拟合曲线作图，为选值做准备
%         fitted_data_modi = get_fitted_data(data_z,step_position);
%         figure;
%         plot(1:N,data_z,1:N,fitted_data_modi,'LineWidth',2);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%增加一个缓冲机制，用户可以选择是否对这一段数据进行分析，有的数据有漂移，不是很好，不应该采用。
disp('good data ?')
good = str2double(input('1 or 0','s'));
if good == 1
    
    %% 看图后手动确定有几个态，并选取阈值，按阈值关系将每一段归类，最后输出结果，由主脚本来完成指数拟合工作。
    
    
    disp('how many states ? ')
    state_num = str2double(input('states = ','s'));
    th_n = state_num-1;
    [~,threshold_y] = ginput(th_n);
% 预设置矩阵来保存分区出来的坐标。
state_find = zeros(size(step_info,1),state_num);
for i = 1:th_n
    if i==1
    state_find(:,i) = step_info(:,2) < threshold_y(i);
    elseif i>1
        state_find(:,i)=step_info(:,2) < threshold_y(i)&step_info(:,2) > threshold_y(i-1);
    end
    state_find(:,i+1)=step_info(:,2)> threshold_y(i);
end

    % 先用差分的方法找到边缘，对于up，-1是下降沿，1是上升沿，对于down则相反。
    dif_up = diff(segment_up);
    % 预设置一个结果矩阵，第一行用来存放合并后每段的长度，第二段用来存放合并后的均值。更极端的情况下，可以直接对up
    % 和down 求加权平均。
    smooth_state = zeros(size(state_find));
            dif_state = diff(state_find(:,p))

    

    for p = 1:(size(state_find,1)-1)

        if dif_up(p)==-1
            %找到下边缘（合并终点），长度合并，取值做加权平均
            smooth_state(p,1) = sum(step_info(k_up:p,1));
            smooth_state(p,2) = step_info(k_up:p,2)'*step_info(k_up:p,1)/smooth_state(p,1);
            k_down = p+1;
        elseif dif_up(p)==1
            %找到上边缘（合并起点），重置新的起点，注意差分的值跟实际的坐标相差一个，所以实际坐标是差分坐标+1
            k_up = p+1;
            smooth_down(p,1) = sum(step_info(k_down:p,1));
            smooth_down(p,2) = step_info(k_down:p,2)'*step_info(k_down:p,1)/smooth_state(p,1);
        end
    end
    
    dwell_time_down = smooth_down(:,1);
    dwell_time_up = smooth_state(:,1);
    dwell_time_down(dwell_time_down==0)=[];
    dwell_time_up(dwell_time_up==0)=[];
    
    
    
    dwell_time_up = dwell_time_up./60;
    dwell_time_down = dwell_time_down./60;
    
    %对统计的时间做指数拟合
    [down,up] = createFit(dwell_time_down,dwell_time_up);
else
    down = 0;
    up = 0;
end

end

