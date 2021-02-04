within AixLib.ThermalZones.ReducedOrder.Multizone.HUS;
model ExteriorWallinclWin
  extends Modelica.Blocks.Sources.RealExpression(y=AExtinclWin);

parameter Real AExt "exterior wall area excluding window";
parameter Real AWin "Window area";

Real AExtinclWin;

equation

    AExtinclWin = AExt + AWin;

 //AextinclWin= Modelica.Math.Vectors.length(AExt) + Modelica.Math.Vectors.length(AWin);

   annotation (
    IconMap(extent={{-100,-100}, {100,100}},primitivesVisible=false),
    DiagramMap(extent={{-50,-50}, {0,0}},primitivesVisible=true));
end ExteriorWallinclWin;
