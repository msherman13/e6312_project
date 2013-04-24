% OTA gain, BW, and sizing.
clear all;
close all;
clc;

I_tail = 100e-9;
n = 1.5;
phi_t = 0.0258;
V_AL = 10e6;
L = 400e-9;
V_A = V_AL*L;
C_h = 15e-15;

I_1 = I_tail;
I_2 = I_tail/2;
I_3 = I_tail/2;
I_4 = I_tail;
I_5 = I_tail;
I_6 = I_tail/2;
I_7 = I_tail/2;
I_8 = I_tail/2;
I_9 = I_tail/2;
I_10 = I_tail/2;
I_11 = I_tail/2;
I_12 = I_tail;
I_13 = I_tail;

g_m1 = I_1 / (n*phi_t);
g_m2 = I_2 / (n*phi_t);
g_m3 = I_3 / (n*phi_t);
g_m4 = I_4 / (n*phi_t);
g_m5 = I_5 / (n*phi_t);
g_m6 = I_6 / (n*phi_t);
g_m7 = I_7 / (n*phi_t);
g_m8 = I_8 / (n*phi_t);
g_m9 = I_9 / (n*phi_t);
g_m10 = I_10 / (n*phi_t);
g_m11 = I_11 / (n*phi_t);
g_m12 = I_12 / (n*phi_t);
g_m13 = I_13 / (n*phi_t);

r_o1 = V_A/I_1;
r_o2 = V_A/I_2;
r_o3 = V_A/I_3;
r_o4 = V_A/I_4;
r_o5 = V_A/I_5;
r_o6 = V_A/I_6;
r_o7 = V_A/I_7;
r_o8 = V_A/I_8;
r_o9 = V_A/I_9;
r_o10 = V_A/I_10;
r_o11 = V_A/I_11;
r_o12 = V_A/I_12;
r_o13 = V_A/I_13;

%Gain.
r_casc = parallel((g_m9*r_o9*r_o11), (g_m7*r_o7*parallel(r_o3, r_o5)));
A_casc = g_m3*r_casc;
r_out = r_o13/2;
A_cs = g_m13*r_out;
A = A_casc*A_cs;
A_db = 20*log10(A);

%Bandwidth.
C_c = 10*C_h;
f_3db = 1/(2*pi*r_casc*C_c);
f_ugb = f_3db*10^(A_db/20);