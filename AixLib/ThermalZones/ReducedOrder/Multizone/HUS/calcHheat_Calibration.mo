within AixLib.ThermalZones.ReducedOrder.Multizone.HUS;
model calcHheat_Calibration

  parameter Real mFlow_max( final unit="kg/s") = 0.0057;
  AixLib.ThermalZones.ReducedOrder.Multizone.HUS.calcNheater CalcNheater
    annotation (Placement(transformation(extent={{-32,40},{-8,58}})));

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
        annotation (Placement(transformation(extent={{18,-18},{-18,18}},
        rotation=180,
        origin={98,-30}),
    iconTransformation(extent={{-10,-10},{10,10}},
        rotation=0,
        origin={90,20})));

  AixLib.ThermalZones.ReducedOrder.Multizone.HUS.threshold_heatingPeriod
    Threshold
    annotation (Placement(transformation(extent={{-70,-70},{-46,-50}})));
  Modelica.Blocks.Logical.Switch switch2
    annotation (Placement(transformation(extent={{46,-40},{66,-20}})));
  heatingPeriod heating_Period
    annotation (Placement(transformation(extent={{-26,-70},{6,-50}})));
  Modelica.Blocks.Sources.Constant const(k=0)
    annotation (Placement(transformation(extent={{-16,-94},{-2,-80}})));
  Modelica.Blocks.Interfaces.RealInput TDryBul( final unit="K")
    annotation (Placement(transformation(extent={{-120,-10},{-80,30}}),
        iconTransformation(extent={{-100,10},{-80,30}})));
  Modelica.Blocks.Interfaces.RealInput T_int_setpoint( final unit="K") annotation (Placement(
        transformation(
        extent={{-20,-20},{20,20}},
        rotation=-90,
        origin={66,100}), iconTransformation(
        extent={{-10,-10},{10,10}},
        rotation=-90,
        origin={70,90})));
  calcVFlow calcVFlow1 annotation (Placement(transformation(
        extent={{-13,-14},{13,14}},
        rotation=-90,
        origin={58,23})));
  Modelica.Blocks.Math.Gain gain(k=mFlow_max)
    annotation (Placement(transformation(extent={{42,-10},{22,10}})));
  calculation_MFlow_Input calculation_MFlow1
    annotation (Placement(transformation(extent={{-24,-36},{0,-16}})));
  pipeNetworkInertia pipeNetworkInertia1
    annotation (Placement(transformation(extent={{-50,-32},{-30,-12}})));
  Modelica.Blocks.Sources.CombiTimeTable table_TFlow(
    tableOnFile=true,
    extrapolation=Modelica.Blocks.Types.Extrapolation.HoldLastPoint,
    tableName="TFlow",
    columns=2:3,
    fileName=Modelica.Utilities.Files.loadResource(
        "modelica://AixLib/Resources/LowOrder_ExampleData/Measurement data for validation HUS Triangle Floor 7.txt"),

    offset={273.15})
    "T_sup and T_re timeseries"
    annotation (Placement(transformation(extent={{-86,-30},{-70,-14}})));
equation
  connect(A_ext, CalcNheater.A_ext) annotation (Line(points={{-66,100},{-66,72},
          {-20,72},{-20,57.1}},
                          color={0,0,127}));
  connect(switch2.y, Hheat) annotation (Line(points={{67,-30},{98,-30}},
                                     color={0,0,127}));
  connect(Threshold.Heating_period_spring, heating_Period.Heating_period_spring)
    annotation (Line(points={{-47.2,-54},{-24.4,-54}},
        color={0,0,127}));
  connect(Threshold.Heating_period_autumn, heating_Period.Heating_period_autumn)
    annotation (Line(points={{-47.2,-66},{-24.4,-66}},
        color={0,0,127}));
  connect(heating_Period.Heater_switch, switch2.u2) annotation (Line(points={{4.4,-60},
          {24,-60},{24,-30},{44,-30}},             color={255,0,255}));
  connect(const.y, switch2.u3)
    annotation (Line(points={{-1.3,-87},{38,-87},{38,-38},{44,-38}},
                                                   color={0,0,127}));
  connect(Hheat, Hheat)
    annotation (Line(points={{98,-30},{98,-30}}, color={0,0,127}));
  connect(calcVFlow1.T_room, T_int) annotation (Line(points={{49.6,33.4},{49.6,
          66},{22,66},{22,100}},
                             color={0,0,127}));
  connect(T_int_setpoint, calcVFlow1.T_setpoint) annotation (Line(points={{66,100},
          {66,33.4},{66.4,33.4}},      color={0,0,127}));
  connect(gain.u, calcVFlow1.VFlow_rel)
    annotation (Line(points={{44,0},{58,0},{58,11.3}},
                                                     color={0,0,127}));
  connect(calculation_MFlow1.n_heater, CalcNheater.n_heater) annotation (Line(
        points={{-19.2,-17},{-19.2,12.5},{-20,12.5},{-20,40.9}},
                                                               color={0,0,127}));
  connect(calculation_MFlow1.T_int, T_int) annotation (Line(points={{-4.8,-17},{
          -4.8,34.5},{22,34.5},{22,100}}, color={0,0,127}));
  connect(calculation_MFlow1.Hheat, switch2.u1) annotation (Line(points={{-1.2,
          -22},{44,-22}},              color={0,0,127}));
  connect(gain.y, calculation_MFlow1.mFlow) annotation (Line(points={{21,0},{
          -26,0},{-26,-30},{-22.8,-30}},
                                     color={0,0,127}));
  connect(pipeNetworkInertia1.T_sup_out, calculation_MFlow1.T_sup)
    annotation (Line(points={{-31.8,-22},{-22.8,-22}},
                                                     color={0,0,127}));
  connect(table_TFlow.y[1], pipeNetworkInertia1.T_sup_in)
    annotation (Line(points={{-69.2,-22},{-48,-22}}, color={0,0,127}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
        coordinateSystem(preserveAspectRatio=false)),
    experiment(StopTime=3600, Interval=3600));
end calcHheat_Calibration;
