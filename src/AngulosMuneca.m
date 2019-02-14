function [gamma_rwr, beta_rwr, alfa_rwr]=AngulosMuneca(frames, rot_AA_G, rot_MA_G);
%---------------ANGULOS DE LA ARTICULACION DE LA MUÑECA-------------------%

%Hay que tomar las transpuestas de las matrices de rotacion, para que los ejes
%locales esten en columnas en vez de filas.

for t=1:frames    
    %calcula la inversa de la matriz de rotacion del antebrazo
    rot_AA_G_inv(:,:,t)=inv(rot_AA_G(:,:,t));
    
    %haya la matriz de rotacion de mano a antebrazo
    rot_anteb_mano(:,:,t)=rot_AA_G_inv(:,:,t)*rot_MA_G(:,:,t);
    
    %Se asume una secuencia de rotacion zy'x'' para el calculo de los Angulos de Euler
    %Adaptado de la funcion rotzyx.m de la pagina de la web de la ISB.
    %Todas las salidas son relativas al sistema de coordenadas local
    %Antes de promediar, el signo de la derecha o la izquierda debe ser
    %cambiado
    
    %gamma es la primera rotacion (sobre z)
        %Lados derecho e izquierdo dan lo mismo
            %+ gamma = flexion
            %- gamma = extension
    %beta es la segunda rotacion (sobre y)
        %Lado derecho
            %+ beta = rotacion interna
            %- beta = rotacion externa
        %Lado izquierdo
            %+ beta = rotacion externa
            %- beta = rotacion interna            
    %alfa es la tercera rotacion (sobre x)
        %Lado derecho
            %+ alfa = desviacion ulnar
            %- alfa = desviacion radial
        %Lado izquierdo
            %+ alfa = desviacion radial
            %- alfa = desviacion ulnar
    
    beta1_wr(t)= asin(-rot_anteb_mano(3,1,t)); %calcula primero la rotacion sobre y'

    salfa_wr(t) = rot_anteb_mano(3,2,t)/cos(beta1_wr(t)); %sin alfa
    calfa_wr(t) = rot_anteb_mano(3,3,t)/cos(beta1_wr(t)); %cos alfa
    alfa1_wr(t) = atan2(salfa_wr(t),calfa_wr(t)); %alfa

    sgamma_wr(t) = rot_anteb_mano(2,1,t)/cos(beta1_wr(t)); %sin gamma
    cgamma_wr(t) = rot_anteb_mano(1,1,t)/cos(beta1_wr(t)); %cos gamma
    gamma1_wr(t) = atan2(sgamma_wr(t),cgamma_wr(t)); %gamma

    if beta1_wr(t)>=0
        beta2_wr(t) = pi-beta1_wr(t);
    else
        beta2_wr(t)= -pi-beta1_wr(t);
    end

    salfa2_wr(t) = rot_anteb_mano(3,2,t)/cos(beta2_wr(t)); %sin alfa 2
    calfa2_wr(t) = rot_anteb_mano(3,3,t)/cos(beta2_wr(t)); %cos alfa 2
    alfa2_wr(t) = atan2(salfa2_wr(t),calfa2_wr(t)); %alfa 2

    sgamma2_wr(t) = rot_anteb_mano(2,1,t)/cos(beta2_wr(t)); %sin gamma 2
    cgamma2_wr(t) = rot_anteb_mano(1,1,t)/cos(beta2_wr(t)); %cos gamma 2
    gamma2_wr(t) = atan2(sgamma2_wr(t),cgamma2_wr(t)); %gamma 2

    if -pi/2 <= beta1_wr(t) & beta1_wr(t) <= pi/2 %Adecua los valores de los angulos basado en la rotacion x
        gamma_wr(t) = gamma1_wr(t);
        beta_wr(t) = beta1_wr(t);
        alfa_wr(t) = alfa1_wr(t);
    else
        gamma_wr(t) = gamma2_wr(t);
        beta_wr(t) = beta2_wr(t);
        alfa_wr(t) = alfa2_wr(t);
    end
end

% Paso a grados
gamma_rwr = gamma_wr*(180/pi);
beta_rwr = beta_wr*(180/pi);
alfa_rwr = alfa_wr*(180/pi);
