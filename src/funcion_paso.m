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

function [step,cont_up,cont_down]=funcion_paso(forces,frames)
%%
% Filtrado de los datos del SmartWheel

% Filtro de 4 orden Butterworth usado para muestrear la señal a una 
% frecuencia de 3/120Hz, donde 120 es la mitad de la frecuiencia de muestreo 
% de la SW
[b,a] = butter(4,6/120);
criterio_vect = zeros(frames,1);
criterio_vect = filtfilt(b,a,forces(:,6));

%%
%Criterio para detectar el momento en el que la mano está en el aro
%Criterio de inicio y fin de pulso  Mz>1N*m
criterio = 1;
up = 1;down = 1;
cont = [];
for i=2:frames-1
    if criterio_vect(i)>criterio
        step(i) = up;
    else
        step(i) = -up;
    end
    if criterio_vect(i)<criterio && criterio_vect(i+1)>criterio
        cont_up(up) = i; % Cont_up almacena los frames donde se produce el inicio
        % del ciclo de propulsion, dado por el criterio
        up = up+1;
    elseif criterio_vect(i)>criterio && criterio_vect(i+1)<criterio
        cont_down(down) = i; % Cont_up almacena los frames donde se produce el final
        % del agarre del aro, dado por el criterio
        down = down+1;
    end
end
step(1) = step(2);
step(end+1) = step(end);
% Para asegurar que siempre ocurre primero el evento cont_up

if cont_down(1) < cont_up(1)
    cont_down(1)=[];
end
% clear FMArray FSW a b camber filename forces i k pathname rot up val

% figure
% hold on
% plot(forces(:,6))
% plot(step,'k')
% plot(criterio_vect,'r')
% grid
