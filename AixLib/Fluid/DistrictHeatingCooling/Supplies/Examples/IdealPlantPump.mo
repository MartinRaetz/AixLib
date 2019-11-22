within AixLib.Fluid.DistrictHeatingCooling.Supplies.Examples;
model IdealPlantPump
   extends Modelica.Icons.ExamplesPackage;
  package Medium = AixLib.Media.Water "Fluid in the pipes";
  ClosedLoop.IdealPlantPump                                         idealPlantPump(
    redeclare package Medium = Medium,
    m_flow_nominal=5)
    annotation (Placement(transformation(extent={{-52,0},{-32,20}})));
  Demands.ClosedLoop.ValveControlledHeatPumpFixDeltaT
    valveControlledHeatPumpFixDeltaT(
    redeclare package MediumBuilding = Medium,
    dTBuilding=20,
    TSupplyBuilding=333.15,
    dTDesign=5,
    Q_flow_nominal=7000,
    redeclare package Medium = Medium,
    TReturn=343.15,
    tau=30)         annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=-90,
        origin={24,-20})));
  Demands.ClosedLoop.ValveControlledHeatPumpFixDeltaT
    valveControlledHeatPumpFixDeltaT1(
    redeclare package MediumBuilding = Medium,
    Q_flow_nominal=6500,
    dTBuilding=20,
    TSupplyBuilding=333.15,
    dTDesign=5,
    redeclare package Medium = Medium,
    TReturn=343.15,
    tau=30)         annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=-90,
        origin={80,-20})));
  AixLib.Fluid.FixedResistances.PlugFlowPipe plugFlowPipe(
    dh=0.2,
    length=5,
    m_flow_nominal=2,
    nPorts=2,
    dIns=0.001,
    kIns=0.04,
    redeclare package Medium = Medium)
               annotation (Placement(transformation(extent={{-20,0},{0,20}})));
  AixLib.Fluid.FixedResistances.PlugFlowPipe plugFlowPipe1(
    dh=0.2,
    length=5,
    m_flow_nominal=2,
    nPorts=1,
    dIns=0.001,
    kIns=0.04,
    redeclare package Medium = Medium)
               annotation (Placement(transformation(extent={{38,2},{58,22}})));
  AixLib.Fluid.FixedResistances.PlugFlowPipe plugFlowPipe2(
    dh=0.2,
    length=5,
    m_flow_nominal=2,
    nPorts=1,
    dIns=0.001,
    kIns=0.04,
    redeclare package Medium = Medium)
    annotation (Placement(transformation(extent={{60,-58},{40,-38}})));
  AixLib.Fluid.FixedResistances.PlugFlowPipe plugFlowPipe3(
    dh=0.2,
    length=5,
    m_flow_nominal=2,
    nPorts=1,
    dIns=0.001,
    kIns=0.04,
    redeclare package Medium = Medium)
    annotation (Placement(transformation(extent={{0,-58},{-20,-38}})));
  Modelica.Blocks.Sources.Sine sine(
    amplitude=2000,
    freqHz=86400,
    offset=5000,
    startTime=0) annotation (Placement(transformation(extent={{0,30},{20,50}})));
  Modelica.Blocks.Sources.Sine sine1(
    amplitude=2500,
    freqHz=86400,
    offset=4000,
    phase=0.5235987755983,
    startTime=0)
    annotation (Placement(transformation(extent={{56,30},{76,50}})));
  Modelica.Blocks.Sources.Constant const(k=5e5)
    annotation (Placement(transformation(extent={{-90,-22},{-70,-2}})));
  Modelica.Blocks.Sources.Constant T_flow(k=273.15 + 25)
    annotation (Placement(transformation(extent={{-100,40},{-80,60}})));
equation
  connect(idealPlantPump.port_b, plugFlowPipe.port_a)
    annotation (Line(points={{-32,10},{-20,10}}, color={0,127,255}));
  connect(plugFlowPipe.ports_b[1], valveControlledHeatPumpFixDeltaT.port_a)
    annotation (Line(points={{0,8},{24,8},{24,-10}}, color={0,127,255}));
  connect(plugFlowPipe.ports_b[2], plugFlowPipe1.port_a)
    annotation (Line(points={{0,12},{38,12}}, color={0,127,255}));
  connect(plugFlowPipe1.ports_b[1], valveControlledHeatPumpFixDeltaT1.port_a)
    annotation (Line(points={{58,12},{80,12},{80,-10}}, color={0,127,255}));
  connect(valveControlledHeatPumpFixDeltaT1.port_b, plugFlowPipe2.port_a)
    annotation (Line(points={{80,-30},{80,-48},{60,-48}}, color={0,127,255}));
  connect(valveControlledHeatPumpFixDeltaT.port_b, plugFlowPipe3.port_a)
    annotation (Line(points={{24,-30},{24,-48},{0,-48}}, color={0,127,255}));
  connect(plugFlowPipe2.ports_b[1], plugFlowPipe3.port_a)
    annotation (Line(points={{40,-48},{0,-48}}, color={0,127,255}));
  connect(plugFlowPipe3.ports_b[1], idealPlantPump.port_a) annotation (Line(
        points={{-20,-48},{-92,-48},{-92,10},{-52,10}}, color={0,127,255}));
  connect(sine.y, valveControlledHeatPumpFixDeltaT.Q_flow_input)
    annotation (Line(points={{21,40},{32,40},{32,-9.2}}, color={0,0,127}));
  connect(sine1.y, valveControlledHeatPumpFixDeltaT1.Q_flow_input)
    annotation (Line(points={{77,40},{88,40},{88,-9.2}}, color={0,0,127}));
  connect(const.y, idealPlantPump.dpIn) annotation (Line(points={{-69,-12},{-60,
          -12},{-60,2},{-52.6,2}}, color={0,0,127}));
  connect(T_flow.y, idealPlantPump.T_Set) annotation (Line(points={{-79,50},{
          -66,50},{-66,14.2},{-52.6,14.2}}, color={0,0,127}));
  annotation (
    Diagram(coordinateSystem(extent={{-160,-100},{100,100}})),
    Icon(coordinateSystem(extent={{-160,-100},{100,100}})),
    experiment(
      StopTime=172800,
      Interval=60,
      __Dymola_Algorithm="Cvode"),
    Documentation(revisions="<html>
<ul>
<li>
November 22, 2019, by Michael Mans:<br/>
Implemented for <a href=\"https://github.com/RWTH-EBC/AixLib/issues/402\">issue 403</a>.
</li>
</ul>
</html>"));
end IdealPlantPump;