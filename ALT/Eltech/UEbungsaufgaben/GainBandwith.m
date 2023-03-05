C = 10e-9;
Rc = 1e6;
R = 1e3
W = [0:1:1e3];
A = abs(Rc./(R*(1+j*W*Rc*C)));
loglog(W,A)
grid minor

