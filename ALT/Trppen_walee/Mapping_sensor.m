
%% Gemessen Daten
distanceMeasured = [1 2 3 4 5 6 7 8 9 10 14 18 22 26 30 34 38 42] ;   %gemessene Distanz in mm
voltageOutput = [1960 2360 2355 2320 2000 1740 1560 1380 1255 1160 890 700 600 550 490 440 420 360];     %gemessen Spannung mit dem ADC in mV


%% Invers function 
% 
% 
x = [1 2 3 4 5 6 7 8 9 10 14 18 22 26 30 34 38 42] ; 
y = [1960 2360 2355 2320 2000 1740 1560 1380 1255 1160 890 700 600 550 490 440 420 360];     
plot(y,x)
curveFitter(y,x)

t = IdealTrafo;
