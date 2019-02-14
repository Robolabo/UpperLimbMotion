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