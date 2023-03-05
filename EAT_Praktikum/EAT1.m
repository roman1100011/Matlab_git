z_abs= [11.04294479 12.07650273 12.08955224 12.36923077];
U = [18 22.1 24.3 40]
R_fe = cos(deg2rad(phi_x)).*z_abs
R_xi = sin(deg2rad(phi_x)).*z_abs*1i
phi_x = [84.5 82.5 81.3 80.9];
Z = R_fe + R_xi;
f = 50; %Hz
W = 2*pi*f;
L = abs(Z/(i*W))

plot(U,L)
xlabel "Spannung [V]"
ylabel "Induktivität [H]"