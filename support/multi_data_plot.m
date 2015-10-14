% multi data plot
% 该脚本用于将多组数据做在同一张图内，并进行一定的修饰，用于文献中呈现原始数据等。

%% 载入数据
% 准备工作，本部分只执行一次
figure;
hold on
i = 0;

% 本部分每导入一次数据，手动运行一次
switch i
    case 0
        data_0 = data_ramp+0.1*i;
        force_min = min(force_ramp);
        force_max = max(force_ramp);
        N = size(data_ramp,1);
        force_0 = linspace(force_min,force_max,N);
        i=i+1;
    case 1
        data_1 = data_ramp+0.1*i;
        force_min = min(force_ramp);
        force_max = max(force_ramp);
        N = size(data_ramp,1);
        force_1 = linspace(force_min,force_max,N);
        i=i+1;
    case 2
        data_2 = data_ramp+0.1*i;
        force_min = min(force_ramp);
        force_max = max(force_ramp);
        N = size(data_ramp,1);
        force_2 = linspace(force_min,force_max,N);
        i=i+1;
    case 3
        data_3 = data_ramp+0.1*i;
        force_min = min(force_ramp);
        force_max = max(force_ramp);
        N = size(data_ramp,1);
        force_3 = linspace(force_min,force_max,N);
        i=i+1;
    case 4
        data_4 = data_ramp+0.1*i;
        force_min = min(force_ramp);
        force_max = max(force_ramp);
        N = size(data_ramp,1);
        force_4 = linspace(force_min,force_max,N);
        i=i+1;
    case 5
        data_5 = data_ramp+0.1*i;
        force_min = min(force_ramp);
        force_max = max(force_ramp);
        N = size(data_ramp,1);
        force_5 = linspace(force_min,force_max,N);
        i=i+1;
    case 6
        data_6 = data_ramp+0.1*i;
        force_min = min(force_ramp);
        force_max = max(force_ramp);
        N = size(data_ramp,1);
        force_6 = linspace(force_min,force_max,N);
        i=i+1;
    case 7
        data_7 = data_ramp+0.1*i;
        force_min = min(force_ramp);
        force_max = max(force_ramp);
        N = size(data_ramp,1);
        force_7 = linspace(force_min,force_max,N);
        i=i+1;
    case 8
        data_8 = data_ramp+0.1*i;
        force_min = min(force_ramp);
        force_max = max(force_ramp);
        N = size(data_ramp,1);
        force_8 = linspace(force_min,force_max,N);
        i=i+1;
    case 9
        data_9 = data_ramp+0.1*i;
        force_min = min(force_ramp);
        force_max = max(force_ramp);
        N = size(data_ramp,1);
        force_9 = linspace(force_min,force_max,N);
        i=i+1;
    otherwise
        disp('need to add code');
end

        plot(force_0,data_0);
        plot(force_1,data_1);
        plot(force_2,data_2);
        plot(force_3,data_3);
        plot(force_4,data_4);
        plot(force_5,data_5);
        plot(force_6,data_6);
        plot(force_7,data_7);
        plot(force_8,data_8);
        plot(force_9,data_9);

        
% 对force ramp，首先将加载率的zmag数据替换成force。
