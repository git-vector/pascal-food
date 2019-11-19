program Menu
;

uses
  foodunit, dos;

var 
  i: integer;
  foods: foodunit.Foods;

procedure httpHeader();
begin
  writeln('Content-type: application/json');
  writeln('');
end;

begin
  foods := getAllFood();

  if ( GetEnv('HTTP') <> '' ) then
    httpHeader();

  writeln('{ "foods": [');
  for i:= 0 to 3 do
  begin
      if ( i > 0 ) then
          write(',');
      foods[i].toJson();
  end;
  writeln(']}');
  
end.