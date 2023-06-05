model spring_cylinder_test
  parameter Modelica.Thermal.FluidHeatFlow.Media.Air_30degC air_30degC annotation(
    Placement(visible = true, transformation(origin = {-84, -84}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  pneumaticSPUD pneumaticSPUD1 annotation(
    Placement(visible = true, transformation(origin = {59, 3}, extent = {{-37, -37}, {37, 37}}, rotation = 0)));
  compressorSPUD compressorSPUD1 annotation(
    Placement(visible = true, transformation(origin = {-18, 2}, extent = {{-26, -26}, {26, 26}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp(duration = 0.5, height = 9, offset = 0, startTime = 1) annotation(
    Placement(visible = true, transformation(origin = {-86, 2}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(compressorSPUD1.flowPort_b, pneumaticSPUD1.flowPort_a) annotation(
    Line(points = {{7, 3}, {30, 3}, {30, 4}}, color = {255, 0, 0}));
  connect(ramp.y, compressorSPUD1.u) annotation(
    Line(points = {{-74, 2}, {-66, 2}, {-66, 3}, {-42, 3}}, color = {0, 0, 127}));
  annotation(
    uses(Modelica(version = "4.0.0")));
end spring_cylinder_test;
