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
function MarcadoresFinales = DatosCinematicos(filename2, pathname2, tiempoSW)
% Cargado de los datos cinemáticos

data_ = dlmread([pathname2,filename2],'\t',1,0); %carga el archivo del Kinescan

% velocidad=inputdlg('velocidad');
framesKIN = length(data_(:,1));  %Obtiene los frames del ensayo
tiempoKIN = data_(:,1);

%-----Filtra las coordenadas de los marcadores (usar metodo del IBV)------%
ancho_suav = 8;
for i = 2:size(data_,2)
    x = data_(:,i);
    [xsuav] = KernelSmoothing(x,ancho_suav);
    data(:,i) = xsuav;
end

%% Introducción del orden de las coordenadas para el modelo con el marco
agd_s = data(:,(2:4));  %Articulacion glenohumeral
c7_s = data(:,(5:7));  %Cervical 7
cld_s = data(:,(8:10)); %Clavicula derecha
cli_s = data(:,(11:13)); %Clavicula izquierda
eed_s = data(:,(14:16)); %Epicondilo externo derecho
eid_s = data(:,(17:19)); %Epicondilo interno derecho
eje_s = data(:,(20:22)); %Marcador del eje de la rueda
marco_anterior_s = data(:,(23:25));
marco_medio_s = data(:,(26:28));
marco_posterior_s = data(:,(29:31));
nld_s = data(:,(32:34)); %Nudillo lateral derecho
nmd_s = data(:,(35:37)); %Nudillo medial derecho
rld_s = data(:,(38:40)); %Proceso radial derecho
uld_s = data(:,(41:43)); %Proceso ulnar derecho

for i=1:framesKIN
    acd_s(i,:) = (eed_s(i,:)+eid_s(i,:))/2; % Articulacion del codo derecho
    amd_s(i,:) = (rld_s(i,:)+uld_s(i,:))/2; % Articulacion de la muñeca derecha
    mnd_s(i,:) = (nmd_s(i,:)+nld_s(i,:))/2; % Tercer metacarpo (en la mitad de la recta que une ambos nudillos)
    icj_s(i,:) = (cld_s(i,:)+cli_s(i,:))/2; % Incisa Juglaris (en la mitad de la recta que une las claviculas)
end
%%
%------CAMBIO DE COORDENADAS DEL SISTEMA GLOBAL HNPT AL SISTEMA ISB-------%
% El sistema aconsejado por la ISB tiene: 
%       Eje vertical: +Y en direccion contraria a la gravedad
%       Eje anteroposterior: +X en la direccion del movimiento
%       Eje mediolateral: +Z (hacia la derecha)
% El sistema calibrado actual en el laboratorio tiene: 
%       Eje vertical: +Z en direccion contraria a la gravedad
%       Eje anteroposterior: +Y hacia la izquierda
%       Eje mediolateral: +X en la dirección del movimiento
rot = [1,0,0;0,0,1;0,-1,0]'; %Matriz de cambio de coordenadas para los marcadores.

for t=1:framesKIN
    acd_s(t,:) = acd_s(t,:)*rot;   %Articulacion del codo derecho
    agd_s(t,:) = agd_s(t,:)*rot;  %Articulacion glenohumeral
    amd_s(t,:) = amd_s(t,:)*rot; %Articulacion de la muñeca derecha
    c7_s(t,:) = c7_s(t,:)*rot;  %Cervical 7
    cld_s(t,:) = cld_s(t,:)*rot; %Clavicula derecha
    cli_s(t,:) = cli_s(t,:)*rot; %Clavicula izquierda
    eed_s(t,:) = eed_s(t,:)*rot; %Epicondilo externo derecho
    eid_s(t,:) = eid_s(t,:)*rot; %Epicondilo interno derecho
    icj_s(t,:) = icj_s(t,:)*rot; %Incisa Juglaris (en la mitad de la recta que une las claviculas)    
    eje_s(t,:) = eje_s(t,:)*rot;
    marco_anterior_s(t,:) = marco_anterior_s(t,:)*rot;
    marco_medio_s(t,:) = marco_medio_s(t,:)*rot;
    marco_posterior_s(t,:) = marco_posterior_s(t,:)*rot;
    mnd_s(t,:) = mnd_s(t,:)*rot; %Tercer metacarpo (en la mitad de la recta que une ambos nudillos)
    rld_s(t,:) = rld_s(t,:)*rot; %Proceso radial derecho
    uld_s(t,:) = uld_s(t,:)*rot; %Proceso ulnar derecho
end

%%
%-----------Calculo de las splines para igualar SW y cinemaica------------%
% Aplico spline a los datos del Kinescan y del SW para igualarlos con una
%frecuencia teórica de 240 Hz (Kinescan graba a 50Hz. SW graba a 240Hz)
for i=1:3 %splines del Kinescan
    acd(:,i) = interp1(tiempoKIN,acd_s(:,i),tiempoSW,'spline');   %Articulacion del codo derecho
    agd(:,i) = interp1(tiempoKIN,agd_s(:,i),tiempoSW,'spline');%Articulacion glenohumeral
    amd(:,i) = interp1(tiempoKIN,amd_s(:,i),tiempoSW,'spline'); %Articulacion de la muñeca derecha
    c7(:,i) = interp1(tiempoKIN,c7_s(:,i),tiempoSW,'spline');  %Cervical 7
    cld(:,i) = interp1(tiempoKIN,cld_s(:,i),tiempoSW,'spline'); %Clavicula derecha
    cli(:,i) = interp1(tiempoKIN,cli_s(:,i),tiempoSW,'spline'); %Clavicula izquierda
    eed(:,i) = interp1(tiempoKIN,eed_s(:,i),tiempoSW,'spline'); %Epicondilo externo derecho
    eid(:,i) = interp1(tiempoKIN,eid_s(:,i),tiempoSW,'spline'); %Epicondilo interno derecho
    icj(:,i) = interp1(tiempoKIN,icj_s(:,i),tiempoSW,'spline'); %Incisa Juglaris
    eje(:,i) = interp1(tiempoKIN,eje_s(:,i),tiempoSW,'spline');
    marco_anterior(:,i) = interp1(tiempoKIN,marco_anterior_s(:,i),tiempoSW,'spline');
    marco_medio(:,i) = interp1(tiempoKIN,marco_medio_s(:,i),tiempoSW,'spline');
    marco_posterior(:,i) = interp1(tiempoKIN,marco_posterior_s(:,i),tiempoSW,'spline');
    mnd(:,i) = interp1(tiempoKIN,mnd_s(:,i),tiempoSW,'spline'); %Tercer metacarpo (en la mitad de la recta que une ambos nudillos)
    rld(:,i) = interp1(tiempoKIN,rld_s(:,i),tiempoSW,'spline'); %Proceso radial derecho
    uld(:,i) = interp1(tiempoKIN,uld_s(:,i),tiempoSW,'spline'); %Proceso ulnar derecho
end
MarcadoresFinales=Marcadores(acd, agd, amd, c7, cld, cli, eed, eid, icj, eje, marco_anterior, marco_medio, marco_posterior, mnd, rld, uld);
