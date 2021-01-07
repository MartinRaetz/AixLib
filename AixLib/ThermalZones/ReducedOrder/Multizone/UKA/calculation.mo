within AixLib.ThermalZones.ReducedOrder.Multizone.UKA;
model calculation
  "Calculates heating power"

  parameter Real n(final unit="")= 1.2876 "Purme Hygiene Type 20 Radiators Height 60 Length 200 : empirical coefficent for radiator calculation (Heizkörperkoeffizient (https://www.energie-lexikon.info/heizkoerperexponent.html)";
  parameter Real Q_Norm( final unit="W")= 2170 "Purme Hygiene Type 20 Radiators Height 60 Length 200";
  parameter Real deltaT_Norm = 49.8 "Norm temperature difference";
  Real deltaT_lnBetrieb;

   Modelica.Blocks.Interfaces.RealInput T_int(final unit="K")
    "Inside air temperature"
    annotation (Placement(transformation(extent={{-17,-17},{17,17}},
        rotation=-90,
        origin={61,99}),
    iconTransformation(extent={{-10,-10},{10,10}},
        rotation=-90,
        origin={44,90})));

   Modelica.Blocks.Interfaces.RealInput T_sup(final unit="K")
    "supply temperature"
    annotation (Placement(transformation(extent={{-17,-17},{17,17}},
        rotation=0,
        origin={-99,35}),
    iconTransformation(extent={{-102,32},{-82,52}})));

  Modelica.Blocks.Interfaces.RealInput n_heater
    "number of heater"
    annotation (Placement(transformation(
        extent={{-18,-18},{18,18}},
        rotation=-90,
        origin={-58,98}), iconTransformation(
        extent={{-10,-10},{10,10}},
        rotation=-90,
        origin={-32,90})));

  Modelica.Blocks.Interfaces.RealOutput Hheat(final unit="W")
    "heater power"
    annotation (Placement(transformation(extent={{17,-17},{-17,17}},
        rotation=180,
        origin={101,-1}),
    iconTransformation(extent={{-10,-10},{10,10}},
        rotation=0,
        origin={90,16})));

   Modelica.Blocks.Interfaces.RealInput T_re(final unit="K")
    "return temperature"
    annotation (Placement(transformation(
        extent={{-17,-17},{17,17}},
        rotation=0,
        origin={-99,-77}), iconTransformation(extent={{-102,8},{-82,28}})));
equation

  // Fail-Save condition to prevent a mathematical error in the log function
  if noEvent(T_int < T_re and T_re < T_sup) then
    deltaT_lnBetrieb = (T_sup-T_re)/Modelica.Math.log((T_sup-T_int)/(T_re-T_int));
  else
    deltaT_lnBetrieb = 0;
  end if;

  Hheat = n_heater*Q_Norm*(deltaT_lnBetrieb/deltaT_Norm)^n;

  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
        coordinateSystem(preserveAspectRatio=false)),
    experiment(StopTime=400000, Interval=3600));
end calculation;
