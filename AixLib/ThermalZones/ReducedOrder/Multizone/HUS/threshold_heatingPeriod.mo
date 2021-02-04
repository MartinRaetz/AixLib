within AixLib.ThermalZones.ReducedOrder.Multizone.HUS;
model threshold_heatingPeriod

  //parameter Real T_l(final unit="K") = 273.15 + 15 "Heating limit temperature"; //unused
  parameter Real t_spring(final unit="s") = 100000000 "Heating time in spring. amount of seconds between 1.1.2020 and 1.6.2020";
  parameter Real t_autumn(final unit="s") = 100000000 "Heating time in spring. amount of seconds between 1.1.2020 and 1.9.2020";

    Modelica.Blocks.Interfaces.RealOutput Heating_period_spring(final unit="s")
    "Heating period in spring during which heater is turned on"
 annotation (Placement(transformation(extent={{-18,-18},{18,18}},
        rotation=0,
        origin={100,60}),
    iconTransformation(extent={{-10,-10},{10,10}},
        rotation=0,
        origin={90,60})));
    Modelica.Blocks.Interfaces.RealOutput Heating_period_autumn(final unit="s")
    "Heating period in autumn during which heater is turned on"
 annotation (Placement(transformation(extent={{-18,-18},{18,18}},
        rotation=0,
        origin={100,-60}),
    iconTransformation(extent={{-10,-10},{10,10}},
        rotation=0,
        origin={90,-60})));
equation

  Heating_period_spring = t_spring;
  Heating_period_autumn = t_autumn;

  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
        coordinateSystem(preserveAspectRatio=false)));
end threshold_heatingPeriod;
