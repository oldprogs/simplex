unit Edit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, JvExStdCtrls, JvRichEdit, JvEdit, JvExControls,
  JvComponent, JvLabel, ExtCtrls, JvExExtCtrls, JvPanel, JclStrings, StrUtils,
  JvSpeedbar, ActnList, JvComponentBase, JvBalloonHint, JvDialogs,
  JvButton, JvCtrls, ConfigType, SimpleXForm, UUE, JclDateTime;


const
  bdsDefault = -1;
  bdsNull = 0;
  bdsFlat = 1;
  bdsFrame = 2;

type
  TMsgText = class(TJvRichEdit)
  private
    procedure kpress(var Message); message WM_KEYDOWN;
end;

type
  TEditForm = class(TSimpleXForm)
    HeaderPanel: TJvPanel;
    LFrom: TJvLabel;
    LTo: TJvLabel;
    LSubj: TJvLabel;
    MsgText: TJvRichEdit;
    FunctionsBar: TJvSpeedBar;
    JvSpeedBarSection1: TJvSpeedBarSection;
    SaveMsg: TJvSpeedItem;
    EditActions: TActionList;
    SaveAction: TAction;
    EFrom: TEdit;
    ETo: TEdit;
    EToAddr: TEdit;
    ESubj: TEdit;
    HMsgID: TJvLabel;
    JvBalloonHint1: TJvBalloonHint;
    EFromAddr: TComboBox;
    InsertUUEAction: TAction;
    JvSpeedItem1: TJvSpeedItem;
    InsertUUEDialog: TJvOpenDialog;
    FooterPanel: TJvPanel;
    LTagline: TJvLabel;
    LTearline: TJvLabel;
    LOrigin: TJvLabel;
    JvLabel4: TJvLabel;
    EOrigin: TEdit;
    ETearline: TEdit;
    ETagline: TEdit;
    HideBtn: TJvImgBtn;
    procedure MsgTextKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure SaveActionExecute(Sender: TObject);
    procedure MsgTextKeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
    procedure InsertUUEActionExecute(Sender: TObject);
    procedure HideBtnClick(Sender: TObject);
    procedure EKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
   public
    editmsgnum: longint;
    referto: longint;
    msgsaved: boolean;

  end;

var
  EditForm: TEditForm;

implementation

uses View, Setup, Main, smapi, Log, Language;

{$R *.dfm}

procedure TEditForm.MsgTextKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var r:TRect;
begin
//ctrl-Y
if (ssCtrl in Shift) and (Key=89) then MsgText.Lines.Delete(MsgText.GetCaretPos.Y);
//ctrl-U
if (ssCtrl in Shift) and (Key=85) then MsgText.Undo;
// esc
case KEY of
VK_ESCAPE: {if msgsaved then MainForm.CloseBtn.OnClick(MainForm)
else if Application.MessageBox(PAnsiChar(lang.editclosetab),PAnsiChar(lang.confirmation),MB_YESNO)=IDYES
  then}
  MainForm.CloseBtn.OnClick(MainForm);
VK_F2: SaveAction.Execute;
end; //case
end;

procedure TEditForm.SaveActionExecute(Sender: TObject);

 function UniqueLong: Longint;
  type
    DLongRec = record
    Lo, Hi: Longint;
  end;
  var
   DateTime: TDateTime;
  begin
   DateTime := Now;
   Result := DLongRec(DateTime).Lo xor DLongRec(DateTime).Hi + Random($FFFF);
  end;

  procedure ReFormat;

    function GetQuotePrefix (const S: string): string;
    var z:longint;
    begin
     z:=Pos('>',s);
     if (z=0) or (z=length(s)) or (z>20) then begin
      result:='';
      exit;
     end;
     while (s[z+1]='>') and (z<length(s)) do inc(z);
     result:=copy(s,1,z);
    end;

 var ss:TStringStream;
     sl:TStringList;
     j,j1: longint;
    q,t: string;
  begin
      DebugEvent('Reformatting');
      sl:=TStringList.Create;
      sl.Text:=MsgText.Text;
      for j:=0 to sl.Count-1 do if sl[j]<>'' then begin
       q:=GetQuotePrefix(sl[j]);
       t:=sl[j];
       if (q<>'') and (length(t)>78) then begin
        j1:=length(t);
        repeat
         dec(j1);
        until (t[j1]=' ') or (j1<20);
        sl[j]:=copy(t,1,j1);
        sl.Insert(j+1,q+copy(t,j1,length(t)-j1+1));
       end;
      end;
      ss:=TStringStream.Create(sl.Text);
      MsgText.Lines.Clear;
      MsgText.StreamMode:=[smSelection];
      MsgText.SelAttributes.Color:=SetupForm.txcolors[1];
      MsgText.Lines.LoadFromStream(ss);
      ss.Free;
      sl.Free;

  end;

var t1:PAnsiChar;
     a,q,tt: longint;
    s: string;
    r:TRect;
    fa,ta: TNetAddr;
    f: TextFile;
    pm: PMsgHandle;
    body:AnsiString;
    ctrl:AnsiString;
    xm:TXMSG;
    xf:TSimpleXForm;
