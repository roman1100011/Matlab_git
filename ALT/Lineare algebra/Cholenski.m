classdef IdealTrafo
    properties
        Uebersetung {mustBePositive} %N1/N2
        N1 {mustBeInteger} %Anzahl Wicklungen Primärseitig 
        N2 {mustBeInteger} %Anzahl Wicklungen Sekundärseitig
        I1 {mustBeNumeric} %Strom Primärseite
        I2 {mustBeNumeric} %Strom sekundärseite
        U1 {mustBeNumeric} %Spannung Primärseite
        U2 {mustBeNumeric} %Spannung sekundärseite
        RL {mustBeNumeric} %Lastwiederstand
    end
    methods

        function fu2 = get_U2(obj)
            if obj.U1 == 0
                fu2 = 0;
            end
            if obj.Uebersetung ~= 0
                fu2 = obj.U1/obj.Uebersetung;
            end
            if (obj.I1 ~= 0) && (obj.I2 ~= 0)
                fu2 = (obj.U1*obj.I1)/obj.I2;
            end

        end
        
        function fu1 = get_U1(obj)
            if obj.U1 == 0
                fu1 = 0;
            end
            if obj.Uebersetung ~= 0
                fu1 = obj.U2*obj.Uebersetung;
            end
            if (obj.I1 ~= 0) && (obj.I2 ~= 0)
                fu1 = (obj.U2*obj.I2)/obj.I1;
            end

        end
       

    end





end
