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

% OBTENCIÓN DE LOS PARÁMETROS CARACTERÍSTICOS DE LA PROPULSIÓN EN LOS
% SIGUIENTES INSTANTES:
% TOP CENTER
% HANDS OFF
% HANDS CONTACT
% FOLOW THRU (FINAL)
% ARM PREPARATION (INICIO)
% ----------------------------------------------------------------------- %

for i=1:size(top_center,2)-1
% ----------------------------------------------------------------------- %
    % Obtención de todas las variables en el instante TOP CENTER.
    % MUÑECA
    %  Angulos
    muneca_top_center.alfa(i) = alfa_rwr(top_center(i));
    muneca_top_center.beta(i) = beta_rwr(top_center(i));
    muneca_top_center.gamma(i) = gamma_rwr(top_center(i));
    %  Fuerzas
    muneca_top_center.f_muneca_x(i) = f_muneca(1,top_center(i));
    muneca_top_center.f_muneca_y(i) = f_muneca(2,top_center(i));
    muneca_top_center.f_muneca_z(i) = f_muneca(3,top_center(i));
    %  Momentos
    muneca_top_center.m_muneca_x(i) = m_muneca(1,top_center(i));
    muneca_top_center.m_muneca_y(i) = m_muneca(2,top_center(i));
    muneca_top_center.m_muneca_z(i) = m_muneca(3,top_center(i));
    
    % CODO
    % Angulos
    codo_top_center.alfa(i) = alfa_relb(top_center(i));
    codo_top_center.beta(i) = beta_relb(top_center(i));
    codo_top_center.gamma(i) = gamma_relb(top_center(i));
    %  Fuerzas
    codo_top_center.f_codo_x(i) = f_codo(1,top_center(i));
    codo_top_center.f_codo_y(i) = f_codo(2,top_center(i));
    codo_top_center.f_codo_z(i) = f_codo(3,top_center(i));
    %  Momentos
    codo_top_center.m_codo_x(i) = m_codo(1,top_center(i));
    codo_top_center.m_codo_y(i) = m_codo(2,top_center(i));
    codo_top_center.m_codo_z(i) = m_codo(3,top_center(i));
    
    % HOMBRO
    % Angulos
    hombro_top_center.alfa(i) = alfa_rsho(top_center(i));
    hombro_top_center.beta(i) = beta_rsho(top_center(i));
    hombro_top_center.gamma(i) = gamma_rsho(top_center(i));
    %  Fuerzas
    hombro_top_center.f_hombro_x(i) = f_hombro(1,top_center(i));
    hombro_top_center.f_hombro_y(i) = f_hombro(2,top_center(i));
    hombro_top_center.f_hombro_z(i) = f_hombro(3,top_center(i));
    %  Momentos
    hombro_top_center.m_hombro_x(i) = m_hombro(1,top_center(i));
    hombro_top_center.m_hombro_y(i) = m_hombro(2,top_center(i));
    hombro_top_center.m_hombro_z(i) = m_hombro(3,top_center(i));
    
