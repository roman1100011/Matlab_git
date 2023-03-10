% Vorlesung "Felder und Wellen". FS 2021, März 2021
% Studiengang Systemtechnik, School of Engineering, ZHAW. 
% Dozent: Andreas Witzig, Institute of Computational Physics ICP

% Elektrostatik: Feldplots und Feldlinien für Punktladungen
% Aufgabe A: stellen Sie das Feld von zwei Punktladungen dar mit Abstand 2m
% und Q2 = 3*Q1. Laden Sie als Resultat ein Screenshot auf Moodle.
% Aufgabe B: stellen Sie das Feld von drei Punktladungen dar, die sich auf
% den Positionen eines gleichseitigen Dreiecks befinden. 
% B.i) Laden Sie als Resultat den Screenshot der Feldplots auf Moodle. 
% B.ii) Plotten sie eine Kurve der Feldstärke auf der Winkelhalbierenden

clear;
% Vorbereitung Datenstruktur für Feldplot
% Shift um 0.001, damit Division durch Null vermieden wird
[x,y] = meshgrid(-2.001:.1:2,-1.001:.1:1); 
[N,M] = size(x);

% Konstanter Vorfaktor mit elektrischer Feldkonstante Epsilon_0
constE = 1/4/pi/8.85e-11;

%% -----------------------Ladungen------------------------------
xq = [-0.65 0.65];
yq = [0.05 ]

% Position und Stärke einer Punktladung
%--------------------Ladung 1---------------------------------------
x1 = -0.65;
y1 = 0.05;
Q1 = 2; 
%--------------------Ladung 2---------------------------------------
x2 = 0.65;
y2 = 0.5;
Q2 = 1.3; 

% Für den "quiver"-Feldplot werden die Bilder nicht schön, wenn
% die Vektoren nahe an der Punktquelle zu gross werden. Faktor 
% zur Längenbegrenzung:
Eplotmax = 6e9;

% Die x- und y-Komponenten des elektrischen Feldes werden separat
% berechnet. Der Loop durch die Punkte des Meshgrids macht die 
% Rechnung einfacher verständlich und besser portierbar. In Matlab
% könnte man das aber schneller und elekganter auch als 
% Matrixoperation schreiben,
%% -------------------------Itteration für Quelle 1---------------------
for i = 1:N
    for j = 1:M
        rsquare(i,j)= (x(i,j)-x1)^2 + (y(i,j)-y1)^2;
        dirx(i,j)= (x(i,j)-x1)/sqrt(rsquare(i,j));
        diry(i,j)= (y(i,j)-y1)/sqrt(rsquare(i,j));
        % Achtung bei Division: Wenn die Quelle auf einem 
        % Gitterpunkt gewählt werden, könnte es unendlich geben...
        Ex1(i,j) = constE*Q1*dirx(i,j)/rsquare(i,j); 
        Ey1(i,j) = constE*Q1*diry(i,j)/rsquare(i,j);
        Eabs = sqrt(Ex1(i,j)^2+Ey1(i,j)^2);
        if Eabs > Eplotmax
            Ex1(i,j)=Eplotmax*Ex1(i,j)/Eabs;
            Ey1(i,j)=Eplotmax*Ey1(i,j)/Eabs;
        end
    end
end
%% -------------------------Itteration für Quelle 2---------------------
for i = 1:N
    for j = 1:M
        rsquare(i,j) = (x(i,j)-x2)^2 + (y(i,j)-y2)^2;
        dirx(i,j)= (x(i,j)-x2)/sqrt(rsquare(i,j));
        diry(i,j)= (y(i,j)-y2)/sqrt(rsquare(i,j));
        % Achtung bei Division: Wenn die Quelle auf einem 
        % Gitterpunkt gewählt werden, könnte es unendlich geben...
        Ex2(i,j) = constE*Q2*dirx(i,j)/rsquare(i,j); 
        Ey2(i,j) = constE*Q2*diry(i,j)/rsquare(i,j);
        Eabs = sqrt(Ex2(i,j)^2+Ey2(i,j)^2);
        if Eabs > Eplotmax
            Ex2(i,j)=+Eplotmax*Ex2(i,j)/Eabs;
            Ey2(i,j)=+Eplotmax*Ey2(i,j)/Eabs;
        end
    end
end

Ex=Ex1+Ex2
Ey=Ey1+Ey2

% Für den Feldlinienplot muss man die Startpositionen definieren.
% Sie sollen auf einem Kreis um die Punktladung liegen:
CR=0.1;    % Radius
CN=20;     % Anzahl Elemente auf dem Kreis
phi=0.15;  % Phasenverschiebung gibt manchmal schönere Plots
for k = 1:CN
    C1x(k)=x1+CR*sin(k*2*pi/CN+phi);
    C1y(k)=y1+CR*cos(k*2*pi/CN+phi);
end
for k = 1:CN
    C2x(k)=x2+CR*sin(k*2*pi/CN+phi);
    C2y(k)=y2+CR*cos(k*2*pi/CN+phi);
end

clf; hold on; axis image;
streamline(x,y,Ex,Ey,C1x,C1y);
streamline(x,y,Ex,Ey,C2x,C2y);
quiver(x,y,Ex,Ey,'color','k');
xlabel('x'); ylabel('y');title('E-Feld für Punktladung');
