function [ dE, dx, S] = E_landscape( area_force )
%������������֪�۵�/չ��̬��hist�������ֵ���������������ݡ�
%����Ϊ����N*3�����飬���зֱ���A״̬�����B״̬�������Ӧ��ֵ��
%���Ϊ1*3���飬�ֱ�ΪdE,dX, ���ݵĺû�����S��
%% ��һ�����Ϊ���ʡ�
area_force_t=area_force';
A=area_force_t(1,:);
B=area_force_t(2,:);
F=area_force_t(3,:);
sum = A+B;
A_normal = A./sum;
B_normal = B./sum;
%% �������������ݵ�ֵ�������
E_point=B_normal./A_normal;
E_point_ln=log(E_point);
[fit,S] = polyfit(F,E_point_ln,1);                                         %����ʽ��ϣ����ص�fitΪ����Ϊ1+1���������ֱ��Ǵ����ɸߵ��͵�ϵ����S Ϊ��ϵ����Ŷȷ�����
dE=fit(2);                                                                 %������
dx=fit(1);
% erA=area_force_t(2,:)./A;
% erB = area_force_t(4,:)./B;
% errorE=sqrt(erA.^2+erB.^2).*E_point;                                  %������ĺϳ�

%% ��ͼ��ʾ���
figure;
hold on;
hf=errorbar(E_point,F,0.05*F,'r*');
Fs=F(1):0.01:F(end);
plot(exp(dE+Fs.*dx),Fs);


end

