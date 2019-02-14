%------------NORMALIZACIÓN DE CICLOS Y REPRESENTACIÓN GRÁFICA------------%

escala_normal = 0:1/200:1;
k = 1;
for i=1:7
    % Angulos del tronco
    alfa_tr_rep = alfa_tr(cont_up(i):cont_up(i+1));
    beta_tr_rep = beta_tr(cont_up(i):cont_up(i+1));
    gamma_tr_rep = gamma_tr(cont_up(i):cont_up(i+1));
    clear base_tiempo
    for j = 1:size(alfa_tr_rep,2)
        base_tiempo(j) = 1-((size(alfa_tr_rep,2)-j)/size(alfa_tr_rep,2));
    end
    
    alfa_tr_rep = interp1(base_tiempo,alfa_tr_rep,escala_normal,'spline');
    angulos_tronco.(['alfa_tr_repC',num2str(i)]) = alfa_tr_rep;
    max_ciclos_alfa_tr(i) = max(alfa_tr_rep);
    min_ciclos_alfa_tr(i) = min(alfa_tr_rep);
    
    
    beta_tr_rep = interp1(base_tiempo,beta_tr_rep,escala_normal,'spline');
    angulos_tronco.(['beta_tr_repC',num2str(i)]) = beta_tr_rep;
    max_ciclos_beta_tr(i) = max(beta_tr_rep);
    min_ciclos_beta_tr(i) = min(beta_tr_rep);
    
    gamma_tr_rep = interp1(base_tiempo,gamma_tr_rep,escala_normal,'spline');
    angulos_tronco.(['gamma_tr_repC',num2str(i)]) = gamma_tr_rep;
    max_ciclos_gamma_tr(i) = max(gamma_tr_rep);
    min_ciclos_gamma_tr(i) = min(gamma_tr_rep);
    
% Angulos del hombro
    alfa_rsho_rep = alfa_rsho(cont_up(i):cont_up(i+1));
    beta_rsho_rep = beta_rsho(cont_up(i):cont_up(i+1));
    gamma_rsho_rep = gamma_rsho(cont_up(i):cont_up(i+1));
    clear base_tiempo
    for j = 1:size(alfa_rsho_rep,2)
        base_tiempo(j) = 1-((size(alfa_rsho_rep,2)-j)/size(alfa_rsho_rep,2));
    end
    
    alfa_rsho_rep = interp1(base_tiempo,alfa_rsho_rep,escala_normal,'spline');
    angulos_hombro.(['alfa_rsho_repC',num2str(i)]) = alfa_rsho_rep;  
    max_ciclos_alfa_rsho(i) = max(alfa_rsho_rep);
    min_ciclos_alfa_rsho(i) = min(alfa_rsho_rep);
    
    beta_rsho_rep = interp1(base_tiempo,beta_rsho_rep,escala_normal,'spline');
    angulos_hombro.(['beta_rsho_repC',num2str(i)]) = beta_rsho_rep;
    max_ciclos_beta_rsho(i) = max(beta_rsho_rep);
    min_ciclos_beta_rsho(i) = min(beta_rsho_rep);
    
    gamma_rsho_rep = interp1(base_tiempo,gamma_rsho_rep,escala_normal,'spline');
    angulos_hombro.(['gamma_rsho_repC',num2str(i)]) = gamma_rsho_rep;
    max_ciclos_gamma_rsho(i) = max(gamma_rsho_rep);
    min_ciclos_gamma_rsho(i) = min(gamma_rsho_rep);
    
% Angulos del codo
    alfa_relb_rep = alfa_relb(cont_up(i):cont_up(i+1));
    beta_relb_rep = beta_relb(cont_up(i):cont_up(i+1));
    gamma_relb_rep = gamma_relb(cont_up(i):cont_up(i+1));
    clear base_tiempo
    for j = 1:size(alfa_relb_rep,2)
        base_tiempo(j) = 1-((size(alfa_relb_rep,2)-j)/size(alfa_relb_rep,2));
    end
    
    alfa_relb_rep = interp1(base_tiempo,alfa_relb_rep,escala_normal,'spline');
    angulos_codo.(['alfa_relb_repC',num2str(i)]) = alfa_relb_rep;  
    max_ciclos_alfa_relb(i) = max(alfa_relb_rep);
    min_ciclos_alfa_relb(i) = min(alfa_relb_rep);
    
    beta_relb_rep = interp1(base_tiempo,beta_relb_rep,escala_normal,'spline');
    angulos_codo.(['beta_relb_repC',num2str(i)]) = beta_relb_rep;
    max_ciclos_beta_relb(i) = max(beta_relb_rep);
    min_ciclos_beta_relb(i) = min(beta_relb_rep);
    
    gamma_relb_rep = interp1(base_tiempo,gamma_relb_rep,escala_normal,'spline');
    angulos_codo.(['gamma_relb_repC',num2str(i)]) = gamma_relb_rep;
    max_ciclos_gamma_relb(i) = max(gamma_relb_rep);
    min_ciclos_gamma_relb(i) = min(gamma_relb_rep);

% Angulos de la muñeca
    alfa_rwr_rep = alfa_rwr(cont_up(i):cont_up(i+1));
    beta_rwr_rep = beta_rwr(cont_up(i):cont_up(i+1));
    gamma_rwr_rep = gamma_rwr(cont_up(i):cont_up(i+1));
    clear base_tiempo
    for j = 1:size(alfa_rwr_rep,2)
        base_tiempo(j) = 1-((size(alfa_rwr_rep,2)-j)/size(alfa_rwr_rep,2));
    end
    
    alfa_rwr_rep = interp1(base_tiempo,alfa_rwr_rep,escala_normal,'spline');
    angulos_muneca.(['alfa_rwr_repC',num2str(i)]) = alfa_rwr_rep;
    max_ciclos_alfa_rwr(i) = max(alfa_rwr_rep);
    min_ciclos_alfa_rwr(i) = min(alfa_rwr_rep);
    
    beta_rwr_rep = interp1(base_tiempo,beta_rwr_rep,escala_normal,'spline');
    angulos_muneca.(['beta_rwr_repC',num2str(i)]) = beta_rwr_rep;
    max_ciclos_beta_rwr(i) = max(beta_rwr_rep);
    min_ciclos_beta_rwr(i) = min(beta_rwr_rep);
    
    gamma_rwr_rep = interp1(base_tiempo,gamma_rwr_rep,escala_normal,'spline');
    angulos_muneca.(['gamma_rwr_repC',num2str(i)]) = gamma_rwr_rep;
    max_ciclos_gamma_rwr(i) = max(gamma_rwr_rep);
    min_ciclos_gamma_rwr(i) = min(gamma_rwr_rep);
    
%% Fuerzas proximales en la muñeca (locales)
    f_muneca_x = f_muneca(1,(cont_up(i):cont_up(i+1)));
    f_muneca_y = f_muneca(2,(cont_up(i):cont_up(i+1)));
    f_muneca_z = f_muneca(3,(cont_up(i):cont_up(i+1)));
    clear base_tiempo
    for j=1:size(f_muneca_x,2)
        base_tiempo(j) = 1-((size(f_muneca_x,2)-j)/size(f_muneca_x,2));
    end
    
    f_muneca_x = interp1(base_tiempo,f_muneca_x,escala_normal,'spline');
    fuerzas_muneca.(['f_muneca_xC',num2str(i)]) = f_muneca_x;
    max_ciclos_f_muneca_x(i) = max(f_muneca_x);
    min_ciclos_f_muneca_x(i) = min(f_muneca_x);
    
    f_muneca_y = interp1(base_tiempo,f_muneca_y,escala_normal,'spline');
    fuerzas_muneca.(['f_muneca_yC',num2str(i)]) = f_muneca_y;
    max_ciclos_f_muneca_y(i) = max(f_muneca_y);
    min_ciclos_f_muneca_y(i) = min(f_muneca_y);
    
    f_muneca_z = interp1(base_tiempo,f_muneca_z,escala_normal,'spline');
    fuerzas_muneca.(['f_muneca_zC',num2str(i)]) = f_muneca_z;
    max_ciclos_f_muneca_z(i) = max(f_muneca_z);
    min_ciclos_f_muneca_z(i) = min(f_muneca_z);
    
