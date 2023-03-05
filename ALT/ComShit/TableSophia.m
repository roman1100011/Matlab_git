%% Daten
numberCodeSeg = [24 12 8 5 4 3]
Kat = categorical({'Dargestellte Körperbilder reflektieren','Bewusst von Körperbildern distanzieren','Körperbilder ignorieren','Seinen Körper akzeptieren','Keine Anwendung von Strategien','Sich in positiveres Umfeld begeben'});
Kat = reordercats(Kat,{'Dargestellte Körperbilder reflektieren','Bewusst von Körperbildern distanzieren','Körperbilder ignorieren','Seinen Körper akzeptieren','Sich in positiveres Umfeld begeben','Keine Anwendung von Strategien'});
%% Plot
grph1 = bar(Kat,numberCodeSeg)
xTips = grph1.XEndPoints
yTips = grph1.YEndPoints
labels1 = string(grph1.YData);
text(xTips,yTips,labels1,'HorizontalAlignment','center','VerticalAlignment','bottom')
grid minor
