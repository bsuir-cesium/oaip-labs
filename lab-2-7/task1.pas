unit task1;

interface

type
  TCharSet = Set of Char;

procedure Solve;

implementation

uses
  SysUtils;

{$APPTYPE CONSOLE}


procedure Solve();
Var
  Glasn, FirSet, SecSet: TCharSet;
  InpStr, Words: AnsiString;
  i, k: Integer;
begin
  Glasn := ['а', 'е', 'и', 'о', 'у', 'ы', 'э', 'ю', 'я'];
  i := 1;
  k := 1;
  FirSet := [];
  SecSet := [];
  Write('Введите слова: ');
  Readln(InpStr);
  while InpStr[i] <> '.' do
  begin
    Words := Words + InpStr[i];
    if (InpStr[i] in Glasn) and (InpStr[i] in FirSet) and
      ((Pos(InpStr[i], Words) + k) = i) then
    begin
      Include(SecSet, AnsiChar(InpStr[i]));
    end;
    if (InpStr[i] in Glasn) and not(InpStr[i] in FirSet) then
    begin
      Include(FirSet, AnsiChar(InpStr[i]));
    end;
    if (InpStr[i] = ',') then
    begin
      k := i;
      Words := '';
    end;
    Inc(i);
  end;
  Write('Гласные: ');
  for i := 0 to 255 do
    if AnsiChar(i) in SecSet then
      Write(AnsiChar(i) + ';');
  Writeln;
end;

end.
