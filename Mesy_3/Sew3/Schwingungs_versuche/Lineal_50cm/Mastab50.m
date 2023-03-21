%% Schwingung mit Smartphone im Rohr
a=textread('Data.csv','','headerlines',1','delimiter',',');
t=a(:,1);       % erste Spalte ist Zeit
om=a(:,2:4);    % Spalten 2:4 sind Winkelgeschwindigkeiten
plot(t,om)      % visualisiere
grid on
%xy=ginput(5);   % grafische Herauspicken

