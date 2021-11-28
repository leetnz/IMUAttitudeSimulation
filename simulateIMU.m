function [imu] = simulateIMU(sim)
    aOffsets = 0.01 * randn(1, 2);
    aNoise = 0.005 - 0.0010 * rand(1, 2);

    gOffset = 2*pi/(360) * 2 * (1 - 2 * rand(1)); % up to 2 degrees per second
    gNoise = 2*pi/(360) * 0.5 * (1 - 2 * rand(1)); % pretty noisy...

    ddz = sim.ddz/9.8 + 1; % Add gravity
    ddy = sim.ddy/9.8;

    ddy_b = cos(sim.theta) .* ddy + sin(sim.theta) .* ddz;
    ddz_b = -sin(sim.theta) .* ddy + cos(sim.theta) .* ddz;

    imu.acc.y = aOffsets(1) + aNoise(1) * randn(size(sim.t)) + ddy_b;
    imu.acc.z = aOffsets(2) + aNoise(2) * randn(size(sim.t)) + ddz_b;

    imu.gyro.dtheta = gOffset + gNoise * randn(size(sim.t)) + sim.dtheta;
end