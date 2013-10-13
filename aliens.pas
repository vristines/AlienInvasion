program alien_detector;
uses crt;
var d,t,a,v,dist,dist_l,dist_s,dist_acc,diff:int64;
    vmax,t_r,t_s:real;
const c=299792458;
      ly=9460730472580800;

procedure init;
var check:boolean;
begin
  t:=0;
  t_s:=0;
  d:=0;
  v:=0;
  repeat
    write('Distance of the alien planet (ly) : ');
    readln(dist);
    if dist>975 then
      begin
        writeln('Distance is unfortunately too high, try to set lower value...');
        delay(2000);
        check:=false;
      end
    else check:=true;
    vmax:=c*vmax;
    clrscr;
  until check=true;
  repeat
    write('Travel speed of aliens (c) : ');
    readln(vmax);
    if vmax>=1 then
      begin
        writeln('Speed must be lower than speed of light - insert number lower than 1');
        delay(2000);
        check:=false;
      end
    else check:=true;
    clrscr;
  until check=true;
  vmax:=c*vmax;
  write('Acceleration of alien spaceship (m/s) : ');
  readln(a);
  dist:=dist*ly;
  dist_l:=dist;
  dist_s:=dist;
  clrscr;
end;

procedure lightcontrol;
begin
  if dist_l=0 then
    begin
    diff:=dist_s-dist_l;
    t_r:=diff/v;
    writeln('Y ',trunc(t/86000/365),' D ',trunc((t mod 86000)/365),' : This is first moment, when we can detect start of alien spaceship.');
    end;
end;



procedure starting;
begin
  writeln('Y ',trunc(t/86000/365),' D ',trunc((t mod 86000)/365),' : Aliens are leaving their home system.');
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
  writeln('Y ',trunc(t/86000/365),' D ',trunc((t mod 86000)/365),' : Alien spaceship reached maximal velocity of ',vmax:0:0,' m/s.');
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
  writeln('Y ',trunc(t/86000/365),' D ',trunc((t mod 86000)/365),' : Alien spaceship is slowing.');
  repeat
    t:=t+1;
    v:=v-a;
    t_s:=t_s+(sqrt(1-((v*v)/(c*c))));
    dist_l:=dist_l-c;
    dist_s:=dist_s-v;
    lightcontrol;
  until v<0;
  writeln('Y ',trunc(t/86000/365),' D ',trunc((t mod 86000)/365),' : Alien spaceship is here...');
end;

begin
  init;
  starting;
  cruising;
  stopping;
  writeln('----------------------------------------------');
  writeln('First contact at ',diff/149600000000:0:0,' AU (',diff/1000000000000:0:0,' Gkm)');
  writeln('Minimal time to reach Earth : ',t_r:0:0,' s (',t_r/86400:0:0,' d)');
  writeln('Travel time for aliens : ',(t_s):0:0,' s (',(t_s/86400):0:0,' d)');
  readkey;
end.