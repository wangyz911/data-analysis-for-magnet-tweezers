%ִ��פ��ʱ��ͳ�ƵĽű�
[dwell_time_down,dwell_time_mid,dwell_time_up] = dwell_time_count(data_z);

%�õ�ʱ��ͳ�ƺ󣬴���ָ����Ϻ����н�����ϣ��õ���Ͻ��
figure;                                                                    %���Ҫ��ֱ��ͼ����Ԥ��һ��ͼ��������ø�������ͼ��
[dwell_time_fit_down,dwell_time_fit_up]=createFit(dwell_time_down,dwell_time_up);