% Fuerzas proximales en el codo (locales)
    f_codo_x = f_codo(1,(cont_up(i):cont_up(i+1)));
    f_codo_y = f_codo(2,(cont_up(i):cont_up(i+1)));
    f_codo_z = f_codo(3,(cont_up(i):cont_up(i+1)));
    clear base_tiempo
    for j = 1:size(f_codo_x,2)
        base_tiempo(j) = 1-((size(f_codo_x,2)-j)/size(f_codo_x,2));
    end
    
    f_codo_x = interp1(base_tiempo,f_codo_x,escala_normal,'spline');
    fuerzas_codo.(['f_codo_xC',num2str(i)]) = f_codo_x;
    max_ciclos_f_codo_x(i) = max(f_codo_x);
    min_ciclos_f_codo_x(i) = min(f_codo_x);
    
    f_codo_y = interp1(base_tiempo,f_codo_y,escala_normal,'spline');
    fuerzas_codo.(['f_codo_yC',num2str(i)]) = f_codo_y;
    max_ciclos_f_codo_y(i) = max(f_codo_y);
    min_ciclos_f_codo_y(i) = min(f_codo_y);
    
    f_codo_z = interp1(base_tiempo,f_codo_z,escala_normal,'spline');
    fuerzas_codo.(['f_codo_zC',num2str(i)]) = f_codo_z;
    max_ciclos_f_codo_z(i) = max(f_codo_z);
    min_ciclos_f_codo_z(i) = min(f_codo_z);
    
% Fuerzas proximales en el hombro (locales)
    f_hombro_x = f_hombro(1,(cont_up(i):cont_up(i+1)));
    f_hombro_y = f_hombro(2,(cont_up(i):cont_up(i+1)));
    f_hombro_z = f_hombro(3,(cont_up(i):cont_up(i+1)));
    clear base_tiempo
    for j = 1:size(f_hombro_x,2)
        base_tiempo(j) = 1-((size(f_hombro_x,2)-j)/size(f_hombro_x,2));
    end
    
    f_hombro_x = interp1(base_tiempo,f_hombro_x,escala_normal,'spline');
    fuerzas_hombro.(['f_hombro_xC',num2str(i)]) = f_hombro_x;
    max_ciclos_f_hombro_x(i) = max(f_hombro_x);
    min_ciclos_f_hombro_x(i) = min(f_hombro_x);
    
    f_hombro_y = interp1(base_tiempo,f_hombro_y,escala_normal,'spline');
    fuerzas_hombro.(['f_hombro_yC',num2str(i)]) = f_hombro_y;
    max_ciclos_f_hombro_y(i) = max(f_hombro_y);
    min_ciclos_f_hombro_y(i) = min(f_hombro_y);
    
    f_hombro_z = interp1(base_tiempo,f_hombro_z,escala_normal,'spline');
    fuerzas_hombro.(['f_hombro_zC',num2str(i)]) = f_hombro_z;
    max_ciclos_f_hombro_z(i) = max(f_hombro_z);
    min_ciclos_f_hombro_z(i) = min(f_hombro_z);
    
% Momentos proximales en la muñeca (globales)
    m_muneca_x = m_muneca(1,(cont_up(i):cont_up(i+1)));
    m_muneca_y = m_muneca(2,(cont_up(i):cont_up(i+1)));
    m_muneca_z = m_muneca(3,(cont_up(i):cont_up(i+1)));
    clear base_tiempo
    for j = 1:size(m_muneca_x,2)
        base_tiempo(j) = 1-((size(m_muneca_x,2)-j)/size(m_muneca_x,2));
    end
    
    m_muneca_x = interp1(base_tiempo,m_muneca_x,escala_normal,'spline');
    momentos_muneca.(['m_muneca_xC',num2str(i)]) = m_muneca_x;
    max_ciclos_m_muneca_x(i) = max(m_muneca_x);
    min_ciclos_m_muneca_x(i) = min(m_muneca_x);
    
    m_muneca_y = interp1(base_tiempo,m_muneca_y,escala_normal,'spline');
    momentos_muneca.(['m_muneca_yC',num2str(i)]) = m_muneca_y;
    max_ciclos_m_muneca_y(i) = max(m_muneca_y);
    min_ciclos_m_muneca_y(i) = min(m_muneca_y);
    
    m_muneca_z = interp1(base_tiempo,m_muneca_z,escala_normal,'spline');
    momentos_muneca.(['m_muneca_zC',num2str(i)]) = m_muneca_z;
    max_ciclos_m_muneca_z(i) = max(m_muneca_z);
    min_ciclos_m_muneca_z(i) = min(m_muneca_z);
    
% Momentos proximales en el codo (globales)
    m_codo_x = m_codo(1,(cont_up(i):cont_up(i+1)));
    m_codo_y = m_codo(2,(cont_up(i):cont_up(i+1)));
    m_codo_z = m_codo(3,(cont_up(i):cont_up(i+1)));
    clear base_tiempo
    for j = 1:size(m_codo_x,2)
        base_tiempo(j) = 1-((size(m_codo_x,2)-j)/size(m_codo_x,2));
    end
    
    m_codo_x = interp1(base_tiempo,m_codo_x,escala_normal,'spline');
    momentos_codo.(['m_codo_xC',num2str(i)]) = m_codo_x;
    max_ciclos_m_codo_x(i) = max(m_codo_x);
    min_ciclos_m_codo_x(i) = min(m_codo_x);
    
    m_codo_y = interp1(base_tiempo,m_codo_y,escala_normal,'spline');
    momentos_codo.(['m_codo_yC',num2str(i)]) = m_codo_y;
    max_ciclos_m_codo_y(i) = max(m_codo_y);
    min_ciclos_m_codo_y(i) = min(m_codo_y);
    
    m_codo_z = interp1(base_tiempo,m_codo_z,escala_normal,'spline');
    momentos_codo.(['m_codo_zC',num2str(i)]) = m_codo_z;
    max_ciclos_m_codo_z(i) = max(m_codo_z);
    min_ciclos_m_codo_z(i) = min(m_codo_z);
    
% Momentos proximales en el hombro (globales)
    m_hombro_x = m_hombro(1,(cont_up(i):cont_up(i+1)));
    m_hombro_y = m_hombro(2,(cont_up(i):cont_up(i+1)));
    m_hombro_z = m_hombro(3,(cont_up(i):cont_up(i+1)));
    
    clear base_tiempo
    for j = 1:size(m_hombro_x,2)
        base_tiempo(j) = 1-((size(m_hombro_x,2)-j)/size(m_hombro_x,2));
    end
    
    m_hombro_x = interp1(base_tiempo,m_hombro_x,escala_normal,'spline');
    momentos_hombro.(['m_hombro_xC',num2str(i)]) = m_hombro_x;
    max_ciclos_m_hombro_x(i) = max(m_hombro_x);
    min_ciclos_m_hombro_x(i) = min(m_hombro_x);
    
    m_hombro_y = interp1(base_tiempo,m_hombro_y,escala_normal,'spline');
    momentos_hombro.(['m_hombro_yC',num2str(i)]) = m_hombro_y;
    max_ciclos_m_hombro_y(i) = max(m_hombro_y);
    min_ciclos_m_hombro_y(i) = min(m_hombro_y);
    
    m_hombro_z = interp1(base_tiempo,m_hombro_z,escala_normal,'spline');
    momentos_hombro.(['m_hombro_zC',num2str(i)]) = m_hombro_z;
    max_ciclos_m_hombro_z(i) = max(m_hombro_z);
    min_ciclos_m_hombro_z(i) = min(m_hombro_z);
