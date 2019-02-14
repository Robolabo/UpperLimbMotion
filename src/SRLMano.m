function [rot_MG_A,rot_MA_G,mnd_ML,amd_ML]= SRLMano(frames,MarcadoresFinales,CentrosMasa)

n=1; %Lado derecho n=1; Lado izquierdo n=2
%----------MANO---------
    %Calculo del sistema local, segun ISB.
for t=1:frames %Lado derecho
    %Eje k temporal de mano (usado para calcular i)
    %el vector apunta hacia la derecha en ambos lados en posici�n anat�mica
    v1_mano(t,:) = MarcadoresFinales.rld(t,:) - MarcadoresFinales.uld(t,:); %vector 1, no normalizado
    k_mano_temp(t,:) = v1_mano(t,:) / norm(v1_mano(t,:)); %vector 1 normalizado (vector k temporal)
    
    %Eje j de la mano
    v2_mano(t,:) = MarcadoresFinales.amd(t,:) - MarcadoresFinales.mnd(t,:); %vector 2, no normalizado
    j_mano(t,:) = v2_mano(t,:) / norm(v2_mano(t,:)); %vector 2 normalizado (vector j)

    %Eje i de la mano
    v3_mano(t,:) = cross(j_mano(t,:),k_mano_temp(t,:));%vector 3, no normalizado
    i_mano(t,:) = v3_mano(t,:) / norm(v3_mano(t,:)); %vector 3 normalizado (vector i)

    %Eje k de la mano
    v4_mano(t,:) = cross(i_mano(t,:),j_mano(t,:));%vector 4, no normalizado
    k_mano(t,:) = v4_mano(t,:) / norm(v4_mano(t,:)); %vectro 4 normalizado (vector i)

    %matriz de rotaci�n de la mano
    %MG_A: mano global a anatomico
    rot_MG_A(:,:,t) = [i_mano(t,:);j_mano(t,:);k_mano(t,:)];
    %    [iX iY iZ]  la matriz globales a anatomicas queda ya en formato adecuado
    %    [jX jY jZ]
    %    [kX kY kZ]
    %MA_G: mano anatomico a global
    rot_MA_G(:,:,t) = rot_MG_A(:,:,t)';
    %    [iX jX kX]  la matriz anatomicas a globales queda ya en formato adecuado
    %    [iY jY kY]
    %    [iZ jZ kZ]

    % Calculo de los marcadores de la mano en coordenadas locales de la mano (_ML)
    cm_mano_ML(t,:) = rot_MG_A(:,:,t) * CentrosMasa.cm_mano(t,:)';
    mnd_ML(t,:) = (rot_MG_A(:,:,t) * ((MarcadoresFinales.mnd(t,:)') - (CentrosMasa.cm_mano(t,:)')))';
    amd_ML(t,:) = (rot_MG_A(:,:,t) * ((MarcadoresFinales.amd(t,:)') - (CentrosMasa.cm_mano(t,:)')))';
end