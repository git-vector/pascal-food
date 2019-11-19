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
  addFood('dreher', 500);
  
  foods := getAllFood();

  if ( GetEnv('HTTP') <> '' ) then
    httpHeader();

  writeln('{ "foods": [');
  for i:= 0 to Length(foods) do
  begin
      if ( foods[i].name <> '' ) then
      begin
        if ( i > 0 ) then
          write(',');
        foods[i].toJson();
      end;
  end;
  writeln(']}');
  
end.