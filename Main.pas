unit Main;

interface

uses
  ConfigType, FlatSB, Messages, SysUtils, Variants, Classes,Controls, Forms,
  Dialogs, Grids, JvExGrids, JvCharMap, JvComponentBase, JvAppStorage,
  JvAppIniStorage, ExtCtrls, JvExExtCtrls, JvNavigationPane, JvExControls,
  JvComponent, JvPageList, Jvg3DColors, StdCtrls,
  JvgListBox, JvExStdCtrls, JvListBox, JvDotNetControls,
  JvXPCore, JvXPBar, JvgAskListBox, ComCtrls, JvExComCtrls, JvListView,
  JvTabBar, JvComCtrls, JvFullColorSpaces, JvFullColorCtrls,
  Menus, ActnList, StdActns, JvMenus, JvRichEdit,
  smapi, JvTimer, JvFormPlacement, JvEdit,
  ImgList, JvSpeedbar, Printers, JvHint, JvBalloonHint, JvPanel,
  JvBehaviorLabel, JvHtControls, JvLabel, JvSimpleXml, Windows,
  ActnMan, ActnColorMaps, View, IniFiles, JvgTab, JvgPage,
  JvButton, JvCtrls, JvSpeedButton, Graphics, ClipBrd, SimpleXForm,
  Buttons, JvExButtons, JvBitBtn, JvXPButtons;



Const WSB_PROP_CYVSCROLL = $1;
      WSB_PROP_CXHSCROLL = $2;
      WSB_PROP_CYHSCROLL = $4;
      WSB_PROP_CXVSCROLL = $8;
      WSB_PROP_CXHTHUMB = $10;
      WSB_PROP_CYVTHUMB = $20;
      WSB_PROP_VBKGCOLOR = $40;
      WSB_PROP_HBKGCOLOR = $80;
      WSB_PROP_VSTYLE = $100;
      WSB_PROP_HSTYLE = $200;
      WSB_PROP_WINSTYLE = $400;
      WSB_PROP_PALETTE = $800;
      WSB_PROP_MASK = $FFF;

Const FSB_FLAT_MODE = 2;
      FSB_ENCARTA_MODE = 1;
      FSB_REGULAR_MODE = 0;

const
  ID_READCFG = 49001;
  ID_CLOSEME = 49002;
  ID_DESTROYTAB = 49003;

const MSGBUFSIZE=10485760;

type TNewMsgType = (New, Quote, NoQuote, Comment, Fwd, EditMsg);

