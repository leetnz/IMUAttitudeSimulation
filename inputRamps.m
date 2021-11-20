
dt = 0.01;
t = (0.0:dt:18)';
u = zeros(length(t), length(B(1,:)));
u(:, 1) = 6*(makeRamp(t, 2) - 2*makeRamp(t,5) + makeRamp(t, 8));
u(:, 2) = 8.5*(makeRamp(t, 5) - 2* makeRamp(t, 8)+ makeRamp(t, 11));
u(:, 3) = makeRamp(t, 0) - 2*makeRamp(t, 1) + 2*makeRamp(t, 3) - 3*makeRamp(t, 5) + 4*makeRamp(t, 7) - 2*makeRamp(t, 8.5);

function [u] = makeRamp(t, t0)
   u = (t - t0).*(t>=t0);
end