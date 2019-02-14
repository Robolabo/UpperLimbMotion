% Defino Pesos
classdef PesosMS 
    properties
      peso_mano
      peso_anteb
      peso_brazo
    end
    methods
        function PS = PesosMS(P1,P2,P3)
            PS.peso_mano=P1;
            PS.peso_anteb=P2;
            PS.peso_brazo=P3;
        end  
    end 
end