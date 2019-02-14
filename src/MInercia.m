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

% Defino Momentos de Inercia
classdef MInercia 
    properties
      Ixyz_mano
      Ixx_brazo
      Iyy_brazo
      Izz_brazo
      Ixx_anteb
      Iyy_anteb
      Izz_anteb
    end
    methods
        function MI = MInercia(MI1,MI2,MI3,MI4,MI5,MI6,MI7)
            MI.Ixyz_mano=MI1;
            MI.Ixx_brazo=MI2;
            MI.Iyy_brazo=MI3;
            MI.Izz_brazo=MI4;
            MI.Ixx_anteb=MI5;
            MI.Iyy_anteb=MI6;
            MI.Izz_anteb=MI7;
        end  
    end 
end
