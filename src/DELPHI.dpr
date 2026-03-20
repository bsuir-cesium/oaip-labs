program lab4;

uses
  SysUtils;

const
  n = 7;

  // 12AA3BA

type
  TMAS = array [0 .. n - 1] of char;

var
  S: TMAS;
  symbolResult: Boolean;

function InArray(var arr: TMAS; const el: char): Boolean;
var
  I: Integer;
  isTrue: Boolean;
begin
  isTrue := false;
  for I := 0 to n - 1 do
  begin
    if arr[I] = el then
    begin
      isTrue := true;
      break;
    end
  end;

  InArray := isTrue;
end;

procedure GenerateRandomChars(var S: TMAS);
var
  I: Integer;
  randomChar: char;
begin
  Randomize;
  write('Сгенерированная последовательность: ');
  for I := 0 to n - 1 do
  begin
    // Генерируем случайную букву латинского алфавита в верхнем регистре
    randomChar := Chr(Random(26) + 65);
    write(randomChar);
    S[I] := randomChar;
  end;
  writeln;
end;

procedure EnterChars(var S: TMAS);
var
  I: Integer;
  inputChar: char;
begin
  for I := 0 to n - 1 do
  begin
    write('Введите символ №', I + 1, ': ');
    readln(inputChar);
    S[I] := inputChar;
  end;
end;

function HasSymbol(const S: TMAS): Boolean;
var
  I, j, k: Integer;
  nextAppear: Integer;
  resultForSymbol, resultForArr, falseSymbol: Boolean;
  falseSymbols: TMAS;
begin
  for I := 0 to n - 1 do
    falseSymbols[I] := ' ';
  resultForArr := false;
  for I := 0 to n - 2 do
  begin
    falseSymbol := InArray(falseSymbols, S[I]);
    if falseSymbol then
      continue;

    nextAppear := I;
    resultForSymbol := false;
    for j := I + 1 to n - 1 do
    begin
      if (S[I] = S[j]) then
      begin
        if (j - nextAppear > 1) then
        begin
          for k := nextAppear + 1 to j - 1 do
          begin
            if (S[k] = 'A') or (S[k] = 'B') then
            begin
              resultForSymbol := true;
              break;
            end
          end;
        end
        else
        begin
          resultForSymbol := false;
          falseSymbols[I] := S[I];
          break;
        end;
        nextAppear := j;
      end;
    end;
    if resultForSymbol then
    begin
      resultForArr := true;
      break;
    end;
  end;
  if resultForArr then
    HasSymbol := true
  else
    HasSymbol := false;
end;

begin
  // GenerateRandomChars(S);
  EnterChars(S);

  symbolResult := HasSymbol(S);
  if symbolResult then
    writeln('Данная последовательность СОДЕРЖИТ специальный символ')
  else
    writeln('Данная последовательность НЕ СОДЕРЖИТ специальный символ');

  readln;

end.