dt = 0.01;
t = 0.0:dt:12;
u = zeros(length(t), length(B(1,:)));
u(101:600, 1) = 10*sin((1:500)'*2*pi./500);
u(301:500, 2) = -7*cos((1:200)' * 2 * pi./300);
u(301:400, 3) = 0.5 * sin((1:100)'*2*pi./200);