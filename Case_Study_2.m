clc;
clear;
close all;

%% PARAMETERS
rho = 1025;          % Seawater density (kg/m^3)
R = 5;               % Turbine radius (m)
A = pi*R^2;          % Swept area (m^2)
Ct = 0.4;            % Torque coefficient
I = 5000;            % Moment of inertia (kg.m^2)
c = 2000;            % Damping coefficient
k = 10000;           % Shaft stiffness

V0 = 2;              % Max tidal velocity (m/s)
omega = 0.2;         % Tidal frequency (rad/s)

tspan = [0 100];     % Time span

%% INITIAL CONDITIONS
y0 = [0; 0];         % [theta, theta_dot]

%% SOLVE DIFFERENTIAL EQUATION
[t, y] = ode45(@(t,y) turbine_dynamics(t,y,rho,A,R,Ct,I,c,k,V0,omega), tspan, y0);

theta = y(:,1);
theta_dot = y(:,2);

%% TIDAL VELOCITY
v = V0 * sin(omega * t);

%% TORQUE
Torque = 0.5 * rho .* A .* R .* Ct .* (v.^2);

%% POWER
Power = Torque .* theta_dot;

%% ================= ML MODEL (IMPROVED) =================
% Using both velocity (v) and angular velocity (theta_dot)

X = [v, theta_dot];              % Input features
Y = Power;                       % Output

% Add bias term
X_reg = [ones(length(X),1), X];

% Regression coefficients
coeff = X_reg \ Y;

% Prediction
Power_pred = X_reg * coeff;

%% DISPLAY MODEL
disp('ML Model: P = a0 + a1*v + a2*theta_dot');
disp(coeff);

%% PLOTS
figure;

subplot(3,1,1);
plot(t, theta);
title('Angular Displacement');
xlabel('Time (s)');
ylabel('\theta (rad)');

subplot(3,1,2);
plot(t, theta_dot);
title('Angular Velocity');
xlabel('Time (s)');
ylabel('\theta dot (rad/s)');

subplot(3,1,3);
plot(t, Power, 'b', 'LineWidth', 1.5); hold on;
plot(t, Power_pred, 'r--', 'LineWidth', 1.5);
title('Power Output & Improved ML Prediction');
xlabel('Time (s)');
ylabel('Power (W)');
legend('Actual','Predicted');
grid on;

%% FUNCTION
function dydt = turbine_dynamics(t,y,rho,A,R,Ct,I,c,k,V0,omega)

    theta = y(1);
    theta_dot = y(2);

    v = V0 * sin(omega * t);

    Torque = 0.5 * rho * A * R * Ct * v^2;

    theta_ddot = (Torque - c*theta_dot - k*theta) / I;

    dydt = [theta_dot; theta_ddot];
end