%执行驻留时间统计的脚本
[dwell_time_down,dwell_time_mid,dwell_time_up] = dwell_time_count(data_z);

%得到时间统计后，代入指数拟合函数中进行拟合，得到拟合结果
figure;                                                                    %拟合要做直方图，先预置一个图出来，免得覆盖其他图像。
[dwell_time_fit_down,dwell_time_fit_up]=createFit(dwell_time_down,dwell_time_up);
