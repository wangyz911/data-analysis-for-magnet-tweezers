function  [p_fit]  = evans_model( F,counts,c,total )
%�ú�����Evans model����force ramp�����нṹ�򿪵���ֵF�ļ�¼�ֲ���ϳ�����ֵʱ�ķ�Ӧ����k �ͷ�Ӧ����x
%% �趨Evans model�е�һЩ����

% ����Evans model д�����������д���ϵ��c(1)=չ������k0_u, c(2)=dx����Ӧ���룬���������r=0.2pN/s
% ��kBT= 4.1
    function y = evans(c,F)
       y = log(c(1)) - log(0.2) + F.*c(2)./4.1 + c(1)*4.1/(c(2)*0.2) * (1 - exp( F.*c(2)./4.1 ) );

%        y = 5*c(1) * exp(F.*c(2)./4.1 + c(1)*4.1/(c(2)*0.2) * (1 - exp( F.*c(2)./4.1 ) ));
    end
ydata = counts./total;

ydata_log = log(ydata);
xdata = F;
p_fit = nlinfit(xdata,ydata_log,@evans,c);
%% ��Ͻ����ͼ
figure;
plot(xdata,ydata_log,'b*',xdata,evans(p_fit,xdata),'r');

end