type
  TLevel = (Info, Warning);
  TMainForm = class(TForm)
    AreaListHeader: TJvNavPaneToolPanel;
    VertSplitter: TJvOutlookSplitter;
    FilePageSetup: TFilePageSetup;
    FileExit: TFileExit;
    FileSaveAs: TFileSaveAs;
    PrintDlg: TPrintDlg;
    MainMenu: TJvMainMenu;
    File1: TMenuItem;
    Exit1: TMenuItem;
    N2: TMenuItem;
    PrintSetup1: TMenuItem;
    Print1: TMenuItem;
    N3: TMenuItem;
    SaveAs1: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    N6: TMenuItem;
    MenuItemPainter: TJvXPMenuItemPainter;
    Setup: TAction;
    N7: TMenuItem;
    ReadCfg: TAction;
    AreaList: TJvListView;
    StyleMgr: TJvNavPaneStyleManager;
    WindowIniFileStorage: TJvAppIniFileStorage;
    WindowFormStorage: TJvFormStorage;
    MsgMenu: TMenuItem;
    New1: TMenuItem;
    ActionList: TActionList;
    MsgNew: TAction;
    MsgQuote: TAction;
    MsgNoQuote: TAction;
    MsgComment: TAction;
    MsgQuoteAnother: TAction;
    N1: TMenuItem;
    N8: TMenuItem;
    N9: TMenuItem;
    N10: TMenuItem;
    Glyphs: TImageList;
    Refresh: TAction;
    MsgDelete: TAction;
    MsgEdit: TAction;
    ShowKludges: TAction;
    N11: TMenuItem;
    ShowContacts: TAction;
    N12: TMenuItem;
    ContactsSplitter: TJvOutlookSplitter;
    Contacts: TJvNavPaneToolPanel;
    ContactList: TJvListView;
    CLAdd: TAction;
    CLDelete: TAction;
    CLEdit: TAction;
    JvBalloonHint1: TJvBalloonHint;
    FastFind: TEdit;
    Timer1: TTimer;
    Smileys: TImageList;
    FullScreen: TAction;
    DelayHint: TTimer;
    N13: TMenuItem;
    About: TAction;
    N14: TMenuItem;
    N15: TMenuItem;
    N16: TMenuItem;
    MsgForward: TAction;
    N17: TMenuItem;
    N18: TMenuItem;
    N19: TMenuItem;
    NodeListTree: TAction;
    FindMsg: TAction;
    ReplyMenu: TJvPopupMenu;
    N20: TMenuItem;
    N21: TMenuItem;
    N22: TMenuItem;
    N23: TMenuItem;
    ColorCodes: TAction;
    ColorCodes1: TMenuItem;
    ShowToolBar: TAction;
    N24: TMenuItem;
    N25: TMenuItem;
    N26: TMenuItem;
    ShowTree: TAction;
    N27: TMenuItem;
    N28: TMenuItem;
    BackPanel: TJvPanel;
    MainBar: TJvSpeedBar;
    JvSpeedBarSection1: TJvSpeedBarSection;
    JvSpeedBarSection2: TJvSpeedBarSection;
    JvSpeedBarSection3: TJvSpeedBarSection;
    JvSpeedItem1: TJvSpeedItem;
    JvSpeedItem2: TJvSpeedItem;
    JvSpeedItem3: TJvSpeedItem;
    JvSpeedItem4: TJvSpeedItem;
    JvSpeedItem5: TJvSpeedItem;
    JvSpeedItem6: TJvSpeedItem;
    JvSpeedItem7: TJvSpeedItem;
    JvSpeedItem8: TJvSpeedItem;
    JvSpeedItem9: TJvSpeedItem;
    HintPanel: TJvPanel;
    HideLabel: TJvLabel;
    HintLbl: TJvLabel;
    PageList: TJvgPageControl;
    CloseBtn: TJvImgBtn;
    ShowLog: TAction;
    ContactsXML: TJvSimpleXML;
    FGHIpanel: TJvPanel;
    FGHIaddr: TJvEdit;
    FGHIgo: TJvXPButton;
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure SetupExecute(Sender: TObject);
    procedure ReadCfgExecute(Sender: TObject);
    procedure AreaListResize(Sender: TObject);
    procedure AreaListCompare(Sender: TObject; Item1, Item2: TListItem;
      Data: Integer; var Compare: Integer);
    procedure AreaListSelectItem(Sender: TObject; Item: TListItem;
      Selected: Boolean);
    procedure AreaListKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure AreaListMouseEnter(Sender: TObject);
    procedure FastFindEnter(Sender: TObject);
    procedure AreaListClick(Sender: TObject);
    procedure MsgNewExecute(Sender: TObject);
    procedure MsgQuoteExecute(Sender: TObject);
    procedure MsgNoQuoteExecute(Sender: TObject);
    procedure MsgCommentExecute(Sender: TObject);
    procedure PrintDlgAccept(Sender: TObject);
    procedure RefreshExecute(Sender: TObject);
    procedure MsgDeleteExecute(Sender: TObject);
    procedure AreaListKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure AreaListKeyPress(Sender: TObject; var Key: Char);
    procedure FileSaveAsAccept(Sender: TObject);
    procedure FilePageSetupAccept(Sender: TObject);
    procedure ShowKludgesExecute(Sender: TObject);
    procedure TabBarTabSelected(Sender: TObject; Item: TJvTabBarItem);
    procedure ContactListMouseEnter(Sender: TObject);
    procedure ContactListMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure ContactListResize(Sender: TObject);
    procedure ContactListDblClick(Sender: TObject);
    procedure ShowContactsExecute(Sender: TObject);
    procedure ContactsClose(Sender: TObject);
    procedure CLAddExecute(Sender: TObject);
    procedure CLDeleteExecute(Sender: TObject);
    procedure CLEditExecute(Sender: TObject);
    procedure HideLabelClick(Sender: TObject);
    procedure CloseLabelClick(Sender: TObject);
    procedure ContactListSelectItem(Sender: TObject; Item: TListItem;
      Selected: Boolean);
    procedure AreaListDrawItem(Sender: TCustomListView; Item: TListItem;
      Rect: TRect; State: TOwnerDrawState);
    procedure ContactListDrawItem(Sender: TCustomListView; Item: TListItem;
      Rect: TRect; State: TOwnerDrawState);
    procedure Timer1Timer(Sender: TObject);
    procedure HintLblClick(Sender: TObject);
    procedure HintPanelMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure WindowFormStorageSavePlacement(Sender: TObject);
    procedure WindowFormStorageRestorePlacement(Sender: TObject);
    procedure VertSplitterDblClick(Sender: TObject);
    procedure FullScreenExecute(Sender: TObject);
    procedure FormPaint(Sender: TObject);
    procedure DelayHintTimer(Sender: TObject);
    procedure AboutExecute(Sender: TObject);
    procedure MsgForwardExecute(Sender: TObject);
    procedure MsgQuoteAnotherExecute(Sender: TObject);
    procedure AreaListMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure NodeListTreeExecute(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure MsgEditExecute(Sender: TObject);
    procedure FindMsgExecute(Sender: TObject);
    procedure ColorCodesExecute(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure ShowToolBarExecute(Sender: TObject);
    procedure ShowTreeExecute(Sender: TObject);
    procedure AreaListMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure AreaListMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure CloseBtnClick(Sender: TObject);
    procedure ShowLogExecute(Sender: TObject);
    procedure FGHIbarAlign;
    procedure FormResize(Sender: TObject);
    procedure PageListChange(Sender: TObject);
    procedure FGHIgoClick(Sender: TObject);
    procedure FGHIaddrKeyPress(Sender: TObject; var Key: Char);
  private
    procedure ReadCfgMsg(var Message); message ID_READCFG;
    procedure CloseMeMsg(var Message); message ID_CLOSEME;
    { Private declarations }
  public
    shifted: boolean;
    DefSmileys: TImageList;
    Clipboard: TClipBoard;

    procedure DoContactList;
    procedure NewMsg(Area:TArea; OrigArea: TArea; msgnum: longint; NewMsgType: TNewMsgType; ForceToAddr:string=''; ForceToName:string='');
    procedure ShowTB;
    procedure HintText(text:string;level:TLevel=Info);
    { Public declarations }
  end;

Function ParseAddr(AStr: String; CurrAddr: TNetAddr; Var DestAddr: TNetAddr): Boolean;
function striplead(st:string;ch:char):string;
Function StripTrail(St:String;Ch:Char):String;
Function StripBoth(St:String;Ch:Char):String;

// версия софта
const ProductName = 'SimpleX ''Next''';
function GetFileVersion: string;

// сообщение "Not Implemented"
procedure ShowNI(ACtrl:TControl);

type TNodelistRec = record
 zone,region,net,node,point: word;
 prefix: string[10];
 system,location: string[64];
 sysop: string[48];
 phone: string[24];
 flags: string[128];
end;

var NdlRec: TNodelistRec;

  MainForm: TMainForm;

  kbd: boolean=false;
  numedits:longint=0;

  MarginLeft,MarginTop,MarginRight,MarginBottom :LongInt;
  ptpx,ptpy :Real;

  vfh:integer;

  tws:TWindowState;

  started:boolean=false;

  function TStampToDateTime(stamp: TStamp):TDateTime;
  function MakeTStamp(day,month:byte;year:word;hour,minute,second:byte):TStamp;


implementation

{$R *.dfm}

uses Setup, Log, Edit, JCLStrings, JCLMath, StrUtils,
  About, SelDest, NodeList, Language, ThemesEdit, Contact,
  mkstring, JclDateTime, FGHIprocs;

function MakeTStamp(day,month:byte;year:word;hour,minute,second:byte):TStamp;
var y:byte;
begin
 if year<80 then year:=year+2000;
 if year<100 then year:=year+1900;
 y:=year-1980;
 result.Date:=day or (month shl 5) or (y shl 9);
 result.Time:=(second div 2) or (minute shl 5) or (hour shl 11);
end;

function TStampToDateTime(stamp: TStamp):TDateTime;
var day,month,y,hour,minute,second:byte;
    year:word;
begin
 day:=stamp.Date and $1F; //11111
 month:=(stamp.Date and $1E0) shr 5; // 111100000
 y:=(stamp.Date and $FE00) shr 9; // 1111111000000000
 year:=y+1980;
 second:=(stamp.Time and $1F) shl 1; // 11111
 minute:=(stamp.Time and $7E0) shr 5; // 11111100000
 hour:=(stamp.Time and $F800) shr 11; // 1111100000000000

 if year<1980 then year:=1980;
 if (month<1) or (month>12) then month:=1;
 if (day<1) or (day>31) then day:=1;
 result:=EncodeDate(year,month,day)+(hour/24)+(minute/24/60)+(second/24/3600);
end;

procedure ShowNI(ACtrl: TControl);
begin
 try
  MainForm.JvBalloonHint1.ActivateHint(ACtrl,'Поддержка данной функции пока не реализована');
 except
  on E: Exception do LogEvent('ShowNI encountered an exception: '+E.Message);
 end;
end;

procedure TMainForm.FormShow(Sender: TObject);
begin
 try
  FGHIbarAlign;
  CloseBtn.Top:=PageList.Top+3;
  CloseBtn.Left:=PageList.Left+PageList.Width-CloseBtn.Width-1;
  //если уже стартовали, и это переход
  // в полноэкранный режим или из него - выходим
  if started then begin
   AreaListHeader.Caption:='Выберите область';
   Contacts.Caption:='Контакты';
   Exit;
  end;

  try
   SetupForm.FormStorage.RestoreFormPlacement;
  except
   ;
  end;
  ReadCfgExecute(MainForm);
  AreaList.SetFocus;
  if AreaList.Items.Count<>0 then begin
   kbd:=true;
   AreaList.Items[0].Selected:=true;
   AreaList.Items[0].Focused:=true;
  end;
  ShowContacts.Checked:=SetupForm.ShowContacts.Checked;
  Contacts.Visible:=ShowContacts.Checked;
  ShowTB;
  ContactsSplitter.Visible:=ShowContacts.Checked;
  HintPanel.Visible:=SetupForm.ShowHintPanel.Checked;
  HintLbl.Width:=HintPanel.Width-HideLabel.Width-10;
  // настройка принтера
  FilePageSetupAccept(MainForm);
  HintText('Добро пожаловать в SimpleX!');
//  if AreaList.Items.Count=0 then Setup.Execute;
  if (SetupForm.Users.Items.Count=0)
   or (SetupForm.FtnAddr.Items.Count=0)
    then Setup.Execute;
  started:=true;
 except
  on E: Exception do LogEvent('TMainForm.FormShow encountered an exception: '+E.Message);
 end;
end;


procedure TMainForm.FormCreate(Sender: TObject);
var x:TJvSimpleXMLElem;
    i:integer;
begin
 try
  ClipBoard:=TClipBoard.Create;
  shifted:=false;
  Config:=TConfig.Create;
  FGHI:=TFGHI.Create;
  Screen.Cursor:=crHourGlass;

  DefSmileys:=TImageList.Create(MainForm);
  DefSmileys.AddImages(MainForm.Smileys);

  if not FileExists(ExtractFilePath(Application.ExeName)+'contacts.xml') then begin
   ContactsXML.Prolog.Encoding:='windows-1251';
   ContactsXML.Root.Name:='contacts';
   x:=ContactsXML.Root.Items.Add('contact');
   x.Items.Add('displayname','Егор Глухов');
   x.Items.Add('name','Egor Glukhov');
   x.Items.Add('address','2:5061/120');
   x.Items.Add('e-mail','kaman@rndfido.net');
  end
  else ContactsXML.LoadFromFile(ExtractFilePath(Application.ExeName)+'contacts.xml');
  DoContactList;
  for i:=0 to Contacts.Buttons.Count-1 do Contacts.Buttons[i].Enabled:=true;
 except
  on E: Exception do LogEvent('TMainForm.FormCreate encountered an exception: '+E.Message);
 end;
end;

procedure TMainForm.FormDestroy(Sender: TObject);
begin
 try
  FGHI.Free;
  Config.Free;
  DefSmileys.Free;
  ClipBoard.Free;
  lang.Free;
  MsgCloseApi;
 except
  on E: Exception do LogEvent('TMainForm.FormDestroy encountered an exception: '+E.Message);
 end;
end;

procedure TMainForm.SetupExecute(Sender: TObject);
begin
 try
  SetupForm.ShowModal;
 except
  on E: Exception do LogEvent('TMainForm.SetupExecute encountered an exception: '+E.Message);
 end;
end;

procedure TMainForm.ReadCfgExecute(Sender: TObject);
var i:word;
    sp: integer;

    sorted:boolean;
    li:TListItem;
    sf:string;
begin
 try
  if AreaList.ItemFocused<>nil then
   sf:=AreaList.ItemFocused.Caption else sf:='';

  FGHIpanel.Visible:=SetupForm.ShowFGHIaddr.Checked;
  FastFind.Text:='';
  FastFind.Hide;
  AreaListHeader.Caption:='Ждите..';
  AreaListHeader.Repaint;

  sp:=GetScrollPos(AreaList.Handle,1);

  AreaList.Items.BeginUpdate;
  Config.Areas.Clear;


  if SetupForm.TosserConfig.Text<>'' then begin
   Chdir(ExtractFilePath(SetupForm.TosserConfig.Text));
   if SetupForm.HPT.Checked then Config.ReadHPTConfig(SetupForm.TosserConfig.Text);
   if SetupForm.Partoss.Checked then Config.ReadPartossConfig(SetupForm.TosserConfig.Text);
   if SetupForm.AreasBBS.Checked then Config.ReadAreasBBS(SetupForm.TosserConfig.Text);
   if SetupForm.BBToss.Checked then Config.ReadBBTossConfig(SetupForm.TosserConfig.Text);
   Chdir(ExtractFilePath(Application.ExeName));
  end;

  Config.ReadAreaDefs;
  Config.Areas.DoAreaList;

  AreaListHeader.Caption:=AreaListHeader.Caption+'.';

  AreaListHeader.Repaint;
  AreaList.Items.EndUpdate;

  AreaList.Scroll(0,sp*trunc(abs(AreaList.Font.Height)+2));

  if length(sf)>0 then begin
   if AreaList.FindCaption(0,sf,false,true,false)<>nil then
    AreaList.ItemFocused:=AreaList.FindCaption(0,sf,false,true,false)
   else if AreaList.Items.Count>0 then AreaList.ItemFocused:=AreaList.Items[0];
   AreaList.ItemFocused.MakeVisible(false);
  end;

  Application.Title := 'SimpleX';
  AreaListHeader.Caption:='Выберите область';
  AreaListHeader.Repaint;
  Screen.Cursor:=crDefault;

{if Config.Conflict.Count>0 then begin
 Config.conflict.Insert(0,lang.conflict);
 LogEvent(Config.Conflict.Text);
end;

Config.Conflict.Free;}

 except
  on E: Exception do LogEvent('TMainForm.ReadCfgExecute encountered an exception: '+E.Message);
 end;
end;

procedure TMainForm.ReadCfgMsg;
begin
 try
  ReadCfgExecute(MainForm);
 except
  on E: Exception do LogEvent('TMainForm.ReadCfgMsg encountered an exception: '+E.Message);
 end;
end;


procedure TMainForm.CloseMeMsg;
var tb:TTabSheet;
    AllowClose:boolean;
    li:TListItem;
    xf: TSimpleXForm;
    Area: TArea;
    var i:integer;
    cl: boolean;
begin
 try
  if PageList.PageCount=0 then Exit;
  tb:=PageList.ActivePage;

  xf:=tb.Components[0] as TSimpleXForm;

  if xf.FormType=ftView then if xf.Area.msga<>nil then if
   TViewForm(xf).MsgList.Selected<>nil then begin
   if TViewForm(xf).msgOk
//    then xf.Area.SetLastRead(TViewForm(xf).msgid);
    then xf.Area.SetLastRead(TViewForm(xf).MsgList.ItemIndex+1);
   xf.Area.TotalMessages:=xf.Area.msga.num_msg;
   xf.Area.UnreadMessages:=xf.Area.msga.num_msg-xf.Area.GetLastRead;
   if xf.Area.UnreadMessages<0 then xf.Area.UnreadMessages:=0;
  end;

  if xf.FormType=ftEdit then
   if not TEditForm(xf).msgsaved then
    if Application.MessageBox(PAnsiChar(lang.editclosetab),PAnsiChar(lang.confirmation),MB_YESNO)=IDNO
    then Exit;

  if xf.FormType=ftView then begin
   TViewForm(xf).MsgList.OnData:=nil;
   cl:=true;
  end
  else cl:=false; 

  Area:=xf.Area;

  DebugEvent ('Closing form...');
  xf.Free;
  xf:=nil;
  DebugEvent ('Closing tab...');

  tb.Parent:=nil;
  tb.Free;
  tb:=nil;

  if cl then if Area.msga<>nil then begin
   DebugEvent ('Closing area...');
   MsgCloseArea(Area.msga);
   Area.msga:=nil;
  end;

  DebugEvent ('OK');

  if PageList.PageCount=0 then begin
   CloseBtn.Visible:=false;
   AreaList.SetFocus;
   ShowTree.Enabled:=false;
   MsgNew.Enabled:=false;
   MsgQuote.Enabled:=false;
   MsgDelete.Enabled:=false;
   MsgNoQuote.Enabled:=false;
   MsgComment.Enabled:=false;
   MsgQuoteAnother.Enabled:=false;
   MsgForward.Enabled:=false;
   MsgEdit.Enabled:=false;
   FileSaveAs.Enabled:=false;
   PrintDlg.Enabled:=false;
  end
  else for i:=0 to PageList.PageCount-1 do
  if TSimpleXForm(PageList.Pages[i].Components[0]).Area=Area then begin
   PageList.ActivePage:=PageList.Pages[i];
   break;
  end;
  if PageList.PageCount>0 then begin
   xf:=PageList.ActivePage.Components[0] as TSimpleXForm;
   if xf.FormType=ftView then
    TViewForm(xf).MsgText.SetFocus;
   if xf.FormType=ftEdit then
    TEditForm(xf).MsgText.SetFocus;
  end;
  FGHI.UpdateAddrText;
 except
  on E: Exception do LogEvent('TMainForm.CloseMeMsg encountered an exception: '+E.Message);
 end;
end;

procedure TMainForm.AreaListResize(Sender: TObject);
begin
 try
  if AreaList.Width>99 then AreaList.Column[0].Width:=AreaList.Width-AreaList.Column[1].Width-25;
 except
  on E: Exception do LogEvent('TMainForm.AreaListResize encountered an exception: '+E.Message);
 end;
end;

procedure TMainForm.AreaListCompare(Sender: TObject; Item1,
  Item2: TListItem; Data: Integer; var Compare: Integer);
var i,j:integer;
    Area1,Area2: TArea;

 procedure CheckAreas;
 begin
  Area1:=TArea(Item1.Data);
  Area2:=TArea(Item2.Data);

  if Area1=nil then begin
   LogEvent('Area not found: '+Item1.Caption);
   Exit;
  end;
  if Area2=nil then begin
   LogEvent('Area not found: '+Item2.Caption);
   Exit;
  end;
 end;

begin
//Без сортировки
//По имени
//По типу (net/echo/local)
//По типу (net/local/echo)
//По наличию новых писем
//По AKA

 Compare:=0;
 if SetupForm.Rule1.ItemIndex=0 then Exit;

 case SetupForm.Rule1.ItemIndex of
  1: if UpperCase(Item1.Caption)>UpperCase(Item2.Caption) then Compare:=1
   else if UpperCase(Item1.Caption)<UpperCase(Item2.Caption) then Compare:=-1;
  2: begin
   CheckAreas;
   if (Area1.AreaType=atNetmail) and (Area2.AreaType<>atNetmail) then Compare:=-1;
   if (Area1.AreaType=atEcho) and (Area2.AreaType=atLocal) then Compare:=-1;
   if (Area1.AreaType=atEcho) and (Area2.AreaType=atNetmail) then Compare:=1;
   if (Area1.AreaType=atLocal) and (Area2.AreaType<>atLocal) then Compare:=1;
  end; //2
  3: begin
   CheckAreas;
   if (Area1.AreaType=atNetmail) and (Area2.AreaType<>atNetmail) then Compare:=-1;
   if (Area1.AreaType=atLocal) and (Area2.AreaType=atEcho) then Compare:=-1;
   if (Area1.AreaType=atLocal) and (Area2.AreaType=atNetmail) then Compare:=1;
   if (Area1.AreaType=atEcho) and (Area2.AreaType<>atEcho) then Compare:=1;
  end; //3
  4: begin
   CheckAreas;
   if (Area1.UnreadMessages>0) and (Area2.UnreadMessages=0) then Compare:=-1
    else if (Area1.UnreadMessages=0) and (Area2.UnreadMessages>0) then Compare:=1
  end; //4
  5: begin
   CheckAreas;
   if (Area1.FromAddr<Area2.FromAddr) then Compare:=-1
    else if (Area1.FromAddr>Area2.FromAddr) then Compare:=1
  end; //5
 end; //case
 if SetupForm.Rule1Reverse.Checked then Compare:=-Compare;
 if Compare<>0 then Exit;

 case SetupForm.Rule2.ItemIndex of
  1: if UpperCase(Item1.Caption)>UpperCase(Item2.Caption) then Compare:=1
   else if UpperCase(Item1.Caption)<UpperCase(Item2.Caption) then Compare:=-1;
  2: begin
   CheckAreas;
   if (Area1.AreaType=atNetmail) and (Area2.AreaType<>atNetmail) then Compare:=-1;
   if (Area1.AreaType=atEcho) and (Area2.AreaType=atLocal) then Compare:=-1;
   if (Area1.AreaType=atEcho) and (Area2.AreaType=atNetmail) then Compare:=1;
   if (Area1.AreaType=atLocal) and (Area2.AreaType<>atLocal) then Compare:=1;
  end; //2
  3: begin
   CheckAreas;
   if (Area1.AreaType=atNetmail) and (Area2.AreaType<>atNetmail) then Compare:=-1;
   if (Area1.AreaType=atLocal) and (Area2.AreaType=atEcho) then Compare:=-1;
   if (Area1.AreaType=atLocal) and (Area2.AreaType=atNetmail) then Compare:=1;
   if (Area1.AreaType=atEcho) and (Area2.AreaType<>atEcho) then Compare:=1;
  end; //3
  4: begin
   CheckAreas;
   if (Area1.UnreadMessages>0) and (Area2.UnreadMessages=0) then Compare:=-1
    else if (Area1.UnreadMessages=0) and (Area2.UnreadMessages>0) then Compare:=1
  end; //4
  5: begin
   CheckAreas;
   if (Area1.FromAddr<Area2.FromAddr) then Compare:=-1
    else if (Area1.FromAddr>Area2.FromAddr) then Compare:=1
  end; //5
 end; //case

 if SetupForm.Rule2Reverse.Checked then Compare:=-Compare;
 if Compare<>0 then Exit;

 case SetupForm.Rule3.ItemIndex of
  1: if UpperCase(Item1.Caption)>UpperCase(Item2.Caption) then Compare:=1
   else if UpperCase(Item1.Caption)<UpperCase(Item2.Caption) then Compare:=-1;
  2: begin
   CheckAreas;
   if (Area1.AreaType=atNetmail) and (Area2.AreaType<>atNetmail) then Compare:=-1;
   if (Area1.AreaType=atEcho) and (Area2.AreaType=atLocal) then Compare:=-1;
   if (Area1.AreaType=atEcho) and (Area2.AreaType=atNetmail) then Compare:=1;
   if (Area1.AreaType=atLocal) and (Area2.AreaType<>atLocal) then Compare:=1;
  end; //2
  3: begin
   CheckAreas;
   if (Area1.AreaType=atNetmail) and (Area2.AreaType<>atNetmail) then Compare:=-1;
   if (Area1.AreaType=atLocal) and (Area2.AreaType=atEcho) then Compare:=-1;
   if (Area1.AreaType=atLocal) and (Area2.AreaType=atNetmail) then Compare:=1;
   if (Area1.AreaType=atEcho) and (Area2.AreaType<>atEcho) then Compare:=1;
  end; //3
  4: begin
   CheckAreas;
   if (Area1.UnreadMessages>0) and (Area2.UnreadMessages=0) then Compare:=-1
    else if (Area1.UnreadMessages=0) and (Area2.UnreadMessages>0) then Compare:=1
  end; //4
  5: begin
   CheckAreas;
   if (Area1.FromAddr<Area2.FromAddr) then Compare:=-1
    else if (Area1.FromAddr>Area2.FromAddr) then Compare:=1
  end; //5
 end; //case
 if SetupForm.Rule3Reverse.Checked then Compare:=-Compare;
end;

procedure TMainForm.AreaListSelectItem(Sender: TObject; Item: TListItem;
  Selected: Boolean);
var f2:TViewForm;
    xf:TSimpleXForm;
    tb:TTabSheet;
    i:integer;
    keepcur: boolean;
    z:longint;
begin
 try
  Screen.Cursor:=crHourGlass;
  if Item=nil then Exit;
  if not kbd then
  if Selected then begin
   tb:=nil;
   for i:=0 to MainForm.PageList.PageCount-1 do begin
    xf:=TSimpleXForm(MainForm.PageList.Pages[i].Components[0]);
    if xf.FormType<>ftView then continue;
    if xf.Area=TArea(Item.Data) then tb:=MainForm.PageList.Pages[i];
   end;
   if tb=nil then begin

    if (PageList.PageCount>0)
     and (((SetupForm.AreasOnClick.ItemIndex=1) and (not shifted))
      or ((SetupForm.AreasOnClick.ItemIndex=0) and (shifted)))
      then begin
     xf:=TSimpleXForm(MainForm.PageList.ActivePage.Components[0]);
     if xf.FormType=ftView then begin
      f2:=TViewForm(xf);

      if f2.MsgList.Selected<>nil then begin
//       if f2.msgOk then f2.Area.SetLastRead(f2.msgid);
       if f2.msgOk then f2.Area.SetLastRead(f2.MsgList.ItemIndex+1);
       f2.Area.TotalMessages:=f2.Area.msga.num_msg;
       f2.Area.UnreadMessages:=f2.Area.msga.num_msg-xf.Area.GetLastRead;
       if f2.Area.UnreadMessages<0 then f2.Area.UnreadMessages:=0;
      end;

      f2.Area:=TArea(Item.Data);
      f2.Caption:=TArea(Item.Data).Name;
      PageList.ActivePage.Caption:=' '+Item.Caption;
      if f2.Area.Open then begin
       f2.MsgList.Clear;
       f2.FormShow(f2);

//       f2.MsgListSelectItem(f2.MsgList,f2.MsgList.Selected,true);
      end
      else begin
       f2.MsgList.AllocBy:=0;
       f2.MsgText.Lines.Clear;
       f2.MsgText.Lines.Add(lang.errbaseopen);
       f2.MsgText.Lines.Add(lang.GetError);
      end;
      AreaList.Selected:=nil;
      Screen.Cursor:=crDefault;
      Exit;
     end;
    end;

    tb:=TTabSheet.Create(PageList);
    tb.Parent:=PageList;
    tb.PageControl:=PageList;

    f2:=TViewForm.Create(tb);
    f2.Parent:=tb;

    f2.Area:=TArea(Item.Data);
    f2.Area.Open;
    f2.Align:=alClient;
    f2.Caption:=TArea(Item.Data).Name;
    f2.MsgList.Color:=SetupForm.ifcolors[1];
    f2.MsgList.Height:=vfh;
    f2.Visible:=true;
    f2.MsgText.Color:=SetupForm.ifcolors[9];
    f2.HeaderPanel.Color:=SetupForm.ifcolors[24];
    f2.HeaderPanel.Font.Color:=SetupForm.ifcolors[25];
    f2.LNum.Font.Color:=f2.HeaderPanel.Font.Color;
    f2.LFrom.Font.Color:=f2.HeaderPanel.Font.Color;
    f2.LTo.Font.Color:=f2.HeaderPanel.Font.Color;
    f2.LSubj.Font.Color:=f2.HeaderPanel.Font.Color;
    f2.VNum.Font.Color:=SetupForm.ifcolors[26];
    f2.VFrom.Font.Color:=f2.VNum.Font.Color;
    f2.VTo.Font.Color:=f2.VNum.Font.Color;
    f2.VSubj.Font.Color:=f2.VNum.Font.Color;
    f2.VRefer.Font.Color:=f2.VNum.Font.Color;
    f2.VPar.Font.Color:=f2.VNum.Font.Color;
    for i:=0 to MAX_REPLY-1 do f2.VSeeAlso[i].Font.Color:=f2.VNum.Font.Color;
    f2.VFromAddr.Font.Color:=f2.VNum.Font.Color;
    f2.VToAddr.Font.Color:=f2.VNum.Font.Color;
    f2.VDateTime.Font.Color:=f2.VNum.Font.Color;
   end;

   PageList.ActivePage:=tb;
   if (tb<>nil) and (f2<>nil) then tb.Caption:=' '+Item.Caption;
   ShowTree.Enabled:=true;
   MsgNew.Enabled:=true;
   MsgQuote.Enabled:=true;
   MsgDelete.Enabled:=true;
   MsgNoQuote.Enabled:=true;
   MsgComment.Enabled:=true;
   MsgQuoteAnother.Enabled:=true;
   MsgForward.Enabled:=true;
   MsgEdit.Enabled:=true;
   FileSaveAs.Enabled:=true;
   PrintDlg.Enabled:=true;
  end;
  AreaList.Selected:=nil;
  Screen.Cursor:=crDefault;
  if PageList.PageCount>0 then CloseBtn.Visible:=true;
  FGHI.UpdateAddrText;
 except
  on E: Exception do LogEvent('TMainForm.AreaListSelectItem encountered an exception: '+E.Message);
 end;
end;

procedure TMainForm.AreaListKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var t:string;
    i,j:word;
    li:TListItem;
    vf:TViewForm;
begin
 try
  if ssShift in Shift then shifted:=true else shifted:=false;
  if AreaList.Items.Count<1 then Exit;
  if AreaList.ItemFocused=nil then AreaList.ItemFocused:=AreaList.Items[0];
  if key<>13 then begin
   kbd:=true;
   case key of
    ord('A')..ord('Z'): begin
     FastFind.Show;
     FastFind.Text:=FastFind.Text+Chr(key);
    end;

    ord('0'): if Shift<>[ssShift] then begin
     FastFind.Show;
     FastFind.Text:=FastFind.Text+'0';
    end;

     ord('1'): if Shift<>[ssShift] then begin
      FastFind.Show;
      FastFind.Text:=FastFind.Text+'1';
     end
     else begin
      FastFind.Show;
      FastFind.Text:=FastFind.Text+'!';
     end;

     ord('2'): if Shift<>[ssShift] then begin
      FastFind.Show;
      FastFind.Text:=FastFind.Text+'2';
     end
     else begin
      FastFind.Show;
      FastFind.Text:=FastFind.Text+'@';
     end;

     ord('3'): if Shift<>[ssShift] then begin
      FastFind.Show;
      FastFind.Text:=FastFind.Text+'3';
     end
     else begin
      FastFind.Show;
      FastFind.Text:=FastFind.Text+'#';
     end;

     ord('4'): if Shift<>[ssShift] then begin
      FastFind.Show;
      FastFind.Text:=FastFind.Text+'4';
     end
     else begin
      FastFind.Show;
      FastFind.Text:=FastFind.Text+'$';
     end;

     ord('5'): if Shift<>[ssShift] then begin
      FastFind.Show;
      FastFind.Text:=FastFind.Text+'5';
     end
     else begin
      FastFind.Show;
      FastFind.Text:=FastFind.Text+'%';
     end;

     ord('6'): if Shift<>[ssShift] then begin
      FastFind.Show;
      FastFind.Text:=FastFind.Text+'6';
     end
     else begin
      FastFind.Show;
      FastFind.Text:=FastFind.Text+'^';
     end;

     ord('7'): if Shift<>[ssShift] then begin
      FastFind.Show;
      FastFind.Text:=FastFind.Text+'7';
     end
     else begin
      FastFind.Show;
      FastFind.Text:=FastFind.Text+'&';
     end;

     ord('8'): if Shift<>[ssShift] then begin
      FastFind.Show;
      FastFind.Text:=FastFind.Text+'8';
     end;

     ord('9'): if Shift<>[ssShift] then begin
      FastFind.Show;
      FastFind.Text:=FastFind.Text+'9';
     end;

     190: begin
      FastFind.Show;
      FastFind.Text:=FastFind.Text+'.'
     end;

     222: begin
      FastFind.Show;
      FastFind.Text:=FastFind.Text+''''
     end;

     8: if length(FastFind.Text)>0 then begin
      t:=FastFind.Text;
      Delete(t,length(FastFind.Text),1);
      FastFind.Text:=t;
      if length(FastFind.Text)=0 then FastFind.Hide;
     end;

     VK_F4: if Shift=[ssAlt] then MainForm.Close;

     VK_DOWN: begin
      i:=AreaList.ItemFocused.Index;
      if i<AreaList.Items.Count-1 then begin
       AreaList.Items.Item[i+1].Selected:=true;
       AreaList.Items.Item[i+1].Focused:=true;
       AreaList.Items.Item[i+1].MakeVisible(false);
      end;
      key:=0;
      FastFind.Text:='';
      FastFind.Hide;
      Exit;
     end;

     VK_UP: begin
      i:=AreaList.ItemFocused.Index;
      if i>0 then begin
       AreaList.Items.Item[i-1].Selected:=true;
       AreaList.Items.Item[i-1].Focused:=true;
       AreaList.Items.Item[i-1].MakeVisible(false);
      end;
      key:=0;
      FastFind.Text:='';
      FastFind.Hide;
      Exit;
     end;

     VK_NEXT: begin
      i:=AreaList.ItemFocused.Index;
      j:=AreaList.VisibleRowCount;
      if i<AreaList.Items.Count-j then begin
       AreaList.Items.Item[i+j].Selected:=true;
       AreaList.Items.Item[i+j].Focused:=true;
       AreaList.Items.Item[i+j].MakeVisible(false);
      end
      else begin
       AreaList.UnselectAll;
       AreaList.Items.Item[AreaList.Items.Count-1].Selected:=true;
       AreaList.Items.Item[AreaList.Items.Count-1].Focused:=true;
       AreaList.Items.Item[AreaList.Items.Count-1].MakeVisible(false);
      end;
      key:=0;
      FastFind.Text:='';
      FastFind.Hide;
      Exit;
     end;

     VK_PRIOR: begin
      i:=AreaList.ItemFocused.Index;
      j:=AreaList.VisibleRowCount;
      if i>j-1 then begin
       AreaList.Items.Item[i-j].Selected:=true;
       AreaList.Items.Item[i-j].Focused:=true;
       AreaList.Items.Item[i-j].MakeVisible(false);
      end
      else begin
       AreaList.Items.Item[0].Selected:=true;
       AreaList.Items.Item[0].Focused:=true;
       AreaList.Items.Item[0].MakeVisible(false);
      end;
      key:=0;
      FastFind.Text:='';
      FastFind.Hide;
      Exit;
     end;

     VK_HOME: begin
      AreaList.Items.Item[0].Selected:=true;
      AreaList.Items.Item[0].Focused:=true;
      AreaList.Items.Item[0].MakeVisible(false);
      FastFind.Text:='';
      FastFind.Hide;
      key:=0;
      Exit;
     end;

     VK_END: begin
      AreaList.Items.Item[AreaList.Items.Count-1].Selected:=true;
      AreaList.Items.Item[AreaList.Items.Count-1].Focused:=true;
      AreaList.Items.Item[AreaList.Items.Count-1].MakeVisible(false);
      FastFind.Text:='';
      FastFind.Hide;
      key:=0;
      Exit;
     end;

     VK_LEFT,VK_RIGHT,VK_ESCAPE,VK_ADD,VK_SUBTRACT,VK_MULTIPLY: if PageList.PageCount>0 then begin
     //qqq
      vf:=PageList.ActivePage.Components[0] as TViewForm;
      if vf<>nil then begin
       PostMessage(vf.MsgText.Handle,WM_KEYDOWN,key,0);
       FastFind.Text:='';
       FastFind.Hide;
       vf.SetFocus;
      end;
     //
     end;
    end; //case
   end
   else begin
    kbd:=false;
    FastFind.Text:='';
    FastFind.Hide;
    AreaList.OnSelectItem(AreaList,AreaList.ItemFocused,true);
   end;
   key:=0;
   if FastFind.Visible then begin
    if AreaList.ItemFocused=nil then AreaList.ItemFocused:=AreaList.Items[0];
    li:=AreaList.FindCaption(AreaList.ItemFocused.Index,FastFind.Text,true,true,true);
    if li<>nil then begin
    li.Focused:=true;
    li.MakeVisible(false);
   end;
  end;
 except
  on E: Exception do LogEvent('TMainForm.AreaListKeyDown encountered an exception: '+E.Message);
 end;
end;

procedure TMainForm.AreaListMouseEnter(Sender: TObject);
begin
 try
  HintText('Это список областей. Щёлкните на интересующей Вас области для чтения сообщений.');
  if (not SetupForm.Visible) and (not sbv)
   then if PageList.PageCount=0 then
   AreaList.SetFocus
  else
   if TSimpleXForm(PageList.ActivePage.Components[0]).FormType<>ftEdit
   then AreaList.SetFocus
{ if TabBar.Tabs.Count=0 then AreaList.SetFocus;}
 except
  on E: Exception do LogEvent('TMainForm.AreaListMouseEnter encountered an exception: '+E.Message);
 end;
end;

procedure TMainForm.AreaListMouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
begin
 AreaListMouseEnter(Sender);
end;


procedure TMainForm.FastFindEnter(Sender: TObject);
begin
 try
  AreaList.SetFocus;
 except
  on E: Exception do LogEvent('TMainForm.FastFindEnter encountered an exception: '+E.Message);
 end;
end;

procedure TMainForm.AreaListClick(Sender: TObject);
begin
 try
  kbd:=false;
  if AreaList.ItemFocused<>nil then
   AreaList.OnSelectItem(AreaList,AreaList.ItemFocused,true);
 except
  on E: Exception do LogEvent('TMainForm.AreaListClick encountered an exception: '+E.Message);
 end;
end;

procedure TMainForm.NewMsg(Area:TArea; OrigArea: TArea; msgnum: longint; NewMsgType: TNewMsgType; ForceToAddr:string=''; ForceToName:string='');

   function GetInitials(const S: string): string;

     function FirstChar(const S: string): string;
     begin
     try
      if S='' then Result:='' else Result := S[1];
     except
      on E: Exception do LogEvent('FirstChar encountered an exception: '+E.Message);
     end;
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

   begin
    try
    Result :=
    FirstChar(ExtractWord(S, 1))+
    FirstChar(ExtractWord(S, 2))+
    FirstChar(ExtractWord(S, 3));
    except
     on E: Exception do LogEvent('GetInitials encountered an exception: '+E.Message);
    end;
   end;

var f3:TEditForm;
    tb:TTabSheet;
    i,j,k,k0,k0t,k1: word;
    z: longint;
    s,t,t0,t1,prefix: string;
    ss:TStringStream;
    st:string;
    OrigMsg,OrigMsg1,sl:TStringList;
    origstr:integer;
    jj:boolean;
    pm: PMsgHandle;
    tf:TFont;
    fa,ta: TNetAddr;
    OrigFromName, OrigToName, OrigFromAddr, OrigToAddr, DateTime: string;
    pa:PAnsiChar;
    body,ctrl:PAnsiChar;
    xm:TXMSG;
    ts:TTimeStamp;
    wasOrigin: boolean;
begin
 try
  if Area=nil then exit;
  pm:=nil;
  DebugEvent ('New message in "'+Area.Name+'"');
  OrigMsg:=TStringList.Create;
  OrigMsg1:=TStringList.Create;

  DebugEvent ('TTabSheet.Create');
  i:=PageList.PageCount+1;
  tb:=TTabSheet.Create(PageList);
  DebugEvent ('tb.parameters');
  tb.Parent:=PageList;
  tb.PageControl:=PageList;
  tb.Caption:='> '+Area.Name;

  DebugEvent ('TEditForm.Create');
  f3:=TEditForm.Create(tb);
  DebugEvent ('EditForm.parameters');
  if PageList.PageCount<=0 then DebugEvent('WARNING: PageCount='+inttostr(PageList.PageCount));
  f3.Parent:=tb;
  f3.Visible:=true;
  DebugEvent ('ok');
  f3.Align:=alClient;
  inc(numedits);
  f3.Name:='Edit'+IntToStr(numedits);
  f3.Area:=Area;
  MainForm.PageList.ActivePage:=tb;

  if NewMsgType<>New then begin

   if NewMsgType=EditMsg then OrigArea:=Area;

   if not OrigArea.Open then begin
    LogEvent('NewMsg: OrigArea.OpenArea failed');
    f3.Destroy;
    Exit;
   end;

   DebugEvent('Opening original message');
   pm:=MsgOpenMsg(OrigArea.msga,MOPEN_READ,msgnum);
   if pm=nil then begin
    LogEvent('opening failed');
    f3.Destroy;
    Exit;
   end;

   DebugEvent ('Loading original message');
   body:=StrAlloc(MsgGetTextLen(pm)+2);
   ctrl:=StrAlloc(MsgGetCtrlLen(pm)+2);

   FillChar(body^,sizeof(body^),0);
   FillChar(ctrl^,sizeof(ctrl^),0);
   FillChar(xm,sizeof(xm),0);
   MsgReadMsg(pm,@xm,0,MsgGetTextLen(pm),body,MsgGetCtrlLen(pm),ctrl);

   ctrl[MsgGetCtrlLen(pm)]:=#0;
   body[MsgGetTextLen(pm)]:=#0;

   jj:=false;

   OrigMsg.Clear;
   OrigMsg1.Clear;
   StrToStrings(CvtCtrlToKludge(ctrl)+string(body),#13,OrigMsg1);
   origstr:=0;

   wasOrigin:=false;
   repeat
    t:=OrigMsg1[origstr];
    if AnsiStartsStr(^A'Via: ',t)
     or AnsiStartsStr(^A'SEEN-BY: ',t)
     or AnsiStartsStr(^A'PATH: ',t) then break;

     if AnsiStartsStr('SEEN-BY: ',t) and wasOrigin
      then break;

     if length(t)>0 then if (t[1]=#1) then begin
      if Pos('INTL',t)=2 then begin
       t1:=Copy(t,7,Pos(' ',Copy(t,7,length(t)-7))-1);
       Delete(t1,Pos('.',t1),length(t1)-Pos('.',t1)+1);
       k:=ta.Point;
       ParseAddr(t1,ta,ta);
       ta.Point:=k;
       t1:=Copy(t,7,length(t)-6);
       t1:=Copy(t1,Pos(' ',t1),length(t1)-Pos(' ',t1)+1);
       Delete(t1,Pos('.',t1),length(t1)-Pos('.',t1)+1);
       k:=fa.Point;
       ParseAddr(t1,fa,fa);
       fa.Point:=k;
      end;
      if Pos('FMPT',t)=2 then fa.Point:=StrToInt(Copy(t,7,length(t)-6));
      if Pos('TOPT',t)=2 then ta.Point:=StrToInt(Copy(t,7,length(t)-6));
      if NewMsgType<>EditMsg then if Pos('MSGID',t)=2 then begin
       t1:=t;
       StrReplace(t1,'MSGID','REPLY');
       if length(t1)<8 then t1:='';
       f3.HMsgID.Caption:=t1;
      end;
      if NewMsgType=EditMsg then if pos ('REPLY',t)=2 then f3.HMsgID.Caption:=t;
     end
     else begin
      OrigMsg.Add(OemToAnsiString(t));
     end;
    if length(t)=0 then OrigMsg.Add('');

    if AnsiStartsStr(' * Origin:',t) then begin
     wasOrigin:=true;
     t0:=t;
     repeat
      delete(t0,1,pos('(',t0));
     until pos('(',t0)=0;
     delete(t0,length(t0),1);
     t1:='';
     for z:=1 to length(t0)
      do if (t0[z]>='.') and (t0[z]<=':') then t1:=t1+t0[z];
     if length(t1)>0 then ParseAddr(t1,fa,fa);
    end;
    inc(origstr);
   until origstr>=OrigMsg1.Count;

   DebugEvent('Original message text loaded');
   jj:=false;
   f3.ESubj.Text:=OemToAnsiString(xm.subj);
   OrigFromName:=OemToAnsiString(xm.from);
   OrigToName:=OemToAnsiString(xm._to);
   OrigFromAddr:=IntToStr(fa.Zone)+':'+IntToStr(fa.Net)+'/'+
    IntToStr(fa.Node);
   if fa.Point>0 then OrigFromAddr:=OrigFromAddr+'.'+IntToStr(fa.Point);

   if ta.Zone>0 then begin
    OrigToAddr:=IntToStr(ta.Zone)+':'+IntToStr(ta.Net)+'/'+
     IntToStr(ta.Node);
    if ta.Point>0 then OrigToAddr:=OrigToAddr+'.'+IntToStr(ta.Point);
   end;
   DateTimeToString(DateTime,SetupForm.DateTimeFormat.Text,TStampToDateTime(xm.date_written));
  end;

  DebugEvent ('Setting parameters for EditForm');
  f3.HeaderPanel.Color:=SetupForm.ifcolors[24];
  f3.FunctionsBar.Color:=SetupForm.ifcolors[29];
  f3.FunctionsBar.Options:=MainForm.MainBar.Options;

  f3.LFrom.Font.Color:=SetupForm.ifcolors[25];
  f3.LTo.Font.Color:=SetupForm.ifcolors[25];
  f3.LSubj.Font.Color:=SetupForm.ifcolors[25];
  f3.Visible:=true;
  f3.MsgText.Color:=SetupForm.ifcolors[9];
  f3.EFrom.Color:=SetupForm.ifcolors[27];
  f3.EFrom.Font.Color:=SetupForm.ifcolors[28];
  f3.EFromAddr.Color:=SetupForm.ifcolors[27];
  f3.EFromAddr.Font.Color:=SetupForm.ifcolors[28];
  f3.ETo.Color:=SetupForm.ifcolors[27];
  f3.ETo.Font.Color:=SetupForm.ifcolors[28];
  f3.EToAddr.Color:=SetupForm.ifcolors[27];
  f3.EToAddr.Font.Color:=SetupForm.ifcolors[28];
  f3.ESubj.Color:=SetupForm.ifcolors[27];
  f3.ESubj.Font.Color:=SetupForm.ifcolors[28];
  f3.MsgText.Font.Size:=StrToInt(ThemeForm.TextFontSize.Text);
  f3.MsgText.Font.Color:=SetupForm.txcolors[0];

  f3.LTagline.Font.Color:=SetupForm.ifcolors[25];
  f3.ETagline.Color:=SetupForm.ifcolors[27];
  f3.ETagline.Font.Color:=SetupForm.ifcolors[28];
  f3.LTearline.Font.Color:=SetupForm.ifcolors[25];
  f3.ETearline.Color:=SetupForm.ifcolors[27];
  f3.ETearline.Font.Color:=SetupForm.ifcolors[28];
  f3.LOrigin.Font.Color:=SetupForm.ifcolors[25];
  f3.EOrigin.Color:=SetupForm.ifcolors[27];
  f3.EOrigin.Font.Color:=SetupForm.ifcolors[28];

  AreaList.Selected:=nil;
  f3.EFrom.Text:=Area.FromName;
  f3.EFromAddr.Text:=Area.FromAddr;
  if SetupForm.FixedFromAddr.Checked
   then f3.EFromAddr.Enabled:=false;

  if Area.AreaType<>atNetmail then begin
   f3.EToAddr.Visible:=false;
   if (length(OrigToName)>0) and (NewMsgType<>fwd) then
    f3.ETo.Text:=OrigFromName else f3.ETo.Text:=SetupForm.EAll.Text;
  end;
  if (NewMsgType=Comment) or (NewMsgType=EditMsg) then begin
   f3.ETo.Text:=OrigToName;
   f3.EToAddr.Text:=OrigToAddr;
  end
  else begin
   if length(f3.ETo.Text)=0 then f3.ETo.Text:=OrigFromName;
   f3.EToAddr.Text:=OrigFromAddr;
  end;

  if ForceToAddr<>'' then begin
   f3.EToAddr.Text:=ForceToAddr;
   if f3.ETo.Text='' then f3.ETo.Text:='SysOp';
  end;

  if ForceToName<>'' then f3.ETo.Text:=ForceToName;

  DebugEvent('Creating SL for tagline/tearline/origin');
  sl:=TStringList.Create;
  randseed:=trunc(now);

  DebugEvent('Setting tagline');
  s:=SetupForm.Tagline.Text;
  if length(s)>0 then if s[1]='@' then begin
   sl.clear;
   if FileExists(copy(s,2,length(s)-1)) then sl.LoadFromFile(copy(s,2,length(s)-1));
   if sl.count>0 then s:=sl[random(sl.Count)];
  end;
  StrReplace(s,'@LongPID',ProductName,[rfReplaceAll]);
  StrReplace(s,'@Version',GetFileVersion,[rfReplaceAll]);
  f3.ETagline.Text:=s;

  DebugEvent('Setting tearline');
  s:=SetupForm.Tearline.Text;
  if length(s)>0 then if s[1]='@' then begin
   sl.clear;
   if FileExists(copy(s,2,length(s)-1)) then sl.LoadFromFile(copy(s,2,length(s)-1));
   if sl.count>0 then s:=sl[random(sl.Count)];
  end;
  StrReplace(s,'@LongPID',ProductName,[rfReplaceAll]);
  StrReplace(s,'@Version',GetFileVersion,[rfReplaceAll]);
  f3.ETearline.Text:=s;

  DebugEvent('Setting origin');
  s:=SetupForm.Origin.Text;
  if length(s)>0 then if s[1]='@' then begin
   sl.clear;
   if FileExists(copy(s,2,length(s)-1)) then sl.LoadFromFile(copy(s,2,length(s)-1));
   if sl.count>0 then s:=sl[random(sl.Count)];
  end;
  StrReplace(s,'@LongPID',ProductName,[rfReplaceAll]);
  StrReplace(s,'@Version',GetFileVersion,[rfReplaceAll]);
  f3.EOrigin.Text:=s;

  DebugEvent('Tagline/tearline/origin set OK');
  f3.FooterPanel.Visible:=SetupForm.ShowFooterPanel.Checked;

  st:='{\rtf1\ansi\ansicpg1251\deff0\deflang1049{\fonttbl{\f0\fswiss\fcharset204 '+ThemeForm.TextFont.FontName+';}}'+#13+ViewForm.ColorTable+#13+'\f0\cf1\fs'+IntToStr(StrToInt(ThemeForm.TextFontSize.Text)*2)+'\li'+SetupForm.ELeftMargin.Text+'0 '+#13;

  DebugEvent('Processing template');

  if (NewMsgType=EditMsg) then begin
   DebugEvent('Editting existing message - no template required');
   for k:=0 to OrigMsg.Count-1 do begin
    t:=OrigMsg[k];
    StrReplace(t,'\','\\',[rfReplaceAll]);
    StrReplace(t,'{','\{',[rfReplaceAll]);
    StrReplace(t,'}','\}',[rfReplaceAll]);
    t:='\cf'+IntToStr(ViewForm.ChkQuotes(t)+1)+' '+t;
    if k<OrigMsg.Count-1 then t:=t+' \par'+#13;
    if (Pos ('* Origin: ',t)=0) and (Pos ('--- ',t)=0)
     and ((k<OrigMsg.Count-3) and (Pos ('... ',t)=0))
     then st:=st+t;
   end
  end
 //template
  else for i:=0 to SetupForm.Template.Lines.Count-1 do begin
   s:=SetupForm.Template.Lines[i];

   if AnsiStartsText('@Forward',s) then if NewMsgType<>fwd then s:=';'
    else StrReplace(s,'@Forward','',[rfReplaceAll]);

   StrReplace(s,'@FName',f3.EFrom.Text,[rfReplaceAll]);
   StrReplace(s,'@FAddr',f3.EFromAddr.Text,[rfReplaceAll]);
   StrReplace(s,'@TName',f3.ETo.Text,[rfReplaceAll]);
   StrReplace(s,'@TAddr',f3.EToAddr.Text,[rfReplaceAll]);
   StrReplace(s,'@OTime',DateTime,[rfReplaceAll]);
   StrReplace(s,'@OName',OrigFromName,[rfReplaceAll]);

   if OrigArea=nil then StrReplace(s,'@OEcho','',[rfReplaceAll])
    else if StrUpper(OrigArea.Name)=StrUpper(Area.Name) then StrReplace(s,'@OEcho','',[rfReplaceAll])
    else if SetupForm.CarbonAreas.Items.IndexOf(OrigArea.Name)>=0 then StrReplace(s,'@OEcho','',[rfReplaceAll])
    else StrReplace(s,'@OEcho',OrigArea.Name,[rfReplaceAll]);

   if AnsiStartsText('@Moved',s) then begin
    if (NewMsgType=fwd) or (NewMsgType=new) then s:=';'
     else if OrigArea=nil then s:=';'
     else if StrUpper(OrigArea.Name)=StrUpper(Area.Name) then s:=';'
     else if SetupForm.CarbonAreas.Items.IndexOf(OrigArea.Name)>=0 then s:=';'
     else StrReplace(s,'@Moved','',[rfReplaceAll]);
   end;

   StrReplace(s,'@OAddr',OrigFromAddr,[rfReplaceAll]);
   StrReplace(s,'@DName',OrigToName,[rfReplaceAll]);
   StrReplace(s,'@DAddr',OrigToAddr,[rfReplaceAll]);
   StrReplace(s,'@Subject',f3.ESubj.Text,[rfReplaceAll]);
   if (OrigToName='') or (NewMsgType=fwd) then begin
    if AnsiStartsText('@Reply',s) then s:=';'
   end
   else StrReplace(s,'@Reply','',[rfReplaceAll]);
   if AnsiStartsText('@Message',s) then begin
    // вставляем оригинал в форвард
    StrReplace(s,'@Message','',[rfReplaceAll]);
    sl:=TStringList.Create;

    for k:=0 to OrigMsg.Count-1 do begin
     t:=OrigMsg[k];
     if Pos ('* Origin: ',t)>0 then
      StrReplace(t,'* Origin: ','+ Origin: ',[rfReplaceAll]);
     if Pos ('--- ',t)>0 then
      StrReplace(t,'--- ','^-^ ',[rfReplaceAll]);
     StrReplace(t,'\','\\',[rfReplaceAll]);
     StrReplace(t,'{','\{',[rfReplaceAll]);
     StrReplace(t,'}','\}',[rfReplaceAll]);
    //...
     t:='\cf'+IntToStr(ViewForm.ChkQuotes(t)+1)+' '+t;
     if k<OrigMsg.Count-1 then t:=t+' \par'+#13;
     s:=s+t;
    end;
  end;
  if AnsiStartsText('@Quote',s) then
   if (NewMsgType=New) or (NewMsgType=Fwd)
     or (NewMsgType=NoQuote) then s:=';'
    else begin
     sl.Clear;
     for k:=0 to OrigMsg.Count-1 do sl.Add(OrigMsg[k]);

     // вырезаем оригины и прочую муть
     if length(sl.Strings[sl.Count-1])=0 then sl.Delete(sl.Count-1);
     while Pos('SEEN-BY',sl.Strings[sl.Count-1])=1
      do sl.Delete(sl.Count-1);
     if Pos ('* Origin: ',sl.Strings[sl.Count-1])>0 then
      sl.Delete(sl.Count-1);
     if Pos ('--- ',sl.Strings[sl.Count-1])>0 then
      sl.Delete(sl.Count-1);
     if Pos ('... ',sl.Strings[sl.Count-1])>0 then
      sl.Delete(sl.Count-1);

     // квотим
     k1:=0;
     jj:=false;
     for k:=0 to sl.Count-1 do begin
      s:=sl[k];
      StrReplace(s,'\','\\',[rfReplaceAll]);
      StrReplace(s,'{','\{',[rfReplaceAll]);
      StrReplace(s,'}','\}',[rfReplaceAll]);

      if length(s)>0 then while s[length(s)]=' ' do begin
       s:=Copy(s,1,length(s)-1);
       if length(s)=0 then break;
      end;

      k0:=0;
      k1:=0;
      k0t:=length(s);
      if k0t>0 then while k0<=k0t do begin
       inc(k0);
       inc(k1);
       if k1>=72 then if s[k0]=' ' then begin
        s[k0]:=#13;
        if (Pos('>',s)>0) and (Pos('>',s)<10)
         then t1:=Copy(s,1,Pos('>',s))+'> '
        else t1:=GetInitials(OrigFromName)+'> ';
        if t1[1]<>' ' then t1:=' '+t1;
        Insert('\par '+t1,s,k0);
        k0t:=k0t+length('\par  '+t1);
        k1:=0;
        z:=Pos('>',s);
       end;
       sl[k]:=s;
      end;
     end;

     for j:=0 to sl.Count-1 do if sl[j]<>'' then begin
      t:=sl[j];
      z:=Pos('>',t);
      if (z>0) and (z<15) then begin
       if t[1]=' ' then
        t:=' '+t else t:='  '+t;
       Insert('>',t,Pos('>',t))
      end
      else
       if (length(sl[j])>0) and (sl[j]<>' ')
        then Insert('  '+GetInitials(OrigFromName)+'> ',t,1);
      if t[1]='>' then t:=' '+t;
      sl[j]:='\cf'+IntToStr(ViewForm.ChkQuotes(t)+1)+t+' \cf1\par';
     end
     else sl[j]:='\par'+#13;
     s:=sl.Text;
     sl.Free;
   end;
  if not AnsiStartsText(';',s) then st:=st+'\cf1'+s+'\cf1\par'+#13;
 end;
 st:=st+'}';

{TODO: вывод картинок из UUE
 var img: TJvThumbImage;
 ...
 img.LoadFromFile('c:\img006.jpg');
 TGRFKind = (grBMP, grJPG, grWMF, grEMF, grICO, grGIF, grPNG);

 img.Picture.Bitmap.SaveToFile('c:\img006.bmp');
 img.Picture.Bitmap.SaveToStream(stream);
}

  DebugEvent('Processing StringStream');
  ss:=TStringStream.Create(st);
  f3.MsgText.Font.Name:=ThemeForm.TextFont.FontName;
  f3.MsgText.Font.Size:=StrToInt(ThemeForm.TextFontSize.Text);
  f3.MsgText.StreamMode:=[smSelection];
  f3.MsgText.Clear;
  f3.MsgText.Lines.LoadFromStream(ss);
  ss.Free;

  DebugEvent('Setting caret position');
  for i:=0 to f3.MsgText.Lines.Count-1 do
  if AnsiStartsText('@Position',f3.MsgText.Lines[i]) then begin
   s:=f3.MsgText.Lines[i];
   StrReplace(s,'@Position','',[rfReplaceAll]);
   f3.MsgText.Lines[i]:=s;
   f3.MsgText.CaretPos:=Point(0,i);
  end;
  DebugEvent('OK');

  DebugEvent('Setting EditForm parameters');
  if NewMsgType=New then f3.HMsgId.Caption:='';
  if NewMsgType=EditMsg then f3.editmsgnum:=msgnum else f3.editmsgnum:=0;
  if (NewMsgType<>New) and (NewMsgType<>Fwd) then f3.MsgText.SetFocus
  else begin
   if Area.AreaType<>atEcho then f3.ETo.SetFocus
   else f3.ESubj.SetFocus;
  end;

  if ((NewMsgType=Quote) or (NewMsgType=NoQuote) or (NewMsgType=Comment))
   and ((OrigArea=nil) or (OrigArea=Area))
   then f3.referto:=MsgMsgnToUid(Area.msga,msgnum) else f3.referto:=0;

  OrigMsg.Free;
  OrigMsg1.Free;

  if pm<>nil then MsgCloseMsg(pm);
  pm:=nil;
  if body<>nil then StrDispose(body);
  body:=nil;
  if ctrl<>nil then StrDispose(ctrl);
  ctrl:=nil;
  DebugEvent('EditForm created');
 except
  on E: Exception do LogEvent('TMainForm.NewMsg encountered an exception: '+E.Message);
 end;
end;

procedure TMainForm.MsgNewExecute(Sender: TObject);
var vf:TViewForm;
begin
 try
  if PageList.PageCount=0 then Exit;
  vf:=PageList.ActivePage.Components[0] as TViewForm;
  if vf.FormType<>ftView then Exit;
  NewMsg(vf.Area,nil,vf.msgnum, New);
  HintText('Вы выбрали составление НОВОГО сообщения. Используйте данную команду, если Вам нужно начать новую тему. Предпочитайте ей команду "Ответить", когда хотите присоединиться к существующей дискуссии.'+#13+
  'Чтобы отказаться от составления сообщения, нажмите Esc. Чтобы продолжить, наберите текст сообщения и нажмите F2 для сохранения.');
 except
  on E: Exception do LogEvent('TMainForm.MsgNewExecute encountered an exception: '+E.Message);
 end;
end;

procedure TMainForm.MsgQuoteExecute(Sender: TObject);
var vf:TViewForm;
begin
 try
  if PageList.PageCount=0 then Exit;
  vf:=PageList.ActivePage.Components[0] as TViewForm;
  if vf.FormType<>ftView then Exit;
  NewMsg(Config.Areas.FindEchoArea(vf.replytoarea),vf.Area,vf.msgnum,Quote);
  HintText('Производится ОТВЕТ С ЦИТИРОВАНИЕМ на сообщение - основное средство построения обсуждений в Фидонет. :-)'+#13+
  'Знаком ">" и другим цветом отмечен цитируемый текст (т.е. оригинальное сообщение). Пожалуйста, удалите из цитируемого текста приветствия/подписи и пишите свои реплики СНИЗУ соответствующих цитат. По завершению, сохраните сообщение нажатием F2.');
 except
  on E: Exception do LogEvent('TMainForm.MsgQuoteExecute encountered an exception: '+E.Message);
 end;
end;

procedure TMainForm.MsgNoQuoteExecute(Sender: TObject);
var vf:TViewForm;
begin
 try
  if PageList.PageCount=0 then Exit;
  vf:=PageList.ActivePage.Components[0] as TViewForm;
  if vf.FormType<>ftView then Exit;
  NewMsg(Config.Areas.FindEchoArea(vf.replytoarea),vf.Area,vf.msgnum,NoQuote);
  HintText ('Производится ОТВЕТ БЕЗ ЦИТИРОВАНИЯ на сообщение.'+#13+
  'Данный тип сообщений в Фидонет применяется редко. Используйте эту команду только если Вы уверены, что цитирование действительно не требуется. В остальных случаях следует цитировать оригинальные сообщения (команда "Ответить").');
 except
  on E: Exception do LogEvent('TMainForm.MsgNoQuoteExecute encountered an exception: '+E.Message);
 end;
end;

procedure TMainForm.MsgCommentExecute(Sender: TObject);
var vf:TViewForm;
begin
 try
  if PageList.PageCount=0 then Exit;
  vf:=PageList.ActivePage.Components[0] as TViewForm;
  if vf.FormType<>ftView then Exit;
  NewMsg(Config.Areas.FindEchoArea(vf.replytoarea),vf.Area,vf.msgnum,Comment);
  HintText ('Производится ОТВЕТ-КОММЕНТАРИЙ на сообщение.'+#13+
  'Это означает, что составляемое Вами сообщение будет адресовано ПОЛУЧАТЕЛЮ оригинального сообщения, а не отправителю, как это происходит при выборе команды "Ответить".');
 except
  on E: Exception do LogEvent('TMainForm.MsgCommentExecute encountered an exception: '+E.Message);
 end;
end;

procedure TMainForm.PrintDlgAccept(Sender: TObject);
var fs:TFileStream;
    f3:TViewForm;
    s:string;
    i:byte;
begin
 try
  if TSimpleXForm(PageList.ActivePage.Components[0]).FormType<>ftView then Exit;
  f3:=MainForm.PageList.ActivePage.Components[0] as TViewForm;
  with f3.MsgText do begin
   Lines.Insert(0,'Area'+#9+': '+f3.Caption+', msg '+f3.VNum.Caption);
   Lines.Insert(1,'From'+#9+': '+f3.VFrom.Caption+' ('+f3.VFromAddr.Caption+')');
   if length(f3.VToAddr.Caption)>0 then
    Lines.Insert(2,'To'+#9+': '+f3.VTo.Caption+' ('+f3.VToAddr.Caption+')')
    else Lines.Insert(2,'To'+#9+': '+f3.VTo.Caption);
   Lines.Insert(3,'Subj'+#9+': '+f3.VSubj.Caption);
   SelAttributes.Underline:=true;
   Lines.Insert(4,'                                                                                          ');
   SelAttributes.Underline:=false;
   Lines.Insert(5,'');
  end; //with
  f3.MsgText.PageRect:=Rect(MarginLeft,MarginTop,Printer.PageWidth-MarginRight,Printer.PageHeight-MarginBottom);
  f3.MsgText.Print(f3.Caption);
  for i:=0 to 5 do f3.MsgText.Lines.Delete(0);
 except
  on E: Exception do LogEvent('TMainForm.PrintDlgAccept encountered an exception: '+E.Message);
 end;
end;


function GetFileVersion: string;
var
  InfoSize, Wnd: DWORD;
  VerBuf: Pointer;
  FI: PVSFixedFileInfo;
  VerSize: DWORD;
  FileName: TFileName;
  Major, Minor, Release, Build: Integer;
  ver: string;
begin
try
  FileName:=ParamStr(0);
  Result:= '';
  InfoSize:= GetFileVersionInfoSize(PChar(FileName), Wnd);
  if InfoSize <> 0 then begin
    GetMem(VerBuf, InfoSize);
    try
      if GetFileVersionInfo(PChar(FileName), Wnd, InfoSize, VerBuf) then
        if VerQueryValue(VerBuf, '\', Pointer(FI), VerSize) then begin
          Major:= FI.dwFileVersionMS shr 16;
          Minor:= FI.dwFileVersionMS and $FFFF;
          Release:= FI.dwFileVersionLS shr 16;
          Build:= FI.dwFileVersionLS and $FFFF;
          ver:= IntToStr(Major)+'.'+IntToStr(Minor);
          if release>0 then ver:=ver+'.'+IntToStr(Release);
          Result:=ver;
        end;
    finally
      FreeMem(VerBuf);
    end;
  end;
except
 on E: Exception do LogEvent('GetFileVersion encountered an exception: '+E.Message);
end;
end;

procedure TMainForm.RefreshExecute(Sender: TObject);
var vf:TViewForm;
    i:word;
    z:longint;
begin
try

for i:=1 to PageList.PageCount do
if TSimpleXForm(PageList.Pages[i-1].Components[0]).FormType=ftView then begin
 vf:=TViewForm(PageList.Pages[i-1].Components[0]);
 with vf do begin

 if Area.Open then begin
  if Area.msga.num_msg<=0 then begin
   MsgList.AllocBy:=0;
   MsgText.Lines.Clear;
   MsgText.Lines.Add(lang.nomsgs);
   Exit;
  end;

//  Area.msga.SeekFirst(1);
//  Area.cur:=0;
  Area.TotalMessages:=Area.msga.num_msg;
  MsgList.AllocBy:=Area.msga.num_msg;

  if vf.MsgList.Selected<>nil then begin
   if vf.MsgList.Selected.Index=MsgList.AllocBy-2 then
    vf.MsgList.Items[vf.MsgList.Selected.Index+1].MakeVisible(false);
  end
  else
   if vf.MsgList.Items.Count>0 then begin
    vf.MsgList.Items[vf.MsgList.Items.Count-1].Selected:=true;
    vf.VNum.Caption:=IntToStr(vf.MsgList.Selected.Index+1)+'/'+IntToStr(Area.msga.num_msg);
    vf.MsgList.OnSelectItem(Self,vf.MsgList.Selected,true);
  end;
  end;
 end;
end;
except
 on E: Exception do LogEvent('TMainForm.RefreshExecute encountered an exception: '+E.Message);
end;
end;

procedure TMainForm.MsgDeleteExecute(Sender: TObject);
var vf:TViewForm;
  pc: PAnsiChar;
  z: longint;
  pm: PMsgHandle;
  xm: TXMSG;
begin
 try
  DebugEvent('Deleting message in "'+Caption+'"');
  vf:=PageList.ActivePage.Components[0] as TViewForm;
  if vf.FormType<>ftView then Exit;
  if vf.MsgList.Selected=nil then Exit;

  pm:=MsgOpenMsg(vf.Area.msga,MOPEN_READ,vf.MsgList.Selected.Index+1);
  if pm=nil then begin
   LogEvent ('Message not found');
   Exit;
  end;

  MsgReadMsg(pm,@xm,0,0,nil,0,nil);
  MsgCloseMsg(pm);

  if ((xm.attr and MSGLOCAL)>0) and ((xm.attr and MSGSENT)=0) then
   pc:=PAnsiChar(lang.msgdeleteunsent) else
   pc:=PAnsiChar(lang.msgdelete);
  if Application.MessageBox(pc,PAnsiChar(lang.confirmation),MB_YESNO)=IDNO then Exit;
  with vf do begin
  z:=vf.MsgList.Selected.Index;
  MsgList.Items.BeginUpdate;
  MsgText.Lines.BeginUpdate;

  MsgList.UnselectAll;

  TwitHide;
  MsgKillMsg(Area.msga,z+1);
  Area.Reopen;
  MsgList.AllocBy:=Area.msga.num_msg;
  MsgList.Refresh;

  if Area.msga.num_msg<1 then begin
   VFrom.Caption:='';
   VFromAddr.Caption:='';
   VTo.Caption:='';
   VToAddr.Caption:='';
   VSubj.Caption:='';
   VNum.Caption:='0/0';
   VDateTime.Caption:='';
   MsgList.AllocBy:=0;
   MsgText.Lines.Clear;
   MsgText.Lines.Add(lang.nomsgs);
  end;
  MsgList.Items.EndUpdate;
  MsgText.Lines.EndUpdate;

  if MsgList.AllocBy>0 then begin
   if z>=MsgList.AllocBy then dec(z);
   MsgList.Items[z].Selected:=true;
   MsgList.Selected.Focused:=true;
   MsgList.Selected.MakeVisible(true);
   MsgListSelectItem(MsgList,MsgList.Selected,true);
  end;

  end;
 except
  on E: Exception do LogEvent('TMainForm.MsgDeleteExecute encountered an exception: '+E.Message);
 end;
end;

procedure TMainForm.AreaListKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if ssShift in Shift then shifted:=true else shifted:=false;
 key:=0;
end;

procedure TMainForm.AreaListKeyPress(Sender: TObject; var Key: Char);
begin
 key:=#0;
end;

procedure TMainForm.FileSaveAsAccept(Sender: TObject);
var fs:TFileStream;
    f3:TViewForm;
    s:string;
    i:byte;
begin
 try
  if TSimpleXForm(PageList.ActivePage.Components[0]).FormType<>ftView then Exit;
  with FileSaveAs.Dialog do begin
   case FilterIndex of
   1: begin
    if Pos('.rtf',Filename)<>length(Filename)-3 then
     FileName:=FileName+'.rtf';
   end;
   end; //case
   f3:=MainForm.PageList.ActivePage.Components[0] as TViewForm;
   fs:=TFileStream.Create(FileName,fmCreate or fmOpenWrite);

   with f3.MsgText do begin
    Lines.Insert(0,'Area'+#9+': '+f3.Caption+', msg '+f3.VNum.Caption);
    Lines.Insert(1,'From'+#9+': '+f3.VFrom.Caption+' ('+f3.VFromAddr.Caption+')');
    if length(f3.VToAddr.Caption)>0 then
     Lines.Insert(2,'To'+#9+': '+f3.VTo.Caption+' ('+f3.VToAddr.Caption+')')
     else Lines.Insert(2,'To'+#9+': '+f3.VTo.Caption);
    Lines.Insert(3,'Subj'+#9+': '+f3.VSubj.Caption);
    SelAttributes.Underline:=true;
    Lines.Insert(4,'                                                                                          ');
    SelAttributes.Underline:=false;
    Lines.Insert(5,'');
   end; //with
   f3.MsgText.StreamMode:=[];
   f3.MsgText.Lines.SaveToStream(fs);
   for i:=0 to 5 do f3.MsgText.Lines.Delete(0);
   fs.Free;
  end;
 except
  on E: Exception do LogEvent('TMainForm.FileSaveAsAccept encountered an exception: '+E.Message);
 end;
end;

procedure TMainForm.FilePageSetupAccept(Sender: TObject);
begin
try
 with FilePageSetup do begin
  ptpx:=Dialog.PageWidth/Printer.PageWidth;
  ptpy:=Dialog.PageHeight/Printer.PageHeight;
  MarginLeft:=Round(Dialog.MarginLeft/ptpx);
  MarginTop:=Round(Dialog.MarginTop/ptpy);
  MarginRight:=Round(Dialog.MarginRight/ptpx);
  MarginBottom:=Round(Dialog.MarginBottom/ptpy);
 end; //with
except
 on E: Exception do begin
  FilePageSetup.Enabled:=false;
  PrintDlg.Enabled:=false;
 end;
end;
end;

procedure TMainForm.ShowKludgesExecute(Sender: TObject);
var vf:TViewForm;
begin
 try
  MainForm.ShowKludges.Checked:=not MainForm.ShowKludges.Checked;
  if PageList.PageCount<1 then Exit;
  if TSimpleXForm(PageList.ActivePage.Components[0]).FormType<>ftView then Exit;
  vf:=TViewForm(PageList.ActivePage.Components[0]);
  vf.MsgList.OnSelectItem(MainForm,vf.MsgList.Selected,true);
 except
  on E: Exception do LogEvent('TMainForm.ShowKludgesExecute encountered an exception: '+E.Message);
 end;
end;

procedure TMainForm.TabBarTabSelected(Sender: TObject;
  Item: TJvTabBarItem);
var vf: TViewForm;
begin
 try
  if Item=nil then Exit;
  if PageList.ActivePage<>nil then
   if TSimpleXForm(PageList.ActivePage.Components[0]).FormType=ftView
    then begin
     TViewForm(PageList.ActivePage.Components[0]).MsgText.SetFocus;
     HideCaret(TViewForm(PageList.ActivePage.Components[0]).MsgText.Handle);
    end
 except
  on E: Exception do LogEvent('TMainForm.TabBarSelected encountered an exception: '+E.Message);
 end;
end;

procedure TMainForm.ContactListMouseEnter(Sender: TObject);
begin
 try
  if not SetupForm.Visible then if PageList.PageCount=0 then
  ContactList.SetFocus else
   if TSimpleXForm(PageList.ActivePage.Components[0]).FormType<>ftEdit then ContactList.SetFocus;
 except
  on E: Exception do LogEvent('TMainForm.ContactListMouseEnter encountered an exception: '+E.Message);
 end;
end;

procedure TMainForm.ContactListMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
 try
  if not SetupForm.Visible then if PageList.PageCount=0 then
   ContactList.SetFocus else
   if TSimpleXForm(PageList.ActivePage.Components[0]).FormType<>ftEdit
    then ContactList.SetFocus;
 except
  on E: Exception do LogEvent('TMainForm.ContactListMouseMove encountered an exception: '+E.Message);
 end;
end;

procedure TMainForm.ContactListResize(Sender: TObject);
begin
 try
  ContactList.Columns[0].Width:=ContactList.Width-5;
 except
  on E: Exception do LogEvent('TMainForm.ContactListResize encountered an exception: '+E.Message);
 end;
end;

procedure TMainForm.ContactListDblClick(Sender: TObject);
var name,addr:string;
begin
 try
  if ContactList.Selected=nil then Exit;
  name:=ContactsXML.Root.Items[Integer(ContactList.Selected.Data)].Items.ItemNamed['name'].Value;
  addr:=ContactsXML.Root.Items[Integer(ContactList.Selected.Data)].Items.ItemNamed['address'].Value;
  if (pos(':',addr)<=0) or (pos('/',addr)<=1) then begin
   MainForm.JvBalloonHint1.ActivateHint(ContactList,lang.noaddr);
   exit;
  end;
  if SetupForm.ENetMail.Text='' then begin
   MainForm.JvBalloonHint1.ActivateHint(ContactList,lang.errnonetmail);
   exit;
  end;
  NewMsg(Config.Areas.FindEchoArea(SetupForm.ENetMail.Text),nil,0,New,addr,name);
 except
  on E: Exception do LogEvent('TMainForm.ContactListDblClick encountered an exception: '+E.Message);
 end;
end;

procedure TMainForm.ShowContactsExecute(Sender: TObject);
begin
 try
  ShowContacts.Checked:=not ShowContacts.Checked;
  if ShowContacts.Checked then begin
   ContactsSplitter.Visible:=true;
   Contacts.Visible:=true;
  end
  else begin
   ContactsSplitter.Visible:=false;
   Contacts.Visible:=false;
  end;
  SetupForm.ShowContacts.Checked:=ShowContacts.Checked;
  //SetupForm.FormStorage.SaveFormPlacement;
 except
  on E: Exception do LogEvent('TMainForm.ShowContactsExecute encountered an exception: '+E.Message);
 end;
end;

procedure TMainForm.ContactsClose(Sender: TObject);
begin
 try
  ShowContactsExecute(MainForm)
 except
  on E: Exception do LogEvent('TMainForm.ContactsClose encountered an exception: '+E.Message);
 end;
end;

procedure TMainForm.CLAddExecute(Sender: TObject);
begin
 try
  ContactForm.contact_id:=-1;
  ContactForm.ShowModal;
  ContactForm.BringToFront;
 except
  on E: Exception do LogEvent('TMainForm.CLAddExecute encountered an exception: '+E.Message);
 end;
end;

procedure TMainForm.CLDeleteExecute(Sender: TObject);
var i:integer;
begin
 try
  if ContactList.Selected=nil then begin
   MainForm.JvBalloonHint1.ActivateHint(ContactList,lang.selcontact);
   exit;
  end;
  i:=Integer(ContactList.Selected.Data);
  ContactsXML.Root.Items.Delete(i);
  DoContactList;
 except
  on E: Exception do LogEvent('TMainForm.CLDeleteExecute encountered an exception: '+E.Message);
 end; 
end;

procedure TMainForm.CLEditExecute(Sender: TObject);
var i:integer;
begin
 try
  if ContactList.Selected=nil then begin
   MainForm.JvBalloonHint1.ActivateHint(ContactList,lang.selcontact);
   exit;
  end;
  i:=Integer(ContactList.Selected.Data);
  with ContactForm do begin
   if ContactsXML.Root.Items[i].Items.ItemNamed['displayname']<>nil then
    EDisplayName.Text:=ContactsXML.Root.Items[i].Items.ItemNamed['displayname'].Value else EDisplayName.Text:='';
   if ContactsXML.Root.Items[i].Items.ItemNamed['name']<>nil then
    EName.Text:=ContactsXML.Root.Items[i].Items.ItemNamed['name'].Value else EName.Text:='';
   if ContactsXML.Root.Items[i].Items.ItemNamed['address']<>nil then
    EFtnAddr.Text:=ContactsXML.Root.Items[i].Items.ItemNamed['address'].Value else EFtnAddr.Text:='';
   if ContactsXML.Root.Items[i].Items.ItemNamed['e-mail']<>nil then
    EEmail.Text:=ContactsXML.Root.Items[i].Items.ItemNamed['e-mail'].Value else EEMail.Text:='';
   if ContactsXML.Root.Items[i].Items.ItemNamed['phone']<>nil then
    EPhone.Text:=ContactsXML.Root.Items[i].Items.ItemNamed['phone'].Value else EPhone.Text:='';
   contact_id:=i;
   ShowModal;
   BringToFront;
  end;
 except
  on E: Exception do LogEvent('TMainForm.CLEditExecute encountered an exception: '+E.Message);
 end;
end;

procedure TMainForm.HideLabelClick(Sender: TObject);
begin
 try
  HintText('Выбрано скрытие панели подсказок на текущий сеанс.'+#13#13+'Отключить её совсем можно в меню Сервис -> Настройки, вкладка Интерфейс - Панель подсказок');
  HideLabel.Hide;
  Timer1.Enabled:=true;
 except
  on E: Exception do LogEvent('TMainForm.HideLabelClick encountered an exception: '+E.Message);
 end;
end;

procedure TMainForm.CloseLabelClick(Sender: TObject);
begin
 try
  HintPanel.Hide;
  SetupForm.ShowHintPanel.Checked:=false;
 except
  on E: Exception do LogEvent('TMainForm.CloseLabelClick encountered an exception: '+E.Message);
 end;
end;

procedure TMainForm.ShowTB;
begin
 try
  case SetupForm.ShowToolBar.ItemIndex of
   0: MainBar.Visible:=false;
   1: begin
       MainBar.Visible:=true;
       MainBar.BtnWidth:=26;
       MainBar.BtnHeight:=23;
       MainBar.BtnOffsetVert:=0;
       MainBar.Height:=26;
       MainBar.Items(0,0).Left:=3;
       MainBar.Items(0,1).Left:=29;
       MainBar.Items(0,2).Left:=55;
       MainBar.Items(0,3).Left:=81;
       MainBar.Items(0,4).Left:=111;
       MainBar.Items(0,5).Left:=137;
       MainBar.Items(1,0).Left:=167;
       MainBar.Items(1,1).Left:=193;
       MainBar.Items(2,0).Left:=223;
       MainBar.Items(0,2).MarkDropDown:=false;
      end;
   2: begin
       MainBar.Visible:=true;
       MainBar.BtnWidth:=48;
       MainBar.BtnHeight:=44;
       MainBar.BtnOffsetVert:=3;
       MainBar.Height:=50;
       MainBar.Items(0,0).Left:=3;
       MainBar.Items(0,1).Left:=51;
       MainBar.Items(0,2).Left:=99;
       MainBar.Items(0,3).Left:=147;
       MainBar.Items(0,4).Left:=203;
       MainBar.Items(0,5).Left:=251;
       MainBar.Items(1,0).Left:=307;
       MainBar.Items(1,1).Left:=355;
       MainBar.Items(2,0).Left:=411;
       MainBar.Items(0,2).MarkDropDown:=true;
      end;
  end;
 except
  on E: Exception do LogEvent('TMainForm.ShowTB encountered an exception: '+E.Message);
 end;
end;

procedure TMainForm.ContactListSelectItem(Sender: TObject; Item: TListItem;
  Selected: Boolean);
begin
 try
  if Selected then HintText('Дважды щёлкните на имени контакта, чтобы написать сообщение');
 except
  on E: Exception do LogEvent('TMainForm.ContactListSelectItem encountered an exception: '+E.Message);
 end;
end;

procedure TMainForm.HintText(text:string;level:TLevel=Info);
begin
 try
  if DelayHint.Enabled then Exit;
  MainForm.HintLbl.Caption:=text;
  case Level of
   Info: HintPanel.Color:=SetupForm.ifcolors[30];
   Warning: HintPanel.Color:=SetupForm.ifcolors[31];
  end //case
 except
  on E: Exception do LogEvent('TMainForm.HintText encountered an exception: '+E.Message);
 end;
end;

procedure TMainForm.AreaListDrawItem(Sender: TCustomListView;
  Item: TListItem; Rect: TRect; State: TOwnerDrawState);
var RRect: TRect;
    sz: TSize;
    tx: string;
begin
 try
  with Sender as TListView, Canvas do begin
   if length(Item.Caption)<1 then Exit;
   if Item.Focused then Brush.Color:=SetupForm.ifcolors[4] else
   if (Item.Index mod 2)=1 then Brush.Color:=SetupForm.ifcolors[1]
    else Brush.Color:=SetupForm.ifcolors[2];
   Brush.Style:=bsSolid;
   FillRect(Rect);
   Font.Name:=ThemeForm.TextFont.Name;
   Font.Size:=8;
   Font.Style:=[];
   if Item.Focused then Font.Color:=SetupForm.ifcolors[3]
    else Font.Color:=SetupForm.ifcolors[0];

   if SetupForm.HLAreasUnread.Checked then
    if TArea(Item.Data).UnreadMessages>0 then Font.Style:=[fsBold];

   RRect.Left:=Rect.Left+5;
   RRect.Top:=Rect.Top;
   RRect.Right:=RRect.Left+AreaList.Column[0].Width-2;
   RRect.Bottom:=Rect.Bottom;
   tx:=Item.Caption;
   sz:=TextExtent(tx);
   while (sz.cx>RRect.Right-RRect.Left) and (length(tx)>5) do begin
    tx:=Copy(Item.Caption,1,length(tx)-4)+'...';
    sz:=TextExtent(tx);
   end;
   TextRect(RRect,RRect.Left,RRect.Top,tx);

   RRect.Left:=RRect.Right+2;
   RRect.Right:=RRect.Left+AreaList.Column[1].Width-5;
   if TArea(Item.Data).TotalMessages=-1 then tx:='???' else begin
    tx:=inttostr(TArea(Item.Data).UnreadMessages)+'/'+inttostr(TArea(Item.Data).TotalMessages);
    sz:=TextExtent(tx);
    while (sz.cx>RRect.Right-RRect.Left) and (length(tx)>5) do begin
     tx:=Copy(inttostr(TArea(Item.Data).UnreadMessages)+'/'+inttostr(TArea(Item.Data).TotalMessages),1,length(tx)-4)+'...';
     sz:=TextExtent(tx);
    end;
   end;
   TextRect(RRect,RRect.Left,RRect.Top,tx);
  end;
 except
  on E: Exception do LogEvent('TMainForm.AreaListDrawItem encountered an exception: '+E.Message+' (probably Item: '+Item.Caption+')');
 end;
end;

procedure TMainForm.ContactListDrawItem(Sender: TCustomListView;
  Item: TListItem; Rect: TRect; State: TOwnerDrawState);
begin
 try
  with Sender as TListView, Canvas do begin
   if Item.Focused then Brush.Color:=SetupForm.ifcolors[4] else
   if (Item.Index mod 2)=1 then Brush.Color:=SetupForm.ifcolors[1]
    else Brush.Color:=SetupForm.ifcolors[2];
   Brush.Style:=bsSolid;
   FillRect(Rect);
   Font.Name:=ThemeForm.TextFont.Name;
   Font.Size:=8;
   Font.Style:=[];
   if Item.Focused then Font.Color:=SetupForm.ifcolors[3]
    else Font.Color:=SetupForm.ifcolors[0];
   TextOut(Rect.Left+5,Rect.Top,Item.Caption);
  end;
 except
  on E: Exception do LogEvent('TMainForm.ContactListDrawItem encountered an exception: '+E.Message);
 end;
end;

procedure TMainForm.Timer1Timer(Sender: TObject);
begin
 try
  HideLabel.Visible:=true;
  HintPanel.Hide;
  Timer1.Enabled:=false;
 except
  on E: Exception do LogEvent('TMainForm.Timer1Timer encountered an exception: '+E.Message);
 end;
end;

procedure TMainForm.HintLblClick(Sender: TObject);
begin
 try
  if Timer1.Enabled then Timer1Timer(MainForm);
 except
  on E: Exception do LogEvent('TMainForm.HintLblClick encountered an exception: '+E.Message);
 end;
end;

procedure TMainForm.HintPanelMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
 try
  if Timer1.Enabled then Timer1Timer(MainForm);
 except
  on E: Exception do LogEvent('TMainForm.HintPanelMouseDown encountered an exception: '+E.Message);
 end;
end;

procedure TMainForm.WindowFormStorageSavePlacement(Sender: TObject);
begin
 try
  WindowFormStorage.WriteInteger('ViewFormMsgListHeight',vfh);
 except
  on E: Exception do LogEvent('TMainForm.WindowFormStorageSavePlacement encountered an exception: '+E.Message);
 end;
end;

procedure TMainForm.WindowFormStorageRestorePlacement(Sender: TObject);
begin
 try
  vfh:=WindowFormStorage.ReadInteger('ViewFormMsgListHeight',ViewForm.MsgList.Height)
 except
  on E: Exception do LogEvent('TMainForm.WindowFormStorageRestorePlacement encountered an exception: '+E.Message);
 end;
end;

procedure TMainForm.VertSplitterDblClick(Sender: TObject);
begin
 try
  if AreaListHeader.Visible then AreaListHeader.Hide
  else begin
   VertSplitter.Hide;
   AreaListHeader.Show;
   VertSplitter.Left:=AreaListHeader.Width+1;
   VertSplitter.Align:=alNone;
   VertSplitter.Show;
   VertSplitter.Align:=alLeft;
  end;
 except
  on E: Exception do LogEvent('TMainForm.VertSplitterDblClick encountered an exception: '+E.Message);
 end;
end;

procedure TMainForm.FormPaint(Sender: TObject);
begin
 try
  PageList.Realign;
{ if PageList.Wallpaper.Bitmap<>nil then begin
  PageList.Canvas.Brush.Style:=bsSolid;
  PageList.Canvas.Brush.Bitmap:=PageList.Wallpaper.Bitmap;
  PageList.Canvas.FillRect(Rect(0,0,PageList.Width,PageList.Height));
 end;}
 except
  on E: Exception do LogEvent('TMainForm.FormPaint encountered an exception: '+E.Message);
 end;
end;

procedure TMainForm.FullScreenExecute(Sender: TObject);
begin
 try
  if FullScreen.Checked then begin
   tws:=MainForm.WindowState;
   MainForm.FormStyle:=fsStayOnTop;
   MainForm.BorderStyle:=bsNone;
   MainForm.Menu:=nil;
   MainForm.WindowState:=wsMaximized;
   HintText('Выбран полноэкранный режим. Чтобы вернуться к обычному просмотру, нажмите F11.');
   DelayHint.Enabled:=true;
  end
  else begin
   MainForm.FormStyle:=fsNormal;
   MainForm.BorderStyle:=bsSizeable;
   MainForm.Menu:=MainMenu;
   MainForm.WindowState:=tws;
   DelayHint.Enabled:=false;
   HintText('');
  end;
 except
  on E: Exception do LogEvent('TMainForm.FullScreenExecute encountered an exception: '+E.Message);
 end;
end;

procedure TMainForm.DelayHintTimer(Sender: TObject);
begin
 try
  DelayHint.Enabled:=false;
 except
  on E: Exception do LogEvent('TMainForm.DelayHintTimer encountered an exception: '+E.Message);
 end;
end;

procedure TMainForm.AboutExecute(Sender: TObject);
begin
 try
  AboutForm.ShowModal;
 except
  on E: Exception do LogEvent('TMainForm.AboutExecute encountered an exception: '+E.Message);
 end;
end;

procedure TMainForm.MsgForwardExecute(Sender: TObject);
begin
 try
  SelectDestArea.Tag:=1;
  SelectDestArea.ShowModal;
 except
  on E: Exception do LogEvent('TMainForm.MsgForwardExecute encountered an exception: '+E.Message);
 end;
end;

procedure TMainForm.MsgQuoteAnotherExecute(Sender: TObject);
begin
 try
  SelectDestArea.Tag:=0;
  SelectDestArea.ShowModal;
 except
  on E: Exception do LogEvent('TMainForm.MsgQuoteAnotherExecute encountered an exception: '+E.Message);
 end;
end;

procedure TMainForm.NodeListTreeExecute(Sender: TObject);
var f:textfile;
    s:string;
   tb:TTabSheet;
   f2:TViewForm;
begin
 try
  if not FileExists(ExtractFilePath(Application.ExeName)+'nodelist.bin') then begin
   ShowMessage(lang.ndlnotcompiled);
   Exit;
  end;
  if PageList.PageCount>0 then begin
   tb:=PageList.ActivePage;
   if TSimpleXForm(tb.Components[0]).FormType=ftView then begin
    f2:=tb.Components[0] as TViewForm;
    if length(f2.VFromAddr.Caption)>1 then begin
     NodeListForm.ESearch.Text:=f2.VFromAddr.Caption;
     NodeListForm.ESearchChange(Self);
    end;
   end;
  end;
  NodeListForm.ShowModal;
 except
  on E: Exception do LogEvent('TMainForm.NodeListTreeExecute encountered an exception: '+E.Message);
 end;
end;

procedure TMainForm.FormClose(Sender: TObject; var Action: TCloseAction);
var i:integer;
    xf:TSimpleXForm;
begin
 try
  for i:=0 to PageList.PageCount-1 do begin
   xf:=TSimpleXForm(PageList.Pages[i].Components[0]);
   if xf.FormType=ftView then
//    xf.Area.SetLastRead(TViewForm(xf).msgid);
   if TViewForm(xf).MsgList.Items.Count>0 then
    xf.Area.SetLastRead(TViewForm(xf).MsgList.ItemIndex+1);
  end;
  
  SetupForm.FormStorage.SaveFormPlacement;
  SetupForm.AppIniFileStorage.Flush;
 except
  on E: Exception do LogEvent('TMainForm.FormClose encountered an exception: '+E.Message);
 end;
end;

procedure TMainForm.MsgEditExecute(Sender: TObject);
var vf:TViewForm;
begin
 try
  if TSimpleXForm(PageList.ActivePage.Components[0]).FormType<>ftView then Exit;
  vf:=PageList.ActivePage.Components[0] as TViewForm;

  if (vf.flags='read') or (vf.flags='unread') then begin
   ShowMessage(lang.editnotyours);
   Exit;
  end;

  if vf.flags='unsent' then
   NewMsg(vf.Area,nil,vf.msgnum,EditMsg)
  else if Application.MessageBox(PAnsiChar(lang.editalreadysent),PAnsiChar(lang.confirmation),MB_YESNO)=IDYES
   then NewMsg(vf.Area,nil,vf.msgnum,EditMsg)
 except
  on E: Exception do LogEvent('TMainForm.MsgEditExecute encountered an exception: '+E.Message);
 end;
end;

procedure TMainForm.FindMsgExecute(Sender: TObject);
var vf:TViewForm;
begin
 try
  if TSimpleXForm(PageList.ActivePage.Components[0]).FormType<>ftView then Exit;
  vf:=PageList.ActivePage.Components[0] as TViewForm;
  if vf<>nil then begin
   if vf.SearchBox.Visible then vf.SearchBox.Hide else vf.SearchBox.Show;
   if vf.SearchBox.Visible then vf.ESearch.SetFocus;
  end;
 except
  on E: Exception do LogEvent('TMainForm.FindMsgExecute encountered an exception: '+E.Message);
 end;
end;

procedure TMainForm.ColorCodesExecute(Sender: TObject);
var vf: TViewForm;
begin
 try
  if SetupForm.StyleHL.ItemIndex=SetupForm.StyleHL.Items.Count-1
   then SetupForm.StyleHL.ItemIndex:=0
   else SetupForm.StyleHL.ItemIndex:=SetupForm.StyleHL.ItemIndex+1;
  if PageList.PageCount>0 then if TSimpleXForm(PageList.ActivePage.Components[0]).FormType=ftView then begin
   vf:=PageList.ActivePage.Components[0] as TViewForm;
   if vf.MsgList.Items.Count>0 then
    vf.MsgList.OnSelectItem(Self,vf.MsgList.Selected,true);
 end;
 except
  on E: Exception do LogEvent('TMainForm.ColorCodesExecute encountered an exception: '+E.Message);
 end;
end;

procedure TMainForm.FormActivate(Sender: TObject);
begin
 try
  if SetupForm.Visible then SetupForm.SetFocus;
  // во избежание лажи с Color Button, не пользуемся ShowModal
 except
  on E: Exception do LogEvent('TMainForm.FormActivate encountered an exception: '+E.Message);
 end;
end;

procedure TMainForm.ShowToolBarExecute(Sender: TObject);
begin
try
if SetupForm.ShowToolBar.ItemIndex=2 then begin
   SetupForm.ShowToolBar.ItemIndex:=0;
   MainForm.ShowToolBar.Checked:=false;
  end
  else begin
   SetupForm.ShowToolBar.ItemIndex:=SetupForm.ShowToolBar.ItemIndex+1;
   MainForm.ShowToolBar.Checked:=true;
  end;
MainForm.ShowTB;
except
 on E: Exception do LogEvent('TMainForm.ShowToolBarExecute encountered an exception: '+E.Message);
end;
end;

procedure TMainForm.ShowTreeExecute(Sender: TObject);
var vf:TViewForm;
begin
try
if PageList.PageCount>0 then if TSimpleXForm(PageList.ActivePage.Components[0]).FormType=ftView then begin
 vf:=PageList.ActivePage.Components[0] as TViewForm;
 vf.ShowTree.Execute;
end;
except
 on E: Exception do LogEvent('TMainForm.ShowTreeExecute encountered an exception: '+E.Message);
end;
end;

procedure TMainForm.AreaListMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
 try
  if ssShift in Shift then shifted:=true else shifted:=false;
 except
  on E: Exception do LogEvent('TMainForm.AreaListMouseDown encountered an exception: '+E.Message);
 end;
end;

procedure TMainForm.AreaListMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
 try
  if ssShift in Shift then shifted:=true else shifted:=false;
 except
  on E: Exception do LogEvent('TMainForm.AreaListMouseUp encountered an exception: '+E.Message);
 end;
end;

procedure TMainForm.CloseBtnClick(Sender: TObject);
begin
 try
  PostMessage(MainForm.Handle,ID_CLOSEME,0,0);
 except
  on E: Exception do LogEvent('TMainForm.CloseBtnClick encountered an exception: '+E.Message);
 end;
end;

procedure TMainForm.ShowLogExecute(Sender: TObject);
begin
 try
  LogForm.ShowModal;
  LogForm.BringToFront;
 except
  on E: Exception do LogEvent('TMainForm.ShowLogExecute encountered an exception: '+E.Message);
 end;
end;

procedure TMainForm.DoContactList;
var i:integer;
    x:TJvSimpleXMLElem;
begin
 try
  MainForm.ContactsXML.SaveToFile(ExtractFilePath(Application.ExeName)+'contacts.xml');
  ContactList.Clear;
  for i:=0 to ContactsXML.Root.Items.Count-1 do
   if ContactsXML.Root.Items[i].Name='contact' then begin
    x:=ContactsXML.Root.Items[i];
    ContactList.AddItem(x.Items.ItemNamed['displayname'].Value,Pointer(integer(i)));
  end;
 except
  on E: Exception do LogEvent('TMainForm.DoContactList encountered an exception: '+E.Message);
 end;
end;

Function ParseAddr(AStr: String; CurrAddr: TNetAddr; Var DestAddr: TNetAddr): Boolean;
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

Function StripBoth(St:String;Ch:Char):String;

  Begin
  StripBoth := StripTrail(StripLead(St,Ch),Ch);
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

procedure TMainForm.FGHIbarAlign;
begin
 FGHIaddr.Height:=FGHIpanel.Height;
 FGHIgo.Top:=0;
 FGHIgo.Height:=FGHIpanel.Height;
 FGHIgo.Left:=FGHIpanel.Width-FGHIgo.Width-CloseBtn.Width;
 FGHIaddr.Left:=0;
 FGHIaddr.Top:=0;
 FGHIaddr.Width:=FGHIpanel.Width-FGHIgo.Width-CloseBtn.Width-3;
end;

procedure TMainForm.FormResize(Sender: TObject);
begin
 FGHIbarAlign;
end;

procedure TMainForm.PageListChange(Sender: TObject);
begin
 FGHI.UpdateAddrText;
end;

procedure TMainForm.FGHIgoClick(Sender: TObject);
begin
 FGHI.DoAddr(FGHIaddr.Text);
end;

procedure TMainForm.FGHIaddrKeyPress(Sender: TObject; var Key: Char);
begin
 if key=#13 then FGHIgo.OnClick(FGHIgo);
end;

end.

