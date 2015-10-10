% ���ű�ȫ�ƣ� force distribution --> rate --> landscape
% �ǻ�������Proc. Natl. Acad. Sci. U.S.A. 110,
% 16432�C7.�еĹ�����д�ģ����ڴ����ж��̬�Ľṹ��չ��ʱ��εõ�����ͼ����
%��Ҫ��֪����̬�ֱ����ֵ�ֲ����������ص�������ճ���¼����ֵ,�������ͻ�����������ͳ��ʱ��Ҫ����Դ���
%����Ӧ��ÿ��̬һ�� ����NI,IN,IU,UI����һ����binֵ(F)���ڶ�����counts of F.
%matlab ����ϲ�̫����������Ҫ��origin
%% ��һ������֪��ֵ�ֲ���ת��Ϊ��Ӧ���ʷֲ���
% ��������

load ramp_data_new
NI_f = force_zmag_che(NI_z);
IN_f = force_zmag_che(IN_z);
IU_f = force_zmag_che(IU_z);
UI_f = force_zmag_che(UI_z);
%% NI ���ݷ���


% IU_h = histogram(IU_f);
% 
% UI_h = histogram(UI_f);


%������
loading_rate = 0.2;                                                         %��λ pN/s

% �ܹ���������ģ�����켣��
total_number =144;
%%%%%%%%%%%%%%%%%%%%%%��ȡֱ��ͼ�е�����
figure;
NI_h = histogram(NI_f);
%��ֵ�ֲ�ֱ��ͼ
bin_number =NI_h.NumBins;
bin_width = NI_h.BinWidth;%����
force =NI_h.BinEdges';                                                         %������ֵ����Ӧ�õ��ڹᴩ����force
NI_counts = NI_h.Values';
%��һ��������һ����evans������
NI_counts_normal = NI_counts./sum(NI_counts);

figure;
IU_h = histogram(IU_f);
%��ֵ�ֲ�ֱ��ͼ
bin_number_IU =IU_h.NumBins;
bin_width_IU = IU_h.BinWidth;%����
force_IU =IU_h.BinEdges';                                                         %������ֵ����Ӧ�õ��ڹᴩ����force
IU_counts = IU_h.Values';
%��һ��������һ����evans������
IU_counts_normal = IU_counts./sum(IU_counts);




% %������Ž���ľ���
% trajectory_number_N = zeros(bin_number,1);
% 
% NI_rate = zeros(bin_number,1);                                    %����Ҫ����һ�£���ʱĬ��Ϊ����ģ�ͣ�1-2-3���������״̬�ܹ�������ת�����ʣ�
%                                                                            %�����淴Ӧ����2,���ݱ���Ĭ���ȴ�����չ�������ٴ������۵�����
%                                                                            
% % ���㷴Ӧ����
% f = force';
% for k = 1:bin_number
%     
%     trajectory_number_N(k,1) = total_number - size( find(NI_f < f(k)),1) + size(find(IN_f < f(k)),1);
% %     trajectory_number_I(k,1) = size( find(NI_f < f),1) - size(find(IN_f < f),1) - size(find(IU_f < f),1) + size(find(UI_f < f),1);
% %     trajectory_number_U(k,1) = size(find(IU_f < f),1) - size(find(UI_f < f),1);
%     NI_rate(k,1) = loading_rate * NI_counts(k)/(trajectory_number_N(k,1)*bin_width);
% %     rate(k,2) = loading_rate * IN_counts(k)/(trajectory_number_I(k,1)*bin_width);
% %     rate(k,3) = loading_rate * IU_counts(k)/(trajectory_number_I(k,1)*bin_width);
% %     rate(k,4) = loading_rate * UI_counts(k)/(trajectory_number_U(k,1)*bin_width);
% 
% end
% 
% 
% NI_p = [-6,2];
% NI_rate_log = log(NI_rate);
% % NI_parameter_fit = Dudko_fit_unfold( force(1:(end-1)),NI_rate_log,NI_p);
% NI_total = size(NI_f,1);
% %%%%%%%%%%%%%%%% evans model
% NI_parameter_fit = evans_model( force(1:(end-1)),NI_counts(1:end),NI_p,NI_total);


% IU_p = [-7.25,10,3];
% IU_rate = log(NI_rate(6:28,3));
% [ IU_parameter_fit, IU_resnorm ] = Dudko_fit_unfold( IU_rate,force(6:28),IU_p);

% % UI_p = [-7.25,10,3];
% % UI_rate = log(NI_rate(9:18,4));
% % [ UI_parameter_fit, UI_resnorm ] = Dudko_fit_unfold( UI_rate,force(9:18),UI_p);
figure;
IU_h = histogram(IU_f);
%��ֵ�ֲ�ֱ��ͼ
bin_number =IU_h.NumBins;
bin_width = IU_h.BinWidth;                                                    %����
force =IU_h.BinEdges;                                                         %������ֵ����Ӧ�õ��ڹᴩ����force
IU_counts = IU_h.Values;
%������Ž���ľ���
trajectory_number_N = zeros(bin_number,1);
trajectory_number_I = zeros(bin_number,1);
trajectory_number_U = zeros(bin_number,1);
IU_rate = zeros(bin_number,1);                                    %����Ҫ����һ�£���ʱĬ��Ϊ����ģ�ͣ�1-2-3���������״̬�ܹ�������ת�����ʣ�
                                                                           %�����淴Ӧ����2,���ݱ���Ĭ���ȴ�����չ�������ٴ������۵�����
                                                                           
% ���㷴Ӧ����
f = force;
for k = 1:bin_number
    
    trajectory_number_N(k,1) = total_number - size( find(NI_f < f(k)),1) + size(find(IN_f < f(k)),1);
    trajectory_number_I(k,1) = size( find(NI_f < f(k)),1) - size(find(IN_f < f(k)),1) - size(find(IU_f < f(k)),1) + size(find(UI_f < f(k)),1);
    trajectory_number_U(k,1) = size(find(IU_f < f(k)),1) - size(find(UI_f < f(k)),1);
    IU_rate(k,1) = loading_rate * IU_counts(k)/(trajectory_number_I(k,1)*bin_width);
%     rate(k,2) = loading_rate * IN_counts(k)/(trajectory_number_I(k,1)*bin_width);
%     rate(k,3) = loading_rate * IU_counts(k)/(trajectory_number_I(k,1)*bin_width);
%     rate(k,4) = loading_rate * UI_counts(k)/(trajectory_number_U(k,1)*bin_width);

end

IU_p = [-3,60,0];
IU_rate_log = log(IU_rate);
IU_parameter_fit = Dudko_fit_unfold( force(1:(end-1)),IU_rate_log,IU_p);
