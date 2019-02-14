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

function [gamma_tr, beta_tr, alfa_tr]=AngulosTronco (frames,rot_TA_G);

%---Movimiento del TRONCO en relacion con el sistema global----%
        
%Las matrices de rotacion tienen que tener los ejes locales en columnas: rot_TA_G(:,:,t)

%Se asume una secuencia de rotacion z-x'-y'' para el calculo de los Angulos de Euler
    %gamma es la primera rotacion (sobre z)
        %+ gamma = extension
        %- gamma = flexion
    %alfa es la segunda rotacion (sobre x)
        %+ alfa = balanceo lateral hacia la derecha
        %- alfa = balanceo lateral hacia la izquierda
    %beta es la tercera rotacion (sobre y)
        %+ beta = torsion hacia la izquierda
        %- beta = torsion hacia la derecha

for t=1:frames
    % Esta calculado como el tronco respecto del sistema global, la silla
    % tiene movimiento.
   
    alfa1_tr(t) = asin(rot_TA_G(3,2,t)); %calcula la rotacion x' primero
    
    sbeta1_tr(t) = -rot_TA_G(3,1,t) / cos(alfa1_tr(t)); %sin alpha
    cbeta1_tr(t) = rot_TA_G(3,3,t) / cos(alfa1_tr(t)); %cos alpha
    beta1_tr(t) = atan2(sbeta1_tr(t),cbeta1_tr(t)); %alpha
    
    sgamma_tr(t) = -rot_TA_G(1,2,t) / cos(alfa1_tr(t)); %sin gamma
    cgamma_tr(t) = rot_TA_G(2,2,t) / cos(alfa1_tr(t)); %cos gamma
    gamma1_tr(t) = atan2(sgamma_tr(t),cgamma_tr(t)); %gamma
    
    if alfa1_tr(t)>=0
        alfa2_tr(t) = pi - alfa1_tr(t);
    else
        alfa2_tr(t) = -pi - alfa1_tr(t);
    end
    sbeta_tr(t) = -rot_TA_G(3,1,t) / cos(alfa2_tr(t)); %sin alpha
    cbeta_tr(t) = rot_TA_G(3,3,t) / cos(alfa2_tr(t)); %cos alpha
    beta2_tr(t) = atan2(sbeta_tr(t),cbeta_tr(t)); %alpha
    
    sgamma_tr(t) = -rot_TA_G(1,2,t) / cos(alfa2_tr(t)); %sin gamma
    cgamma_tr(t) = rot_TA_G(2,2,t) / cos(alfa2_tr(t)); %cos gamma
    gamma2_tr(t) = atan2(sgamma_tr(t),cgamma_tr(t)); %gamma
    
    if (-pi/2 <= alfa1_tr(t) && alfa1_tr(t) <= pi/2)
        beta_tr(t) = beta1_tr(t);
        gamma_tr(t) = gamma1_tr(t);
        alfa_tr(t) = alfa1_tr(t);
    else
        beta_tr(t) = beta2_tr(t);
        gamma_tr(t) = gamma2_tr(t);
        alfa_tr(t) = alfa2_tr(t);
    end
end

% Paso a grados
gamma_tr(t) = gamma_tr(t) * (180/pi);
beta_tr(t) = beta_tr(t) * (180/pi);
alfa_tr(t) = alfa_tr(t) * (180/pi);
