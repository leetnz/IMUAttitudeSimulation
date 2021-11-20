clear;

% Physical Coefficients
d = 1;  % Translational damping (both y and z)
da = 1; % Angular damping (theta)
m = 1;  % Mass
I = 1;  % Intertia

%% State Space Equations
% Where x = [y, dy, z, dz, theta, dtheta]
%       u = [Fy, Fz, Ttheta]

A = [0, 1, 0, 0, 0, 0;
     0,-d, 0, 0, 0, 0;
     0, 0, 0, 1, 0, 0;
     0, 0, 0,-d, 0, 0;
     0, 0, 0, 0, 0, 1;
     0, 0, 0, 0, 0,-da];

B = [0, 0, 0;
    1/m,0, 0;
     0, 0, 0;
     0,1/m,0;
     0, 0, 0;
     0, 0,1/m];