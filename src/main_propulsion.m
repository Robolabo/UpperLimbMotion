/*
*    This program is free software: you can redistribute it and/or modify
*    it under the terms of the GNU General Public License as published by
*    the Free Software Foundation, either version 3 of the License, or
*    any later version.
*
*    This program is distributed in the hope that it will be useful,
*    but WITHOUT ANY WARRANTY; without even the implied warranty of
*    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
*    GNU General Public License for more details.
*
*    You should have received a copy of the GNU General Public License
*    along with this program.  If not, see <http://www.gnu.org/licenses/>.
*
*
*    Authors: Blanca Larraga García <blanca.larraga@upm.es>
*             Antonio J. del Ama Espinosa <ajdela@sescam.jccm.es>
*	          Alvaro Gutierrez Martin <aguti@etsit.upm.es>
*
*    Developed in Hospital Nacional de Parapléjicos de Toledo <http://hnparaplejicos.sescam.castillalamancha.es> 
*          and in Robolabo <http://www.robolabo.etsit.upm.es/>    
*/

close all
clear all
clc

%------------------------Datos CINETICOS----------------------------------%
% Carga de datos cinéticos de las SmartWheel
[filename1,pathname1] = uigetfile('*.csv','Selecciona los datos CIN�TICOS a analizar.');
[forces,frames,FSW,tiempoSW,dt]= DatosCineticos(filename1, pathname1);

% Creacion del vector step
% Criterio de inicio y fin de pulso como mayor de 1 Nm en Mz
[step,cont_up,cont_down] = funcion_paso(forces,frames);

%%
%-----------------Datos CINEMATICOS---------------------------------------%
% Obtengo las coordenadas de los marcadores
[filename2,pathname2] = uigetfile('*.txt','Selecciona los datos CINEM�TICOS a analizar.')
MarcadoresFinales=DatosCinematicos(filename2, pathname2, tiempoSW);

%% 
%-----------------ANTROPOMETRIA-------------------------------------------%
[MomentosInercia,CentrosMasa,Pesos]= Antropometria(pathname2,frames,MarcadoresFinales); 

%%
%--------------CALCULO DE LOS SISTEMAS DE REFERENCIA LOCALES--------------%
[rot_MG_A,rot_MA_G, mnd_ML, amd_ML]= SRLMano(frames,MarcadoresFinales,CentrosMasa);
[rot_AG_A,rot_AA_G,j_anteb_EU, amd_AL, acd_AL]= SRLAnteb (frames,MarcadoresFinales,CentrosMasa);
[rot_BG_A,rot_BA_G,acd_BL, agd_BL]= SRLBrazo(frames, MarcadoresFinales, j_anteb_EU,CentrosMasa);
[rot_TG_A,rot_TA_G]= SRLTronco(frames, MarcadoresFinales);
 
%%
%---CALCULO DE LOS ANGULOS DE EULER PARA LA REPRESENTACION CINEMATICA-----%
        
%La referencia para todos los calculos de los Angulos de Euler
%es Wu G. et al... ISG recommendation on definitions de joint coordinate systems de
%various joints        
[gamma_tr, beta_tr, alfa_tr]=AngulosTronco (frames,rot_TA_G);
[gamma_rsho, beta_rsho, alfa_rsho]=AngulosHombro(frames,rot_TA_G, rot_BA_G);
[gamma_relb, beta_relb, alfa_relb]=AngulosCodo(frames, rot_BA_G, rot_AA_G);
[gamma_rwr, beta_rwr, alfa_rwr]=AngulosMuneca(frames, rot_AA_G, rot_MA_G);