end

%% CALCULO DE LOS MÁXIMOS Y MINIMOS DE TODOS LOS PARÁMETROS POR CICLO
max_alfa_tr_ciclos = max(max_ciclos_alfa_tr);
min_alfa_tr_ciclos = min(min_ciclos_alfa_tr);

max_beta_tr_ciclos = max(max_ciclos_beta_tr);
min_beta_tr_ciclos = min(min_ciclos_beta_tr);

max_gamma_tr_ciclos = max(max_ciclos_gamma_tr);
min_gamma_tr_ciclos = min(min_ciclos_gamma_tr);

max_alfa_rsho_ciclos = max(max_ciclos_alfa_rsho);
min_alfa_rsho_ciclos = min(min_ciclos_alfa_rsho);


max_beta_rsho_ciclos = max(max_ciclos_beta_rsho);
min_beta_rsho_ciclos = min(min_ciclos_beta_rsho);

max_gamma_rsho_ciclos = max(max_ciclos_gamma_rsho);
min_gamma_rsho_ciclos = min(min_ciclos_gamma_rsho);

max_alfa_relb_ciclos = max(max_ciclos_alfa_relb);
min_alfa_relb_ciclos = min(min_ciclos_alfa_relb);

max_beta_relb_ciclos = max(max_ciclos_beta_relb);
min_beta_relb_ciclos = min(min_ciclos_beta_relb);

max_gamma_relb_ciclos = max(max_ciclos_gamma_relb);
min_gamma_relb_ciclos = min(min_ciclos_gamma_relb);

max_alfa_rwr_ciclos = max(max_ciclos_alfa_rwr);
min_alfa_rwr_ciclos = min(min_ciclos_alfa_rwr);

max_beta_rwr_ciclos = max(max_ciclos_beta_rwr);
min_beta_rwr_ciclos = min(min_ciclos_beta_rwr);

max_gamma_rwr_ciclos = max(max_ciclos_gamma_rwr);
min_gamma_rwr_ciclos = min(min_ciclos_gamma_rwr);

max_f_muneca_x_ciclos = max(max_ciclos_f_muneca_x);
min_f_muneca_x_ciclos = min(min_ciclos_f_muneca_x);

max_f_muneca_y_ciclos = max(max_ciclos_f_muneca_y);
min_f_muneca_y_ciclos = min(min_ciclos_f_muneca_y);

max_f_muneca_z_ciclos = max(max_ciclos_f_muneca_z);
min_f_muneca_z_ciclos = min(min_ciclos_f_muneca_z);

max_f_codo_x_ciclos = max(max_ciclos_f_codo_x);
min_f_codo_x_ciclos = min(min_ciclos_f_codo_x);

max_f_codo_y_ciclos = max(max_ciclos_f_codo_y);
min_f_codo_y_ciclos = min(min_ciclos_f_codo_y);

max_f_codo_z_ciclos = max(max_ciclos_f_codo_z);
min_f_codo_z_ciclos = min(min_ciclos_f_codo_z);

max_f_hombro_x_ciclos = max(max_ciclos_f_hombro_x);
min_f_hombro_x_ciclos = min(min_ciclos_f_hombro_x);

max_f_hombro_y_ciclos = max(max_ciclos_f_hombro_y);
min_f_hombro_y_ciclos = min(min_ciclos_f_hombro_y);

max_f_hombro_z_ciclos = max(max_ciclos_f_hombro_z);
min_f_hombro_z_ciclos = min(min_ciclos_f_hombro_z);

max_m_muneca_x_ciclos = max(max_ciclos_m_muneca_x);
min_m_muneca_x_ciclos = min(min_ciclos_m_muneca_x);

max_m_muneca_y_ciclos = max(max_ciclos_m_muneca_y);
min_m_muneca_y_ciclos = min(min_ciclos_m_muneca_y);

max_m_muneca_z_ciclos = max(max_ciclos_m_muneca_z);
min_m_muneca_z_ciclos = min(min_ciclos_m_muneca_z);    

max_m_codo_x_ciclos = max(max_ciclos_m_codo_x);
min_m_codo_x_ciclos = min(min_ciclos_m_codo_x);

max_m_codo_y_ciclos = max(max_ciclos_m_codo_y);
min_m_codo_y_ciclos = min(min_ciclos_m_codo_y);

max_m_codo_z_ciclos = max(max_ciclos_m_codo_z);
min_m_codo_z_ciclos = min(min_ciclos_m_codo_z);

max_m_hombro_x_ciclos = max(max_ciclos_m_hombro_x);
min_m_hombro_x_ciclos = min(min_ciclos_m_hombro_x);

max_m_hombro_y_ciclos = max(max_ciclos_m_hombro_y);
min_m_hombro_y_ciclos = min(min_ciclos_m_hombro_y);

max_m_hombro_z_ciclos = max(max_ciclos_m_hombro_z);
min_m_hombro_z_ciclos = min(min_ciclos_m_hombro_z);

%% CALCULO DEL CICLO MEDIO
for i = 1:size(escala_normal,2)
% Angulos del tronco
    angulos_tronco.media_alfa(i) = (angulos_tronco.alfa_tr_repC1(i)+...
        angulos_tronco.alfa_tr_repC2(i)+angulos_tronco.alfa_tr_repC3(i)+...
        angulos_tronco.alfa_tr_repC4(i)+angulos_tronco.alfa_tr_repC5(i))/5;

    angulos_tronco.desviacion_alfa(i) = sqrt((1/(4))*(...
        (angulos_tronco.alfa_tr_repC1(i)-angulos_tronco.media_alfa(i))^2+...
        (angulos_tronco.alfa_tr_repC2(i)-angulos_tronco.media_alfa(i))^2+...
        (angulos_tronco.alfa_tr_repC3(i)-angulos_tronco.media_alfa(i))^2+...
        (angulos_tronco.alfa_tr_repC4(i)-angulos_tronco.media_alfa(i))^2+...
        (angulos_tronco.alfa_tr_repC5(i)-angulos_tronco.media_alfa(i))^2));
    
    angulos_tronco.media_beta(i) = (angulos_tronco.beta_tr_repC1(i)+...
        angulos_tronco.beta_tr_repC2(i)+angulos_tronco.beta_tr_repC3(i)+...
        angulos_tronco.beta_tr_repC4(i)+angulos_tronco.beta_tr_repC5(i))/5;

    angulos_tronco.desviacion_beta(i) = sqrt((1/(4))*(...
        (angulos_tronco.beta_tr_repC1(i)-angulos_tronco.media_beta(i))^2+...
        (angulos_tronco.beta_tr_repC2(i)-angulos_tronco.media_beta(i))^2+...
        (angulos_tronco.beta_tr_repC3(i)-angulos_tronco.media_beta(i))^2+...
        (angulos_tronco.beta_tr_repC4(i)-angulos_tronco.media_beta(i))^2+...
        (angulos_tronco.beta_tr_repC5(i)-angulos_tronco.media_beta(i))^2));
    
    angulos_tronco.media_gamma(i) = (angulos_tronco.gamma_tr_repC1(i)+...
        angulos_tronco.gamma_tr_repC2(i)+angulos_tronco.gamma_tr_repC3(i)+...
        angulos_tronco.gamma_tr_repC4(i)+angulos_tronco.gamma_tr_repC5(i))/5;

    angulos_tronco.desviacion_gamma(i) = sqrt((1/(4))*(...
        (angulos_tronco.gamma_tr_repC1(i)-angulos_tronco.media_gamma(i))^2+...
        (angulos_tronco.gamma_tr_repC2(i)-angulos_tronco.media_gamma(i))^2+...
        (angulos_tronco.gamma_tr_repC3(i)-angulos_tronco.media_gamma(i))^2+...
        (angulos_tronco.gamma_tr_repC4(i)-angulos_tronco.media_gamma(i))^2+...
        (angulos_tronco.gamma_tr_repC5(i)-angulos_tronco.media_gamma(i))^2));