begin
try

DebugEvent('Saving message');
q:=0;
tt:=0;
for a:=1 to MsgText.Lines.Count do if length(MsgText.Lines[a-1])>0 then inc(tt);
for a:=1 to MsgText.Lines.Count
 do if (Pos('>',MsgText.Lines[a-1])>0)
  and (Pos('>',MsgText.Lines[a-1])<10)
   then inc(q);

if SetupForm.ShowHintPanel.Checked then
 if tt>0 then if (q/tt)>0.75 then begin
  MainForm.HintText('Сообщение содержит слишком много цитируемого текста ('+IntToStr(Trunc(100*q/tt))+'%).'+#13+
  'Удалите часть цитат - оставьте только то, что необходимо для понимания контекста обсуждения.'+#13+
  'Удалить целую строку можно сочетанием клавиш Ctrl-Y.' ,Warning);
  Exit;
 end;

if not Area.Open then begin
 LogEvent('Unable to open '+Area.Path);
 Exit;
end;

body:=MsgText.Text;
body:=AnsiToOemString(body);

FillChar(xm,sizeof(xm),#0);
xm.attr:=MSGLOCAL;

DebugEvent('Started new message');

if ParseAddr(EFromAddr.Text,fa,fa) then xm.orig:=fa
 else begin
  JvBalloonHint1.ActivateHint(EFromAddr,'Неверный адрес отправителя');
  Exit;
 end;

if (Pos(':',EFromAddr.Text)=0) or (Pos('/',EFromAddr.Text)=0) then begin
 JvBalloonHint1.ActivateHint(EFromAddr,'Неверный адрес отправителя');
 Exit;
end;

if length(EFromAddr.Text)>5 then
 if (Pos('.',EFromAddr.Text)=length(EFromAddr.Text))
  then EFromAddr.Text:=EFromAddr.Text+'0';

if Area.AreaType=atNetmail then begin
 if ParseAddr(EToAddr.Text,ta,ta) then xm.dest:=ta
 else begin
  JvBalloonHint1.ActivateHint(EToAddr,'Неверный адрес получателя');
  Exit;
 end;
 if (Pos(':',EToAddr.Text)=0) or (Pos('/',EToAddr.Text)=0) then begin
  JvBalloonHint1.ActivateHint(EToAddr,'Неверный адрес получателя');
  Exit;
 end;
end;

if Area.AreaType=atNetmail then begin
 xm.orig:=fa;
 xm.dest:=ta;
end;

ReFormat;

DebugEvent('Setting kludges');

ctrl:=^A'MSGID: ';
ctrl:=ctrl+StrLower(Format('%s %8.8x', [EFromAddr.Text, UniqueLong]));
if length(HMsgID.Caption)>6 then
 ctrl:=ctrl+HMsgID.Caption;
if Area.AreaType=atNetmail then begin
 ctrl:=ctrl+^A'INTL ';
 ctrl:=ctrl+inttostr(ta.zone)+':'+inttostr(ta.net)+
  '/'+inttostr(ta.node)+' ';
 ctrl:=ctrl+inttostr(fa.zone)+':'+inttostr(fa.net)+
  '/'+inttostr(fa.node);
 if fa.point>0 then ctrl:=ctrl+^A'FMPT '+inttostr(fa.point);
 if ta.point>0 then ctrl:=ctrl+^A'TOPT '+inttostr(ta.point);

 //intl...
end;
ctrl:=ctrl+^A'PID: SIMPLEX BETA';
if length(SetupForm.RealName.Text)>0 then begin
 ctrl:=ctrl+^A'RealName: '+AnsiToOemString(SetupForm.RealName.Text);
end;

StrReplace(body,#10,'',[rfReplaceAll]);

if length(body)>0 then
 if body[length(body)]<>#13 then body:=body+#13;

///////////////////////////
DebugEvent('Setting tagline/tearline/origin');
if length(ETagline.Text)>0 then begin
 if length(ETagline.Text)>72 then
  ETagline.Text:=Copy(ETagline.Text,1,72);
 body:=body+'... '+AnsiToOemString(ETagline.Text);
end;
///////////////////////////

if length(ETearline.Text)>72 then
 ETearline.Text:=Copy(ETearline.Text,1,72);
body:=body+#13+'--- '+AnsiToOemString(ETearline.Text);

if length(EOrigin.Text)>55 then
 EOrigin.Text:=Copy(EOrigin.Text,1,72);
body:=body+#13+' * Origin: '+AnsiToOemString(EOrigin.Text)+' ('+EFromAddr.Text+')';

DebugEvent('Setting from/to/subj/datetime');
xm.replyto:=referto;

t1:=PAnsiChar(EFrom.Text);
if length(t1)>0 then AnsiToOem(t1,t1);
StrCopy(xm.from,t1);

t1:=PAnsiChar(ETo.Text);
if length(t1)>0 then AnsiToOem(t1,t1);
StrCopy(xm._to,t1);

t1:=PAnsiChar(ESubj.Text);
if length(t1)>0 then AnsiToOem(t1,t1);
StrCopy(xm.subj,t1);

xm.date_written:=MakeTStamp(DayOfDate(Now),MonthOfDate(Now),YearOfDate(Now),
 HourOfTime(Now),MinuteOfTime(Now),SecondOfTime(Now));
xm.date_arrived:=xm.date_written;

DebugEvent('Ready to save');

//abstract error if SLAreaType[a]='echo' then Area.msga2.SetEcho(true);

if not Area.Open then begin
 LogEvent('Unable to open area. '+lang.GetError);
 Exit;
end;

//MsgLock(Area.msga);
if editmsgnum=0 then
 pm:=MsgOpenMsg(Area.msga,MOPEN_CREATE,0)
else
//именно CREATE!
 pm:=MsgOpenMsg(Area.msga,MOPEN_CREATE,editmsgnum);

if pm=nil then begin
 LogEvent('Failed to open message for writing'+#13#10+lang.GetError);
 Exit;
end;

a:=MsgWriteMsg(pm,0,@xm,PChar(body),StrLen(PChar(body))+1,StrLen(PChar(body))+1,StrLen(PChar(ctrl))+1, PChar(ctrl));

if a<>0 then begin
 LogEvent('Failed to save message #'+inttostr(editmsgnum)+' '#13#10+lang.GetError);
 Exit;
end;
MsgCloseMsg(pm);

//MsgUnLock(Area.msga);
Area.Reopen;

//else if editmsgnum>0 then begin
// Area.msga2.SeekFirst(editmsgnum);
// Area.msga2.DeleteMsg;
//end;
// EDIT!!!

msgsaved:=true;
DebugEvent('Message saved OK. Creating flags if needed');

if Area.AreaType=atEcho then begin
 if length(SetupForm.EEchomailFlag.Text)>0 then
  FileClose(FileCreate(SetupForm.EEchomailFlag.Text));
 end
else if Area.AreaType=atNetmail then
 if length(SetupForm.ENetmailFlag.Text)>0 then
  FileClose(FileCreate(SetupForm.ENetmailFlag.Text));
if ((Area.AreaType=atEcho) or (Area.AreaType=atNetmail)) and
 (length(SetupForm.EExportList.Text)>0) then begin
  AssignFile(f,SetupForm.EExportList.Text);
  if FileExists(SetupForm.EExportList.Text)
   then Append(f) else Rewrite(f);
  WriteLn(f,Area.Name);
  CloseFile(f);
 end;

if editmsgnum>0 then begin
 DebugEvent('Re-loading original message');
 for a:=0 to MainForm.PageList.PageCount-1 do begin
  xf:=MainForm.PageList.Pages[a].Components[0] as TSimpleXForm;
  if xf.FormType<>ftView then continue;
  if strlower(xf.Area.Name)<>strlower(self.Area.Name) then continue;
  if TViewForm(xf).MsgList.Selected<>nil then begin
   TViewForm(xf).MsgListSelectItem(TViewForm(xf).MsgList,TViewForm(xf).MsgList.Selected,true);
   break;
  end;
 end;
end;

DebugEvent('Flags created. Closing tab');

Application.ProcessMessages;

Self.Enabled:=false;

MainForm.CloseBtn.OnClick(MainForm);
MainForm.Refresh.Execute;

except
  on E: Exception do LogEvent('TEditForm.SaveActionExecute encountered an exception: '+E.Message);
end;
end;

procedure TEditForm.MsgTextKeyPress(Sender: TObject; var Key: Char);
begin
MsgText.SelAttributes.Color:=SetupForm.txcolors[0];
if Key='>' then if MsgText.CaretPos.X<7 then if MainForm.HintPanel.Visible then begin
 MainForm.HintText('Никогда не выделяйте знаком цитирования ">" свой собственный текст! Просто пишите свою реплику с новой строки снизу. Пример:'+#13+
 'AB> Это текст сообщения Вашего собеседника.'+#13+'Это текст Вашего сообщения.',Warning);
 Key:=#0;
 end;
end;

procedure TEditForm.FormCreate(Sender: TObject);
begin
EFromAddr.Items:=SetupForm.FtnAddr.Items;
FormType:=ftEdit;
msgsaved:=false;
end;

procedure TEditForm.InsertUUEActionExecute(Sender: TObject);
var fs:TFileStream;
    count: integer;
    s:AnsiString;
begin
 if InsertUUEDialog.Execute then try
  s:=UUEncode(InsertUUEDialog.FileName);
  MsgText.Lines.Insert(MsgText.CaretPos.Y,s);
 except
  on E: Exception do LogEvent ('TEditForm.InsertUUEActionExecute encountered an exception: '+E.Message);
 end;
end;

procedure TMsgText.kpress(var Message);
begin
//
end;

procedure TEditForm.HideBtnClick(Sender: TObject);
begin
FooterPanel.Hide;
end;

procedure TEditForm.EKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var i:integer;
begin
if Key=SaveAction.ShortCut then SaveAction.Execute;
if Key=InsertUUEAction.ShortCut then InsertUUEAction.Execute;
end;

end.
