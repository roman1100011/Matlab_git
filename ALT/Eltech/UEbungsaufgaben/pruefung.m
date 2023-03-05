W=100*2*pi
R2=10
R1 = 2+50
L = 2.2e-3
C = 10e-6
Z1= R1+(1/W*1j*C)+(1j*W*L)
Z2 = R2
H = abs(Z2/(Z1+Z2))
