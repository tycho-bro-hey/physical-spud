model pneumatic_test
  Modelica.Mechanics.Translational.Components.Spring spring(c = 5, s_rel(displayUnit = "mm", start = 0.03800000000000001), s_rel0(displayUnit = "mm") = 0.03800000000000001) annotation(
    Placement(visible = true, transformation(origin = {26, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.Translational.Components.Fixed fixed annotation(
    Placement(visible = true, transformation(origin = {68, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Thermal.FluidHeatFlow.Components.Cylinder cylinder(A = 0.0005, L(displayUnit = "mm") = 0.03810000000000001, medium = air_30degC, s(displayUnit = "mm", start = 0.04500000000000001)) annotation(
    Placement(visible = true, transformation(origin = {-16, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  parameter Modelica.Thermal.FluidHeatFlow.Media.Air_30degC air_30degC annotation(
    Placement(visible = true, transformation(origin = {-80, -84}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Thermal.FluidHeatFlow.Sources.Ambient ambient(constantAmbientPressure (displayUnit = "bar")= 700, medium = air_30degC) annotation(
    Placement(visible = true, transformation(origin = {-58, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
equation
  connect(ambient.flowPort, cylinder.flowPort) annotation(
    Line(points = {{-48, 0}, {-26, 0}}, color = {255, 0, 0}));
  connect(cylinder.flange, spring.flange_a) annotation(
    Line(points = {{-6, 0}, {16, 0}}, color = {0, 127, 0}));
  connect(spring.flange_b, fixed.flange) annotation(
    Line(points = {{36, 0}, {68, 0}}, color = {0, 127, 0}));
  annotation(
    uses(Modelica(version = "4.0.0")));
end pneumatic_test;
