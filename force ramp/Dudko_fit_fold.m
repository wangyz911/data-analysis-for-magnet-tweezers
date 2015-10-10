function [ parameter_fit, resnorm ] = Dudko_fit_fold( rate,F,parameter )
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
ydata = rate;

    function y = D_fit(p,xdata)
        y = p(1)*(1 + xdata*p(3)^2/(3*p(2)*1.3) + 2*xdata*p(3)/(3*p(2)) * (1+ xdata*p(3)^2/(6*p(2)*1.3)) )^(0.5)...
            * exp(p(2) * (1-(1 + xdata*p(3)^2/(3*p(2)*1.3) + 2*xdata*p(3)/(3*p(2)) * (1+ xdata*p(3)^2/(6*p(2)*z*1.3)) )^(1.5)));
    end
p = parameter;     %first guess

[p_fit,resnorm] = lsqcurvefit(@D_fit,p,xdata,ydata);


parameter_fit = p_fit;




end




