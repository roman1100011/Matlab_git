%% Matlab Code zum Labor XX
%% Den Workspace leeren und alle Fenster schliessen
clear
close all
%% Verwendete Komponenten

%% Konstanten des Versuches
upp = 10;
C = 670 * 1e-9;

%% Messwerte zum Eintragen
freq = [40:5:100];
freq2 = [40:10:120];
uv = [7.10 7.10 7.10 7.10 7.10 7.10 7.10 7.10 7.10 7.10 7.10 7.10 7.10];
ia = [1.40 1.584 1.762 1.936 2.111 2.286 2.461 2.636 2.810 2.985 3.159 3.334 3.507] * 1e-3;
uv2 = [3.53 3.54 3.54 3.54 3.54 3.54 3.54 3.54 3.54];
ia2 = [0.654 0.816 0.979 1.141 1.304 1.465  1.627 1.788 1.951] * 1e-3;

%% Berechnungen
u_h = uv .* sqrt(2);
i_h = ia .* sqrt(2);
omega = 2 * pi() .*freq;
xc = 1 ./ (omega .* C);
impedanz = u_h ./ i_h;
c_berechnet =  (1 ./ (omega.* impedanz)) * 1e9;
impedanz2 = uv2 ./ ia2;
omega2 = 2 .* pi() .* freq2;
c_berechnet2 =  (1 ./ (omega2.* impedanz2)) * 1e9;
%% Abhängigkeiten grafisch Dargestellt ---> Keine Linien in der Grafik
subplot(2,2,1);
loglog(freq, impedanz, '-b');
title("Impedanz zu Frequenz LogLog");
xlabel("Frequenz in Hz");
ylabel("Impedanz Z");
subplot(2,2,2);
plot(freq, impedanz, '-b');
title("Impedanz zu Frequenz");
xlabel("Frequenz in Hz");
ylabel("Impedanz Z");
subplot(2,2,3);
plot(freq, c_berechnet, '-b');
title("Berechnete Kapazität zu Frequenz (10Vpp)");
xlabel("Frequenz in Hz");
ylabel("Berechnete Kapazität in nF");
subplot(2,2,4);
plot(freq2, c_berechnet2, '-b');
title("Berechnete Kapazität zu Frequenz (5Vpp)");
xlabel("Frequenz in Hz");
ylabel("Berechnete Kapazität in nF");