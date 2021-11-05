Unit MKMisc;

{$I MKB.Def}

Interface

Procedure SetLFlag(Var L: Integer; Bit: Byte; Setting: Boolean);
Function  GetLFlag(L: Integer; Bit: Byte): Boolean;
Procedure SetWFlag(Var L: Word; Bit: Byte; Setting: Boolean);
Function  GetWFlag(L: Word; Bit: Byte): Boolean;
Procedure SetBFlag(Var L: Byte; Bit: Byte; Setting: Boolean);
Function  GetBFlag(L: Byte; Bit: Byte): Boolean;
Function  StrCRC(Str: String): Integer;
Function  NameCRC(Str: String): Integer;
Procedure UpdateWordFlag(Var Flag: Word; Mask: Word; Setting: Boolean);
Function  DTToUnixDate(DT: TDateTime): Integer;
Procedure UnixToDt(SecsPast: Integer; Var DT: TDateTime);

Function  GregorianToJulian(DT: TDateTime): Integer;
{
Function  ValidDate(DT: TDateTime): Boolean;
Function  ToUnixDate(FDate: Integer): Integer;
Function  ToUnixDateStr(FDate: Integer): String;
Function  FromUnixDateStr(S: String): Integer;
}
Procedure JulianToGregorian(JulianDN : Integer; Var Year, Month,
  Day : SmallInt);
(*
Function  DaysAgo(DStr: String): Integer;
*)
procedure PackTime(DT: TDateTime; var Dos: Integer);

Implementation


Uses
  Crc32, sysutils;


Const
   C1970 = 2440588;
   D0 =    1461;
   D1 =  146097;
   D2 = 1721119;

(*
Function DaysAgo(DStr: String): Integer;
  Var
    {$IFDEF WINDOWS}
    ODate: TDateTime;
    CDate: TDateTime;
    {$ELSE}
    ODate: DateTime;
    CDate: DateTime;
    {$ENDIF}
    Tmp: Word;

  Begin
  GetDate(CDate.Year, CDate.Month, CDate.Day, Tmp);
  CDate.Hour := 0;
  CDate.Min := 0;
  CDate.Sec := 0;
  ODate.Year := Str2Long(Copy(DStr,7,2));
  If ODate.Year < 80 Then
    Inc(ODate.Year, 2000)
  Else
    Inc(ODate.Year, 1900);
  ODate.Month := Str2Long(Copy(DStr,1,2));
  ODate.Day := Str2Long(Copy(DStr, 4, 2));
  ODate.Hour := 0;
  ODate.Min := 0;
  ODate.Sec := 0;
  DaysAgo := GregorianToJulian(CDate) - GregorianToJulian(ODate);
  End;
*)

Function NameCRC(Str: String): Integer;
  Var
    L: Integer;

  Begin
  L := StrCrc(Str);
  If ((L >= 0) and (L < 16)) Then
    Inc(L,16);
  NameCrc := L;
  End;


Function StrCRC(Str: String): Integer;
  Var
    b: byte;
  Begin
  Result := $ffffffff;
  for b := 1 to Length(Str) Do
    Result := UpdC32(Ord(UpCase(Str[b])),Result);
  End;


Procedure SetLFlag(Var L: Integer; Bit: Byte; Setting: Boolean);
  Var
    Mask: Integer;

  Begin
  Mask := 1;
  Mask := Mask Shl (Bit - 1);
  If Setting Then
    L := L or Mask
  Else
    L := (L and (Not Mask));
  End;


Function GetLFlag(L: Integer; Bit: Byte): Boolean;
  Var
    Mask: Integer;

  Begin
  Mask := 1;
  Mask := Mask Shl (Bit - 1);
  If (L and Mask) = 0 Then
    GetLFlag := False
  Else
    GetLFlag := True;
  End;


Procedure SetWFlag(Var L: Word; Bit: Byte; Setting: Boolean);
  Var
    Mask: Word;

  Begin
  Mask := 1;
  Mask := Mask Shl (Bit - 1);
  If Setting Then
    L := L or Mask
  Else
    L := (L and (Not Mask));
  End;


Function GetWFlag(L: Word; Bit: Byte): Boolean;
  Var
    Mask: Word;

  Begin
  Mask := 1;
  Mask := Mask Shl (Bit - 1);
  If (L and Mask) = 0 Then
    GetWFlag := False
  Else
    GetWFlag := True;
  End;


Procedure SetBFlag(Var L: Byte; Bit: Byte; Setting: Boolean);
  Var
    Mask: Byte;

  Begin
  Mask := 1;
  Mask := Mask Shl (Bit - 1);
  If Setting Then
    L := L or Mask
  Else
    L := (L and (Not Mask));
  End;


Function GetBFlag(L: Byte; Bit: Byte): Boolean;
  Var
    Mask: Byte;

  Begin
  Mask := 1;
  Mask := Mask Shl (Bit - 1);
  If (L and Mask) = 0 Then
    GetBFlag := False
  Else
    GetBFlag := True;
  End;

