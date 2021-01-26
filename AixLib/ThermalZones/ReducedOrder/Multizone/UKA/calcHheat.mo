within AixLib.ThermalZones.ReducedOrder.Multizone.UKA;
model calcHheat

  parameter Real mFlow_max( final unit="kg/s") = 0.0057;
  AixLib.ThermalZones.ReducedOrder.Multizone.UKA.calcNheater CalcNheater
    annotation (Placement(transformation(extent={{-30,40},{-4,60}})));

 Modelica.Blocks.Interfaces.RealInput A_ext(final unit="m2")
    "Exterior Wall Area"
 annotation (Placement(transformation(extent={{-18,-18},{18,18}},
        rotation=-90,
        origin={-66,100}),
    iconTransformation(extent={{-10,-10},{10,10}},
        rotation=-90,
        origin={-60,90})));
   Modelica.Blocks.Interfaces.RealInput T_int(final unit="K")
    "Inside air temperature"
 annotation (Placement(transformation(extent={{-18,-18},{18,18}},
        rotation=-90,
        origin={22,100}),
    iconTransformation(extent={{-10,-10},{10,10}},
        rotation=-90,
        origin={20,90})));

         Modelica.Blocks.Interfaces.RealOutput Hheat(final unit="W")
    "heater power"
        annotation (Placement(transformation(extent={{17,-17},{-17,17}},
        rotation=180,
        origin={99,-37}),
    iconTransformation(extent={{-10,-10},{10,10}},
        rotation=0,
        origin={90,20})));

  AixLib.ThermalZones.ReducedOrder.Multizone.UKA.threshold
    Threshold
    annotation (Placement(transformation(extent={{-72,-68},{-48,-50}})));
  Modelica.Blocks.Logical.Switch switch2
    annotation (Placement(transformation(extent={{44,-48},{64,-28}})));
  Heating_Period heating_Period
    annotation (Placement(transformation(extent={{-22,-70},{12,-50}})));
  Modelica.Blocks.Sources.Constant const(k=0)
    annotation (Placement(transformation(extent={{18,-80},{32,-66}})));
  Modelica.Blocks.Interfaces.RealInput TDryBul( final unit="K")
    annotation (Placement(transformation(extent={{-120,0},{-80,40}}),
        iconTransformation(extent={{-120,0},{-80,40}})));
  Modelica.Blocks.Interfaces.RealInput T_int_setpoint( final unit="K") annotation (Placement(
        transformation(
        extent={{-20,-20},{20,20}},
        rotation=-90,
        origin={70,100}), iconTransformation(
        extent={{-10,-10},{10,10}},
        rotation=-90,
        origin={70,90})));
  TSupControl tSupControl
    annotation (Placement(transformation(extent={{-76,-32},{-56,-12}})));
  calcVFlow calcVFlow1 annotation (Placement(transformation(
        extent={{-13,-14},{13,14}},
        rotation=-90,
        origin={58,23})));
  Modelica.Blocks.Math.Gain gain(k=mFlow_max)
    annotation (Placement(transformation(extent={{42,-10},{22,10}})));
  calculation_MFlow calculation_MFlow1
    annotation (Placement(transformation(extent={{-24,-36},{0,-16}})));
  pipeNetworkInertia pipeNetworkInertia1
    annotation (Placement(transformation(extent={{-50,-32},{-30,-12}})));
equation
  connect(A_ext, CalcNheater.A_ext) annotation (Line(points={{-66,100},{-66,72},
          {-17.26,72},{-17.26,59}},
                          color={0,0,127}));
  connect(switch2.y, Hheat) annotation (Line(points={{65,-38},{76,-38},{76,-37},
          {99,-37}},                 color={0,0,127}));
  connect(Threshold.Heating_period_spring, heating_Period.Heating_period_spring)
    annotation (Line(points={{-49.2,-62.06},{-36,-62.06},{-36,-54.8},{-20.3,
          -54.8}},
        color={0,0,127}));
  connect(Threshold.Heating_period_autumn, heating_Period.Heating_period_autumn)
    annotation (Line(points={{-49.2,-65.48},{-42,-65.48},{-42,-65.4},{-20.3,
          -65.4}},
        color={0,0,127}));
  connect(heating_Period.Heater_switch, switch2.u2) annotation (Line(points={{10.3,
          -58.4},{24,-58.4},{24,-38},{42,-38}},    color={255,0,255}));
  connect(const.y, switch2.u3)
    annotation (Line(points={{32.7,-73},{38,-73},{38,-46},{42,-46}},
                                                   color={0,0,127}));
  connect(Hheat, Hheat)
    annotation (Line(points={{99,-37},{99,-37}}, color={0,0,127}));
  connect(TDryBul, tSupControl.T_air) annotation (Line(points={{-100,20},{-80,
          20},{-80,-22},{-76,-22}},
                                color={0,0,127}));
  connect(calcVFlow1.T_room, T_int) annotation (Line(points={{48.2,36},{48.2,66},
          {22,66},{22,100}}, color={0,0,127}));
  connect(T_int_setpoint, calcVFlow1.T_setpoint) annotation (Line(points={{70,100},
          {66,100},{66,36},{67.8,36}}, color={0,0,127}));
  connect(gain.u, calcVFlow1.VFlow_rel)
    annotation (Line(points={{44,0},{58,0},{58,10}}, color={0,0,127}));
  connect(calculation_MFlow1.n_heater, CalcNheater.n_heater) annotation (Line(
        points={{-16.8,-17},{-16.8,12.5},{-17,12.5},{-17,41}}, color={0,0,127}));
  connect(calculation_MFlow1.T_int, T_int) annotation (Line(points={{-4.8,-17},{
          -4.8,34.5},{22,34.5},{22,100}}, color={0,0,127}));
  connect(calculation_MFlow1.Hheat, switch2.u1) annotation (Line(points={{-1.2,-22},
          {22,-22},{22,-30},{42,-30}}, color={0,0,127}));
  connect(gain.y, calculation_MFlow1.mFlow) annotation (Line(points={{21,0},{
          -26,0},{-26,-30},{-22.8,-30}},
                                     color={0,0,127}));
  connect(tSupControl.T_sup, pipeNetworkInertia1.T_sup_in) annotation (Line(
        points={{-56,-22},{-54,-22},{-54,-22},{-50,-22}}, color={0,0,127}));
  connect(pipeNetworkInertia1.T_sup_out, calculation_MFlow1.T_sup)
    annotation (Line(points={{-30,-22},{-22.8,-22}}, color={0,0,127}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
        coordinateSystem(preserveAspectRatio=false)),
    experiment(StopTime=3600, Interval=3600));
end calcHheat;
