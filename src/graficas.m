% REPRESENTACIï¿½N GRï¿½FICA DE TODOS LOS PARï¿½METROS
% Tronco
% figure;
% 
% subplot(3,1,1,'Ylim',[-6 6],...
% 'YTick',[-6 -4 -2 0 2 4 6],...
% 'YGrid','on',...
% 'XGrid','on');
% hold on
% plot(escala_normal,angulos_tronco.alfa_tr_repC1);
% plot(escala_normal,angulos_tronco.alfa_tr_repC2);
% plot(escala_normal,angulos_tronco.alfa_tr_repC3);
% plot(escala_normal,angulos_tronco.alfa_tr_repC4);
% plot(escala_normal,angulos_tronco.alfa_tr_repC5);
% plottitle=['ï¿½ngulo alfa del tronco: + balanceo lateral hacia la derecha'];
% title(plottitle)
% 
% 
% subplot(3,1,2,'Ylim',[-6 6],...
% 'YTick',[-6 -4 -2 0 2 4 6],...
% 'YGrid','on',...
% 'XGrid','on');
% hold on
% plot(escala_normal,angulos_tronco.beta_tr_repC1);
% plot(escala_normal,angulos_tronco.beta_tr_repC2);
% plot(escala_normal,angulos_tronco.beta_tr_repC3);
% plot(escala_normal,angulos_tronco.beta_tr_repC4);
% plot(escala_normal,angulos_tronco.beta_tr_repC5);
% plottitle=['ï¿½ngulo beta del tronco: + torsion hacia la izquierda'];
% title(plottitle)
% 
% subplot(3,1,3,'Ylim',[-5 5],...
% 'YTick',[-5 -2.5 0 2.5 5],...
% 'YGrid','on',...
% 'XGrid','on');
% hold on
% plot(escala_normal,angulos_tronco.gamma_tr_repC1);
% plot(escala_normal,angulos_tronco.gamma_tr_repC2);
% plot(escala_normal,angulos_tronco.gamma_tr_repC3);
% plot(escala_normal,angulos_tronco.gamma_tr_repC4);
% plot(escala_normal,angulos_tronco.gamma_tr_repC5);
% plottitle=['ï¿½ngulo gamma del tronco: + extensiï¿½n'];
% title(plottitle)

f1=figure('visible','off');
subplot(3,1,1,'Ylim',[-6 6],...
'YTick',[-6 -4 -2 0 2 4 6],...
'YGrid','on',...
'XGrid','on');
hold on
plot(escala_normal,angulos_tronco.media_alfa,'k');
Ih=findall(gca, 'type', 'line');
yy=get(Ih, 'ydata');
ymax=max(yy);
ymax_alpha_tr=num2str(ymax,2);
ymin=min(yy);
ymin_alpha_tr=num2str(ymin,2);
plot(escala_normal,angulos_tronco.media_alfa+angulos_tronco.desviacion_alfa,'r');
plot(escala_normal,angulos_tronco.media_alfa-angulos_tronco.desviacion_alfa,'b');
legend('Media','Media+SD','Media-SD')
plottitle=['Curva media ángulo alfa del tronco: balanceo'];
title(plottitle)

subplot(3,1,2,'Ylim',[-6 6],...
'YTick',[-6 -4 -2 0 2 4 6],...
'YGrid','on',...
'XGrid','on');
hold on
plot(escala_normal,angulos_tronco.media_beta,'k');
Ih=findall(gca, 'type', 'line');
yy=get(Ih, 'ydata');
ymax=max(yy);
ymax_beta_tr=num2str(ymax,2);
ymin=min(yy);
ymin_beta_tr=num2str(ymin,2);
plot(escala_normal,angulos_tronco.media_beta+angulos_tronco.desviacion_beta,'r');
plot(escala_normal,angulos_tronco.media_beta-angulos_tronco.desviacion_beta,'b');
legend('Media','Media+SD','Media-SD')
plottitle=['Curva media ángulo beta del tronco: torsión'];
title(plottitle)

subplot(3,1,3,'Ylim',[-5 5],...
'YTick',[-5 -2.5 0 2.5 5],...
'YGrid','on',...
'XGrid','on');
hold on
plot(escala_normal,angulos_tronco.media_gamma,'k');
Ih=findall(gca, 'type', 'line');
yy=get(Ih, 'ydata');
ymax=max(yy);
ymax_gamma_tr=num2str(ymax,2);
ymin=min(yy);
ymin_gamma_tr=num2str(ymin,2);
plot(escala_normal,angulos_tronco.media_gamma+angulos_tronco.desviacion_gamma,'r');
plot(escala_normal,angulos_tronco.media_gamma-angulos_tronco.desviacion_gamma,'b');
legend('Media','Media+SD','Media-SD')
plottitle=['Curva media ángulo gamma del tronco: extensión'];
title(plottitle)
saveas(gcf,'angulostronco.jpeg');

