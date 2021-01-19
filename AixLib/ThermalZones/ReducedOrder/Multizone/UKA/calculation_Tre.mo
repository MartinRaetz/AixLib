within AixLib.ThermalZones.ReducedOrder.Multizone.UKA;
model calculation_Tre "Calculates heating power"

  parameter Real n(final unit="")= 1.2876 "Purme Hygiene Type 20 Radiators Height 60 Length 200 : empirical coefficent for radiator calculation (Heizkörperkoeffizient (https://www.energie-lexikon.info/heizkoerperexponent.html)";
  parameter Real Q_Norm( final unit="W")= 2170 "Purme Hygiene Type 20 Radiators Height 60 Length 200";
  parameter Real deltaT_Norm = 49.8 "Norm temperature difference";
  parameter Real cp_w(final unit="J/(kg.K)") = 4184;
  Real deltaT_lnBetrieb;

   Modelica.Blocks.Interfaces.RealInput T_int(final unit="K")
    "Inside air temperature"
    annotation (Placement(transformation(extent={{-17,-17},{17,17}},
        rotation=-90,
        origin={61,99}),
    iconTransformation(extent={{-12,-12},{12,12}},
        rotation=-90,
        origin={40,88})));

   Modelica.Blocks.Interfaces.RealInput T_sup(final unit="K")
    "supply temperature"
    annotation (Placement(transformation(extent={{-17,-17},{17,17}},
        rotation=0,
        origin={-91,33}),
    iconTransformation(extent={{-100,26},{-72,54}})));

  Modelica.Blocks.Interfaces.RealInput n_heater
    "number of heater"
    annotation (Placement(transformation(
        extent={{-18,-18},{18,18}},
        rotation=-90,
        origin={-58,98}), iconTransformation(
        extent={{-13,-13},{13,13}},
        rotation=-90,
        origin={-39,87})));

  Modelica.Blocks.Interfaces.RealOutput Hheat(final unit="W")
    "heater power"
    annotation (Placement(transformation(extent={{17,-17},{-17,17}},
        rotation=180,
        origin={99,35}),
    iconTransformation(extent={{-15,-15},{15,15}},
        rotation=0,
        origin={85,41})));

  Modelica.Blocks.Interfaces.RealInput T_re( final unit="K")
    annotation (Placement(transformation(extent={{-100,-60},{-60,-20}}),
        iconTransformation(extent={{-100,-56},{-68,-24}})));
  Modelica.Blocks.Interfaces.RealOutput mFlow( final unit="kg/s")
    annotation (Placement(transformation(extent={{70,-54},{100,-24}}),
        iconTransformation(extent={{68,-56},{100,-24}})));
equation

  // Fail-Save condition to prevent a mathematical error in the log function
  if noEvent(T_int < T_re and T_re < T_sup) then
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
end calculation_Tre;
