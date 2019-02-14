function [m_muneca, m_codo, m_hombro]=Momentos(frames,mnd_ML, amd_ML, amd_AL, acd_AL, acd_BL, agd_BL, MomentosInercia, phi_M,rD_L_mano,rP_L_mano, rot_MA_G, rot_AG_A, phi_A,omega_A, rD_L_anteb,rP_L_anteb, rot_AA_G, rot_BG_A, phi_B,omega_B,rD_L_brazo, rP_L_brazo, rot_BA_G, rot_TG_A);
%Calculo de los momentos en las articulaciones: ECUACIONES DE EULER-NEWTON-

%Calculo de las distancias medias de las articulaciones prox. y dist. en el SRL de la mano
lD_mano = mean(mnd_ML);
lP_mano = mean(amd_ML);
%Calculo de las distancias medias de las articulaciones prox. y dist. en el SRL del antebrazo
lD_anteb = mean(amd_AL);
lP_anteb = mean(acd_AL);
%Calculo de las distancias medias de las articulaciones prox. y dist. en el SRL del brazo
lD_brazo = mean(acd_BL);
lP_brazo = mean(agd_BL);

for t=1:frames
    %MUÑECA
    mP_L_mano(1,t) = MomentosInercia.Ixyz_mano * phi_M(1,t) - rD_L_mano(3,t) * lD_mano(2) -...
        rP_L_mano(3,t) * lP_mano(2); %+(mD_L_mano(1:t) = 0)
    mP_L_mano(2,t) = MomentosInercia.Ixyz_mano * phi_M(2,t); %+(mD_L_mano(2:t) = 0)
    mP_L_mano(3,t) = MomentosInercia.Ixyz_mano * phi_M(3,t) + rD_L_mano(1,t) * lD_mano(2)...
        + rP_L_mano(1,t) * lP_mano(2); %+(mD_L_mano(3:t) = 0)
    %Paso el vector de momentos proximales (en la muñeca) a globales
    M_amd(:,t) = rot_MA_G(:,:,t) * mP_L_mano(:,t);

    %CODO
    %Paso el vector de momentos de la muñeca (en G) a momentos ejercidos
    %por la muñeca sobre el antebrazo (reacción: signo negativo), en
    %coordenadas locales del antebrazo
    mD_L_anteb(:,t) = rot_AG_A(:,:,t) * -M_amd(:,t);
    %Calculo los momentos proximales
    mP_L_anteb(1,t) = MomentosInercia.Ixx_anteb * phi_A(1,t) + (MomentosInercia.Izz_anteb-MomentosInercia.Iyy_anteb)...
        * omega_A(2,t) * omega_A(3,t) - rD_L_anteb(3,t) * lD_anteb(2)...
        - rP_L_anteb(3,t) * lP_anteb(2) + mD_L_anteb(1,t);
    mP_L_anteb(2,t) = MomentosInercia.Iyy_anteb * phi_A(2,t) + (MomentosInercia.Ixx_anteb-MomentosInercia.Izz_anteb)...
        * omega_A(1,t) * omega_A(3,t) + mD_L_anteb(2,t);
    mP_L_anteb(3,t) = MomentosInercia.Izz_anteb * phi_A(3,t) + (MomentosInercia.Iyy_anteb-MomentosInercia.Ixx_anteb)...
        * omega_A(1,t) * omega_A(2,t) + rD_L_anteb(1,t) * lD_anteb(2)...
        + rP_L_anteb(1,t) * lP_anteb(2) + mD_L_anteb(3,t);
    %Paso el vector de momentos proximales (en el codo) a globales
    M_acd(:,t) = rot_AA_G(:,:,t) * mP_L_anteb(:,t);

    %HOMBRO
    %Paso el vector de momentos del codo (en G) a momentos ejercidos
    %por el antebrazo sobre el brazo(reacci�n: signo negativo), en
    %coordenadas locales del brazo
    mD_L_brazo(:,t) = rot_BG_A(:,:,t) * -M_acd(:,t);
    %Calculo los momentos proximales
    mP_L_brazo(1,t) = MomentosInercia.Ixx_brazo * phi_B(1,t) + (MomentosInercia.Izz_brazo-MomentosInercia.Iyy_brazo)...
        * omega_B(3,t) * omega_B(2,t) - rD_L_brazo(3,t) * lD_brazo(2)...
        - rP_L_brazo(3,t) * lP_brazo(2) + mD_L_brazo(1,t);
    mP_L_brazo(2,t) = MomentosInercia.Iyy_brazo * phi_B(2,t) + (MomentosInercia.Ixx_brazo-MomentosInercia.Izz_brazo)...
        * omega_B(1,t) * omega_B(3,t) + mD_L_brazo(2,t);
    mP_L_brazo(3,t) = MomentosInercia.Izz_brazo * phi_B(3,t) + (MomentosInercia.Iyy_brazo-MomentosInercia.Ixx_brazo)...
        * omega_B(1,t) * omega_B(2,t) + rD_L_brazo(1,t) * lD_brazo(2)...
        + rP_L_brazo(1,t) * lP_brazo(2) + mD_L_brazo(3,t);
    %Paso el vector de momentos proximales (en el hombro) a globales
    M_agd(:,t) = rot_BA_G(:,:,t) * mP_L_brazo(:,t);
    %Paso el vector de momentos proximales (en el hombro) al sistema de
    %referencia del tronco: momentos ejercidos por el tronco sobre el brazo
    %en el SRL del tronco (accion: signo positivo):
    mD_L_tronco(:,t) = rot_TG_A(:,:,t) * M_agd(:,t);
    
    resultanteM_muneca(t) = sqrt((M_amd(1,t))^2+(M_amd(2,t))^2+(M_amd(3,t))^2);
    resultanteM_codo(t) = sqrt((M_acd(1,t))^2+(M_acd(2,t))^2+(M_acd(3,t))^2);
    resultanteM_hombro(t) = sqrt((M_agd(1,t))^2+(M_agd(2,t))^2+(M_agd(3,t))^2);
% Los momentos son los aplicados por la articulación proximal sobre la
% distal. El sistema de referencia es el de la articulación proximal.
    m_muneca(:,t) = rot_AG_A(:,:,t) * M_amd(:,t);
    m_codo(:,t) = rot_BG_A(:,:,t) * M_acd(:,t);
    m_hombro(:,t) = rot_TG_A(:,:,t) * M_agd(:,t);
% % Para intercomparar con el artículo de Collinger, uso la representación en
% % el sistema local del húmero.
%     m_hombro(:,t) = -mP_L_brazo(:,t);
end

% El momento de rotación interna lo expreso en el sistema de referencia
% local del húmero, con lo cual:
% Mx y Mz en local del tronco
% My en local del húmero
m_hombro(2,:) = mP_L_brazo(2,:);

% Criterio para el hombro
%     Momentos: en locales del tronco, ejercidas por el tronco sobre el
%     brazo, salvo el My (rotación interna/externa), que se da en el
%     sistema de referencia del brazo.