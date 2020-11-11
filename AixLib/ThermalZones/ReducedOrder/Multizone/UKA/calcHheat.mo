within AixLib.ThermalZones.ReducedOrder.Multizone.UKA;
model calcHheat
  AixLib.ThermalZones.ReducedOrder.Multizone.UKA.calcTsup
    CalcTsup annotation (Placement(transformation(extent={{-46,-22},{-26,-2}})));
  AixLib.ThermalZones.ReducedOrder.Multizone.UKA.calcAheat
    CalcAheat annotation (Placement(transformation(extent={{-12,36},{8,56}})));

 Modelica.Blocks.Interfaces.RealInput A_ext(final unit="m2")
    "Exterior Wall Area"
 annotation (Placement(transformation(extent={{-18,-18},{18,18}},
        rotation=-90,
        origin={0,100}),
    iconTransformation(extent={{-10,-10},{10,10}},
        rotation=-90,
        origin={-2,90})));
   Modelica.Blocks.Interfaces.RealInput T_int(final unit="K")
    "Inside air temperature"
 annotation (Placement(transformation(extent={{-17,-17},{17,17}},
        rotation=-90,
        origin={45,101}),
    iconTransformation(extent={{-10,-10},{10,10}},
        rotation=-90,
        origin={44,90})));

 Modelica.Blocks.Interfaces.RealInput T_air(final unit="K")
    "Outside air temperature"
 annotation (Placement(transformation(extent={{-118,-24},{-84,10}}),
    iconTransformation(extent={{-100,30},{-80,50}})));

         Modelica.Blocks.Interfaces.RealOutput Hheat(final unit="W")
    "heater power"
        annotation (Placement(transformation(extent={{17,-17},{-17,17}},
        rotation=180,
        origin={99,-1}),
    iconTransformation(extent={{-10,-10},{10,10}},
        rotation=0,
        origin={90,16})));

  AixLib.ThermalZones.ReducedOrder.Multizone.UKA.calculation
    Calculation annotation (Placement(transformation(extent={{-14,-42},{6,-22}})));
  AixLib.ThermalZones.ReducedOrder.Multizone.UKA.threshold
    Threshold
    annotation (Placement(transformation(extent={{-82,-82},{-62,-62}})));
  Modelica.Blocks.Logical.Switch switch2
    annotation (Placement(transformation(extent={{66,-68},{86,-48}})));
  Heating_Period heating_Period
    annotation (Placement(transformation(extent={{0,-88},{20,-68}})));
  Modelica.Blocks.Nonlinear.Limiter limiter(uMax=273.15 + 10, uMin=273.15 - 12)
    annotation (Placement(transformation(extent={{-76,-18},{-56,2}})));
equation
  connect(CalcAheat.A_heat, Calculation.A_heat) annotation (Line(points={{-2,37},
          {-2,14},{-7.2,14},{-7.2,-23}},color={0,0,127}));
  connect(A_ext, CalcAheat.A_ext) annotation (Line(points={{0,100},{0,72},{-2.2,
          72},{-2.2,55}}, color={0,0,127}));
  connect(T_int, Calculation.T_int) annotation (Line(points={{45,101},{45,20},{
          6,20},{6,10},{0.4,10},{0.4,-23}},
                          color={0,0,127}));
  connect(Threshold.Hheat_zero, switch2.u3) annotation (Line(points={{-63,-65.8},
          {64,-65.8},{64,-66}}, color={0,0,127}));
  connect(switch2.y, Hheat) annotation (Line(points={{87,-58},{90,-58},{90,-26},
          {68,-26},{68,-1},{99,-1}}, color={0,0,127}));
  connect(Threshold.Heating_period_spring, heating_Period.Heating_period_spring)
    annotation (Line(points={{-63,-75.4},{-20,-75.4},{-20,-72.8},{1,-72.8}},
        color={0,0,127}));
  connect(Threshold.Heating_period_autumn, heating_Period.Heating_period_autumn)
    annotation (Line(points={{-63,-79.2},{-38,-79.2},{-38,-83.4},{1,-83.4}},
        color={0,0,127}));
  connect(heating_Period.Heater_switch, switch2.u2) annotation (Line(points={{19,
          -76.4},{46,-76.4},{46,-58},{64,-58}},    color={255,0,255}));
  connect(CalcTsup.T_sup, Calculation.T_sup) annotation (Line(points={{-25,-8.2},
          {-22,-8.2},{-22,-30.2},{-13.2,-30.2}}, color={0,0,127}));
  connect(T_air, limiter.u) annotation (Line(points={{-101,-7},{-101,-8},{-78,
          -8}},           color={0,0,127}));
  connect(limiter.y, CalcTsup.T_air)
    annotation (Line(points={{-55,-8},{-45,-8}}, color={0,0,127}));
  connect(Calculation.Hheat, switch2.u1) annotation (Line(points={{5,-30.4},{
          34.5,-30.4},{34.5,-50},{64,-50}}, color={0,0,127}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
        coordinateSystem(preserveAspectRatio=false)));
end calcHheat;
