%%% This document is made to estimate the total area of the circuit for the
%%% EE6312 Final Project.

clear all
close all

load trans_sizes

% Calculate the total OTA transistor area
trans_L = trans_sizes(:,1);
trans_W = trans_sizes(:,2);
L_diff = .48e-6;% m
alpha = 1.3;% scalar adjustment for wires

trans_Area = trans_W.*(trans_L + L_diff)*alpha;% m^2
trans_Area_total = sum(trans_Area);% m^2

% Calculate the total switch transistor area
switch_L = 180e-9;
switch_W = 190e-9;
switch_Area = switch_W*(switch_L + L_diff)*alpha;
switch_Area_total = 14*switch_Area;

% Calculate the total clock buffer area
buff_L = 250e-9;
buff_W_n = 250e-9;
buff_W_p = 1.02e-6;

buff_Area_n = buff_W_n*(buff_L + L_diff)*alpha;
buff_Area_p = buff_W_p*(buff_L + L_diff)*alpha;
buff_Area_total = 3*buff_Area_n + 3*buff_Area_p;

% Calculate the total resistor area
R_s = 10*(1e6)^2; %Ohm/m^2
resistors = [40e6,40e6]; %Ohm
resistor_Area = resistors/R_s;
resistor_Area_total = sum(resistor_Area); 

% Calculate the total capacitor area
C_unit = 1e-15*(1e6)^2;
C_hold = 150e-15;
C_comp = 750e-15;
capacitance_total = 10*C_hold+2*C_comp;
capacitor_Area_total = capacitance_total/C_unit;

total_Area = trans_Area_total + switch_Area_total + buff_Area_total +...
    resistor_Area_total + capacitor_Area_total;