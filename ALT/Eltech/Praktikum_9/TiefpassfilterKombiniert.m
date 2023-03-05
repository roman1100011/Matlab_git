%% Tiefpassfilter R+C 
%  Spannung über C
R1 = 31.4;
R2 = 3160;
C2 = 22e-9;
C1 = 2.2e-6;
F = 0:100:1e6;
W = 2*pi.*F;

%% Komplexer ersatzwiderstand
Z1 = 1./(1j*W*C1);
Z2 = 1./(1j*W*C2);
U1 = 
%noch falsch die ausgangsspannung wäre immer 
%gleich wie die Eingangsspannung




H = 1./(1+1j.*W*R*C);
dB = 20*log10(abs(H));

%% Messungen
Fm = [10    100     1000 10e3   ];
Ue = [7.11 7.08     5.12 2.73   ];
Ua = [7.11 7.07     4.71 631e-3 ];
dBm = 20.* log10(Ua./Ue)





numberofplots = 3;
subplot(numberofplots,1,1);
plot(F,abs(H));
grid("on")
title("Ausgangs U/ Eingangs U")
xlabel("Hz")
ylabel("Ausgang/Eingang")
subplot(numberofplots,1,2);
semilogx(F,dB,Fm,dBm)
title("Verstärkung dB")
xlabel("Hz")
ylabel("dB")
grid("minor")
subplot(numberofplots,1,3)
semilogx(F,rad2deg(angle(H)))
grid("minor")
xlabel("Hz")
ylabel("deg")
title("Phasengang")




