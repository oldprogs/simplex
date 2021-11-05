Unit MKString;
{$I MKB.Def}

{
     MKString - Copyright 1993 by Mark May - MK Software
     You are free to use this code in your programs, however
     it may not be included in Source/TPU function libraries
     without my permission.

     Mythical Kingom Tech BBS (513)237-7737 HST/v32
     FidoNet: 1:110/290
     Rime: ->MYTHKING
     You may also reach me at maym@dmapub.dma.org
}




Interface

Function LoCase(Ch: Char): Char;
Function padright(st:string;ch:char;l:SmallInt):string;
Function PadLeft(St:String;Ch:Char;L:SmallInt): String;
function striplead(st:string;ch:char):string;
Function StripTrail(St:String;Ch:Char):String;
Function StripBoth(St:String;Ch:Char):String;
Function Upper(St:String):String;
Function Lower(St:String):String;
Function Proper(St:String):String;
Function WWrap(St:String; Max:Byte):String;
function ExtractWord(Str : String; N : SmallInt) : String;
Function WordCount(Str : String) : SmallInt;
Function CommaStr(Number: Integer): String;
Function Long2Str(Number: Integer): String;
Function Bin2Str(Number: Byte): String;
Function Str2Bin(St: String): Byte;
Function Str2Long(St: String): Integer;
Function HexLong(Number:Integer): String;
Function HexStr(Number: Word): String;
Function HexByte(Number: Byte): String;
{Function DateStr(DosDate: Integer): String;
Function TimeStr(DosDate: Integer): String;}
Procedure AddBackSlash(Var InPath: String);
Function WithBackSlash(InPath: String): String;
{Function FormattedDate(DT: TDateTime; Mask: String): String;}
(*
Function FormattedDosDate(DosDate: Integer; Mask:String): String;
*)
Function DOWStr(Dow: Word): String;
Function DOWShortStr(DOW: Word): String;
{Function ReformatDate(ODate: String; Mask: String): String;
Function LongDate(DStr: String): Integer;}
Function TimeStr2Word(TS: String): Word;
Function Word2TimeStr(CTime: Word): String;
Function MonthStr(MonthNo: Word): String;
Function Az2Str(Var Str: String; MaxLen: Byte): String; {Convert asciiz to string}
Procedure Str2Az(Str: String; MaxLen: Byte; Var AZStr); {Convert string to asciiz}
Function MKDateToStr(MKD: String): String; {Convert YYMMDD to MM-DD-YY}
Function StrToMKDate(Str: String): String; {Convert MM-DD-YY to YYMMDD}
Function CleanChar(InChar: Char): Char;
Function IsNumeric(Str: String): Boolean;
Function PosLastChar(Ch: Char; St: String): Word;

function StripRE(S: string): string;

Const
  CommaChar: Char = ',';

Var
  ExtraString: String;

Implementation

uses sysutils,dialogs;

Function LoCase(Ch: Char): Char;
  Begin
  If (Ch in ['A'..'Z']) Then
    LoCase := Chr(Ord(Ch) + 32)
  Else
    LoCase := Ch;
  End;


