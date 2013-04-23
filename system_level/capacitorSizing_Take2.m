%%% Take 2 at Sizing Capacitor and ON Resistor

% Capacitor Sizing from Noise Specifications
% Ideally, we will size our capacitors as small as possible
clear all
close all

N = 10; % Numbers of bits we are using;
V_DD = 1.8;%V
V_ov = .225; %V Basic asumption 
V_cm = V_DD/2;
%V_FS = (V_DD -(2*V_ov) - (2*V_ov)); 
V_FS = (V_DD -(1*V_ov) - (1*V_ov)); 
    % Take off 1 V_ov for 
    % output swing at both the top and bottom. Divide by ideal gain for
    % input V_FS.
V_LSB = V_FS/(2^N);
V_N_RMS_squared_max = V_LSB^2/24;
 
k = 1.3806488e-23;
T = 300;%K
C_equiv_min = k*T/V_N_RMS_squared_max;
C_samp_min = C_equiv_min/4;

% Choose C_samp based upon C_samp_min
C = 15e-15;%F

% On resistance sizing based upon Settling Requirements
settle_voltage_error = V_LSB/4;
percent_error = 1-(4*V_FS - settle_voltage_error)/(4*V_FS);
t_over_tau = -log(percent_error);
f_s = 5e3;
T_s = 1/f_s;
tau = (T_s/2)/t_over_tau;
w_3dB = 1/tau;
f_3dB = w_3dB/(2*pi);
R_max = tau/(5*C);

% The maximum resistance (minimum sized devices, sized equally)
beta_p = 2*35.5e-6;%A/V^2
beta_n = 2*170.1e-6;%A/V^2
t_ox = 4.1e-9;%m
epsilon_ox = 3.9*8.854e-12;%F/m
C_ox = epsilon_ox/t_ox;
W_over_L_min = 1.5;
V_Tn =0.5; %V
V_ov_n = V_DD - V_cm - V_Tn;

R_max_possible = 1/((beta_n+beta_p)*W_over_L_min*V_ov_n);
% We can find the locations of pole caused by the switches during the hold
% phase
f_switch_pole = 1/(2*pi*C*R_max_possible);

% We will size all switches minimum W, minimum L

% OTA Parameter Calculations
%
% s = tf('s');
% w_p_test = w_3dB;
% out = 4/(s/w_p_test+1);
% step(out)