% ----------------------------------------------------------------------- %
    % Cálculo del HANDS OFF.
    % Hands off está calculado en la variable cont_down
    % Obtención de todas las variables en el instante HANDS OFF.     
    
    % MUÑECA
    % Angulos
    muneca_hands_off.alfa(i) = alfa_rwr(cont_down(i));
    muneca_hands_off.beta(i) = beta_rwr(cont_down(i));
    muneca_hands_off.gamma(i) = gamma_rwr(cont_down(i));
    
    %  Fuerzas
    muneca_hands_off.f_muneca_x(i) = f_muneca(1,cont_down(i));
    muneca_hands_off.f_muneca_y(i) = f_muneca(2,cont_down(i));
    muneca_hands_off.f_muneca_z(i) = f_muneca(3,cont_down(i));
    %  Momentos
    muneca_hands_off.m_muneca_x(i) = m_muneca(1,cont_down(i));
    muneca_hands_off.m_muneca_y(i) = m_muneca(2,cont_down(i));
    muneca_hands_off.m_muneca_z(i) = m_muneca(3,cont_down(i));
    
    % CODO
    % Angulos
    codo_hands_off.alfa(i) = alfa_relb(cont_down(i));
    codo_hands_off.beta(i) = beta_relb(cont_down(i));
    codo_hands_off.gamma(i) = gamma_relb(cont_down(i));
    %  Fuerzas
    codo_hands_off.f_codo_x(i) = f_codo(1,cont_down(i));
    codo_hands_off.f_codo_y(i) = f_codo(2,cont_down(i));
    codo_hands_off.f_codo_z(i) = f_codo(3,cont_down(i));
    %  Momentos
    codo_hands_off.m_codo_x(i) = m_codo(1,cont_down(i));
    codo_hands_off.m_codo_y(i) = m_codo(2,cont_down(i));
    codo_hands_off.m_codo_z(i) = m_codo(3,cont_down(i));
    
    % HOMBRO
    % Angulos
    hombro_hands_off.alfa(i) = alfa_rsho(cont_down(i));
    hombro_hands_off.beta(i) = beta_rsho(cont_down(i));
    hombro_hands_off.gamma(i) = gamma_rsho(cont_down(i));
    %  Fuerzas
    hombro_hands_off.f_hombro_x(i) = f_hombro(1,cont_down(i));
    hombro_hands_off.f_hombro_y(i) = f_hombro(2,cont_down(i));
    hombro_hands_off.f_hombro_z(i) = f_hombro(3,cont_down(i));
    %  Momentos
    hombro_hands_off.m_hombro_x(i) = m_hombro(1,cont_down(i));
    hombro_hands_off.m_hombro_y(i) = m_hombro(2,cont_down(i));
    hombro_hands_off.m_hombro_z(i) = m_hombro(3,cont_down(i));
    
% ----------------------------------------------------------------------- %
    % Cálculo del HANDS CONTACT
    % Hand contact está calculado en la variable cont_up
    % Obtención de todas las variables en el instante HANDS CONTACT. 
    % MUÑECA
    % Angulos
    muneca_hands_contact.alfa(i) = alfa_rwr(cont_up(i));
    muneca_hands_contact.beta(i) = beta_rwr(cont_up(i));
    muneca_hands_contact.gamma(i) = gamma_rwr(cont_up(i));
    %  Fuerzas
    muneca_hands_contact.f_muneca_x(i) = f_muneca(1,cont_up(i));
    muneca_hands_contact.f_muneca_y(i) = f_muneca(2,cont_up(i));
    muneca_hands_contact.f_muneca_z(i) = f_muneca(3,cont_up(i));
    %  Momentos
    muneca_hands_contact.m_muneca_x(i) = m_muneca(1,cont_up(i));
    muneca_hands_contact.m_muneca_y(i) = m_muneca(2,cont_up(i));
    muneca_hands_contact.m_muneca_z(i) = m_muneca(3,cont_up(i));
    
    % CODO
    % Angulos
    codo_hands_contact.alfa(i) = alfa_relb(cont_up(i));
    codo_hands_contact.beta(i) = beta_relb(cont_up(i));
    codo_hands_contact.gamma(i) = gamma_relb(cont_up(i));
    %  Fuerzas
    codo_hands_contact.f_codo_x(i) = f_codo(1,cont_up(i));
    codo_hands_contact.f_codo_y(i) = f_codo(2,cont_up(i));
    codo_hands_contact.f_codo_z(i) = f_codo(3,cont_up(i));
    %  Momentos
    codo_hands_contact.m_codo_x(i) = m_codo(1,cont_up(i));
    codo_hands_contact.m_codo_y(i) = m_codo(2,cont_up(i));
    codo_hands_contact.m_codo_z(i) = m_codo(3,cont_up(i));
    
    % HOMBRO
    % Angulos
    hombro_hands_contact.alfa(i) = alfa_rsho(cont_up(i));
    hombro_hands_contact.beta(i) = beta_rsho(cont_up(i));
    hombro_hands_contact.gamma(i) = gamma_rsho(cont_up(i));
    %  Fuerzas
    hombro_hands_contact.f_hombro_x(i) = f_hombro(1,cont_up(i));
    hombro_hands_contact.f_hombro_y(i) = f_hombro(2,cont_up(i));
    hombro_hands_contact.f_hombro_z(i) = f_hombro(3,cont_up(i));
    %  Momentos
    hombro_hands_contact.m_hombro_x(i) = m_hombro(1,cont_up(i));
    hombro_hands_contact.m_hombro_y(i) = m_hombro(2,cont_up(i));
    hombro_hands_contact.m_hombro_z(i) = m_hombro(3,cont_up(i));

