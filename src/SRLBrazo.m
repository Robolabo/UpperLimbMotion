function [rot_BG_A,rot_BA_G,acd_BL, agd_BL]=SRLBrazo(frames, MarcadoresFinales,j_anteb_EU,CentrosMasa);

n=1; %Lado derecho n=1; Lado izquierdo n=2
%----------BRAZO--------------
%Calculo del sistema local, segun ISB
for t=1:frames
    % Eje j del antebrazo (Yf en Wu et al.) (j_anteb_EU)
    
    %eje j del brazo (j_s en cooper's paper)
    v2_brazo(t,:) = MarcadoresFinales.agd(t,:) - MarcadoresFinales.acd(t,:); %vector 2, no normalizado
    j_brazo(t,:) = v2_brazo(t,:) / norm(v2_brazo(t,:)); %vector 2 normalizado (vector j)
    
    %eje k del brazo (k_s en cooper's paper)
    v3_brazo(t,:) = cross(j_brazo(t,:),j_anteb_EU(t,:));%vector 3, no normalizado
    k_brazo(t,:) = v3_brazo(t,:) / norm(v3_brazo(t,:)); %vector 3 normalizado (vector k)
    
    %eje i del brazo (i_s en cooper's paper)
    v4_brazo(t,:) = cross(j_brazo(t,:),k_brazo(t,:));%vector 4, no normalizado
    i_brazo(t,:) = v4_brazo(t,:) / norm(v4_brazo(t,:)); %vector 4 normalizado (vector i)
    
    % Matrices de rotacion para el antebrazo
    %BG_A: brazo global a anatomico
    rot_BG_A(:,:,t) = [i_brazo(t,:);j_brazo(t,:);k_brazo(t,:)];
    %    [iX iY iZ]  la matriz globales a anatomicas queda ya en formato adecbrazodo
    %    [jX jY jZ]
    %    [kX kY kZ]
    %BA_G: brazo anatomico a global
    rot_BA_G(:,:,t) = rot_BG_A(:,:,t)';
    %    [iX jX kX]  la matriz anatomicas a globales queda ya en formato adecbrazodo
    %    [iY jY kY]
    %    [iZ jZ kZ]

    % Calculo de los marcadores del antebrazo en coordenadas locales del brazo (_BL)
    cm_brazo_BL(t,:) = rot_BG_A(:,:,t) * CentrosMasa.cm_brazo(t,:)';
    acd_BL(t,:) = (rot_BG_A(:,:,t) * ((MarcadoresFinales.acd(t,:)') - (CentrosMasa.cm_brazo(t,:)')))';
    agd_BL(t,:) = (rot_BG_A(:,:,t) * ((MarcadoresFinales.agd(t,:)') - (CentrosMasa.cm_brazo(t,:)')))';

end

