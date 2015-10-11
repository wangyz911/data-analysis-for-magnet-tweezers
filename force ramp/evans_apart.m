% evans apart
F=1:11;
k0=0.0000729545;
dx=5.69018;
a=0.2651;
P =a*(   k0/0.2  *  exp(  dx*F/4.1+ 4.1*k0/(dx*0.2) *( 1- exp(dx*F/4.1)  )  )   );
plot(F,P)
