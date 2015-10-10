%% �Եõ������ݽ����˲��������������ָ�����
data_d=sigDEN(data');

%�趨������Ծ���м���ֵ
 threshold=(max(data_d)+min(data_d))/2;
 %Ԥ��һ������������,������ֵ���Եط���
count=data_d-threshold;
count=medfilt1(count,20);
up=find(count>0);
count(up)=1;
down=find(count<=0);
count(down)=-1;
%������ֵ�˲�Ĩƽ������ɵĸ���
step=medfilt1(count,10);
%���ô�λ���,�ҵ�������/�½��أ�������ֵ�˲��Ĺ�ϵ������/�½��ش��˻�Ϊ0��
m=size(step,2)+1;
edge=zeros(m,1)';

for n=2:(m-1);
    edge(n-1)=step(n)*step(n-1);
end 
%�ҵ�ֵΪ0�ĵ㣨���ǳɶԳ��֣���ÿ��һ������������õ���������̬��פ��ʱ��
change=find(edge==0);
i=size(change,2);
dwell_time_up=zeros(i/2,1)';
dwell_time_down=zeros(i/2,1)';
j=1;%��һ�����Ѿ���ѭ���������
% %������㴦û��0����һ��פ��ʱ��ֱ���õ�һ��change��ֵ,��һ�ν�ȡ������������Ҫ��
% dwell_time_up(1)=change(1);

for k=3:4:(size(change,2)-2)
        dwell_time_up(j)=change(k+2)-change(k);
            j=j+1;
end
j=1;
for k=1:4:(size(change,2)-2)
        dwell_time_down(j)=change(k+2)-change(k);
            j=j+1;
end
%����������ǵ������Ϊ�����أ����������½��أ���ô��ԭ�����µ�פ��ʱ��Ե����ɡ�
if step(5)==-1
    interchange=dwell_time_up;
    dwell_time_up=dwell_time_down;
    dwell_time_down=interchange;
end
%ɾ��Ϊdwell time��Ϊ��Ĳ��֣�����Ӱ��ֲ���
cut=find(dwell_time_up,1,'last');
dwell_time_up((cut+1):end) = [];
cut=find(dwell_time_down,1,'last');                                        %����Ϊ��Ĳ��ֲ�Ҫ
dwell_time_down((cut+1):end) = [];
dwell_time_up=dwell_time_up./60;
dwell_time_down=dwell_time_down./60;
%�������ֲ��������
figure;                                                                    %���Ҫ��ֱ��ͼ����Ԥ��һ��ͼ��������ø�������ͼ��
[dwell_time_fit_down,dwell_time_fit_up]=createFit(dwell_time_down,dwell_time_up);

figure;
plot(edge+0.5);
hold on
plot(data);
% plot(step);
axis([0 35000 -2 3]);
