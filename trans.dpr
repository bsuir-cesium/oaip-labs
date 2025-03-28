program trans;

{mode $delphi}

procedure Swap(var a, b: Integer);
var
  temp: Integer;
begin
  temp := a;
  a := b;
  b := temp;
end;

procedure Permute(arr: array of Integer);
var
  left, right, counter: Integer;

  procedure PermuteRecursion(left, right: Integer);
  var
    i: Integer;
  begin
    if left = right then
    begin
      Write('№', counter:4, ': ');
      Inc(counter);
      for i := 0 to High(arr) do
        Write(arr[i], ' ');
      Writeln;
    end
    else
    begin
      for i := left to right do
      begin
        Swap(arr[left], arr[i]);
        PermuteRecursion(left + 1, right);
        Swap(arr[left], arr[i]); // backtrack
      end;
    end;
  end;

begin
  left := 0;
  right := High(arr);
  counter := 1;
  Writeln('All permutations of the array:');
  PermuteRecursion(left, right);
end;

var
  arr: array[0..3] of Integer = (1, 2, 3, 4);

begin
  Permute(arr);
  Readln;
end.