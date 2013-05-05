%%% Joseph Meyer & Miles Sherman - E6312 Project: Plotting Script
%% Open Loop OTA Differential Mode Gain
clear all
close all

load open_dm_gain

f_unity = 0;
for i = 1:length(open_dm_gain_tt)
    if open_dm_gain_tt(i,2) < 0
        f_unity = open_dm_gain_tt(i-1,1);
        f_unity_index = i;
        break
    end
end

fig_open_dm_gain = figure();
semilogx(...
    open_dm_gain_ss(:,1),open_dm_gain_ss(:,2),...
    open_dm_gain_ff(:,1),open_dm_gain_ff(:,2),...
    open_dm_gain_tt(:,1),open_dm_gain_tt(:,2),...
    f_unity,0,'k*',...
    'LineWidth',2,'MarkerSize',10)
xlim([1e-3,1e9])
ylim([-50,120])
xlabel('Frequency (Hz)','fontsize',14)
ylabel('Differential Gain (dB)','fontsize',14)
grid
legend('ss','ff','tt','Unity Gain Frequency = 87.1kHz','Location','SouthWest')
saveas(fig_open_dm_gain,'open_dm_gain.eps','epsc')

% Open Loop OTA Differential Mode Phase
load open_dm_phase

phase_margin_x = [f_unity,f_unity+.00000001];
phase_margin_y = [-180,open_dm_phase_tt(f_unity_index,2)];
phase_margin = -phase_margin_y(1) + phase_margin_y(2);

fig_open_dm_phase = figure();
semilogx(...
    phase_margin_x,phase_margin_y,'--k',...
    open_dm_phase_ss(:,1),open_dm_phase_ss(:,2),...
    open_dm_phase_ff(:,1),open_dm_phase_ff(:,2),...
    open_dm_phase_tt(:,1),open_dm_phase_tt(:,2),...
    'LineWidth',2)
xlim([1e-3,1e9])
ylim([-600,50])
xlabel('Frequency (Hz)','fontsize',14)
ylabel('Differential Phase (Degrees)','fontsize',14)
grid
legend('Phase Margin = 75.0 Degrees','ss','ff','tt','Location','SouthWest')
saveas(fig_open_dm_phase,'open_dm_phase.eps','epsc')

%% Open Loop OTA Common Mode Gain
clear all
close all

load open_cm_gain

fig_open_cm_gain = figure();
semilogx(...
    open_cm_gain_ss(:,1),open_cm_gain_ss(:,2),...
    open_cm_gain_ff(:,1),open_cm_gain_ff(:,2),...
    open_cm_gain_tt(:,1),open_cm_gain_tt(:,2),...
    'LineWidth',2)
xlim([1e-3,1e9])
ylim([-60,0])
xlabel('Frequency (Hz)','fontsize',14)
ylabel('Common Mode Gain (dB)','fontsize',14)
grid
legend('ss','ff','tt','Location','NorthEast')
saveas(fig_open_cm_gain,'open_cm_gain.eps','epsc')

%% Open Loop OTA Common Mode Phase
clear all
close all

load open_cm_phase

fig_open_cm_phase = figure();
semilogx(...
    open_cm_phase_ss(:,1),open_cm_phase_ss(:,2),...
    open_cm_phase_ff(:,1),open_cm_phase_ff(:,2),...
    open_cm_phase_tt(:,1),open_cm_phase_tt(:,2),...
    'LineWidth',2)
xlim([1e-3,1e9])
ylim([-600,50])
xlabel('Frequency (Hz)','fontsize',14)
ylabel('Common Mode Phase (Degrees)','fontsize',14)
grid
legend('ss','ff','tt','Location','SouthWest')
saveas(fig_open_cm_phase,'open_cm_phase.eps','epsc')

%% Closed Loop Small Step
clear all
close all

load closed_small_step

fig_closed_small_step = figure();
plot(...
    closed_small_step_input(:,1),closed_small_step_input(:,2),'k',...
    closed_small_step_output_ss(:,1),closed_small_step_output_ss(:,2),...
    closed_small_step_output_ff(:,1),closed_small_step_output_ff(:,2),...
    closed_small_step_output_tt(:,1),closed_small_step_output_tt(:,2),...
    'LineWidth',2)
%xlim{[])
%ylim([])
grid
xlabel('Time (s)','fontsize',14)
ylabel('Voltage (V)','fontsize',14)
legend('Input','Output ss','Output ff','Output tt','Location','NorthWest')
saveas(fig_closed_small_step,'closed_small_step.eps','epsc')

%% Closed Loop Sine
clear all
close all

load closed_sine

fig_closed_sine = figure();
plot(...
    closed_sine_input(:,1),closed_sine_input(:,2),'k',...
    closed_sine_output_ss(:,1),closed_sine_output_ss(:,2),...
    closed_sine_output_ff(:,1),closed_sine_output_ff(:,2),...
    closed_sine_output_tt(:,1),closed_sine_output_tt(:,2),...
    'LineWidth',2)
grid
xlim([0,1e-3])
ylim([-1.75,1.75])
xlabel('Time (s)','fontsize',14)
ylabel('Voltage (V)','fontsize',14)
legend('Input','Output ss','Output ff','Output tt','Location','SouthWest')
saveas(fig_closed_sine,'closed_sine.eps','epsc')

%% Closed Loop saw
clear all
close all

load closed_saw

fig_closed_saw = figure();
plot(...
    closed_saw_input(:,1),closed_saw_input(:,2),'k',...
    closed_saw_output_ss(:,1),closed_saw_output_ss(:,2),...
    closed_saw_output_ff(:,1),closed_saw_output_ff(:,2),...
    closed_saw_output_tt(:,1),closed_saw_output_tt(:,2),...
    'LineWidth',2)
grid
xlim([0,10e-3])
ylim([-1.75,1.75])
xlabel('Time (s)','fontsize',14)
ylabel('Voltage (V)','fontsize',14)
legend('Input','Output ss','Output ff','Output tt','Location','NorthWest')
saveas(fig_closed_saw,'closed_saw.eps','epsc')

%% Closed Loop large_step
clear all
close all

load closed_large_step

fig_closed_large_step = figure();
plot(...
    closed_large_step_input(:,1),closed_large_step_input(:,2),'k',...
    closed_large_step_output_ss(:,1),closed_large_step_output_ss(:,2),...
    closed_large_step_output_ff(:,1),closed_large_step_output_ff(:,2),...
    closed_large_step_output_tt(:,1),closed_large_step_output_tt(:,2),...
    'LineWidth',2)
grid
xlim([0,3e-3])
ylim([-1.75,1.75])
xlabel('Time (s)','fontsize',14)
ylabel('Voltage (V)','fontsize',14)
legend('Input','Output ss','Output ff','Output tt','Location','NorthWest')
saveas(fig_closed_large_step,'closed_large_step.eps','epsc') 