%schaltung ist eine RLC spannungsteiler 
%% Komponenten
C = 2.2e-6;
L = 2.2e-3;
R = 20;
f = 0.1:0.01:4e3;
W = 2*pi*f;
Zc = 1./(1j.*W.*C);
Zl = W.*L.*1j;
Rges = Zc+Zl+R;
Amp = Zc./Rges;
plot(f,abs(Amp))






%% CLR Filter
C1 = 2.2e-6;
L1 = 2.2e-3;
R1 = 20;
f1 = 1000:0.01:10e3;
W1 = 2.*pi.*f1;
Zc1 = 1./(1j.*W1*C1);
Zl1 = 1j.*W1*L1;
amp1 = R1./(Zc1+Zl1+R1);
loglog(f1,abs(amp1))
xlabel("Frequency [Hz]")
ylabel("dB")
grid("minor")
