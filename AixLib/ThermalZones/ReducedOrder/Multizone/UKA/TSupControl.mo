within AixLib.ThermalZones.ReducedOrder.Multizone.UKA;
model TSupControl

  Modelica.Blocks.Interfaces.RealInput T_air(final unit="K")
    annotation (Placement(transformation(extent={{-120,-20},{-80,20}})));
  Modelica.Blocks.Interfaces.RealOutput T_sup( final unit="K")
    annotation (Placement(transformation(extent={{82,-18},{118,18}})));
  Modelica.Blocks.Tables.CombiTable1D combiTable1D(
    table=[-26,80; 0,50; 20,20],
    columns={2},
    smoothness=Modelica.Blocks.Types.Smoothness.LinearSegments,
    extrapolation=Modelica.Blocks.Types.Extrapolation.HoldLastPoint)
    annotation (Placement(transformation(extent={{-8,-20},{32,20}})));
equation
  combiTable1D.u[1] = Modelica.SIunits.Conversions.to_degC(T_air);
    T_sup = Modelica.SIunits.Conversions.from_degC(combiTable1D.y[1]);
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
        coordinateSystem(preserveAspectRatio=false)));
end TSupControl;
