%%% Specific current calculations
clear all
close all

load nmos_i_vgs
load gmi_n

v_gs = data(:,1);
i_ds = data(:,2);

g_m_calc = diff(i_ds)./diff(v_gs);
g_m_over_i_calc = g_m_calc./i_ds(2:end);
g_m_over_i_meas = measData(:,2);

[max_eff, i_max_eff] = max(g_m_over_i_meas);

x = linspace(1e-12,1e-3,10000);
m1 = (log10(g_m_over_i_meas(i_max_eff+1))-log10(g_m_over_i_meas(i_max_eff)))/...
    (log10(i_ds(i_max_eff+1))-log10(i_ds(i_max_eff)));

y1 = 10.^(m1*(log10(x)-log10(i_ds(i_max_eff))) + log10(g_m_over_i_meas(i_max_eff)) );

offset = 4000;

m2 = (log10(g_m_over_i_meas(end)) - log10(g_m_over_i_meas(end-offset)))/...
    (log10(i_ds(end))-log10(i_ds(end-offset)));

y2 = 10.^(m2*(log10(x)-log10(i_ds(end-offset))) + log10(g_m_over_i_meas(end-offset)));

for i=1:length(x)
    if y1(i) > y2(i)
        I_specific = x(i);
        %I_specific = 1.656e-5
        break
    end
end

nmos_specI = figure();
loglog(x,y1,'r',...
    x,y2,'g',...
    i_ds,g_m_over_i_meas,'.',...
    'LineWidth',1)
xlabel('I_{DS} (A)','fontsize',14)
ylabel('g_m/I_{DS} (V^{-1})','fontsize',14)
xlim([1e-12,1e-3])
ylim([.5e0,40])
