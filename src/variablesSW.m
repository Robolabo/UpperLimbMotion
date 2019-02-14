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

%% C�LCULO DE LAS VARIABES CIN�TICAS EXTRA�BLES A PARTIR DEL SW
for i=1:frames
    vector_F(i,1) = MarcadoresFinales.agd(i,1)-MarcadoresFinales.mnd(i,1);
    vector_F(i,2) = MarcadoresFinales.agd(i,2)-MarcadoresFinales.mnd(i,2);
    angulo(i) = atan2(vector_F(i,2),vector_F(i,1));
end

% figure; plot(angulo*180/pi)
% hold on
% plot(step*3+80,'k')

%% C�lculo del TOP CENTER.
% Realizo la obtenci�n del top center para todos los ciclos del ensayo.
signo_angulo = sign(angulo-pi/2);
j = 1;
% plot(angulo,'o')
for k=1:size(cont_up,2)-1
    for i=cont_up(k):cont_up(k+1)
        if signo_angulo(i-1)>0 && signo_angulo(i)<0
            top_center(j) = i;
%             hold on;plot(i,angulo(i),'+')
            j = j+1;
            error(j) = angulo(i)-pi/2;
        end
    end
end
% max_error_ = max(error)*180/pi % M�ximo error en grados del criterio 
% para determinar el Top Center
% linea(1:frames) = pi/2;
% hold on; plot(linea,'r')

% C�lculo del FOLLOW THRU (Punto m�s alejado de la traza de la mano en el
% plano mediolateral hacia delante del plano mediolateral) y del ARM
% PREPARATION (Punto m�s alejado de la traza de la mano en el
% plano mediolateral hacia atr�s)
% Al estar ya calculado el �ngulo formado por el eje de la rueda y la mano,
% tomo el follow thru como el m�nimo de ese �ngulo y el Arm preparation el 
% m�ximo de ese �ngulo.

k = 1;
for i=1:size(top_center,2)-1
    [valor_fllw(k),follow(k)] = min(angulo(cont_up(i):cont_up(i+1)));
    follow(k) = follow(k)+cont_up(i);
    [valor_armr(k),armreturn(k)] = max(angulo(cont_up(i):cont_up(i+1)));
    armreturn(k) = armreturn(k)+cont_up(i);
    k=k+1;
end

k = 1;
for i=1:size(top_center,2)-1
    % C�lculo de los frames en los que ocurren HO, FT, AP, TC normalizados
    % para el ciclo (en porcentaje)
    if cont_up(1)<cont_down(1)
        TC(1,k) = top_center(i)- cont_up(i);
        TC(2,k) = 100*TC(1,k)/(cont_up(i+1)-cont_up(i));
        HO(1,k) = cont_down(i) - cont_up(i);
        HO(2,k) = 100*HO(1,k)/(cont_up(i+1)-cont_up(i));
        FT(1,k) = follow(i) - cont_up(i);
        FT(2,k) = 100*FT(1,k)/(cont_up(i+1)-cont_up(i));
        AP(1,k) = armreturn(i) - cont_up(i);
        AP(2,k) = 100*AP(1,k)/(cont_up(i+1)-cont_up(i));
        k = k+1;
    else
        TC(1,k) = top_center(i)- cont_up(i);
        TC(2,k) = 100*TC(1,k)/(cont_up(i+1)-cont_up(i));
        HO(1,k) = cont_down(i+1) - cont_up(i);
        HO(2,k) = 100*HO(1,k)/(cont_up(i+1)-cont_up(i));
        FT(1,k) = follow(i)- cont_up(i);
        FT(2,k) = 100*FT(1,k)/(cont_up(i+1)-cont_up(i));
        AP(1,k) = armreturn(i)- cont_up(i);
        AP(2,k) = 100*AP(1,k)/(cont_up(i+1)-cont_up(i));
        k = k+1;
    end
end
% ----------------------------------------------------------------------- %
% CALCULO DE LOS MOMENTOS NORMALIZADOS TC, HO, FT, AP
TC_medio = mean(TC(2,:));
TC_desviacion = std(TC(2,:),0);
HO_medio = mean(HO(2,:));
HO_desviacion = std(HO(2,:),0);
FT_medio = mean(FT(2,:));
FT_desviacion = std(FT(2,:),0);
AP_medio = mean(AP(2,:));
AP_desviacion = std(AP(2,:),0);
A=[TC_medio,HO_medio,FT_medio,AP_medio];