% Angulos del hombro
    angulos_hombro.media_alfa(i) = (angulos_hombro.alfa_rsho_repC1(i)+...
        angulos_hombro.alfa_rsho_repC2(i)+angulos_hombro.alfa_rsho_repC3(i)+...
        angulos_hombro.alfa_rsho_repC4(i)+angulos_hombro.alfa_rsho_repC5(i))/5;

    angulos_hombro.desviacion_alfa(i) = sqrt((1/(4))*(...
        (angulos_hombro.alfa_rsho_repC1(i)-angulos_hombro.media_alfa(i))^2+...
        (angulos_hombro.alfa_rsho_repC2(i)-angulos_hombro.media_alfa(i))^2+...
        (angulos_hombro.alfa_rsho_repC3(i)-angulos_hombro.media_alfa(i))^2+...
        (angulos_hombro.alfa_rsho_repC4(i)-angulos_hombro.media_alfa(i))^2+...
        (angulos_hombro.alfa_rsho_repC5(i)-angulos_hombro.media_alfa(i))^2));

    angulos_hombro.media_beta(i) = (angulos_hombro.beta_rsho_repC1(i)+...
        angulos_hombro.beta_rsho_repC2(i)+angulos_hombro.beta_rsho_repC3(i)+...
        angulos_hombro.beta_rsho_repC4(i)+angulos_hombro.beta_rsho_repC5(i))/5;

    angulos_hombro.desviacion_beta(i) = sqrt((1/(4))*(...
        (angulos_hombro.beta_rsho_repC1(i)-angulos_hombro.media_beta(i))^2+...
        (angulos_hombro.beta_rsho_repC2(i)-angulos_hombro.media_beta(i))^2+...
        (angulos_hombro.beta_rsho_repC3(i)-angulos_hombro.media_beta(i))^2+...
        (angulos_hombro.beta_rsho_repC4(i)-angulos_hombro.media_beta(i))^2+...
        (angulos_hombro.beta_rsho_repC5(i)-angulos_hombro.media_beta(i))^2));
    
    angulos_hombro.media_gamma(i) = (angulos_hombro.gamma_rsho_repC1(i)+...
        angulos_hombro.gamma_rsho_repC2(i)+angulos_hombro.gamma_rsho_repC3(i)+...
        angulos_hombro.gamma_rsho_repC4(i)+angulos_hombro.gamma_rsho_repC5(i))/5;

    angulos_hombro.desviacion_gamma(i) = sqrt((1/(4))*(...
        (angulos_hombro.gamma_rsho_repC1(i)-angulos_hombro.media_gamma(i))^2+...
        (angulos_hombro.gamma_rsho_repC2(i)-angulos_hombro.media_gamma(i))^2+...
        (angulos_hombro.gamma_rsho_repC3(i)-angulos_hombro.media_gamma(i))^2+...
        (angulos_hombro.gamma_rsho_repC4(i)-angulos_hombro.media_gamma(i))^2+...
        (angulos_hombro.gamma_rsho_repC5(i)-angulos_hombro.media_gamma(i))^2));
% Angulos del codo
    angulos_codo.media_alfa(i) = (angulos_codo.alfa_relb_repC1(i)+...
        angulos_codo.alfa_relb_repC2(i)+angulos_codo.alfa_relb_repC3(i)+...
        angulos_codo.alfa_relb_repC4(i)+angulos_codo.alfa_relb_repC5(i))/5;

    angulos_codo.desviacion_alfa(i) = sqrt((1/(4))*(...
        (angulos_codo.alfa_relb_repC1(i)-angulos_codo.media_alfa(i))^2+...
        (angulos_codo.alfa_relb_repC2(i)-angulos_codo.media_alfa(i))^2+...
        (angulos_codo.alfa_relb_repC3(i)-angulos_codo.media_alfa(i))^2+...
        (angulos_codo.alfa_relb_repC4(i)-angulos_codo.media_alfa(i))^2+...
        (angulos_codo.alfa_relb_repC5(i)-angulos_codo.media_alfa(i))^2));

    angulos_codo.media_beta(i) = (angulos_codo.beta_relb_repC1(i)+...
        angulos_codo.beta_relb_repC2(i)+angulos_codo.beta_relb_repC3(i)+...
        angulos_codo.beta_relb_repC4(i)+angulos_codo.beta_relb_repC5(i))/5;

    angulos_codo.desviacion_beta(i) = sqrt((1/(4))*(...
        (angulos_codo.beta_relb_repC1(i)-angulos_codo.media_beta(i))^2+...
        (angulos_codo.beta_relb_repC2(i)-angulos_codo.media_beta(i))^2+...
        (angulos_codo.beta_relb_repC3(i)-angulos_codo.media_beta(i))^2+...
        (angulos_codo.beta_relb_repC4(i)-angulos_codo.media_beta(i))^2+...
        (angulos_codo.beta_relb_repC5(i)-angulos_codo.media_beta(i))^2));
    
    angulos_codo.media_gamma(i) = (angulos_codo.gamma_relb_repC1(i)+...
        angulos_codo.gamma_relb_repC2(i)+angulos_codo.gamma_relb_repC3(i)+...
        angulos_codo.gamma_relb_repC4(i)+angulos_codo.gamma_relb_repC5(i))/5;

    angulos_codo.desviacion_gamma(i) = sqrt((1/(4))*(...
        (angulos_codo.gamma_relb_repC1(i)-angulos_codo.media_gamma(i))^2+...
        (angulos_codo.gamma_relb_repC2(i)-angulos_codo.media_gamma(i))^2+...
        (angulos_codo.gamma_relb_repC3(i)-angulos_codo.media_gamma(i))^2+...
        (angulos_codo.gamma_relb_repC4(i)-angulos_codo.media_gamma(i))^2+...
        (angulos_codo.gamma_relb_repC5(i)-angulos_codo.media_gamma(i))^2));
% Angulos de la muñeca
    angulos_muneca.media_alfa(i) = (angulos_muneca.alfa_rwr_repC1(i)+...
        angulos_muneca.alfa_rwr_repC2(i)+angulos_muneca.alfa_rwr_repC3(i)+...
        angulos_muneca.alfa_rwr_repC4(i)+angulos_muneca.alfa_rwr_repC5(i))/5;

    angulos_muneca.desviacion_alfa(i) = sqrt((1/(4))*(...
        (angulos_muneca.alfa_rwr_repC1(i)-angulos_muneca.media_alfa(i))^2+...
        (angulos_muneca.alfa_rwr_repC2(i)-angulos_muneca.media_alfa(i))^2+...
        (angulos_muneca.alfa_rwr_repC3(i)-angulos_muneca.media_alfa(i))^2+...
        (angulos_muneca.alfa_rwr_repC4(i)-angulos_muneca.media_alfa(i))^2+...
        (angulos_muneca.alfa_rwr_repC5(i)-angulos_muneca.media_alfa(i))^2));

    angulos_muneca.media_beta(i) = (angulos_muneca.beta_rwr_repC1(i)+...
        angulos_muneca.beta_rwr_repC2(i)+angulos_muneca.beta_rwr_repC3(i)+...
        angulos_muneca.beta_rwr_repC4(i)+angulos_muneca.beta_rwr_repC5(i))/5;

    angulos_muneca.desviacion_beta(i) = sqrt((1/(4))*(...
        (angulos_muneca.beta_rwr_repC1(i)-angulos_muneca.media_beta(i))^2+...
        (angulos_muneca.beta_rwr_repC2(i)-angulos_muneca.media_beta(i))^2+...
        (angulos_muneca.beta_rwr_repC3(i)-angulos_muneca.media_beta(i))^2+...
        (angulos_muneca.beta_rwr_repC4(i)-angulos_muneca.media_beta(i))^2+...
        (angulos_muneca.beta_rwr_repC5(i)-angulos_muneca.media_beta(i))^2));
    
    angulos_muneca.media_gamma(i) = (angulos_muneca.gamma_rwr_repC1(i)+...
        angulos_muneca.gamma_rwr_repC2(i)+angulos_muneca.gamma_rwr_repC3(i)+...
        angulos_muneca.gamma_rwr_repC4(i)+angulos_muneca.gamma_rwr_repC5(i))/5;

    angulos_muneca.desviacion_gamma(i) = sqrt((1/(4))*(...
        (angulos_muneca.gamma_rwr_repC1(i)-angulos_muneca.media_gamma(i))^2+...
        (angulos_muneca.gamma_rwr_repC2(i)-angulos_muneca.media_gamma(i))^2+...
        (angulos_muneca.gamma_rwr_repC3(i)-angulos_muneca.media_gamma(i))^2+...
        (angulos_muneca.gamma_rwr_repC4(i)-angulos_muneca.media_gamma(i))^2+...
        (angulos_muneca.gamma_rwr_repC5(i)-angulos_muneca.media_gamma(i))^2));

