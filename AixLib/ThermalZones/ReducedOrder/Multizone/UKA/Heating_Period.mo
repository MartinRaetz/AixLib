within AixLib.ThermalZones.ReducedOrder.Multizone.UKA;
model Heating_Period

     Modelica.Blocks.Interfaces.BooleanOutput Heater_switch
    "Heater Switch: Off between 1.6. and 1.9."
        annotation (Placement(transformation(extent={{17,-17},{-17,17}},
        rotation=180,
        origin={101,-1}),
    iconTransformation(extent={{-10,-10},{10,10}},
        rotation=0,
        origin={90,16})));

    parameter Real year = 31536000 "amount of seconds in a non leap year";
    parameter Real Heating_period_spring(final unit="s") = 13219140 annotation(Evaluate=false); //"Heating time in spring -> turn heater off. amount of seconds between 1.1.2020 and 1.6.2020"
    parameter Real Heating_period_autumn(final unit="s") = 21167940 annotation(Evaluate=false); //"Heating time in autumn, turn heater on. amount of seconds between 1.1.2020 and 1.9.2020";
    Real eff_time "time that maxes out at a full year and begins at zero";


equation

  eff_time = time; //- (year*floor(time/year));

if Heating_period_spring < Heating_period_autumn then

  if eff_time < Heating_period_spring then

    Heater_switch = true;

  elseif eff_time > Heating_period_autumn then

    Heater_switch = true;

  else

    Heater_switch = false;

  end if;

elseif Heating_period_autumn < Heating_period_spring then

  if eff_time < Heating_period_autumn then

    Heater_switch = false;

  elseif eff_time > Heating_period_spring then

    Heater_switch = false;

  else

    Heater_switch = true;

  end if;

end if;

  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
        coordinateSystem(preserveAspectRatio=false)),
    Documentation(info="<html>
<p>This model turns the heater on in the heating period.</p>
<p>It is dependent on the simulation time. Default starting point is 1.January 2020. Heater turns off on 01.06.2020 and turns on again on 01.09.2020</p>
</html>"));
end Heating_Period;
