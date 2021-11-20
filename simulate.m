C = eye(length(A)); % y = x
D = zeros(size(B));

sys = ss(A, B, C, D);

[y, t, x] = lsim(sys, u, t);

dx = (A*x' + B*u')';

sim.t = t;

sim.y = x(:, 1);
sim.dy = x(:, 2);
sim.ddy = dx(:, 2);
sim.uy = u(:, 1);

sim.z = x(:, 3);
sim.dz = x(:, 4);
sim.ddz = x(:, 4);
sim.uz = u(:, 2);


sim.theta = x(:, 5);
sim.dtheta = x(:, 6);
sim.ddtheta = dx(:, 6);
sim.utheta = u(:, 3);


% For Plotting
xallsim = [sim.y, sim.dy, sim.ddy, ...
            sim.z, sim.dz, sim.ddz, ...
            sim.theta, sim.dtheta, sim.ddtheta];
xsim = [sim.y, sim.z, sim.theta];
dxsim = [sim.dy, sim.dz, sim.dtheta];
ddxsim = [sim.ddy, sim.ddz, sim.ddtheta];

