function [ ssDNA_length ] = ssDNA_length( nt_number, f )
% ���������Ͻ���ʦ���õ�һ���µļ��㹫ʽ������֮ǰ�Ĺ����õĹ�ʽ��ͬ��Ҳ���������Ϊ����Ľ��
%% �趨һЩ��ʽ�Ĳ���
%�����,nm
n = nt_number;
%ÿ��λ������������ȣ���ssDNA,nm/nt
l_0 = 0.56;
%kuhn Ƭ��,nm
b = 1.5;
%������� ,pN
f0 = 800;
% ��������
kBT = 4.1;

%%  ��ʽ����
ssDNA_length = n*l_0*( coth(f*b/kBT)-kBT./(f*b) ).*(1+f/f0);
xlabel('force/pN');
ylabel('extension/nm');


end