% Fuerzas proximales en la muñeca (locales)
    fuerzas_muneca.media_f_muneca_x(i) = (fuerzas_muneca.f_muneca_xC1(i)+...
        fuerzas_muneca.f_muneca_xC2(i)+fuerzas_muneca.f_muneca_xC3(i)+...
        fuerzas_muneca.f_muneca_xC4(i)+fuerzas_muneca.f_muneca_xC5(i))/5;

    fuerzas_muneca.desviacion_f_muneca_x(i) = sqrt((1/(4))*(...
        (fuerzas_muneca.f_muneca_xC1(i)-fuerzas_muneca.media_f_muneca_x(i))^2+...
        (fuerzas_muneca.f_muneca_xC2(i)-fuerzas_muneca.media_f_muneca_x(i))^2+...
        (fuerzas_muneca.f_muneca_xC3(i)-fuerzas_muneca.media_f_muneca_x(i))^2+...
        (fuerzas_muneca.f_muneca_xC4(i)-fuerzas_muneca.media_f_muneca_x(i))^2+...
        (fuerzas_muneca.f_muneca_xC5(i)-fuerzas_muneca.media_f_muneca_x(i))^2));
    
    fuerzas_muneca.media_f_muneca_y(i) = (fuerzas_muneca.f_muneca_yC1(i)+...
        fuerzas_muneca.f_muneca_yC2(i)+fuerzas_muneca.f_muneca_yC3(i)+...
        fuerzas_muneca.f_muneca_yC4(i)+fuerzas_muneca.f_muneca_yC5(i))/5;

    fuerzas_muneca.desviacion_f_muneca_y(i) = sqrt((1/(4))*(...
        (fuerzas_muneca.f_muneca_yC1(i)-fuerzas_muneca.media_f_muneca_y(i))^2+...
        (fuerzas_muneca.f_muneca_yC2(i)-fuerzas_muneca.media_f_muneca_y(i))^2+...
        (fuerzas_muneca.f_muneca_yC3(i)-fuerzas_muneca.media_f_muneca_y(i))^2+...
        (fuerzas_muneca.f_muneca_yC4(i)-fuerzas_muneca.media_f_muneca_y(i))^2+...
        (fuerzas_muneca.f_muneca_yC5(i)-fuerzas_muneca.media_f_muneca_y(i))^2));

    fuerzas_muneca.media_f_muneca_z(i) = (fuerzas_muneca.f_muneca_zC1(i)+...
        fuerzas_muneca.f_muneca_zC2(i)+fuerzas_muneca.f_muneca_zC3(i)+...
        fuerzas_muneca.f_muneca_zC4(i)+fuerzas_muneca.f_muneca_zC5(i))/5;

    fuerzas_muneca.desviacion_f_muneca_z(i) = sqrt((1/(4))*(...
        (fuerzas_muneca.f_muneca_zC1(i)-fuerzas_muneca.media_f_muneca_z(i))^2+...
        (fuerzas_muneca.f_muneca_zC2(i)-fuerzas_muneca.media_f_muneca_z(i))^2+...
        (fuerzas_muneca.f_muneca_zC3(i)-fuerzas_muneca.media_f_muneca_z(i))^2+...
        (fuerzas_muneca.f_muneca_zC4(i)-fuerzas_muneca.media_f_muneca_z(i))^2+...
        (fuerzas_muneca.f_muneca_zC5(i)-fuerzas_muneca.media_f_muneca_z(i))^2));

    fuerzas_muneca.resultanteF(i) = sqrt((fuerzas_muneca.media_f_muneca_x(i))^2+...
        (fuerzas_muneca.media_f_muneca_x(i))^2+(fuerzas_muneca.media_f_muneca_x(i))^2);
% Fuerzas proximales en el codo (locales)
        fuerzas_codo.media_f_codo_x(i) = (fuerzas_codo.f_codo_xC1(i)+...
        fuerzas_codo.f_codo_xC2(i)+fuerzas_codo.f_codo_xC3(i)+...
        fuerzas_codo.f_codo_xC4(i)+fuerzas_codo.f_codo_xC5(i))/5;

    fuerzas_codo.desviacion_f_codo_x(i) = sqrt((1/(4))*(...
        (fuerzas_codo.f_codo_xC1(i)-fuerzas_codo.media_f_codo_x(i))^2+...
        (fuerzas_codo.f_codo_xC2(i)-fuerzas_codo.media_f_codo_x(i))^2+...
        (fuerzas_codo.f_codo_xC3(i)-fuerzas_codo.media_f_codo_x(i))^2+...
        (fuerzas_codo.f_codo_xC4(i)-fuerzas_codo.media_f_codo_x(i))^2+...
        (fuerzas_codo.f_codo_xC5(i)-fuerzas_codo.media_f_codo_x(i))^2));
    
    fuerzas_codo.media_f_codo_y(i) = (fuerzas_codo.f_codo_yC1(i)+...
        fuerzas_codo.f_codo_yC2(i)+fuerzas_codo.f_codo_yC3(i)+...
        fuerzas_codo.f_codo_yC4(i)+fuerzas_codo.f_codo_yC5(i))/5;

    fuerzas_codo.desviacion_f_codo_y(i) = sqrt((1/(4))*(...
        (fuerzas_codo.f_codo_yC1(i)-fuerzas_codo.media_f_codo_y(i))^2+...
        (fuerzas_codo.f_codo_yC2(i)-fuerzas_codo.media_f_codo_y(i))^2+...
        (fuerzas_codo.f_codo_yC3(i)-fuerzas_codo.media_f_codo_y(i))^2+...
        (fuerzas_codo.f_codo_yC4(i)-fuerzas_codo.media_f_codo_y(i))^2+...
        (fuerzas_codo.f_codo_yC5(i)-fuerzas_codo.media_f_codo_y(i))^2));

    fuerzas_codo.media_f_codo_z(i) = (fuerzas_codo.f_codo_zC1(i)+...
        fuerzas_codo.f_codo_zC2(i)+fuerzas_codo.f_codo_zC3(i)+...
        fuerzas_codo.f_codo_zC4(i)+fuerzas_codo.f_codo_zC5(i))/5;

    fuerzas_codo.desviacion_f_codo_z(i) = sqrt((1/(4))*(...
        (fuerzas_codo.f_codo_zC1(i)-fuerzas_codo.media_f_codo_z(i))^2+...
        (fuerzas_codo.f_codo_zC2(i)-fuerzas_codo.media_f_codo_z(i))^2+...
        (fuerzas_codo.f_codo_zC3(i)-fuerzas_codo.media_f_codo_z(i))^2+...
        (fuerzas_codo.f_codo_zC4(i)-fuerzas_codo.media_f_codo_z(i))^2+...
        (fuerzas_codo.f_codo_zC5(i)-fuerzas_codo.media_f_codo_z(i))^2));

    fuerzas_codo.resultanteF(i) = sqrt((fuerzas_codo.media_f_codo_x(i))^2+...
        (fuerzas_codo.media_f_codo_x(i))^2+(fuerzas_codo.media_f_codo_x(i))^2);
