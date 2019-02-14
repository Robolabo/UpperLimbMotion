% Defino Centros de Masa
classdef CM 
    properties
      cm_mano
      cm_brazo
      cm_anteb
    end
    methods
        function CMS = CM(CMS1,CMS2,CMS3)
            CMS.cm_mano=CMS1;
            CMS.cm_brazo=CMS2;
            CMS.cm_anteb=CMS3;
        end  
    end 
end