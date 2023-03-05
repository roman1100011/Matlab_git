%%Praktikum 12 Bandsperre
R = 42.7;
Rs = 2;
L = 2.2e-3;
C = 2.2e-6;
F = 1:1:1e6;
W = 2.*pi.*F;
Wr = 1/sqrt(L*C)
Wrf = Wr/(2*pi);
Zl = 1j.*L.*W;
Zc = 1./(1j.*W.*C);

%Amplitudengang
H_ = (Zc+Zl+Rs)./(Zc+Zl+Rs+R);
H = 20.*log10(abs((Zc+Zl+Rs)./(Zc+Zl+Rs+R)));

%Phasengang
Phas = angle(H_);

%Bandbreite
Qn = 1/(Rs+R)*sqrt(L/C)
Qz = 1/Rs*sqrt(L/C)
Q = Qz/Qn

B = Wr*sqrt(1/Qn^2-1/Qz^2)
Bf = Wrf*sqrt(1/Qn^2-1/Qz^2)


nPlots = 2;
subplot(nPlots,1,1)

semilogx(W,H)
title("Dämpfung")
xlabel("\fontsize{20}\omega")
ylabel("dB")
grid on

subplot(nPlots,1,2)
semilogx(W,rad2deg(Phas))
title("Phasengang")
xlabel("\fontsize{20}\omega")
ylabel("Deg")
grid on
