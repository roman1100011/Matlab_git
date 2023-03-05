%% Spule Impedanz 
%impedanz wird in Ohm angegeben und ist der imaginär-Anteil 
%um die Gesamtimpedanz zu erhalten, wird der betrag der Impedanz berechnet

%Beispielspule mit 100mH und Ideal bei einer Frequenz von 100Hz und
%Scheitelspannung von 20V, Nullphasenverschiebung von 10°
L = 100e-3;
f = 100;
Phi = deg2rad(10);
U_ = 20 * exp(1j*Phi) %Darstellung der Spannung als komplexer Zeiger
Z = 2*pi*f*L*1j %impedanz as imaginary number

%% Normal resistor with 100Ohm
R = 100;
%% Gesamtimpedanz 
Z_ges = Z+R

compass(Z_ges)





