function [rot_TG_A,rot_TA_G]=SRLTronco(frames, MarcadoresFinales);

n=1; %Lado derecho n=1; Lado izquierdo n=2
%----------TRONCO--------------
% Calculo del sistema local del tronco solo con c7 y los acromiones.
for t=1:frames
     % Eje k temporal, construido como el eje que une cld y cli
     % El eje k esta dirigido hacia la derecha
     k_tr_nn_temp(t,:) = (MarcadoresFinales.cld(t,:) - MarcadoresFinales.cli(t,:)); %Eje k no normalizado
     k_tr_temp(t,:) = k_tr_nn_temp(t,:) / norm(k_tr_nn_temp(t,:)); %Eje k normalizado
     
     % Eje j, construido como el prod. vectorial entre el eje k y el eje formado por c7-cli;
     eje_temp_nn(t,:) = MarcadoresFinales.c7(t,:)-MarcadoresFinales.cli(t,:); % Eje temporal c7-cli
     eje_temp(t,:) = eje_temp_nn(t,:) / norm(eje_temp_nn(t,:)); % Eje temporal normalizado
     j_tr_nn(t,:) = cross(eje_temp(t,:),k_tr_nn_temp(t,:)); %Eje j no normalizado
     j_tr(t,:) = j_tr_nn(t,:) / norm(j_tr_nn(t,:)); %Eje j normalizado
     
     % Eje i, perpendicular a j y k
     i_tr_nn(t,:) = cross(j_tr(t,:),k_tr_temp(t,:)); % Eje i (en principio ya esta normalizado)
     i_tr(t,:)=i_tr_nn(t,:) / norm(i_tr_nn(t,:)); % Eje i normalizado
   
     % Eje k definitivo, perpendicular a i y j
     k_tr_nn(t,:) = cross(i_tr(t,:),j_tr(t,:)); % Eje i (en principio ya esta normalizado)
     k_tr(t,:) = k_tr_nn(t,:) / norm(k_tr_nn(t,:)); % Eje i normalizado
   
     % Matrices de rotacion para el tronco
     % TG_A: Tronco global a anatomico
     rot_TG_A(:,:,t) = [i_tr(t,:);j_tr(t,:);k_tr(t,:)];
     %    [iX iY iZ]  la matriz globales a anatomicas queda ya en formato adecuado
     %    [jX jY jZ]
     %    [kX kY kZ]
     %TA_G: Tronco anatomico a global
     rot_TA_G(:,:,t) = rot_TG_A(:,:,t)';
     %    [iX jX kX]  la matriz anatomicas a globales queda ya en formato adecuado
     %    [iY jY kY]
     %    [iZ jZ kZ]
end