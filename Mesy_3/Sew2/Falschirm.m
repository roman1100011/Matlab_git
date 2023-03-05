%% MEST 3 Uebung Woche 1, Fallschirm 2
% September 2019 Altenburger
% ------------- definiere Parameter
dt = 0.01;
Tend = 100;
v0 = 50;
alpha = 0.0025;
t = 0:dt:Tend;
v = zeros(size(t));
v(1) = v0;
a = zeros(size(t));
% mache einfache numerische Integration
for k = 2:length(v)
    a(k) = -alpha * v(k-1)^2;
    v(k) = dt * a(k) + v(k-1);
end
% visualisiere:
subplot(211)
plot(t,v)
grid
set(gca,'fontsize',14)
ylabel('Geschwindigkeit / m')
subplot(212)
plot(t,a)
grid
set(gca,'fontsize',14)
xlabel('Zeit / s')
ylabel('Beschl. m/s^2')
x_gesamt = trapz(t,v);
title(sprintf('Gesamter Weg: %3.1f Meter',x_gesamt))