% % Momentos en el hombro
% % figure;
% % 
% % subplot(3,1,1,'Ylim',[-5 15],...
% % 'YTick',[-5 -2.5 0 2.5 5 7.5 10 12.5 15],...
% % 'YGrid','on',...
% % 'XGrid','on');
% % hold on
% % plot(escala_normal,momentos_hombro.m_hombro_xC1);
% % plot(escala_normal,momentos_hombro.m_hombro_xC2);
% % plot(escala_normal,momentos_hombro.m_hombro_xC3);
% % plot(escala_normal,momentos_hombro.m_hombro_xC4);
% % plot(escala_normal,momentos_hombro.m_hombro_xC5);
% % plottitle = ['Momentos del brazo sobre el tronco en SRL tronco: componente x'];
% % title(plottitle)
% % 
% % subplot(3,1,2,'Ylim',[-5 15],...
% % 'YTick',[-5 -2.5 0 2.5 5 7.5 10 12.5 15],...
% % 'YGrid','on',...
% % 'XGrid','on');
% % hold on
% % plot(escala_normal,momentos_hombro.m_hombro_yC1);
% % plot(escala_normal,momentos_hombro.m_hombro_yC2);
% % plot(escala_normal,momentos_hombro.m_hombro_yC3);
% % plot(escala_normal,momentos_hombro.m_hombro_yC4);
% % plot(escala_normal,momentos_hombro.m_hombro_yC5);
% % plottitle = ['Momentos del brazo sobre el tronco en SRL tronco: componente y'];
% % title(plottitle)
% % 
% % subplot(3,1,3,'Ylim',[-15 45],...
% % 'YTick',[-15 -10 -5 0 5 10 15 20 25 30 35 40 45],...
% % 'YGrid','on',...
% % 'XGrid','on');
% % hold on
% % plot(escala_normal,momentos_hombro.m_hombro_zC1);
% % plot(escala_normal,momentos_hombro.m_hombro_zC2);
% % plot(escala_normal,momentos_hombro.m_hombro_zC3);
% % plot(escala_normal,momentos_hombro.m_hombro_zC4);
% % plot(escala_normal,momentos_hombro.m_hombro_zC5);
% % plottitle = ['Momentos del brazo sobre el tronco en SRL tronco: componente z'];
% % title(plottitle)
% 
f2=figure('visible','off');
subplot(3,1,1,'Ylim',[-5 5],...
'YTick',[-5 -4 -3 -2 -1 0 1 2 3 4 5],...
'YGrid','on',...
'XGrid','on');
hold on
plot(escala_normal,momentos_hombro.media_m_hombro_x,'k');
Ih=findall(gca, 'type', 'line');
yy=get(Ih, 'ydata');
ymax=max(yy);
ymax_momentox_hombro=num2str(ymax,2);
ymin=min(yy);
ymin_momentox_hombro=num2str(ymin,2);
plot(escala_normal,momentos_hombro.media_m_hombro_x+momentos_hombro.desviacion_m_hombro_x,'r');
plot(escala_normal,momentos_hombro.media_m_hombro_x-momentos_hombro.desviacion_m_hombro_x,'b');
legend('Media','Media+SD','Media-SD')
plottitle = ['Media momentos del brazo sobre el tronco: componente x'];
title(plottitle)

subplot(3,1,2,'Ylim',[-10 8],...
'YTick',[-10 -8 -6 -4 -2 0 2 4 6 8],...
'YGrid','on',...
'XGrid','on');
hold on
plot(escala_normal,momentos_hombro.media_m_hombro_y,'k');
Ih=findall(gca, 'type', 'line');
yy=get(Ih, 'ydata');
ymax=max(yy);
ymax_momentoy_hombro=num2str(ymax,2);
ymin=min(yy);
ymin_momentoy_hombro=num2str(ymin,2);
plot(escala_normal,momentos_hombro.media_m_hombro_y+momentos_hombro.desviacion_m_hombro_y,'r');
plot(escala_normal,momentos_hombro.media_m_hombro_y-momentos_hombro.desviacion_m_hombro_y,'b');
legend('Media','Media+SD','Media-SD')
plottitle = ['Media momentos del brazo sobre el tronco: componente y'];
title(plottitle)

subplot(3,1,3,'Ylim',[-15 15],...
'YTick',[-15 -10 -5 0 5 10 15],...
'YGrid','on',...
'XGrid','on');
hold on
plot(escala_normal,momentos_hombro.media_m_hombro_z,'k');
Ih=findall(gca, 'type', 'line');
yy=get(Ih, 'ydata');
ymax=max(yy);
ymax_momentoz_hombro=num2str(ymax,2);
ymin=min(yy);
ymin_momentoz_hombro=num2str(ymin,2);
plot(escala_normal,momentos_hombro.media_m_hombro_z+momentos_hombro.desviacion_m_hombro_z,'r');
plot(escala_normal,momentos_hombro.media_m_hombro_z-momentos_hombro.desviacion_m_hombro_z,'b');
legend('Media','Media+SD','Media-SD')
plottitle = ['Media momentos del brazo sobre el tronco: componente z'];
title(plottitle)
saveas(gcf,'momentoshombro.jpeg');

% % Esfuerzos en el hombro
% % figure;
% % 
% % subplot(3,1,1,'Ylim',[-50 90],...
% % 'YTick',[-50 -30 -10 0 10 30 50 70 90 ],...
% % 'YGrid','on',...
% % 'XGrid','on');
% % hold on
% % plot(escala_normal,fuerzas_hombro.f_hombro_xC1);
% % plot(escala_normal,fuerzas_hombro.f_hombro_xC2);
% % plot(escala_normal,fuerzas_hombro.f_hombro_xC3);
% % plot(escala_normal,fuerzas_hombro.f_hombro_xC4);
% % plot(escala_normal,fuerzas_hombro.f_hombro_xC5);
% % plottitle = ['Fuerzas del brazo sobre el tronco en SRL tronco: componente x'];
% % title(plottitle)
% % 
% % subplot(3,1,2,'Ylim',[-90 0],...
% % 'YTick',[-90 -80 -70 -60 -50 -40 -30 -20 -10 0],...
% % 'YGrid','on',...
% % 'XGrid','on');
% % hold on
% % plot(escala_normal,fuerzas_hombro.f_hombro_yC1);
% % plot(escala_normal,fuerzas_hombro.f_hombro_yC2);
% % plot(escala_normal,fuerzas_hombro.f_hombro_yC3);
% % plot(escala_normal,fuerzas_hombro.f_hombro_yC4);
% % plot(escala_normal,fuerzas_hombro.f_hombro_yC5);
% % plottitle = ['Fuerzas del brazo sobre el tronco en SRL tronco: componente y'];
% % title(plottitle)
% % 
% % subplot(3,1,3,'Ylim',[-50 30],...
% % 'YTick',[-50 -40 -30 -20 -10 0 10 20 30],...
% % 'YGrid','on',...
% % 'XGrid','on');
% % hold on
% % plot(escala_normal,fuerzas_hombro.f_hombro_zC1);
% % plot(escala_normal,fuerzas_hombro.f_hombro_zC2);
% % plot(escala_normal,fuerzas_hombro.f_hombro_zC3);
% % plot(escala_normal,fuerzas_hombro.f_hombro_zC4);
% % plot(escala_normal,fuerzas_hombro.f_hombro_zC5);
% % plottitle = ['Fuerzas del brazo sobre el tronco en SRL tronco: componente z'];
% % title(plottitle)
% 
f3=figure('visible','off');
subplot(3,1,1,'Ylim',[-50 70],...
'YTick',[-50 -30 -10 0 10 30 50 70],...
'YGrid','on',...
'XGrid','on');
hold on
plot(escala_normal,fuerzas_hombro.media_f_hombro_x,'k');
Ih=findall(gca, 'type', 'line');
yy=get(Ih, 'ydata');
ymax=max(yy);
ymax_fuerzax_hombro=num2str(ymax,2);
ymin=min(yy);
ymin_fuerzax_hombro=num2str(ymin,2);
plot(escala_normal,fuerzas_hombro.media_f_hombro_x+fuerzas_hombro.desviacion_f_hombro_x,'r');
plot(escala_normal,fuerzas_hombro.media_f_hombro_x-fuerzas_hombro.desviacion_f_hombro_x,'b');
legend('Media','Media+SD','Media-SD')
plottitle = ['Media de las fuerzas del brazo sobre el tronco: componente x'];
title(plottitle)

