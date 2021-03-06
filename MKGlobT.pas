Unit MKGlobT;

{$I MKB.Def}

Interface

{
     MKGlobT - Copyright 1993 by Mark May - MK Software
     You are free to use this code in your programs, however
     it may not be included in Source/TPU function libraries
     without my permission.

     Mythical Kingom Tech BBS (513)237-7737 HST/v32
     FidoNet: 1:110/290
     Rime: ->MYTHKING
     You may also reach me at maym@dmapub.dma.org
}


uses
  SysUtils;

Type AddrType = Record                 {Used for Fido style addresses}
  Zone: Word;
  Net: Word;
  Node: Word;
  Point: Word;
  End;

Type SecType = Record
  Level: Word;                         {Security level}
  Flags: Integer;                      {32 bitmapped flags}
  End;

Type MKDateType = Record
  Year: Word;
  Month: Word;
  Day: Word;
  End;

Type MKDateTime = Record
  Year: Word;
  Month: Word;
  Day: Word;
  Hour: Word;
  Min: Word;
  Sec: Word;
  End;

Const
  BbsVersion = 'Mythical Kingdom Bbs - Version 0.01 Alpha';
  Copyright  = 'Copyright 1992, 1993 by Mark May';
  Contact    = 'Contact 1:110/290  (513)237-7737 HST/V32';


Const
  uoNotAvail = 0;
  uoBrowse =  1;
  uoXfer   =  2;
  uoMsg    =  3;
  uoDoor   =  4;
  uoChat   =  5;
  uoQuest  =  6;
  uoReady  =  7;
  uoMail   =  8;
  uoWait   =  9;
  uoLogIn  = 10;

Function  AddrStr(Addr: AddrType): String;
Function  PointlessAddrStr(Var Addr: AddrType): String;
Function  ParseAddr(AStr: String; CurrAddr: AddrType; Var DestAddr: AddrType): Boolean;
Function  IsValidAddr(Addr: AddrType): Boolean;
Function  Access(USec: SecType; RSec: SecType): Boolean;
Function  EstimateXferTime(FS: Integer; BaudRate: Word; Effic: Word): Integer;
  {Result in seconds}
Function  NameCrcCode(Str: String): Integer; {Get CRC code for name}
Function  Flag2Str(Number: Byte): String;
Function  Str2Flag(St: String): Byte;
Function  ValidMKDate(DT: MKDateTime): Boolean;
Procedure DT2MKDT(Var DT: TDateTime; Var DT2: MKDateTime);
Procedure MKDT2DT(Var DT: MKDateTime; Var DT2: TDateTime);
Procedure Str2MKD(St: String; Var MKD: MKDateType);
Function MKD2Str(MKD: MKDateType): String;
Function AddrEqual(Addr1: AddrType; Addr2: AddrType):Boolean;

function OemToAnsi(S: string): string;
//function AnsiToOem(S: string): string;
procedure AnsiToOemChar(var C: Char);

Var
  StartUpPath: String[128];

Const
  UseEms: Boolean = True;
  LocalMode: Boolean = False;
  LogToPrinter: Boolean = False;
  ReLoad: Boolean = False;
  NodeNumber: Byte = 1;
  OverRidePort: Byte = 0;
  OverRideBaud: Word = 0;
  UserBaud: Word = 0;
  ExitErrorLevel: Byte = 0;
  TimeToEvent: Integer = 0;
  ShellToMailer: Boolean = False;

Implementation

Uses Crc32, MKMisc, winprocs, mkstring;

Function Flag2Str(Number: Byte): String;
  Var
    Temp1: Byte;
    Temp2: Byte;
    i: Word;
    TempStr: String[8];

  Begin
  Temp1 := 0;
  Temp2 := $01;
  For i := 1 to 8 Do
    Begin
    If (Number and Temp2) <> 0 Then
      TempStr[i] := 'X'
    Else
      TempStr[i] := '-';
    Temp2 := Temp2 shl 1;
    End;
  TempStr[0] := #8;
  Flag2Str := TempStr;
  End;


Function Str2Flag(St: String): Byte;
  Var
    i: Word;
    Temp1: Byte;
    Temp2: Byte;

  Begin
  St := StripBoth(St,' ');
  St := PadLeft(St,'-',8);
  Temp1 := 0;
  Temp2 := $01;
  For i := 1 to 8 Do
    Begin
    If UpCase(St[i]) = 'X' Then
      Inc(Temp1,Temp2);
    Temp2 := Temp2 shl 1;
    End;
  Str2Flag := Temp1;
  End;




Function AddrStr(Addr: AddrType): String;
  Begin
  If Addr.Point = 0 Then
    AddrStr := Long2Str(Addr.Zone) + ':' + Long2Str(Addr.Net) + '/' +
      Long2Str(Addr.Node)
  Else
    AddrStr := Long2Str(Addr.Zone) + ':' + Long2Str(Addr.Net) + '/' +
      Long2Str(Addr.Node) + '.' + Long2Str(Addr.Point);
  End;


Function PointlessAddrStr(Var Addr: AddrType): String;
  Begin
  PointlessAddrStr := Long2Str(Addr.Zone) + ':' + Long2Str(Addr.Net) + '/' +
      Long2Str(Addr.Node);
  End;


Function Access(USec: SecType; RSec: SecType): Boolean;
  Begin
  If (USec.Level >=  RSec.Level) Then
    Access :=  ((RSec.Flags and Not(USec.Flags)) = 0)
  Else
    Access := False;
  End;


