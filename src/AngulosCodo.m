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


function [gamma_relb, beta_relb, alfa_relb]=AngulosCodo(frames, rot_BA_G, rot_AA_G);

%-----------------ANGULOS DE LA ARTICULACION DEL CODO---------------------%

for t=1:frames
    %calcula la inversa de la matriz de rotacion del brazo
    rot_BA_G_inv(:,:,t)=inv(rot_BA_G(:,:,t));
    
    %haya la matriz de rotacion de brazo a antebrazo
    rot_brazo_fa(:,:,t)=rot_BA_G_inv(:,:,t)*rot_AA_G(:,:,t);
    
    %Se asume una secuencia de rotacion zx'y'' para el calculo de los Angulos de Euler
    %Adaptado de la funcion rotzxy.m de la pagina de la web de la ISB.
    %Todas las salidas son relativas al sistema de coordenadas local
    %Antes de promediar, el signo de la derecha o la izquierda debe ser cambiado
    
    %gamma es la primera rotacion (sobre z)
        %Lados derecho e izquierdo dan lo mismo
            %+ gamma = flexion
            %- gamma = extension
    %alfa es la segunda rotacion (sobre x) (debe ser ~=0)
        %Lado derecho
            %+ alfa = adduccion
            %- alfa = abduccion
        %Lado izquierdo
            %+ alfa = abduccion
            %- alfa = adduccion
    %beta es la tercera rotacion (sobre y)
        %Lado derecho
            %+ beta = rotacion interna
            %- beta = rotacion externa
        %Lado izquierdo
            %+ beta = rotacion externa
            %- beta = rotacion interna
    
    alfa1_elb(t)= asin(rot_brazo_fa(3,2,t)); %Calcula la rotacion x' primero
    
    sbeta_elb(t) = -rot_brazo_fa(3,1,t)/cos(alfa1_elb(t)); %sin beta
    cbeta_elb(t) = rot_brazo_fa(3,3,t)/cos(alfa1_elb(t)); %cos beta
    beta1_elb(t) = atan2(sbeta_elb(t),cbeta_elb(t)); %beta
    
    sgamma_elb(t) = -rot_brazo_fa(1,2,t)/cos(alfa1_elb(t)); %sin gamma
    cgamma_elb(t) = rot_brazo_fa(2,2,t)/cos(alfa1_elb(t)); %cos gamma
    gamma1_elb(t) = atan2(sgamma_elb(t),cgamma_elb(t)); %gamma
    
    if alfa1_elb(t)>=0
        alfa2_elb(t) = pi-alfa1_elb(t);
    else
        alfa2_elb(t)= -pi-alfa1_elb(t);
    end
    
    %Se comprueba si alfa es inestable a 180/-180 grados y se impone
    %alfa igual al cero en el caso de que sea inestable. El codo
    %puede tener un muy peque�o ROM sobre el eje x
    
    if alfa2_elb(t) == pi
        alfa2_elb(t) = 0;
    end
    if alfa2_elb(t)== -pi
        alfa2_elb(t) = 0;
    end
    
    sbeta2_elb(t) = -rot_brazo_fa(3,1,t)/cos(alfa2_elb(t)); %sin beta 2
    cbeta2_elb(t) = rot_brazo_fa(3,3,t)/cos(alfa2_elb(t)); %cos beta 2
    beta2_elb(t) = atan2(sbeta2_elb(t),cbeta2_elb(t)); %beta 2
    
    sgamma2_elb(t) = -rot_brazo_fa(1,2,t)/cos(alfa2_elb(t)); %sin gamma 2
    cgamma2_elb(t) = rot_brazo_fa(2,2,t)/cos(alfa2_elb(t)); %cos gamma 2
    gamma2_elb(t) = atan2(sgamma2_elb(t),cgamma2_elb(t)); %gamma 2
    
    if -pi/2 <= alfa1_elb(t) & alfa1_elb(t) <= pi/2 %Adecua los valores de los angulos basado en la rotacion x
        gamma_elb(t) = gamma1_elb(t);
        alfa_elb(t) = alfa1_elb(t);
        beta_elb(t) = beta1_elb(t);
    else
        gamma_elb(t) = gamma2_elb(t);
        alfa_elb(t) = alfa2_elb(t);
        beta_elb(t) = beta2_elb(t);
    end

    if beta_elb(t)<0 %Correccion por el cambio de 180 grados debido a la arctg
        beta_elb(t) = beta_elb(t)+2*pi;
    end
end

% Paso a grados
gamma_relb = gamma_elb*(180/pi);
alfa_relb = alfa_elb*(180/pi);
beta_relb = beta_elb*(180/pi);
