model FirstOrderInitial "A simple first order differential equation"
  Real x "State variable";
initial equation
  x = 2 "used before simulation to compute initial values";
equation
  der(x) = 1-x "drives values of x toward 1.0";
end FirstOrderInitial;