subplot(3,1,2,'Ylim',[-70 10],...
'YTick',[-70 -60 -50 -40 -30 -20 -10 0 10],...
'YGrid','on',...
'XGrid','on');
hold on
plot(escala_normal,fuerzas_hombro.media_f_hombro_y,'k');
Ih=findall(gca, 'type', 'line');
yy=get(Ih, 'ydata');
ymax=max(yy);
ymax_fuerzay_hombro=num2str(ymax,2);
ymin=min(yy);
ymin_fuerzay_hombro=num2str(ymin,2);
plot(escala_normal,fuerzas_hombro.media_f_hombro_y+fuerzas_hombro.desviacion_f_hombro_y,'r');
plot(escala_normal,fuerzas_hombro.media_f_hombro_y-fuerzas_hombro.desviacion_f_hombro_y,'b');
legend('Media','Media+SD','Media-SD')
plottitle = ['Media de las fuerzas del brazo sobre el tronco: componente y'];
title(plottitle)

subplot(3,1,3,'Ylim',[-20 30],...
'YTick',[-20 -10 0 10 20 30],...
'YGrid','on',...
'XGrid','on');
hold on
plot(escala_normal,fuerzas_hombro.media_f_hombro_z,'k');
Ih=findall(gca, 'type', 'line');
yy=get(Ih, 'ydata');
ymax=max(yy);
ymax_fuerzaz_hombro=num2str(ymax,2);
ymin=min(yy);
ymin_fuerzaz_hombro=num2str(ymin,2);
plot(escala_normal,fuerzas_hombro.media_f_hombro_z+fuerzas_hombro.desviacion_f_hombro_z,'r');
plot(escala_normal,fuerzas_hombro.media_f_hombro_z-fuerzas_hombro.desviacion_f_hombro_z,'b');
legend('Media','Media+SD','Media-SD')
plottitle = ['Media de las fuerzas del brazo sobre el tronco: componente z'];
title(plottitle)
saveas(gcf,'fuerzashombro.jpeg');

% % Hombro
% % figure;
% % 
% % subplot(3,1,1,'Ylim',[-50 0],...
% % 'YTick',[-50 -40 -30 -20 -10 0],...
% % 'YGrid','on',...
% % 'XGrid','on');
% % hold on
% % plot(escala_normal,angulos_hombro.alfa_rsho_repC1);
% % plot(escala_normal,angulos_hombro.alfa_rsho_repC2);
% % plot(escala_normal,angulos_hombro.alfa_rsho_repC3);
% % plot(escala_normal,angulos_hombro.alfa_rsho_repC4);
% % plot(escala_normal,angulos_hombro.alfa_rsho_repC5);
% % plottitle=['ï¿½ngulo alfa en el hombro: + elevaciï¿½n negativa (o adduciï¿½n)'];
% % title(plottitle)
% % 
% % subplot(3,1,2,'Ylim',[-100 100],...
% % 'YTick',[-100 -75 -50 -25 0 25 50 75 100],...
% % 'YGrid','on',...
% % 'XGrid','on');
% % hold on
% % plot(escala_normal,angulos_hombro.beta_rsho_repC1);
% % plot(escala_normal,angulos_hombro.beta_rsho_repC2);
% % plot(escala_normal,angulos_hombro.beta_rsho_repC3);
% % plot(escala_normal,angulos_hombro.beta_rsho_repC4);
% % plot(escala_normal,angulos_hombro.beta_rsho_repC5);
% % plottitle=['ï¿½ngulo beta en el hombro: + Plano de elevaciï¿½n por delante de la lï¿½nea horizontal que conecta los acromiones'];
% % title(plottitle)
% % 
% % subplot(3,1,3,'Ylim',[-50 90],...
% % 'YTick',[-50 -30 -10 0 10 30 50 70 90],...
% % 'YGrid','on',...
% % 'XGrid','on');
% % hold on
% % plot(escala_normal,angulos_hombro.gamma_rsho_repC1);
% % plot(escala_normal,angulos_hombro.gamma_rsho_repC2);
% % plot(escala_normal,angulos_hombro.gamma_rsho_repC3);
% % plot(escala_normal,angulos_hombro.gamma_rsho_repC4);
% % plot(escala_normal,angulos_hombro.gamma_rsho_repC5);
% % plottitle=['ï¿½ngulo gamma en el hombro: + rotaciï¿½n interna'];
% % title(plottitle)
% 
f4=figure('visible','off');
subplot(3,1,1,'Ylim',[-45 0],...
'YTick',[-45 -35 -25 -15 -5 0],...
'YGrid','on',...
'XGrid','on');
hold on
plot(escala_normal,angulos_hombro.media_alfa,'k');
Ih=findall(gca, 'type', 'line');
yy=get(Ih, 'ydata');
ymax=max(yy);
ymax_alpha_hombro=num2str(ymax,2);
ymin=min(yy);
ymin_alpha_hombro=num2str(ymin,2);
plot(escala_normal,angulos_hombro.media_alfa+angulos_hombro.desviacion_alfa,'r');
plot(escala_normal,angulos_hombro.media_alfa-angulos_hombro.desviacion_alfa,'b');
legend('Media','Media+SD','Media-SD')
plottitle=['Curva media ángulo alfa en el hombro: elevación'];
title(plottitle)

