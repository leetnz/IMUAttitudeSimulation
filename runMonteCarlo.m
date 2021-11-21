setup;
% inputSteps;
inputSinusoid;
% inputRamps;

u(:,1) = 0.1*u(:,1);
u(:,2) = 0.1*u(:,2);
% u(:,3) = 0*u(:,3);
simulate;



% figure; plot(t, ddxsim, t, u);

% plotDynamics(sim.t, sim.y, sim.dy, sim.ddy, sim.uy, "y")

MC_RUNS = 100;

imu = simulateIMU(sim);
imus=horzcat(imu);
clear imu;

for i = 1:MC_RUNS
    imus(i) = simulateIMU(sim);
end

% plotMCImus(sim, imus);

est = estimator(dt, imus(1), sim.theta(1));
ests=horzcat(est);
clear est;

gest = estimatorGyro(dt, imus(1), sim.theta(1));
gests=horzcat(gest);
clear gest;

aest = estimatorAccel(dt, imus(1), sim.theta(1));
aests=horzcat(aest);
clear aest;

for i = 1:MC_RUNS
    ests(i) = estimator(dt, imus(i), sim.theta(1));
    gests(i) = estimatorGyro(dt, imus(i), sim.theta(1));
    aests(i) = estimatorAccel(dt, imus(i), sim.theta(1));
end

plotMCEst(sim, ests, gests, aests);


