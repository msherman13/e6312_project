% OTA gain, BW, and sizing.
clear all;
close all;
clc;

I_tail = 100e-9;
n = 1.5;
phi_t = 0.0258;
V_AL = 10e6;
C_h = 15e-15;
beta_p = 2*35.5e-6;%A/V^2
beta_n = 2*170.1e-6;%A/V^2
V_Tn = .45;
V_Tp = .45;

L_1 = 8000e-9;
L_2 = 1000e-9;
L_3 = 1000e-9;
L_4 = 30000e-9;
L_5 = 30000e-9;
L_6 = 1333e-9;
L_7 = 1333e-9;
L_8 = 1000e-9;
L_9 = 1000e-9;
L_10 = 15000e-9;
L_11 = 15000e-9;
L_12 = 1000e-9;
L_13 = 1000e-9;
L_14 = 4000e-9;
L_15 = 4000e-9;
L_16 = 53333e-9;
L_17 = 53333e-9;
L_18 = 15000e-9;
L_19 = 15000e-9;

V_A1 = V_AL*L_1;
V_A2 = V_AL*L_2;
V_A3 = V_AL*L_3;
V_A4 = V_AL*L_4;
V_A5 = V_AL*L_5;
V_A6 = V_AL*L_6;
V_A7 = V_AL*L_7;
V_A8 = V_AL*L_8;
V_A9 = V_AL*L_9;
V_A10 = V_AL*L_10;
V_A11 = V_AL*L_11;
V_A12 = V_AL*L_12;
V_A13 = V_AL*L_13;
V_A14 = V_AL*L_14;
V_A15 = V_AL*L_15;
V_A16 = V_AL*L_16;
V_A17 = V_AL*L_17;
V_A18 = V_AL*L_18;
V_A19 = V_AL*L_19;

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
I_12 = 2*I_tail;
I_13 = 2*I_tail;
I_14 = 2*I_tail;
I_15 = 2*I_tail;
I_16 = I_tail/2;
I_17 = I_tail/2;
I_18 = I_tail/2;
I_19 = I_tail/2;

r_o1 = V_A1/I_1;
r_o2 = V_A2/I_2;
r_o3 = V_A3/I_3;
r_o4 = V_A4/I_4;
r_o5 = V_A5/I_5;
r_o6 = V_A6/I_6;
r_o7 = V_A7/I_7;
r_o8 = V_A8/I_8;
r_o9 = V_A9/I_9;
r_o10 = V_A10/I_10;
r_o11 = V_A11/I_11;
r_o12 = V_A12/I_12;
r_o13 = V_A13/I_13;
r_o14 = V_A14/I_13;
r_o15 = V_A15/I_13;

%Specific Currents
I_o_n = (4.0e-6)/1.5;
I_o_p = (1.0e-6)/1.5;

IC_strong = 2;
IC_weak = .1;

W_over_L_1 = I_1/(I_o_p*IC_strong);
W_over_L_2 = I_2/(I_o_p*IC_weak);
W_over_L_3 = I_3/(I_o_p*IC_weak);
W_over_L_4 = I_4/(I_o_n*IC_strong);
W_over_L_5 = I_5/(I_o_n*IC_strong);
W_over_L_6 = I_6/(I_o_n*IC_weak);
W_over_L_7 = I_7/(I_o_n*IC_weak);
W_over_L_8 = I_8/(I_o_p*IC_weak);
W_over_L_9 = I_9/(I_o_p*IC_weak);
W_over_L_10 = I_10/(I_o_p*IC_strong);
W_over_L_11 = I_11/(I_o_p*IC_strong);
W_over_L_12 = I_12/(I_o_n*IC_weak);
W_over_L_13 = I_13/(I_o_n*IC_weak);
W_over_L_14 = I_14/(I_o_p*IC_strong);
W_over_L_15 = I_15/(I_o_p*IC_strong);
W_over_L_16 = I_16/(I_o_n*IC_strong);
W_over_L_17 = I_17/(I_o_n*IC_strong);
W_over_L_18 = I_18/(I_o_p*IC_strong);
W_over_L_19 = I_19/(I_o_p*IC_strong);


