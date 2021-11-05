unit ConfigType;

interface

uses SysUtils,Classes,IniFiles,Forms, Dialogs,
     JclStrings,Setup, Log, Language, smapi, MkGlobT;

const LRN = 0;

var MInf: TMInf;

type TArea = class
    Name: string[80];
    Path: string;
    AreaType: (atNetmail, atEcho, atLocal, atFileecho, atReserved);
    BaseType: (btNone, btJam, btSquish, btMsg, btReserved);
    FromAddr: string[24]; // length('65535:65535/65535.65535')
    FromName: string[80];
    Description: string[255];
    msga: PAreaHandle;
    TotalMessages: longint;
    UnreadMessages: longint;
    function Open:boolean;
    function Reopen:boolean;
    function GetMsg(msgid:string): longint;
    function GetLastRead:longint;
    procedure SetLastRead(msgn:longint);
  private
    InternalPathName: PAnsiChar;
end;

type PArea = ^RArea;
     RArea = record
      data: TArea;
      next: PArea;
end;

type TAreas = class

   EchoAreaList: TStringList;

   // Очищаем список арий
   procedure Clear;

   // Добавляем арию
   function Add(Area: TArea):PArea;

   // Заполняем MainForm.AreaList
   procedure DoAreaList;

   // Поиск арии. Неприменимо для файлэх!
   function FindEchoArea(name: string): TArea;

  private
   areas: array['A'..'Z'] of PArea; // массив стеков арий
end;

type TConfig = class
  Areas: TAreas;

  SLMAreaTag, SLMAction, SLMPath, SLMAreaType, SLMBaseType,
  SLMFromName, SLMFromAddr: TStringList;

  constructor Create;
  destructor Free;
  procedure ReadHPTConfig (FileName: string);
  procedure ReadPartossConfig (FileName: string);
  procedure ReadBBTossConfig (FileName: string);
  procedure ReadAreasBBS (FileName: string);
  procedure ReadAreaDefs;
  procedure WriteAreaDefs;

  public
   conflict: TStringList;

end;

var Config: TConfig;

implementation

uses Main, ComCtrls, SelDest;

constructor TConfig.Create;
begin
 inherited;
 Areas:=TAreas.Create;
 Areas.EchoAreaList:=TStringList.Create;

 SLMAreaTag:=TStringList.Create;
 SLMAction:=TStringList.Create;
 SLMPath:=TStringList.Create;
 SLMAreaType:=TStringList.Create;
 SLMBaseType:=TStringList.Create;
 SLMFromName:=TStringList.Create;
 SLMFromAddr:=TStringList.Create;
end;

destructor TConfig.Free;
begin
try
 if self=nil then Exit;
 Areas.EchoAreaList.Free;
 Areas.EchoAreaList:=nil;
 Areas.Clear;
 Areas.Free;
 Areas:=nil;

 SLMAreaTag.Free;
 SLMAction.Free;
 SLMPath.Free;
 SLMAreaType.Free;
 SLMBaseType.Free;
 SLMFromName.Free;
 SLMFromAddr.Free;
