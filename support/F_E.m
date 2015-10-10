% G4 data analysis
%% -------------------------��ȡ�����ļ�---------------------------
clear;close all;
disp('###########################�����������############################')
disp('---------------һ����ȡС��XYZ�����ݣ�-------------------------------')
[FileName,PathName] = uigetfile('.gr','λ�������ļ�');                      %��׼�Ĵ��ļ��Ի��򣬵�һ����Ϊ�ļ���ʽ���ڶ�����Ϊ�Ի���������
file=strcat(PathName,FileName);                                            %����·�������ļ�����Ϊ������׼����
fid=fopen(file, 'r');                                                      %��ȡ�ļ����ļ�����·�����ϡ�
standard_string='abcd';      %ΪʲôҪ�ĸ��ַ�
judge=~strcmp(standard_string(2:4),'-a!');
while  judge
    fgetl(fid);
    standard_string=fread(fid,4,'*char')';                                 %4��һ�����ζ�ȡ�ļ��е��ַ�����strcmp��������ж�������ʼ��'-a!'
    judge=~strcmp(standard_string(2:4),'-a!');
end
fgetl(fid);                                                                %ȥ���ַ�ͷ����ʼ��ȡ����
DNA_x_position_array=textscan(fid,'%f%f');                                 %��ʼ��ȡ����,����һ���������������ɵ�Ԫ�����󣬵�һ����������֡���У��ڶ�����λ����Ϣ
frame_seriels=DNA_x_position_array{1,1};                                   %��ȡDNAx����֡����
DNA_x_position=DNA_x_position_array{1,2};                                  %��ȡx����λ����Ϣ
standard_string='abcd';
judge=~strcmp(standard_string(2:4),'-a!');
while  judge
    fgetl(fid);
    standard_string=fread(fid,4,'*char')';
    judge=~strcmp(standard_string(2:4),'-a!');
end
fgetl(fid);
DNA_y_position_array=textscan(fid,'%f%f');                                 %ͬ����ȡy������Ϣ
DNA_y_position=DNA_y_position_array{1,2};
standard_string='abcd';
judge=~strcmp(standard_string(2:4),'-a!');
while  judge
    fgetl(fid);
    standard_string=fread(fid,4,'*char')';
    judge=~strcmp(standard_string(2:4),'-a!');
end
fgetl(fid);
DNA_z_position_array=textscan(fid,'%f%f');                                 %��ȡz��������
DNA_z_position=DNA_z_position_array{1,2};
% ��ȡ�ο�С���XYZ��Ϣ
disp('---------------һ����ȡ�ο�С��XYZ�����ݣ�-------------------------------')
[FileName2,PathName2] = uigetfile('.gr','λ�������ļ�');                      %��׼�Ĵ��ļ��Ի��򣬵�һ����Ϊ�ļ���ʽ���ڶ�����Ϊ�Ի���������
file=strcat(PathName2,FileName2);                                            %����·�������ļ�����Ϊ������׼����
fid=fopen(file, 'r');                                                      %��ȡ�ļ����ļ�����·�����ϡ�
standard_string='abcd';      %ΪʲôҪ�ĸ��ַ�
judge=~strcmp(standard_string(2:4),'-a!');
while  judge
    fgetl(fid);
    standard_string=fread(fid,4,'*char')';                                 %4��һ�����ζ�ȡ�ļ��е��ַ�����strcmp��������ж�������ʼ��'-a!'
    judge=~strcmp(standard_string(2:4),'-a!');
end
fgetl(fid);                                                                %ȥ���ַ�ͷ����ʼ��ȡ����
ref_DNA_x_position_array=textscan(fid,'%f%f');                                 %��ʼ��ȡ����,����һ���������������ɵ�Ԫ�����󣬵�һ����������֡���У��ڶ�����λ����Ϣ
ref_frame_seriels=ref_DNA_x_position_array{1,1};                                   %��ȡDNAx����֡����
ref_DNA_x_position=ref_DNA_x_position_array{1,2};                                  %��ȡx����λ����Ϣ
standard_string='abcd';
judge=~strcmp(standard_string(2:4),'-a!');
while  judge
    fgetl(fid);
    standard_string=fread(fid,4,'*char')';
    judge=~strcmp(standard_string(2:4),'-a!');
