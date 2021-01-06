within AixLib.ThermalZones.ReducedOrder.Multizone.UKA;
model calcHheat
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
    annotation (Placement(transformation(extent={{-72,-68},{-52,-48}})));
  Modelica.Blocks.Logical.Switch switch2
    annotation (Placement(transformation(extent={{44,-48},{64,-28}})));
  Heating_Period heating_Period
    annotation (Placement(transformation(extent={{-12,-68},{8,-48}})));
  Modelica.Blocks.Sources.Constant const(k=0)
    annotation (Placement(transformation(extent={{26,-50},{34,-42}})));
  Modelica.Blocks.Sources.CombiTimeTable tableAHU(
    tableOnFile=true,
    extrapolation=Modelica.Blocks.Types.Extrapolation.Periodic,
    tableName="AHU",
    columns=2:5,
    fileName=Modelica.Utilities.Files.loadResource(
        "modelica://AixLib/Resources/LowOrder_ExampleData/AHU_Input_6Zone_SIA_4Columns.txt"))
    "Boundary conditions for air handling unit"
    annotation (Placement(transformation(extent={{-70,-38},{-54,-22}})));
  Modelica.Blocks.Interfaces.RealInput T_air
    annotation (Placement(transformation(extent={{-120,24},{-80,64}})));
equation
  connect(CalcAheat.A_heat, Calculation.A_heat) annotation (Line(points={{-2,37},
          {-2,14},{-7.2,14},{-7.2,-23}},color={0,0,127}));
  connect(A_ext, CalcAheat.A_ext) annotation (Line(points={{0,100},{0,72},{-2.2,
          72},{-2.2,55}}, color={0,0,127}));
  connect(T_int, Calculation.T_int) annotation (Line(points={{45,101},{45,20},{
          6,20},{6,10},{0.4,10},{0.4,-23}},
                          color={0,0,127}));
  connect(switch2.y, Hheat) annotation (Line(points={{65,-38},{68,-38},{68,-8},
          {78,-8},{78,-1},{99,-1}},  color={0,0,127}));
  connect(Threshold.Heating_period_spring, heating_Period.Heating_period_spring)
    annotation (Line(points={{-53,-61.4},{-36,-61.4},{-36,-52.8},{-11,-52.8}},
        color={0,0,127}));
  connect(Threshold.Heating_period_autumn, heating_Period.Heating_period_autumn)
    annotation (Line(points={{-53,-65.2},{-42,-65.2},{-42,-64},{-16,-64},{-16,
          -63.4},{-11,-63.4}},
        color={0,0,127}));
  connect(heating_Period.Heater_switch, switch2.u2) annotation (Line(points={{7,-56.4},
          {24,-56.4},{24,-38},{42,-38}},           color={255,0,255}));
  connect(Calculation.Hheat, switch2.u1) annotation (Line(points={{5,-30.4},{
          12.5,-30.4},{12.5,-30},{42,-30}}, color={0,0,127}));
  connect(const.y, switch2.u3)
    annotation (Line(points={{34.4,-46},{42,-46}}, color={0,0,127}));
  connect(tableAHU.y[1], Calculation.T_sup) annotation (Line(points={{-53.2,-30},
          {-34,-30},{-34,-27.8},{-13.2,-27.8}}, color={0,0,127}));
  connect(tableAHU.y[2], Calculation.T_re) annotation (Line(points={{-53.2,-30},
          {-34,-30},{-34,-30.2},{-13.2,-30.2}}, color={0,0,127}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
        coordinateSystem(preserveAspectRatio=false)),
    experiment(StopTime=3600, Interval=3600));
end calcHheat;
