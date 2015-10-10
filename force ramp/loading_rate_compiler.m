clc;
%% �趨�����ʣ���ֵ��Χ
loading_rate_step=0.1;
force_max=15;
force_min=1;
delay_time=0.5;
%ÿ������ʵ���ÿ�������ʳ���ÿ���ȴ�ʱ��
loading_rate = loading_rate_step/delay_time;


%����
step_number=floor((force_max-force_min)/loading_rate);


force_series=(0:step_number)*loading_rate + force_min;
force_series=force_series';

%��Ϲ�ʽ�а���force���zֵ
z_mag_series_origin=0.22238*log((force_series-0.3474)/46.24946);%��������ϵ�һ����ʽ�������Ժ󻹻���ϳ�������ʽ��˵

z_mag_series=round(z_mag_series_origin*500)/500;   %��Ϊ��˵z_mag����С��Чλ����0.002


%����������,�˴���λΪ������ע��
delay_press=10;
delay_step=delay_time*1000;
delay_form=60000;

delay_press_str=num2str(delay_press);
delay_step_str=num2str(delay_step);
delay_form_str=num2str(delay_form);

fileID = fopen('temp_code.txt','w');
%ע��������
fprintf(fileID,strcat('//r=',num2str(loading_rate),'pN/s','\r\n'));

for i=1:step_number+1
    %ÿ�θ�ֵǰ��ע�ͱ�����Ŀ��ֵ
    z_mag_temp_str=sprintf('%.3f',z_mag_series(i));
    fprintf(fileID,strcat('//',z_mag_temp_str,'\r\n'));
    %���������
    fprintf(fileID,'LeftClick 1\r\n');
    %������ͣ��
    fprintf(fileID,strcat('Delay',32,delay_press_str,'\r\n'));
    %�˸�
    fprintf(fileID,'KeyPress "BackSpace", 7\r\n');
    %������ͣ��
    fprintf(fileID,strcat('Delay',32,delay_press_str,'\r\n'));
    
    for j=1:6
        fprintf(fileID,strcat('KeyPress "',z_mag_temp_str(j),'", 1\r\n'));
    end
    
    fprintf(fileID,strcat('Delay',32,delay_press_str,'\r\n'));
    fprintf(fileID,'KeyPress "Enter", 1\r\n');
    fprintf(fileID,strcat('Delay',32,delay_press_str,'\r\n'));
    
    fprintf(fileID,strcat('Delay',32,delay_step_str,'\r\n'));
    
    
    fprintf(fileID,'\r\n');
end
