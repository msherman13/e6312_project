%%% This document is for the EE6312 Propject. It calculates the capacitor
%%% sizes for the hold and sample capacitors.

%%
clear all
close all

N = 10; % Numbers of bits we are using;
V_DD = 1.8;%V
V_ov = .2; %V Basic asumption 

V_cm = V_DD/2;

V_FS = (V_DD -(2*V_ov) - (2*V_ov))/4; % Take off 2 V_ov for 
    % output swing at both the top and bottom. Divide by ideal gain for
    % input V_FS.
%V_FS = 1;

N_stage=2.5;
V_LSB = V_FS/(2^N);
 
 V_N_RMS_squared_max = V_LSB^2/24;
 
 k = 1.3806488e-23;
 T = 300;%K
 
 C_min = k*T/V_N_RMS_squared_max;
 
 
 