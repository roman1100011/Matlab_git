%% Schwingung mit Smartphone im Rohr
a=textread('Raw_Data.csv','','headerlines',1','delimiter',',');
t=a(:,1);       % erste Spalte ist Zeit
om=a(:,2:5);    % Spalten 2:4 sind Winkelgeschwindigkeiten
%% FFT

FT=abs(fft(om(:,2),1000))
%% Graphik

figure(2,2)
plot(t,om(:,2))      % visualisiere
grid on
%xy=ginput(5);   % grafische Herauspicken
figure(1,2)
plot(t,FT)