end
fgetl(fid);
ref_DNA_y_position_array=textscan(fid,'%f%f');                                 %ͬ����ȡy������Ϣ
ref_DNA_y_position=ref_DNA_y_position_array{1,2};
standard_string='abcd';
judge=~strcmp(standard_string(2:4),'-a!');
while  judge
    fgetl(fid);
    standard_string=fread(fid,4,'*char')';
    judge=~strcmp(standard_string(2:4),'-a!');
end
fgetl(fid);
ref_DNA_z_position_array=textscan(fid,'%f%f');                                 %��ȡz��������
ref_DNA_z_position=ref_DNA_z_position_array{1,2};
%��ȡ��������
disp('---------------������ȡ����z�����ƶ������ݣ�--------------------------')
[FileName3,PathName3] = uigetfile('.gr','�����ƶ��������ļ�');
file=strcat(PathName3,FileName3);fid=fopen(file, 'r');
standard_string='abcd';
judge=~strcmp(standard_string(2:4),'-a!');
while  judge
    fgetl(fid);
    standard_string=fread(fid,4,'*char')';
    judge=~strcmp(standard_string(2:4),'-a!');
end
fgetl(fid);
magnet_z_position_array=textscan(fid,'%f%f');                              %��ȡ������z�����ƶ������ݣ�����֡������Ϣ��
frame_seriels_magnet=magnet_z_position_array{1,1};
frame_seriels_magnet_all=size(frame_seriels_magnet);
magnet_z_position=magnet_z_position_array{1,2};
standard_string='abcd';
judge=~strcmp(standard_string(2:4),'-a!');
while  judge
    fgetl(fid);
    standard_string=fread(fid,4,'*char')';
    judge=~strcmp(standard_string(2:4),'-a!');
end
fgetl(fid);
magnet_z_rotation_array=textscan(fid,'%f%f');                              %��ȡ������Z����Ťת������
magnet_z_rotation=magnet_z_rotation_array{1,2};
standard_string='abcd';
judge=~strcmp(standard_string(2:4),'-a!');
while  judge
    fgetl(fid);
    standard_string=fread(fid,4,'*char')';
    judge=~strcmp(standard_string(2:4),'-a!');
end
fgetl(fid);
magnet_focus_array=textscan(fid,'%f%f');                                   %��ȡ������ƽ��λ�õ�����
magnet_focus=magnet_focus_array{1,2};                                      %���Ϲ��̸���Ƶ�������Խ������ݲ���д�ɺ����ļ���
%%data show
number_array=size(DNA_z_position);
number=number_array(1,1);
time=(1:number)./60./60;                                                   %ʱ�䵥λ��֡ת��������
plot(DNA_z_position);
[start_number,start_y]=ginput(1);
start_number=floor(start_number);
if start_number<1
    start_number=1;
end
[end_number,end_y]=ginput(1);                                          %���ȡ�����öϵ�  ��
end_number=floor(end_number);                                          %����ȡ��
if end_number>number
    end_number=number;
end
name_length=size(FileName,2);
name_save=FileName(13:name_length-3);
figure('Name',name_save);
% subplot(2,3,1);
% plot(time(1:end_number),DNA_x_position(1:end_number));
% xlabel('time(min)');ylabel('x');
% subplot(2,3,2);
% plot(time(1:end_number),DNA_y_position(1:end_number),'m');
% xlabel('time(min)');ylabel('y');
% title(name_save);
% subplot(2,3,3);
% plot(time(1:end_number),DNA_z_position(1:end_number));
% xlabel('time(min)');ylabel('z');
% subplot(2,3,4);
% plot(time(1:end_number),magnet_focus(1:end_number));
% xlabel('time(min)');ylabel('focus');
% subplot(2,3,5);
% plot(time(1:end_number),magnet_z_rotation(1:end_number));
% xlabel('time(min)');ylabel('rotation');
% subplot(2,3,6);
% plot(time(1:end_number),magnet_z_position(1:end_number));
% xlabel('time(min)');ylabel('magnet');
% saveas(gcf,strcat(name_save,'_origin','_',date,'.fig'));
% saveas(gcf,strcat(name_save,'_origin','_',date,'.tiff'),'tiffn');
% save (strcat('varible_',name_save,'_origin',date));