except
 on E: Exception do ShowMessage('TConfig.Free encountered an exception:'+#13+E.Message);
end;
end;

function TAreas.FindEchoArea(name: string): TArea;
var c:char;
    p:PArea;
    nm:string;
begin
 nm:=StrUpper(name);
 result:=nil;
 for c:='A' to 'Z' do begin
  p:=areas[c];
  while p<>nil do begin
   if StrUpper(p.data.Name)=nm then begin
    result:=p.data;
    Exit;
   end;
   p:=p.next;
  end;
 end;
end;

procedure TAreas.DoAreaList;
var li:TListItem;
     c:char;
     p:PArea;
begin
 MainForm.AreaList.Clear;
 EchoAreaList.Clear;
 SetupForm.ENetMail.Items.Clear;

 for c:='A' to 'Z' do begin
  p:=areas[c];
  while p<>nil do begin
   if p.data.Open then begin
    p.data.TotalMessages:=p.data.msga.num_msg;
    p.data.UnreadMessages:=p.data.msga.num_msg-p.data.GetLastRead;
    if p.data.UnreadMessages<0 then p.data.UnreadMessages:=0;
   end
   else p.data.TotalMessages:=-1;
   li:=MainForm.AreaList.Items.Add;
   li.Caption:=p.data.Name;

   if p.data.AreaType=atNetmail then
    SetupForm.ENetMail.Items.Add(p.data.Name);

   if (p.data.AreaType=atNetmail) or (p.data.AreaType=atEcho)
    or (p.data.AreaType=atLocal) then EchoAreaList.Add(p.data.Name);

   li.Data:=p.data;
   p:=p.next;
  end;
 end;
 EchoAreaList.Sort;
 SelectDestArea.DestAreas.Clear;
 SelectDestArea.DestAreas.Items.AddStrings(EchoAreaList);
end;

function TArea.Reopen;
begin
 if self.msga<>nil then MsgCloseArea(self.msga);
 self.msga:=nil;
 result:=self.Open;
end;

function TArea.Open;
var _type:sword;
begin
 if self.msga<>nil then begin
  result:=true;
 end;
 _type:=0;
 if (AreaType=atEcho) or (AreaType=atNetmail)
   or (AreaType=atLocal) then case BaseType of
  btJam: _type:=MSGTYPE_JAM;
  btSquish: _type:=MSGTYPE_SQUISH;
  btMsg: _type:=MSGTYPE_SDM;
 else _type:=MSGTYPE_SDM;
 end; //case
 if (AreaType=atEcho) or (AreaType=atLocal) then
  _type:=_type or MSGTYPE_ECHO;
 InternalPathName:=PChar(Path);
 msga:=MsgOpenArea(InternalPathName,MSGAREA_NORMAL,_type);
 if msga<>nil then result:=true else result:=false;
end;

procedure TAreas.Clear;
var c:char;
    p:PArea;
begin
 for c:='A' to 'Z' do while areas[c]<>nil do begin
  p:=areas[c];
  areas[c]:=p.next;
  Dispose(p);
 end;
end;

function TAreas.Add(Area: TArea):PArea;
var c:char;
    p:PArea;
begin
 if Area.name='' then begin
  LogEvent (lang.erremptyareaname);
  Result:=nil;
  Exit;
 end;

 if (((Area.AreaType=atEcho) or (Area.AreaType=atNetmail) or (Area.AreaType=atLocal))
  and (Area.BaseType=btNone))
 or (((Area.AreaType=atEcho) or (Area.AreaType=atNetmail) or (Area.AreaType=atLocal))
  and (Area.Path=''))
 or ((Area.AreaType=atFileecho) and (Area.Path=''))
 then begin
  LogEvent ('"'+Area.Name+'": '+lang.errareaparams);
  Result:=nil;
  Exit;
 end;

 c:=UpCase(Area.name[1]);
 if c<'A' then c:='A'
  else if c>'Z' then c:='Z';

 System.New(p);
 p.data:=Area;
 p.next:=areas[c];
 areas[c]:=p;
 result:=p;
end;

procedure TConfig.ReadHPTConfig;
var f:textfile;
    s:string;
    i:integer;
    sl:TStringList;
    Area:TArea;
begin
 try
  AssignFile(f,FileName);
  Reset(f);
  repeat
   ReadLn(f,s);
   while StrFind(#9,s)>0 do StrReplace(s,#9,' ');
   while StrFind('  ',s)>0 do StrReplace(s,'  ',' ');
   sl:=TStringList.Create;
   StrTokenToStrings(s,' ',sl);

   if sl.Count>1 then if (StrLower(sl[0])='include')
    then ReadHPTConfig(sl[1]);
   if sl.Count>2 then if (StrLower(sl[0])='echoarea')
     or (StrLower(sl[0])='localarea') or (StrLower(sl[0])='netmailarea') then begin
    if StrLower(sl[2])='passthrough' then continue;
    Area:=TArea.Create;
    Area.Name:=sl[1];
    Area.Path:=sl[2];
    Area.BaseType:=btSquish;
    if StrLower(sl[0])='echoarea' then Area.AreaType:=atEcho
     else if StrLower(sl[0])='localarea' then Area.AreaType:=atLocal
     else if StrLower(sl[0])='netmailarea' then Area.AreaType:=atNetmail;

    Area.FromAddr:=SetupForm.FtnAddr.Text;
    Area.FromName:=SetupForm.Users.Text;
    for i:=3 to sl.Count-2 do begin
     if StrLower(sl[i])='-b' then begin
      if StrLower(sl[i+1])='jam' then Area.BaseType:=btJam
      else if StrLower(sl[i+1])='msg' then Area.BaseType:=btMsg;
     end;
     if StrLower(sl[i])='-a' then Area.FromAddr:=sl[i+1];
    end;
   Areas.Add(Area);
   sl.Free;
   end;
  until eof(f);
  CloseFile(f);
 except
  on E: Exception do LogEvent('ReadHPTConfig: Failed to open '+FileName+': '+E.Message);
 end;
end;

procedure TConfig.ReadPartossConfig;
var f:textfile;
    s:string;
    i:integer;
    sl:TStringList;
    Area:TArea;
begin
 try
  AssignFile(f,FileName);
  Reset(f);
  repeat
   ReadLn(f,s);
   if length(s)=0 then continue;
   if s[1]=';' then continue;
   StrReplace(s,#9,' ',[rfReplaceAll]);
   while StrFind('  ',s)>0 do StrReplace(s,'  ',' ');
   sl:=TStringList.Create;
   StrTokenToStrings(s,' ',sl);
   if sl.Count>1 then if (StrLower(sl[0])='include')
   then ReadPartossConfig(sl[1]);

   Area:=TArea.Create;
   Area.Name:=sl[1];
   Area.Path:=sl[2];
   Area.BaseType:=btMsg;

   if StrLower(sl[0])='echoarea' then Area.AreaType:=atEcho
    else if StrLower(sl[0])='localarea' then Area.AreaType:=atLocal
    else if StrLower(sl[0])='netmailarea' then Area.AreaType:=atNetmail;

   Area.FromAddr:=SetupForm.FtnAddr.Text;
   Area.FromName:=SetupForm.Users.Text;

   for i:=3 to sl.Count-2 do begin
    if sl[i]='-$' then Area.BaseType:=btSquish;
    if StrLower(sl[i])='-p' then Area.FromAddr:=sl[i+1];
   end;

   Areas.Add(Area);
   sl.Free;
  until eof(f);
  CloseFile(f);
 except
  on E: Exception do LogEvent('ReadPartossConfig: Failed to open '+FileName+': '+E.Message);
 end;
end;

procedure TConfig.ReadAreasBBS;
var f:textfile;
    s:string;
    sl:TStringList;
    Area: TArea;
begin
 try
  AssignFile(f,FileName);
  Reset(f);
  repeat
   ReadLn(f,s);
   if length(s)=0 then continue;
   if s[1]=';' then continue;
   StrReplace(s,#9,' ',[rfReplaceAll]);
   s:=trim(s);
   while StrFind('  ',s)>0 do StrReplace(s,'  ',' ');
   sl:=TStringList.Create;
   StrTokenToStrings(s,' ',sl);
   Area:=TArea.Create;

   if sl.Count>1 then begin
    Area.FromAddr:=SetupForm.FtnAddr.Text;
    Area.FromName:=SetupForm.Users.Text;
    Area.BaseType:=btMsg;
    Area.AreaType:=atNetmail;
    s:=sl[0];
    if sl[0][1]='!' then begin
     Area.BaseType:=btJam;
     Area.AreaType:=atEcho;
     s:=Copy(sl[0],2,length(sl[0])-1);
    end;
    if sl[0][1]='$' then begin
     Area.BaseType:=btSquish;
     Area.AreaType:=atEcho;
     s:=Copy(sl[0],2,length(sl[0])-1);
    end;
   end;

   {if SLAreaTag.IndexOf(sl[1])<>-1 then begin
    if Conflict.IndexOf(sl[1])=-1 then
     Conflict.Add(sl[1]);
    continue;
   end;}

   Area.Name:=sl[1];
   Area.Path:=s;
   Areas.Add(Area);
   sl.Free;
  until eof(f);
  CloseFile(f);
 except
  on E: Exception do LogEvent('ReadAreasBBS: Failed to open '+FileName+': '+E.Message);
 end;
end;

procedure TConfig.ReadBBTossConfig;
var f:textfile;
    s:string;
    i:integer;
    sl:TStringList;
    Area: TArea;
    c: char;
    var ini: TIniFile;
begin
 try
  ini:=TIniFile.Create(filename);
  sl:=TStringList.Create;
  ini.ReadSections(sl);

  for i:=0 to sl.Count-1 do begin
   Area:=TArea.Create;
   Area.Name:=sl[i];
   Area.Path:=ini.ReadString(sl[i],'Path','N/A');
   c:=ini.ReadString(sl[i],'Basetyp','J')[1];
   case c of
    'J': Area.BaseType:=btJam;
    'S': Area.BaseType:=btSquish;
    'N': Area.BaseType:=btMsg;
   end; //case

   c:=ini.ReadString(sl[i],'Typ','E')[1];
   case c of
    'E': Area.AreaType:=atEcho;
    'N': Area.AreaType:=atNetmail;
    'L': Area.AreaType:=atLocal;
   end; //case
   Area.FromAddr:=ini.ReadString(sl[i],'Mainaka',SetupForm.FtnAddr.Text);
   Area.FromName:=SetupForm.Users.Text;
   Areas.Add(Area);
  end;
  ini.Free;
  sl.Free;
 except
  on E: Exception do LogEvent('ReadBBTossConfig: Failed to open '+FileName+': '+E.Message);
 end;
end;

procedure TConfig.ReadAreaDefs;
var f:textfile;
    s:string;
    i,j:integer;
    at: char;
    var ini: TIniFile;
    act: string;
    cnt:integer;
    Area: TArea;
begin
 try
  SLMAreaTag.Clear;
  SLMAction.Clear;
  SLMPath.Clear;
  SLMAreaType.Clear;
  SLMBaseType.Clear;
  SLMFromName.Clear;
  SLMFromAddr.Clear;

  cnt:=0;
  ini:=TIniFile.Create(ExtractFilePath(Application.ExeName)+'areadefs.ini');
  ini.ReadSections(Config.SLMAreaTag);
  for i:=0 to Config.SLMAreatag.Count-1 do begin
   act:=ini.ReadString(Config.SLMAreatag[i],'Action','');
   if act='new' then begin
    inc(cnt);
   end;
   Config.SLMAction.Add(act);
   Config.SLMPath.Add(ini.ReadString(Config.SLMAreatag[i],'Path',''));
   Config.SLMBaseType.Add(ini.ReadString(Config.SLMAreatag[i],'BaseType','-'));
   Config.SLMAreaType.Add(ini.ReadString(Config.SLMAreatag[i],'AreaType',''));
   Config.SLMFromName.Add(ini.ReadString(Config.SLMAreatag[i],'FromName',SetupForm.Users.Text));
   Config.SLMFromAddr.Add(ini.ReadString(Config.SLMAreatag[i],'FromAddr',SetupForm.FtnAddr.Text));
  end;
  ini.Free;

  for i:=0 to Config.SLMAreatag.Count-1 do if Config.SLMAction[i]='new' then begin
   Area:=TArea.Create;
   Area.Name:=Config.SLMAreaTag[i];
   Area.Path:=Config.SLMPath[i];
   case Config.SLMBaseType[i][1] of
     'J': Area.BaseType:=btJam;
     'S': Area.BaseType:=btSquish;
     'F': Area.BaseType:=btMsg;
     '-': Area.BaseType:=btJam;
    end;
    if Config.SLMAreaType[i]='echo' then Area.AreaType:=atEcho
    else if Config.SLMAreaType[i]='net' then Area.AreaType:=atNetmail
    else if Config.SLMAreaType[i]='local' then Area.AreaType:=atLocal;
   Area.FromName:=Config.SLMFromName[i];
   Area.FromAddr:=Config.SLMFromAddr[i];
   Areas.Add(Area);
  end
  else begin
   Area:=Areas.FindEchoArea(Config.SLMAreaTag[i]);
   if Area=nil then continue;

   if Config.SLMPath[i]<>'' then Area.Path:=Config.SLMPath[i];
   case Config.SLMBaseType[i][1] of
     'J': Area.BaseType:=btJam;
     'S': Area.BaseType:=btSquish;
     'F': Area.BaseType:=btMsg;
    end;
    if Config.SLMAreaType[i]='echo' then Area.AreaType:=atEcho
    else if Config.SLMAreaType[i]='net' then Area.AreaType:=atNetmail
    else if Config.SLMAreaType[i]='local' then Area.AreaType:=atLocal;
   if Config.SLMFromName[i]<>'' then Area.FromName:=Config.SLMFromName[i];
   if Config.SLMFromAddr[i]<>'' then Area.FromAddr:=Config.SLMFromAddr[i];
  end;

 except
  on E: Exception do LogEvent('ReadAreaDefs: Failed to open areadefs.ini: '+E.Message);
 end;

 if not ((Config.SLMAreaTag.Count=Config.SLMPath.Count)
  and (Config.SLMPath.Count=Config.SLMAction.Count)
  and (Config.SLMAction.Count=Config.SLMBaseType.Count)
  and (Config.SLMBaseType.Count=Config.SLMAreaType.Count)
  and (Config.SLMAreaType.Count=Config.SLMFromName.Count)
  and (Config.SLMFromName.Count=Config.SLMFromAddr.Count))
  then LogEvent('ReadAreaDefs: SL synchronization lost');
end;

procedure TConfig.WriteAreaDefs;
var f:textfile;
    s:string;
    i:integer;
    at: char;
    var ini: TIniFile;
begin
 try
  SysUtils.DeleteFile(ExtractFilePath(Application.ExeName)+'areadefs.ini');
  ini:=TIniFile.Create(ExtractFilePath(Application.ExeName)+'areadefs.ini');
  for i:=0 to Config.SLMAreatag.Count-1 do begin
    ini.WriteString(Config.SLMAreatag[i],'Action',Config.SLMAction[i]);
    ini.WriteString(Config.SLMAreatag[i],'Path',Config.SLMPath[i]);
    ini.WriteString(Config.SLMAreatag[i],'BaseType',Config.SLMBaseType[i]);
    ini.WriteString(Config.SLMAreatag[i],'AreaType',Config.SLMAreaType[i]);
    ini.WriteString(Config.SLMAreatag[i],'FromName',Config.SLMFromName[i]);
    ini.WriteString(Config.SLMAreatag[i],'FromAddr',Config.SLMFromAddr[i]);
  end;
  ini.Free;
 except
  on E: Exception do LogEvent('ReadAreaDefs: Failed to write areadefs.ini: '+E.Message);
 end;
end;

function TArea.GetMsg;
var pm: PMsgHandle;
    xm: TXMSG;
    i: longint;
    ctrl: PAnsiChar;
    sctrl: AnsiString;
    id: string;
    j: integer;
begin
 result:=0;
 if msgid='' then exit;
 if not self.Open then begin
  DebugEvent('TArea.GetMsg: self.Open failed');
  Exit;
 end;
 for i:=1 to self.msga.num_msg do begin
  FillChar(xm,sizeof(xm),#0);
  pm:=MsgOpenMsg(self.msga,MOPEN_READ,i);
  if pm=nil then continue;
  ctrl:=StrAlloc(MsgGetCtrlLen(pm)+2);
  MsgReadMsg(pm,@xm,0,0,nil,MsgGetCtrlLen(pm),ctrl);
  ctrl[MsgGetCtrlLen(pm)]:=#0;

  sctrl:=AnsiString(ctrl);
  MsgCloseMsg(pm);

  j:=Pos(^A'MSGID: ',sctrl);
  if j>0 then begin
   id:='';
   j:=j+length(^A'MSGID: ');
   repeat
    id:=id+sctrl[j];
    inc(j);
    if j>length(sctrl) then break;
   until (sctrl[j]=#0) or (sctrl[j]=#1) or (sctrl[j]=#13) or (sctrl[j]=#10);
   if id=msgid then begin
    result:=i;
    break;
   end;
  end;

  if ctrl<>nil then StrDispose(ctrl);
  ctrl:=nil;
 end;
end;

function TArea.GetLastRead;
var ini: TIniFile;
begin
 ini:=TIniFile.Create(ExtractFilePath(Application.ExeName)+'lastread.ini');
// result:=self.GetMsg(ini.ReadString('default',StrLower(self.Name),''));
 result:=MsgUidToMsgn(self.msga,ini.ReadInteger('default',StrLower(self.Name),0),UID_NEXT);
 ini.Free;
end;

procedure TArea.SetLastRead;
var ini: TIniFile;
begin
 ini:=TIniFile.Create(ExtractFilePath(Application.ExeName)+'lastread.ini');
 // ini.WriteString('default',StrLower(self.name),msgid);
 ini.WriteInteger('default',StrLower(self.name),MsgMsgnToUid(self.msga,msgn));
 ini.Free;
end;

end.
