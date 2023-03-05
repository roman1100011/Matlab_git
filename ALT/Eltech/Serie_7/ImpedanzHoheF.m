%% Praktikum 7
%Vergleich zwischen theoretischem Model und Messungen 10-1000Hz
R = 2.15; %ohmscher widerstand der Spule
L = (2.2)*1e-3;
F = linspace(10,1000,15);
Omega = 2*pi.*F;

%gemessene Werte
Ueff = [270      312    396   503    618   741    864   988     1112    1235    1358    1479    1598    1715  1829].*1e-3;
Ieff = [0.135  0.134   0.1348 0.135  0.135 0.135  0.134 0.134   0.1334  0.133   0.1325  0.1319  0.1311  0.130  0.1293] ;

%Theoretischer Blindwiderstand
Z_teoretisch = R + Omega*1j*L;

%reelle Werte
Z_reel = Ueff./Ieff;


plot(F,Z_reel,F,abs(Z_teoretisch))
legend("Gemessen","Theoretisch")



real(Z_teoretisch(15))
imag(Z_teoretisch(15))

%% Versuch bei 50MHz -> beobachten des Skinnefekts
%versuch nicht schön durchgeführt zu beobachten wäre gewesen, dass der Real
%anteil steigen würde, da der Strom nur noch an der Oberfäche geleitete
%werden würde und sommit die Stromdichte steigt, wass in einem erhöhten
%Widerstand resultiert
W = (100*R)/L
F = W/(2*pi)
Z_t = R + W*L;
UM = 0;
IM = 1;
Z_g = UM/IM ;

%% Schwingkreis C+L mit C = 10nF; L = 2.2mH
R = 2.15;       %ohmscher widerstand der Spule
L = (2.2)*1e-3; %Induktivität
C = 10e-9;      %Kapazität
Ws = 1/sqrt(L*C) %Kreisfrequenz Resonanz
F = Ws/(2*pi)    %Herz Resonanz
Is = 0.05/(R+50); %Scheitelstrom
Uls = Is*L*Ws     %Scheitlspannung über L



