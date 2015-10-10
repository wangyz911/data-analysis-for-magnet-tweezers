function parameter_fit = Dudko_fit_unfold( F,rate,parameter)
%������������֪��Ӧ��������ֵ�ı仯����Ӧ����dG �ͷ�Ӧ����x��ע������ͷ������ʱ���Ų�һ��
%˼·����Ҫ����С���˷��ķ����Ժ�����ϣ������ܸ��ӣ�����д�����Ƚ��鷳��


%% �趨��ʼ����
% v = 2/3;
% k0 = parameter(1);
% dG = parameter(2);
% dx = parameter(3);
% K = F/z_mean;

%% ��Ϻ�������
xdata = F;
ydata = rate';%ע������input��data ʵ����ln(k0)������Ϻ���������ʽ����һ�¡�
%��Ϻ������壬����p(1) = lnk0��p(2)=dG,p(3)=dx
    function y = D_fit(p,xdata)
        y = p(1)+log((1 + xdata.*p(3)^2/(3*p(2)*1.3) - 2*xdata.*p(3)/(3*p(2)) .* (1+ xdata.*p(3)^2/(6*p(2)*1.3)) ))/2 ...
            +(p(2) * (1-(1+xdata.*p(3)^2/(3*p(2)*1.3) - 2*xdata.*p(3)/(3*p(2)) .* (1+ xdata.*p(3)^2/(6*p(2)*1.3)) ).^(1.5)));
    end
p = parameter;     %first guess

p_fit = nlinfit(xdata,ydata,@D_fit,p);


parameter_fit = p_fit;

%% ��Ͻ����ͼ
figure;
plot(xdata,ydata,'b*',xdata,D_fit(p_fit,xdata),'r');



end

