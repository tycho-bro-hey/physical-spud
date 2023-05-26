model SampleAndHold "Measure speed and hold"
  extends SecondOrderSystem;
  parameter Real sample_time(unit="s")=0.05;
  discrete Real omega1_measured;
  discrete Real omega2_measured;
equation
  when sample(0,sample_time) then
    omega1_measured = omega1;
    omega2_measured = omega2;
  end when;
end SampleAndHold;
