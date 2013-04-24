%%% Specific current calculations
clear all
close all

load pmos_i_vgs

v_gs = pmos_i_v_gs(:,1);
i_ds = pmos_i_v_gs(:,2);
v_gs = flipud(v_gs);
i_ds = flipud(i_ds)-min(i_ds);

g_m_calc = diff(i_ds)./diff(v_gs);
g_m_over_i_calc = g_m_calc./i_ds(2:end);


offset1=2000;

m1 = (log10(g_m_over_i_calc(offset1+1))-log10(g_m_over_i_calc(offset1)))/...
    (log10(i_ds(offset1+1))-log10(i_ds(offset1)));

x = linspace(1e-12,1e-3,10000);
 
y1 = 10.^(m1*(log10(x)-log10(i_ds(offset1))) + log10(g_m_over_i_calc(offset1)) );
 
offset = 1000;
 
m2 = (log10(g_m_over_i_calc(end)) - log10(g_m_over_i_calc(end-offset)))/...
     (log10(i_ds(end))-log10(i_ds(end-offset)));
 
y2 = 10.^(m2*(log10(x)-log10(i_ds(end-offset))) + log10(g_m_over_i_calc(end-offset)));
 
 for i=1:length(x)
     if y1(i) > y2(i)
         I_specific = x(i);
         break
    end
end


pmos_specI = figure();
loglog(x,y1,'r',...
     x,y2,'g',...
     i_ds(1:end-1),g_m_over_i_calc,'.',...
     'LineWidth',1)
xlabel('I_{DS} (A)','fontsize',14)
ylabel('g_m/I_{DS} (V^{-1})','fontsize',14)
xlim([1e-15,1e-3])
ylim([.5e0,100])