% Fuerzas proximales en el hombro (locales)
    fuerzas_hombro.media_f_hombro_x(i) = (fuerzas_hombro.f_hombro_xC1(i)+...
        fuerzas_hombro.f_hombro_xC2(i)+fuerzas_hombro.f_hombro_xC3(i)+...
        fuerzas_hombro.f_hombro_xC4(i)+fuerzas_hombro.f_hombro_xC5(i))/5;

    fuerzas_hombro.desviacion_f_hombro_x(i) = sqrt((1/(4))*(...
        (fuerzas_hombro.f_hombro_xC1(i)-fuerzas_hombro.media_f_hombro_x(i))^2+...
        (fuerzas_hombro.f_hombro_xC2(i)-fuerzas_hombro.media_f_hombro_x(i))^2+...
        (fuerzas_hombro.f_hombro_xC3(i)-fuerzas_hombro.media_f_hombro_x(i))^2+...
        (fuerzas_hombro.f_hombro_xC4(i)-fuerzas_hombro.media_f_hombro_x(i))^2+...
        (fuerzas_hombro.f_hombro_xC5(i)-fuerzas_hombro.media_f_hombro_x(i))^2));
    
    fuerzas_hombro.media_f_hombro_y(i) = (fuerzas_hombro.f_hombro_yC1(i)+...
        fuerzas_hombro.f_hombro_yC2(i)+fuerzas_hombro.f_hombro_yC3(i)+...
        fuerzas_hombro.f_hombro_yC4(i)+fuerzas_hombro.f_hombro_yC5(i))/5;

    fuerzas_hombro.desviacion_f_hombro_y(i) = sqrt((1/(4))*(...
        (fuerzas_hombro.f_hombro_yC1(i)-fuerzas_hombro.media_f_hombro_y(i))^2+...
        (fuerzas_hombro.f_hombro_yC2(i)-fuerzas_hombro.media_f_hombro_y(i))^2+...
        (fuerzas_hombro.f_hombro_yC3(i)-fuerzas_hombro.media_f_hombro_y(i))^2+...
        (fuerzas_hombro.f_hombro_yC4(i)-fuerzas_hombro.media_f_hombro_y(i))^2+...
        (fuerzas_hombro.f_hombro_yC5(i)-fuerzas_hombro.media_f_hombro_y(i))^2));

    fuerzas_hombro.media_f_hombro_z(i) = (fuerzas_hombro.f_hombro_zC1(i)+...
        fuerzas_hombro.f_hombro_zC2(i)+fuerzas_hombro.f_hombro_zC3(i)+...
        fuerzas_hombro.f_hombro_zC4(i)+fuerzas_hombro.f_hombro_zC5(i))/5;

    fuerzas_hombro.desviacion_f_hombro_z(i) = sqrt((1/(4))*(...
        (fuerzas_hombro.f_hombro_zC1(i)-fuerzas_hombro.media_f_hombro_z(i))^2+...
        (fuerzas_hombro.f_hombro_zC2(i)-fuerzas_hombro.media_f_hombro_z(i))^2+...
        (fuerzas_hombro.f_hombro_zC3(i)-fuerzas_hombro.media_f_hombro_z(i))^2+...
        (fuerzas_hombro.f_hombro_zC4(i)-fuerzas_hombro.media_f_hombro_z(i))^2+...
        (fuerzas_hombro.f_hombro_zC5(i)-fuerzas_hombro.media_f_hombro_z(i))^2));

    fuerzas_hombro.resultanteF(i) = sqrt((fuerzas_hombro.media_f_hombro_x(i))^2+...
        (fuerzas_hombro.media_f_hombro_x(i))^2+(fuerzas_hombro.media_f_hombro_x(i))^2);
% Momentos proximales en la muñeca (globales)
    momentos_muneca.media_m_muneca_x(i) = (momentos_muneca.m_muneca_xC1(i)+...
        momentos_muneca.m_muneca_xC2(i)+momentos_muneca.m_muneca_xC3(i)+...
        momentos_muneca.m_muneca_xC4(i)+momentos_muneca.m_muneca_xC5(i))/5;

    momentos_muneca.desviacion_m_muneca_x(i) = sqrt((1/(4))*(...
        (momentos_muneca.m_muneca_xC1(i)-momentos_muneca.media_m_muneca_x(i))^2+...
        (momentos_muneca.m_muneca_xC2(i)-momentos_muneca.media_m_muneca_x(i))^2+...
        (momentos_muneca.m_muneca_xC3(i)-momentos_muneca.media_m_muneca_x(i))^2+...
        (momentos_muneca.m_muneca_xC4(i)-momentos_muneca.media_m_muneca_x(i))^2+...
        (momentos_muneca.m_muneca_xC5(i)-momentos_muneca.media_m_muneca_x(i))^2));
    
    momentos_muneca.media_m_muneca_y(i) = (momentos_muneca.m_muneca_yC1(i)+...
        momentos_muneca.m_muneca_yC2(i)+momentos_muneca.m_muneca_yC3(i)+...
        momentos_muneca.m_muneca_yC4(i)+momentos_muneca.m_muneca_yC5(i))/5;

    momentos_muneca.desviacion_m_muneca_y(i) = sqrt((1/(4))*(...
        (momentos_muneca.m_muneca_yC1(i)-momentos_muneca.media_m_muneca_y(i))^2+...
        (momentos_muneca.m_muneca_yC2(i)-momentos_muneca.media_m_muneca_y(i))^2+...
        (momentos_muneca.m_muneca_yC3(i)-momentos_muneca.media_m_muneca_y(i))^2+...
        (momentos_muneca.m_muneca_yC4(i)-momentos_muneca.media_m_muneca_y(i))^2+...
        (momentos_muneca.m_muneca_yC5(i)-momentos_muneca.media_m_muneca_y(i))^2));

    momentos_muneca.media_m_muneca_z(i) = (momentos_muneca.m_muneca_zC1(i)+...
        momentos_muneca.m_muneca_zC2(i)+momentos_muneca.m_muneca_zC3(i)+...
        momentos_muneca.m_muneca_zC4(i)+momentos_muneca.m_muneca_zC5(i))/5;

    momentos_muneca.desviacion_m_muneca_z(i) = sqrt((1/(4))*(...
        (momentos_muneca.m_muneca_zC1(i)-momentos_muneca.media_m_muneca_z(i))^2+...
        (momentos_muneca.m_muneca_zC2(i)-momentos_muneca.media_m_muneca_z(i))^2+...
        (momentos_muneca.m_muneca_zC3(i)-momentos_muneca.media_m_muneca_z(i))^2+...
        (momentos_muneca.m_muneca_zC4(i)-momentos_muneca.media_m_muneca_z(i))^2+...
        (momentos_muneca.m_muneca_zC5(i)-momentos_muneca.media_m_muneca_z(i))^2));
    
    momentos_muneca.resultanteM(i) = sqrt((momentos_muneca.media_m_muneca_x(i))^2+...
        (momentos_muneca.media_m_muneca_x(i))^2+(momentos_muneca.media_m_muneca_x(i))^2);