%%
%------------------CINETICA DE LAS ARTICULACIONES-------------------------%
% Ahora se trata de realizar el calculo cinetico de las articulaciones Lo 
% mejor es basarse en una rotacion x-y'-z'' para las velocidades angulares, 
% tal y como describe el libro de Winters y el de Zatriorsky y el archivo 
% de HERL. Utilizo las mismas matrices de rotacion desarrolladas para el 
% calculo cinematico.
% Debe ser la matriz de cambio de global a local.
% Para la cinética sigo totalmente la convención de Winter: La rotación
% se produce en el sistema local respecto del global, por lo que las
% matrices de rotacion deben ser premultiplicadas.
% Además la matriz de rotación de cada una de las rotaciones de la que
% se extraen los ángulos son las de global a local: expresan la 
% rotación que el sistema global debería describir para llegar a la 
% posición que tiene el sistema local una vez realizadas las 
% rotaciones, con lo que expresa los ángulos del sistema local respecto
% de global según el orden de rotación elegido (x-y'-z'' en este caso)

[gamma_M_grad, beta_M_grad, alfa_M_grad, phi_M]=CineticaMano(frames,rot_MG_A,dt);
[gamma_A_grad, beta_A_grad, alfa_A_grad,phi_A,omega_A]=CineticaAnteb (frames, rot_AG_A,dt);
[gamma_B_grad, beta_B_grad, alfa_B_grad,phi_B,omega_B]=CineticaBrazo(frames, rot_BG_A, dt);

%%
%-----------------------CALCULOS CINETICOS--------------------------------%

[f_muneca,f_codo,f_hombro,rD_L_mano,rP_L_mano,rD_L_anteb,rP_L_anteb,rD_L_brazo,rP_L_brazo]=Fuerzas (frames,FSW,CentrosMasa,Pesos, dt, rot_MG_A, rot_AG_A, rot_BG_A, rot_TG_A );
[m_muneca, m_codo, m_hombro]=Momentos(frames,mnd_ML, amd_ML, amd_AL, acd_AL, acd_BL, agd_BL,MomentosInercia, phi_M,rD_L_mano,rP_L_mano, rot_MA_G, rot_AG_A, phi_A,omega_A, rD_L_anteb,rP_L_anteb, rot_AA_G, rot_BG_A,phi_B,omega_B,rD_L_brazo, rP_L_brazo, rot_BA_G, rot_TG_A);

Normalizacion_ciclos;
%variablesSW;
%puntos_propulsion;  
%resultados;
graficas;
%graba_variables;
save ('angulostronco.mat','escala_normal','angulos_tronco') 
save ('hombro.mat','escala_normal','angulos_hombro','fuerzas_hombro')
save ('codo.mat','escala_normal','angulos_codo','fuerzas_codo')
save ('muneca.mat','escala_normal','angulos_muneca','fuerzas_muneca')
save ('maximosyminimos.mat','ymax_alpha_tr','ymin_alpha_tr','ymax_beta_tr','ymin_beta_tr','ymax_gamma_tr','ymin_gamma_tr',...
'ymax_momentox_hombro','ymin_momentox_hombro','ymax_momentoy_hombro','ymin_momentoy_hombro','ymax_momentoz_hombro','ymin_momentoz_hombro',...
'ymax_fuerzax_hombro','ymin_fuerzax_hombro','ymax_fuerzay_hombro','ymin_fuerzay_hombro','ymax_fuerzaz_hombro','ymin_fuerzaz_hombro',...
'ymax_alpha_hombro','ymin_alpha_hombro','ymax_beta_hombro','ymin_beta_hombro','ymax_gamma_hombro','ymin_gamma_hombro',...
'ymax_momentox_codo','ymin_momentox_codo','ymax_momentoy_codo','ymin_momentoy_codo','ymax_momentoz_codo','ymin_momentoz_codo',...
'ymax_fuerzax_codo','ymin_fuerzax_codo','ymax_fuerzay_codo','ymin_fuerzay_codo','ymax_fuerzaz_codo','ymin_fuerzaz_codo',...
'ymax_alpha_codo','ymin_alpha_codo','ymax_beta_codo','ymin_beta_codo','ymax_gamma_codo','ymin_gamma_codo',...
'ymax_momentox_muneca','ymin_momentox_muneca','ymax_momentoy_muneca','ymin_momentoy_muneca','ymax_momentoz_muneca','ymin_momentoz_muneca',...
'ymax_fuerzax_muneca','ymin_fuerzax_muneca','ymax_fuerzay_muneca','ymin_fuerzay_muneca','ymax_fuerzaz_muneca','ymin_fuerzaz_muneca',...
'ymax_alpha_muneca','ymin_alpha_muneca','ymax_beta_muneca','ymin_beta_muneca','ymax_gamma_muneca','ymin_gamma_muneca')
