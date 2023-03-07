
// the display module
module voltmeter()
{
   // origin: top center of front, digits on top
   color("dimgrey")
   {
      difference()
      {
         union()
         {
            translate([0.0, 0.0, -16.0/2 + 1.0])
               cube([44.9, 26.2, 16.0], center = true);
            translate([0.0, 0.0, 2.5/2])
               cube([47.7, 29.0, 2.5], center = true);
         }
         translate([0.0, 0.0, 10.0/2])
            cube([36.0, 18.2, 10.0], center = true);
         hull()
         {
            translate([0.0, 0.0, 1.0 + 1.0/2])
               cube([36.0, 18.2, 1.0], center = true);
            translate([0.0, 0.0, 2.5 + 1.0/2])
               cube([42.0, 22.2, 1.0], center = true);
         }
      }
      translate([ (44.9 - 2.0)/2, 0.0, -15.0 - 4.5/2 + 1.0])
         cube([2.0, 21.5, 5.5], center = true);
      translate([-(44.9 - 2.0)/2, 0.0, -15.0 - 4.5/2 + 1.0])
         cube([2.0, 21.5, 5.5], center = true);
   }

   color("red")
      translate([-40.0/2, -(19.5 + 22.0)/4, -10.0 - 0.5*1.5])
         rotate([0, 90, 0])
            cylinder(d = 1.5, h = 40.0, $fn = 12, center = true);
   color("dimgrey")
      translate([-40.0/2, -(19.5 + 22.0)/4, -10.0 - 1.5*1.5])
         rotate([0, 90, 0])
            cylinder(d = 1.5, h = 40.0, $fn = 12, center = true);
   color("yellow")
      translate([-40.0/2, -(19.5 + 22.0)/4, -10.0 - 2.5*1.5])
         rotate([0, 90, 0])
            cylinder(d = 1.5, h = 40.0, $fn = 12, center = true);
}


// the box for the display
module box()
{
   // origin: top center of front, digits on top
   color("orange")
   {
      difference()
      {
         // body of box
         hull()
         {
            translate([ (47.7 + 2.0)/2,  (29.0 + 2.0)/2, -0.0 - 2.0/2])
               sphere(d = 2.0, $fn = 12, center = true);
            translate([ (47.7 + 2.0)/2, -(29.0 + 2.0)/2, -0.0 - 2.0/2])
               sphere(d = 2.0, $fn = 12, center = true);
            translate([-(47.7 + 2.0)/2,  (29.0 + 2.0)/2, -0.0 - 2.0/2])
               sphere(d = 2.0, $fn = 12, center = true);
            translate([-(47.7 + 2.0)/2, -(29.0 + 2.0)/2, -0.0 - 2.0/2])
               sphere(d = 2.0, $fn = 12, center = true);
            
            translate([ (47.7 + 2.0)/2,  (29.0 + 12.0)/2, -20.0 + 2.0/2])
               sphere(d = 2.0, $fn = 12, center = true);
            translate([ (47.7 + 2.0)/2, -(29.0 + 12.0)/2, -20.0 + 2.0/2])
               sphere(d = 2.0, $fn = 12, center = true);
            translate([-(47.7 + 2.0)/2,  (29.0 + 12.0)/2, -20.0 + 2.0/2])
               sphere(d = 2.0, $fn = 12, center = true);
            translate([-(47.7 + 2.0)/2, -(29.0 + 12.0)/2, -20.0 + 2.0/2])
               sphere(d = 2.0, $fn = 12, center = true);
         }
         // volume for display
         translate([0.0, 0.0, -15.0/2])
            cube([44.9 + 0.6, 26.2 + 0.6, 15.0 + 1.0], center = true);
         translate([ (44.9 - 2.0)/2, 0.0, -15.0 - 4.5/2])
            cube([2.0 + 0.6, 21.5 + 2.0, 4.5 + 3.0], center = true);
         translate([-(44.9 - 2.0)/2, 0.0, -15.0 - 4.5/2])
            cube([2.0 + 0.6, 21.5 + 2.0, 4.5 + 3.0], center = true);
         translate([-40.0/2, -(19.5 + 22.0)/4, -10.0 - 1.5*1.5])
            cube([40.0, 1*1.5 + 1.5, 3*1.5 + 1.5], center = true);

         // spare out for catch nose
         translate([ (4.5 + 23.0)/4, 0.0, -2.5 - 5.0/2])
            cube([9.0 + 1.0, 26.2 + 2.0, 5.0], center = true);
         translate([-(4.5 + 23.0)/4, 0.0, -2.5 - 5.0/2])
            cube([9.0 + 1.0, 26.2 + 2.0, 5.0], center = true);
         
         // less material
         hull()
         {
            translate([0.0, 0.0, -2.5 - 2.0/2])
               cube([44.9 + 0.6, 26.2 + 0.6, 2.0], center = true);
            translate([0.0, 0.0, -18.0 + 2.0/2])
               cube([44.9 + 0.6, 26.2 + 9.1, 2.0], center = true);
         }
      }
   }
}
module show()
{
   difference()
   {
      union()
      {
         translate([0.0, 0.0, 0*20.0])
            voltmeter();
         translate([0.0, 0.0, 0.0])
            box();
      }
      translate([100.0/2, -100.0/2, 0.0])
         cube(100.0, center = true);
   }
}


module print()
{
   translate([0.0, 0.0, 20.0])
      box();
}


// show();
print();