% Momentos proximales en el codo (globales)
        momentos_codo.media_m_codo_x(i) = (momentos_codo.m_codo_xC1(i)+...
        momentos_codo.m_codo_xC2(i)+momentos_codo.m_codo_xC3(i)+...
        momentos_codo.m_codo_xC4(i)+momentos_codo.m_codo_xC5(i))/5;

    momentos_codo.desviacion_m_codo_x(i) = sqrt((1/(4))*(...
        (momentos_codo.m_codo_xC1(i)-momentos_codo.media_m_codo_x(i))^2+...
        (momentos_codo.m_codo_xC2(i)-momentos_codo.media_m_codo_x(i))^2+...
        (momentos_codo.m_codo_xC3(i)-momentos_codo.media_m_codo_x(i))^2+...
        (momentos_codo.m_codo_xC4(i)-momentos_codo.media_m_codo_x(i))^2+...
        (momentos_codo.m_codo_xC5(i)-momentos_codo.media_m_codo_x(i))^2));
    
    momentos_codo.media_m_codo_y(i) = (momentos_codo.m_codo_yC1(i)+...
        momentos_codo.m_codo_yC2(i)+momentos_codo.m_codo_yC3(i)+...
        momentos_codo.m_codo_yC4(i)+momentos_codo.m_codo_yC5(i))/5;

    momentos_codo.desviacion_m_codo_y(i) = sqrt((1/(4))*(...
        (momentos_codo.m_codo_yC1(i)-momentos_codo.media_m_codo_y(i))^2+...
        (momentos_codo.m_codo_yC2(i)-momentos_codo.media_m_codo_y(i))^2+...
        (momentos_codo.m_codo_yC3(i)-momentos_codo.media_m_codo_y(i))^2+...
        (momentos_codo.m_codo_yC4(i)-momentos_codo.media_m_codo_y(i))^2+...
        (momentos_codo.m_codo_yC5(i)-momentos_codo.media_m_codo_y(i))^2));

    momentos_codo.media_m_codo_z(i) = (momentos_codo.m_codo_zC1(i)+...
        momentos_codo.m_codo_zC2(i)+momentos_codo.m_codo_zC3(i)+...
        momentos_codo.m_codo_zC4(i)+momentos_codo.m_codo_zC5(i))/5;

    momentos_codo.desviacion_m_codo_z(i) = sqrt((1/(4))*(...
        (momentos_codo.m_codo_zC1(i)-momentos_codo.media_m_codo_z(i))^2+...
        (momentos_codo.m_codo_zC2(i)-momentos_codo.media_m_codo_z(i))^2+...
        (momentos_codo.m_codo_zC3(i)-momentos_codo.media_m_codo_z(i))^2+...
        (momentos_codo.m_codo_zC4(i)-momentos_codo.media_m_codo_z(i))^2+...
        (momentos_codo.m_codo_zC5(i)-momentos_codo.media_m_codo_z(i))^2));
    momentos_codo.resultanteM(i) = sqrt((momentos_codo.media_m_codo_x(i))^2+...
        (momentos_codo.media_m_codo_x(i))^2+(momentos_codo.media_m_codo_x(i))^2);
% Momentos proximales en el hombro (globales)
    momentos_hombro.media_m_hombro_x(i) = (momentos_hombro.m_hombro_xC1(i)+...
        momentos_hombro.m_hombro_xC2(i)+momentos_hombro.m_hombro_xC3(i)+...
        momentos_hombro.m_hombro_xC4(i)+momentos_hombro.m_hombro_xC5(i))/5;

    momentos_hombro.desviacion_m_hombro_x(i) = sqrt((1/(4))*(...
        (momentos_hombro.m_hombro_xC1(i)-momentos_hombro.media_m_hombro_x(i))^2+...
        (momentos_hombro.m_hombro_xC2(i)-momentos_hombro.media_m_hombro_x(i))^2+...
        (momentos_hombro.m_hombro_xC3(i)-momentos_hombro.media_m_hombro_x(i))^2+...
        (momentos_hombro.m_hombro_xC4(i)-momentos_hombro.media_m_hombro_x(i))^2+...
        (momentos_hombro.m_hombro_xC5(i)-momentos_hombro.media_m_hombro_x(i))^2));
    
    momentos_hombro.media_m_hombro_y(i) = (momentos_hombro.m_hombro_yC1(i)+...
        momentos_hombro.m_hombro_yC2(i)+momentos_hombro.m_hombro_yC3(i)+...
        momentos_hombro.m_hombro_yC4(i)+momentos_hombro.m_hombro_yC5(i))/5;

    momentos_hombro.desviacion_m_hombro_y(i) = sqrt((1/(4))*(...
        (momentos_hombro.m_hombro_yC1(i)-momentos_hombro.media_m_hombro_y(i))^2+...
        (momentos_hombro.m_hombro_yC2(i)-momentos_hombro.media_m_hombro_y(i))^2+...
        (momentos_hombro.m_hombro_yC3(i)-momentos_hombro.media_m_hombro_y(i))^2+...
        (momentos_hombro.m_hombro_yC4(i)-momentos_hombro.media_m_hombro_y(i))^2+...
        (momentos_hombro.m_hombro_yC5(i)-momentos_hombro.media_m_hombro_y(i))^2));

    momentos_hombro.media_m_hombro_z(i) = (momentos_hombro.m_hombro_zC1(i)+...
        momentos_hombro.m_hombro_zC2(i)+momentos_hombro.m_hombro_zC3(i)+...
        momentos_hombro.m_hombro_zC4(i)+momentos_hombro.m_hombro_zC5(i))/5;

    momentos_hombro.desviacion_m_hombro_z(i) = sqrt((1/(4))*(...
        (momentos_hombro.m_hombro_zC1(i)-momentos_hombro.media_m_hombro_z(i))^2+...
        (momentos_hombro.m_hombro_zC2(i)-momentos_hombro.media_m_hombro_z(i))^2+...
        (momentos_hombro.m_hombro_zC3(i)-momentos_hombro.media_m_hombro_z(i))^2+...
        (momentos_hombro.m_hombro_zC4(i)-momentos_hombro.media_m_hombro_z(i))^2+...
        (momentos_hombro.m_hombro_zC5(i)-momentos_hombro.media_m_hombro_z(i))^2));

    momentos_hombro.resultanteM(i) = sqrt((momentos_hombro.media_m_hombro_x(i))^2+...
        (momentos_hombro.media_m_hombro_x(i))^2+(momentos_hombro.media_m_hombro_x(i))^2);

end

%% CALCULO DE LOS MÁXIMOS Y MINIMOS DE TODOS LOS PARÁMETROS DEL CICLO MEDIO
max_alfa_tr_med = max(angulos_tronco.media_alfa);
min_alfa_tr_med = min(angulos_tronco.media_alfa);
max_beta_tr_med = max(angulos_tronco.media_beta);
min_beta_tr_med = min(angulos_tronco.media_beta);
max_gamma_tr_med = max(angulos_tronco.media_gamma);
min_gamma_tr_med = min(angulos_tronco.media_gamma);

% Muñeca
max_alfa_rwr_med = max(angulos_muneca.media_alfa);
min_alfa_rwr_med = min(angulos_muneca.media_alfa);
max_beta_rwr_med = max(angulos_muneca.media_beta);
min_beta_rwr_med = min(angulos_muneca.media_beta);
max_gamma_rwr_med = max(angulos_muneca.media_gamma);
min_gamma_rwr_med = min(angulos_muneca.media_gamma);

max_f_muneca_x_med = max(fuerzas_muneca.media_f_muneca_x);
min_f_muneca_x_med = min(fuerzas_muneca.media_f_muneca_x);

max_f_muneca_y_med = max(fuerzas_muneca.media_f_muneca_y);
min_f_muneca_y_med = min(fuerzas_muneca.media_f_muneca_y);

max_f_muneca_z_med = max(fuerzas_muneca.media_f_muneca_z);
min_f_muneca_z_med = min(fuerzas_muneca.media_f_muneca_z);

