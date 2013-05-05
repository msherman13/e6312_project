%%% This document is for the EE6312 Propject. It calculates the capacitor
%%% sizes for the hold and sample capacitors.

%%
clear all
close all

N = 10; % Numbers of bits we are using;
V_DD = 1.8;%V
V_ov = .115; %V Basic asumption 

V_cm = V_DD/2;

V_FS = (V_DD -(V_ov) - (V_ov)); % Take off 2 V_ov for 
    % output swing at both the top and bottom. Divide by ideal gain for
    % input V_FS.
%V_FS = 1;

V_LSB = V_FS/(2^N);
 
V_N_RMS_squared_max = V_LSB^2/24;
 
k = 1.3806488e-23;
T = 300;%K
 
C_equiv_min = k*T/V_N_RMS_squared_max;
C_min = C_equiv_min/4;

 % Settling Constraints
settle_voltage_error = V_LSB/4;
percent_error = 1-(4*V_FS - settle_voltage_error)/(4*V_FS);
t_over_tau = -log(percent_error);
f_s = 5e3;
T_s = 1/f_s;
tau = (T_s/2)/t_over_tau;
 
f_3db = 1/(2*pi*tau);

 % From calculate C_min 
 C = 15e-15;
 R_max = tau/C;
 
 % Info on transistors
 beta_p = 2*35.5e-6;%A/V^2
 beta_n = 2*170.1e-6;%A/V^2
 t_ox = 4.1e-9;
 epsilon_ox = 3.9*8.854e-12;%F/m
 C_ox = epsilon_ox/t_ox;
 
 rel_sizing = beta_n/beta_p;
 W_over_L = 1.5; %Minimum for Minimum L
 r_o = 1/(beta_n/2*(W_over_L)*V_ov);
 L = 180e-9;%m
 W_n = W_over_L*L;
 W_p = W_n*rel_sizing;
 
 % Charge Injection
 V_Tn = 0.5;%V
 V_Tp = 0.5;%V
 V_ov_n = V_DD - V_Tn - V_cm;
 V_ov_p = -V_Tp + V_cm;
 
 Q_channel_n = -C_ox*W_n*L*V_ov_n;
 Q_channel_p = C_ox*W_p*L*V_ov_p;
 
 delta_Q = Q_channel_p + Q_channel_n;
 
 % At the end of the phi_S phase
 %delta_Q_switch_side = 
 
 % Bandwidth Calculations from Settling Requirements
 A_f = (4*V_FS - settle_voltage_error)/V_FS;
 %A_f = (4*V_FS - V_LSB)/V_FS;
 beta_f = 1/4;
 DC_gain = A_f/(1-A_f*beta_f);
 DC_gain_dB = 20*log10(DC_gain);
 
 DC_gain_miles = (V_FS*4/settle_voltage_error);
 DC_gain_miles_dB = 20*log10(DC_gain_miles);
 
 g_m = 1e-3;
 w_unity = g_m/C;
 f_unity = w_unity/(2*pi);
 f_p2 = 1.7*f_unity;
 w_p2 = 2*pi*f_p2;
 f_3dB_pole = f_unity/(DC_gain_miles);
 w_3dB_pole = 2*pi*f_3dB_pole;
 
 %slew_rate = V_FS*w_3dB_pole;
 %I_slew = slew_rate*C;
 
 %Redo Switch Sizing
 R_max2 = 1/(w_p2*C);
 
 W_over_L_min = 1/(R_max2*(beta_n+beta_p)*V_ov_n);
 
 % Slewing Calculations
 max_delta_V = 2*V_FS;
 delta_t = 1/(2*f_s);
 
 slew_rate = max_delta_V/delta_t;
 
 I_min = slew_rate*C;
 
 % Choose 
 n = 1.5;
 phi_t = 0.0258;
 I_choose = 10e-9;
 g_m = I_choose/(n*phi_t);
 
R_out_1 = sqrt(DC_gain_miles/g_m^2);
 