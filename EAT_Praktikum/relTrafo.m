classdef relTrafo
    properties
        %Bauteile
        N1 {mustBeInteger}  %Primärwicklungen
        N2 {mustBeInteger}  %Sekundärwiklungen
        Ue {mustBeNumeric}  %Übersetzungsverhältniss
        L1 {mustBeNumeric}  %Induktivität primärseite [H]
        L2 {mustBeNumeric}  %Induktivität sekundärseite [H]
        Lh {mustBeNumeric}  %Koppelinduktivität [H]
        U1 {mustBeNumeric}  %Primärspannung [V]
        U2 {mustBeNumeric}  %Sekundärspannung [V]
        F  {mustBeNumeric}  %Frequenz [Hz]
        R1 {mustBeNumeric}  %Eingangswiderstand reel [Ohm]
        R2 {mustBeNumeric}  %Ausgangswiderstand reel [Ohm]
        Rfe{mustBeNumeric}  %Eisenverluste reel [Ohm]
        Z  {mustBeNumeric}  %Ausgangsimpedanz
        I1 {mustBeNumeric}  %EingangsstromBelastet [Ohm]
        I2 {mustBeNumeric}  %AusgangsstromBelastet [Ohm]
        
    end
    methods
        %Funktionen
        %Sekundärspannung aus Primärspannung und übersetzung Unbelastet  von Tmodel
        function [u2,ang] = get_U2(obj)
            omega = 2*pi*obj.F;
            u_tot = obj.U1/(omega*obj.L1*1i+omega*obj.Lh*1i)*(omega*obj.Lh*1j);
            try
                u_tot = u_tot*obj.Ue;
            catch
                u_tot = obj.N1/obj.N2 *u_tot;
            end
            u2=abs(u_tot);
            ang = angle(u_tot);
        end

        %Primärspannung aus übersetzung und Sekundärspannung Unbelastet  von Tmodel
        function u1 = get_U1(obj)
            omega = 2*pi*obj.F;
            try
                ulh = obj.U2/obj.Ue;
            catch
                ulh = obj.N2/obj.N1 * obj.U2;
            end
            syms x
            u1= solve(ulh == x/(omega*obj.L1*1i+omega*obj.Lh*1i)*(omega*obj.Lh*1j),x);
        end
        %eingangsstrom Unbelastet von Tmodel
        function I_in = get_I1(obj)
            omega = 2*pi*obj.F;
            try
                I_in = obj.U1/(omega*obj.L1*1i+omega*obj.Lh*1i);
            catch
                I_in = get_U1(obj)/(omega*obj.L1*1i+omega*obj.Lh*1i);
            end
        end
        %eingangsimpedanz Angepasst
        function Z = get_z_in(obj)
            omega = 2*pi*obj.F;
            Z1 = omega*obj.L1*1i+obj.R1;
            Zp1= ((omega*obj.Lh*1j+obj.Rfe)/(omega*obj.Lh*1j*obj.Rfe));
            Zp2 = omega*1j*obj.L2+obj.R2+obj.Z;
            Z2 = (Zp1+Zp2)/(Zp1*Zp2);
            Zges = Z1+Z2;
            Z = Zges;
        end
        %annahme serielle lastwiderstände
        function uz2 = get_load_u2(obj)
            omega = 2*pi*obj.F;
            Zr = R + obj.Ll*1j*omega+1/(omega+obj.Cl*1j);
            %noch nicht komplett!!!!!!!!
        end


    end
end