subplot(3,1,2,'Ylim',[-50 50],...
'YTick',[-50 -40 -30 -20 -10 0 10 20 30 40 50],...
'YGrid','on',...
'XGrid','on');
hold on
plot(escala_normal,angulos_hombro.media_beta,'k');
Ih=findall(gca, 'type', 'line');
yy=get(Ih, 'ydata');
ymax=max(yy);
ymax_beta_hombro=num2str(ymax,2);
ymin=min(yy);
ymin_beta_hombro=num2str(ymin,2);
plot(escala_normal,angulos_hombro.media_beta+angulos_hombro.desviacion_beta,'r');
plot(escala_normal,angulos_hombro.media_beta-angulos_hombro.desviacion_beta,'b');
legend('Media','Media+SD','Media-SD')
plottitle=['Curva media ángulo beta en el hombro: Plano de elevación'];
title(plottitle)

subplot(3,1,3,'Ylim',[-50 90],...
'YTick',[-50 -30 -10 0 10 30 50 70 90],...
'YGrid','on',...
'XGrid','on');
hold on
plot(escala_normal,angulos_hombro.media_gamma,'k');
Ih=findall(gca, 'type', 'line');
yy=get(Ih, 'ydata');
ymax=max(yy);
ymax_gamma_hombro=num2str(ymax,2);
ymin=min(yy);
ymin_gamma_hombro=num2str(ymin,2);
plot(escala_normal,angulos_hombro.media_gamma+angulos_hombro.desviacion_gamma,'r');
plot(escala_normal,angulos_hombro.media_gamma-angulos_hombro.desviacion_gamma,'b');
legend('Media','Media+SD','Media-SD')
plottitle=['Curva media ángulo gamma en el hombro: rotación interna'];
title(plottitle)
saveas(gcf,'anguloshombro.jpeg');

% % Momentos en el codo
% % figure;
% % 
% % subplot(3,1,1,'Ylim',[-4 4],...
% % 'YTick',[-4 -3 -2 -1 0 1 2 3 4],...
% % 'YGrid','on',...
% % 'XGrid','on');
% % hold on
% % plot(escala_normal,momentos_codo.m_codo_xC1);
% % plot(escala_normal,momentos_codo.m_codo_xC2);
% % plot(escala_normal,momentos_codo.m_codo_xC3);
% % plot(escala_normal,momentos_codo.m_codo_xC4);
% % plot(escala_normal,momentos_codo.m_codo_xC5);
% % plottitle = ['Momentos proximales en el codo en globales: componente x'];
% % title(plottitle)
% % 
% % subplot(3,1,2,'Ylim',[-2 2],...
% % 'YTick',[-2 -1.5 -1 -0.5 0 0.5 1 1.5 2],...
% % 'YGrid','on',...
% % 'XGrid','on');
% % hold on
% % plot(escala_normal,momentos_codo.m_codo_yC1);
% % plot(escala_normal,momentos_codo.m_codo_yC2);
% % plot(escala_normal,momentos_codo.m_codo_yC3);
% % plot(escala_normal,momentos_codo.m_codo_yC4);
% % plot(escala_normal,momentos_codo.m_codo_yC5);
% % plottitle = ['Momentos proximales en el codo en globales: componente y'];
% % title(plottitle)
% % 
% % subplot(3,1,3,'Ylim',[-6 6],...
% % 'YTick',[-6 -5 -4 -3 -2 -1 0 1 2 3 4 5 6],...
% % 'YGrid','on',...
% % 'XGrid','on');
% % hold on
% % plot(escala_normal,momentos_codo.m_codo_zC1);
% % plot(escala_normal,momentos_codo.m_codo_zC2);
% % plot(escala_normal,momentos_codo.m_codo_zC3);
% % plot(escala_normal,momentos_codo.m_codo_zC4);
% % plot(escala_normal,momentos_codo.m_codo_zC5);
% % plottitle = ['Momentos proximales en el codo en globales: componente z'];
% % title(plottitle)
% 
f5=figure('visible','off');
subplot(3,1,1,'Ylim',[-4 4],...
'YTick',[-4 -3 -2 -1 0 1 2 3 4],...
'YGrid','on',...
'XGrid','on');
hold on
plot(escala_normal,momentos_codo.media_m_codo_x,'k');
Ih=findall(gca, 'type', 'line');
yy=get(Ih, 'ydata');
ymax=max(yy);
ymax_momentox_codo=num2str(ymax,2);
ymin=min(yy);
ymin_momentox_codo=num2str(ymin,2);
plot(escala_normal,momentos_codo.media_m_codo_x+momentos_codo.desviacion_m_codo_x,'r');
plot(escala_normal,momentos_codo.media_m_codo_x-momentos_codo.desviacion_m_codo_x,'b');
legend('Media','Media+SD','Media-SD')
plottitle = ['Curva media momentos proximales en el codo: componente x'];
title(plottitle)

subplot(3,1,2,'Ylim',[-2 2],...
'YTick',[-2 -1.5 -1 -0.5 0 0.5 1 1.5 2],...
'YGrid','on',...
'XGrid','on');
hold on
plot(escala_normal,momentos_codo.media_m_codo_y,'k');Ih=findall(gca, 'type', 'line');
yy=get(Ih, 'ydata');
ymax=max(yy);
ymax_momentoy_codo=num2str(ymax,2);
ymin=min(yy);
ymin_momentoy_codo=num2str(ymin,2);
plot(escala_normal,momentos_codo.media_m_codo_y+momentos_codo.desviacion_m_codo_y,'r');
plot(escala_normal,momentos_codo.media_m_codo_y-momentos_codo.desviacion_m_codo_y,'b');
legend('Media','Media+SD','Media-SD')
plottitle = ['Curva media momentos proximales en el codo: componente y'];
title(plottitle)

subplot(3,1,3,'Ylim',[-6 6],...
'YTick',[-6 -5 -4 -3 -2 -1 0 1 2 3 4 5 6],...
'YGrid','on',...
'XGrid','on');
hold on
plot(escala_normal,momentos_codo.media_m_codo_z,'k');
Ih=findall(gca, 'type', 'line');
yy=get(Ih, 'ydata');
ymax=max(yy);
ymax_momentoz_codo=num2str(ymax,2);
ymin=min(yy);
ymin_momentoz_codo=num2str(ymin,2);
plot(escala_normal,momentos_codo.media_m_codo_z+momentos_codo.desviacion_m_codo_z,'r');
plot(escala_normal,momentos_codo.media_m_codo_z-momentos_codo.desviacion_m_codo_z,'b');
legend('Media','Media+SD','Media-SD')
plottitle = ['Curva media momentos proximales en el codo: componente z'];
title(plottitle)
saveas(gcf,'momentoscodo.jpeg');