%% eliminate the effects of drifting.
DNA_z_position_modi=DNA_z_position - ref_DNA_z_position;
fit_DNA=medfilt1(DNA_z_position_modi,20);
DNA_z_wavelet=sigDEN5(DNA_z_position_modi);
subplot(2,1,1);
plot(time(start_number:end_number),DNA_z_position_modi(start_number:end_number),'b');
hold on
plot(time(start_number:end_number),DNA_z_wavelet(start_number:end_number),'r');
xlabel('time(min)');ylabel('z_position_modi');
hold off
subplot(2,1,2);
plot(time(start_number:end_number),magnet_z_position(start_number:end_number));
xlabel('time(min)');ylabel('magnet');
% subplot(3,1,3)
% plot(time(start_number:end_number),fit_DNA(start_number:end_number));
% xlabel('time(min)');ylabel('z_position_filt');
%%  F-E ����
% ȷ���Ƿ����F_E����
disp('---------------��Ҫ��F_E������0-����Ҫ��1-��Ҫ')
yes_or_no_string1=input('judge1=','s');                                    %*
if yes_or_no_string1=='1'                                                  %�����˾ͻ�ͼ��û����Ͳ���
    new_file_name=strcat(PathName,name_save,'new_FE','_',date,'\');
    mkdir(new_file_name);                                                      %�½��ļ���
    cd(new_file_name);                                                         %�����½��ļ���
    subplot(2,1,1);
    plot(DNA_z_position_modi(start_number:end_number),'DisplayName','DNA_z_position','YDataSource','DNA_z_position');grid on;
    hold on
    plot(DNA_z_wavelet(start_number:end_number),'r');
    ylabel('z');
    hold off
    subplot(2,1,2);
    plot(magnet_z_position(start_number:end_number),'LineWidth',1,'DisplayName','magnet_z_position','YDataSource','DNA_z_position');grid on;
    ylabel('magnet_z_position');
    %�趨��������ĳ�ʼ�������Լ�Ԥ���þ���
    disp('---------------�����������¶�');
    T_str=input('T =','s');
    T = str2double(T_str);
    
    DNA_length=1.034;                                                           %����L���������ȣ���λ��΢��
    Kb_multi_T=1.3806504e-2*( T + 273.15);
    %��������
    stepsize = 0.002;
    %����Ǵӱ������ɳڣ������Ӹ���
    disp('---------------UP OR DOWN ?');
    up_down=input('STATE =','s');
    if strcmp(up_down,'down')
        stepsize = -stepsize;
    end
    
    
    
    %     start_z = input('�����F=1pN����zmagֵ������ = ','s');
    %     start_z = '0.2';
    %     DNA_start = find(abs(magnet_z_position + str2double(start_z)) < 10e-3);
    DNA_z_position_cali = DNA_z_position_modi +1;
    deal_number=1;
    DNA_y_position_modi = DNA_y_position-ref_DNA_y_position;                     %������������²��䶨��y,�ٶ�y������û��Ư�ƣ�
    %     DNA_x_position_modi=DNA_x_position-ref_DNA_x_position;                     %����x
    
    
    %     fig=3;                                                                     %�趨ͼ���ź���ͼ���
    %     subfig=1;
    force_number=1;                                                                  %����ţ���ֵ������Ҫ��
    
    %����F_E�����������յ�
    disp('---------------����F_Eͳ�Ƶ������յ�');
    yes_or_no_string2=input('judge1=','s');                                    %*
    if yes_or_no_string2=='1'                                                  %�˴��Ǳ�Ҫ��ͣ�٣�����ȡ�㺯�����������ջ�����ͼ�ϣ�����ֻ������ͼ��ȡ��
        [step_data_x,step_data_y] = ginput(2);
        %�õ���ѡ�����յ��ֵ��xֵ����Ҫ��
        step_first_y=magnet_z_position(floor(step_data_x(1,1))+start_number);                           %��ȡ���ͼ���������0��ʼ����Ҫ��ȡ�������������ϵ����кţ���Ҫ����start_number���ܶ�ȡ��ȷ�źš�
        step_end_y=magnet_z_position(floor(step_data_x(2,1))+start_number);
        
        %��ʼ����λ�õ�������y����
        mean_mag = step_first_y(1,1);
        %Ԥ������ֵ���ߵľ��󣬴�С�ɷ��������̨�״�С����
        force_curve=zeros(ceil((step_end_y-step_first_y)/abs(stepsize)),6);                                                   %��ֵ���ߣ��ֱ��������棬��ֵ��У׼���ȵ���ֵ�����ȡ�
        %ѭ���������ò�����������Ӱ������ѭ���в��Ⱥŵķ��򣬷ǳ����ǡ�
        while(mean_mag*stepsize < step_end_y*stepsize)
            %�õ�һ��̨�׵����,ע������Ӧ�ÿ�����Ϊ�ķֽ磬�ҵ���̨��Ӧ������ѡȡ�ķ�Χ�ڡ�
            step_mag = find(abs(magnet_z_position-mean_mag)<10E-3);
            step_mag = step_mag(step_mag < floor(step_data_x(2,1))+start_number & ...
                                step_mag > floor(step_data_x(1,1))+start_number);
            %�õ���Ŷ�Ӧ��data_z, data_y ,����λ��
            
            step_y = DNA_y_position_modi(step_mag);
            step_z = DNA_z_position_cali(step_mag);
            %��������񶯷����Լ�Z�����ֵ
            y_cor = var_correction(step_y,T);
            %���ϴ���İ뾶��
            z_mean = mean(step_z)+0.5;
            %���ù�ʽ������ֵ
            step_force = Kb_multi_T * z_mean * 1.0e-3/y_cor;
            step_force2 = Kb_multi_T * z_mean * 1.0e-3/var(step_y);
            force_curve(force_number,1)=force_number;                      %force_curve��1�б������
            force_curve(force_number,2)=z_mean -0.5;                             %force_curve ��2������Zֵ��Ҳ����extension���˴�Ӧ��ȥ����뾶
            force_curve(force_number,3)=step_force;                             %��3��������������ֵ����force
            force_curve(force_number,4)=mean_mag;                          %��4������Zmag
            force_curve(force_number,5)=step_force2;
            force_curve(force_number,6)=y_cor;
            force_curve(force_number,7)=var(step_y);
            %�޸Ĳ�����������һѭ��
            mean_mag = mean_mag + stepsize;
            force_number = force_number + 1;
        end
    end
    %���õ���F-E������ͼ
    force_line = force_curve(:,3);
    extension_line = force_curve(:,2);
    %����δ��ֵ��Ϊ��ĵ�
    force_line(force_line==0)=[];
    extension_line(extension_line==0)=[];
    %δУ���Ա�ͼ
    %��ͼ
    figure;
    plot(extension_line ,force_line,'-*');
    title('force-extension');
    xlabel('extension');
    ylabel('force');
    %����������
    disp('�Ƿ񱣴��������')
    data_save = input('��1 ��0  =','s');
    if data_save == '1'
        %�жϺ�׺��
        if stepsize > 0
            routine = 'up';
        else routine = 'down';
        end
        %�����ļ���,�����ļ�
        force_name = strcat('force_extension_',FileName(13:15),'_ref',FileName2(15:16),'_',routine,'.mat');
        save(force_name,'force_curve');                                     %������ֵ-������Ϣ
        data_name = strcat('data_',FileName(13:15),'_ref',FileName2(15:16),'_',routine,'.mat');
        save(data_name,'DNA_y_position_modi','DNA_z_position_cali','magnet_z_position',...
            'force_curve','force_line','extension_line','T','stepsize','start_number','end_number','DNA_length');
        

    end
end







