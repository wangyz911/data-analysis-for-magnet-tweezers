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

%%  ����find�����ҳ�����̬��������ݣ����ҷֶ�,���ڴ���ԭ�����һ���᲻��������ѡ������������˹����ᵽ-0.3
%�ҳ�����̬, ע��zmagֵ���Ǹ��ģ�Ҫ�üӺ�
%����̬���꣬���޸�
tensin_position = -0.2750 ;
tension_index = find(abs(magnet_z_position(start_number:end_number) - tensin_position) < 0.002);

%�Ա���̬���в�֣������������1���������Ƕϵ�
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
%Ԥ���ý�����󣬵�һ��Ϊ�۵�̬���ڶ���Ϊչ��һ����״̬����ȫչ��̬������
    lifetime = zeros(segment_number,4);
%% �ֱ��ÿ��̬�������ݴ�����������
%ѯ���Ƿ��������ͳ�ƵĴ���
disp('�Ƿ�����������ƣ�')
yes_lifetime = input('�ǻ��߷�','s');
if yes_lifetime == '1' 
    
    %��ѡ��ӵڼ��ο�ʼ����
    disp('�ӵڼ��ο�ʼ�����������ƣ�')
yes_segment = input('�ڼ��� = ','s');

start_segment_num = round(str2double(yes_segment));
%���֮ǰ�Ķ���0����
% lifetime(1:start_segment_num,:) = 0;
    
    for i = start_segment_num : segment_number
        %��zmag����������Z�Ĺ켣
        data_tension = DNA_z_position_modi(start_end_number(i,1):start_end_number(i,2));
        N = size(data_tension,1);
        % ��ʼʹ�ö��ַ��������õ�ȫ�����ŵ�J
        search_result = J_search(data_tension,0.7);
        %�õ�step��λ�ú͸���
        step_position = find(search_result==1);
        step_count = size(step_position,1);
        % �����ҵ���stepλ�õõ��������
        fitted_data = get_fitted_data(data_tension,step_position);
        %�����������ͼ��Ϊѡֵ��׼��
        figure;
        plot(1:N,data_tension,1:N,fitted_data,'LineWidth',2);
        %��ͼ�����Ƿ���ƣ����ͼ�񲻺þ�����������ý��й���
        disp('�Ƿ�����������ƣ�')
        disp(num2str(i))
        yes_or_no = input('��-1����-0 = ','s');
        if yes_or_no == '1'
            disp('ȡ��˵������ȡ��һ��Ϊdown ��mid����ֵ���ڶ���Ϊmid ��up ����ֵ����ʹ�ڶ���x������Ϊ�����ı߽�,���ֻ������̬��ʹ�ڶ�����ڵ�һ��')
            [threshold_x,threshold_y] = ginput(2);
            %��ȡdown̬������������������
            down_part = find(fitted_data < threshold_y(1,1));
            down_part_modi = down_part( down_part < floor(threshold_x(1,1))) ;
            lifetime(i,1) = size(down_part_modi,1);
            %�����һ��Ծ��ĸ߶ȣ������ڵ�����
            lifetime(i,3) = fitted_data(floor(threshold_x(1,1))) - fitted_data(max(down_part_modi));
            %��ȡmid̬������������������
            mid_part = find(fitted_data > threshold_y(1,1) & fitted_data < threshold_y(2,1));
            mid_part_modi = mid_part(mid_part < floor(threshold_x(2,1)) & mid_part > max(down_part_modi));
            lifetime(i,2) = size(mid_part_modi,1);
            %����ڶ���Ծ��ĸ߶�(����еĻ�)�������ڵ�����
            if isempty(mid_part) == 0
                lifetime(i,4) = fitted_data(floor(threshold_x(2,1))) - fitted_data(max(mid_part));
            end
        end
    end
    
% ��ȡ��һ�����ݵ����н���󣬱�����������Ƕ�̬���̣���ڶ������������壬�����ü���
disp('how many states ?')
states = input('��̬���̻�����̬���� states = ','s');
if states == '3'
    
    lifetime_name = strcat('lifetime3',name_save,'(',num2str(tensin_position),')');
    save(strcat(lifetime_name,'.mat'), 'lifetime');
elseif states == '2'
    lifetime_name = strcat('lifetime2',name_save,'(',num2str(tensin_position),')');
    save(strcat(lifetime_name,'.mat'), 'lifetime');
else
    disp('��û�������Ĺ���');
end
close all;
end