% % Esfuerzos en el codo
% % figure;
% % 
% % subplot(3,1,1,'Ylim',[-50 50],...
% % 'YTick',[-50 -25 0 25 50],...
% % 'YGrid','on',...
% % 'XGrid','on');
% % hold on
% % plot(escala_normal,fuerzas_codo.f_codo_xC1);
% % plot(escala_normal,fuerzas_codo.f_codo_xC2);
% % plot(escala_normal,fuerzas_codo.f_codo_xC3);
% % plot(escala_normal,fuerzas_codo.f_codo_xC4);
% % plot(escala_normal,fuerzas_codo.f_codo_xC5);
% % plottitle = ['Fuerzas proximales en el codo en locales: componente x'];
% % title(plottitle)
% % 
% % subplot(3,1,2,'Ylim',[-50 50],...
% % 'YTick',[-50 -25 0 25 50],...
% % 'YGrid','on',...
% % 'XGrid','on');
% % hold on
% % plot(escala_normal,fuerzas_codo.f_codo_yC1);
% % plot(escala_normal,fuerzas_codo.f_codo_yC2);
% % plot(escala_normal,fuerzas_codo.f_codo_yC3);
% % plot(escala_normal,fuerzas_codo.f_codo_yC4);
% % plot(escala_normal,fuerzas_codo.f_codo_yC5);
% % plottitle = ['Fuerzas proximales en el codo en locales: componente y'];
% % title(plottitle)
% % 
% % subplot(3,1,3,'Ylim',[-50 50],...
% % 'YTick',[-50 -25 0 25 50],...
% % 'YGrid','on',...
% % 'XGrid','on');
% % hold on
% % plot(escala_normal,fuerzas_codo.f_codo_zC1);
% % plot(escala_normal,fuerzas_codo.f_codo_zC2);
% % plot(escala_normal,fuerzas_codo.f_codo_zC3);
% % plot(escala_normal,fuerzas_codo.f_codo_zC4);
% % plot(escala_normal,fuerzas_codo.f_codo_zC5);
% % plottitle = ['Fuerzas proximales en el codo en locales: componente z'];
% % title(plottitle)
% 
f6=figure('visible','off');
subplot(3,1,1,'Ylim',[-50 50],...
'YTick',[-50 -25 0 25 50],...
'YGrid','on',...
'XGrid','on');
hold on
plot(escala_normal,fuerzas_codo.media_f_codo_x,'k');
Ih=findall(gca, 'type', 'line');
yy=get(Ih, 'ydata');
ymax=max(yy);
ymax_fuerzax_codo=num2str(ymax,2);
ymin=min(yy);
ymin_fuerzax_codo=num2str(ymin,2);
plot(escala_normal,fuerzas_codo.media_f_codo_x+fuerzas_codo.desviacion_f_codo_x,'r');
plot(escala_normal,fuerzas_codo.media_f_codo_x-fuerzas_codo.desviacion_f_codo_x,'b');
legend('Media','Media+SD','Media-SD')
plottitle = ['Curva media fuerzas proximales en el codo: componente x'];
title(plottitle)

subplot(3,1,2,'Ylim',[-50 50],...
'YTick',[-50 -25 0 25 50],...
'YGrid','on',...
'XGrid','on');
hold on
plot(escala_normal,fuerzas_codo.media_f_codo_y,'k');
Ih=findall(gca, 'type', 'line');
yy=get(Ih, 'ydata');
ymax=max(yy);
ymax_fuerzay_codo=num2str(ymax,2);
ymin=min(yy);
ymin_fuerzay_codo=num2str(ymin,2);
plot(escala_normal,fuerzas_codo.media_f_codo_y+fuerzas_codo.desviacion_f_codo_y,'r');
plot(escala_normal,fuerzas_codo.media_f_codo_y-fuerzas_codo.desviacion_f_codo_y,'b');
legend('Media','Media+SD','Media-SD')
plottitle = ['Curva media fuerzas proximales en el codo: componente y'];
title(plottitle)

subplot(3,1,3,'Ylim',[-50 50],...
'YTick',[-50 -25 0 25 50],...
'YGrid','on',...
'XGrid','on');
hold on
plot(escala_normal,fuerzas_codo.media_f_codo_z,'k');
Ih=findall(gca, 'type', 'line');
yy=get(Ih, 'ydata');
ymax=max(yy);
ymax_fuerzaz_codo=num2str(ymax,2);
ymin=min(yy);
ymin_fuerzaz_codo=num2str(ymin,2);
plot(escala_normal,fuerzas_codo.media_f_codo_z+fuerzas_codo.desviacion_f_codo_z,'r');
plot(escala_normal,fuerzas_codo.media_f_codo_z-fuerzas_codo.desviacion_f_codo_z,'b');
legend('Media','Media+SD','Media-SD')
plottitle = ['Curva media fuerzas proximales en el codo: componente z'];
title(plottitle)
saveas(gcf,'fuerzascodo.jpeg');

