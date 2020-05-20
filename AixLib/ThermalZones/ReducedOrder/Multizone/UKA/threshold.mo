within AixLib.ThermalZones.ReducedOrder.Multizone.UKA;
model threshold

  parameter Real Hheat_0(final unit="W") = 0 "Heat Flux if heating limit temperature is reached";
  parameter Real T_l(final unit="K") = 273.15 + 15 "Heating limit temperature";

    Modelica.Blocks.Interfaces.RealOutput Hheat_zero(final unit="W")
    "Heat Flux"
 annotation (Placement(transformation(extent={{-18,-18},{18,18}},
        rotation=0,
        origin={98,46}),
    iconTransformation(extent={{-10,-10},{10,10}},
        rotation=0,
        origin={90,38})));

    Modelica.Blocks.Interfaces.RealOutput T_limit(final unit="K")
    "Heater Area"
 annotation (Placement(transformation(extent={{-18,-18},{18,18}},
        rotation=0,
        origin={98,-42}),
    iconTransformation(extent={{-10,-10},{10,10}},
        rotation=0,
        origin={90,-34})));

equation

  T_limit = T_l;
  Hheat_0 = Hheat_zero;


  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
        coordinateSystem(preserveAspectRatio=false)));
end threshold;
