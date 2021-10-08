function out = color_detection_f(I,state)
%**************************************************
%Diese Funktion erkennt automatisch 6 Farben aus Bild I anhand vom
%Farbwert, der Farbsättigung und dem Hellwert 
%Der HSV-Farbraum wird benutzt.
%
%Mit State kann ein vorgefertigtes Farbschema\bereich ausgewählt werden,um die Objekterkennung zu verbessern dabei ist:
% 1: Default
% 2: Farbe

%Image Processing Toolbox benötigt
%
%Farbwert (Winkel) für benutzte Farben:
%  rot = 0
%  gelb = 60
%  grün = 120
%  cyan = 180
%  blau = 240
%  magenta = 300
%
%**************************************************


    % setzen vom  sättigungs und hellwerts Treshold
    sThresh = [0.15 1];
    hThresh = [0.2 1];

    % farberkennung
    I_hsv = rgb2hsv(I);
    I_farbwert = round(I_hsv(:,:,1)*360);
    I_s = I_hsv(:,:,2);
    I_h = I_hsv(:,:,3);
    % Erzeugen der Treshold matrix
    I_thresh = (I_s>=sThresh(1))&(I_s<=sThresh(2))&(I_h>=hThresh(1))&(I_h<=hThresh(2)); 
    
    % auswählen des Farbschemas
    switch state
        
        case 1
            % Filtern  nach Farbe
            schnee_buildings = (I_s<sThresh(1))&(I_h>=hThresh(1));
            vegetation = ((I_farbwert>90)&(I_farbwert<=150))&I_thresh;
            wasser = ((I_farbwert>150)&(I_farbwert<=270))&I_thresh;
            sand_erde= ((I_farbwert>5)&(I_farbwert<=90))&I_thresh;

            out(:,:,1)= schnee_buildings;
            out(:,:,2) = vegetation;
            out(:,:,3) = wasser;
            out(:,:,4)=sand_erde;
            
        case 2
            
            black = (I_h<hThresh(1));
            white = (I_s<sThresh(1))&(I_h>=hThresh(1));
            red = ((I_farbwert<=30)|(I_farbwert>330))&I_thresh;
            yellow = ((I_farbwert>30)&(I_farbwert<=90))&I_thresh;
            green = ((I_farbwert>90)&(I_farbwert<=150))&I_thresh;
            cyan = ((I_farbwert>150)&(I_farbwert<=210))&I_thresh;
            blue = ((I_farbwert>210)&(I_farbwert<=270))&I_thresh;
            magenta = ((I_farbwert>270)&(I_farbwert<=330))&I_thresh;

            out.black = black;
            out.white = white;
            out.red = red;
            out.yellow = yellow;
            out.green = green;
            out.cyan = cyan;
            out.blue = blue;
            out.magenta = magenta;    
    end
end