Function EstimateXferTime(FS: Integer; BaudRate: Word; Effic: Word): Integer;
  Begin
  If BaudRate > 0 Then
    EstimateXferTime := ((FS * 100) Div Effic) Div (BaudRate Div 10)
  Else
    EstimateXferTime := ((FS * 100) Div Effic) Div (960);
  End;


Function NameCrcCode(Str: String): Integer;
  Var
    NCode: Integer;
    i: WOrd;

  Begin
  NCode := UpdC32(Length(Str),$ffffffff);
  i := 1;
  While i < Length(Str) Do
    Begin
    NCode := Updc32(Ord(UpCase(Str[i])), NCode);
    Inc(i);
    End;
  NameCrcCode := NCode;
  End;


Function ParseAddr(AStr: String; CurrAddr: AddrType; Var DestAddr: AddrType): Boolean;
  Var
    SPos: Integer;
    EPos: Integer;
    TempStr: String;
    Code: Integer;
    BadAddr: Boolean;

  Begin
  BadAddr := False;
  AStr := StripBoth(Upper(AStr), ' ');
  EPos := Length(AStr);
  {thanks for the fix domain problem to Ryan Murray @ 1:153/942}
  Code := Pos('@', AStr);
  If Code > 0 then
    Delete(Astr, Code, Length(Astr) + 1 - Code);
  SPos := Pos(':',AStr) + 1;
  If SPos > 1 Then
    Begin
    TempStr := StripBoth(Copy(AStr,1,Spos - 2), ' ');
    Val(TempStr,DestAddr.Zone,Code);
    If Code <> 0 Then
      BadAddr := True;
    AStr := Copy(AStr,Spos,Length(AStr));
    End
  Else
    DestAddr.Zone := CurrAddr.Zone;
  SPos := Pos('/',AStr) + 1;
  If SPos > 1 Then
    Begin
    TempStr := StripBoth(Copy(AStr,1,Spos - 2), ' ');
    Val(TempStr,DestAddr.Net,Code);
    If Code <> 0 Then
      BadAddr := True;
    AStr := Copy(AStr,Spos,Length(AStr));
    End
  Else
    DestAddr.Net := CurrAddr.Net;
  EPos := Pos('.', AStr) + 1;
  If EPos > 1 Then
    Begin
    TempStr := StripBoth(Copy(AStr,EPos,Length(AStr)), ' ');
    Val(TempStr,DestAddr.Point,Code);
    If Code <> 0 Then
      DestAddr.Point := 0;
    AStr := Copy(AStr,1,EPos -2);
    End
  Else
    DestAddr.Point := 0;
  TempStr := StripBoth(AStr,' ');
  If Length(TempStr) > 0 Then
    Begin
    Val(TempStr,DestAddr.Node,Code);
    If Code <> 0 Then
      BadAddr := True;
    End
  Else
    DestAddr.Node := CurrAddr.Node;
  ParseAddr := Not BadAddr;
  End;


Procedure DT2MKDT(Var DT: TDateTime; Var DT2: MKDateTime);

  var
    MSec: Word;
  Begin
  with DT2 do
  begin
    DecodeDate(DT, Year, Month, Day);
    DecodeTime(DT, Hour, Min, Sec, MSec);
  end;
  End;


Procedure MKDT2DT(Var DT: MKDateTime; Var DT2: TDateTime);
  Begin
    with DT do
    begin
      DT2 :=
        EncodeDate(Year, Month, Day)+
        EncodeTime(Hour, Min, Sec, 0);
    end;
  End;


Function  ValidMKDate(DT: MKDateTime): Boolean;
  Var
    DT2: TDateTime;

  Begin
  MKDT2DT(DT, DT2);
  ValidMKDate := {delphi ValidDate(DT2)}TRUE;
  End;


Procedure Str2MKD(St: String; Var MKD: MKDateType);
  Begin
  FillChar(MKD, SizeOf(MKD), #0);
  MKD.Year := Str2Long(Copy(St, 7, 2));
  MKD.Month := Str2Long(Copy(St, 1, 2));
  MKD.Day := Str2Long(Copy(St, 4, 2));
  If MKD.Year < 80 Then
    Inc(MKD.Year, 2000)
  Else
    Inc(MKD.Year, 1900);
  End;


Function MKD2Str(MKD: MKDateType): String;
  Begin
  MKD2Str := PadLeft(Long2Str(MKD.Month),'0',2) + '-' +
             PadLeft(Long2Str(MKD.Day), '0',2) + '-' +
             PadLeft(Long2Str(MKD.Year Mod 100), '0', 2);
  End;

Function AddrEqual(Addr1: AddrType; Addr2: AddrType):Boolean;
  Begin
  AddrEqual := ((Addr1.Zone = Addr2.Zone) and (Addr1.Net = Addr2.Net)
    and (Addr1.Node = Addr2.Node) and (Addr1.Point = Addr2.Point));
  End;



Function  IsValidAddr(Addr: AddrType): Boolean;
  Begin
  IsValidAddr := ((Addr.Zone = 0) And (Addr.Net = 0));
    { We have to skip administrative '/0' addresses}
  End;

function OemToAnsi(S: string): string;
//var
//  I, O: array[0..$100] of Char;
begin
//  WinProcs.OemToAnsi(StrPCopy(I, S), O);
//  Result := StrPas(O);
Result:=S;
end;

{function AnsiToOem(S: string): string;
var
  O: PChar;
begin
  WinProcs.AnsiToOem(PChar(S), O);
  Result := String(O);
end;}

procedure AnsiToOEMChar(var C: Char);
begin
//  AnsiToOEMBuff(@C, @C, SizeOf(C));

end;

End.
