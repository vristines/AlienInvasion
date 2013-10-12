program alien_detector;
uses crt;
var d,t,a,v,dist,dist_l,dist_s,dist_acc,diff:int64;
    vmax,t_r,t_s:real;
const c=299792458;
      ly=9460730472580800;

procedure init;
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
end;


procedure bug;
begin
clrscr;
writeln(t);
writeln(v);
writeln(t_s);
writeln(dist_l);
writeln(dist_s);
delay(100);
end;

procedure lightcontrol;
begin
  if dist_l=0 then
    begin
    diff:=dist_s-dist_l;
    t_r:=diff/v;
    end;
end;

procedure starting;
begin
  repeat
    t:=t+1;
    v:=v+a;
    dist_acc:=dist_acc+v;
    t_s:=t_s+(sqrt(1-((v*v)/(c*c))));
    dist_l:=dist_l-c;
    dist_s:=dist_s-v;
  until v>=vmax;
end;

procedure cruising;
begin
  repeat
    t:=t+1;
    t_s:=t_s+(sqrt(1-((v*v)/(c*c))));
    dist_l:=dist_l-c;
    dist_s:=dist_s-v;
    lightcontrol;
  until dist_s<dist_acc+1000000000;
end;

procedure stopping;
begin
  repeat
    t:=t+1;
    v:=v-a;
    t_s:=t_s+(sqrt(1-((v*v)/(c*c))));
    dist_l:=dist_l-c;
    dist_s:=dist_s-v;
    lightcontrol;
  until v<0;
end;

begin
  init;
  starting;
  cruising;
  stopping;
  writeln('First contact at ',diff/149600000000:0:0,' AU (',diff/1000000000000:0:0,' Gkm)');
  writeln('Minimal time to reach Earth : ',t_r:0:0,' s (',t_r/86400:0:0,' d)');
  writeln('Travel time for aliens : ',(t_s/86400):0:0,' d');
  readkey;
end.