% % Codo
% % figure;
% % 
% % subplot(3,1,1,'Ylim',[-6 6],...
% % 'YTick',[-6 -4 -2 0 2 4 6],...
% % 'YGrid','on',...
% % 'XGrid','on');
% % hold on
% % plot(escala_normal,angulos_codo.alfa_relb_repC1);
% % plot(escala_normal,angulos_codo.alfa_relb_repC2);
% % plot(escala_normal,angulos_codo.alfa_relb_repC3);
% % plot(escala_normal,angulos_codo.alfa_relb_repC4);
% % plot(escala_normal,angulos_codo.alfa_relb_repC5);
% % plottitle=['ï¿½ngulo alfa en el codo: + adducciï¿½n'];
% % title(plottitle)
% % 
% % subplot(3,1,2,'Ylim',[40 120],...
% % 'YTick',[40 50 60 70 80 90 100 110 120],...
% % 'YGrid','on',...
% % 'XGrid','on');
% % hold on
% % plot(escala_normal,angulos_codo.beta_relb_repC1);
% % plot(escala_normal,angulos_codo.beta_relb_repC2);
% % plot(escala_normal,angulos_codo.beta_relb_repC3);
% % plot(escala_normal,angulos_codo.beta_relb_repC4);
% % plot(escala_normal,angulos_codo.beta_relb_repC5);
% % plottitle=['ï¿½ngulo beta en el codo: + rotaciï¿½n interna'];
% % title(plottitle)
% % 
% % subplot(3,1,3,'Ylim',[0 120],...
% % 'YTick',[0 10 20 30 40 50 60 70 80 90 100 110 120],...
% % 'YGrid','on',...
% % 'XGrid','on');
% % hold on
% % plot(escala_normal,angulos_codo.gamma_relb_repC1);
% % plot(escala_normal,angulos_codo.gamma_relb_repC2);
% % plot(escala_normal,angulos_codo.gamma_relb_repC3);
% % plot(escala_normal,angulos_codo.gamma_relb_repC4);
% % plot(escala_normal,angulos_codo.gamma_relb_repC5);
% % plottitle=['ï¿½ngulo gamma en el codo: + flexiï¿½n'];
% % title(plottitle)
% 
f7=figure('visible','off');
subplot(3,1,1,'Ylim',[-6 6],...
'YTick',[-6 -4 -2 0 2 4 6],...
'YGrid','on',...
'XGrid','on');
hold on
% plot(escala_normal,angulos_codo.media_alfa,'k');
% Ih=findall(gca, 'type', 'line');
% yy=get(Ih, 'ydata');
% ymax=max(yy);
% ymax_alpha_codo=num2str(ymax,2);
% ymin=min(yy);
% ymin_alpha_codo=num2str(ymin,2);
% plot(escala_normal,angulos_codo.media_alfa+angulos_codo.desviacion_alfa,'r');
% plot(escala_normal,angulos_codo.media_alfa-angulos_codo.desviacion_alfa,'b');
% legend('Media','Media+SD','Media-SD')
% plottitle=['Curva media ángulo alfa en el codo: aducción'];
% title(plottitle)

subplot(2,1,1,'Ylim',[40 120],...
'YTick',[40 50 60 70 80 90 100 110 120],...
'YGrid','on',...
'XGrid','on');
hold on
plot(escala_normal,angulos_codo.media_beta,'k');
Ih=findall(gca, 'type', 'line');
yy=get(Ih, 'ydata');
ymax=max(yy);
ymax_beta_codo=num2str(ymax,2);
ymin=min(yy);
ymin_beta_codo=num2str(ymin,2);
plot(escala_normal,angulos_codo.media_beta+angulos_codo.desviacion_beta,'r');
plot(escala_normal,angulos_codo.media_beta-angulos_codo.desviacion_beta,'b');
legend('Media','Media+SD','Media-SD')
plottitle=['Curva media ángulo beta en el codo: rotación interna'];
title(plottitle)

subplot(2,1,2,'Ylim',[0 120],...
'YTick',[0 10 20 30 40 50 60 70 80 90 100 110 120],...
'YGrid','on',...
'XGrid','on');
hold on
plot(escala_normal,angulos_codo.media_gamma,'k');
Ih=findall(gca, 'type', 'line');
yy=get(Ih, 'ydata');
ymax=max(yy);
ymax_gamma_codo=num2str(ymax,2);
ymin=min(yy);
ymin_gamma_codo=num2str(ymin,2);
plot(escala_normal,angulos_codo.media_gamma+angulos_codo.desviacion_gamma,'r');
plot(escala_normal,angulos_codo.media_gamma-angulos_codo.desviacion_gamma,'b');
legend('Media','Media+SD','Media-SD')
plottitle=['Cueva media ángulo gamma en el codo: flexión'];
title(plottitle)
saveas(gcf,'anguloscodo.jpeg');

% % Momentos en muï¿½eca
% % figure;
% % 
% % subplot(3,1,1,'Ylim',[-2 2],...
% % 'YTick',[-2 -1.5 -1 -0.5 0 0.5 1 1.5 2],...
% % 'YGrid','on',...
% % 'XGrid','on');
% % hold on
% % plot(escala_normal,momentos_muneca.m_muneca_xC1);
% % plot(escala_normal,momentos_muneca.m_muneca_xC2);
% % plot(escala_normal,momentos_muneca.m_muneca_xC3);
% % plot(escala_normal,momentos_muneca.m_muneca_xC4);
% % plot(escala_normal,momentos_muneca.m_muneca_xC5);
% % plottitle = ['Momentos proximales en la muï¿½eca en globales: componente x'];
% % title(plottitle)
% % 
% % subplot(3,1,2,'Ylim',[-2 2],...
% % 'YTick',[-2 -1.5 -1 -0.5 0 0.5 1 1.5 2],...
% % 'YGrid','on',...
% % 'XGrid','on');
% % hold on
% % plot(escala_normal,momentos_muneca.m_muneca_yC1);
% % plot(escala_normal,momentos_muneca.m_muneca_yC2);
% % plot(escala_normal,momentos_muneca.m_muneca_yC3);
% % plot(escala_normal,momentos_muneca.m_muneca_yC4);
% % plot(escala_normal,momentos_muneca.m_muneca_yC5);
% % plottitle = ['Momentos proximales en la muï¿½eca en globales: componente y'];
% % title(plottitle)
% % 
% % subplot(3,1,3,'Ylim',[-2 2],...
% % 'YTick',[-2 -1.5 -1 -0.5 0 0.5 1 1.5 2],...
% % 'YGrid','on',...
% % 'XGrid','on');
% % hold on
% % plot(escala_normal,momentos_muneca.m_muneca_zC1);
% % plot(escala_normal,momentos_muneca.m_muneca_zC2);
% % plot(escala_normal,momentos_muneca.m_muneca_zC3);
% % plot(escala_normal,momentos_muneca.m_muneca_zC4);
% % plot(escala_normal,momentos_muneca.m_muneca_zC5);
% % plottitle = ['Momentos proximales en la muï¿½eca en globales: componente z'];
% % title(plottitle)
% 
f8=figure('visible','off');
subplot(3,1,1,'Ylim',[-2 2],...
'YTick',[-2 -1.5 -1 -0.5 0 0.5 1 1.5 2],...
'YGrid','on',...
'XGrid','on');
hold on
plot(escala_normal,momentos_muneca.media_m_muneca_x,'k');
Ih=findall(gca, 'type', 'line');
yy=get(Ih, 'ydata');
ymax=max(yy);
ymax_momentox_muneca=num2str(ymax,2);
ymin=min(yy);
ymin_momentox_muneca=num2str(ymin,2);
plot(escala_normal,momentos_muneca.media_m_muneca_x+momentos_muneca.desviacion_m_muneca_x,'r');
plot(escala_normal,momentos_muneca.media_m_muneca_x-momentos_muneca.desviacion_m_muneca_x,'b');
legend('Media','Media+SD','Media-SD')
plottitle = ['Curva media momentos proximales en la muñeca: componente x'];
title(plottitle)

