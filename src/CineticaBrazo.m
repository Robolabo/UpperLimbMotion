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
function [gamma_B_grad, beta_B_grad, alfa_B_grad,phi_B,omega_B]=CineticaBrazo(frames, rot_BG_A, dt);
% %----------BRAZO---------
% % Asumo una secuencia de rotacion x-y'-z''. Los angulos asociados a cada
% % rotacion son alfa (eje x), beta (eje y) gamma (eje z) 
% % Matriz para cambiar la velocidad angular de global a anatómico (sigo la
% % misma convencion de Winters.
% % Luego Rz'*Ry'*Rx' (Premultiplicación de las matrices de rotación de
% % anatómico a global transpuestas):
% % [  C(b)*C(g) , C(a)*S(g)+S(a)*S(b)*C(g) , S(a)*S(g)-C(a)*S(b)*C(g)]
% % [ -C(b)*S(g) , C(a)*C(g)-S(a)*S(b)*S(g) , C(a)*S(b)*S(g)+S(a)*C(g)]
% % [       S(b) ,               -S(a)*C(b) ,                C(a)*C(b)]
% 

for t=1:frames
    beta_B(t,1) = asin(rot_BG_A(3,1,t)); %Rotacion asociada al eje y del brazo
    
    sgamma_B(t,1) = rot_BG_A(2,1,t)/(-cos(beta_B(t))); %Seno de gamma
    cgamma_B(t,1) = rot_BG_A(1,1,t)/cos(beta_B(t)); %Coseno de gamma
    gamma_B(t,1) = atan2(sgamma_B(t),cgamma_B(t)); %Angulo gamma
        
    salfa_B(t,1) = rot_BG_A(3,2,t)/(-cos(beta_B(t))); %Seno de alfa
    calfa_B(t,1) = rot_BG_A(3,3,t)/cos(beta_B(t)); %Coseno de alfa
    alfa_B(t,1) = atan2(salfa_B(t),calfa_B(t)); %Angulo alfa
    

% Según convención de signos de Winters
    rot_omega_B(1,1,t) = cos(beta_B(t))*cos(gamma_B(t));
    rot_omega_B(1,2,t) = sin(gamma_B(t));
    rot_omega_B(1,3,t) = 0;
    rot_omega_B(2,1,t) = -cos(beta_B(t))*sin(gamma(t));
    rot_omega_B(2,2,t) = cos(gamma_B(t));
    rot_omega_B(2,3,t) = 0;
    rot_omega_B(3,1,t) = sin(beta_B(t));
    rot_omega_B(3,2,t) = 0;
    rot_omega_B(3,3,t) = 1;

end

%Calculo de las derivadas de los angulos (segun diferencias centradas)
for t=2:(frames-1)
    beta_B_D(t,1) = (beta_B(t+1)-beta_B(t-1))/(2*dt);
    gamma_B_D(t,1) = (gamma_B(t+1)-gamma_B(t-1))/(2*dt);
    alfa_B_D(t,1) = (alfa_B(t+1)-alfa_B(t-1))/(2*dt);
end
%Correccion de la primera y la ultima derivada
beta_B_D(1) = beta_B_D(2);
beta_B_D(frames) = beta_B_D(frames-1);
gamma_B_D(1) = gamma_B_D(2);
gamma_B_D(frames) = gamma_B_D(frames-1);
alfa_B_D(1) = alfa_B_D(2);
alfa_B_D(frames) = alfa_B_D(frames-1);
    
%Calculo de omega: vector velocidad angular
for t=1:frames
    % tetha_B: Vector columna que contiene las derivadas de los angulos de rotacion en globales
    tetha_B(1,t) = alfa_B_D(t);
    tetha_B(2,t) = beta_B_D(t);
    tetha_B(3,t) = gamma_B_D(t);
    %Transformo la velocidad angular en locales
    omega_B(:,t) = rot_omega_B(:,:,t)*tetha_B(:,t);
    %Almaceno en un vector columna
    omega1_B(t) = omega_B(1,t);
    omega2_B(t) = omega_B(2,t);
    omega3_B(t) = omega_B(3,t);
end

% Suavizo la velocidad angular y obtengo la aceleración angular
ancho_suav = 8;
for i=1:3
    x = omega_B(i,:)';
%    [xsuav,velsuav,asuav,psuav,corr] = suavizadooptimo(t,x,p);
    [xsuav,vsuav] = KernelSmoothing(x,ancho_suav);
    omega_B(i,:) = xsuav;
    phi_B(i,:) = vsuav;
end


for i=1:frames
    %Almaceno en un vector columna
    phi1_B(i) = phi_B(1,i);
    phi2_B(i) = phi_B(2,i);
    phi3_B(i) = phi_B(3,i);
end

% paso a grados los ángulos (solo para representación)
alfa_B_grad = alfa_B*180/pi;
beta_B_grad = beta_B*180/pi;
gamma_B_grad = gamma_B*180/pi;
