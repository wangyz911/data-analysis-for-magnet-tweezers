%���ű���������ƽ��̬force ramp�����ݽ��зֶΣ�������ֵ��ͼ������step�ϵ���ϣ�����¼��break point ��λ��


%��ƽ��̬���������ڶ�̬���ݣ�ͳ��G4�ṹ������������ʱ�䣩
%% -------------------------��ȡ�����ļ�---------------------------
clear;
close all;
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
%%  ����find�����ҳ�force ramp ��������ݣ����ҷֶ�
%�ҳ� force_ramp ̬, ע��zmagֵ���Ǹ��ģ�Ҫ�üӺ�
%����̬���꣬���޸�
ramp_start = -0.948 ;
%�ҳ�������ramp���ֵ���ϵĲ��֣���ramp����
tension_index = find(magnet_z_position(start_number:end_number) - ramp_start > 0);

%��ramp���ֽ��в�֣������������1���������ǲ�ͬ����Ķϵ�
diff_tension_index = diff(tension_index);
%�õ��ϵ����꣬ע�������Ƕ�diff�����꣬��diff��break_point������zmag�е�����
break_point = find(diff_tension_index>10);
%��ȡÿһ�εĳ���
segment_length = zeros(size(break_point,1),1);
segment_length(1) = break_point(1);
segment_length(2:end) = diff(break_point);
%�õ��ֶ�����Ԥ�ƽ������
segment_number = size(break_point,1) + 1;
start_end_number = zeros(segment_number,2);
%�Ա���̬�����ݽ��зֶΣ��ֶε������յ㱣����start_end_number������
for i = 1:segment_number
    if i ==1
        start_end_number(i,1) = tension_index(1) + start_number;
        start_end_number(i,2) = start_end_number(i,1) + segment_length(i);
        %�Ե�һ����˵�����������㣬�յ��ǵ�һ��diff�㣨diff�����Զ�ʹ�ý����������һλ��
        
    elseif i<segment_number
        %���м�Σ���i�ε�����ǵ�i-1���յ���϶�Ӧ��diffֵ,�յ��ǵ�i�ε���������һ�εĳ���diff(break_point)
        start_end_number(i,1) = start_end_number(i-1,2) + diff_tension_index(break_point(i-1));
        start_end_number(i,2) = start_end_number(i,1)+ segment_length(i);
    else 
        start_end_number(i,1) = start_end_number(i-1,2) + diff_tension_index(break_point(i-1));
        start_end_number(i,2) = tension_index(end) + start_number;
    end
