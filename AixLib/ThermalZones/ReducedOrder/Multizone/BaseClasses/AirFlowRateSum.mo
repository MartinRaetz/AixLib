within AixLib.ThermalZones.ReducedOrder.Multizone.BaseClasses;
block AirFlowRateSum
  "Air flow rate for AHU and unit conversion"
  extends Modelica.Blocks.Icons.Block;

  parameter Integer dimension "Number of Zones";
  parameter Boolean withProfile = false
    "Profile or occupancy as control value for AHU" annotation(choices(
    choice =  false "Relative Occupation",choice = true "Profile",
    radioButtons = true));
  parameter AixLib.DataBase.ThermalZones.ZoneBaseRecord zoneParam[dimension]
    "Records of zones";
  parameter Real T = 10000;
  parameter Real TAirMax = 26+273.15;
  parameter Real VFlowMax = 21;
  Modelica.Blocks.Interfaces.RealInput profile
    "Input profile for AHU operation"
    annotation (Placement(transformation(extent={{-140,20},{-100,60}}),
    iconTransformation(extent={{-140,20},{-100,60}})));
  Modelica.Blocks.Interfaces.RealInput relOccupation[dimension]
    "Input for relative occupation"
    annotation (
    Placement(transformation(extent={{-140,-60},{-100,-20}}),
    iconTransformation(extent={{-140,-60},{-100,-20}})));
  Modelica.Blocks.Interfaces.RealOutput airFlow(final quantity="VolumeFlowRate",
    final unit="m3/s") "Air flow rate"
    annotation (Placement(transformation(extent={{100,-20},{140,20}}),
    iconTransformation(extent={{100,-20},{140,20}})));

  Modelica.Blocks.Interfaces.RealInput TAir[dimension] annotation (Placement(
        transformation(
        extent={{-20,-20},{20,20}},
        rotation=-90,
        origin={0,120})));

protected
  Real airFlowVector[dimension]
    "Sum of air flow in the zones";
  Real x[dimension](min=0,max=1);


initial equation
   for n in 1:dimension loop
      x[n] = 0;
    end for;

equation
  if withProfile then
    airFlowVector * 3600 = ((zoneParam.minAHU + (zoneParam.maxAHU -
    zoneParam.minAHU) * profile) .* zoneParam.AZone);
    for n in 1:dimension loop
      x[n] = 0;
    end for;

  else
    for n in 1:dimension loop
      if x[n] > 1 then
        der(x[n])= min(0,(TAir[n] - TAirMax)/T);
      elseif x[n] < 0 then
          der(x[n])= max(0,(TAir[n] - TAirMax)/T);
      else
        der(x[n])= (TAir[n] - TAirMax)/T;
      end if;
    end for;

    airFlowVector * 3600 = ((zoneParam.minAHU + (zoneParam.maxAHU -
    zoneParam.minAHU) .* relOccupation + x .* VFlowMax)  .* zoneParam.AZone);
  end if;
  (airFlow) =
    AixLib.ThermalZones.ReducedOrder.Multizone.BaseClasses.SumCondition(
    airFlowVector,
    zoneParam.withAHU,
    dimension);
    annotation (Placement(transformation(extent={{100,-80},{120,-60}})),
                Placement(transformation(extent={{100,-82},{120,-62}})),
              Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
            -100},{100,100}})),           Icon(coordinateSystem(
          preserveAspectRatio=false, extent={{-100,-100},{100,100}}),
          graphics={Text(
          extent={{-82,82},{78,-54}},
          lineColor={0,0,0},
          fillColor={170,213,255},
          fillPattern=FillPattern.Solid,
          textString="m3/(m2h)
->
m3/s")}),
    Documentation(info="<html><p>
  This model calculates the volume flow (e.g. for an Air Handling Unit)
  for supply of thermal zones dependent on:
</p>
<ul>
  <li>Which zone is supplied by the AHU
  </li>
  <li>A minimal volume flow (minAHU) in m3/(m2*h) per zone
  </li>
  <li>A maxmial volume flow (maxAHU = deltaAHU + minAHU) <span style=
  \"font-family: MS Shell Dlg 2;\">in m3/(m2*h) per zone</span>
  </li>
  <li>A given profile or relative occupation per zone
  </li>
</ul>
<p>
  A vector of <a href=
  \"AixLib.DataBase.ThermalZones.ZoneBaseRecord\">AixLib.DataBase.ThermalZones.ZoneBaseRecord</a>
  records is necessary to evaluate which zones are supplied by an AHU.
  As AHUs typically work with m3/s, the model calculates the output air
  flow rate in m3/s.
</p>
<h4>
  Typical use and important parameters
</h4>
<p>
  The governing equation is:
</p>
<p>
  airFlow = [minAHU + deltaAHU * (profile OR relative Occupation)] *
  Azone * 3600^-1
</p>
<p>
  All parameter come from the vector of <a href=
  \"AixLib.DataBase.ThermalZones.ZoneBaseRecord\">AixLib.DataBase.ThermalZones.ZoneBaseRecord</a>
  records. The model is typically used as input adapter for AHU model
  in <a href=
  \"AixLib.ThermalZones.ReducedOrder.Multizone.MultizoneEquipped\">AixLib.ThermalZones.ReducedOrder.Multizone.MultizoneEquipped</a>.
</p>
<ul>
  <li>September 27, 2016, by Moritz Lauster:<br/>
    Moved to fit to new Annex60 structure.
  </li>
  <li>February 26, 2016, by Moritz Lauster:<br/>
    To get the correct share of volume flow for each zone, more outputs
    are generated.
  </li>
  <li>October 30, 2015, by Moritz Lauster:<br/>
    Moved and adapted to AixLib. Some renaming and adding units.
  </li>
  <li>March 3, 2015, by Ole Odendahl:<br/>
    Added documentation and formatted appropriately
  </li>
</ul>
</html>"));
end AirFlowRateSum;
