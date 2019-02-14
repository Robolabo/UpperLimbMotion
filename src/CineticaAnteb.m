function [gamma_A_grad, beta_A_grad, alfa_A_grad,phi_A,omega_A]=CineticaAnteb (frames, rot_AG_A,dt);

% Asumo una secuencia de rotacion x-y'-z''. Los angulos asociados a cada
% rotacion son alfa (eje x), beta (eje y)gamma (eje z) 
% Matriz para cambiar la velocidad angular de global a anatómico (sigo la
% misma convencion de Winters.
% Luego Rz'*Ry'*Rx' (Premultiplicación de las matrices de rotación de
% anatómico a global transpuestas)=
% [  C(b)*C(g) , C(a)*S(g)+S(a)*S(b)*C(g) , S(a)*S(g)-C(a)*S(b)*C(g)]
% [ -C(b)*S(g) , C(a)*C(g)-S(a)*S(b)*S(g) , C(a)*S(b)*S(g)+S(a)*C(g)]
% [       S(b) ,               -S(a)*C(b) ,                C(a)*C(b)]

for t=1:frames
    beta_A(t,1) = asin(rot_AG_A(3,1,t)); %Rotacion asociada al eje y del antebrazo

    sgamma_A(t,1) = rot_AG_A(2,1,t)/(-cos(beta_A(t))); %Seno de gamma
    cgamma_A(t,1) = rot_AG_A(1,1,t)/cos(beta_A(t)); %Coseno de gamma
    gamma_A(t,1) = atan2(sgamma_A(t),cgamma_A(t)); %Angulo gamma
        
    salfa_A(t,1) = rot_AG_A(3,2,t)/(-cos(beta_A(t))); %Seno de alfa
    calfa_A(t,1) = rot_AG_A(3,3,t)/cos(beta_A(t)); %Coseno de alfa
    alfa_A(t,1) = atan2(salfa_A(t),calfa_A(t)); %Angulo alfa
    
% Correccion de los angulos
    if alfa_A(t,1)<0 %Correccion por el cambio de 180 grados debido a la arctg
       alfa_A(t,1) = alfa_A(t,1)+(2*pi);
    end
    if gamma_A(t,1)<0 %Correccion por el cambio de 180 grados debido a la arctg
       gamma_A(t,1) = gamma_A(t,1)+(2*pi);
    end
    
% Calculo de la matriz que transformara al vector omega (velocidad
% angular del sistema local con respecto al global), al igual que la
% matriz de donde se obtienen.
% Se calcula con la segunda y tercera rotacion:

% Según convención de signos de Winters
    rot_omega_A(1,1,t) = cos(beta_A(t))*cos(gamma_A(t));
    rot_omega_A(1,2,t) = sin(gamma_A(t));
    rot_omega_A(1,3,t) = 0;
    rot_omega_A(2,1,t) = -cos(beta_A(t))*sin(gamma(t));
    rot_omega_A(2,2,t) = cos(gamma_A(t));
    rot_omega_A(2,3,t) = 0;
    rot_omega_A(3,1,t) = sin(beta_A(t));
    rot_omega_A(3,2,t) = 0;
    rot_omega_A(3,3,t) = 1;

end

%Calculo de las derivadas de los angulos (segun diferencias centradas)
for t=2:(frames-1)
    beta_A_D(t,1) = (beta_A(t+1)-beta_A(t-1))/(2*dt);
    gamma_A_D(t,1) = (gamma_A(t+1)-gamma_A(t-1))/(2*dt);
    alfa_A_D(t,1) = (alfa_A(t+1)-alfa_A(t-1))/(2*dt);
end
%Correccion de la primera y la ultima derivada
beta_A_D(1) = beta_A_D(2);
beta_A_D(frames) = beta_A_D(frames-1);
gamma_A_D(1) = gamma_A_D(2);
gamma_A_D(frames) = gamma_A_D(frames-1);
alfa_A_D(1) = alfa_A_D(2);
alfa_A_D(frames) = alfa_A_D(frames-1);
    
%Calculo de omega: vector velocidad angular
for t=1:frames
    % tetha_A: Vector columna que contiene las derivadas de los angulos de rotacion en globales
    tetha_A(1,t) = alfa_A_D(t);
    tetha_A(2,t) = beta_A_D(t);
    tetha_A(3,t) = gamma_A_D(t);
    %Transformo la velocidad angular en locales
    omega_A(:,t) = rot_omega_A(:,:,t)*tetha_A(:,t);
    %Almaceno en un vector columna
    omega1_A(t) = omega_A(1,t);
    omega2_A(t) = omega_A(2,t);
    omega3_A(t) = omega_A(3,t);
end

% Suavizo la velocidad angular y obtengo la aceleración angular
ancho_suav = 8;
for i=1:3
    x = omega_A(i,:)';
%    [xsuav,velsuav,asuav,psuav,corr] = suavizadooptimo(t,x,p);
    [xsuav,vsuav] = KernelSmoothing(x,ancho_suav);
    omega_A(i,:) = xsuav;
    phi_A(i,:) = vsuav;
end

for i=1:frames
    %Almaceno en un vector columna
    phi1_A(i) = phi_A(1,i);
    phi2_A(i) = phi_A(2,i);
    phi3_A(i) = phi_A(3,i);
end

% paso a grados los ángulos (solo para representación)
alfa_A_grad = alfa_A*180/pi;
beta_A_grad = beta_A*180/pi;
gamma_A_grad = gamma_A*180/pi;