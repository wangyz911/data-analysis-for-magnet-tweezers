function [ fitted_data,stepsize,step_std,state_find ] = step_modulation( data_z,step_position)
% 本函数用来对最小卡方查找step的方法进行一些补充，通过鼠标确认到底有几个台，阈值位置在哪儿，然后对属于同一个态的小step进行值的平均和长度的叠加。
%参数介绍：输入参数：data_z是原始数据，用来对照fitted_data
%的拟合情况。step_position是step_detect的第一步结果。
%输出参数：stepsize是一个向量，大小和step数相同，保存的是step的长度，state_num是状态数，step_std是步长的标准差。
% 本函数专门独立出来就是为了处理多个态的情况。
%% 导入数据，作图并决定有几个状态，阈值位置
% 此处做一个多态设置，如果step_position值为0，进行step_detect查找，如果有现成的step_position,就直接采用
if size(step_position,1) < 2
    step_position = J_search(data_z,0.7);
end
% 分析step_position，先拿出原始结果

fitted_data = get_fitted_data(data_z,step_position);
N = size(data_z,1);
figure;
plot(1:N,data_z,1:N,fitted_data,'LineWidth',2);
% 确定有多少个态
disp('how many states ?')
state_num = str2double(input('states = ','s'));
th_n = state_num-1;
% 预设置矩阵来保存分区出来的坐标。
state_find = zeros(size(fitted_data,1),state_num);
%用于下面的循环，神来之笔，基本思路是，阈值1把data分为比阈值1小和比阈值1大的部分，大的部分拿去给阈值2分成比阈值2小和大的部分……最后得到所有。
% 矩阵通过条件可以得到逻辑索引，但矩阵不吃行、列索引这一套。

[~,threshold_y] = ginput(th_n);
%% 根据阈值划分data，每部分的data 的值进行平均，每个态跳跃的步长和标准差。
for i = 1:th_n
    if i==1
    state_find(:,i) = fitted_data < threshold_y(i);
    elseif i>1
        state_find(:,i)=fitted_data < threshold_y(i)&fitted_data > threshold_y(i-1);
    end
    state_find(:,i+1)=fitted_data> threshold_y(i);
end
% 预设置矩阵保存每个状态的均值和标准差
state_mean = zeros(state_num,1);
state_std = state_mean;
for j=1:state_num
    a=fitted_data(state_find(:,j) == 1);
    state_mean(j) = mean(a);
    state_std(j) = std(a);
end
%计算步长
stepsize = diff(state_mean);
step_std = sqrt(state_std(1:(state_num-1)).^2 + state_std(2:state_num).^2);

%% 依据新的fitted data 作图看效果。
for k = 1:state_num
    fitted_data(state_find(:,k)==1)= state_mean(k);
end;

plot((1:N)./60,data_z,(1:N)./60,fitted_data,'LineWidth',2);

