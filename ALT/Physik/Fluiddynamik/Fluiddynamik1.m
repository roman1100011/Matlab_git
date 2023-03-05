%% Aufgabe1

%gegeben:
r1 = 9.5e-3;    %Schaluch-durchmesser [mm]
r2 = (1.3/2)*1e-3;   %kleiner Loch-durchmesser [mm]
n = 24;     %anzahl kleine Löcher 
v1 = 0.91   %fliess-geschwindigkeit in Schaluch [m/s]

q1 = pi*power(r1,2)*v1 %volumen pro s m^3/s
v2 = q1/(n*pi*power(r2,2))