Function GregorianToJulian(DT: TDateTime): Integer;
Var
  Century: Integer;
  XYear: Integer;
  Temp: Integer;
  Month: Integer;

  Year, WMonth, Day: Word;
  Begin
  DecodeDate(DT, Year, WMonth, Day);
  Month := WMonth;
  If Month <= 2 Then
    Begin
    Dec(Year);
    Inc(Month,12);
    End;
  Dec(Month,3);
  Century := Year Div 100;
  XYear := Year Mod 100;
  Century := (Century * D1) shr 2;
  XYear := (XYear * D0) shr 2;
  GregorianToJulian :=  ((((Month * 153) + 2) div 5) + Day) + D2
    + XYear + Century;
  End;


Procedure JulianToGregorian(JulianDN : Integer; Var Year, Month,
  Day : SmallInt);

  Var
    Temp,
    XYear: Integer;
    YYear,
    YMonth,
    YDay: SmallInt;

  Begin
  Temp := (((JulianDN - D2) shl 2) - 1);
  XYear := (Temp Mod D1) or 3;
  JulianDN := Temp Div D1;
  YYear := (XYear Div D0);
  Temp := ((((XYear mod D0) + 4) shr 2) * 5) - 3;
  YMonth := Temp Div 153;
  If YMonth >= 10 Then
    Begin
    YYear := YYear + 1;
    YMonth := YMonth - 12;
    End;
  YMonth := YMonth + 3;
  YDay := Temp Mod 153;
  YDay := (YDay + 5) Div 5;
  Year := YYear + (JulianDN * 100);
  Month := YMonth;
  Day := YDay;
  End;

Procedure UnixToDt(SecsPast: Integer; Var Dt: TDateTime);
  Var
    DateNum: Integer;
    Year, Month, Day, Hour, Min, Sec: SmallInt;
  Begin
  Datenum := (SecsPast Div 86400) + c1970;
  JulianToGregorian(DateNum, Year, Month, Day);
  SecsPast := SecsPast Mod 86400;
  Hour := SecsPast Div 3600;
  SecsPast := SecsPast Mod 3600;
  Min := SecsPast Div 60;
  Sec := SecsPast Mod 60;

  try
    DT := EncodeDate(Year, Month, Day)+EncodeTime(Hour, Min, Sec, 0);
  except
    on EConvertError do
      DT := 0;
  end;
  End;

Function DTToUnixDate(DT: TDateTime): Integer;
   Var
     SecsPast, DaysPast: Integer;

     Hour, Min, Sec, H: Word;
  Begin
  DaysPast := GregorianToJulian(DT) - c1970;
  SecsPast := DaysPast * 86400;
  DecodeTime(DT, Hour, Min, Sec, H);
  SecsPast := SecsPast + (Integer(Hour) * 3600) + (Min * 60) + (Sec);
  DTToUnixDate := SecsPast;
  End;

(*
Function ToUnixDate(FDate: Integer): Integer;
  Begin
  ToUnixDate := DTToUnixDate(FileDateToDateTime(Fdate));
  End;

Function ToUnixDateStr(FDate: Integer): String;
  Var
  SecsPast: Integer;
  S: String;

  Begin
  SecsPast := ToUnixDate(FDate);
  S := '';
  While (SecsPast <> 0) And (Length(s) < 255) DO
    Begin
    s := Chr((secspast And 7) + $30) + s;
    secspast := (secspast Shr 3)
    End;
  s := '0' + s;
  ToUnixDateStr := S;
  End;


Function FromUnixDateStr(S: String): Integer;
  Var
    {$IFDEF WINDOWS}
    DT: TDateTime;
    {$ELSE}
    DT: DateTime;
    {$ENDIF}
    secspast, datenum: Integer;
    n: WORD;

  Begin
  SecsPast := 0;
  For n := 1 To Length(s) Do
    SecsPast := (SecsPast shl 3) + Ord(s[n]) - $30;
  Datenum := (SecsPast Div 86400) + c1970;
  JulianToGregorian(DateNum, SmallInt(DT.Year), SmallInt(DT.Month),
    SmallInt(DT.day));
  SecsPast := SecsPast Mod 86400;
  DT.Hour := SecsPast Div 3600;
  SecsPast := SecsPast Mod 3600;
  DT.Min := SecsPast Div 60;
  DT.Sec := SecsPast Mod 60;
  PackTime(DT, SecsPast);
  FromUnixDateStr := SecsPast;
  End;


{$IFDEF WINDOWS}
Function ValidDate(DT: TDateTime): Boolean;
{$ELSE}
Function ValidDate(DT: DateTime): Boolean;
{$ENDIF}
  Const
    DOM: Array[1..12] of Byte = (31,29,31,30,31,30,31,31,30,31,30,31);

  Var
    Valid: Boolean;

  Begin
  Valid := True;
  If ((DT.Month < 1) Or (DT.Month > 12)) Then
    Valid := False;
  If Valid Then
    If ((DT.Day < 1) Or (DT.Day > DOM[DT.Month])) Then
      Valid := False;
  If ((Valid) And (DT.Month = 2) And (DT.Day = 29)) Then
    If ((DT.Year Mod 4) <> 0) Then
      Valid := False;
  ValidDate := Valid;
  End;
*)

Procedure UpdateWordFlag(Var Flag: Word; Mask: Word; Setting: Boolean);
  Begin
  If Setting Then
    Flag := Flag or Mask
  Else
    Flag := Flag and (Not Mask);
  End;

procedure PackTime(DT: TDateTime; var Dos: Integer);
begin
  Dos := DateTimeToFileDate(DT);
end;

End.
