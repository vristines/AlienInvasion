program alien_detector;
uses crt;
var d,t,a,v,dist,dist_l,dist_a,dist_acc:int64;
    vmax:real;
const c=299792458;
      ly=9460730472580800;

begin
  t:=0;
  d:=0;
  v:=0;
  write('Distance of the alien planet (ly) : ');
  readln(dist);
  write('Travel speed of aliens (c) : ');
  readln(vmax);
  vmax:=c*vmax;
  write('Acceleration of alien spaceship (m/s) : ');
  readln(a);
  dist:=dist*ly;
  dist_l:=dist;
  dist_a:=dist;
// ZAKLADNI PROGRAM
  repeat
    t:=t+1;
    if (v<vmax) then
      begin
        v:=v+a;
        dist_acc:=dist_acc+v;
      end;
    dist_l:=dist_l-c;
    dist_a:=dist_a-v;
    {if ((t mod 86400)=trunc(t/86400)) then
      begin
        d:=d+1;
        clrscr;
        writeln('DAY       ',d);
        writeln('Velocity : ',v);
        writeln('Distance (spaceship) : ',dist_a);
        writeln('Distance (light) : ',dist_l);
        writeln('Difference : ',dist_a-dist_l);
      end;}
  until dist_l=0;
  writeln('First contact at ',((dist_a-dist_l)/149600000000):5:0,' AU (',((dist_a-dist_l)/1000000000000):5:0,' Gkm)');
  readkey;
end.