within AixLib.ThermalZones.ReducedOrder.Multizone.HUS;
model calcTsup

Real m "slope";
Real b "y-axis section";

 Modelica.Blocks.Interfaces.RealInput T_air(final unit="K")
    "Outside air temperature"
 annotation (Placement(transformation(extent={{-116,-18},{-82,16}}),
    iconTransformation(extent={{-100,30},{-80,50}})));

 Modelica.Blocks.Interfaces.RealOutput T_sup(final unit="K")
    "Outside air temperature"
        annotation (Placement(transformation(extent={{82,-16},{116,18}}),
    iconTransformation(extent={{100,28},{120,48}})));

equation

T_sup = m*T_air + b;

273.15 + 70 = m*(273.15+10)+b;
273.15 + 90 = m*(273.15-12)+b;

  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
        coordinateSystem(preserveAspectRatio=false)));
end calcTsup;
