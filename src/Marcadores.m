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

% Defino la clase marcadores
classdef Marcadores 
    properties
        acd
        agd
        amd
        c7
        cld
        cli
        eed
        eid
        icj
        eje
        marco_anterior
        marco_medio
        marco_posterior
        mnd
        rld
        uld
    end
    methods
        function M = Marcadores (M1,M2,M3,M4,M5,M6,M7,M8,M9,M10,M11,M12,M13,M14,M15,M16)
            M.acd=M1;
            M.agd=M2;
            M.amd=M3;
            M.c7=M4;
            M.cld=M5;
            M.cli=M6;
            M.eed=M7;
            M.eid=M8;
            M.icj=M9;
            M.eje=M10;
            M.marco_anterior=M11;
            M.marco_medio=M12;
            M.marco_posterior=M13;
            M.mnd=M14;
            M.rld=M15;
            M.uld=M16;
        end  
    end 
end
