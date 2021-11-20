% Assumes estimation is done iteratively in real time.
function [est] = estimator(dt, imu, theta0)

    est.theta = zeros(size(imu.gyro.dtheta));
    est.dtheta = zeros(size(imu.gyro.dtheta));
    est.theta(1) = theta0;
    est.dtheta(1) = imu.gyro.dtheta(1);
    est.trust = zeros(size(imu.gyro.dtheta));
    est.gtrust = zeros(size(imu.gyro.dtheta));
    est.absAcc = zeros(size(imu.gyro.dtheta));
    est.thetaAcc = zeros(size(imu.gyro.dtheta));

    baseAccFilterCoeff = 0.01; % A corner freq of 1 second for accepting accel measurements

    for i = 2:length(est.theta)
        % Motion model
        thetaMu = est.theta(i-1) + (est.dtheta(i-1) + imu.gyro.dtheta(i)) * dt/2;
        thetaMu = wrapPiToNegPi(thetaMu);
        dthetaMu = imu.gyro.dtheta(i);
        est.thetaGyro(i) = thetaMu;

        % Observation model
        thetaZ = atan2(imu.acc.y(i), imu.acc.z(i));
        thetaZ = wrapPiToNegPi(thetaZ);
        est.thetaAcc(i) = thetaZ;

        % Trust model (how much we trust the motion model)
        absAcc = (imu.acc.y(i)^2 + imu.acc.z(i)^2);
        
        est.absAcc(i) = absAcc;
        
        obsTrust = max(0, 1 - 20 * abs(absAcc-1)) * max(0, 1 - 5 * abs(imu.gyro.dtheta(i)));
        trust = obsTrust * baseAccFilterCoeff;

        est.trust(i) = trust;
        est.gtrust(i) = obsTrust;


        diff = shortestRadianPath(thetaMu, thetaZ);

        est.theta(i) = wrapPiToNegPi(thetaMu + trust*(diff));
        est.dtheta(i) = dthetaMu;
    end
end