end
%��ȥ��β5���㣬����һЩ�񵴲����Ļ���
start_end_number(:,1) = start_end_number(:,1)-100;
start_end_number(:,2) = start_end_number(:,2)-10;
% �趨�������ͼ�����,���ﱣ��Ծ��λ�õ�zֵ����ʱԾ�����������������*10ȷ���㹻�Ŀռ䡣
z_NI = zeros(segment_number*10,1);
z_IN = z_NI;
z_IU = z_NI;
z_UI = z_NI;
%j �����ݴ洢����ţ���iͬ��㵫��ͬ���٣�����ȡ����Ծ����, ��J�Ǹ���¼���󣬼�¼��ŵı仯��ͨ����һ�仯�������º�ԭ��ÿ���ߵ�Ծ�����
J_record = zeros(segment_number*10,4);
j_NI = 1;
j_IN = 1;
j_IU = 1;
j_UI = 1;
loading_rate = '0.2pN';
%% �ֱ��ÿ��ramp���̽��д���
%ѯ���Ƿ���force ramp ����
disp('�Ƿ���� force ramp ���ߣ�')
yes_ramp = input('�ǻ��߷�','s');
if yes_ramp == '1' 
    
    %��ѡ��ӵڼ��ο�ʼ����
    disp('�ӵڼ��ο�ʼ���з�����(��һ��ֻ�ܴ�ͷ��ʼ)')
    yes_segment = input('�ڼ��� = ','s');
    start_segment_num = round(str2double(yes_segment));
    trajectory_count = 0;
    figure;
    
    for i = start_segment_num : segment_number
        %��zmag����������Z�Ĺ켣
        data_ramp = DNA_z_position_modi(start_end_number(i,1):start_end_number(i,2));
        N = size(data_ramp,1);
        %����������λ�ã���ת��Ϊ��ֵ
        zmag_ramp = magnet_z_position(start_end_number(i,1):start_end_number(i,2));
        % �˴����ó�ʦ�ֵ���ֵУ׼����
        force_ramp = force_zmag_che(zmag_ramp);

        %��С���˲�ƽ������
        data_ramp_d = sigDEN5(data_ramp);
        %�����������ͼ��ͬʱ���Ҳ������ֵ

        subplot(1,2,1)
        plot(1:N,data_ramp,1:N,data_ramp_d,'LineWidth',2);
        subplot(1,2,2)
        plot(1:N,force_ramp,'LineWidth',2);
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        %��ͼ�����Ƿ���ƣ����ͼ�񲻺þ�����������ý��й���
        %��Ҫ��һ���Ƿ�����ܿ���
        disp(num2str(i))
        disp('good data ? ��')
        
        good_data = input('good or bad','s');
        if good_data =='1'
        %Ȼ����ÿһ�������Ƿ��¼                    
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        %��ȡNI���ֵ�չ������
        disp('�Ƿ���δ��¼��NIչ����')
        disp(num2str(i))
        disp('NI')
        yes_or_no = input('�м���NI ','s');
        n = round(str2double(yes_or_no));
        %��ȡչ��λ�õ�x���꣬�����zmag������ͳһ�������ֵ������������
        if yes_or_no == '0'
            z_NI(j_NI)=0;
            j_NI = j_NI+1;
        %����һ����;�˳�����
        elseif strcmp(yes_or_no,'exit')
              break;
        else
            trajectory_count = trajectory_count+1;
            [jump_x,~] = ginput(n);
            %��ȡչ��˲���Z��λ�ã�����������
            for t =1:n
                z_NI(j_NI+t-1) = zmag_ramp(round(jump_x(t,1)));
            end
            j_NI = j_NI+n;
        end
        J_record(i,1) = j_NI;
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        % ��������ȡIN չ��������
        disp('�Ƿ���δ��¼��INչ����')
        disp(num2str(i))
        disp('IN')
        yes_or_no = input('�м���IN ','s');
        n = round(str2double(yes_or_no));
        %��ȡչ��λ�õ�x���꣬�����zmag������ͳһ�������ֵ������������
        if yes_or_no == '0'
            z_IN(j_IN)=0;
            j_IN = j_IN+1;
        %����һ����;�˳�����
        elseif strcmp(yes_or_no,'exit')
              break;
        else
            [jump_x,~] = ginput(n);
            %��ȡչ��˲�����ֵ������������
            for t =1:n
                z_IN(j_IN+t-1) = zmag_ramp(round(jump_x(t,1)));
            end
            j_IN = j_IN+n;
        end
        J_record(i,2) = j_IN;
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        % ��������ȡIU չ��������
        disp('�Ƿ���δ��¼��IUչ����')
        disp(num2str(i))
        disp('IU')
        yes_or_no = input('�м���IU ','s');
        n = round(str2double(yes_or_no));
        %��ȡչ��λ�õ�x���꣬�����zmag������ͳһ�������ֵ������������
        if yes_or_no == '0'
            z_IU(j_IU)=0;
            j_IU = j_IU+1;
        %����һ����;�˳�����
        elseif strcmp(yes_or_no,'exit')
              break;
        else
            [jump_x,~] = ginput(n);
            %��ȡչ��˲�����ֵ������������
            for t =1:n
                z_IU(j_IU+t-1) = zmag_ramp(round(jump_x(t,1)));
            end
            j_IU = j_IU+n;
        end
        J_record(i,3) = j_IU;
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
                % ��������ȡIN չ��������
        disp('�Ƿ���δ��¼��UIչ����')
        disp(num2str(i))
        disp('UI')
        yes_or_no = input('�м���UI ','s');
        n = round(str2double(yes_or_no));
        %��ȡչ��λ�õ�x���꣬�����zmag������ͳһ�������ֵ������������
        if yes_or_no == '0'
            z_UI(j_UI)=0;
            j_UI = j_UI+1;
        %����һ����;�˳�����
        elseif strcmp(yes_or_no,'exit')
              break;
        else
            [jump_x,~] = ginput(n);
            %��ȡչ��˲�����ֵ������������
            for t =1:n
                z_UI(j_UI+t-1) = zmag_ramp(round(jump_x(t,1)));
            end
            j_UI = j_UI+n;
        end
        J_record(i,4) = j_UI;
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        %����ѭ�����ܿ���
        elseif strcmp(good_data,'exit')
              break;

        end
    end
    
%% ��ȡ��һ�����ݵ����н���󣬱�����
    %����0Ԫ�أ��������õĽ����
    z_NI(z_NI==0)=[];
    z_IN(z_IN==0)=[];
    z_IU(z_IU==0)=[];
    z_UI(z_UI==0)=[];
    force_ramp_name = strcat('force_ramp_NI',name_save,'_',loading_rate);
    save(strcat(force_ramp_name,'.mat'), 'z_NI','z_IN','z_IU','z_UI','J_record','trajectory_count');


close all;
end

