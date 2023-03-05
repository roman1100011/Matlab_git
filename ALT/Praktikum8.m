%% Praktikum 8 aufgabe 1
%Schaltung R+(L/C)
%Spannung wird gemesse über L
L = 2.2e-3; %H
C = 1e-6; %F
R = 47; %Ohm
Rs = 2.2 ; %Ohm  Drahtwiderstand der Spuhle
Wr = 1/sqrt(L*C); %resonanz Kreisfrequenz
fr = Wr/(2*pi);

%messpunkte 
fm = linspace(3.3932e2,3.3932e4,10);


