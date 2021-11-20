function [est] = estimatorAccel(dt, imu, theta0)
    est.theta = zeros(size(imu.gyro.dtheta));
    est.dtheta = zeros(size(imu.gyro.dtheta));
    est.theta(1) = theta0;

    for i = 2:length(est.theta)
        % Observation model
        
        est.theta(i) = atan2(imu.acc.y(i), imu.acc.z(i));
    end
end