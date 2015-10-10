function [ length ] = ssDNA_length(f)
%force_estimate  ͨ��ssDNA force curve�Ĺ�ʽ���ڸ�����ֵ�ͼ�����ĵ�����¼���ssDNA���ȵĴ�С��
% �趨�ù�ʽ�Ĳ������˹�ʽ���÷�ΧΪ��ֵ0~100pN����Ũ�ȴ���50mM K+
% �ù�ʽ��ʹ��ʱ��Ҫ���ֶ�����bp��
h =0.34;
K=0.1;  %K+ Ũ��, ��λΪmol
a1=0.21;   a2=0.34;   a3=2.1*log(K/0.0025)/log(0.15/0.0025);
f1=0.0037;  f2=2.9;
f3=8000;
bp = 21;
length = bp*h*(a1*log(f/f1)/(1+a3*exp(-f/f2))-a2-f/f3);

end

