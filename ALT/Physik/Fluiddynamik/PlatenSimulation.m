%% Daten importieren

AccTable = readtable('Versuch2_Daten.xlsx','Range','B6:B15006');
timeTable = readtable('Versuch2_Daten.xlsx','Range','A6:A15006');
AccT = table2array(AccTable);
%Low pass filter
AccF = lowpass(AccT,1,1000);
Acc = AccF - 9.5545;  %subtract the gravity constant
time = table2array(timeTable);

r = 0.28; %m
m = 1.15668; %kg
k = 31.33; %N/m
Auslenkung = 0.2; %Auslenkung zu t=0s in m
Airdensety = 1.225; %kg/m3
Area = pi*power(r,2);
v = 0.45; %m/s arbitrary speed for calculation

%grund Kreisfrequenz W0
Wbase = sqrt(k/m);             


totalspeed = trapz(Acc);


%numerical integration
V = cumtrapz(Acc)/1000; %divided by 1000 because it was sampled with 1kH
steigung = time.*0.28; %es gibt einen linearen fehler in den daten der wird mit der steigung entfernt

Z = cumtrapz(V)/1000+steigung+Auslenkung; %divided by 1000 because it was sampled with 1kH; zusätzlich wird noch Auslenkung addiert um den 0 ofset zu erhalten

%find local maximas
%MaximasM = -1 < Acc & Acc < 1;
maximasN = find(-0.05 < Acc & Acc < 0.05);


%----------------creat diminishing amplitude------------------------------

AmpZ = V(maximasN);     %Value of amplitudes
AmpN = AmpZ(AmpZ>0);
timeZ = time(maximasN);
timeN = timeZ(AmpZ>0); %time of amplitudes

%--------------------CurveFit---------------------------------------------
%create new fit option
fo = fitoptions('Method','NonlinearLeastSquares',...
               'Lower',[-0.5,-1,-pi/2],...
               'Upper',[0.5,1,pi/2],...
               'StartPoint',[1 1 0]);
%create the fuction to be fitted
ft = fittype('a*exp(-d/(2*m)*x)*cos(sqrt(k/m-power((d/(2*m)),2))*(x+p))','problem',{'k','m'},'options',fo);
%!!!!!!!y=exp(alpha*t)
[vara,SimU1] = fit(time,Z,ft,'problem',{k,m})
%creat fitted curve with parameters for the amplitude
a = vara.a %Amplitude
d = vara.d %dämpfung
p = vara.p %phasenverschiebung
fitedA = a.*exp(-d./(2*m).*time).*cos(sqrt(k/m-power((d/(2*m)),2)).*(time+p));
%----------------------Luftwiderstand modelieren----------------
dampeningK = d;
Fd = v * d %Drag in Newton
Cw = (2*Fd)/(Airdensety*power(v,2)*Area)





%-------------------------------------------------------------------------

%Figure
%Acceloration
numberPlots = 4; %number of plots to expand and reduce the number of plots quickly
subplot(numberPlots,1,1)
plot(time,Acc,time,AccT- 9.5545);
grid('minor')
title('Aceleration')
xlabel('time [s]')
ylabel('Aceleration')
%Velocity
subplot(numberPlots,1,2)
plot(time,V)
grid('minor')
title('Velocity')
xlabel('time [s]')
ylabel('Velocity')
%dampening+fitted curve
subplot(numberPlots,1,3)
plot(timeN,AmpN);
grid('minor')
title('Dampening')
xlabel('time [s]')
ylabel('Velocity')
%Amplitude of Z
subplot(numberPlots,1,4)
plot(time,Z,time,fitedA);
grid('minor')
title('Curve Fit')
xlabel('time [s]')
ylabel('Y')






