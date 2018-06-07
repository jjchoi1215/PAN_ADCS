function init= phys_properties(init)

% Earth
init.Earth.mu= 3.986004418e14;   % Gravitational Constant [m^3/s^2]
init.Earth.M = 5.97237e24;       % Mass [kg]
init.Earth.R = 6371e3;           % Mean radius [m]

% Sun
init.Sun.M = 1.98855e30;         % Mass [kg]
init.Sun.R = 695700e3;           % Radius [m]

% 3U+ CubeSat
init.CubeSat.Dim = [10 30 10]*0.01;  % [m]
init.CubeSat.M = 4; % [kg]
m= init.CubeSat.M;
init.I=[1/12*m*(0.3^2+0.1^2) 0 0
        0 1/12*m*(0.3^2+0.1^2) 0
        0 0 1/12*m*(0.1^2+0.1^2)];
init.invI=inv(init.I);
init.c=100;

% RWA Properties (Maxon EC 45 Flat 50W 24V)
init.rpmmax= 10000;      % Nominal speed
init.RWA_I= 135*1e-7;        % Rotor Inertia
%init.hmax=  init.RWA_I*init.rpmmax/60;  % Maximum angular momentum of the wheels
% 2.25e-3
% init.hdmax= [83.4e-3;   % Maximum angular momentum change of the wheels
%             83.4e-3;
%             83.4e-3];        
init.hmax= 1e12;
init.hdmax= [1000 1000 1000]';

init.RWA.invI=inv(init.RWA_I);
%0 to 30rpm deadband -> desired rpm at 10000/2 = 5000 rpm
%-> 5000/60 = 83.3 rad/s -> desired angular momentum = Iw = 135e-7*83.3 =
%1.125e-3
init.h_des= [1.125e-3;1.125e-3;1.125e-3];

%Magnetic torquer
init.m_mt= 0.8; %Am^2

