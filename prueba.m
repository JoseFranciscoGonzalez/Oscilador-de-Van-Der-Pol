a = 1
b = -1000.001
c = 1
t = 2

x1_ = (-my_grid(b,t) + sqrt((my_grid(b,t).^2) - (4*my_grid(a,t)*my_grid(c,t))))/(2*my_grid(a,t))