W_1 = W_over_L_1*L_1;
W_2 = W_over_L_2*L_2;
W_3 = W_over_L_3*L_3;
W_4 = W_over_L_4*L_4;
W_5 = W_over_L_5*L_5;
W_6 = W_over_L_6*L_6;
W_7 = W_over_L_7*L_7;
W_8 = W_over_L_8*L_8;
W_9 = W_over_L_9*L_9;
W_10 = W_over_L_10*L_10;
W_11 = W_over_L_11*L_11;
W_12 = W_over_L_12*L_12;
W_13 = W_over_L_13*L_13;
W_14 = W_over_L_14*L_14;
W_15 = W_over_L_15*L_15;
W_16 = W_over_L_16*L_16;
W_17 = W_over_L_17*L_17;
W_18 = W_over_L_18*L_18;
W_19 = W_over_L_19*L_19;


%g_m1 = I_1 / (n*phi_t);
g_m2 = I_2 / (n*phi_t);
g_m3 = I_3 / (n*phi_t);
%g_m4 = I_4 / (n*phi_t);
%g_m5 = I_5 / (n*phi_t);
g_m6 = I_6 / (n*phi_t);
g_m7 = I_7 / (n*phi_t);
g_m8 = I_8 / (n*phi_t);
g_m9 = I_9 / (n*phi_t);
%g_m10 = I_10 / (n*phi_t);
%g_m11 = I_11 / (n*phi_t);
g_m12 = I_12 / (n*phi_t);
g_m13 = I_13 / (n*phi_t);
%g_m14 = I_14 / (n*phi_t);
%g_m15 = I_15 / (n*phi_t);
%g_m16 = I_16 / (n*phi_t);
%g_m17 = I_17 / (n*phi_t);
%g_m18 = I_18 / (n*phi_t);
%g_m19 = I_19 / (n*phi_t);

V_ov1 = sqrt(2*I_1/(beta_p*W_over_L_1));
V_ov4 = sqrt(2*I_4/(beta_n*W_over_L_4));
V_ov5 = sqrt(2*I_5/(beta_n*W_over_L_5));
V_ov10 = sqrt(2*I_10/(beta_p*W_over_L_10));
V_ov11 = sqrt(2*I_11/(beta_p*W_over_L_11));
V_ov14 = sqrt(2*I_14/(beta_p*W_over_L_14));
V_ov15 = sqrt(2*I_15/(beta_p*W_over_L_15));
V_ov16 = sqrt(2*I_16/(beta_n*W_over_L_16));
V_ov17 = sqrt(2*I_17/(beta_n*W_over_L_17));
V_ov18 = sqrt(2*I_18/(beta_p*W_over_L_18));
V_ov19 = sqrt(2*I_19/(beta_p*W_over_L_19));

g_m1 = I_1/(V_ov1/2);
g_m4 = I_1/(V_ov4/2);
g_m5 = I_1/(V_ov5/2);
g_m10 = I_1/(V_ov10/2);
g_m11 = I_1/(V_ov11/2);
g_m14 = I_1/(V_ov14/2);
g_m15 = I_1/(V_ov15/2);
g_m16 = I_1/(V_ov16/2);
g_m17 = I_1/(V_ov17/2);
g_m18 = I_1/(V_ov18/2);
g_m19 = I_1/(V_ov19/2);

V_GS6 = .375;%V
V_b3 = V_ov4+V_GS6;
W_over_L_28 = 2*(I_tail)/(beta_n*(V_b3-V_Tn));
W_28 = 250e-9;
L_28 = W_28/W_over_L_28;

V_GS9 = .424;%V
V_b4 = V_ov11 + V_GS9;
W_over_L_29 = 2*(I_tail)/(beta_p*(V_b4-V_Tp));
W_29 = 250e-9;
L_29 = W_29/W_over_L_29;

%Gain.
r_casc = parallel([(g_m9*r_o9*r_o11), (g_m7*r_o7*parallel([r_o3, r_o5]))]);
A_casc = g_m3*r_casc;
r_out = r_o13/2;
A_cs = g_m13*r_out;
A = A_casc*A_cs;
A_db = 20*log10(A);

%Bandwidth.
C_c = 10*C_h;
f_3db = 1/(2*pi*r_casc*C_c);
f_ugb = f_3db*10^(A_db/20);

