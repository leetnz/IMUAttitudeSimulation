setup;
% inputSteps;
inputSinusoid;
% inputRamps;

simulate;

% figure; plot(t, ddxsim, t, u);

% plotDynamics(sim.t, sim.y, sim.dy, sim.ddy, sim.uy, "y")

imu = simulateIMU(sim);

figure; plot(sim.t, imu.acc.y, sim.t, imu.acc.z, sim.t, sim.ddy, sim.t, sim.ddz);
legend(["imu accy", "imu accz", "ddy", "ddz"]);
% figure; plot(sim.t, imu.gyro.dtheta, sim.t, sim.dtheta);

% figure; plot3(t, y(:,1), y(:,3));

estGyro = estimatorGyro(dt, imu, sim.theta(1));
est = estimator(dt, imu, sim.theta(1));

figure; plot(sim.t, est.theta, sim.t, est.thetaAcc, sim.t, wrapPiToNegPi(estGyro.theta), sim.t, wrapPiToNegPi(sim.theta));
legend(["kFilter", "accel only", "gyro only", "sim"]);

figure; plot(sim.t, est.absAcc, sim.t, est.trust);
