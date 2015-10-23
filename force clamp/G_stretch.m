function [ G_stretch ] = G_stretch(  fc,bp, T )
% ��֪force,critical force����DNA����ת�����force�������칦G_stretch,��λ��pN��nm��

% �������¹�ʽ����G4��������칦��x_G4( f ) = l_0*coth( f*l0/kBT) ? kBT/f. 
l_0 = 1.7;

kBT = 1.3806504e-2*( T+273.15 ); 
x_G4 = @(f)l_0*coth(f*l_0./kBT) - kBT./f;


%����ssDNA�ľ��鹫ʽ����ssDNA��������칦
% % �뾭�鹫ʽ
% h =0.34;
% K=0.1;  %K+ Ũ��, ��λΪmol
% a1=0.21;   a2=0.34;   a3=2.1*log(K/0.0025)/log(0.15/0.0025);
% f1=0.0037;  f2=2.9;
% f3=8000;
% % bp = 21;
% ssDNA_length =@(f) bp*h*(a1*log(f/f1)/(1+a3*exp(-f/f2))-a2-f/f3);
%% ����FJCģ�͵Ĺ�ʽ
%�����,nm
n = bp;
%ÿ��λ������������ȣ���ssDNA,nm/nt
l_1 = 0.56;
%kuhn Ƭ��,nm
b = 1.5;
%������� ,pN
f0 = 800;

%  ��ʽ����
ssDNA_length2 =@(f) n*l_1*( coth( f*b/kBT )- kBT./(f*b) ).*(1+f/f0);
%% �������칦
G_G4 = integral(x_G4,0,fc);
G_ss = integral(ssDNA_length2,0,fc);
%��������
G_stretch =(G_ss - G_G4);



end

