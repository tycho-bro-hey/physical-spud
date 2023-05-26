model FirstOrder "A simple first order differential equation"
  Real x "State variable";
equation
  der(x) = 1-x "drives values of x toward 1.0";
end FirstOrder;
