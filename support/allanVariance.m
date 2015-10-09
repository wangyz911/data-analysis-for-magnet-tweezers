function [ OAV ] = allanVariance( data )
%����һ������켣��allan����õ����������ͼ��
%% �õ�ԭʼ���ݣ�ע����������ݱ�����N x 1��ʽ������
%% allan variance �ļ��㹫ʽ
%��λ����
data_nm = data*1000;
%ȷ�����ݵĴ�С��ȷ����ֵ���ڵĴ�С
data_size = size(data,1);
N = 0:(floor(log2(data_size))-1);
m_size = 2.^N;
%% ����OAV��ʽ����
%Ԥ���÷ֶξ��󣬾�ֵ���������OAV�������
window = cell(size(m_size));
x_mean1 = zeros(data_size,1);
OAV = zeros(size(m_size,2),1);
%���趨һ��x_mean2 ����Ϊѭ��������������������ʹ��forѭ��
x_mean2 = zeros(data_size+1,1);

for n=1:size(m_size,2)
    %n�зֶη�����n���ֶη�ʽ��װ��cell��
    window(n)= {1:m_size(n)};
    %��n�ֶַ�����£�����ľ�ֵ���ж��ٸ�����mean_size
    mean_size = data_size-max(window{n});
    
    for  t = 0 :(mean_size-1)
        x_mean1(t+1) = mean(data_nm(window{n}+t));
    end
    %���չ�ʽ����OAV
    x_mean2(2:end) = x_mean1;
    OAV(n) = sum((x_mean2(2:end-1)-x_mean1(2:end)).^2/2)/mean_size;
end
%��֡�����껻���ʱ�����꣬��˫����ͼ��
    time = m_size./60;
    figure;
    loglog(time(1:end),OAV(1:end));
end