subplot(3,1,2,'Ylim',[-2 2],...
'YTick',[-2 -1.5 -1 -0.5 0 0.5 1 1.5 2],...
'YGrid','on',...
'XGrid','on');
hold on
plot(escala_normal,momentos_muneca.media_m_muneca_y,'k');
Ih=findall(gca, 'type', 'line');
yy=get(Ih, 'ydata');
ymax=max(yy);
ymax_momentoy_muneca=num2str(ymax,2);
ymin=min(yy);
ymin_momentoy_muneca=num2str(ymin,2);
plot(escala_normal,momentos_muneca.media_m_muneca_y+momentos_muneca.desviacion_m_muneca_y,'r');
plot(escala_normal,momentos_muneca.media_m_muneca_y-momentos_muneca.desviacion_m_muneca_y,'b');
legend('Media','Media+SD','Media-SD')
plottitle = ['Media momentos proximales en la muñeca: componente y'];
title(plottitle) 

subplot(3,1,3,'Ylim',[-2 2],...
'YTick',[-2 -1.5 -1 -0.5 0 0.5 1 1.5 2],...
'YGrid','on',...
'XGrid','on');
hold on
plot(escala_normal,momentos_muneca.media_m_muneca_z,'k');
Ih=findall(gca, 'type', 'line');
yy=get(Ih, 'ydata');
ymax=max(yy);
ymax_momentoz_muneca=num2str(ymax,2);
ymin=min(yy);
ymin_momentoz_muneca=num2str(ymin,2);
plot(escala_normal,momentos_muneca.media_m_muneca_z+momentos_muneca.desviacion_m_muneca_z,'r');
plot(escala_normal,momentos_muneca.media_m_muneca_z-momentos_muneca.desviacion_m_muneca_z,'b');
legend('Media','Media+SD','Media-SD')
plottitle = ['Curva media momentos proximales en la muñeca: componente z'];
title(plottitle)
saveas(gcf,'momentosmuneca.jpeg');

% % Esfuerzos en muï¿½eca
% % figure;
% % 
% % subplot(3,1,1,'Ylim',[-50 50],...
% % 'YTick',[-50 -25 0 25 50],...
% % 'YGrid','on',...
% % 'XGrid','on');
% % hold on
% % plot(escala_normal,fuerzas_muneca.f_muneca_xC1);
% % plot(escala_normal,fuerzas_muneca.f_muneca_xC2);
% % plot(escala_normal,fuerzas_muneca.f_muneca_xC3);
% % plot(escala_normal,fuerzas_muneca.f_muneca_xC4);
% % plot(escala_normal,fuerzas_muneca.f_muneca_xC5);
% % plottitle = ['Fuerzas proximales en la muï¿½eca en locales: componente x'];
% % title(plottitle)
% % 
% % subplot(3,1,2,'Ylim',[-50 50],...
% % 'YTick',[-50 -25 0 25 50],...
% % 'YGrid','on',...
% % 'XGrid','on');
% % hold on
% % plot(escala_normal,fuerzas_muneca.f_muneca_yC1);
% % plot(escala_normal,fuerzas_muneca.f_muneca_yC2);
% % plot(escala_normal,fuerzas_muneca.f_muneca_yC3);
% % plot(escala_normal,fuerzas_muneca.f_muneca_yC4);
% % plot(escala_normal,fuerzas_muneca.f_muneca_yC5);
% % plottitle = ['Fuerzas proximales en la muï¿½eca en locales: componente y'];
% % title(plottitle)
% % 
% % subplot(3,1,3,'Ylim',[-50 50],...
% % 'YTick',[-50 -25 0 25 50],...
% % 'YGrid','on',...
% % 'XGrid','on');
% % hold on
% % plot(escala_normal,fuerzas_muneca.f_muneca_zC1);
% % plot(escala_normal,fuerzas_muneca.f_muneca_zC2);
% % plot(escala_normal,fuerzas_muneca.f_muneca_zC3);
% % plot(escala_normal,fuerzas_muneca.f_muneca_zC4);
% % plot(escala_normal,fuerzas_muneca.f_muneca_zC5);
% % plottitle = ['Fuerzas proximales en la muï¿½eca en locales: componente z'];
% % title(plottitle)
% 
f9=figure('visible','off');
subplot(3,1,1,'Ylim',[-50 50],...
'YTick',[-50 -25 0 25 50],...
'YGrid','on',...
'XGrid','on');
hold on
plot(escala_normal,fuerzas_muneca.media_f_muneca_x,'k');
Ih=findall(gca, 'type', 'line');
yy=get(Ih, 'ydata');
ymax=max(yy);
ymax_fuerzax_muneca=num2str(ymax,2);
ymin=min(yy);
ymin_fuerzax_muneca=num2str(ymin,2);
plot(escala_normal,fuerzas_muneca.media_f_muneca_x+fuerzas_muneca.desviacion_f_muneca_x,'r');
plot(escala_normal,fuerzas_muneca.media_f_muneca_x-fuerzas_muneca.desviacion_f_muneca_x,'b');
legend('Media','Media+SD','Media-SD')
plottitle = ['Curva media fuerzas proximales en la muñeca: componente x'];
title(plottitle)

subplot(3,1,2,'Ylim',[-50 50],...
'YTick',[-50 -25 0 25 50],...
'YGrid','on',...
'XGrid','on');
hold on
plot(escala_normal,fuerzas_muneca.media_f_muneca_y,'k');
Ih=findall(gca, 'type', 'line');
yy=get(Ih, 'ydata');
ymax=max(yy);
ymax_fuerzay_muneca=num2str(ymax,2);
ymin=min(yy);
ymin_fuerzay_muneca=num2str(ymin,2);
plot(escala_normal,fuerzas_muneca.media_f_muneca_y+fuerzas_muneca.desviacion_f_muneca_y,'r');
plot(escala_normal,fuerzas_muneca.media_f_muneca_y-fuerzas_muneca.desviacion_f_muneca_y,'b');
legend('Media','Media+SD','Media-SD')
plottitle = ['Curva media fuerzas proximales en la muñeca: componente y'];
title(plottitle)

