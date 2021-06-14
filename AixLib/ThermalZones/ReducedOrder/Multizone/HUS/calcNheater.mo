within AixLib.ThermalZones.ReducedOrder.Multizone.HUS;
model calcNheater
  "Calculates the number of heaters"

 parameter Real heightAext = 4.25 "height of outer wall";
 parameter Real radiatorLengthPlusSpacer = 2.4 "assumption by taking one typical isolation care room";
 // Factor was empirically obtained from images of UKA bed room
 parameter Real defaultRadiatorsPerSquaremeter = 0.07068 "If no outer wall exists, the number of heaters is calculated with the room area and a specific scaling factor";

 Modelica.Blocks.Interfaces.RealInput A_ext(final unit="m2")
    "Exterior Wall Area"
    annotation (Placement(transformation(extent={{-18,-18},{18,18}},
        rotation=-90,
        origin={-50,100}),
    iconTransformation(extent={{-10,-10},{10,10}},
        rotation=-90,
        origin={-60,90})));

 Modelica.Blocks.Interfaces.RealOutput n_heater
    "number of heaters"
    annotation (Placement(transformation(extent={{17,-17},{-17,17}},
        rotation=90,
        origin={1,-99}),
    iconTransformation(extent={{-10,-10},{10,10}},
        rotation=-90,
        origin={0,-90})));

 Modelica.Blocks.Interfaces.RealInput AZone(final unit="m2") "Zone Area"
    annotation (Placement(transformation(
        extent={{-18,-18},{18,18}},
        rotation=-90,
        origin={30,100}), iconTransformation(
        extent={{-10,-10},{10,10}},
        rotation=-90,
        origin={60,90})));
equation

  if A_ext > 0 then
    n_heater = A_ext/(heightAext*radiatorLengthPlusSpacer);
  else
    n_heater = defaultRadiatorsPerSquaremeter * AZone;
  end if
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
        coordinateSystem(preserveAspectRatio=false)));
end calcNheater;