% ----------------------------------------------------------------------- %
% Cadencia de propulsi�n (strokes/seg)
stroke_med = size(cont_up,2)/tiempoSW(end);
% ----------------------------------------------------------------------- %
% Duraci�n de la fase de empuje y recuperaci�n (seg)
st_min = min(size(cont_up,2),size(cont_up,2));
for i=1:st_min-1
    if cont_up(1)>cont_down(1)
        t_empuje(i) = cont_down(i+1) - cont_up(i);
        t_rec(i) = cont_up(i) - cont_down(i);
    else
        t_empuje(i) = cont_down(i) - cont_up(i);
        t_rec(i) = cont_up(i+1) - cont_down(i);
    end
end
t_empuje_med = mean(t_empuje)/240;
t_empuje_sd = std(t_empuje,1)/240;

t_rec_med = mean(t_rec)/240;
t_rec_sd = std(t_rec,1)/240;
% ----------------------------------------------------------------------- %
% Duraci�n de la fase de empuje y recuperaci�n (seg): Angulos de contacto
% Calculo del encoder en cont�nuo
encoder_continuo(1) = 0;
for i=1:frames-1
    encoder_continuo(i+1) = encoder_continuo(i)+(encoder(i)-encoder(i+1));
    if encoder_continuo(i+1) < encoder_continuo(i)
        encoder_continuo(i+1)=encoder_continuo(i+1)+360;
    end
end


% Duraci�n en �ngulos
for i=1:st_min-1
    if cont_up(1)>cont_down(1)
        ang_empuje(i) = encoder_continuo(cont_down(i+1)) - encoder_continuo(cont_up(i));
        ang_rec(i) = encoder_continuo(cont_up(i)) - encoder_continuo(cont_down(i));
    else
        ang_empuje(i) = encoder_continuo(cont_down(i)) - encoder_continuo(cont_up(i));
        ang_rec(i) = encoder_continuo(cont_up(i+1)) - encoder_continuo(cont_down(i));
    end
    contact_angle(i) = angulo(cont_up(i));
    release_angle(i) = angulo(cont_down(i));
end
ang_empuje_med = mean(ang_empuje);
ang_empuje_sd = std(ang_empuje,1);

ang_rec_med = mean(ang_rec);
ang_rec_sd = std(ang_rec,1);

contact_angle_med = mean(contact_angle)*180/pi;
contact_angle_sd = std(contact_angle,1)*180/pi;
release_angle_med = mean(release_angle)*180/pi;
release_angle_sd = std(release_angle,1)*180/pi;
% ----------------------------------------------------------------------- %
% Velocidad de propulsi�n (m/seg)
diametroSW_pulg = 24;
desarrolloSW = (diametroSW_pulg*0.0254)*pi;
for i=2:frames-1
    % Velocidad angular de la rueda (grados/seg)
    omega_SW(i) = (encoder_continuo(i+1)-encoder_continuo(i-1))/(2*dt);
end
omega_SW(1) = omega_SW(2);
omega_SW(frames) = omega_SW(frames-1);

vel_prop_grad_med = mean(omega_SW);
vel_prop_grad_sd = std(omega_SW,1);
vel_prop_med = vel_prop_grad_med*(1/360)*desarrolloSW;
vel_prop_sd = vel_prop_grad_sd*(1/360)*desarrolloSW;
% ----------------------------------------------------------------------- %
% Calculo de Ft en todo el ciclo

r=.257; %10 pulgadas =.257 metros
Ft=FSW(:,6)./r;

Ft_max = max(Ft);
Ft_min = min(Ft);
Ftot_max = max(FSW(:,7));
Ftot_min = min(FSW(:,7));
% ----------------------------------------------------------------------- %
% Calculo de la tasa de elevaci�n del vector fuerza total
for i=2:frames-1
    tasa_F(i) = (FSW(i+1,7)-FSW(i-1,7))/(2*dt);
end
tasa_F(1) = tasa_F(2);tasa_F(frames) = tasa_F(frames-1);
tasa_F_max = max(tasa_F);

% C�lculo de las fuerzas y momentos m�ximos
Fx_max = max(FSW(:,1));
Fy_max = max(FSW(:,2));
Fz_max = max(FSW(:,3));

Mx_max = max(FSW(:,4));
My_max = max(FSW(:,5));
Mp_max = max(FSW(:,6));
Mp_min = min(FSW(:,1));

% Calculo de la tasa de elevaci�n del momento propulsor
for i=2:frames-1
    tasa_M(i) = (FSW(i+1,6)-FSW(i-1,6))/(2*dt);
end
tasa_M(1) = tasa_M(2);tasa_M(frames) = tasa_M(frames-1);
tasa_M_max = max(tasa_M);
