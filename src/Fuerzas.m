function [f_muneca,f_codo,f_hombro,rD_L_mano,rP_L_mano,rD_L_anteb,rP_L_anteb,rD_L_brazo,rP_L_brazo]=Fuerzas (frames,FSW, CentrosMasa, Pesos, dt, rot_MG_A, rot_AG_A, rot_BG_A, rot_TG_A);
% Se asume que la mano contacta con SW en un punto en el tercer metacarpo
% Por lo que las fuerzas del SW se aplican al tercer metacarpo pero
% no haybrazo de momento entre el aro y el tercer metacarpo, por lo que
% los momentos en el tercer metacarpo son cero
i = 0;
g = 9,81; %valor de la gravedad
rD_G_mano = zeros(3,frames);
for t=1:frames
    i = i+1;
%      if step(1,t) > 0, % S�lo se inducen fuerzas cuando la mano est� sobre el aro, determinado por funci�n step
        rD_G_mano(1:3,i) = (-FSW(t,1:3)); %Las fuerzas de reacci�n en la mano son las negativas de las fuerzas aplicadas al aro
%      end
end

% Vector de aceleraciones lineales de los centros de masas calculadas en
% globales
for t=2:(frames-1)
    %     Mano
    manocmvel(t,:) = (CentrosMasa.cm_mano(t+1,:)-CentrosMasa.cm_mano(t-1,:))/(2*dt); % Velocidad 
    % lineal del cm de la mano
    manocmacc(t,:) = (CentrosMasa.cm_mano(t+1,:)-2*CentrosMasa.cm_mano(t,:)+CentrosMasa.cm_mano(t-1,:))/(dt^2); 
    % Aceleraci�n lineal del cm de la mano (diferencias centradas, O^2)

    %     Antebrazo
    antebcmvel(t,:) = (CentrosMasa.cm_anteb(t+1,:)-CentrosMasa.cm_anteb(t-1,:))/(2*dt);
    antebcmacc(t,:) = (CentrosMasa.cm_anteb(t+1,:)-2*CentrosMasa.cm_anteb(t,:)+CentrosMasa.cm_anteb(t-1,:))/(dt^2);
 
    %     Brazo
    brazocmvel(t,:) = (CentrosMasa.cm_brazo(t+1,:)-CentrosMasa.cm_brazo(t-1,:))/(2*dt);
    brazocmacc(t,:) = (CentrosMasa.cm_brazo(t+1,:)-2*CentrosMasa.cm_brazo(t,:)+CentrosMasa.cm_brazo(t-1,:))/(dt^2);
end

%Correccion de los frames primero y ultimo
manocmvel(1,:) = manocmvel(2,:);
manocmvel(frames,:) = manocmvel(frames-1,:);
antebcmvel(1,:) = antebcmvel(2,:);
antebcmvel(frames,:) = antebcmvel(frames-1,:);
brazocmvel(1,:) = brazocmvel(2,:);
brazocmvel(frames,:) = brazocmvel(frames-1,:);

manocmacc(1,:) = manocmacc(2,:);
manocmacc(frames,:) = manocmacc(frames-1,:);
antebcmacc(1,:) = antebcmacc(2,:);
antebcmacc(frames,:) = antebcmacc(frames-1,:);
brazocmacc(1,:) = brazocmacc(2,:);
brazocmacc(frames,:) = brazocmacc(frames-1,:);

%Calculo de las reacciones proximales (en globales)
fmanog = [0,Pesos.peso_mano*g,0]; % Fuerza debida al peso de la mano
fantebg = [0,Pesos.peso_anteb*g,0]; % Fuerza debida al peso de la mano
fbrazog = [0,Pesos.peso_brazo*g,0]; % Fuerza debida al peso de la mano

for t=1:frames
    % Mano
    rP_G_mano(:,t) = Pesos.peso_mano*manocmacc(t,:)' + fmanog' - rD_G_mano(:,t); % Calculo la resultante proximal en globales
    rD_L_mano(:,t) = rot_MG_A(:,:,t) * rD_G_mano(:,t); % Paso a locales las F distales
    rP_L_mano(:,t) = rot_MG_A(:,:,t) * rP_G_mano(:,t); % Paso a locales las F proximales
    rD_G_anteb(:,t) = -rP_G_mano(:,t); % F antebrazo distal=-F mano proximal
    % Antebrazo
    rP_G_anteb(:,t) = Pesos.peso_anteb*antebcmacc(t,:)' + fantebg' - rD_G_anteb(:,t); % Calculo la resultante proximal en globales
    rD_L_anteb(:,t) = rot_AG_A(:,:,t) * rD_G_anteb(:,t); % Paso a locales las F distales
    rP_L_anteb(:,t) = rot_AG_A(:,:,t) * rP_G_anteb(:,t); % Paso a locales las F proximales
    rD_G_brazo(:,t) = -rP_G_anteb(:,t); % F brazo distal=-F antebrazo proximal
    % Brazo
    rP_G_brazo(:,t) = Pesos.peso_brazo*brazocmacc(t,:)' + fbrazog' - rD_G_brazo(:,t); % Calculo la resultante proximal en globales
    rD_L_brazo(:,t) = rot_BG_A(:,:,t) * rD_G_brazo(:,t); % Paso a locales las F distales
    rP_L_brazo(:,t) = rot_BG_A(:,:,t) * rP_G_brazo(:,t); % Paso a locales las F proximales
    r_G_tronco(:,t) = -rP_G_brazo(:,t); % F hombro=-F brazo proximal
    
    r_L_tronco(:,t) = rot_TG_A(:,:,t) * r_G_tronco(:,t); % Paso a locales las F distales
    %Queda en vectores columna (x1 x2 x3 ...)
    %                          (y1 y2 y3 ...)
    %                          (z1 z2 z3 ...)

    resultanteF_amd(t) = sqrt((rD_G_mano(1,t))^2+(rD_G_mano(2,t))^2+(rD_G_mano(3,t))^2);
    resultanteF_muneca(t) = sqrt((rP_G_mano(1,t))^2+(rP_G_mano(2,t))^2+(rP_G_mano(3,t))^2);
    resultanteF_codo(t) = sqrt((rP_G_anteb(1,t))^2+(rP_G_anteb(2,t))^2+(rP_G_anteb(3,t))^2);
    resultanteF_hombro(t) = sqrt((rP_G_brazo(1,t))^2+(rP_G_brazo(2,t))^2+(rP_G_brazo(3,t))^2);
% Las fuerzas son las aplicadas por la articulaciÓn distal sobre la 
% proximal. El sistema de referencia es el de la articulacion proximal.
    f_muneca(:,t) = rD_L_anteb(:,t);
    f_codo(:,t) = rD_L_brazo(:,t);
    f_hombro(:,t) = r_L_tronco(:,t);
end
% Criterio para el hombro
%     Fuerzas: en locales del tronco, ejercidas por el brazo sobre el tronco.