
unit foodunit;

interface
type
	FoodObject = Object
	  name : string;
	  price: integer;

	  procedure toJson();
	end;
   Foods = array of FoodObject;

function getAllFood(): Foods;

procedure addFood(name:string; price:integer);

// private - - - - - - - - - - - - - - - - - - - - - - - - -
implementation
var
  allFood:  Foods;
  next: integer;
  pfood: ^FoodObject;

procedure FoodObject.toJson();
begin
  writeln('{ "name": "', name, '", "price":', price, ' }');
end;

function getAllFood(): Foods;
begin
	getAllFood := allFood;
end;

procedure addFood(name:string; price:integer);
begin
    new(pfood);
	pfood^.name := name;
	pfood^.price := price;
	allFood[next] := pfood^;
	next += 1;
end;

initialization
begin
  setLength(allFood, 20);
  addFood('pacal', 850);
  addFood('krumplis hal', 1200);
  addFood('hagymas bab', 990);
  addFood('palacsinta', 440);
  addFood('steak', 999);
end;

end.