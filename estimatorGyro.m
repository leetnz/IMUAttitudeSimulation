function [est] = estimatorGyro(dt, imu, theta0)
    est.theta = zeros(size(imu.gyro.dtheta));
    est.dtheta = zeros(size(imu.gyro.dtheta));
    est.theta(1) = theta0;
    est.dtheta(1) = imu.gyro.dtheta(1);

    for i = 2:length(est.theta)
        % Motion model
        est.theta(i) = est.theta(i-1) + (est.dtheta(i-1) + imu.gyro.dtheta(i)) * dt/2;
        est.dtheta(i) = imu.gyro.dtheta(i);
    end
end