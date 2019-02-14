function [rot_AG_A,rot_AA_G,j_anteb_EU, amd_AL, acd_AL]=SRLAnteb (frames,MarcadoresFinales,CentrosMasa);

n=1; %Lado derecho n=1; Lado izquierdo n=2
%----------ANTEBRAZO---------
%Calculo del sistema local, segun ISB.
for t=1:frames
    v1_anteb_EU(t,:) = MarcadoresFinales.rld(t,:) - MarcadoresFinales.uld(t,:); %vector 1, no normalizado
    k_anteb_EU_temp(t,:) = v1_anteb_EU(t,:) / norm(v1_anteb_EU(t,:)); %vector 1 normalizado (vector temporal k)

    %eje j del antebrazo
    v2_anteb_EU(t,:) = MarcadoresFinales.acd(t,:) - MarcadoresFinales.uld(t,:); %vector 2, no normalizado
    j_anteb_EU(t,:) = v2_anteb_EU(t,:) / norm(v2_anteb_EU(t,:)); %vector 2 normalizado (vector j)

    %eje i del antebrazo
    v3_anteb_EU(t,:) = cross(j_anteb_EU(t,:),k_anteb_EU_temp(t,:));%vector 3, no normalizado
    i_anteb_EU(t,:) = v3_anteb_EU(t,:) / norm(v3_anteb_EU(t,:)); %vector 3 normalizado (vector i)

    %eje k del antebrazo
    v4_anteb_EU(t,:) = cross(i_anteb_EU(t,:),j_anteb_EU(t,:));%vector 4, no normalizado
    k_anteb_EU(t,:) = v4_anteb_EU(t,:) / norm(v4_anteb_EU(t,:)); %%vector 4 normalizado (vector k)

    % Matrices de rotacion para el antebrazo SOLO PARA REPRESENTACION CINEMATICA
    %AG_A: antebrazo global a anatomico
    rot_AG_A(:,:,t) = [i_anteb_EU(t,:);j_anteb_EU(t,:);k_anteb_EU(t,:)];
    %    [iX iY iZ]  la matriz globales a anatomicas queda ya en formato adecuado
    %    [jX jY jZ]
    %    [kX kY kZ]
    %AA_G: antebrazo anatomico a global
    rot_AA_G(:,:,t) = rot_AG_A(:,:,t)';
    %    [iX jX kX]  la matriz anatomicas a globales queda ya en formato adecuado
    %    [iY jY kY]
    %    [iZ jZ kZ]

    % Calculo de los marcadores del antebrazo en coordenadas locales del antebrazo (_AL)
    cm_anteb_AL(t,:) = rot_AG_A(:,:,t) * CentrosMasa.cm_anteb(t,:)';
    acd_AL(t,:) = (rot_AG_A(:,:,t) * ((MarcadoresFinales.acd(t,:)') - (CentrosMasa.cm_anteb(t,:)')))';
    amd_AL(t,:) = (rot_AG_A(:,:,t) * ((MarcadoresFinales.amd(t,:)') - (CentrosMasa.cm_anteb(t,:)')))';
end