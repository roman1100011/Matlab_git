%% Aufgabe 2
I_ = 1* exp(1j*deg2rad(10))
L = 10e-3
f = 50

U_ = abs(L * 2 * pi * f * 1j *I_)

%% Aufgabe 3a
%r1 +(r2/L1
r1 = 100;
r2 = 50;
L = 100e-3;
f = 50
Z_ = 1j*2*pi*f*L
Z_ges = r1+(1/(1/r2+1/Z_))
R_ges = abs(Z_ges)

%% Aufgabe3b
%r1 /(r2+l)
r1 = 100;
r2 = 10;
L = 47e-3;
f = 50
Z_ = 1j*2*pi*f*L
Z_ges = 1/(1/r1+1/(r2+Z_))
R_ges = abs(Z_ges)
fi = rad2deg(angle(Z_ges))

%% Aufgabe3c
%r1 +(r2/C)
r1 = 100;
r2 = 2.7e3;
C = 1e-6;
f = 50
Z_ = 1/(1j  * 2 * pi*f*C)
Z_ges = r1+(1/(1/r2+1/Z_))
R_ges = abs(Z_ges)
fi = rad2deg(angle(Z_ges))

%% Aufgabe3d
%C1+(R1/C2)
r1 = 2.7e3;
C1 = 1e-6;
C2 = 1e-6;
f = 50
Z1_ = 1/(1j  * 2 * pi*f*C)
Z2_ = 1/(1j  * 2 * pi*f*C)
Z_ges = Z1_+(1/(1/Z2_+1/r1))
R_ges = abs(Z_ges)
fi = rad2deg(angle(Z_ges))
