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

function [MomentosInercia,CentrosMasa,Pesos]= Antropometria(pathname2,frames,MarcadoresFinales) 

cd (pathname2);
antro = xlsread('antropometria.xls',1,'B1:B8'); %Carga todos los datos antropométricos

altura_m = antro(1); % Altura en metros
peso_kg = antro(2); % Peso en kilos
circ_axilar = antro(3); % Circunferencia del axilar brazo
circ_codo = antro(4); % Circunferencia del codo
circ_muneca = antro(5);  % Circunferencia de la mu�eca
circ_puno = antro(6); % Circunferencia del pu�o
long_brazo = antro(7); % Longitud del brazo
long_antebrazo = antro(8); % Longitud del antebrazo

altura_in = altura_m/0.0254; % altura en pulgadas
peso_lbs = peso_kg*2.20462; % peso en libras
peso_N = peso_lbs*4.448222; % peso en Newtons
p_index = altura_in/(peso_lbs^(1/3)); % indice ponderal (Winter pg. 53)
den_cuerpo_kg_l = 0.69 + (0.0297*p_index); % Densidad del cuerpo en kg/l
den_cuerpo = den_cuerpo_kg_l/.001; % Densidad del cuerpo en kg/m^3
peso_brazo = 0.5*(0.08*peso_lbs-2.9); % Peso de brazo en libras (Hanavan)
peso_antebrazo = 0.5*(0.04*peso_lbs-0.5); % Peso de antebrazo en libras (Hanavan)
peso_mano = 0.5*(0.01*peso_lbs-0.7); % Peso de mano en libras (Hanavan)
den_mano = 1.16/.001; % Densidad de la mano en kg/m^3 de Winter
den_antebrazo = 1.13/.001; % Densidad del antebrazo en kg/m^3
den_brazo = 1.07/.001; % brazo en kg/m^3 densidad

%---------Calculo de los momentos de inercia / centros de masas-----------%
g = 9.81; %gravedad m\s^2

%BRAZO
pr_rad_brazo = circ_axilar/(2*pi); %Radio proximal del brazo (hombro)
ds_rad_brazo = circ_codo/(2*pi); %Radio distal del brazo (codo)
vol_brazo = (pi*long_brazo/3*(pr_rad_brazo^2+pr_rad_brazo*ds_rad_brazo+ds_rad_brazo^2)); %Volumen del segmento en m^3 (Cilindro eliptico (Hanavan))
peso_brazo = den_brazo*vol_brazo;  %Masa del brazo en kg (densidad en kg/m^3)
mu_brazo = ds_rad_brazo/pr_rad_brazo; %Constante "mu" definida por Hanavan
sigma_brazo = 1+mu_brazo+mu_brazo^2; %Constante "sigma" definida por Hanavan
AA_brazo = (9/(20*pi))*((1+mu_brazo+mu_brazo^2+mu_brazo^3+mu_brazo^4)/(sigma_brazo^2)); %Constante AA definida por Hanavan
BB_brazo = (3/80)*((1+4*mu_brazo+10*mu_brazo^2+4*mu_brazo^3+mu_brazo^4)/(sigma_brazo^2)); %Constante BB definida por Hanavan
Ixx_brazo = peso_brazo*((AA_brazo*(peso_brazo/(den_brazo*long_brazo)))+BB_brazo*(long_brazo^2)); %Momento de inercia perpendicular al eje longitudinal(kg*m^2)
Izz_brazo = Ixx_brazo; %Momento de inercia perpendicular al eje longitudinal (kg*m^2)
Iyy_brazo = (3/10)*peso_brazo*((pr_rad_brazo^5-ds_rad_brazo^5)/(pr_rad_brazo^3-ds_rad_brazo^3));%Momento de inercia sobre el eje longitudinal del brazo (kg*m^2)
Ixy_brazo = 0;
Ixz_brazo = 0;
Iyz_brazo = 0;
I_brazo = [Ixx_brazo Ixy_brazo Ixz_brazo; Ixy_brazo Iyy_brazo Iyz_brazo; Ixz_brazo Iyz_brazo Izz_brazo]; %Matriz de inercia del de brazo
ratio_cm_brazo = ((pr_rad_brazo^2+2*pr_rad_brazo*ds_rad_brazo+3*ds_rad_brazo^2))...
    /(4*(pr_rad_brazo^2+pr_rad_brazo*ds_rad_brazo+ds_rad_brazo^2)); 
    %Ratio del centro de masas del brazo (centro de masa/longitud) respecto del extremo proximal (Hanavan)
    for i=1:frames
    cm_brazo(i,:) = MarcadoresFinales.agd(i,:) + (ratio_cm_brazo*(MarcadoresFinales.acd(i,:)-MarcadoresFinales.agd(i,:)));
     %Coordenadas 3-D del centro de masas del brazo en golbales respecto
     %del extremo PROXIMAL
    end

