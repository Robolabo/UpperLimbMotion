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

function [forces, frames, FSW, tiempoSW,dt]=DatosCineticos(filename1,pathname1)


archivo_SW = dlmread([pathname1,filename1]); %Carga todos los datos del SW
dt = 1/240; % Frecuencia de adquisición del SW
samplesSW = archivo_SW(:,1);
tiempoSW = samplesSW*dt; % Vector de tiempo del SW
forces = archivo_SW(:,19:24); %Carga las Fuerzas y los Momentos [Fx Fy Fz Mx My Mz]
encoder = archivo_SW(:,4); % Posición angular de la rueda (grados)
frames = length(archivo_SW(:,1));  %Obtiene los frames del ensayo
% % Introduccion de los grados de caida de las ruedas traseras
% camber = input('Teclea los grados de caida de la rueda:','s');
% camber = str2double(camber);
camber = 0;

% Filtrado de los datos del SmartWheel_ Filtro de 4 orden Butterworth usado para muestrear la señal a una 
% frecuencia de 20/120Hz, donde 120 es la mitad de la frecuiencia de muestreo de la SW
[b,a] = butter(4,20/120);
FM_Filt = [];
for i=1:6
    FMArray = filtfilt(b,a,forces(:,i));
    FM_Filt = [FM_Filt,FMArray];
end

%Corrijo el valor de las fuerzas debido al angulo de caida de la rueda.
val = -1*camber*(2*pi)/360;
rot = [1 0 0 0 0 0;0 cos(val) sin(val) 0 0 0;0 -1*sin(val) cos(val) 0 0 0;0 0 0 1 0 0; 0 0 0 0 cos(val) sin(val);0 0 0 0 -1*sin(val) cos(val)];
for i=1:size(FM_Filt,1)
    FSW(i,:) = (rot*(FM_Filt(i,:))')';
end
%Añado el modulo del vector fuerza en la 7 columna
FSW(:,7) = ((FSW(:,1)).^2+(FSW(:,2)).^2+(FSW(:,3)).^2).^0.5;
