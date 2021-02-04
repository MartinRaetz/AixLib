within AixLib.ThermalZones.ReducedOrder.Multizone.HUS;
model calculation_MFlow_Input "Calculates heating power"

  parameter Real n(final unit="")= 1.2876 "Purme Hygiene Type 20 Radiators Height 60 Length 200 : empirical coefficent for radiator calculation (Heizkörperkoeffizient (https://www.energie-lexikon.info/heizkoerperexponent.html)";
  parameter Real Q_Norm( final unit="W")= 2170 "Purme Hygiene Type 20 Radiators Height 60 Length 200";
  parameter Real deltaT_Norm = 49.8 "Norm temperature difference";
  parameter Real cp_w(final unit="J/(kg.K)") = 4184;
  Real deltaT_lnBetrieb;

   Modelica.Blocks.Interfaces.RealInput T_int(final unit="K")
    "Inside air temperature"
    annotation (Placement(transformation(extent={{-18,-18},{18,18}},
        rotation=-90,
        origin={60,100}),
    iconTransformation(extent={{-10,-10},{10,10}},
        rotation=-90,
        origin={60,90})));

   Modelica.Blocks.Interfaces.RealInput T_sup(final unit="K")
    "supply temperature"
    annotation (Placement(transformation(extent={{-18,-18},{18,18}},
        rotation=0,
        origin={-100,40}),
    iconTransformation(extent={{-100,30},{-80,50}})));

  Modelica.Blocks.Interfaces.RealInput n_heater
    "number of heater"
    annotation (Placement(transformation(
        extent={{-18,-18},{18,18}},
        rotation=-90,
        origin={-60,100}),iconTransformation(
        extent={{-10,-10},{10,10}},
        rotation=-90,
        origin={-60,90})));

  Modelica.Blocks.Interfaces.RealOutput Hheat(final unit="W")
    "heater power"
    annotation (Placement(transformation(extent={{18,-18},{-18,18}},
        rotation=180,
        origin={100,40}),
    iconTransformation(extent={{-10,-10},{10,10}},
        rotation=0,
        origin={90,40})));

  Modelica.Blocks.Interfaces.RealInput mFlow( final unit="kg/s")
    annotation (Placement(transformation(extent={{-120,-80},{-80,-40}}),
        iconTransformation(extent={{-100,-50},{-80,-30}})));
  Modelica.Blocks.Interfaces.RealOutput T_re( final unit="K",start=303) annotation (Placement(
        transformation(extent={{64,-66},{100,-30}}), iconTransformation(extent={{80,-50},
            {100,-30}})));
equation

  // Fail-Save condition to prevent a mathematical error in the log function
  if noEvent(T_int < T_re and T_re < T_sup and mFlow > 0.0002) then
    deltaT_lnBetrieb = (T_sup-T_re)/Modelica.Math.log((T_sup-T_int)/(T_re-T_int));
  else
    deltaT_lnBetrieb = 0;
  end if;

  Hheat = n_heater*Q_Norm*(deltaT_lnBetrieb/deltaT_Norm)^n;

  //Calculation of Massflow/ReturnTemperature
  Hheat = n_heater*mFlow*cp_w*(T_sup-T_re);

  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
        coordinateSystem(preserveAspectRatio=false)),
    experiment(StopTime=400000, Interval=3600));
end calculation_MFlow_Input;
