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
            if obj.U2 == 0
                fu1 = 0;
            end
            if obj.Uebersetung ~= 0
                fu1 = obj.U2*obj.Uebersetung;
            end
            if (obj.I1 ~= 0) && (obj.I2 ~= 0)
                fu1 = (obj.U2*obj.I2)/obj.I1;
            end

        end
        function fi1 = get_i1(obj)
            if obj.I2 == 0
                fi1 = 0;
            end
            if obj.Uebersetung ~= 0
                fi1 = obj.I2*obj.Uebersetung;
            end
            if (obj.U1 ~= 0) && (obj.U2 ~= 0)
                fi1 = (obj.U2*obj.I2)/obj.U1;
            end

        end
        function fi2 = get_i2(obj)
            syms x;
            try
                fi2 = solve(obj.Uebersetung==x/obj.I1, x);
            end
            try
                fi2 = solve(obj.N1/obj.N2==x/obj.I1, x);
            end
            try
                fi2 = solve(obj.U1 /obj.U2 ==x/obj.I1, x);
            end
        end
        function Ue = get_Uebersetung(obj)
            syms x;
            try
                Ue = solve(x==obj.I2/obj.I1, x);
            end
            try
                Ue = solve(obj.N1/obj.N2==x, x);
            end
            try
                Ue = solve(obj.U1 /obj.U2 ==x, x);
            end
        end
        function fn1 = get_N1(obj)
            syms x;
            try
                fn1 = solve(x/obj.N2==obj.I2/obj.I1, x);
            end
            try
                fn1 = solve(x/obj.N2==obj.Uebersetung, x);
            end
            try
                fn1 = solve(obj.U1 /obj.U2 ==x/obj.N2, x);
            end
        end
        function fn2 = get_N2(obj)
            syms x;
            try
                fn2 = solve(obj.N1/x==obj.I2/obj.I1, x);
            end
            try
                fn2 = solve(obj.N1/x==obj.Uebersetung, x);
            end
            try
                fn2 = solve(obj.U1 /obj.U2 ==obj.N1/x, x);
            end
        end
        function ir1 = get_ir1(obj)
            syms x;
            if obj.I2 ~= 0
                try
                    ir1 = obj.I2/obj.Uebersetung;
                end
                Ue = get_Uebersetung(obj);
                ir1 = Ue/obj.Uebersetung;
                end
        end
        function rl = get_rl(obj)
            rl = get_U2 / get_i2;
            
            
        end
            
        end
       
       

    end






