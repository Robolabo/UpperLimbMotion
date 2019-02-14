function [gamma_M_grad, beta_M_grad, alfa_M_grad,phi_M]=CineticaMano(frames,rot_MG_A,dt);

% Asumo una secuencia de rotacion x-y'-z''. Los angulos asociados a cada
% rotacion son alfa (eje x), beta (eje y) gamma (eje z) 
% Matriz para cambiar la velocidad angular de global a anatómico (sigo la
% misma convencion de Winters)
% Luego Rz'*Ry'*Rx' (Premultiplicación de las matrices de rotación de
% anatómico a global transpuestas)=
% [  C(b)*C(g) , C(a)*S(g)+S(a)*S(b)*C(g) , S(a)*S(g)-C(a)*S(b)*C(g)]
% [ -C(b)*S(g) , C(a)*C(g)-S(a)*S(b)*S(g) , C(a)*S(b)*S(g)+S(a)*C(g)]
% [       S(b) ,               -S(a)*C(b) ,                C(a)*C(b)]
 
for t=1:frames
    beta_M(t,1) = asin(rot_MG_A(3,1,t)); %Rotacion asociada al eje y de la mano

    sgamma_M(t,1) = rot_MG_A(2,1,t)/(-cos(beta_M(t))); %Seno de gamma
    cgamma_M(t,1) = rot_MG_A(1,1,t)/cos(beta_M(t)); %Coseno de gamma
    gamma_M(t,1) = atan2(sgamma_M(t),cgamma_M(t)); %Angulo gamma
        
    salfa_M(t,1) = rot_MG_A(3,2,t)/(-cos(beta_M(t))); %Seno de alfa
    calfa_M(t,1) = rot_MG_A(3,3,t)/cos(beta_M(t)); %Coseno de alfa
    alfa_M(t,1) = atan2(salfa_M(t),calfa_M(t)); %Angulo alfa
    
% %     Correccion de los angulos
    if alfa_M(t,1)>0 %Correccion por el cambio de 180 grados debido a la arctg
       alfa_M(t,1) = alfa_M(t,1)-(2*pi);
    end
    if gamma_M(t,1)<0 %Correccion por el cambio de 180 grados debido a la arctg
       gamma_M(t,1) = gamma_M(t,1)+(2*pi);
    end
    
% Calculo de la matriz que transformara al vector omega (velocidad
% angular del sistema local con respecto al global), al igual que la
% matriz de donde se obtienen.
% Se calcula con la segunda y tercera rotacion:

% Según convención de signos de Winters
    rot_omega_M(1,1,t) = cos(beta_M(t))*cos(gamma_M(t));
    rot_omega_M(1,2,t) = sin(gamma_M(t));
    rot_omega_M(1,3,t) = 0;
    rot_omega_M(2,1,t) = -cos(beta_M(t))*sin(gamma(t));
    rot_omega_M(2,2,t) = cos(gamma_M(t));
    rot_omega_M(2,3,t) = 0;
    rot_omega_M(3,1,t) = sin(beta_M(t));
    rot_omega_M(3,2,t) = 0;
    rot_omega_M(3,3,t) = 1;

end

% Calculo de las derivadas de los angulos (segun diferencias centradas)
for t=2:(frames-1)
    beta_M_D(t,1) = (beta_M(t+1)-beta_M(t-1))/(2*dt);
    gamma_M_D(t,1) = (gamma_M(t+1)-gamma_M(t-1))/(2*dt);
    alfa_M_D(t,1) = (alfa_M(t+1)-alfa_M(t-1))/(2*dt);
end
% Correccion de la primera y la ultima derivada
beta_M_D(1) = beta_M_D(2);
beta_M_D(frames) = beta_M_D(frames-1);
gamma_M_D(1) = gamma_M_D(2);
gamma_M_D(frames) = gamma_M_D(frames-1);
alfa_M_D(1) = alfa_M_D(2);
alfa_M_D(frames) = alfa_M_D(frames-1);
    
% Calculo de omega: vector velocidad angular
for t=1:frames
%     tetha_M: Vector columna que contiene las derivadas de los angulos de
%     rotación en globales
    tetha_M(1,t) = alfa_M_D(t);
    tetha_M(2,t) = beta_M_D(t);
    tetha_M(3,t) = gamma_M_D(t);
%     Transformo la velocidad angular en locales
    omega_M(:,t) = rot_omega_M(:,:,t)*tetha_M(:,t);
%     Almaceno en un vector columna
    omega1_M(t) = omega_M(1,t);
    omega2_M(t) = omega_M(2,t);
    omega3_M(t) = omega_M(3,t);
end

% Suavizo la velocidad angular y obtengo la aceleraci�n angular
ancho_suav = 8;
for i=1:3
    x = omega_M(i,:)';
%    [xsuav,velsuav,asuav,psuav,corr] = suavizadooptimo(t,x,p);
    [xsuav,vsuav] = KernelSmoothing(x,ancho_suav);
    omega_M(i,:) = xsuav;
    phi_M(i,:) = vsuav;
end

% Almaceno en un vector columna
for i=1:frames
    phi1_M(i) = phi_M(1,i);
    phi2_M(i) = phi_M(2,i);
    phi3_M(i) = phi_M(3,i);
end

% paso a grados los ángulos (solo para representaciòn)
alfa_M_grad = alfa_M*180/pi;
beta_M_grad = beta_M*180/pi;
gamma_M_grad = gamma_M*180/pi;
