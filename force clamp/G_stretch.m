function [ G_stretch ] = G_stretch(  fc,bp, T )
% 已知force,critical force，求DNA构象转变过程force做的拉伸功G_stretch,单位是pN·nm。

% 依据如下公式计算G4构象的拉伸功，x_G4( f ) = l_0*coth( f*l0/kBT) ? kBT/f. 
l_0 = 1.7;

kBT = 1.3806504e-2*( T+273.15 ); 
x_G4 = @(f)l_0*coth(f*l_0./kBT) - kBT./f;
G_G4 = integral(x_G4,0,fc);

%依据ssDNA的经验公式计算ssDNA构象的拉伸功
% 该公式在使用时需要先手动调整bp数
h =0.34;
K=0.1;  %K+ 浓度, 单位为mol
a1=0.21;   a2=0.34;   a3=2.1*log(K/0.0025)/log(0.15/0.0025);
f1=0.0037;  f2=2.9;
f3=8000;
% bp = 21;
ssDNA_length =@(f) bp*h*(a1*log(f/f1)/(1+a3*exp(-f/f2))-a2-f/f3);
G_ss = integral(ssDNA_length,0,fc);
%计算势能
G_stretch =(G_ss - G_G4);



end

