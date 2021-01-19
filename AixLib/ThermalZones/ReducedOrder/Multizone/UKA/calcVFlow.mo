within AixLib.ThermalZones.ReducedOrder.Multizone.UKA;
model calcVFlow

  parameter Real VFlow_rel_Max = 1;
  parameter Real VFlow_rel_Min = 0;
  parameter Real ControlBand = 2;

  Modelica.Blocks.Interfaces.RealInput T_setpoint
    annotation (Placement(transformation(extent={{-120,50},{-80,90}})));
  Modelica.Blocks.Interfaces.RealInput T_room
    annotation (Placement(transformation(extent={{-120,-90},{-80,-50}})));
  Modelica.Blocks.Interfaces.RealOutput VFlow_rel
    annotation (Placement(transformation(extent={{90,-10},{110,10}})));
  Modelica.Blocks.Nonlinear.Limiter limiter(uMax=VFlow_rel_Max, uMin = VFlow_rel_Min)
    annotation (Placement(transformation(extent={{64,-10},{84,10}})));
equation
  limiter.u = ((VFlow_rel_Max - VFlow_rel_Min)/ControlBand) * (T_setpoint - T_room) + VFlow_rel_Max;
  connect(VFlow_rel, limiter.y)
    annotation (Line(points={{100,0},{85,0}}, color={0,0,127}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
        coordinateSystem(preserveAspectRatio=false)));
end calcVFlow;