max_m_muneca_x_med = max(momentos_muneca.media_m_muneca_x);
min_m_muneca_x_med = min(momentos_muneca.media_m_muneca_x);

max_m_muneca_y_med = max(momentos_muneca.media_m_muneca_y);
min_m_muneca_y_med = min(momentos_muneca.media_m_muneca_y);

max_m_muneca_z_med = max(momentos_muneca.media_m_muneca_z);
min_m_muneca_z_med = min(momentos_muneca.media_m_muneca_z);   

% Codo
max_alfa_relb_med = max(angulos_codo.media_alfa);
min_alfa_relb_med = min(angulos_codo.media_alfa);
max_beta_relb_med = max(angulos_codo.media_beta);
min_beta_relb_med = min(angulos_codo.media_beta);
max_gamma_relb_med = max(angulos_codo.media_gamma);
min_gamma_relb_med = min(angulos_codo.media_gamma);

max_f_codo_x_med = max(fuerzas_codo.media_f_codo_x);
min_f_codo_x_med = min(fuerzas_codo.media_f_codo_x);

max_f_codo_y_med = max(fuerzas_codo.media_f_codo_y);
min_f_codo_y_med = min(fuerzas_codo.media_f_codo_y);

max_f_codo_z_med = max(fuerzas_codo.media_f_codo_z);
min_f_codo_z_med = min(fuerzas_codo.media_f_codo_z);

max_m_codo_x_med = max(momentos_codo.media_m_codo_x);
min_m_codo_x_med = min(momentos_codo.media_m_codo_x);

max_m_codo_y_med = max(momentos_codo.media_m_codo_y);
min_m_codo_y_med = min(momentos_codo.media_m_codo_y);

max_m_codo_z_med = max(momentos_codo.media_m_codo_z);
min_m_codo_z_med = min(momentos_codo.media_m_codo_z);

% Hombro
max_alfa_rsho_med = max(angulos_hombro.media_alfa);
min_alfa_rsho_med = min(angulos_hombro.media_alfa);
max_beta_rsho_med = max(angulos_hombro.media_beta);
min_beta_rsho_med = min(angulos_hombro.media_beta);
max_gamma_rsho_med = max(angulos_hombro.media_gamma);
min_gamma_rsho_med = min(angulos_hombro.media_gamma);

max_f_hombro_x_med = max(fuerzas_hombro.media_f_hombro_x);
min_f_hombro_x_med = min(fuerzas_hombro.media_f_hombro_x);

max_f_hombro_y_med = max(fuerzas_hombro.media_f_hombro_y);
min_f_hombro_y_med = min(fuerzas_hombro.media_f_hombro_y);

max_f_hombro_z_med = max(fuerzas_hombro.media_f_hombro_z);
min_f_hombro_z_med = min(fuerzas_hombro.media_f_hombro_z);

max_m_hombro_x_med = max(momentos_hombro.media_m_hombro_x);
min_m_hombro_x_med = min(momentos_hombro.media_m_hombro_x);

max_m_hombro_y_med = max(momentos_hombro.media_m_hombro_y);
min_m_hombro_y_med = min(momentos_hombro.media_m_hombro_y);

max_m_hombro_z_med = max(momentos_hombro.media_m_hombro_z);
min_m_hombro_z_med = min(momentos_hombro.media_m_hombro_z);
%% CALCULO DE LAS MEDIAS DE LOS PARÁMETROS ARTICULARES
% EN LOS CICLOS 8 A 12. TOMA LOS MÁXIMOS DE LOS CICLOS Y HACE LA MEDIA DE
% LOS MÁXIMOS/MÍNIMOS (NO EL MAXIMO/MÍNIMO DEL CICLO MEDIO)
    j=1;
for i=1:7
    a1(1,j) = max_ciclos_alfa_tr(i);
    a1(2,j) = min_ciclos_alfa_tr(i);
    a1(3,j) = max_ciclos_beta_tr(i);
    a1(4,j) = min_ciclos_beta_tr(i);
    a1(5,j) = max_ciclos_gamma_tr(i);
    a1(6,j) = min_ciclos_gamma_tr(i);
    % Hombro
    a1(7,j) = max_ciclos_alfa_rsho(i);
    a1(8,j) = min_ciclos_alfa_rsho(i);
    a1(9,j) = max_ciclos_beta_rsho(i);
    a1(10,j) = min_ciclos_beta_rsho(i);
    a1(11,j) = max_ciclos_gamma_rsho(i);
    a1(12,j) = min_ciclos_gamma_rsho(i);
    
    a1(13,j) = max_ciclos_f_hombro_x(i);
    a1(14,j) = min_ciclos_f_hombro_x(i);
    a1(15,j) = max_ciclos_f_hombro_y(i);
    a1(16,j) = min_ciclos_f_hombro_y(i);
    a1(17,j) = max_ciclos_f_hombro_z(i);
    a1(18,j) = min_ciclos_f_hombro_z(i);

    a1(19,j) = max_ciclos_m_hombro_x(i);
    a1(20,j) = min_ciclos_m_hombro_x(i);
    a1(21,j) = max_ciclos_m_hombro_y(i);
    a1(22,j) = min_ciclos_m_hombro_y(i);
    a1(23,j) = max_ciclos_m_hombro_z(i);
    a1(24,j) = min_ciclos_m_hombro_z(i);
    
    % Muñeca
    a1(25,j) = max_ciclos_alfa_rwr(i);
    a1(26,j) = min_ciclos_alfa_rwr(i);
    a1(27,j) = max_ciclos_beta_rwr(i);
    a1(28,j) = min_ciclos_beta_rwr(i);
    a1(29,j) = max_ciclos_gamma_rwr(i);
    a1(30,j) = min_ciclos_gamma_rwr(i);    

    a1(31,j) = max_ciclos_f_muneca_x(i);
    a1(32,j) = min_ciclos_f_muneca_x(i);
    a1(33,j) = max_ciclos_f_muneca_y(i);
    a1(34,j) = min_ciclos_f_muneca_y(i);
    a1(35,j) = max_ciclos_f_muneca_z(i);
    a1(36,j) = min_ciclos_f_muneca_z(i);

    a1(37,j) = max_ciclos_m_muneca_x(i);
    a1(38,j) = min_ciclos_m_muneca_x(i);
    a1(39,j) = max_ciclos_m_muneca_y(i);
    a1(40,j) = min_ciclos_m_muneca_y(i);
    a1(41,j) = max_ciclos_m_muneca_z(i);
    a1(42,j) = min_ciclos_m_muneca_z(i);
    % Codo
    a1(43,j) = max_ciclos_alfa_relb(i);
    a1(44,j) = min_ciclos_alfa_relb(i);
    a1(45,j) = max_ciclos_beta_relb(i);
    a1(46,j) = min_ciclos_beta_relb(i);
    a1(47,j) = max_ciclos_gamma_relb(i);
    a1(48,j) = min_ciclos_gamma_relb(i);

    a1(49,j) = max_ciclos_f_codo_x(i);
    a1(50,j) = min_ciclos_f_codo_x(i);
    a1(51,j) = max_ciclos_f_codo_y(i);
    a1(52,j) = min_ciclos_f_codo_y(i);
    a1(53,j) = max_ciclos_f_codo_z(i);
    a1(54,j) = min_ciclos_f_codo_z(i);

    a1(55,j) = max_ciclos_m_codo_x(i);
    a1(56,j) = min_ciclos_m_codo_x(i);
    a1(57,j) = max_ciclos_m_codo_y(i);
    a1(58,j) = min_ciclos_m_codo_y(i);
    a1(59,j) = max_ciclos_m_codo_z(i);
    a1(60,j) = min_ciclos_m_codo_z(i);
    j=j+1;
end
a2=mean(a1,2);