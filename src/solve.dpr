program lab6;

const
  n = 6;

type
  TMatrix = array [1 .. n, 1 .. n] of Integer;
  TMAS = array [1 .. n] of Integer;

function InArray(var arr: TMAS; const el: Integer): Boolean;
var
  i: Integer;
begin
  for i := 1 to n do
  begin
    if arr[i] = el then
      exit(True);
  end;

  InArray := False;
end;

procedure SortArray(var arr: TMAS; count: Integer);
var
  i, j, temp: Integer;
begin
  for i := 1 to count - 1 do
  begin
    for j := i + 1 to count do
    begin
      if arr[i] > arr[j] then
      begin
        temp := arr[i];
        arr[i] := arr[j];
        arr[j] := temp;
      end;
    end;
  end;
end;

function AreRowsSimilar(var matrix: TMatrix; const row1, row2: Integer)
  : Boolean;
var
  set1, set2: TMAS;
  i, uniqueCount1, uniqueCount2: Integer;
  zero1, zero2: Boolean;
begin
  uniqueCount1 := 0;
  uniqueCount2 := 0;
  zero1 := True;
  zero2 := True;

  for I := 1 to n do
  begin
    set1[i] := 0;
    set2[i] := 0;
  end;

  for i := 1 to n do
  begin
    if ((matrix[row1][i] = 0) and zero1) then
    begin
      Inc(uniqueCount1);
      zero1 := False;
    end
    else if not InArray(set1, matrix[row1][i]) then
    begin
      Inc(uniqueCount1);
      set1[uniqueCount1] := matrix[row1][i];
    end;
    if ((matrix[row2][i] = 0) and zero2) then
    begin
      Inc(uniqueCount2);
      zero2 := False;
    end
    else if not InArray(set2, matrix[row2][i]) then
    begin
      Inc(uniqueCount2);
      set2[uniqueCount2] := matrix[row2][i];
    end;
  end;

  SortArray(set1, uniqueCount1);
  SortArray(set2, uniqueCount2);

  for i := 1 to n do
  begin
    if set1[i] <> set2[i] then
      exit(false);
  end;

  AreRowsSimilar := True;
end;

var
  X: TMatrix = (
    (1, 0, 0, 0, 0, 0),
    (2, 0, 0, 0, 0, 0),
    (3, 0, 0, 0, 0, 0),
    (3, 0, 0, 0, 0, 0),
    (2, 0, 0, 0, 0, 0),
    (1, 0, 0, 0, 0, 0)
  );
  i, j: Integer;
  similarCount: Integer;
  doneLines: TMAS;
  similar: Boolean;

begin
  similarCount := 0;
  for i := 1 to n - 1 do
  begin
    if doneLines[i] <> i then
    begin
      for j := i + 1 to n do
      begin
        similar := AreRowsSimilar(X, i, j);
        if similar then
        begin
          Inc(similarCount);
          doneLines[i] := i;
          WriteLn('Строки ', i, ' и ', j, ' похожи');
        end;
      end;
    end;
  end;

  if similarCount = 0 then
    WriteLn('Не нашлось похожих строк')
  else
    WriteLn('Итоговое кол-во похожих пар строк: ', similarCount);
  ReadLn;

end.