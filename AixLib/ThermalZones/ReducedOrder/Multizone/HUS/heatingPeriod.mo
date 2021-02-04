within AixLib.ThermalZones.ReducedOrder.Multizone.HUS;
model heatingPeriod

     Modelica.Blocks.Interfaces.RealInput Heating_period_spring(final unit="s")
    "Heating period in spring during which heater is turned on"
 annotation (Placement(transformation(extent={{-18,-18},{18,18}},
        rotation=0,
        origin={-100,54}),
    iconTransformation(extent={{-10,-10},{10,10}},
        rotation=0,
        origin={-90,60})));

     Modelica.Blocks.Interfaces.RealInput Heating_period_autumn(final unit="s")
    "Heating period in autumn during which heater is turned on"
      annotation (Placement(transformation(extent={{-18,-18},{18,18}},
        rotation=0,
        origin={-100,-42}),
    iconTransformation(extent={{-10,-10},{10,10}},
        rotation=0,
        origin={-90,-60})));

     Modelica.Blocks.Interfaces.BooleanOutput Heater_switch
    "Heater Switch: Off between 1.6. and 1.9."
        annotation (Placement(transformation(extent={{17,-17},{-17,17}},
        rotation=180,
        origin={101,-1}),
    iconTransformation(extent={{-10,-10},{10,10}},
        rotation=0,
        origin={90,0})));

    parameter Real year = 31536000 "amount of seconds in a non leap year";

    Real eff_time "time that maxes out at a full year and begins at zero";

equation

  eff_time = time - (year*floor(time/year));

if eff_time < Heating_period_spring then

  Heater_switch = true;

  elseif eff_time > Heating_period_autumn then

  Heater_switch = true;

  else

  Heater_switch = false;

end if;

  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
        coordinateSystem(preserveAspectRatio=false)),
    Documentation(info="<html>
<p>This model turns the heater on in the heating period.</p>
<p>It is dependent on the simulation time. Default starting point is 1.January 2020. Heater turns off on 01.06.2020 and turns on again on 01.09.2020</p>
</html>"));
end heatingPeriod;
