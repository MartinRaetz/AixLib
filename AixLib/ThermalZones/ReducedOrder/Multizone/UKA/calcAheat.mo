within AixLib.ThermalZones.ReducedOrder.Multizone.UKA;
model calcAheat

 parameter Real AheatToAextRatio = 0.031 "Ratio of heater area to exterior wall area";
 // Factor was empirically obtained from images of UKA bed room
 Modelica.Blocks.Interfaces.RealInput A_ext(final unit="m2")
    "Exterior Wall Area"
 annotation (Placement(transformation(extent={{-18,-18},{18,18}},
        rotation=-90,
        origin={0,100}),
    iconTransformation(extent={{-10,-10},{10,10}},
        rotation=-90,
        origin={-2,90})));

 Modelica.Blocks.Interfaces.RealOutput A_heat(final unit="m2")
    "heater Area"
        annotation (Placement(transformation(extent={{17,-17},{-17,17}},
        rotation=90,
        origin={1,-97}),
    iconTransformation(extent={{-10,-10},{10,10}},
        rotation=-90,
        origin={0,-90})));

equation

A_heat = AheatToAextRatio * A_ext;

  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
        coordinateSystem(preserveAspectRatio=false)));
end calcAheat;
