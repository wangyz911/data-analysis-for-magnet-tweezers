function [ G0,G0_uf,nt ] = G0_modi( lnK,F,T,dx_uf)
%����������������������������������칦��Ӱ�죬 �õ���Ȼ����µ���������ֵ��
% ����˵����KΪk_f/k_u��Fα��Ӧ����ֵ������ntΪ�����ĺ����������ṹ�ĺ�������������TΪ�¶�
%% ���Ƚ������
kBT = 1.3806504e-2*( T+273.15 ); 
dx = 8; % ���ҽ�dx��Ϊ8nm��Ѱ���Ϊ�͹۵ķ���
% dx = dx_u - dx_f����û�е���


p = polyfit(F,lnK,1);
% fit_line = p(1).*F + p(2);
% ������״̬��������ܲ�
LNK = @(F)p(1)*F + p(2);
F_0 = fzero(LNK,0);
    disp('������G4�ṹnt��');
    nt = input('nt = ','s');
    nt = str2double(nt);

G0 = (F_0*dx - G_stretch(F_0, nt,T))/kBT;
G0_uf = (F_0*dx_uf - G_stretch(F_0, nt,T))/kBT;
    


end

