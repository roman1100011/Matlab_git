%%resonanz
%Schaltung -> R+L+C
R = 10;
L = 100e-6;
C = 10e-9;
U = 10;

%Resonante Kreisfrewquenz
Omega = 1/sqrt(L*C)
%gesammt impedanz
Z = 1/(Omega*C*1j)+Omega*L*1j+R
%strom im gesamten stromkreis
I = U/Z
%Spannung über L
U_L = imag(I*(Omega*L*1j))
