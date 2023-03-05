%% Übungsserie6 Aufgabe1
%Data from the graph
Phi = deg2rad(36);
Us = 20;
Is = 40e-3;

%calculating imedance
Zges = (Us/Is)*exp(1j*Phi);

fprintf("R = %f\n",real(Zges))
fprintf("Z = %f\n",imag(Zges))

%calculating L from Z
L = imag(Zges)/(2*pi*50); %no j in (2*pi*50Hz) because imag(Zges)returns a real value
fprintf("L = %f",L)
%% Aufgabe 2
%solve for Z_ges
%Z_ges = (C1//(R1+L1))+(L2//(R2+C2))

%given values
R1  = 100       ;
R2  = 250       ;
%Leitwerte der Induktivitäten und Kapazitivitäte
G1 = 1/R1       ;
G2 = 1/R2       ;
yc1 = 0.020*1j ;
yc2 = 0.025*1j  ;
yl1 = conj(1/50 *1j) ;
yl2 = conj(1/100*1j)  ;



%A1= R1 + L1 as cunductance
A1 = 1/(1/G1+1/yl1);

%A2 = A1//C1 as cunductance
A2 = A1+yc1;

%A3 = R2 + C2 as cunductance
A3 = 1/(1/G2+1/yc2);

%A4 = A3//L2 as cunductance
A4 = A3+yl2;

%Y_ges = A2 + A4
Y_ges = 1/(1/A2+1/A4);
Z_ges = 1/Y_ges

fprintf("R = %f\n",real(Z_ges))
fprintf("L*Omega = %f\n ",imag(Z_ges))

%% Aufgabe 3.1
Rp = 100;
Lp = 100e-3;
f = 440;
Omega = 2*pi*f;
Rr =real(1/(1/Rp+1/(Lp*1j*Omega)))
Lr = imag(1/(1/Rp+1/(Lp*1j*Omega)))
L = Lr/Omega