% ----------------------------------------------------------------------- %
    % Obtención de todas las variables en el instante FOLLOW THRU.
    % MUÑECA
    % Angulos
    muneca_follow_thru.alfa(i) = alfa_rwr(follow(i));
    muneca_follow_thru.beta(i) = beta_rwr(follow(i));
    muneca_follow_thru.gamma(i) = gamma_rwr(follow(i));
    %  Fuerzas
    muneca_follow_thru.f_muneca_x(i) = f_muneca(1,follow(i));
    muneca_follow_thru.f_muneca_y(i) = f_muneca(2,follow(i));
    muneca_follow_thru.f_muneca_z(i) = f_muneca(3,follow(i));

    %  Momentos
    muneca_follow_thru.m_muneca_x(i) = m_muneca(1,follow(i));
    muneca_follow_thru.m_muneca_y(i) = m_muneca(2,follow(i));
    muneca_follow_thru.m_muneca_z(i) = m_muneca(3,follow(i));
    
    % CODO
    % Angulos
    codo_follow_thru.alfa(i) = alfa_relb(follow(i));
    codo_follow_thru.beta(i) = beta_relb(follow(i));
    codo_follow_thru.gamma(i) = gamma_relb(follow(i));
    %  Fuerzas
    codo_follow_thru.f_codo_x(i) = f_codo(1,follow(i));
    codo_follow_thru.f_codo_y(i) = f_codo(2,follow(i));
    codo_follow_thru.f_codo_z(i) = f_codo(3,follow(i));

    %  Momentos
    codo_follow_thru.m_codo_x(i) = m_codo(1,follow(i));
    codo_follow_thru.m_codo_y(i) = m_codo(2,follow(i));
    codo_follow_thru.m_codo_z(i) = m_codo(3,follow(i));

    % HOMBRO
    % Angulos
    hombro_follow_thru.alfa(i) = alfa_rsho(follow(i));
    hombro_follow_thru.beta(i) = beta_rsho(follow(i));
    hombro_follow_thru.gamma(i) = gamma_rsho(follow(i));
    %  Fuerzas
    hombro_follow_thru.f_hombro_x(i) = f_hombro(1,follow(i));
    hombro_follow_thru.f_hombro_y(i) = f_hombro(2,follow(i));
    hombro_follow_thru.f_hombro_z(i) = f_hombro(3,follow(i));

    %  Momentos
    hombro_follow_thru.m_hombro_x(i) = m_hombro(1,follow(i));
    hombro_follow_thru.m_hombro_y(i) = m_hombro(2,follow(i));
    hombro_follow_thru.m_hombro_z(i) = m_hombro(3,follow(i));

