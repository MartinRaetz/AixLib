within AixLib.ThermalZones.ReducedOrder.Multizone.UKA;
model SupplyTemperatureControllerWithConstantSetpoint
  Modelica.Blocks.Continuous.LimPID PID(
    controllerType=Modelica.Blocks.Types.SimpleController.PI,
    k=1,
    Ti=3600,
    yMax=5,
    yMin=0) annotation (Placement(transformation(extent={{-70,0},{-50,20}})));
  Modelica.Blocks.Continuous.LimPID PID1(
    controllerType=Modelica.Blocks.Types.SimpleController.PI,
    k=1,
    Ti=3600,
    yMax=0,
    yMin=-7) "Extra Cooling"
    annotation (Placement(transformation(extent={{-72,62},{-52,82}})));
  Modelica.Blocks.Math.Add3 add3_1
    annotation (Placement(transformation(extent={{-8,-56},{12,-36}})));
  Modelica.Blocks.Interfaces.RealInput Tair
    annotation (Placement(transformation(extent={{-162,42},{-122,82}})));
  Modelica.Blocks.Interfaces.RealOutput AdjustedSupplyTemperature
    annotation (Placement(transformation(extent={{72,-6},{92,14}})));
  Modelica.Blocks.Interfaces.RealInput UpperLimit
    annotation (Placement(transformation(extent={{-164,-4},{-124,36}})));
  Modelica.Blocks.Interfaces.RealInput LowerLimit
    annotation (Placement(transformation(extent={{-164,-48},{-124,-8}})));
  Modelica.Blocks.Interfaces.RealInput SetPoint
    annotation (Placement(transformation(extent={{-164,-96},{-124,-56}})));
equation
  connect(PID.y,add3_1. u2) annotation (Line(points={{-49,10},{-38,10},{-38,-46},
          {-10,-46}}, color={0,0,127}));
  connect(add3_1.y,AdjustedSupplyTemperature)  annotation (Line(points={{13,-46},
          {56,-46},{56,4},{82,4}}, color={0,0,127}));
  connect(Tair,PID1. u_m) annotation (Line(points={{-142,62},{-102,62},{-102,42},
          {-62,42},{-62,60}}, color={0,0,127}));
  connect(Tair,PID. u_m) annotation (Line(points={{-142,62},{-112,62},{-112,-32},
          {-60,-32},{-60,-2}}, color={0,0,127}));
  connect(PID1.y,add3_1. u3) annotation (Line(points={{-51,72},{-30,72},{-30,
          -54},{-10,-54}}, color={0,0,127}));
  connect(UpperLimit, PID1.u_s) annotation (Line(points={{-144,16},{-88,16},{
          -88,72},{-74,72}}, color={0,0,127}));
  connect(LowerLimit, PID.u_s) annotation (Line(points={{-144,-28},{-118,-28},{
          -118,-16},{-78,-16},{-78,10},{-72,10}}, color={0,0,127}));
  connect(SetPoint, add3_1.u1) annotation (Line(points={{-144,-76},{-77,-76},{
          -77,-38},{-10,-38}}, color={0,0,127}));
  annotation (
    Icon(coordinateSystem(preserveAspectRatio=false)),
    Diagram(coordinateSystem(preserveAspectRatio=false)));
end SupplyTemperatureControllerWithConstantSetpoint;
