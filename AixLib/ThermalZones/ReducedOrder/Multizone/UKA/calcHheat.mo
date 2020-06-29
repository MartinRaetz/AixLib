within AixLib.ThermalZones.ReducedOrder.Multizone.UKA;
model calcHheat
  AixLib.ThermalZones.ReducedOrder.Multizone.UKA.calcTsup
    CalcTsup annotation (Placement(transformation(extent={{-52,-22},{-32,-2}})));
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
    Calculation annotation (Placement(transformation(extent={{-10,-20},{10,0}})));
  Modelica.Blocks.Logical.Switch switch1
    annotation (Placement(transformation(extent={{28,-40},{48,-20}})));
  Modelica.Blocks.Logical.Less less
    annotation (Placement(transformation(extent={{-30,-54},{-10,-34}})));
  AixLib.ThermalZones.ReducedOrder.Multizone.UKA.threshold
    Threshold
    annotation (Placement(transformation(extent={{-82,-82},{-62,-62}})));
  Modelica.Blocks.Logical.Switch switch2
    annotation (Placement(transformation(extent={{66,-68},{86,-48}})));
  Heating_Period heating_Period
    annotation (Placement(transformation(extent={{-8,-96},{12,-76}})));
equation
  connect(CalcAheat.A_heat, Calculation.A_heat) annotation (Line(points={{-2,37},
          {-2,14},{-3.2,14},{-3.2,-1}}, color={0,0,127}));
  connect(A_ext, CalcAheat.A_ext) annotation (Line(points={{0,100},{0,72},{-2.2,
          72},{-2.2,55}}, color={0,0,127}));
  connect(T_int, Calculation.T_int) annotation (Line(points={{45,101},{45,20},{
          6,20},{6,10},{4.4,10},{4.4,-1}},
                          color={0,0,127}));
  connect(T_air, CalcTsup.T_air)
    annotation (Line(points={{-101,-7},{-51,-7},{-51,-8}},color={0,0,127}));
  connect(CalcTsup.T_sup, Calculation.T_sup) annotation (Line(points={{-31,-8.2},
          {-9.2,-8.2}},             color={0,0,127}));
  connect(Calculation.Hheat, switch1.u1) annotation (Line(points={{9,-8.4},{22,
          -8.4},{22,-22},{26,-22}}, color={0,0,127}));
  connect(less.y, switch1.u2) annotation (Line(points={{-9,-44},{10,-44},{10,
          -30},{26,-30}}, color={255,0,255}));
  connect(T_air, less.u1) annotation (Line(points={{-101,-7},{-66,-7},{-66,-44},
          {-32,-44}}, color={0,0,127}));
  connect(Threshold.T_limit, less.u2) annotation (Line(points={{-63,-70.4},{-50,
          -70.4},{-50,-52},{-32,-52}},     color={0,0,127}));
  connect(Threshold.Hheat_zero, switch1.u3) annotation (Line(points={{-63,-65.8},
          {22,-65.8},{22,-38},{26,-38}},        color={0,0,127}));
  connect(Threshold.Hheat_zero, switch2.u3) annotation (Line(points={{-63,-65.8},
          {64,-65.8},{64,-66}}, color={0,0,127}));
  connect(switch1.y, switch2.u1) annotation (Line(points={{49,-30},{52,-30},{52,
          -50},{64,-50}}, color={0,0,127}));
  connect(switch2.y, Hheat) annotation (Line(points={{87,-58},{90,-58},{90,-26},
          {68,-26},{68,-1},{99,-1}}, color={0,0,127}));
  connect(Threshold.Heating_period_spring, heating_Period.Heating_period_spring)
    annotation (Line(points={{-63,-75.4},{-20,-75.4},{-20,-80.8},{-7,-80.8}},
        color={0,0,127}));
  connect(Threshold.Heating_period_autumn, heating_Period.Heating_period_autumn)
    annotation (Line(points={{-63,-79.2},{-38,-79.2},{-38,-91.4},{-7,-91.4}},
        color={0,0,127}));
  connect(heating_Period.Heater_switch, switch2.u2) annotation (Line(points={{
          11,-84.4},{46,-84.4},{46,-58},{64,-58}}, color={255,0,255}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
        coordinateSystem(preserveAspectRatio=false)));
end calcHheat;