% ----------------------------------------------------------------------- %
    % Obtención de todas las variables en el instante ARM RETURN.
    % MUÑECA
    % Angulos
    muneca_arm_return.alfa(i) = alfa_rwr(armreturn(i));
    muneca_arm_return.beta(i) = beta_rwr(armreturn(i));
    muneca_arm_return.gamma(i) = gamma_rwr(armreturn(i));
    %  Fuerzas
    muneca_arm_return.f_muneca_x(i) = f_muneca(1,armreturn(i));
    muneca_arm_return.f_muneca_y(i) = f_muneca(2,armreturn(i));
    muneca_arm_return.f_muneca_z(i) = f_muneca(3,armreturn(i));

    %  Momentos
    muneca_arm_return.m_muneca_x(i) = m_muneca(1,armreturn(i));
    muneca_arm_return.m_muneca_y(i) = m_muneca(2,armreturn(i));
    muneca_arm_return.m_muneca_z(i) = m_muneca(3,armreturn(i));
    
    % CODO
    % Angulos
    codo_arm_return.alfa(i) = alfa_relb(armreturn(i));
    codo_arm_return.beta(i) = beta_relb(armreturn(i));
    codo_arm_return.gamma(i) = gamma_relb(armreturn(i));
    %  Fuerzas
    codo_arm_return.f_codo_x(i) = f_codo(1,armreturn(i));
    codo_arm_return.f_codo_y(i) = f_codo(2,armreturn(i));
    codo_arm_return.f_codo_z(i) = f_codo(3,armreturn(i));

    %  Momentos
    codo_arm_return.m_codo_x(i) = m_codo(1,armreturn(i));
    codo_arm_return.m_codo_y(i) = m_codo(2,armreturn(i));
    codo_arm_return.m_codo_z(i) = m_codo(3,armreturn(i));

    % HOMBRO
    % Angulos
    hombro_arm_return.alfa(i) = alfa_rsho(armreturn(i));
    hombro_arm_return.beta(i) = beta_rsho(armreturn(i));
    hombro_arm_return.gamma(i) =gamma_rsho(armreturn(i));
    %  Fuerzas
    hombro_arm_return.f_hombro_x(i) = f_hombro(1,armreturn(i));
    hombro_arm_return.f_hombro_y(i) = f_hombro(2,armreturn(i));
    hombro_arm_return.f_hombro_z(i) = f_hombro(3,armreturn(i));

    %  Momentos
    hombro_arm_return.m_hombro_x(i) = m_hombro(1,armreturn(i));
    hombro_arm_return.m_hombro_y(i) = m_hombro(2,armreturn(i));
    hombro_arm_return.m_hombro_z(i) = m_hombro(3,armreturn(i));
end

%% REORDENACIÓN DE LA DEFINICIÓN DE LOS ÁNGULOS
muneca_hands_contact.desv_rad = -muneca_hands_contact.alfa;
muneca_hands_contact.flexion = muneca_hands_contact.gamma;
% rmfield(muneca_hands_contact,{'alfa','beta','gamma'}); % Borra los campos
% alfa, beta y gamma del cellArray
codo_hands_contact.pronacion = codo_hands_contact.beta;
codo_hands_contact.flexion = codo_hands_contact.gamma;
% rmfield(codo_hands_contact,{'alfa','beta','gamma'}); % Borra los campos
% alfa, beta y gamma del cellArray
hombro_hands_contact.abduccion = -hombro_hands_contact.alfa;
hombro_hands_contact.rot_int = hombro_hands_contact.gamma;
hombro_hands_contact.plano_elev = hombro_hands_contact.beta;
% rmfield(hombro_hands_contact,{'alfa','beta','gamma'}); % Borra los campos
% alfa, beta y gamma del cellArray

muneca_top_center.desv_rad = -muneca_top_center.alfa;
muneca_top_center.flexion = muneca_top_center.gamma;
% rmfield(muneca_top_center,{'alfa','beta','gamma'}); % Borra los campos
% alfa, beta y gamma del cellArray
codo_top_center.pronacion = codo_top_center.beta;
codo_top_center.flexion = codo_top_center.gamma;
% rmfield(codo_top_center,{'alfa','beta','gamma'}); % Borra los campos
% alfa, beta y gamma del cellArray
hombro_top_center.abduccion = -hombro_top_center.alfa;
hombro_top_center.rot_int = hombro_top_center.gamma;
hombro_top_center.plano_elev = hombro_top_center.beta;
% rmfield(hombro_top_center,{'alfa','beta','gamma'}); % Borra los campos
% alfa, beta y gamma del cellArray

muneca_hands_off.desv_rad = -muneca_hands_off.alfa;
muneca_hands_off.flexion = muneca_hands_off.gamma;
% rmfield(muneca_hands_off,{'alfa','beta','gamma'}); % Borra los campos
% alfa, beta y gamma del cellArray
codo_hands_off.pronacion = codo_hands_off.beta;
codo_hands_off.flexion = codo_hands_off.gamma;
% rmfield(codo_hands_off,{'alfa','beta','gamma'}); % Borra los campos
% alfa, beta y gamma del cellArray
hombro_hands_off.abduccion = -hombro_hands_off.alfa;
hombro_hands_off.rot_int = hombro_hands_off.gamma;
hombro_hands_off.plano_elev = hombro_hands_off.beta;
% rmfield(hombro_hands_off,{'alfa','beta','gamma'}); % Borra los campos
% alfa, beta y gamma del cellArray

