%% Praktikum 2
W = linspace(0,1000);
C1 = 470e-9;
C2 = C1;
R1 = 4.7e3;
R2=R1
%R1+(C1//(R2+C2))
Z22 = 1./(1j.*W.*C2)+R2;
Z1 =1./(1j.*W.*C1);
Zges = abs(R1+ (Z1+Z22)./(Z1.*Z22));
loglog(W,1./Zges)
grid minor