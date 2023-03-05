%% Lowpass
C = 253e-9
L = 10e-6
R = 2
F = 1:1:300e3;
W = 2*pi*F;
Zc = 1./(1j*W*C);
Zl = 1j*W*L;
H = abs(Zc./(Zc+R+Zl));


nPlots = 1;
subplot(nPlots,1,1)

plot(W,H)
title("Dämpfung")
xlabel("\fontsize{20}\omega")
ylabel("dB")
grid on

%% C1+(R1//C2)
C1 = 1e-6;
C2 =    C1;
R1 = 2.7e3;
W = 100*pi;
Z = 1/(1j*W*C1)+(1/(1/R1+C2*W*1j))
fprintf("phi =%f",rad2deg(angle(Z)))
abs(Z)

%% (C1//(R1+L1))+(L2//(R2+C2))
c1 = 1/(1j*0.02);
c2 = 1/(1j*0.025);
l1 = 1j*50;
l2 = 1j*100;
r1 = 100;
r2 = 250;
rl = r1+l1;
rc = r2 +c2;
Z= 1/(1/c1+1/rl)+1/(1/l2+1/rc);
real(Z)
imag(Z)
rad2deg(angle(Z))

%% induzierte spannung
f = 100;
w = f*2*pi
t = 0:0.0001:0.1;
N = 2;
B = 0.1;
U = 2.* 1e-3 .* 0.1 .* w.* sin(w.*t);
plot(t,U)

%% RLL-Glied L1+(L2//R)
L1 = 2e-3;
L2 = 1e-3;
R = 47;
w = 1:1000:10e10;
Z1= 1j.*w*L1;
Z2= 1./(1./(1j.*w*L2)+1/R);
H = Z2./(Z1+Z2);
%% Darstellung
T = R/L1
semilogx(w,20.*log10(abs(H))+9) 
xlabel("\fontsize{20}\omega")
grid on
xline(T)
%% Leitwert eines Schwingkreises
%C