muneca_follow_thru.desv_rad = -muneca_follow_thru.alfa;
muneca_follow_thru.flexion = muneca_follow_thru.gamma;
% rmfield(muneca_follow_thru,{'alfa','beta','gamma'}); % Borra los campos
% alfa, beta y gamma del cellArray
codo_follow_thru.pronacion = codo_follow_thru.beta;
codo_follow_thru.flexion = codo_follow_thru.gamma;
% rmfield(codo_follow_thru,{'alfa','beta','gamma'}); % Borra los campos
% alfa, beta y gamma del cellArray
hombro_follow_thru.abduccion = -hombro_follow_thru.alfa;
hombro_follow_thru.rot_int = hombro_follow_thru.gamma;
hombro_follow_thru.plano_elev = hombro_follow_thru.beta;
% rmfield(hombro_follow_thru,{'alfa','beta','gamma'}); % Borra los campos
% alfa, beta y gamma del cellArray

muneca_arm_return.desv_rad = -muneca_arm_return.alfa;
muneca_arm_return.flexion = muneca_arm_return.gamma;
% rmfield(muneca_arm_return,{'alfa','beta','gamma'}); % Borra los campos
% alfa, beta y gamma del cellArray
codo_arm_return.pronacion = codo_arm_return.beta;
codo_arm_return.flexion = codo_arm_return.gamma;
% rmfield(codo_arm_return,{'alfa','beta','gamma'}); % Borra los campos
% alfa, beta y gamma del cellArray
hombro_arm_return.abduccion = -hombro_arm_return.alfa;
hombro_arm_return.rot_int = hombro_arm_return.gamma;
hombro_arm_return.plano_elev = hombro_arm_return.beta;
% rmfield(hombro_arm_return,{'alfa','beta','gamma'}); % Borra los campos
% alfa, beta y gamma del cellArray

%% OBTENCION DE LOS PARÁMETROS MEDIOS EN LOS INSTANTES HC, TC, HO, FT, AP
% de los ciclos 8 a 12
    j=1;