%ANTEBRAZO
pr_rad_anteb = circ_codo/(2*pi); %Radio proximal del antebrazo (codo)
ds_rad_anteb = circ_muneca/(2*pi); %Radio distal del antebrazo (mu�eca)
vol_anteb = (pi*long_antebrazo/3*(pr_rad_anteb^2+pr_rad_anteb*ds_rad_anteb+ds_rad_anteb^2)); %Volumen del segmento en m^3 (Cilindro eliptico (Hanavan))
peso_anteb = den_antebrazo*vol_anteb;  %Masa del antebrazo en kg (densidad en kg/m^3)
mu_anteb = ds_rad_anteb/pr_rad_anteb; %Constante "mu" definida por Hanavan
sigma_anteb = 1+mu_anteb+mu_anteb^2; %Constante "sigma" definida por Hanavan
AA_anteb = (9/(20*pi))*((1+mu_anteb+mu_anteb^2+mu_anteb^3+mu_anteb^4)/(sigma_anteb^2)); %Constante AA definida por Hanavan
BB_anteb = (3/80)*((1+4*mu_anteb+10*mu_anteb^2+4*mu_anteb^3+mu_anteb^4)/(sigma_anteb^2)); %Constante BB definida por Hanavan
Ixx_anteb = peso_anteb*((AA_anteb*(peso_anteb/(den_antebrazo*long_antebrazo)))+BB_anteb*(long_antebrazo^2)); %momento de inercia perpendicular al eje longitudinal (kg*m^2)
Izz_anteb = Ixx_anteb; %momento de inercia perpendicular al eje longitudinal (kg*m^2)
Iyy_anteb = (3/10)*peso_anteb*((pr_rad_anteb^5-ds_rad_anteb^5)/(pr_rad_anteb^3-ds_rad_anteb^3));%Momento de inercia alrededor del eje longitudinal del antebrazo (kg*m^2)
Ixy_anteb = 0;
Ixz_anteb = 0;
Iyz_anteb = 0;
I_anteb = [Ixx_anteb Ixy_anteb Ixz_anteb; Ixy_anteb Iyy_anteb Iyz_anteb; Ixz_anteb Iyz_anteb Izz_anteb]; %Matriz de inercias del antebrazo
ratio_cm_anteb = ((pr_rad_anteb^2+2*pr_rad_anteb*ds_rad_anteb+3*ds_rad_anteb^2))...
    /(4*(pr_rad_anteb^2+pr_rad_anteb*ds_rad_anteb+ds_rad_anteb^2));
    %Ratio del centro de masas del antebrazo (centro de masa/longitud) respecto del extremo proximal (Hanavan)
    for i=1:frames
    cm_anteb(i,:)=MarcadoresFinales.acd(i,:) + (ratio_cm_anteb * (MarcadoresFinales.amd(i,:) - MarcadoresFinales.acd(i,:)));
    %Coordenadas 3-D del centro de masas en golbales respecto del extremo
    %PROXIMAL
    end

%MANO
pr_rad_mano = circ_puno/(2*pi); %Radio de la mano
vol_mano = (4/3)*pi*pr_rad_mano^3; %Volumen de la mano en m^3
peso_mano = den_mano*vol_mano; %masa de la mano en kg
Ixyz_mano = (2/5)*peso_mano*pr_rad_mano^2; %momento de inercia de la mano alrededor de cualquier eje (kg*m^2)
I_mano = [Ixyz_mano 0 0; 0 Ixyz_mano 0; 0 0 Ixyz_mano];
ratio_cm_mano = 0.5; %Ratio del centro de masas de la mano (centro de masa/longitud) respecto del extremo proximal (Hanavan)
    for i=1:frames
    cm_mano(i,:) = MarcadoresFinales.amd(i,:) + (ratio_cm_mano*(MarcadoresFinales.mnd(i,:)-MarcadoresFinales.amd(i,:)));
    %Coordenadas 3-D del dentro de masas de la mano en golbales respecto del extremo
    %PROXIMAL
    end
MomentosInercia=MInercia(Ixyz_mano, Ixx_brazo, Iyy_brazo, Izz_brazo, Ixx_anteb, Iyy_anteb, Izz_anteb); 
CentrosMasa=CM(cm_mano, cm_brazo, cm_anteb);
Pesos=PesosMS(peso_mano, peso_anteb, peso_brazo);
