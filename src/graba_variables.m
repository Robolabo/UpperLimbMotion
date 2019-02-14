%Introduccion del dato del ensayo
sujeto = input('Teclea el n�mero de sujeto (DOS D�GITOS): ','s');
grupo = input('Teclea el GRUPO de sujeto (1 2 3 o 4): ','s');
velocidad = input('Teclea la VELOCIDAD del ensayo ("l" o "r"): ','s');
cd('/Users/blancalarragagarcia/Documents/blancal/Fotogrametria original  Antonio')
% HOMBRO
datos(:,1) = angulos_hombro.media_alfa;
datos(:,2) = angulos_hombro.media_beta;
datos(:,3) = angulos_hombro.media_gamma;

datos(:,4) = fuerzas_hombro.media_f_hombro_x;
datos(:,5) = fuerzas_hombro.media_f_hombro_y;
datos(:,6) = fuerzas_hombro.media_f_hombro_z;

datos(:,7) = momentos_hombro.media_m_hombro_x;
datos(:,8) = momentos_hombro.media_m_hombro_y;
datos(:,9) = momentos_hombro.media_m_hombro_z;

% CODO
datos(:,10) = angulos_codo.media_alfa;
datos(:,11) = angulos_codo.media_beta;
datos(:,12) = angulos_codo.media_gamma;

datos(:,13) = fuerzas_codo.media_f_codo_x;
datos(:,14) = fuerzas_codo.media_f_codo_y;
datos(:,15) = fuerzas_codo.media_f_codo_z;

datos(:,16) = momentos_codo.media_m_codo_x;
datos(:,17) = momentos_codo.media_m_codo_y;
datos(:,18) = momentos_codo.media_m_codo_z;

% MU�ECA
datos(:,19) = angulos_muneca.media_alfa;
datos(:,20) = angulos_muneca.media_beta;
datos(:,21) = angulos_muneca.media_gamma;

datos(:,22) = fuerzas_muneca.media_f_muneca_x;
datos(:,23) = fuerzas_muneca.media_f_muneca_y;
datos(:,24) = fuerzas_muneca.media_f_muneca_z;

datos(:,25) = momentos_muneca.media_m_muneca_x;
datos(:,26) = momentos_muneca.media_m_muneca_y;
datos(:,27) = momentos_muneca.media_m_muneca_z;

% TRONCO
datos(:,28) = angulos_tronco.media_alfa;
datos(:,29) = angulos_tronco.media_beta;
datos(:,30) = angulos_tronco.media_gamma;

new_file(1,1:2) = sujeto;
new_file(1,3) = '_';
new_file(1,4) = 'G';
new_file(1,5) = grupo;
new_file(1,6) = '_';
new_file(1,7) = velocidad(1,1);

dlmwrite([new_file,'.txt'],datos);
 xlswrite('datos',A,'puntosprop');
 A = dlmread([new_file,'.txt']);