Procedure AddBackSlash(Var InPath: String);
  Begin
  If Length(InPath) > 0 Then
    Begin
    If InPath[Length(InPath)] <> '\' Then
      AppendStr(InPath, '\');
    End;
  End;


Function WithBackSlash(InPath: String): String;
  Begin
  AddBackSlash(InPath);
  WithBackSlash := InPath;
  End;


Function Bin2Str(Number: Byte): String;
  Var
    Temp1: Byte;
    Temp2: Byte;
    i: Word;
    TempStr: String[8];

  Begin
  Temp1 := 0;
  Temp2 := $80;
  For i := 1 to 8 Do
    Begin
    If (Number and Temp2) <> 0 Then
      TempStr[i] := '1'
    Else
      TempStr[i] := '0';
    Temp2 := Temp2 shr 1;
    End;
  TempStr[0] := #8;
  Bin2Str := TempStr;
  End;


Function Str2Bin(St: String): Byte;
  Var
    i: Word;
    Temp1: Byte;
    Temp2: Byte;

  Begin
  St := StripBoth(St,' ');
  St := PadLeft(St,'0',8);
  Temp1 := 0;
  Temp2 := $80;
  For i := 1 to 8 Do
    Begin
    If St[i] = '1' Then
      Inc(Temp1,Temp2);
    Temp2 := Temp2 shr 1;
    End;
  Str2Bin := Temp1;
  End;


Function Str2Long(St: String): Integer;
  Var
   i: Integer;
   Temp: Integer;

  Begin
  St := StripBoth(St,' ');
  Val(St,Temp,i);
  If i = 0 Then
    Str2Long := Temp
  Else
    Str2Long := 0;
  End;


Function DateStr(DosDate: Integer): String;
  Var
    DT:TDateTime;
    OutStr: String[8];
    TempStr: String[8];

  Begin
    {Result}DateStr := 'Петросян идиот';
    {delphi
    UnPackTime(DosDate,DT);
    Str(DT.Month:2,TempStr);
    If TempStr[1] = ' ' Then
      OutStr[1] := '0'
    Else
      OutStr[1] := TempStr[1];
    OutStr[2] := TempStr[2];
    OutStr[3] := '-';
    Str(DT.Day:2,TempStr);
    If TempStr[1] = ' ' Then
      OutStr[4] := '0'
    Else
      OutStr[4] := TempStr[1];
    OutStr[5] := TempStr[2];
    OutStr[6] := '-';
    Str(DT.Year:4,TempStr);
    If TempStr[3] = ' ' Then
      OutStr[7] := '0'
    Else
      OutStr[7] := TempStr[3];
    OutStr[8] := TempStr[4];
    OutStr[0] := #8;
    DateStr := OutStr;}
  End;

Function TimeStr(DosDate: Integer): String;
  Var
    DT: TDateTime;
    OutStr: String[8];
    TempStr: String[8];

  Begin
    {Result}TimeStr := 'Петросян маньяк';
    {delphi
    UnPackTime(DosDate,DT);
    Str(DT.Hour:2,TempStr);
    If TempStr[1] = ' ' Then
      OutStr[1] := '0'
    Else
      OutStr[1] := TempStr[1];
    OutStr[2] := TempStr[2];
    OutStr[3] := ':';
    Str(DT.Min:2,TempStr);
    If TempStr[1] = ' ' Then
      OutStr[4] := '0'
    Else
      OutStr[4] := TempStr[1];
    OutStr[5] := TempStr[2];
    OutStr[6] := ':';
    Str(DT.Sec:2,TempStr);
    If TempStr[1] = ' ' Then
      OutStr[7] := '0'
    Else
      OutStr[7] := TempStr[1];
    OutStr[8] := TempStr[2];
    OutStr[0] := #8;
    TimeStr := OutStr;}
  End;


Function HexByte(Number: Byte): String;
  Var
    HChar: Char;
    LChar: Char;

  Begin
  LChar := Chr((Number And $F) + 48);
  If LChar > '9' Then
    LChar := Chr(Ord(LChar) + 7);
  HChar := Chr((Number shr 4) + 48);
  If HChar > '9' Then
    HChar := Chr(Ord(HChar) + 7);
  HexByte := HChar + LChar;
  End;


Function HexStr(Number: Word): String;
  Begin
  HexStr := HexByte(Number Shr 8) + HexByte(Number And $FF);
  End;


Function HexLong(Number: Integer): String;
  Type
    WordRec = Record
      Lo: Word;
      Hi: Word;
    End;

  Begin
  HexLong := HexStr(WordRec(Number).Hi) + HexStr(WordRec(Number).Lo);
  End;


Function Long2Str(Number: Integer): String;
  Var
    TempStr: String;

  Begin
  Str(Number,TempStr);
  Long2Str := TempStr;
  End;


Function CommaStr(Number: Integer): String;
  Var
    StrPos: SmallInt;
    NumberStr: String;

  Begin
  NumberStr := Long2Str(Number);
  StrPos := Length(NumberStr) - 2;
  While StrPos > 1 Do
    Begin
    Insert(',',NumberStr,StrPos);
    StrPos := StrPos - 3;
    End;
  CommaStr := NumberStr;
  End;





Function wordcount(str : string) : SmallInt;

  var
    count : SmallInt;
    i : SmallInt;
    len : SmallInt;

  begin
  len := length(str);
  count := 0;
  i := 1;
  while i <= len do
    begin
    while ((i <= len) and ((str[i] = #32) or (str[i] = #9) or (Str[i] = ';'))) do
      inc(i);
    if i <= len then
      inc(count);
    while ((i <= len) and ((str[i] <> #32) and (str[i] <> #9) and (Str[i] <> ';'))) do
      inc(i);
    end;
  wordcount := count;
  end;


function extractword(str : string; n : SmallInt) : string;
  Var
    count : SmallInt;
    i : SmallInt;
    len : SmallInt;
    done : boolean;
    retstr : string;

  Begin
  retstr := '';
  len := length(str);
  count := 0;
  i := 1;
  done := false;
  While (i <= len) and (not done) do
    Begin
    While ((i <= len) and ((str[i] = #32) or (str[i] = #9) or (Str[i] = ';'))) do
      inc(i);
    if i <= len then
      inc(count);
    if count = n then
      begin
      retstr := '';
      If (i > 1) Then
        If Str[i-1] = ';' Then
          RetStr := ';';
      while ((i <= len) and ((str[i] <> #32) and (str[i] <> #9) and (Str[i] <> ';'))) do
        begin
        AppendStr(Retstr, str[i]);
        inc(i);
        end;
      done := true;
      end
    Else
      while ((i <= len) and ((str[i] <> #32) and (str[i] <> #9) and (Str[i] <> ';'))) do
        inc(i);
    End;
  extractword := retstr;
  End;


Function WWrap(St:String; Max:Byte):String;
  Var
    TempStr: String;
    TempPos: Byte;

  Begin
  ExtraString := '';
  TempStr := St;
  If Length(TempStr) > Max Then
    Begin
    TempPos := Max;
    While ((TempStr[TempPos] <> ' ') And (TempPos > (Max - 20))
      And (TempPos > 1)) Do
      Dec(TempPos);
    If (Length(TempStr) > TempPos) Then
      ExtraString := Copy(TempStr,TempPos + 1,Length(TempStr) - TempPos);
    SetLength(TempStr, TempPos);
    End;
  WWrap := TempStr;
  End;


Function Proper(St:String):String;
  Var
    TempStr: String;
    i: SmallInt;
    NextUp: Boolean;

  Begin
  If Length(St) = 0 Then
    Proper := ''
  Else
    Begin
    i := 1;
    NextUp := True;
    TempStr := St;
    While i <= Length(TempStr) Do
      Begin
      If ((TempStr[i] < 'A') Or (TempStr[i] > 'z')
        Or ((TempStr[i] > 'Z') And (TempStr[i] < 'a')) ) Then
        Begin
        NextUp := True;
        End
      Else
        Begin
        If NextUp = True Then
          Begin
          NextUp := False;
          TempStr[i] := UpCase(TempStr[i]);
          End
        Else
          Begin
          If TempStr[i] < 'a' Then
            TempStr[i] := Char(Ord(TempStr[i]) + 32);
          End;
        End;
      i := i + 1;
      End;
    Proper := TempStr;
    End;
  End;


Function PadLeft(St:String;Ch:Char;L:SmallInt): String;
  Var
    TempStr: String;
    i: Word;

  Begin
  If Length(St) >= L Then
    PadLeft := Copy(St,1,L)
  Else
    Begin
    TempStr := '';
    For i := 1 to (L - Length(St)) Do
      AppendStr(TempStr, ' ');
    PadLeft := TempStr + St;
    End;
  End;


Function padright(st:string;ch:char;l:SmallInt):string;

  var
    i:          SmallInt;
    tempstr:    string;

  begin
  If Length(St) >= L Then
    Result := Copy(St,1,L)
  Else
    Begin
    TempStr := '';
    For i := 1 to (L - Length(St)) Do
      AppendStr(TempStr, ' ');
    Result := St + TempStr;
    End;
  end;


Function Upper(St:String):String;
  Var
    TempStr: String;
    i: SmallInt;

  Begin
  i := 1;
  TempStr := St;
  While i <= Length(TempStr) Do
    Begin
    TempStr[i] := UpCase(TempStr[i]);
    i := i + 1;
    End;
  Upper := TempStr;
  End;


Function Lower(St:String):String;
  Var
    TempStr: String;
    i: SmallInt;

  Begin
  i := 1;
  TempStr := St;
  While i <= Length(TempStr) Do
    Begin
    TempStr[i] := LoCase(TempStr[i]);
    i := i + 1;
    End;
  Lower := TempStr;
  End;


function striplead(st:string;ch:char):string;
  var
    tempstr:        string;

  begin
  tempstr := st;
  While ((Length(TempStr) > 0) and (TempStr[1] = Ch)) do
    tempstr := copy (tempstr,2,length(tempstr));
  striplead := tempstr;
  end;


Function StripTrail(St:String;Ch:Char):String;
  Var
    TempStr: String;
    i: SmallInt;

  Begin
  TempStr := St;
  i := Length(St);
  While ((i > 0) and (St[i] = Ch)) Do
    i := i - 1;
  SetLength(TempStr, i);
  StripTrail := TempStr;
  End;


Function StripBoth(St:String;Ch:Char):String;

  Begin
  StripBoth := StripTrail(StripLead(St,Ch),Ch);
  End;

{Function FormattedDate(DT: TDateTime; Mask: String): String;
  Var
    DStr: String[2];
    MStr: String[2];
    MNStr: String[3];
    YStr: String[4];
    HourStr: String[2];
    MinStr: String[2];
    SecStr: String[2];
    TmpStr: String;
    CurrPos: Word;
    i: Word;

    Day, Month, Year, Hour, Min, Sec, MSec: Word;
  Begin
  TmpStr := Mask;
  Mask := Upper(Mask);
  DecodeDate(DT, Year, Month, Day);
  DecodeTime(DT, Hour, Min, Sec, MSec);
  DStr := Copy(PadLeft(Long2Str(Day),'0',2),1,2);
  MStr := Copy(PadLeft(Long2Str(Month),'0',2),1,2);
  YStr := Copy(PadLeft(Long2Str(Year),'0',4),1,4);
  HourStr := Copy(PadLeft(Long2Str(Hour),' ', 2),1,2);
  MinStr := Copy(PadLeft(Long2Str(Min), '0',2),1,2);
  SecStr := Copy(PadLeft(Long2Str(Sec), '0',2),1,2);
  MNStr := MonthStr(Month);
  If (Pos('YYYY', Mask) = 0) Then
    YStr := Copy(YStr,3,2);
  CurrPos := Pos('DD', Mask);
  If CurrPos > 0 Then
    For i := 1 to Length(DStr) Do
      TmpStr[CurrPos + i - 1] := DStr[i];
  CurrPos := Pos('YY', Mask);
  If CurrPos > 0 Then
    For i := 1 to Length(YStr) Do
      TmpStr[CurrPos + i - 1] := YStr[i];
  CurrPos := Pos('MM', Mask);
  If CurrPos > 0 Then
    For i := 1 to Length(MStr) Do
      TmpStr[CurrPos + i - 1] := MStr[i];
  CurrPos := Pos('HH', Mask);
  If CurrPos > 0 Then
    For i := 1 to Length(HourStr) Do
      TmpStr[CurrPos + i - 1] := HourStr[i];
  CurrPos := Pos('SS', Mask);
  If CurrPos > 0 Then
    For i := 1 to Length(SecStr) Do
      TmpStr[CurrPos + i - 1] := SecStr[i];
  CurrPos := Pos('II', Mask);
  If CurrPos > 0 Then
    For i := 1 to Length(MinStr) Do
      TmpStr[CurrPos + i - 1] := MinStr[i];
  CurrPos := Pos('NNN', Mask);
  If CurrPos > 0 Then
    For i := 1 to Length(MNStr) Do
      TmpStr[CurrPos + i - 1] := MNStr[i];
  FormattedDate := TmpStr;
  End;
}
(*
Function FormattedDosDate(DosDate: Integer; Mask:String): String;
  Var
    {$IFDEF WINDOWS}
    DT: TDateTime;
    {$ELSE}
    DT: DateTime;
    {$ENDIF}

  Begin
  UnPackTime(DosDate, DT);
  FormattedDosDate := FormattedDate(DT, Mask);
  End;
*)

Function DOWStr(Dow: Word): String;
  Begin
  Case DOW Of
    0: DOWStr := 'Sunday';
    1: DOWStr := 'Monday';
    2: DOWStr := 'Tuesday';
    3: DOWStr := 'Wednesday';
    4: DOWStr := 'Thursday';
    5: DOWStr := 'Friday';
    6: DOWStr := 'Saturday';
    Else
      DOWStr := '?????';
    End;
  End;


Function DOWShortStr(DOW: Word): String;
  Begin
  DOWShortStr := Copy(DOWStr(Dow),1,3);
  End;

(*
Function ReformatDate(ODate: String; Mask: String): String;
  Var
    Code: Word;
    {$IFDEF WINDOWS}
    DT: TDateTime;
    {$ELSE}
    DT: DateTime;
    {$ENDIF}

  Begin
  Val(Copy(ODate,7,2), DT.Year, Code);
  Val(Copy(ODate,1,2), DT.Month, Code);
  Val(Copy(ODate,4,2), DT.Day, Code);
  If DT.Year < 80 Then
    Inc(DT.Year, 2000)
  Else
    Inc(DT.Year, 1900);
  ReformatDate := FormattedDate(DT, Mask);
  End;
*)

Function Word2TimeStr(CTime: Word): String;
  Begin
  Word2TimeStr := PadLeft(Long2Str(Hi(CTime)),'0',2) + ':' +
    PadLeft(Long2Str(Lo(CTime)),'0',2);
  End;


Function TimeStr2Word(TS: String): Word;
  Var
    Vr: Integer;
    Vr2: Integer;
    Code: Integer;

  Begin
  Val(Copy(TS,1,2), Vr, Code);
  Val(Copy(TS,4,2), Vr2, Code);
  TimeStr2Word := Vr2 + (Vr shl 8);
  End;


Function MonthStr(MonthNo: Word): String;
  Begin
  Case MonthNo of
    01: MonthStr := 'Jan';
    02: MonthStr := 'Feb';
    03: MonthStr := 'Mar';
    04: MonthStr := 'Apr';
    05: MonthStr := 'May';
    06: MonthStr := 'Jun';
    07: MonthStr := 'Jul';
    08: MonthStr := 'Aug';
    09: MonthStr := 'Sep';
    10: MonthStr := 'Oct';
    11: MonthStr := 'Nov';
    12: MonthStr := 'Dec';
    Else
      MonthStr := '???';
    End;
  End;


Function Az2Str(Var Str: String; MaxLen: Byte): String; {Convert asciiz to string}
  Begin
{  SetString(Result, Str, MaxLen);}
  Result := Str;
  SetLength(Result, MaxLen);
  End;


Procedure Str2Az(Str: String; MaxLen: Byte; Var AZStr); {Convert string to asciiz}
  var pc:array[0..255] of char;
  Begin
  StrPLCopy(@AZStr, Str, MaxLen);
//  showmessage('='+inttostr(maxlen));

  End;

Function MKDateToStr(MKD: String): String; {Convert YYMMDD to MM-DD-YY}
  Begin
  MKDateToStr := Copy(MKD,3,2) + '-' + Copy(MKD,5,2) + '-' +
    Copy(MKD,1,2);
  End;


Function StrToMKDate(Str: String): String; {Convert MM-DD-YY to YYMMDD}
  Begin
  StrToMKDate := Copy(Str,7,2) + Copy(Str,1,2) + Copy(Str,4,2);
  End;


Function CleanChar(InChar: Char): Char;
  Const
    CtlChars: String[32] = 'oooooooooXoollo><|!Pg*|^v><-^v';
    HiChars: String[64] = 'CueaaaageeeiiiAAEaaooouuyOUcLYPfarounNao?--//!<>***|||||||||||||';
    HiChars2: String[64]= '|--|-+||||=+|=++-=--==-||||*****abcnEduto0nd80En=+><fj/~oo.vn2* ';

  Begin
  Case InChar of
    #0..#31: CleanChar := CtlChars[Ord(InChar) + 1];
    #128..#191: CleanChar := HiChars[Ord(InChar) - 127];
    #192..#255: CleanChar := HiChars2[Ord(InChar) - 191];
    Else
      CleanChar := InChar;
    End;
  End;


Function IsNumeric(Str: String): Boolean;
  Var
    i: Word;

  Begin
  IsNumeric := True;
  For i := 1 To Length(Str) Do
    If Not (Str[i] in ['0'..'9']) Then
      IsNumeric := False;
  End;

(*
Function LongDate(DStr: String): Integer;
  Var
    {$IFDEF WINDOWS}
    DT: TDateTime;
    {$ELSE}
    DT: DateTime;
    {$ENDIF}
    DosDate: Integer;

  Begin
  DT.Year := Str2Long(Copy(DStr,7,2));
  If Dt.Year < 80 Then
    Inc(DT.Year, 2000)
  Else
    Inc(DT.Year, 1900);
  DT.Month := Str2Long(Copy(DStr,1,2));
  DT.Day := Str2Long(Copy(DStr,4,2));
  DT.Hour := 0;
  DT.Min := 0;
  DT.Sec := 0;
  PackTime(DT, DosDate);
  LongDate := DosDate;
  End;
*)


Function PosLastChar(Ch: Char; St: String): Word;
  Var
    i: Word;

  Begin
  i := Length(St);
  While ((i > 0) and (st[i] <> ch)) Do
    Dec(i);
  PosLastChar := i;
  End;

function StripRE;
begin
  while Upper(Copy(S, 1, 3)) = 'RE:' do S := StripLead(Copy(S, 3+1, $FF), ' '); 
  Result := S;
end;


End.
