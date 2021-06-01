within AixLib.ThermalZones.ReducedOrder.Multizone.UKA;
model calculation

  parameter Real specificHeatFlowfactor( final unit="W/(K.m2)")=17.21 "empirical factor for heat flux calculation";
  Real   Q;


   Modelica.Blocks.Interfaces.RealInput T_int(final unit="K")
    "Inside air temperature"
 annotation (Placement(transformation(extent={{-17,-17},{17,17}},
        rotation=-90,
        origin={-1,99}),
    iconTransformation(extent={{-10,-10},{10,10}},
        rotation=-90,
        origin={20,90})));

   Modelica.Blocks.Interfaces.RealInput T_sup(final unit="K")
    "supply temperature"
 annotation (Placement(transformation(extent={{-17,-17},{17,17}},
        rotation=0,
        origin={-99,3}),
    iconTransformation(extent={{-102,8},{-82,28}})));

   Modelica.Blocks.Interfaces.RealInput A_heat(final unit="m2")
    "Heater Area"
 annotation (Placement(transformation(extent={{-18,-18},{18,18}},
        rotation=-90,
        origin={-58,98}),
    iconTransformation(extent={{-10,-10},{10,10}},
        rotation=-90,
        origin={-32,90})));

         Modelica.Blocks.Interfaces.RealOutput Hheat(final unit="W")
    "heater power"
        annotation (Placement(transformation(extent={{17,-17},{-17,17}},
        rotation=180,
        origin={101,-1}),
    iconTransformation(extent={{-10,-10},{10,10}},
        rotation=0,
        origin={90,16})));

  Modelica.Blocks.Interfaces.RealInput UpperLimitHeat annotation (Placement(
        transformation(
        extent={{-20,-20},{20,20}},
        rotation=-90,
        origin={64,100})));
  Modelica.Blocks.Interfaces.RealInput LowerLimitHeat annotation (Placement(
        transformation(
        extent={{-20,-20},{20,20}},
        rotation=180,
        origin={100,60})));
equation

  if T_int < LowerLimitHeat then
    Q = 1;
  elseif T_int > UpperLimitHeat then
      Q = 0;
    else
      Q = (1/(LowerLimitHeat - UpperLimitHeat))*(T_int - LowerLimitHeat)+1;

  end if;
  Hheat = Q * (T_sup - T_int)*A_heat*specificHeatFlowfactor;

  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
        coordinateSystem(preserveAspectRatio=false)));
end calculation;
