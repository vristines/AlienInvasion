program alien_detector;
uses crt;
var d,t,a,v,dist,dist_l,dist_s,dist_acc:int64;
    vmax,t_s:real;
const c=299792458;
      ly=9460730472580800;

begin
  t:=0;
  t_s:=0;
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
  dist_s:=dist;
  repeat
    t:=t+1;
    if (v<vmax) then
      begin
        v:=v+a;
        dist_acc:=dist_acc+v;
      end;
    t_s:=t_s+(sqrt(1-((v*v)/(c*c))));
    dist_l:=dist_l-c;
    dist_s:=dist_s-v;
  until dist_l=0;
  writeln('First contact at ',((dist_s-dist_l)/149600000000):0:0,' AU (',((dist_s-dist_l)/1000000000000):0:0,' Gkm)');
  writeln('Minimal time to reach Earth : ',dist_s/v:0:0,' s (',dist_s/v/86400:0:0,' d)');
  writeln('Travel time of aliens : ',(t_s/86400):0:0,' d)');
  readkey;
end.