subplot(3,1,3,'Ylim',[-50 50],...
'YTick',[-50 -25 0 25 50],...
'YGrid','on',...
'XGrid','on');
hold on
plot(escala_normal,fuerzas_muneca.media_f_muneca_z,'k');
Ih=findall(gca, 'type', 'line');
yy=get(Ih, 'ydata');
ymax=max(yy);
ymax_fuerzaz_muneca=num2str(ymax,2);
ymin=min(yy);
ymin_fuerzaz_muneca=num2str(ymin,2);
plot(escala_normal,fuerzas_muneca.media_f_muneca_z+fuerzas_muneca.desviacion_f_muneca_z,'r');
plot(escala_normal,fuerzas_muneca.media_f_muneca_z-fuerzas_muneca.desviacion_f_muneca_z,'b');
legend('Media','Media+SD','Media-SD')
plottitle = ['Curva media fuerzas proximales en la muñeca: componente z'];
title(plottitle)
saveas(gcf,'fuerzasmuneca.jpeg');

% % Muï¿½eca
% % figure;
% % 
% % subplot(3,1,1,'Ylim',[-45 45],...
% % 'YTick',[-45 -35 -25 -15 -5 0 5 15 25 35 45],...
% % 'YGrid','on',...
% % 'XGrid','on');
% % hold on
% % plot(escala_normal,angulos_muneca.alfa_rwr_repC1);
% % plot(escala_normal,angulos_muneca.alfa_rwr_repC2);
% % plot(escala_normal,angulos_muneca.alfa_rwr_repC3);
% % plot(escala_normal,angulos_muneca.alfa_rwr_repC4);
% % plot(escala_normal,angulos_muneca.alfa_rwr_repC5);
% % plottitle=['ï¿½ngulo alfa en la muï¿½eca: + desviaciï¿½n ulnar'];
% % title(plottitle)
% % 
% % subplot(3,1,2,'Ylim',[-45 45],...
% % 'YTick',[-45 -35 -25 -15 -5 0 5 15 25 35 45],...
% % 'YGrid','on',...
% % 'XGrid','on');
% % hold on
% % plot(escala_normal,angulos_muneca.beta_rwr_repC1);
% % plot(escala_normal,angulos_muneca.beta_rwr_repC2);
% % plot(escala_normal,angulos_muneca.beta_rwr_repC3);
% % plot(escala_normal,angulos_muneca.beta_rwr_repC4);
% % plot(escala_normal,angulos_muneca.beta_rwr_repC5);
% % plottitle=['ï¿½ngulo beta en la muï¿½eca: + rotaciï¿½n interna'];
% % title(plottitle)
% % 
% % subplot(3,1,3,'Ylim',[-45 45],...
% % 'YTick',[-45 -35 -25 -15 -5 0 5 15 25 35 45],...
% % 'YGrid','on',...
% % 'XGrid','on');
% % hold on
% % plot(escala_normal,angulos_muneca.gamma_rwr_repC1);
% % plot(escala_normal,angulos_muneca.gamma_rwr_repC2);
% % plot(escala_normal,angulos_muneca.gamma_rwr_repC3);
% % plot(escala_normal,angulos_muneca.gamma_rwr_repC4);
% % plot(escala_normal,angulos_muneca.gamma_rwr_repC5);
% % plottitle=['ï¿½ngulo gamma en la muï¿½eca: + flexiï¿½n'];
% % title(plottitle)
% 
f10=figure('visible','off');
subplot(3,1,1,'Ylim',[-45 45],...
'YTick',[-45 -35 -25 -15 -5 0 5 15 25 35 45],...
'YGrid','on',...
'XGrid','on');
hold on
plot(escala_normal,angulos_muneca.media_alfa,'k');
Ih=findall(gca, 'type', 'line');
yy=get(Ih, 'ydata');
ymax=max(yy);
ymax_alpha_muneca=num2str(ymax,2);
ymin=min(yy);
ymin_alpha_muneca=num2str(ymin,2);
plot(escala_normal,angulos_muneca.media_alfa+angulos_muneca.desviacion_alfa,'r');
plot(escala_normal,angulos_muneca.media_alfa-angulos_muneca.desviacion_alfa,'b');
legend('Media','Media+SD','Media-SD')
plottitle=['Curva media ángulo alfa en la muñeca: desviación ulnar'];
title(plottitle)

subplot(3,1,2,'Ylim',[-45 45],...
'YTick',[-45 -35 -25 -15 -5 0 5 15 25 35 45],...
'YGrid','on',...
'XGrid','on');
hold on
plot(escala_normal,angulos_muneca.media_beta,'k');
Ih=findall(gca, 'type', 'line');
yy=get(Ih, 'ydata');
ymax=max(yy);
ymax_beta_muneca=num2str(ymax,2);
ymin=min(yy);
ymin_beta_muneca=num2str(ymin,2);
plot(escala_normal,angulos_muneca.media_beta+angulos_muneca.desviacion_beta,'r');
plot(escala_normal,angulos_muneca.media_beta-angulos_muneca.desviacion_beta,'b');
legend('Media','Media+SD','Media-SD')
plottitle=['Curva media ángulo beta en la muñeca: rotación interna'];
title(plottitle)

subplot(3,1,3,'Ylim',[-45 45],...
'YTick',[-45 -35 -25 -15 -5 0 5 15 25 35 45],...
'YGrid','on',...
'XGrid','on');
hold on
plot(escala_normal,angulos_muneca.media_gamma,'k');
Ih=findall(gca, 'type', 'line');
yy=get(Ih, 'ydata');
ymax=max(yy);
ymax_gamma_muneca=num2str(ymax,2);
ymin=min(yy);
ymin_gamma_muneca=num2str(ymin,2);
plot(escala_normal,angulos_muneca.media_gamma+angulos_muneca.desviacion_gamma,'r');
plot(escala_normal,angulos_muneca.media_gamma-angulos_muneca.desviacion_gamma,'b');
legend('Media','Media+SD','Media-SD')
plottitle=['Curva media ángulo gamma en la muñeca: flexión'];
title(plottitle)
saveas(gcf,'angulosmuneca.jpeg');