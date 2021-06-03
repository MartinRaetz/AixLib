within AixLib.ThermalZones.ReducedOrder.Multizone.UKA;
model ComfortTemperatureControl
  Modelica.Blocks.Interfaces.RealInput TDryBull(final unit="K")
    annotation (Placement(transformation(extent={{-120,-20},{-80,20}}),
        iconTransformation(extent={{-120,-20},{-80,20}})));
  Modelica.Blocks.Interfaces.RealOutput T_ComfortBoundary(final unit="K")
    annotation (Placement(transformation(extent={{80,-18},{116,18}}),
        iconTransformation(extent={{80,-18},{116,18}})));
  Modelica.Blocks.Tables.CombiTable1D combiTable1D(
    table=comfortFunctionTable,
    columns={2},
    smoothness=Modelica.Blocks.Types.Smoothness.LinearSegments,
    extrapolation=Modelica.Blocks.Types.Extrapolation.HoldLastPoint)
    annotation (Placement(transformation(extent={{-8,-12},{16,12}})));
    parameter Boolean useConstantTemperature = false "Use constant temperature setpoint instead of comfort temperature control";
    parameter Modelica.SIunits.Temperature constantTemperature = 294.15 "Constant temperature setpoint (used when useConstantTemperature is true)";
    parameter Real comfortFunctionTable[:, :] = [-15,20.5; 0,20.5; 17,22; 25,22]
    "Comfort table matrix [°C]";
equation
  combiTable1D.u[1] = Modelica.SIunits.Conversions.to_degC(TDryBull);
  if useConstantTemperature then
    T_ComfortBoundary=constantTemperature;
  else
    T_ComfortBoundary= Modelica.SIunits.Conversions.from_degC(combiTable1D.y[1]);
  end if
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
        coordinateSystem(preserveAspectRatio=false)));
end ComfortTemperatureControl;
