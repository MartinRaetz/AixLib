within AixLib.ThermalZones.ReducedOrder.Multizone.UKA;
model threshold

  parameter Real Hheat_0(final unit="W") = 0 "Heat Flux if heating limit temperature is reached";
  parameter Real T_l(final unit="K") = 273.15 + 15 "Heating limit temperature";
  parameter Real t_spring(final unit="s") = 13219140 "Heating time in spring. amount of seconds between 1.1.2020 and 1.6.2020";
  parameter Real t_autumn(final unit="s") = 21167940 "Heating time in spring. amount of seconds between 1.1.2020 and 1.9.2020";


    Modelica.Blocks.Interfaces.RealOutput Hheat_zero(final unit="W")
    "Heat Flux"
 annotation (Placement(transformation(extent={{-18,-18},{18,18}},
        rotation=0,
        origin={98,62}),
    iconTransformation(extent={{-10,-10},{10,10}},
        rotation=0,
        origin={90,62})));

    Modelica.Blocks.Interfaces.RealOutput T_limit(final unit="K")
    "Heater Area"
 annotation (Placement(transformation(extent={{-18,-18},{18,18}},
        rotation=0,
        origin={98,34}),
    iconTransformation(extent={{-10,-10},{10,10}},
        rotation=0,
        origin={90,16})));

    Modelica.Blocks.Interfaces.RealOutput Heating_period_spring(final unit="s")
    "Heating period in spring during which heater is turned on"
 annotation (Placement(transformation(extent={{-18,-18},{18,18}},
        rotation=0,
        origin={98,-22}),
    iconTransformation(extent={{-10,-10},{10,10}},
        rotation=0,
        origin={90,-34})));
    Modelica.Blocks.Interfaces.RealOutput Heating_period_autumn(final unit="s")
    "Heating period in autumn during which heater is turned on"
 annotation (Placement(transformation(extent={{-18,-18},{18,18}},
        rotation=0,
        origin={98,-64}),
    iconTransformation(extent={{-10,-10},{10,10}},
        rotation=0,
        origin={90,-72})));
equation

  T_limit = T_l;
  Hheat_0 = Hheat_zero;
  Heating_period_spring = t_spring;
  Heating_period_autumn = t_autumn;

  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
        coordinateSystem(preserveAspectRatio=false)));
end threshold;
