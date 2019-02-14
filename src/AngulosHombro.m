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
*    Developed in Robolabo <http://www.robolabo.etsit.upm.es/>
*          and in Hospital Nacional de Parapléjicos de Toledo <http://hnparaplejicos.sescam.castillalamancha.es>       
*/
function [gamma_rsho, beta_rsho, alfa_rsho]=AngulosHombro(frames,rot_TA_G, rot_BA_G);
%-----------------ANGULOS DE LA ARTICULACION DEL HOMBRO-------------------%

%Hay que tomar las transpuestas de las matrices de rotacion, para que los ejes
%locales esten en columnas en vez de filas. La matriz de rotacion del tronco
%esta previamente transpuesta (rot_BA_G_EU)

for t=1:frames
    %calcula la inversa de la matriz de rotacion del tronco
    rot_TA_G_inv(:,:,t) = inv(rot_TA_G(:,:,t));
    
    %haya la matriz de rotacion de tronco a brazo
    rot_tr_brazo(:,:,t) = rot_TA_G_inv(:,:,t)*rot_BA_G(:,:,t);
    
    %Se asume una secuencia de rotacion yx'y'' para el calculo de los Angulos de Euler
    %Adaptado de la funcion rotyzy.m de la pagina de la web de la ISB.
    %Todas las salidas son relativas al sistema de coordenadas local
    
    %Antes de promediar, el signo de la derecha o la izquierda debe ser cambiado
    %beta es la primera rotacion (sobre y)
        %lado derecho
            %+ beta = plano de elevacion por delante de la linea horizontal que conecta ambos acromiones
            %- beta = plano de elevacion por detras de la linea horizontal que conecta ambos acromiones
        %lado izquierdo
            %+ beta = plano de elevacion por detras de la linea horizontal que conecta ambos acromiones
            %- beta = plano de elevacion por delante de la linea horizontal que conecta ambos acromiones
    %alfa es la segunda rotacion (sobre x')
        %lado derecho
            %+ alfa = elevacion negativa (o aducción)
            %- alfa = elevacion positiva (o abducción)
        %lado izquierdo
            %+ alfa = elevacion positiva (o abducción)
            %- alfa = elevacion negativa (o aducción) 
    %gamma es la tercera rotacion (sobre y'')
        %lado derecho
            %+ gamma = rotacion interna
            %- gamma = rotacion externa
        %lado izquierdo
            %+ gamma = rotacion externa
            %- gamma = rotacion interna
    
    alfa1(t) = acos(rot_tr_brazo(2,2,t)); %Calcula la rotacion x' primero

    if alfa1(t)==0 %Si no hay rotacion en x' entonces la primera y tercera rotaciones son iguales
        beta(t) = acos(rot_tr_brazo(1,1,t)); %Asigna que toda rotacion sea primero sobre el eje y
        alfa(t) = alfa1(t); %La rotacion x' sigue siendo cero
        gamma(t) = 0.0; %Da la rotacion y'' igual a 0
    end
    
    sbeta(t) = rot_tr_brazo(1,2,t)/sin(alfa1(t)); %sin beta
    cbeta(t) = rot_tr_brazo(3,2,t)/sin(alfa1(t)); %cos beta
    beta1(t) = atan2(sbeta(t),cbeta(t)); %beta
    
    sgamma(t) = rot_tr_brazo(2,1,t)/sin(alfa1(t)); %sin gamma
    cgamma(t) = -rot_tr_brazo(2,3,t)/sin(alfa1(t)); %cos gamma
    gamma1(t) = atan2(sgamma(t),cgamma(t)); %gamma
    
    alfa2(t) = -alfa1(t); %alfa 2
    
    sbeta2(t) = rot_tr_brazo(1,2,t)/sin(alfa2(t)); %sin beta 2
    cbeta2(t) = rot_tr_brazo(3,2,t)/sin(alfa2(t)); %cos beta 2
    beta2(t) = atan2(sbeta2(t),cbeta2(t)); %beta 2
    
    sgamma2(t) = rot_tr_brazo(2,1,t)/sin(alfa2(t)); %sin gamma 2
    cgamma2(t) = -rot_tr_brazo(2,3,t)/sin(alfa2(t)); %cos gamma 2
    gamma2(t) = atan2(sgamma2(t),cgamma2(t)); %gamma 2
       
    % Alfa debe ser siempre negativa en el lado derecho
    if alfa1(t) <= 0 & alfa1(t) >= -pi %Adecua los valores de los angulos basado en la rotacion x
        beta(t)=abs(beta1(t));
        alfa(t)=abs(alfa1(t));
        gamma(t)=abs(gamma1(t));
    else
        beta(t)=beta2(t);
        alfa(t)=alfa2(t);
        gamma(t)=gamma2(t);
    end
end

% Paso a grados
beta_rsho=beta*(180/pi);
alfa_rsho=alfa*(180/pi);
gamma_rsho=gamma*(180/pi);
