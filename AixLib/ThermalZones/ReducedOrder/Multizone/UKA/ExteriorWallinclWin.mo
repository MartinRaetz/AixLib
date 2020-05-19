within AixLib.ThermalZones.ReducedOrder.Multizone.UKA;
model ExteriorWallinclWin
  extends Modelica.Blocks.Sources.RealExpression(y=AextinclWin);
  extends
    BuildingGeneratedviaExcelImport.ExampleImport.ExampleImport_DataBase.ExampleImport_Bedroom
    annotation (
    IconMap(extent={{-100,-100}, {100,100}},primitivesVisible=false),
    DiagramMap(extent={{-50,-50}, {0,0}},primitivesVisible=true));

 Real AextinclWin;

equation

  AextinclWin = Modelica.Math.Vectors.length(AWin) + Modelica.Math.Vectors.length(AExt);

end ExteriorWallinclWin;
