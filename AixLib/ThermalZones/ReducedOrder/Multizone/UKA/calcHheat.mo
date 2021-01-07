within AixLib.ThermalZones.ReducedOrder.Multizone.UKA;
model calcHheat
  AixLib.ThermalZones.ReducedOrder.Multizone.UKA.calcNheater CalcNheater
    annotation (Placement(transformation(extent={{-22,26},{4,46}})));

 Modelica.Blocks.Interfaces.RealInput A_ext(final unit="m2")
    "Exterior Wall Area"
 annotation (Placement(transformation(extent={{-18,-18},{18,18}},
        rotation=-90,
        origin={-10,100}),
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

         Modelica.Blocks.Interfaces.RealOutput Hheat(final unit="W")
    "heater power"
        annotation (Placement(transformation(extent={{17,-17},{-17,17}},
        rotation=180,
        origin={99,-37}),
    iconTransformation(extent={{-10,-10},{10,10}},
        rotation=0,
        origin={90,16})));

  AixLib.ThermalZones.ReducedOrder.Multizone.UKA.calculation
    Calculation annotation (Placement(transformation(extent={{-18,-42},{8,-22}})));
  AixLib.ThermalZones.ReducedOrder.Multizone.UKA.threshold
    Threshold
    annotation (Placement(transformation(extent={{-72,-68},{-48,-50}})));
  Modelica.Blocks.Logical.Switch switch2
    annotation (Placement(transformation(extent={{44,-48},{64,-28}})));
  Heating_Period heating_Period
    annotation (Placement(transformation(extent={{-22,-70},{12,-50}})));
  Modelica.Blocks.Sources.Constant const(k=0)
    annotation (Placement(transformation(extent={{18,-80},{32,-66}})));
  Modelica.Blocks.Sources.CombiTimeTable table_TFlow(
    tableOnFile=true,
    extrapolation=Modelica.Blocks.Types.Extrapolation.Periodic,
    tableName="TFlow",
    columns=2:3,
    fileName=Modelica.Utilities.Files.loadResource(
        "modelica://AixLib/Resources/LowOrder_ExampleData/TFlow_HUS.txt"))
    "T_sup and T_re timeseries"
    annotation (Placement(transformation(extent={{-70,-38},{-54,-22}})));
  Modelica.Blocks.Interfaces.RealInput TDryBul
    annotation (Placement(transformation(extent={{-120,20},{-80,60}})));
equation
  connect(A_ext, CalcNheater.A_ext) annotation (Line(points={{-10,100},{-10,72},
          {-9.26,72},{-9.26,45}},
                          color={0,0,127}));
  connect(T_int, Calculation.T_int) annotation (Line(points={{45,101},{45,10},{
          0.72,10},{0.72,-23}},
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
  connect(Calculation.Hheat, switch2.u1) annotation (Line(points={{6.7,-30.4},{
          12.5,-30.4},{12.5,-30},{42,-30}}, color={0,0,127}));
  connect(const.y, switch2.u3)
    annotation (Line(points={{32.7,-73},{38,-73},{38,-46},{42,-46}},
                                                   color={0,0,127}));
  connect(table_TFlow.y[1], Calculation.T_sup) annotation (Line(points={{-53.2,
          -30},{-34,-30},{-34,-27.8},{-16.96,-27.8}},color={0,0,127}));
  connect(table_TFlow.y[2], Calculation.T_re) annotation (Line(points={{-53.2,
          -30},{-34,-30},{-34,-30.2},{-16.96,-30.2}},
                                                color={0,0,127}));
  connect(Calculation.n_heater, CalcNheater.n_heater) annotation (Line(points={{-9.16,
          -23},{-9.16,8.5},{-9,8.5},{-9,27}},color={0,0,127}));
  connect(Hheat, Hheat)
    annotation (Line(points={{99,-37},{99,-37}}, color={0,0,127}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
        coordinateSystem(preserveAspectRatio=false)),
    experiment(StopTime=3600, Interval=3600));
end calcHheat;
