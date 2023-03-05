% Physik 3 fuer Systemtechnik
% Mathias Weyland und Andreas Witzig
% School of Engineering, ZHAW
clear;
L = 12;                 % m
N = 101;                % Anzahl Punkte in x-Richtung
delta_x = 12 / (N-1);   %
delta_t = 2e-4;         % s
wave_speed = 340;       % m/s

C = wave_speed * delta_t / delta_x; % dimensionslos
C2 = C*C;               % dimensionslos

x = linspace(0,L,N);    % Vektor mit den x-Stuetzstellen

% Initialisierung des Simulationsbereichs und der History-Vektoren
u = zeros(N,1); % Aufgabe: hier als Anfangsbedingung eine Puls-Wellenform

u_old   = u;    % ein Zeitschritt zurueck
u_older = u;    % zwei Zeitschritte zurueck
past = [u_older,u_old]

% Set up the plot
myplot = plot(x, u, 'LineWidth',2);
axis([0,L,-2,2]);
xlabel('x/m'); ylabel('u');
title('Wave propagation');

filename = 'wave.gif';
% Zeititeration
for i=1:1000
    disp(['at timestep i= ', num2str(i)]);
    pos = 6; %position in meter
    u(round(8.417*pos))= exp(-((i-50)^2)/(2*round((8.4*4)^2)))*sin(i*0.2);
    
    % Loop ueber den Ort
    for j=2:N-1
      u(j) = C2*(u_old(j+1)+u_old(j-1)) + 2*(1-C2)*u_old(j) - u_older(j); % Aufgabe: hier die Wellengleichung
    end

    % Handle the whole plotting and animation business
    set(myplot, 'Ydata', u);
    drawnow;
    frame = getframe(gcf);
    im = frame2im(frame);
    [A,map] = rgb2ind(im,256);
    if i==1
           imwrite(A,map,filename,'gif','LoopCount',Inf,'DelayTime',0.05);
    else
        imwrite(A,map,filename,'gif','WriteMode','append','DelayTime',0.05);
    end
    u(round(8.417*pos))= exp(-((i-50)^2)/(2*round((8.4*4)^2)))*sin(i*0.2);

    % Es braucht die Werte aus zwei frueheren Zeitschritten
    u_older = u_old;
    u_old = u;
end
%% 45_ODE_Solver 
a = dsolve()