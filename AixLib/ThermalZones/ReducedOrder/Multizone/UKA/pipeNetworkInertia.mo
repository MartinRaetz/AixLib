within AixLib.ThermalZones.ReducedOrder.Multizone.UKA;
model pipeNetworkInertia

  parameter Real T1(final unit="s") = 1000 "Time constant T1 for first order element";
  parameter Real relativeTemperatureLoss( final unit="%") = 2 "relative temperature loss in pipe network";
  parameter Real T_ambient( final unit="K") = 295.15 "ambient temperature for temperature losses";
  Modelica.Blocks.Interfaces.RealInput T_sup_in( final unit="K")
    annotation (Placement(transformation(extent={{-120,-20},{-80,20}})));

  Modelica.Blocks.Interfaces.RealOutput T_sup_out( final unit= "K")
    annotation (Placement(transformation(extent={{82,-18},{118,18}})));
  Modelica.Blocks.Continuous.FirstOrder firstOrder(T=T1, initType=Modelica.Blocks.Types.Init.SteadyState)
    annotation (Placement(transformation(extent={{-40,-10},{-20,10}})));
  Modelica.Blocks.Math.Gain gain(k=(100 - relativeTemperatureLoss)/100)
    annotation (Placement(transformation(extent={{0,-4},{20,16}})));
  Modelica.Blocks.Math.Add add
    annotation (Placement(transformation(extent={{50,-10},{70,10}})));
  Modelica.Blocks.Math.Gain gain1(k=relativeTemperatureLoss/100)
    annotation (Placement(transformation(extent={{0,-50},{20,-30}})));
  Modelica.Blocks.Sources.Constant const(k=T_ambient)
    annotation (Placement(transformation(extent={{-40,-50},{-20,-30}})));
equation
  connect(T_sup_in, firstOrder.u)
    annotation (Line(points={{-100,0},{-42,0}}, color={0,0,127}));
  connect(firstOrder.y, gain.u)
    annotation (Line(points={{-19,0},{-10,0},{-10,6},{-2,6}},
                                              color={0,0,127}));
  connect(add.y, T_sup_out)
    annotation (Line(points={{71,0},{100,0}}, color={0,0,127}));
  connect(gain.y, add.u1)
    annotation (Line(points={{21,6},{48,6}}, color={0,0,127}));
  connect(gain1.y, add.u2) annotation (Line(points={{21,-40},{36,-40},{36,-6},{48,
          -6}}, color={0,0,127}));
  connect(const.y, gain1.u) annotation (Line(points={{-19,-40},{-10,-40},{-10,-40},
          {-2,-40}}, color={0,0,127}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
        coordinateSystem(preserveAspectRatio=false)));
end pipeNetworkInertia;
