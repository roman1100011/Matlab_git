x = [-0.1:0.001:0.1];
u = pi*(1E-7)*4
N = 32
R = 0.015
I = 0.4
L = 0.01
B = (u*I*N/(2*L)) * ((L/2-x)./sqrt((L/2-x).^2 + R^2) + (L/2+x)./sqrt((L/2+x).^2 + R^2))



%%zweite Spule simulation (verschieben
x2 =  x + 0.06;

%%helmolz irgendwass spule
Bh = B + (u*I*N/(2*L)) * ((L/2-x2)./sqrt((L/2-x2).^2 + R^2) + (L/2+x2)./sqrt((L/2+x2).^2 + R^2))





xs = [-0.1,-0.03 , -0.02,     0, 0.02,      0.03,       0.1]
Us = [5.5E-3,6.6E-3, 6.8E-3,  19E-3,  6.8E-3, 6.6E-3,   5.5E-3]
Bs = (Us - (5E-3))./(2.5 * (1E-3)) ./ 1E4

plot(x, B, xs, Bs, x2 , B, x+0.06 ,Bh )
ylabel('tesla')
xlabel('distanz')
grid on
grid minor