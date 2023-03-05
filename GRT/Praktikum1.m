    
h = [25 30 35 40 45 50]; %cm <- Genaue Werte einsetzen
y = [3.2 3.8 4.5 5.1 5.7 6.4]; %V <- Genaue Werte einsetzen

% Berechnung Kennlinie
p = polyfit(y,h,1) % Schaetzt linearen Zusammenhang h = p(1)*y+p(2)

y_ = 0:0.5:10;
h_= p(1)*y_+p(2)
% mittels kleinstem Fehlerquadrat
   % Vektor fuer Auswertung
   % Berechnet Kennlinie aus den geschaetzten Parametern
 
%% Q Füllkurve
Q_dataPoints = [0.29 0.63 0.96]  %Steigung
Stellgrosse = [3 5 7]            %Spannung
f2 = polyfit(Stellgrosse,Q_dataPoints,2)
V_ = 0:0.5:10;
Q = f2(2)*V_+f2(1);
%% Füllkurve zum 2ten
%h = [0.29 0.63 0.96]; 
h = [0.58 0.88 0.93]; 
y = [3 5 7]; 
% Berechnung Kennlinie
p = polyfit(y,h,1) % Schaetzt linearen Zusammenhang h = p(1)*y+p(2)

y_ = 0:0.5:10;
h_= p(1)*y_+p(2)
% mittels kleinstem Fehlerquadrat
   % Vektor fuer Auswertung
   % Berechnet Kennlinie aus den geschaetzten Parametern
figure(1); clf;
plot(y,h,'rx',y_,h_,'b')
grid 'minor'
ylabel('cm/s')
xlabel('Motorspannung [V]')

%% Plot lin Q
plot(V_,Q,Stellgrosse,Q_dataPoints)
xlabel 'Stellgrösse 0-10V'
ylabel 'Q'
%% Figur end

   
figure(1); clf;
plot(y,h,'rx',y_,h_,'b')
ylabel('Hoehe h/cm')
xlabel('Messspannung y/V')
%% Mess rekonstruktion
t = linspace(0,55,100);
t_ = linspace(0,55,10)
h = 9.81*((4e-5)^2/(2*0.00725^2))*(t-62).^2;
p = polyfit(t,h,2)
h_ = p(1)*t_.^2+p(2)*t_+p(3)
plot(t,h,t_,h_)
grid minor

