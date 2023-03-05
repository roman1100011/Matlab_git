c = 220e-9
l =0.79e-9
r=0.03
w=100*pi
Zabs=(1/(1j*w*c))+r+1j*w*l
I2 = 10e-3 * 10e-3
P_ = I2* Zabs

schein = abs(P_)
wirk=real(P_)
blind = imag(P_)