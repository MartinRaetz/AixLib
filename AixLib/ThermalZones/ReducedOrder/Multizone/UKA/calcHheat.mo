within AixLib.ThermalZones.ReducedOrder.Multizone.UKA;
model calcHheat
  AixLib.ThermalZones.ReducedOrder.Multizone.UKA.calcTsup
    CalcTsup annotation (Placement(transformation(extent={{-46,-22},{-26,-2}})));
  AixLib.ThermalZones.ReducedOrder.Multizone.UKA.calcAheat
    CalcAheat annotation (Placement(transformation(extent={{-44,34},{-24,54}})));

 Modelica.Blocks.Interfaces.RealInput A_ext(final unit="m2")
    "Exterior Wall Area"
 annotation (Placement(transformation(extent={{-18,-18},{18,18}},
        rotation=-90,
        origin={-34,100}),
    iconTransformation(extent={{-10,-10},{10,10}},
        rotation=-90,
        origin={-2,90})));
   Modelica.Blocks.Interfaces.RealInput T_int(final unit="K")
    "Inside air temperature"
 annotation (Placement(transformation(extent={{-17,-17},{17,17}},
        rotation=-90,
        origin={-3,101}),
    iconTransformation(extent={{-10,-10},{10,10}},
        rotation=-90,
        origin={44,90})));

 Modelica.Blocks.Interfaces.RealInput T_air(final unit="K")
    "Outside air temperature"
 annotation (Placement(transformation(extent={{-122,-24},{-88,10}}),
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
  Modelica.Blocks.Logical.Switch switch2
    annotation (Placement(transformation(extent={{44,-48},{64,-28}})));
  Heating_Period heating_Period
    annotation (Placement(transformation(extent={{-14,-68},{6,-48}})));
  Modelica.Blocks.Nonlinear.Limiter limiter(uMax=273.15 + 10, uMin=273.15 - 12)
    annotation (Placement(transformation(extent={{-76,-18},{-56,2}})));
  Modelica.Blocks.Sources.Constant const(k=0)
    annotation (Placement(transformation(extent={{26,-50},{34,-42}})));
  ComfortTemperatureControl comfortTemperatureControlUpper(
    useConstantTemperature=true,
    constantTemperature=296.15,
    comfortFunctionTable=[-15,22.5; 0,22.5; 15,25; 25,25])
    annotation (Placement(transformation(extent={{26,26},{46,46}})));
  ComfortTemperatureControl comfortTemperatureControlLower(
    useConstantTemperature=true,
    constantTemperature=293.15,
    comfortFunctionTable=[-15,20.5; 0,20.5; 17,22; 25,22])
    annotation (Placement(transformation(extent={{26,56},{46,76}})));
equation
  connect(CalcAheat.A_heat, Calculation.A_heat) annotation (Line(points={{-34,35},
          {-34,14},{-7.2,14},{-7.2,-23}},
                                        color={0,0,127}));
  connect(A_ext, CalcAheat.A_ext) annotation (Line(points={{-34,100},{-34,72},{
          -34.2,72},{-34.2,53}},
                          color={0,0,127}));
  connect(T_int, Calculation.T_int) annotation (Line(points={{-3,101},{-3,20},{
          6,20},{6,10},{-2,10},{-2,-23}},
                          color={0,0,127}));
  connect(switch2.y, Hheat) annotation (Line(points={{65,-38},{68,-38},{68,-8},
          {78,-8},{78,-1},{99,-1}},  color={0,0,127}));
  connect(heating_Period.Heater_switch, switch2.u2) annotation (Line(points={{5,-56.4},
          {24,-56.4},{24,-38},{42,-38}},           color={255,0,255}));
  connect(CalcTsup.T_sup, Calculation.T_sup) annotation (Line(points={{-25,-8.2},
          {-22,-8.2},{-22,-30.2},{-13.2,-30.2}}, color={0,0,127}));
  connect(T_air, limiter.u) annotation (Line(points={{-105,-7},{-105,-8},{-78,
          -8}},           color={0,0,127}));
  connect(limiter.y, CalcTsup.T_air)
    annotation (Line(points={{-55,-8},{-45,-8}}, color={0,0,127}));
  connect(Calculation.Hheat, switch2.u1) annotation (Line(points={{5,-30.4},{
          12.5,-30.4},{12.5,-30},{42,-30}}, color={0,0,127}));
  connect(const.y, switch2.u3)
    annotation (Line(points={{34.4,-46},{42,-46}}, color={0,0,127}));
  connect(T_air, comfortTemperatureControlLower.TDryBull)
    annotation (Line(points={{-105,-7},{-105,66},{26,66}}, color={0,0,127}));
  connect(T_air, comfortTemperatureControlUpper.TDryBull)
    annotation (Line(points={{-105,-7},{-105,36},{26,36}}, color={0,0,127}));
  connect(comfortTemperatureControlUpper.T_ComfortBoundary, Calculation.UpperLimitHeat)
    annotation (Line(points={{45.8,36},{48,36},{48,8},{2.4,8},{2.4,-22}}, color
        ={0,0,127}));
  connect(comfortTemperatureControlLower.T_ComfortBoundary, Calculation.LowerLimitHeat)
    annotation (Line(points={{45.8,66},{50,66},{50,-20},{16,-20},{16,-26},{6,
          -26}}, color={0,0,127}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
        coordinateSystem(preserveAspectRatio=false)));
end calcHheat;
