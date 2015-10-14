function [ start_end_number,segment_number ] = data_separation_for_ramp( ramp_start, magnet_z_position, start_number )
%   �����������ݷֶνű��ĺ�����ʽ�����ڽ�ÿһ��rampʵ��������зֿ���
%%  ����find�����ҳ�force ramp ��������ݣ����ҷֶ�
%�ҳ� force_ramp ̬, ע��zmagֵ���Ǹ��ģ�Ҫ�üӺ�
%����̬���꣬���޸�
% ramp_start = -0.948 ;
%�ҳ�������ramp���ֵ���ϵĲ��֣���ramp����
tension_index = find(magnet_z_position - ramp_start > 0);

%��ramp���ֽ��в�֣��ų���е������С���仯�������������10�������һ���ǲ�ͬ����Ķϵ�
diff_tension_index = diff(tension_index);
%�õ��ϵ����꣬ע�������Ƕ�diff�����꣬��diff��break_point������zmag�е�����
break_point = find(diff_tension_index>10);
%��ȡÿһ�εĳ���
segment_length = zeros(size(break_point,1),1);
segment_length(1) = break_point(1);
segment_length(2:end) = diff(break_point);
%�õ��ֶ�����Ԥ�ƽ������
segment_number = size(break_point,1) + 1;
start_end_number = zeros(segment_number,2);
%�Ա���̬�����ݽ��зֶΣ��ֶε������յ㱣����start_end_number������
for i = 1:segment_number
    if i ==1
        start_end_number(i,1) = tension_index(1) + start_number;
        start_end_number(i,2) = start_end_number(i,1) + segment_length(i);
        %�Ե�һ����˵�����������㣬�յ��ǵ�һ��diff�㣨diff�����Զ�ʹ�ý����������һλ��
        
    elseif i<segment_number
        %���м�Σ���i�ε�����ǵ�i-1���յ���϶�Ӧ��diffֵ,�յ��ǵ�i�ε���������һ�εĳ���diff(break_point)
        start_end_number(i,1) = start_end_number(i-1,2) + diff_tension_index(break_point(i-1));
        start_end_number(i,2) = start_end_number(i,1)+ segment_length(i);
    else 
        start_end_number(i,1) = start_end_number(i-1,2) + diff_tension_index(break_point(i-1));
        start_end_number(i,2) = tension_index(end) + start_number;
    end
end
%��ȥ��β5���㣬����һЩ�񵴲����Ļ���
start_end_number(:,1) = start_end_number(:,1)-100;
start_end_number(:,2) = start_end_number(:,2)-10;


end