for i=1:5
    b1(1,j) = muneca_hands_contact.alfa(i); %Muñeca Hands Contact desvación ulnar
    b1(2,j) = muneca_top_center.alfa(i); %Muñeca Top Center desviación ulnar
    b1(3,j) = muneca_hands_off.alfa(i); %Muñeca Hands Off desviación ulnar
    b1(4,j) = muneca_follow_thru.alfa(i); %Muñeca Follow Thru desviación ulnar
    b1(5,j) = muneca_arm_return.alfa(i); %Muñeca Arm Preparation desviación ulnar
    b1(6,j) = muneca_hands_contact.gamma(i); %Muñeca Hands Contact flexión
    b1(7,j) = muneca_top_center.gamma(i); %Muñeca Top Center flexión
    b1(8,j) = muneca_hands_off.gamma(i); %Muñeca Hands Off flexión
    b1(9,j) = muneca_follow_thru.gamma(i); %Muñeca Follow Thru flexión
    b1(10,j) = muneca_arm_return.gamma(i); %Muñeca Arm Preparation flexión
    b1(11,j) = codo_hands_contact.gamma(i); %Codo Hands Contact flexión
    b1(12,j) = codo_top_center.gamma(i); %Codo Top Center flexión
    b1(13,j) = codo_hands_off.gamma(i); %Codo Hands Off flexión
    b1(14,j) = codo_follow_thru.gamma(i); %Codo Follow Trhu flexión
    b1(15,j) = codo_arm_return.gamma(i); %Codo Arm Preparation flexión
    b1(16,j) = codo_hands_contact.beta(i); %Codo Hands Contact pronación
    b1(17,j) = codo_top_center.beta(i); %Codo Top Center pronación
    b1(18,j) = codo_hands_off.beta(i); %Codo Hands Off pronación
    b1(19,j) = codo_follow_thru.beta(i); %Codo Follow Trhu pronación
    b1(20,j) = codo_arm_return.beta(i); %Codo Arm Preparation pronación
    b1(21,j) = hombro_hands_contact.alfa(i); %Hombro Hands Contact elevación de hombro
    b1(22,j) = hombro_top_center.alfa(i); %Hombro Top Center elevación de hombro
    b1(23,j) = hombro_hands_off.alfa(i); %Hombro Hands Off elevación de hombro
    b1(24,j) = hombro_follow_thru.alfa(i); %Hombro Follow Trhu elevación de hombro
    b1(25,j) = hombro_arm_return.alfa(i); %Hombro Arm Preparation elevación de hombro
    b1(26,j) = hombro_hands_contact.gamma(i); %Hombro Hands Contact rotación interna
    b1(27,j) = hombro_top_center.gamma(i); %Hombro Top Center rotación interna
    b1(28,j) = hombro_hands_off.gamma(i); %Hombro Hands Off rotación interna
    b1(29,j) = hombro_follow_thru.gamma(i); %Hombro Follow Trhu rotación interna
    b1(30,j) = hombro_arm_return.gamma(i); %Hombro Arm Preparation rotación interna
    b1(31,j) = hombro_hands_contact.beta(i); %Hombro Hands Contact aducción
    b1(32,j) = hombro_top_center.beta(i); %Hombro Top Center aducción
    b1(33,j) = hombro_hands_off.beta(i); %Hombro Hands Off aducción
    b1(34,j) = hombro_follow_thru.beta(i); %Hombro Follow Trhu aducción
    b1(35,j) = hombro_arm_return.beta(i); %Hombro Arm Preparation aducción
    
    c1(1,j) = muneca_hands_contact.f_muneca_x(i);
    c1(2,j) = muneca_hands_contact.f_muneca_y(i);
    c1(3,j) = muneca_hands_contact.f_muneca_z(i);
    c1(4,j) = muneca_hands_contact.m_muneca_x(i);
    c1(5,j) = muneca_hands_contact.m_muneca_y(i);
    c1(6,j) = muneca_hands_contact.m_muneca_z(i);
    
    c1(7,j) = muneca_top_center.f_muneca_x(i);
    c1(8,j) = muneca_top_center.f_muneca_y(i);
    c1(9,j) = muneca_top_center.f_muneca_z(i);
    c1(10,j) = muneca_top_center.m_muneca_x(i);
    c1(11,j) = muneca_top_center.m_muneca_y(i);
    c1(12,j) = muneca_top_center.m_muneca_z(i);

    c1(13,j) = muneca_hands_off.f_muneca_x(i);
    c1(14,j) = muneca_hands_off.f_muneca_y(i);
    c1(15,j) = muneca_hands_off.f_muneca_z(i);
    c1(16,j) = muneca_hands_off.m_muneca_x(i);
    c1(17,j) = muneca_hands_off.m_muneca_y(i);
    c1(18,j) = muneca_hands_off.m_muneca_z(i);
    
    c1(19,j) = muneca_follow_thru.f_muneca_x(i);
    c1(20,j) = muneca_follow_thru.f_muneca_y(i);
    c1(21,j) = muneca_follow_thru.f_muneca_z(i);
    c1(22,j) = muneca_follow_thru.m_muneca_x(i);
    c1(23,j) = muneca_follow_thru.m_muneca_y(i);
    c1(24,j) = muneca_follow_thru.m_muneca_z(i);
    
    c1(25,j) = muneca_arm_return.f_muneca_x(i);
    c1(26,j) = muneca_arm_return.f_muneca_y(i);
    c1(27,j) = muneca_arm_return.f_muneca_z(i);
    c1(28,j) = muneca_arm_return.m_muneca_x(i);
    c1(29,j) = muneca_arm_return.m_muneca_y(i);
    c1(30,j) = muneca_arm_return.m_muneca_z(i);
    
    c1(31,j) = codo_hands_contact.f_codo_x(i);
    c1(32,j) = codo_hands_contact.f_codo_y(i);
    c1(33,j) = codo_hands_contact.f_codo_z(i);
    c1(34,j) = codo_hands_contact.m_codo_x(i);
    c1(35,j) = codo_hands_contact.m_codo_y(i);
    c1(36,j) = codo_hands_contact.m_codo_z(i);
    
    c1(37,j) = codo_top_center.f_codo_x(i);
    c1(38,j) = codo_top_center.f_codo_y(i);
    c1(39,j) = codo_top_center.f_codo_z(i);
    c1(40,j) = codo_top_center.m_codo_x(i);
    c1(41,j) = codo_top_center.m_codo_y(i);
    c1(42,j) = codo_top_center.m_codo_z(i);

    c1(43,j) = codo_hands_off.f_codo_x(i);
    c1(44,j) = codo_hands_off.f_codo_y(i);
    c1(45,j) = codo_hands_off.f_codo_z(i);
    c1(46,j) = codo_hands_off.m_codo_x(i);
    c1(47,j) = codo_hands_off.m_codo_y(i);
    c1(48,j) = codo_hands_off.m_codo_z(i);
    
    c1(49,j) = codo_follow_thru.f_codo_x(i);
    c1(50,j) = codo_follow_thru.f_codo_y(i);
    c1(51,j) = codo_follow_thru.f_codo_z(i);
    c1(52,j) = codo_follow_thru.m_codo_x(i);
    c1(53,j) = codo_follow_thru.m_codo_y(i);
    c1(54,j) = codo_follow_thru.m_codo_z(i);
    
    c1(55,j) = codo_arm_return.f_codo_x(i);
    c1(56,j) = codo_arm_return.f_codo_y(i);
    c1(57,j) = codo_arm_return.f_codo_z(i);
    c1(58,j) = codo_arm_return.m_codo_x(i);
    c1(59,j) = codo_arm_return.m_codo_y(i);
    c1(60,j) = codo_arm_return.m_codo_z(i);
    
    c1(61,j) = hombro_hands_contact.f_hombro_x(i);
    c1(62,j) = hombro_hands_contact.f_hombro_y(i);
    c1(63,j) = hombro_hands_contact.f_hombro_z(i);
    c1(64,j) = hombro_hands_contact.m_hombro_x(i);
    c1(65,j) = hombro_hands_contact.m_hombro_y(i);
    c1(66,j) = hombro_hands_contact.m_hombro_z(i);
    
    c1(67,j) = hombro_top_center.f_hombro_x(i);
    c1(68,j) = hombro_top_center.f_hombro_y(i);
    c1(69,j) = hombro_top_center.f_hombro_z(i);
    c1(70,j) = hombro_top_center.m_hombro_x(i);
    c1(71,j) = hombro_top_center.m_hombro_y(i);
    c1(72,j) = hombro_top_center.m_hombro_z(i);

    c1(73,j) = hombro_hands_off.f_hombro_x(i);
    c1(74,j) = hombro_hands_off.f_hombro_y(i);
    c1(75,j) = hombro_hands_off.f_hombro_z(i);
    c1(76,j) = hombro_hands_off.m_hombro_x(i);
    c1(77,j) = hombro_hands_off.m_hombro_y(i);
    c1(78,j) = hombro_hands_off.m_hombro_z(i);
 
    c1(79,j) = hombro_follow_thru.f_hombro_x(i);
    c1(80,j) = hombro_follow_thru.f_hombro_y(i);
    c1(81,j) = hombro_follow_thru.f_hombro_z(i);
    c1(82,j) = hombro_follow_thru.m_hombro_x(i);
    c1(83,j) = hombro_follow_thru.m_hombro_y(i);
    c1(84,j) = hombro_follow_thru.m_hombro_z(i);
    
    c1(85,j) = hombro_arm_return.f_hombro_x(i);
    c1(86,j) = hombro_arm_return.f_hombro_y(i);
    c1(87,j) = hombro_arm_return.f_hombro_z(i);
    c1(88,j) = hombro_arm_return.m_hombro_x(i);
    c1(89,j) = hombro_arm_return.m_hombro_y(i);
    c1(90,j) = hombro_arm_return.m_hombro_z(i);
    j=j+1;
end
b2=mean(b1,2);
c2=mean(c1,2);
