unit View;

interface

uses
  SimpleXForm, CommCtrl, Windows, Graphics, Messages, SysUtils, Variants, Classes, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, JvExExtCtrls, JvSplitter, JvExStdCtrls,
  JvRichEdit, ComCtrls, JvExComCtrls, JvNavigationPane,
  JvExControls, JvComponent, JvLabel, JvListView, JvPanel, ActnList,
  JvAppStorage, JvAppIniStorage, JvComponentBase, JvFormPlacement, MkGlobT,
  JvRichEditToHtml, JvListBox, JvComboListBox,JclShell, WinProcs,
  JvStaticText, JvXPCore, JvXPButtons, JvGroupBox, JvBevel, smapi,
  JvEdit, JvCheckBox, JvRadioButton, JclCounter, ConfigType, FGHIprocs;

type
  TViewForm = class(TSimpleXForm)
    MsgList: TJvListView;
    MsgText: TJvRichEdit;
    ViewSplitter: TJvOutlookSplitter;
    HeaderPanel: TJvPanel;
    LFrom: TJvStaticText;
    LTo: TJvStaticText;
    LSubj: TJvStaticText;
    VRefer: TJvStaticText;
    ActionList1: TActionList;
    Action1: TAction;
    Action2: TAction;
    Action3: TAction;
    Action4: TAction;
    Action5: TAction;
    Action6: TAction;
    Action7: TAction;
    Action8: TAction;
    Action9: TAction;
    Action10: TAction;
    Action11: TAction;
    Action12: TAction;
    Action13: TAction;
    Action14: TAction;
    Action15: TAction;
    JvRichEditToHtml: TJvRichEditToHtml;
    SeeAlsoBox: TJvListBox;
    TwitBox: TJvGroupBox;
    TwitWarning: TJvStaticText;
    ReadBtn: TJvXPButton;
    DeleteBtn: TJvXPButton;
    VPar: TJvStaticText;
    ShowTree: TAction;
    VSubj: TJvStaticText;
    VTo: TJvStaticText;
    VFrom: TJvStaticText;
    VToAddr: TJvStaticText;
    VFromAddr: TJvStaticText;
    VDateTime: TJvStaticText;
    VNum: TJvStaticText;
    LNum: TJvStaticText;
    SearchBox: TJvGroupBox;
    LSearch: TJvStaticText;
    SearchBtn: TJvXPButton;
    SearchCancelBtn: TJvXPButton;
    ESearch: TJvEdit;
    SOptFromFirst: TJvRadioButton;
    SOptFromCurrent: TJvRadioButton;
    SOptOnlyHeader: TJvCheckBox;
    SOptOnlyCurrent: TJvRadioButton;
    Timer1: TTimer;
    DebugLabel: TJvStaticText;
    procedure FormShow(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure MsgListData(Sender: TObject; Item: TListItem);
    procedure MsgListSelectItem(Sender: TObject; Item: TListItem;
      Selected: Boolean);
    procedure MsgListMouseEnter(Sender: TObject);
    procedure MsgTextMouseEnter(Sender: TObject);
    procedure MsgTextMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure MsgListMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure MsgListKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure MsgTextKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure MsgTextMouseWheel(Sender: TObject; Shift: TShiftState;
      WheelDelta: Integer; MousePos: TPoint; var Handled: Boolean);
    procedure Action1Execute(Sender: TObject);
    procedure Action2Execute(Sender: TObject);
    procedure Action3Execute(Sender: TObject);
    procedure Action4Execute(Sender: TObject);
    procedure Action5Execute(Sender: TObject);
    procedure Action6Execute(Sender: TObject);
    procedure Action7Execute(Sender: TObject);
    procedure Action8Execute(Sender: TObject);
    procedure MsgListDrawItem(Sender: TCustomListView; Item: TListItem;
      Rect: TRect; State: TOwnerDrawState);
    procedure FormCreate(Sender: TObject);
    procedure SeeAlsoBoxClick(Sender: TObject);
    procedure SeeAlsoBoxKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure MsgTextURLClick(Sender: TObject; const URLText: String;
      Button: TMouseButton);
    procedure ViewSplitterMoved(Sender: TObject);
    procedure ViewSplitterDblClick(Sender: TObject);
    procedure FormPaint(Sender: TObject);
    procedure HeaderPanelMouseEnter(Sender: TObject);
    procedure TwitShow;
    procedure TwitHide;
    procedure HeaderPanelMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure ReadBtnClick(Sender: TObject);
    procedure DeleteBtnClick(Sender: TObject);
    procedure VParMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure SeeAlsoBoxMouseEnter(Sender: TObject);
    procedure SeeAlsoBoxMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure ShowTreeExecute(Sender: TObject);
    procedure ESearchChange(Sender: TObject);
    procedure SearchCancelBtnClick(Sender: TObject);
    procedure ESearchKeyPress(Sender: TObject; var Key: Char);
    procedure SearchBtnClick(Sender: TObject);
    procedure SOptFromFirstClick(Sender: TObject);
    procedure SOptOnlyCurrentClick(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure MsgListKeyPress(Sender: TObject; var Key: Char);
    procedure VRepliesClick(Sender: TObject);
  private
    { Private declarations }
  public
    VSeeAlso: array[0..MAX_REPLY-1] of TJvStaticText;
    msgid:string;
    replystring: string;
    msgnum: longint;
    replytoarea: string;
    flags: string;
    actv: boolean;
    msgOk: boolean;
    function ColorTable():string;
    function CtrlChars(i: byte):string;
    function ChkQuotes(s: string):byte;
  end;

var
  ViewForm: TViewForm;

  b:boolean;
  sbv:boolean=false;

function OemToAnsiString(S: string): string;
function AnsiToOemString(S: string): string;

implementation

uses Main, JvPageList, MKstring,
 Log, Language, Setup, StrUtils, JclStrings, JclPCRE, Tree, ThemesEdit, Nodelist;

{$R *.dfm}

function TViewForm.ColorTable():string;
var i:byte;
begin
try
Result:='{\colortbl ';
for i:=0 to 18 do Result:=Result+';\red'+IntToStr(SetupForm.txcolors[i] mod 256)+'\green'+IntToStr(SetupForm.txcolors[i] shl 16 shr 24)+'\blue'+IntToStr(SetupForm.txcolors[i] shl 8 shr 24);
Result:=Result+';}';
except
 on E: Exception do LogEvent('TViewForm.ColorTable encountered an exception: '+E.Message);
end;
end;

function TViewForm.CtrlChars(i:byte):string;
begin
try
Result:='\b0\i0\ulnone';
if SetupForm.txbold[i] then Result:=Result+'\b';
if SetupForm.txitalic[i] then Result:=Result+'\i';
if SetupForm.txunder[i] then Result:=Result+'\ul';
except
 on E: Exception do LogEvent('TViewForm.CtrlChars encountered an exception: '+E.Message);
end;
end;

function TViewForm.ChkQuotes(s: string):byte;
var t:string;
    i:byte;
begin
try
t:=Copy(s,1,15);
i:=0;
repeat
 if Pos('>',t)>0 then begin
  if (Pos('<',t)>Pos('>',t)) or (Pos('<',t)=0) then begin
   inc(i);
   t:=Copy(t,Pos('>',t)+1,length(t)-Pos('>',t));
   if length(t)>0 then if (t[1]<>'>') then break;
   end
  else break;
 end
 else break;
until length(t)=0;
if i>4 then begin
 i:=i mod 4;
 if i=0 then i:=4;
end;
result:=i;
except
 on E: Exception do LogEvent('TViewForm.ChkQuotes encountered an exception: '+E.Message);
end;
end;

procedure TViewForm.FormShow(Sender: TObject);
var z:longint;

begin
try
DebugEvent ('Showing form '+Caption+' with tag '+inttostr(tag));
if MsgList.Items.Count>0 then begin
 DebugEvent ('Showing existing ViewForm: '+Caption);
 z:=Area.GetLastRead-1;
 if z>=Area.msga.num_msg then z:=Area.msga.num_msg;
 if z<0 then z:=0;
 MsgList.Items.Item[z].Selected:=true;
 MsgList.Selected.MakeVisible(false);
 if MsgList.ItemIndex<MsgList.Items.Count-1 then
  MsgList.Items[MsgList.Selected.Index+1].MakeVisible(false);
 MsgList.Column[3].Width:=MsgList.Width-MsgList.Column[0].Width-
 MsgList.Column[1].Width-MsgList.Column[2].Width-MsgList.Column[4].Width-20;
 HideCaret(MsgText.Handle);
 DebugEvent (Caption+' shown');
 exit;
end;

DebugEvent('Opening '+Area.Path);


if Area.Open then begin
 z:=Area.msga.num_msg;

 if z<=0 then begin
  MsgList.AllocBy:=0;
  MsgText.Lines.Clear;
  MsgText.Lines.Add('*** Сообщений нет ***');
  Exit;
 end;

 DebugEvent('Allocating MsgList');

 Area.TotalMessages:=z;
 Area.UnreadMessages:=z-Area.GetLastRead;
 if Area.UnreadMessages<0 then Area.UnreadMessages:=0;
 if Area.UnreadMessages>z then Area.UnreadMessages:=z;

 MsgList.AllocBy:=z;
 MsgList.Selected:=nil;

// цЫкл... ЛОЛ!!! =)))))
 while MsgList.Selected=nil do begin
  DebugEvent('Selecting item');
  if Area.GetLastRead>=0 then begin
   if Area.GetLastRead<Area.msga.num_msg then
    MsgList.Selected:=MsgList.Items.Item[Area.GetLastRead]
    else MsgList.Selected:=MsgList.Items.Item[z-1];
   end
  else begin
   DebugEvent('(no LastRead)');
   MsgList.Selected:=MsgList.Items.Item[0];
   MsgList.Items.Item[0].Selected:=true;
  end;
 end;
 if MsgList.Selected=nil then showmessage('warning: item NOT selected');
//////////////////////////////

 DebugEvent('Item selected');
 MsgListSelectItem(MsgList,MsgList.Selected,true);
 DebugEvent('Message loaded');

 if MsgList.Selected<>nil then begin
  if MsgList.Selected.Index+3<MsgList.Items.Count then MsgList.Items.Item[MsgList.Selected.Index+3].MakeVisible(false)
  else if MsgList.Selected.Index+2<MsgList.Items.Count then MsgList.Items.Item[MsgList.Selected.Index+2].MakeVisible(false)
  else if MsgList.Selected.Index+1<MsgList.Items.Count then MsgList.Items.Item[MsgList.Selected.Index+1].MakeVisible(false)
  else MsgList.Items.Item[MsgList.Selected.Index].MakeVisible(false);
  DebugEvent('Item set visible');
  MsgList.ItemFocused:=MsgList.Selected;
  DebugEvent('Item focused');
 end;
end
else begin
 MsgList.AllocBy:=0;
 MsgText.Lines.Clear;
 MsgText.Lines.Add(lang.errbaseopen);
 MsgText.Lines.Add(lang.GetError);
end;
MsgList.Height:=vfh;
MsgText.SetFocus;
if MsgList.Items.Count>0 then
 if MsgList.Selected<>nil then MsgList.Selected.MakeVisible(false);

DebugEvent(Caption+' shown OK');
except
 on E: Exception do LogEvent('TViewForm.FormShow encountered an exception: '+E.Message);
end;
end;

procedure TViewForm.FormDestroy(Sender: TObject);
var i:byte;
begin
try
if Area=nil then exit;
for i:=0 to MAX_REPLY-1 do VSeeAlso[i].Free;
except
 on E: Exception do LogEvent('TViewForm.FormDestroy encountered an exception: '+E.Message);
end;
end;


function OemToAnsiString(S: Ansistring): Ansistring;
var i:longint;
begin
try
   result:='';
   for i:=1 to Length(s) do
   if (ord(s[i])>=128) and (ord(s[i])<=175) then result:=result+Chr(Ord(s[i])+64)
   else if (ord(s[i])>=224) and (ord(s[i])<=239) then result:=result+Chr(Ord(s[i])+16)
   else if ((ord(s[i])>=32) and (ord(s[i])<=126)) then result:=result+s[i]
  else case ord(s[i]) of
    179: result:=result+'|';
    191: result:=result+#172;
    196: result:=result+'-';
    240: result:=result+#168;
    241: result:=result+#184;
    242: result:=result+#170;
    243: result:=result+#184;
    244: result:=result+#175;
    245: result:=result+#191;
    246: result:=result+#161;
    247: result:=result+#162;
    248: result:=result+#176;
    249: result:=result+#149;
    250: result:=result+#183;
    251: result:=result+#149;
    252: result:=result+#185;
    253: result:=result+#164;
    254: result:=result+#185;
    255: result:=result+' ';
    else result:=result+'?';
   end; //case
except
 on E: Exception do LogEvent('OemToAnsiString encountered an exception: '+E.Message);
end;
end;

function AnsiToOemString(S: AnsiString): AnsiString;
var
 i:longint;
begin
 try
  result:='';
  for i:=1 to length(s) do
   if ord(s[i])<=126 then result:=result+s[i]
   else if (ord(s[i])>=192) and (ord(s[i])<=239)
    then result:=result+chr(ord(s[i])-64)
   else if (ord(s[i])>=240) and (ord(s[i])<=255)
    then result:=result+chr(ord(s[i])-16)
   else case ord(s[i]) of
    128: result:=result+'h';
    129: result:=result+#131;
    130: result:=result+',';
    131: result:=result+#163;
    132: result:=result+',,';
    133: result:=result+'...';
    134: result:=result+'+';
    135: result:=result+'++';
    136: result:=result+#242;
    137: result:=result+'%o';
    138: result:=result+#139#156; //ЛЬ
    139: result:=result+'<';
    140: result:=result+#141#156; //НЬ
    141: result:=result+#138;
    142: result:=result+'h';
    143: result:=result+'II';
    144: result:=result+'h';
    145,146: result:=result+'`';
    147: result:=result+'``';
    148: result:=result+'''''';
    149: result:=result+#249;
    150: result:=result+'-';
    151: result:=result+#196;
    153: result:=result+'(tm)';
    154: result:=result+#171#236; //ль
    155: result:=result+'>';
    156: result:=result+#173#236; //нь
    157: result:=result+#170;
    158: result:=result+'h';
    159: result:=result+'ii';
    160: result:=result+' ';
    161: result:=result+#147;
    162: result:=result+#227;
    163: result:=result+'J';
    164: result:=result+#253;
    165: result:=result+#131;
    166: result:=result+'|';
    167: result:=result+#21;
    168: result:=result+#240;
    169: result:=result+'(c)';
    170: result:=result+#242;
    171: result:=result+'"';
    172: result:=result+#191;
    173: result:=result+'-';
    174: result:=result+'(R)';
    175: result:=result+#244;
    176: result:=result+#248;
    177: result:=result+'+-';
    178: result:=result+'I';
    179: result:=result+'i';
    180: result:=result+#163;
    181: result:=result+'m';
    182: result:=result+#20;
    183: result:=result+#250;
    184: result:=result+#241;
    185: result:=result+#252;
    186: result:=result+#243;
    187: result:=result+'"';
    188: result:=result+'j';
    189: result:=result+'S';
    190: result:=result+'s';
    191: result:=result+#245;
    else result:=result+'?';
   end; //case
 except
  on E: Exception do LogEvent('AnsiToOemString encountered an exception: '+E.Message);
 end;
end;

procedure TViewForm.MsgListData(Sender: TObject; Item: TListItem);
var i,j,s: longint;
    t: string;
   pm: PMsgHandle;
   xm: TXMSG;
begin
 try
  if Area.msga<>nil then begin
   if Area.msga.num_msg<1 then Exit;
   Item.Caption:=IntToStr(Item.Index+1);

   try
    pm:=MsgOpenMsg(Area.msga,MOPEN_READ,Item.Index+1);
    if pm=nil then Exit;

    FillChar(xm,sizeof(xm),0);
    MsgReadMsg(pm,@xm,0,0,nil,0,nil);
   except
    Item.SubItems.Add('ERROR');
    Item.SubItems.Add('ERROR');
    Item.SubItems.Add('ERROR');
    Item.SubItems.Add('ERROR');
    Item.SubItems.Add('ERR');
    Exit;
   end;

   Item.SubItems.Add(OemToAnsiString(xm.from));
   Item.SubItems.Add(OemToAnsiString(xm._to));
   Item.SubItems.Add(OemToAnsiString(xm.subj));
   try
    DateTimeToString(t,SetupForm.DateTimeFormat.Text,TStampToDateTime(xm.date_written));
    Item.SubItems.Add(t);
   except
    on E:Exception do Item.SubItems.Add('UNKNOWN');
   end;

   if (xm.attr and MSGLOCAL)>0 then begin
    if (xm.attr and MSGSENT)=0 then Item.SubItems.Add('unsent')
     else Item.SubItems.Add('sent')
   end
   else begin
    if (xm.attr and MSGREAD)>0 then Item.SubItems.Add('read')
     else Item.SubItems.Add('unread')
   end;
  end;
  MsgCloseMsg(pm);
 except
  on E: Exception do LogEvent('TViewForm.MsgListData encountered an exception: '+E.Message);
 end;
end;

procedure TViewForm.MsgListSelectItem(Sender: TObject; Item: TListItem;
  Selected: Boolean);

var i,j,k,ks,kq:longint;
    fp,lp:longint;
    z,rpls:integer;
    q:word;
    ss: TStringStream;
    t,t0,t1,sz: string;
    st: AnsiString;
    wasOrigin,wasVia:boolean;
    fa,ta: TNetAddr;
    RE: TJclAnsiRegEx;
    msize: longint;

const sc: array[10..16] of string = ('_[^\s\/_][^\/_]+_','\*[^\s\/][^\/*]+\*',
'/[^\s\/0-9][^\/]+/','[^\s\/](_/|/_)[^\/]+(_/|/_)','(_\*|\*_)[^\s\/][^\/]+(_\*|\*_)',
'(/\*|\*/)[^\s\/][^\/]+(/\*|\*/)','(_/\*|_\*/|/_\*|/\*_|\*/_|\*_/)[^\s\/][^\/]+(_/\*|_\*/|/_\*|/\*_|\*/_|\*_/)');

     scpunct='[ !^\"\$%&()+,\.:;<=>@\[\\\]\^`{\|}~]';

function Bitmap2RTF(pict: Graphics.TBitmap): AnsiString;
var
  bi,bb,rtf: string;
  bis,bbs: Cardinal;
  achar: ShortString;
  hexpict: string;
  I: Integer;
begin
  GetDIBSizes(pict.Handle,bis,bbs);
  SetLength(bi,bis);
  SetLength(bb,bbs);
  GetDIB(pict.Handle,pict.Palette,PChar(bi)^,PChar(bb)^);
  rtf := '{\pict\dibitmap';
  rtf := rtf+'\picprop';
  rtf := rtf+' ';
  SetLength(hexpict,(Length(bb) + Length(bi)) * 2);
  I := 2;
  for bis := 1 to Length(bi) do
  begin
    achar := Format('%x',[Integer(bi[bis])]);
    if Length(achar) = 1 then
      achar := '0' + achar;
    hexpict[I-1] := achar[1];
    hexpict[I] := achar[2];
    Inc(I,2);
  end;
  for bbs := 1 to Length(bb) do
  begin
    achar := Format('%x',[Integer(bb[bbs])]);
    if Length(achar) = 1 then
      achar := '0' + achar;
    hexpict[I-1] := achar[1];
    hexpict[I] := achar[2];
    Inc(I,2);
  end;
  rtf := rtf + hexpict + ' } ';
  Result := rtf;
end;

 procedure DoReg(reg:string);
 begin
try
   RE := TJclAnsiRegEx.Create;
   RE.Options:=[];
   RE.Compile(reg,false,false);
   sz:=MsgText.Text;
   StrReplace(sz,#13,'',[rfReplaceAll]);

   i:=1;
   while RE.Match(sz,i) do begin
   //CaptureOffset!!!
    MsgText.SelStart:=RE.CaptureOffset[0].FirstPos;
    MsgText.SelLength:=RE.CaptureOffset[0].LastPos-RE.CaptureOffset[0].FirstPos;
    MsgText.SelAttributes.Link:=true;
    MsgText.SelAttributes.BackColor:=SetupForm.txcolors[9];
    MsgText.SelLength:=0;
    i:=RE.CaptureOffset[0].LastPos;
   end;
   FreeAndNil(RE)
  except
   on E: Exception do ;
  end;

 end;

procedure DoSmiley(smile:string;nn:word);
var bmp: Graphics.TBitmap;
begin
StrReplace(smile,'\','\u0092?');
if Pos(smile,st)>0 then begin
 bmp:=Graphics.TBitMap.Create;
 MainForm.Smileys.GetBitmap(nn,bmp);
 StrReplace(st,smile,Bitmap2rtf(bmp),[rfReplaceAll]);
 bmp.Free;
end;
end;

var counter:TJclCounter;
    tn:PNodelist;
    sq:boolean;
    pm,pm1: PMsgHandle;
    xm,xm1:TXMSG;
    body,ctrl:PAnsiChar;
    origstr:longint;
    msgtxt: TStringList;
    dbug:file of TXMSG;
begin
try
 if not actv then begin
  actv:=true;
  exit;
 end;

 if MsgList.AllocBy<>Area.msga.num_msg then begin
  MsgList.AllocBy:=Area.msga.num_msg;
  Area.TotalMessages:=Area.msga.num_msg;
  MsgList.Repaint;
 end;

 DebugEvent('Loading message');
 msgOk:=false;
 counter:=TJclCounter.Create;
 counter.Start;
 if MsgList.Items.Count<1 then Exit;
 if Selected then begin
  if TwitBox.Visible then TwitHide;

  SeeAlsoBox.Visible:=false;
  sbv:=false;

  if not Area.Open then begin
   MsgText.Lines.Clear;
   MsgText.Lines.Add(lang.errbaseopen);
   MsgText.Lines.Add(lang.GetError);
  end;

  if Area.msga.locked>0 then begin
   MsgText.Text:=lang.errarealocked;
   Exit;
  end;

  DebugEvent('Opening message');
//  MsgLock(Area.msga);
  pm:=MsgOpenMsg(Area.msga,MOPEN_RW,Item.Index+1);
   if pm=nil then begin
    MsgText.Clear;
    MsgText.Lines.Add(lang.errmsgopen);
    MsgText.Lines.Add(lang.GetError);
    MsgText.Lines.Add('Msg #'+inttostr(Item.Index+1));
    Exit;
  end;

  DebugEvent ('Loading message');
  body:=StrAlloc(MsgGetTextLen(pm)+2);
  ctrl:=StrAlloc(MsgGetCtrlLen(pm)+2);
  FillChar(body^,sizeof(body^),0);
  FillChar(ctrl^,sizeof(ctrl^),0);

  FillChar(xm,sizeof(xm),0);
  MsgReadMsg(pm,@xm,0,MsgGetTextLen(pm),body,MsgGetCtrlLen(pm),ctrl);

  ctrl[MsgGetCtrlLen(pm)]:=#0;

  //  MsgUnlock(Area.msga);

{  AssignFile(dbug,'debug.xmsg');
  Rewrite(dbug);
  Write(dbug,xm);
  CloseFile(dbug);}

  msgtxt:=TStringList.Create;
  StrToStrings(CvtCtrlToKludge(ctrl)+Copy(string(body),1,MsgGetTextLen(pm)),#13,msgtxt);
  origstr:=0;
  StrDispose(body);
  StrDispose(ctrl);

  fa.Net:=0;
  fa.Point:=0;
  ta.Net:=0;
  ta.Point:=0;

  if (xm.attr and MSGLOCAL)=0 then begin
   xm.attr:=xm.attr or MSGREAD;
   MsgWriteMsg(pm,0,@xm,nil,0,0,0,nil);
  end; 

  VNum.Caption:=IntToStr(Item.Index+1)+'/'+IntToStr(Area.msga.num_msg);

  VFrom.Caption:=OemToAnsiString(xm.from);
  VTo.Caption:=OemToAnsiString(xm._to);
  VSubj.Caption:=OemToAnsiString(xm.subj);
  DateTimeToString(t,SetupForm.DateTimeFormat.Text,TStampToDateTime(xm.date_written));
  VDateTime.Caption:=t;

  VRefer.Left:=VNum.Left+VNum.Width+5;
  VRefer.Caption:='';
  VRefer.Width:=0;

  st:='{\rtf1\ansi\ansicpg1251\deff0\deflang1049{\fonttbl{\f0\fswiss\fcharset204 '+SetupForm.TextFont+';}}'+#13+ColorTable+#13+'\f0\cf1\fs'+IntToStr(trunc((SetupForm.TextFontSize)*2))+'\li'+SetupForm.ELeftMargin.Text+'0 '+#13;
  t:='';
  wasOrigin:=false;
  wasVia:=false;
  replytoarea:=Trim(self.Caption);

  msize:=0;
  DebugEvent('Loading text');
  repeat
{   if counter.RunElapsedTime>3 then begin
    counter.Stop;
    MsgText.Text:='*** Слишком длинное сообщение. Загрузка прервана ***';
    VFromAddr.Caption:='';
    VToAddr.Caption:='';
    Exit;
   end;}
   t:=msgtxt[origstr];
   inc(origstr);

      msize:=msize+length(t)+1;
   StrReplace(t,#10,'',[rfReplaceAll]);

   sz:='\cf'+IntToStr(ChkQuotes(t)+1)+CtrlChars(ChkQuotes(t));

// !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
{  if wasVia then
   if not AnsiStartsStr(^A'Via: ',t) then continue;

  if wasOrigin then
   if (not AnsiStartsStr(^A'Via: ',t)) and
   (not AnsiStartsStr(^A'PATH: ',t)) and
   (not AnsiStartsStr('SEEN-BY',t))
    then continue;}
// !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

   if origstr<msgtxt.Count-1 then
    if AnsiStartsStr('... ',t) then
     if AnsiStartsStr('--- ',msgtxt[origstr]) //incremented!
      then sz:='\cf6'+CtrlChars(5);

   if origstr<msgtxt.Count then
    if AnsiStartsStr('--- ',t) then
     if AnsiStartsStr(' * Origin: ',msgtxt[origstr])
      then sz:='\cf6'+CtrlChars(5);

   if AnsiStartsStr(' * Origin: ',t) then begin
    t0:=t;
    repeat
     delete(t0,1,pos('(',t0));
    until pos('(',t0)=0;
    delete(t0,length(t0),1);
    t1:='';
    for z:=1 to length(t0)
     do if (t0[z]>='.') and (t0[z]<=':') then t1:=t1+t0[z];
    if length(t1)>0 then ParseAddr(t1,fa,fa);
     sz:='\cf6'+CtrlChars(5);
    wasOrigin:=true;
   end;
   if length(t)>0 then if (t[1]=#1) or ((AnsiStartsStr('SEEN-BY: ',t) and wasOrigin))
    then begin
     if Pos('INTL',t)=2 then begin
      t0:=Copy(t,7,Pos(' ',Copy(t,7,length(t)-7))-1);
      Delete(t0,Pos('.',t0),length(t0)-Pos('.',t0)+1);
      q:=ta.Point;
      ParseAddr(t0,ta,ta);
      ta.Point:=q;
      t0:=Copy(t,7,length(t)-6);
      t0:=Copy(t0,Pos(' ',t0),length(t0)-Pos(' ',t0)+1);
      Delete(t0,Pos('.',t0),length(t0)-Pos('.',t0)+1);
      q:=fa.Point;
      ParseAddr(t0,fa,fa);
      fa.Point:=q;
     end;
     if Pos('FMPT',t)=2 then begin
      t0:='';
      for z:=7 to length(t) do
       if (t[z]>='0') and (t[z]<='9') then t0:=t0+t[z];
      fa.Point:=StrToInt(t0);
     end;
     if Pos('TOPT',t)=2 then begin
      t0:='';
      for z:=7 to length(t) do
       if (t[z]>='0') and (t[z]<='9') then t0:=t0+t[z];
      ta.Point:=StrToInt(t0);
     end;
     if Pos('MSGID',t)=2 then begin
      t0:=t;
      StrReplace(t0,'MSGID','REPLY');
      replystring:=t0;
      StrReplace(t0,'REPLY: ','');
      StrReplace(t0,^A,'');
      msgid:=t0;
     end;
     if Pos('Via',t)=2 then wasVia:=true; 
     if Pos('AREA',t)=2 then if SetupForm.CarbonAreas.Items.IndexOf(Trim(self.Caption))>=0
      then replytoarea:=Copy(t,7,length(t)-6);
     if MainForm.ShowKludges.Checked then sz:='\cf9'+CtrlChars(8)
     else continue;
   end;
   sz:=sz+' ';

   for i:=1 to Length(t) do
   if (ord(t[i])>=128) and (ord(t[i])<=175) then sz:=sz+Chr(Ord(t[i])+64)
   else if (ord(t[i])>=224) and (ord(t[i])<=239) then sz:=sz+Chr(Ord(t[i])+16)
   else if ((ord(t[i])>=32) and (ord(t[i])<=91))
    or ((ord(t[i])>=93) and (ord(t[i])<=122)) then sz:=sz+t[i]
  else case ord(t[i]) of
    0: sz:=sz+' ';
    1: sz:=sz+'\u9786?';
    2: sz:=sz+'\u9787?';
    3: sz:=sz+'\u9829?';
    4: sz:=sz+'\u9830?';
    5: sz:=sz+'\u9827?';
    6: sz:=sz+'\u9824?';
    9: sz:=sz+'    ';
    11: sz:=sz+'\u9794?';
    12: sz:=sz+'\u9792?';
    13: sz:=sz+'\par ';
    14: sz:=sz+'\u9835?';
    15: sz:=sz+'\u9788?';
    16: sz:=sz+'\u9658?';
    17: sz:=sz+'\u9668?';
    18: sz:=sz+'\u8597?';
    19: sz:=sz+'!!';
    20: sz:=sz+'\''b6';
    21: sz:=sz+'\''a7';
    23: sz:=sz+'\u8616?';
    24: sz:=sz+'\u8593?';
    25: sz:=sz+'\u8595?';
    26: sz:=sz+'\u8594?';
    27: sz:=sz+'\u8592?';
    29: sz:=sz+'\u8596?';
    30: sz:=sz+'\u9650?';
    31: sz:=sz+'\u9660?';
    92: sz:=sz+'\u0092?';
    123: sz:=sz+'\u0123?'; // {
    124: sz:=sz+t[i];
    125: sz:=sz+'\u0125?'; // }
    126: sz:=sz+'~';
    127: sz:=sz+' ';
//    128..175: sz:=sz+'\u'+IntToStr(Ord(t[i])+912)+'?';
    176: sz:=sz+'\u9617?';
    177: sz:=sz+'\u9618?';
    178: sz:=sz+'\u9619?';
    179: sz:=sz+'\u9474?';
    180: sz:=sz+'\u9508?';
    181: sz:=sz+'\u9569?';
    182: sz:=sz+'\u9570?';
    183: sz:=sz+'\u9558?';
    184: sz:=sz+'\u9557?';
    185: sz:=sz+'\u9571?';
    186: sz:=sz+'\u9553?';
    187: sz:=sz+'\u9559?';
    188: sz:=sz+'\u9565?';
    189: sz:=sz+'\u9564?';
    190: sz:=sz+'\u9563?';
    191: sz:=sz+'\u9488?';
    192: sz:=sz+'\u9492?';
    193: sz:=sz+'\u9524?';
    194: sz:=sz+'\u9516?';
    195: sz:=sz+'\u9500?';
    196: sz:=sz+'\u9472?';
    197: sz:=sz+'\u9532?';
    198: sz:=sz+'\u9566?';
    199: sz:=sz+'\u9567?';
    200: sz:=sz+'\u9562?';
    201: sz:=sz+'\u9556?';
    202: sz:=sz+'\u9577?';
    203: sz:=sz+'\u9574?';
    204: sz:=sz+'\u9568?';
    205: sz:=sz+'\u9552?';
    206: sz:=sz+'\u9580?';
    207: sz:=sz+'\u9575?';
    208: sz:=sz+'\u9576?';
    209: sz:=sz+'\u9572?';
    210: sz:=sz+'\u9573?';
    211: sz:=sz+'\u9561?';
    212: sz:=sz+'\u9560?';
    213: sz:=sz+'\u9554?';
    214: sz:=sz+'\u9555?';
    215: sz:=sz+'\u9579?';
    216: sz:=sz+'\u9578?';
    217: sz:=sz+'\u9496?';
    218: sz:=sz+'\u9484?';
    219: sz:=sz+'\u9608?';
    220: sz:=sz+'\u9604?';
    221: sz:=sz+'\u9612?';
    222: sz:=sz+'\u9616?';
    223: sz:=sz+'\u9600?';
//    224..239: sz:=sz+'\u'+IntToStr(Ord(t[i])+864)+'?';
    240: sz:=sz+'\''a8';
    241: sz:=sz+'\''b8';
    242: sz:=sz+'\''aa';
    243: sz:=sz+'\''ba';
    244: sz:=sz+'\''af';
    245: sz:=sz+'\''bf';
    246: sz:=sz+'\''a1';
    247: sz:=sz+'\''a2';
    248: sz:=sz+'\''b0';
    249: sz:=sz+'\''95';
    250: sz:=sz+'\''b7';
    251: sz:=sz+'\u8865?';
    252: sz:=sz+'\''b9';
    253: sz:=sz+'\''a4';
    254: sz:=sz+'\u9632?';
    255: sz:=sz+' ';
    else sz:=sz+'?';
   end; //case

  sz:=sz+'\cf1\par'+#13;

//цветовыделяем сразу
  if SetupForm.StyleHL.ItemIndex>0 then try
   for j:=16 downto 10 do begin
    FreeAndNil(RE);
    RE := TJclAnsiRegEx.Create;
    RE.Options:=[roUngreedy];
    RE.Compile(scpunct+sc[j],false,false);
    i:=0;

    while RE.Match(sz,i) do begin
     fp:=RE.CaptureOffset[0].FirstPos;
     lp:=RE.CaptureOffset[0].LastPos;
     if not ThemeForm.NoStyleColors.Checked then
      Insert(' \cf'+IntToStr(j)+CtrlChars(j),sz,fp+1)
      else Insert(' '+CtrlChars(j),sz,fp+1);
     k:=length(CtrlChars(j))+2;
     if not ThemeForm.NoStyleColors.Checked then
      k:=k+length('\cf'+IntToStr(j)+CtrlChars(j));
     Insert('\cf'+IntToStr(ChkQuotes(t)+1)+CtrlChars(ChkQuotes(t)+1)+' ',sz,lp+k);

     if j=16 then ks:=3 else if j>12 then ks:=2 else ks:=1;
     if SetupForm.StyleHL.ItemIndex=2 then begin
      if not ThemeForm.NoStyleColors.Checked then
       kq:=length(' \cf'+IntToStr(j)+CtrlChars(j))+1
       else kq:=length(' '+CtrlChars(j))+1;
      Delete(sz,fp+1+kq,ks);
      Delete(sz,lp+k-ks*2,ks);
     end;

     i:=lp+k;
    end;
    FreeAndNil(RE)
   end;
   except
    on E: Exception do ;
   end;

  st:=st+sz;

  until origstr>=msgtxt.Count;

  //smileys
  if SetupForm.ShowSmileys.Checked then begin
   DoSmiley('O:-)',2);
   DoSmiley('O:)',2);
   DoSmiley(']:->',15);
   DoSmiley(']:-)',15);
   DoSmiley(']:>',15);
   DoSmiley(':)',0);
   DoSmiley(':-)',0);
   DoSmiley(';)',1);
   DoSmiley(';-)',1);
   DoSmiley('8)',3);
   DoSmiley('8-)',3);
   DoSmiley('@}->--',4);
   DoSmiley(':P',5);
   DoSmiley(':-P',5);
   DoSmiley(':X',6);
   DoSmiley(':-X',6);
   DoSmiley('[:-}',7);
   DoSmiley('@=',8);
   DoSmiley(':-\',9);
   DoSmiley(':-/',9);
   DoSmiley(':-*',10);
   DoSmiley(':~-(',11);
   DoSmiley(':~(',11);
   DoSmiley(':-D',12);
   DoSmiley(':D',12);
   DoSmiley(':-[',13);
   DoSmiley(':[',13);
   DoSmiley(':-O',14);
   DoSmiley(':-(',16);
   DoSmiley(':(',16);
  end;

  DebugLabel.Caption:=inttostr(msize div 1024)+'k -- ';
  DebugLabel.Caption:=DebugLabel.Caption+FloatToStrF(counter.RunElapsedTime,ffFixed,18,3)+'; ';

  st:=st+'}';
  ss:=TStringStream.Create(st);

  MsgText.Font.Name:=SetupForm.TextFont;
  MsgText.Font.Size:=trunc(SetupForm.TextFontSize);

  MsgText.StreamMode:=[smSelection,smPlainRTF];
  MsgText.Lines.BeginUpdate;
  MsgText.Lines.Clear;
  MsgText.Lines.LoadFromStream(ss);
  MsgText.StreamMode:=[];
  ss.Free;

// FTN-адреса
  DoReg('\d+:\d+/\d+(\.\d+)?');

// FGHI-адреса
  DoReg('(netmail:|areafix:|echomail:|area://|faqserv://|fecho://|freq://)(\w|#|\,|-|\.|_|\/|%|~|\?|=|@|&|\+|:)+');

// URL-адреса
//  DoReg('(\w|-|\.)+\.(ru|ua|by|com|net|org|info|name|eu|us|de|fr|uk|es|it|lt|lv|ee|ar|am|az|fm)(\s|$)');
// пробел!!! в конце
  DoReg('(www\.|ftp\.|http://|ftp://)(\w|#|\,|-|\.|_|\/|\+|%|~|\?|=|@|&)+');

// E-Mail
  DoReg('(\w|-|\.)+@(\w|-|\.|_)+\.(\w){2,6}');

  if fa.net<>0 then begin
   VFromAddr.Caption:=IntToStr(fa.zone)+':'+IntToStr(fa.net)+'/'+IntToStr(fa.node);
   if fa.point<>0 then VFromAddr.Caption:=VFromAddr.Caption+'.'+IntToStr(fa.point);
  end
  else VFromAddr.Caption:='';
  if ta.net<>0 then begin
   VToAddr.Caption:=IntToStr(ta.zone)+':'+IntToStr(ta.net)+'/'+IntToStr(ta.node);
   if ta.point<>0 then VToAddr.Caption:=VToAddr.Caption+'.'+IntToStr(ta.point);
  end
  else VToAddr.Caption:='';

  if (xm.attr and MSGLOCAL)>0 then begin
   if (xm.attr and MSGSENT)=0 then flags:='unsent' else flags:='sent';
  end
  else begin
   if (xm.attr and MSGREAD)>0 then flags:='read' else flags:='unread';
  end;

  DebugLabel.Caption:=DebugLabel.Caption+FloatToStrF(counter.RunElapsedTime,ffFixed,18,3)+'; ';
  msgnum:=Item.Index+1;

  for z:=0 to MAX_REPLY-1 do begin
   VSeeAlso[z].Caption:='';
   VSeeAlso[z].Width:=0;
  end;

 if MsgUidToMsgn(Area.msga,xm.replyto,UID_EXACT)<>0 then begin
  VRefer.Caption:='-'+IntToStr(MsgUidToMsgn(Area.msga,xm.replyto,UID_EXACT));
  VRefer.Width:=(VRefer.Font.Size div 9)*8*length(VRefer.Caption);
  VRefer.Visible:=true;
 end
 else VRefer.Visible:=false;

 VPar.Left:=VRefer.Left+VRefer.Width;
 VPar.Caption:='';
 VPar.Width:=0;

 if Area.BaseType=btSquish then begin
  if VRefer.Caption<>'-0' then begin
   k:=0;
   pm1:=MsgOpenMsg(Area.msga,MOPEN_RW,k);
   if pm1<>nil then begin
    FillChar(xm1,sizeof(xm1),0);
    MsgReadMsg(pm1,@xm1,0,0,nil,0,nil);
    for z:=0 to MAX_REPLY-1 do
     if MsgUidToMsgn(Area.msga,xm1.replies[z],UID_EXACT)>Item.Index+1
     then begin
     k:=MsgUidToMsgn(Area.msga,xm1.replies[z],UID_EXACT);
     break;
    end;
    VPar.Caption:='*'+inttostr(k);
    VPar.Width:=(VPar.Font.Size div 9)*8*length(VPar.Caption);
    MsgCloseMsg(pm1);
   end;
  end;
  for z:=0 to MAX_REPLY-1 do begin
   if z=0 then VSeeAlso[z].Left:=VPar.Left+VPar.Width
    else VSeeAlso[z].Left:=VSeeAlso[z-1].Left+VSeeAlso[z-1].Width;
    if (xm.replies[z]<>0) and (MsgUidToMsgn(Area.msga,xm.replies[z],UID_EXACT)<>Item.Index+1) then
     if MsgUidToMsgn(Area.msga,xm.replies[z],UID_EXACT)>0 then begin
    VSeeAlso[z].Caption:='+'+IntToStr(MsgUidToMsgn(Area.msga,xm.replies[z],UID_EXACT));
    VSeeAlso[z].Width:=(VSeeAlso[z].Font.Size div 9)*8*length(VSeeAlso[z].Caption);
   end
   else break;
  end;
 end;

 if Area.BaseType=btJam then begin
  k:=MsgUidToMsgn(Area.msga,xm.replies[MAX_REPLY-1],UID_EXACT);
  if k<>0 then begin
   VPar.Caption:='*'+inttostr(k);
   VPar.Width:=(VPar.Font.Size div 9)*8*length(VPar.Caption);
  end;
  if xm.Replies[0]>0 then begin
   k:=MsgUidToMsgn(Area.msga,xm.replies[0],UID_EXACT);
   if k>0 then begin
    VSeeAlso[0].Caption:='+'+IntToStr(k);
    VSeeAlso[0].Width:=(VSeeAlso[0].Font.Size div 9)*8*length(VSeeAlso[0].Caption);
   end;
   for z:=1 to MAX_REPLY-2 do begin
    pm1:=MsgOpenMsg(Area.msga,MOPEN_RW,k);
    if pm1=nil then break;
    FillChar(xm1,sizeof(xm1),0);
    MsgReadMsg(pm1,@xm1,0,0,nil,0,nil);
    MsgCloseMsg(pm1);
    k:=xm1.replies[MAX_REPLY-1];
    if k>0 then begin
     k:=MsgUidToMsgn(Area.msga,k,UID_EXACT);
     if k>0 then begin
      VSeeAlso[z].Caption:='+'+IntToStr(k);
      VSeeAlso[z].Width:=(VSeeAlso[0].Font.Size div 9)*8*length(VSeeAlso[0].Caption);
     end
    end
    else break;
   end;
  end;
 end;

 if not VRefer.Visible then VSeeAlso[0].Left:=VNum.Left+VNum.Width+5
 else if not VPar.Visible then VSeeAlso[0].Left:=VRefer.Left+VRefer.Width
 else VSeeAlso[0].Left:=VPar.Left+VPar.Width;

 for z:=1 to MAX_REPLY-1 do VSeeAlso[z].Left:=VSeeAlso[z-1].Left+VSeeAlso[z-1].Width;

 if (SetupForm.TwitName.Items.IndexOf(VFrom.Caption)>-1)
  or (SetupForm.TwitName.Items.IndexOf(VFromAddr.Caption)>-1)
   then TwitShow;

 if SetupForm.TwitTo.Checked then begin
  if SetupForm.TwitName.Items.IndexOf(VTo.Caption)>-1
   then TwitShow;
  if length(VToAddr.Caption)>0 then
   if SetupForm.TwitName.Items.IndexOf(VToAddr.Caption)>-1
    then TwitShow;
 end;

 if SetupForm.TwitSubj.Items.IndexOf(VSubj.Caption)>-1
  then TwitShow;
// if (TwitBox.Visible) and (SetupForm.TwitKill.Checked)
//  then MainForm.MsgDeleteExecute(ViewForm);
// вылетает при входе в эху, если попадается твит :(
 MsgText.Lines.EndUpdate;
 MsgCloseMsg(pm);
 end;

 if MsgText.CanFocus then MsgText.SetFocus;
 PostMessage(MsgText.Handle,WM_VSCROLL,SB_TOP,0);
 HideCaret(MsgText.Handle);

 if SetupForm.ShowRegion.Checked then begin
  tn:=NdlFindAddr(fa.zone,fa.Net,fa.Node,fa.Point);
  if tn<>nil then VDateTime.Caption:=VDateTime.Caption+' ('+tn.data.location+')'
   else begin
   tn:=NdlFindAddr(fa.zone,fa.Net,fa.Node,0);
   if tn<>nil then VDateTime.Caption:=VDateTime.Caption+' ('+tn.data.location+')'
   else begin
    tn:=NdlFindAddr(fa.zone,fa.Net,0,0);
    if tn<>nil then VDateTime.Caption:=VDateTime.Caption+' ('+tn.data.location+')'
   end;
  end;
 end;

 DebugEvent('Setting Lastread');

 DebugLabel.Caption:=DebugLabel.Caption+FloatToStrF(counter.Stop,ffFixed,18,3);
 counter.Free;
 msgOk:=true;
 DebugEvent('Message loaded OK');
 FGHI.UpdateAddrText;

except
 on E: Exception do LogEvent('TViewForm.MsgListSelectItem (item #'+inttostr(Item.Index) +') encountered an exception: '+E.Message);
end;
end;

procedure TViewForm.MsgListMouseEnter(Sender: TObject);
begin
try
if (not SetupForm.Visible) and (not SeeAlsoBox.Visible)
 then MsgList.SetFocus;
MainForm.HintText('Это список сообщений в текущей области. Для удобства навигации используйте горячие клавиши:'+#13+
'Стрелка вправо - следующее сообщение, стрелка влево - предыдущее');
except
 on E: Exception do LogEvent('TViewForm.MsgListMouseEnter encountered an exception: '+E.Message);
end;
end;

procedure TViewForm.MsgTextMouseEnter(Sender: TObject);
begin
try
if (not SetupForm.Visible) and (not SeeAlsoBox.Visible)
 then MsgText.SetFocus;
HideCaret(MsgText.Handle);
MainForm.HintText('Это текст сообщения. Символом ">" и другим цветом выделены цитаты в обсуждении'+#13+
'Вы можете ответить на данное сообщение, нажав F4 или написать новое, нажав Ctrl-E');
except
 on E: Exception do LogEvent('TViewForm.MsgTextMouseEnter encountered an exception: '+E.Message);
end;
end;

procedure TViewForm.MsgTextMouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
begin
try
MsgTextMouseEnter(ViewForm);
except
 on E: Exception do LogEvent('TViewForm.MsgTextMouseMove encountered an exception: '+E.Message);
end;
end;

procedure TViewForm.MsgListMouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
begin
try
if (not SetupForm.Visible) and (not SeeAlsoBox.Visible)
 then MsgList.SetFocus;
except
 on E: Exception do LogEvent('TViewForm.MsgListMouseMove encountered an exception: '+E.Message);
end;
end;

procedure TViewForm.MsgListKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var i,ii:byte;
    w:longint;
    r:TRect;
    tb:TTabSheet;
    xf:TSimpleXForm;
    pm: PMsgHandle;
    xm: TXMSG;
begin
try
case Key of
// VK_F8: ShowTree.Execute;
 VK_F10: begin
  MainForm.NodeListTree.Execute;
  end;
 VK_DOWN: begin
   SendMessage(MsgText.Handle,WM_VSCROLL,SB_LINEDOWN,0);
  end;
 VK_UP: begin
   SendMessage(MsgText.Handle,WM_VSCROLL,SB_LINEUP,0);
  end;
 VK_NEXT: if Shift=[ssCtrl] then SendMessage(MsgList.Handle,WM_VSCROLL,SB_PAGEDOWN,0)
   else SendMessage(MsgText.Handle,WM_VSCROLL,SB_PAGEDOWN,0);
 VK_PRIOR: if Shift=[ssCtrl] then SendMessage(MsgList.Handle,WM_VSCROLL,SB_PAGEUP,0)
   else SendMessage(MsgText.Handle,WM_VSCROLL,SB_PAGEUP,0);
 VK_HOME: if Shift=[ssCtrl] then begin
    if MsgList.Items.Count>1 then begin
     MsgList.UnselectAll;
     MsgList.Selected:=MsgList.Items[0];
     MsgList.ItemFocused:=MsgList.Selected;
     MsgList.Selected.MakeVisible(false);
    end;
   end
   else SendMessage(MsgText.Handle,WM_VSCROLL,SB_TOP,0);
 VK_END: if Shift=[ssCtrl] then begin
    if MsgList.Items.Count>1 then begin
     MsgList.UnselectAll;
     MsgList.Selected:=MsgList.Items[MsgList.Items.Count-1];
     MsgList.ItemFocused:=MsgList.Selected;
     MsgList.Selected.MakeVisible(false);
    end;
   end
   else SendMessage(MsgText.Handle,WM_VSCROLL,SB_BOTTOM,0);
 191: begin
 //slash
   w:=MsgList.ItemIndex;
   while (w<MsgList.Items.Count) and (MsgList.Items[w].SubItems[4]<>'unread')
    do inc(w);
   if w<MsgList.Items.Count then begin
    MsgList.UnselectAll;
    MsgList.Selected:=MsgList.Items.Item[w];
    MsgList.ItemFocused:=MsgList.Selected;
    MsgList.Selected.MakeVisible(false);
    if MsgList.ItemIndex<MsgList.Items.Count then
     MsgList.Items[MsgList.Selected.Index+1].MakeVisible(false);
    HideCaret(MsgText.Handle);
   end;
  end;
 220: begin
 //backslash
   w:=MsgList.ItemIndex;
   while (w>=0) and (MsgList.Items[w].SubItems[4]<>'unread')
    do dec(w);
   if w>=0 then begin
    MsgList.UnselectAll;
    MsgList.Selected:=MsgList.Items.Item[w];
    MsgList.ItemFocused:=MsgList.Selected;
    MsgList.Selected.MakeVisible(false);
    if MsgList.ItemIndex>0 then
     MsgList.Items[MsgList.Selected.Index-1].MakeVisible(false);
    HideCaret(MsgText.Handle);
   end;
  end;
 VK_MULTIPLY: if length(VPar.Caption)>0 then VParMouseDown(ViewForm,mbLeft,[],0,0);
 VK_LEFT,VK_SUBTRACT: if (Shift=[ssCtrl]) or (Key=VK_SUBTRACT) then begin
   if MsgList.Items.Count=0 then exit;
   if VRefer.Visible then VRefer.OnClick(VRefer);
   end
  else begin
   if MsgList.Items.Count=0 then exit;
  if MsgList.ItemIndex>0 then begin
    w:=MsgList.ItemFocused.Index-1;
    MsgList.Selected.Selected:=false;
    MsgList.Selected:=MsgList.Items[w];
    MsgList.ItemFocused:=MsgList.Selected;
    MsgList.Selected.MakeVisible(false);
//   Message(MsgText.Handle,WM_KEYDOWN,VK_PRIOR,0);
   PostMessage(MsgText.Handle,WM_VSCROLL,SB_TOP,0);
   HideCaret(MsgText.Handle);
   if MsgList.ItemIndex>0 then
    MsgList.Items[MsgList.Selected.Index-1].MakeVisible(false);
   end;
  end;
 VK_RIGHT,VK_ADD: if (Shift=[ssCtrl]) or (Key=VK_ADD) then begin
   if MsgList.Items.Count=0 then exit;
   SeeAlsoBox.Items.Clear;
   for i:=0 to MAX_REPLY-1 do
    if VSeeAlso[i].Caption<>'' then begin
     SeeAlsoBox.Items.Add(VSeeAlso[i].Caption);
     pm:=MsgOpenMsg(Area.msga,MOPEN_READ,strtoint(VSeeAlso[i].Caption));
     if pm=nil then begin
      LogEvent ('Unable to open message #'+inttostr(strtoint(VSeeAlso[i].Caption)));
      Exit;
     end;
     FillChar(xm,sizeof(xm),#0);
     MsgReadMsg(pm,@xm,0,0,nil,0,nil);
     SeeAlsoBox.Items[SeeAlsoBox.Items.Count-1]:=
      SeeAlsoBox.Items[SeeAlsoBox.Items.Count-1]+'  '+xm.from;
     MsgCloseMsg(pm);
    end;

   if SeeAlsoBox.Items.Count=0 then begin
    key:=0;
    Exit;
   end;
   if SeeAlsoBox.Items.Count=1 then begin
    key:=0;
    for i:=0 to MAX_REPLY-1 do
     if VSeeAlso[i].Caption<>'' then begin
      VSeeAlso[i].OnClick(VSeeAlso[i]);
      break;
    end;
    Exit;
   end;
   w:=100;

   for i:=0 to SeeAlsoBox.Items.Count-1 do begin
    if length(SeeAlsoBox.Items[i])*SeeAlsoBox.Font.Size>w then w:=length(SeeAlsoBox.Items[i])*SeeAlsoBox.Font.Size;
   end;
   SeeAlsoBox.Height:=Trunc(SeeAlsoBox.Items.Count*SeeAlsoBox.ItemHeight*1.15);
   SeeAlsoBox.Width:=w;
   if ii>=SeeAlsoBox.Items.Count then ii:=0;
   SeeAlsoBox.Selected[ii]:=true;
   SeeAlsoBox.Top:=MsgText.Top;
   SeeAlsoBox.Visible:=true;
   sbv:=true;
   SeeAlsoBox.SetFocus;
   key:=0;
   exit;
   end

  else begin
  if MsgList.Items.Count<2 then Exit;
  MsgList.SelectNextItem(true);
  MsgList.Selected.MakeVisible(false);
  if MsgList.ItemIndex<MsgList.Items.Count-1 then
   MsgList.Items[MsgList.Selected.Index+1].MakeVisible(false);
  HideCaret(MsgText.Handle);
  end;
 VK_INSERT: if Shift=[ssCtrl] then MsgText.CopyToClipboard
  else MainForm.MsgNew.Execute;
 65: if Shift=[ssCtrl] then MsgText.SelectAll; //Ctrl-A
 67: if Shift=[ssCtrl] then MsgText.CopyToClipboard; //Ctrl-C
 VK_DELETE: MainForm.MsgDelete.Execute;
 VK_F4: if Shift=[ssAlt] then MainForm.Close;
//else showmessage(inttostr(key));
end; //case
key:=0;
except
 on E: Exception do LogEvent('TViewForm.MsgListKeyDown encountered an exception: '+E.Message);
end;
end;

procedure TViewForm.MsgTextKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
try
MsgListKeyDown(Sender,Key,Shift);
except
 on E: Exception do LogEvent('TViewForm.MsgTextKeyDown encountered an exception: '+E.Message);
end;
end;

procedure TViewForm.MsgTextMouseWheel(Sender: TObject; Shift: TShiftState;
  WheelDelta: Integer; MousePos: TPoint; var Handled: Boolean);
begin
try
if WheelDelta<0 then
 SendMessage(MsgText.Handle,WM_VSCROLL,SB_LINEDOWN,0)
else
 SendMessage(MsgText.Handle,WM_VSCROLL,SB_LINEUP,0);
HideCaret(MsgText.Handle);
except
 on E: Exception do LogEvent('TViewForm.MsgTextMouseWheel encountered an exception: '+E.Message);
end;
end;

procedure TViewForm.Action1Execute(Sender: TObject);
begin
try
if length(VSeeAlso[1].Caption)>1 then begin
 MsgList.Selected:=MsgList.Items.Item[Abs(StrToInt(VSeeAlso[1].Caption))-1];
 if MsgList.Selected.Index+3<MsgList.Items.Count then MsgList.Items.Item[MsgList.Selected.Index+3].MakeVisible(false)
 else if MsgList.Selected.Index+2<MsgList.Items.Count then MsgList.Items.Item[MsgList.Selected.Index+2].MakeVisible(false)
 else if MsgList.Selected.Index+1<MsgList.Items.Count then MsgList.Items.Item[MsgList.Selected.Index+1].MakeVisible(false)
 else MsgList.Items.Item[MsgList.Selected.Index].MakeVisible(false);
end;
except
 on E: Exception do LogEvent('TViewForm.Action1Execute encountered an exception: '+E.Message);
end;
end;

procedure TViewForm.Action2Execute(Sender: TObject);
begin
try
if length(VSeeAlso[2].Caption)>1 then begin
 MsgList.Selected:=MsgList.Items.Item[Abs(StrToInt(VSeeAlso[2].Caption))-1];
 if MsgList.Selected.Index+3<MsgList.Items.Count then MsgList.Items.Item[MsgList.Selected.Index+3].MakeVisible(false)
 else if MsgList.Selected.Index+2<MsgList.Items.Count then MsgList.Items.Item[MsgList.Selected.Index+2].MakeVisible(false)
 else if MsgList.Selected.Index+1<MsgList.Items.Count then MsgList.Items.Item[MsgList.Selected.Index+1].MakeVisible(false)
 else MsgList.Items.Item[MsgList.Selected.Index].MakeVisible(false);
end;
except
 on E: Exception do LogEvent('TViewForm.Action2Execute encountered an exception: '+E.Message);
end;
end;

procedure TViewForm.Action3Execute(Sender: TObject);
begin
try
if length(VSeeAlso[3].Caption)>1 then begin
 MsgList.Selected:=MsgList.Items.Item[Abs(StrToInt(VSeeAlso[3].Caption))-1];
 if MsgList.Selected.Index+3<MsgList.Items.Count then MsgList.Items.Item[MsgList.Selected.Index+3].MakeVisible(false)
 else if MsgList.Selected.Index+2<MsgList.Items.Count then MsgList.Items.Item[MsgList.Selected.Index+2].MakeVisible(false)
 else if MsgList.Selected.Index+1<MsgList.Items.Count then MsgList.Items.Item[MsgList.Selected.Index+1].MakeVisible(false)
 else MsgList.Items.Item[MsgList.Selected.Index].MakeVisible(false);
end;
except
 on E: Exception do LogEvent('TViewForm.Action3Execute encountered an exception: '+E.Message);
end;
end;

procedure TViewForm.Action4Execute(Sender: TObject);
begin
try
if length(VSeeAlso[4].Caption)>1 then begin
 MsgList.Selected:=MsgList.Items.Item[Abs(StrToInt(VSeeAlso[4].Caption))-1];
 if MsgList.Selected.Index+3<MsgList.Items.Count then MsgList.Items.Item[MsgList.Selected.Index+3].MakeVisible(false)
 else if MsgList.Selected.Index+2<MsgList.Items.Count then MsgList.Items.Item[MsgList.Selected.Index+2].MakeVisible(false)
 else if MsgList.Selected.Index+1<MsgList.Items.Count then MsgList.Items.Item[MsgList.Selected.Index+1].MakeVisible(false)
 else MsgList.Items.Item[MsgList.Selected.Index].MakeVisible(false);
end;
except
 on E: Exception do LogEvent('TViewForm.Action4Execute encountered an exception: '+E.Message);
end;
end;

procedure TViewForm.Action5Execute(Sender: TObject);
begin
try
if length(VSeeAlso[5].Caption)>1 then begin
 MsgList.Selected:=MsgList.Items.Item[Abs(StrToInt(VSeeAlso[5].Caption))-1];
 if MsgList.Selected.Index+3<MsgList.Items.Count then MsgList.Items.Item[MsgList.Selected.Index+3].MakeVisible(false)
 else if MsgList.Selected.Index+2<MsgList.Items.Count then MsgList.Items.Item[MsgList.Selected.Index+2].MakeVisible(false)
 else if MsgList.Selected.Index+1<MsgList.Items.Count then MsgList.Items.Item[MsgList.Selected.Index+1].MakeVisible(false)
 else MsgList.Items.Item[MsgList.Selected.Index].MakeVisible(false);
end;
except
 on E: Exception do LogEvent('TViewForm.Action5Execute encountered an exception: '+E.Message);
end;
end;

procedure TViewForm.Action6Execute(Sender: TObject);
begin
try
if length(VSeeAlso[6].Caption)>1 then begin
 MsgList.Selected:=MsgList.Items.Item[Abs(StrToInt(VSeeAlso[6].Caption))-1];
 if MsgList.Selected.Index+3<MsgList.Items.Count then MsgList.Items.Item[MsgList.Selected.Index+3].MakeVisible(false)
 else if MsgList.Selected.Index+2<MsgList.Items.Count then MsgList.Items.Item[MsgList.Selected.Index+2].MakeVisible(false)
 else if MsgList.Selected.Index+1<MsgList.Items.Count then MsgList.Items.Item[MsgList.Selected.Index+1].MakeVisible(false)
 else MsgList.Items.Item[MsgList.Selected.Index].MakeVisible(false);
end;
except
 on E: Exception do LogEvent('TViewForm.Action6Execute encountered an exception: '+E.Message);
end;
end;

procedure TViewForm.Action7Execute(Sender: TObject);
begin
try
if length(VSeeAlso[7].Caption)>1 then begin
 MsgList.Selected:=MsgList.Items.Item[Abs(StrToInt(VSeeAlso[7].Caption))-1];
 if MsgList.Selected.Index+3<MsgList.Items.Count then MsgList.Items.Item[MsgList.Selected.Index+3].MakeVisible(false)
 else if MsgList.Selected.Index+2<MsgList.Items.Count then MsgList.Items.Item[MsgList.Selected.Index+2].MakeVisible(false)
 else if MsgList.Selected.Index+1<MsgList.Items.Count then MsgList.Items.Item[MsgList.Selected.Index+1].MakeVisible(false)
 else MsgList.Items.Item[MsgList.Selected.Index].MakeVisible(false);
end;
except
 on E: Exception do LogEvent('TViewForm.Action7Execute encountered an exception: '+E.Message);
end;
end;

procedure TViewForm.Action8Execute(Sender: TObject);
begin
try
if length(VSeeAlso[8].Caption)>1 then begin
 MsgList.Selected:=MsgList.Items.Item[Abs(StrToInt(VSeeAlso[8].Caption))-1];
 if MsgList.Selected.Index+3<MsgList.Items.Count then MsgList.Items.Item[MsgList.Selected.Index+3].MakeVisible(false)
 else if MsgList.Selected.Index+2<MsgList.Items.Count then MsgList.Items.Item[MsgList.Selected.Index+2].MakeVisible(false)
 else if MsgList.Selected.Index+1<MsgList.Items.Count then MsgList.Items.Item[MsgList.Selected.Index+1].MakeVisible(false)
 else MsgList.Items.Item[MsgList.Selected.Index].MakeVisible(false);
end;
except
 on E: Exception do LogEvent('TViewForm.Action8Execute encountered an exception: '+E.Message);
end;
end;


procedure TViewForm.MsgListDrawItem(Sender: TCustomListView;
  Item: TListItem; Rect: TRect; State: TOwnerDrawState);
var i:longint;
   li:TListItem;
begin
//0 Списки: текст
//1 Списки: фон1
//2 Списки: фон2
//3 Списки: текущий элемент - текст
//4 Списки: текущий элемент - фон
//5 Список сообщений: персональное
//6 Список сообщений: непрочитанное
//7 Список сообщений: неотправленное
//8 Список сообщений: от модератора

try
if Item=nil then Exit;
if Item.Caption='' then Exit;
if Item.SubItems.Count<5 then Exit;
li:=Item;

with Sender as TListView, Canvas do begin
 if li.Selected then Brush.Color:=SetupForm.ifcolors[4] else
  if (StrToInt(li.Caption) mod 2=1) then
   Brush.Color:=SetupForm.ifcolors[1] else Brush.Color:=SetupForm.ifcolors[2];
 Brush.Style:=bsSolid;
 FillRect(Rect);
 if li.Selected then Font.Color:=SetupForm.ifcolors[3]
  else begin
  Font.Color:=SetupForm.ifcolors[0];

  if li.Subitems.Strings[4]='unread' then Font.Color:=SetupForm.ifcolors[6];
  if Pos('moderator',StrLower(li.Subitems.Strings[0]))>0 then Font.Color:=SetupForm.ifcolors[8];
  if li.Subitems.Strings[4]='unsent' then Font.Color:=SetupForm.ifcolors[7];
  if li.Subitems.Strings[1]=SetupForm.Users.Text then
   if li.Subitems.Strings[4]<>'unsent' then Font.Color:=SetupForm.ifcolors[5];
  end;

 if SetupForm.TwitName.Items.IndexOf(li.Subitems.Strings[0])>-1
  then Font.Style:=[fsStrikeOut];

 if SetupForm.TwitTo.Checked then
  if SetupForm.TwitName.Items.IndexOf(li.Subitems.Strings[1])>-1
   then Font.Style:=[fsStrikeOut];

 if SetupForm.TwitSubj.Items.IndexOf(li.Subitems.Strings[2])>-1
  then Font.Style:=[fsStrikeOut];

 TextOut(Rect.Left+5,Rect.Top,li.Caption);

 if li.Subitems.Count>=2 then begin

  TextOut((Sender as TListView).Columns.Items[0].Width+5,Rect.Top,li.Subitems.Strings[0]);

  Font.Color:=SetupForm.ifcolors[4];
  if li.Subitems.Strings[4]='unread' then Font.Color:=SetupForm.ifcolors[6];
  if li.Subitems.Strings[4]='unsent' then Font.Color:=SetupForm.ifcolors[7];
  TextOut((Sender as TListView).Columns.Items[1].Width+(Sender as TListView).Columns.Items[0].Width+5,Rect.Top,li.Subitems.Strings[1]);
  Font.Color:=SetupForm.ifcolors[4];
  if li.Subitems.Strings[4]='unread' then Font.Color:=SetupForm.ifcolors[6];
  if li.Subitems.Strings[4]='unsent' then Font.Color:=SetupForm.ifcolors[7];
  TextOut((Sender as TListView).Columns.Items[2].Width+(Sender as TListView).Columns.Items[1].Width+(Sender as TListView).Columns.Items[0].Width+5,Rect.Top,li.Subitems.Strings[2]);
  Rect.Left:=(Sender as TListView).Columns.Items[3].Width+(Sender as TListView).Columns.Items[2].Width+(Sender as TListView).Columns.Items[1].Width+(Sender as TListView).Columns.Items[0].Width-5;
  FillRect(Rect);
  TextOut((Sender as TListView).Columns.Items[3].Width+(Sender as TListView).Columns.Items[2].Width+(Sender as TListView).Columns.Items[1].Width+(Sender as TListView).Columns.Items[0].Width+5,Rect.Top,li.Subitems.Strings[3]);
  Rect.Left:=(Sender as TListView).Columns.ITems[4].Width+(Sender as TListView).Columns.Items[3].Width+(Sender as TListView).Columns.Items[2].Width+(Sender as TListView).Columns.Items[1].Width+(Sender as TListView).Columns.Items[0].Width-5;

  Rect.Right:=MsgList.Width;
  if (StrToInt(li.Caption) mod 2=1) then
   Brush.Color:=SetupForm.ifcolors[1] else Brush.Color:=SetupForm.ifcolors[2];
   FillRect(Rect);
 end;
end;
except
 on E: Exception do LogEvent('TViewForm.MsgListDrawItem encountered an exception: '+E.Message+' (hint: subitems.count='+inttostr(Item.SubItems.Count)+')');
end;
end;

procedure TViewForm.FormCreate(Sender: TObject);
var z:byte;
begin
try
FormType:=ftView;
actv:=false;
for z:=0 to MAX_REPLY-1 do begin
 VSeeAlso[z]:=TJvStaticText.Create(HeaderPanel);
 VSeeAlso[z].Parent:=HeaderPanel;
 VSeeAlso[z].Caption:='';
 VSeeAlso[z].AutoSize:=false;
 VSeeAlso[z].Top:=VRefer.Top;
 VSeeAlso[z].Left:=VRefer.Left+50;
 VSeeAlso[z].Width:=0;
 VSeeAlso[z].Height:=VRefer.Height;
 VSeeAlso[z].Cursor:=VRefer.Cursor;
 VSeeAlso[z].Font:=VRefer.Font;
 VSeeAlso[z].OnClick:=VRepliesClick;
end;
TwitBox.Align:=alClient;
except
 on E: Exception do LogEvent('TViewForm.FormCreate encountered an exception: '+E.Message);
end;
end;

procedure TViewForm.SeeAlsoBoxClick(Sender: TObject);
var s:string;
begin
try
s:=Copy(SeeAlsoBox.Items[SeeAlsoBox.ItemIndex],2,pos(' ',SeeAlsoBox.Items[SeeAlsoBox.ItemIndex])-2);
MsgList.Selected:=MsgList.Items.Item[StrToInt(s)-1];
 if MsgList.Selected.Index+3<MsgList.Items.Count then MsgList.Items.Item[MsgList.Selected.Index+3].MakeVisible(false)
 else if MsgList.Selected.Index+2<MsgList.Items.Count then MsgList.Items.Item[MsgList.Selected.Index+2].MakeVisible(false)
 else if MsgList.Selected.Index+1<MsgList.Items.Count then MsgList.Items.Item[MsgList.Selected.Index+1].MakeVisible(false)
 else MsgList.Items.Item[MsgList.Selected.Index].MakeVisible(false);
except
 on E: Exception do LogEvent('TViewForm.SeeAlsoBoxClick encountered an exception: '+E.Message);
end;
end;

procedure TViewForm.SeeAlsoBoxKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
try
case key of
 VK_ESCAPE: begin
  SeeAlsoBox.Visible:=false;
  sbv:=false;
  MsgText.SetFocus;
 end;
 VK_RETURN: SeeAlsoBox.OnClick(SeeAlsoBox);
 VK_UP,VK_LEFT: if SeeAlsoBox.ItemIndex=0
  then SeeAlsoBox.ItemIndex:=SeeAlsoBox.Items.Count-1
  else SeeAlsoBox.ItemIndex:=SeeAlsoBox.ItemIndex-1;
 VK_DOWN,VK_RIGHT: if SeeAlsoBox.ItemIndex=SeeAlsoBox.Items.Count-1
  then SeeAlsoBox.ItemIndex:=0
  else SeeAlsoBox.ItemIndex:=SeeAlsoBox.ItemIndex+1;
 VK_HOME: SeeAlsoBox.ItemIndex:=0;
 VK_END: SeeAlsoBox.ItemIndex:=SeeAlsoBox.Items.Count-1; 
end; //case
key:=0;
except
 on E: Exception do LogEvent('TViewForm.SeeAlsoBoxKeyDown encountered an exception: '+E.Message);
end;
end;

procedure TViewForm.MsgTextURLClick(Sender: TObject; const URLText: String;
  Button: TMouseButton);
var RE,RE1: TJclAnsiRegEx;
    s:string;
begin
if Button<>mbLeft then Exit;
try
 if (Pos('://',URLText)>0) or
  (AnsiStartsStr('netmail:',URLText)) or
  (AnsiStartsStr('echomail:',URLText)) or
  (AnsiStartsStr('areafix:',URLText))
  then begin
   FGHI.DoAddr(URLText);
   Exit;
  end;

 RE := TJclAnsiRegEx.Create;
 RE.Options:=[];
 RE.Compile('(\w|-)+@(\w|-)+\.(\w){2,6}',false,false);
 if RE.Match(URLText,1) then ShellExecEx('mailto:'+URLText)
  else begin
   RE1 := TJclAnsiRegEx.Create;
   RE1.Options:=[];
   RE1.Compile('\d+:\d+/\d+(\.\d+)?',false,false);
   if RE1.Match(URLText,1) then begin
    if SetupForm.ENetMail.Text='' then ShowMessage(lang.errnonetmail)
     else MainForm.NewMsg(Config.Areas.FindEchoArea(SetupForm.ENetMail.Text),nil,0,New,URLText);
   end
   else begin
    s:=URLText;
    if pos('://',s)=0 then s:='http://'+s;
    ShellExecEx(s);
   end;
   RE1.Free;
  end;
 RE.Free;
except
 ;
end;
end;

procedure TViewForm.ViewSplitterMoved(Sender: TObject);
begin
try
vfh:=MsgList.Height;
except
 on E: Exception do LogEvent('TViewForm.ViewSplitterMoved encountered an exception: '+E.Message);
end;
end;

procedure TViewForm.ViewSplitterDblClick(Sender: TObject);
begin
try
//глючит :(
//MsgList.Height:=200;
MsgList.Visible:=not MsgList.Visible;
ViewSplitter.MinSize:=vfh;
except
 on E: Exception do LogEvent('TViewForm.ViewSplitterDblClick encountered an exception: '+E.Message);
end;
end;

procedure TViewForm.FormPaint(Sender: TObject);
begin
try
ViewSplitter.MinSize:=1;
except
 on E: Exception do LogEvent('TViewForm.FormPaint encountered an exception: '+E.Message);
end;
end;

procedure TViewForm.HeaderPanelMouseEnter(Sender: TObject);
begin
try
if not SeeAlsoBox.Visible then begin
 if MsgList.Visible then MsgList.SetFocus else MsgText.SetFocus;
end;
except
 on E: Exception do LogEvent('TViewForm.HeaderPanelMouseEnter encountered an exception: '+E.Message);
end;
end;

procedure TViewForm.TwitShow;
begin
try
if TwitBox.Visible then Exit;
TwitBox.Show;
TwitWarning.Show;
ReadBtn.Show;
DeleteBtn.Show;
except
 on E: Exception do LogEvent('TViewForm.TwitShow encountered an exception: '+E.Message);
end;
end;

procedure TViewForm.TwitHide;
begin
try
TwitBox.Hide;
TwitWarning.Hide;
ReadBtn.Hide;
DeleteBtn.Hide;
except
 on E: Exception do LogEvent('TViewForm.TwitHide encountered an exception: '+E.Message);
end;
end;

procedure TViewForm.HeaderPanelMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
try
HeaderPanelMouseEnter(ViewForm);
except
 on E: Exception do LogEvent('TViewForm.HeaderPanelMouseMove encountered an exception: '+E.Message);
end;
end;

procedure TViewForm.ReadBtnClick(Sender: TObject);
begin
try
TwitHide;
except
 on E: Exception do LogEvent('TViewForm.ReadBtnClick encountered an exception: '+E.Message);
end;
end;

procedure TViewForm.DeleteBtnClick(Sender: TObject);
begin
try
MainForm.MsgDeleteExecute(ViewForm);
except
 on E: Exception do LogEvent('TViewForm.DeleteBtnClick encountered an exception: '+E.Message);
end;
end;

procedure TViewForm.VParMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
var s:string;
begin
try
s:=Copy(VPar.Caption,2,Length(VPar.Caption)-1);
if length(s)>0 then begin
 MsgList.Selected:=MsgList.Items.Item[StrToInt(s)-1];
 MsgList.OnSelectItem(ViewForm,MsgList.Selected,true);
 if MsgList.Selected.Index+3<MsgList.Items.Count then MsgList.Items.Item[MsgList.Selected.Index+3].MakeVisible(false)
 else if MsgList.Selected.Index+2<MsgList.Items.Count then MsgList.Items.Item[MsgList.Selected.Index+2].MakeVisible(false)
 else if MsgList.Selected.Index+1<MsgList.Items.Count then MsgList.Items.Item[MsgList.Selected.Index+1].MakeVisible(false)
 else MsgList.Items.Item[MsgList.Selected.Index].MakeVisible(false);
end;
except
 on E: Exception do LogEvent('TViewForm.VParMouseDown encountered an exception: '+E.Message);
end;
end;

procedure TViewForm.SeeAlsoBoxMouseEnter(Sender: TObject);
begin
SeeAlsoBox.SetFocus;
end;

procedure TViewForm.SeeAlsoBoxMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
SeeAlsoBoxMouseEnter(ViewForm);
end;

procedure TViewForm.ShowTreeExecute(Sender: TObject);
var k,z:longint;
begin
try
if MsgList.Items.Count<=1 then begin
 ShowMessage(lang.notree);
 Exit;
end; 

{if (Area.msga2.GetSeeAlso=0) and (Area.msga2.GetRefer=0) then begin
 CloseMsgArea(Area.msga2);
 ShowMessage(lang.notree);
 Exit;
end;}

TreeForm.Tree.Items.Clear;
TreeForm.curmsg:=MsgList.ItemIndex+1;
TreeForm.Area:=Area;
TreeForm.ShowModal;
except
 on E: Exception do LogEvent('TViewForm.ShowTreeExecute encountered an exception: '+E.Message);
end;
end;

procedure TViewForm.ESearchChange(Sender: TObject);
begin
if Length(ESearch.Text)>0 then SearchBtn.Enabled:=true
 else SearchBtn.Enabled:=false;
MsgText.SelLength:=0;
end;

procedure TViewForm.SearchCancelBtnClick(Sender: TObject);
begin
SearchBox.Hide;
end;

procedure TViewForm.ESearchKeyPress(Sender: TObject; var Key: Char);
begin
if key=#13 then if SearchBtn.Enabled then SearchBtn.OnClick(Self);
if key=#27 then SearchCancelBtn.OnClick(Self);
end;

procedure TViewForm.SearchBtnClick(Sender: TObject);
 procedure FindInCurrent;
 var
  FoundAt: LongInt;
  StartPos, ToEnd: Integer;
 begin
  with MsgText do
  begin
    { begin the search after the current selection if there is one }
    { otherwise, begin at the start of the text }
    if SelLength <> 0 then
      StartPos := SelStart + SelLength
    else StartPos := 0;

    { ToEnd is the length from StartPos to the end of the text in the rich edit control }

    ToEnd := Length(Text) - StartPos;
    FoundAt := FindText(ESearch.Text, StartPos, ToEnd, []);
    if FoundAt <> -1 then
    begin
      SetFocus;
      SelStart := FoundAt;
      SelLength := Length(ESearch.Text);
    end;
  end;
 end;
begin
if SOptOnlyCurrent.Checked then FindInCurrent;
//...
end;

procedure TViewForm.SOptFromFirstClick(Sender: TObject);
begin
// !!! SOptOnlyHeader.Enabled:=true;

 ShowNI(SOptFromFirst);
 SOptOnlyCurrent.Checked:=true;
end;

procedure TViewForm.SOptOnlyCurrentClick(Sender: TObject);
begin
 SOptOnlyHeader.Enabled:=false;
end;

procedure TViewForm.Timer1Timer(Sender: TObject);
begin
 MsgText.SetFocus;
 SendMessage(MsgText.Handle,WM_VSCROLL,SB_TOP,0);
 HideCaret(MsgText.Handle);
 Timer1.Enabled:=false;
end;

procedure TViewForm.MsgListKeyPress(Sender: TObject; var Key: Char);
begin
 if key=#27 then MainForm.CloseBtn.OnClick(MainForm);
 key:=#0;
end;

procedure TViewForm.VRepliesClick(Sender: TObject);
var s:string;
begin
try
s:=Copy((Sender as TJvStaticText).Caption,2,Length((Sender as TJvStaticText).Caption)-1);
if length(s)>=1 then begin
 MsgList.Selected:=MsgList.Items.Item[StrToInt(s)-1];
 MsgList.OnSelectItem(ViewForm,MsgList.Selected,true);
 MsgList.Items.Item[MsgList.Selected.Index].MakeVisible(false);
end;
except
 on E: Exception do LogEvent('TViewForm.VRepliesClick encountered an exception: '+E.Message);
end;
end;

end.
