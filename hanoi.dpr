program hanoi;

{mode $delphi}

procedure Hanoi(n: Integer; fromRod, toRod, auxRod: Char);
begin
  if n = 1 then
  begin
    Writeln('Disk: ', n, ' , ', fromRod, ' -> ', toRod);
    Exit;
  end;

  Hanoi(n - 1, fromRod, auxRod, toRod);
  Writeln('Disk: ', n, ' , ', fromRod, ' -> ', toRod);
  Hanoi(n - 1, auxRod, toRod, fromRod);
end;

var
  n: Integer;

begin
  Write('Enter the number of disks: ');
  Readln(n);

  Hanoi(n, 'A', 'C', 'B');
  Readln;
end.