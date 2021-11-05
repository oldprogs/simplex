unit Setup;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, JvPageList, JvExControls, JvComponent, JvTabBar, JvXPCore,
  JvXPButtons, ExtCtrls, JvExExtCtrls, JvBevel, StdCtrls, CheckLst,
  JvExCheckLst, JvCheckListBox, JvExStdCtrls, JvHtControls, JvListBox,
  JvComboListBox, JvCombobox, ActnList, JvStaticText, JvEdit, JvAppStorage,
  JvAppIniStorage, JvComponentBase, JvFormPlacement, JvAppXMLStorage,
  JvDialogs, JvRadioButton, JvCheckBox, JvGroupBox, JvColorBox,
  JvColorButton, JvSpeedBar, JvColorCombo, Mask, JvExMask, JvSpin, JvMemo, JvLabel,
  JvRadioGroup, JvGroupHeader, JvTextListBox, JvFullColorSpaces,
  JvFullColorCtrls, JvOfficeColorButton, MKGlobT, Grids, JvExGrids,
  JvStringGrid;

const
  ID_CHECKALL = 49000;

type
  TSetupForm = class(TForm, IJvAppStorageHandler)
    JvTabBar: TJvTabBar;
    JvPageList: TJvPageList;
    UserPage: TJvStandardPage;
    AreasPage: TJvStandardPage;
    ViewerPage: TJvStandardPage;
    JvBevel1: TJvBevel;
    OKButton: TJvXPButton;
    CancelButton: TJvXPButton;
    HelpButton: TJvXPButton;
    UsersAdd: TJvXPButton;
    UsersSub: TJvXPButton;
    Users: TJvComboBox;
    UsersChange: TJvXPButton;
    ActionList: TActionList;
    CheckAll: TAction;
    JvStaticText1: TJvStaticText;
    JvStaticText2: TJvStaticText;
    FtnAddr: TJvComboBox;
    FtnAddrAdd: TJvXPButton;
    FtnAddrChange: TJvXPButton;
    FtnAddrSub: TJvXPButton;
    RealName: TJvEdit;
    JvStaticText3: TJvStaticText;
    FormStorage: TJvFormStorage;
    JvStaticText4: TJvStaticText;
    TosserConfig: TJvEdit;
    TosserBrowse: TJvXPButton;
    HPT: TJvRadioButton;
    BBToss: TJvRadioButton;
    TosserBrowseDlg: TJvOpenDialog;
    AppIniFileStorage: TJvAppIniFileStorage;
    EditPage: TJvStandardPage;
    ThemesPage: TJvStandardPage;
    TemplatesPage: TJvStandardPage;
    Template: TJvMemo;
    Tagline: TJvEdit;
    JvStaticText11: TJvStaticText;
    Tearline: TJvEdit;
    Origin: TJvEdit;
    JvStaticText12: TJvStaticText;
    JvStaticText13: TJvStaticText;
    JvLabel1: TJvLabel;
    JvLabel2: TJvLabel;
    NameAddBtn: TJvXPButton;
    NameChgBtn: TJvXPButton;
    NameDelBtn: TJvXPButton;
    JvXPButton4: TJvXPButton;
    JvXPButton5: TJvXPButton;
    JvXPButton6: TJvXPButton;
    TwitTo: TJvCheckBox;
    TwitKill: TJvCheckBox;
    IgnorePage: TJvStandardPage;
    JvGroupBox1: TJvGroupBox;
    Rule1: TJvComboBox;
    JvStaticText5: TJvStaticText;
    Rule1Reverse: TJvCheckBox;
    JvStaticText6: TJvStaticText;
    Rule2: TJvComboBox;
    Rule2Reverse: TJvCheckBox;
    JvStaticText7: TJvStaticText;
    Rule3: TJvComboBox;
    Rule3Reverse: TJvCheckBox;
    SystemPage: TJvStandardPage;
    LNetmailFlag: TJvStaticText;
    ENetmailFlag: TJvEdit;
    BNetmailFlag: TJvXPButton;
    FlagsDialog: TJvSaveDialog;
    LEchomailFlag: TJvStaticText;
    EEchomailFlag: TJvEdit;
    BEchomailFlag: TJvXPButton;
    LExportList: TJvStaticText;
    EExportList: TJvEdit;
    BExportList: TJvXPButton;
    JvGroupBox2: TJvGroupBox;
    ShowHintPanel: TJvCheckBox;
    ShowContacts: TJvCheckBox;
    TwitName: TJvListBox;
    TwitSubj: TJvListBox;
    JvGroupHeader1: TJvGroupHeader;
    Themes: TJvComboBox;
    LoadBtn: TJvXPButton;
    SaveBtn: TJvXPButton;
    ThemeStorage: TJvAppIniFileStorage;
    StyleHL: TJvRadioGroup;
    ELeftMargin: TJvSpinEdit;
    LLeftMargin: TJvLabel;
    JvGroupHeader2: TJvGroupHeader;
    NodelistDialog: TJvOpenDialog;
    Nodelists: TJvListBox;
    Pointlists: TJvListBox;
    JvGroupHeader3: TJvGroupHeader;
    BtnNdlAdd: TJvXPButton;
    BtnNdlChange: TJvXPButton;
    BtnNdlSub: TJvXPButton;
    BtnNdlCompile: TJvXPButton;
    BtnPntAdd: TJvXPButton;
    BtnPntChange: TJvXPButton;
    BtnPntSub: TJvXPButton;
    JvLabel3: TJvLabel;
    JvLabel4: TJvLabel;
    AreasBBS: TJvRadioButton;
    Partoss: TJvRadioButton;
    ThemesBtn: TJvXPButton;
    ShowToolBar: TJvRadioGroup;
    JvGroupBox3: TJvGroupBox;
    FixedFromAddr: TJvCheckBox;
    JvGroupBox4: TJvGroupBox;
    ShowKludges: TJvCheckBox;
    AreasOnClick: TJvRadioGroup;
    HLAreasUnread: TJvCheckBox;
    JvStaticText9: TJvStaticText;
    DateTimeFormat: TJvEdit;
    JvXPButton1: TJvXPButton;
    ShowRegion: TJvCheckBox;
    TreeFullExpand: TJvCheckBox;
    ShowSmileys: TJvCheckBox;
    JvGroupHeader4: TJvGroupHeader;
    ShowFooterPanel: TJvCheckBox;
    ManualAreas: TJvStringGrid;
    LAll: TJvStaticText;
    EAll: TJvEdit;
    JvGroupBox5: TJvGroupBox;
    LNetmail: TJvStaticText;
    ENetMail: TJvComboBox;
    CarbonAreas: TJvListBox;
    CarbonAdd: TJvXPButton;
    CarbonChg: TJvXPButton;
    CarbonDel: TJvXPButton;
    JvStaticText8: TJvStaticText;
    JvGroupHeader5: TJvGroupHeader;
    MAreaAdd: TJvXPButton;
    MAreaChange: TJvXPButton;
    MAreaDelete: TJvXPButton;
    LinesOpenDialog: TJvOpenDialog;
    TaglineBrowse: TJvXPButton;
    TearlineBrowse: TJvXPButton;
    OriginBrowse: TJvXPButton;
    CompileAtStart: TJvCheckBox;
    ShowFGHIaddr: TJvCheckBox;
    procedure CancelButtonClick(Sender: TObject);
    procedure OKButtonClick(Sender: TObject);
    procedure UsersAddClick(Sender: TObject);
    procedure UsersChangeClick(Sender: TObject);
    procedure UsersSubClick(Sender: TObject);
    procedure CheckAllExecute(Sender: TObject);
    procedure HelpButtonClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FtnAddrAddClick(Sender: TObject);
    procedure FtnAddrChangeClick(Sender: TObject);
    procedure FtnAddrSubClick(Sender: TObject);
    procedure TosserBrowseClick(Sender: TObject);
    procedure FormStorageSavePlacement(Sender: TObject);
    procedure FormStorageRestorePlacement(Sender: TObject);
    procedure TextColorsChange(Sender: TObject);
    procedure TextColorBtnChange(Sender: TObject);
    procedure BoldClick(Sender: TObject);
    procedure ItalicClick(Sender: TObject);
    procedure UnderlinedClick(Sender: TObject);
    procedure ShowKludgesClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BNetmailFlagClick(Sender: TObject);
    procedure BEchomailFlagClick(Sender: TObject);
    procedure BExportListClick(Sender: TObject);
    procedure NameAddBtnClick(Sender: TObject);
    procedure NameChgBtnClick(Sender: TObject);
    procedure NameDelBtnClick(Sender: TObject);
    procedure JvXPButton4Click(Sender: TObject);
    procedure JvXPButton5Click(Sender: TObject);
    procedure JvXPButton6Click(Sender: TObject);
    procedure SaveBtnClick(Sender: TObject);
    procedure LoadBtnClick(Sender: TObject);
    procedure BtnNdlAddClick(Sender: TObject);
    procedure BtnNdlChangeClick(Sender: TObject);
    procedure BtnNdlSubClick(Sender: TObject);
    procedure BtnPntAddClick(Sender: TObject);
    procedure BtnPntChangeClick(Sender: TObject);
    procedure BtnPntSubClick(Sender: TObject);
    procedure BtnNdlCompileClick(Sender: TObject);
    procedure StyleChange(Sender: TObject);
    procedure TextColorBtnColorChange(Sender: TObject);
    procedure IfaceColorBtnColorChange(Sender: TObject);
    procedure IfaceColorBtnChange(Sender: TObject);
    procedure ThemesBtnClick(Sender: TObject);
    procedure CarbonAddClick(Sender: TObject);
    procedure CarbonChgClick(Sender: TObject);
    procedure CarbonDelClick(Sender: TObject);
    procedure ShowSmileysClick(Sender: TObject);
    procedure JvXPButton1Click(Sender: TObject);
    procedure LoadManualAreas;
    procedure MAreaAddClick(Sender: TObject);
    procedure MAreaChangeClick(Sender: TObject);
    procedure TaglineBrowseClick(Sender: TObject);
    procedure TearlineBrowseClick(Sender: TObject);
    procedure OriginBrowseClick(Sender: TObject);
    procedure MAreaDeleteClick(Sender: TObject);
  private
    procedure CheckAllMsg(var Message); message ID_CHECKALL;
    procedure ReadFromAppStorage(AppStorage: TJvCustomAppStorage; const BasePath: string);
    procedure WriteToAppStorage(AppStorage: TJvCustomAppStorage; const BasePath: string);
  public
    txcolors: array[0..18] of TColor;
    txbold, txitalic, txunder: array[0..18] of boolean;
    ifcolors: array[0..99] of TColor;
    TextFont: string;
    TextFontSize: extended;
    StyleChanged: boolean;
    procedure AddBtn(cb: TJvComboBox; pr: string); overload;
    procedure ChangeBtn(cb: TJvComboBox; pr: string); overload;
    procedure DelBtn(cb: TJvComboBox); overload;
    procedure AddBtn(lb: TJvListBox; pr: string); overload;
    procedure ChangeBtn(lb: TJvListBox; pr: string); overload;
    procedure DelBtn(lb: TJvListBox); overload;
    procedure UpdateColors;
    procedure ShowThemes;
    { Public declarations }
  end;

var
  SetupForm: TSetupForm;

implementation

uses ThemesEdit,View,PromptDlg, Log, Main, NodeList, ComCtrls, StrUtils,
 Language, JclStrings, NdlCmpProgress, Area, ConfigType, smapi;

{$R *.dfm}

procedure TSetupForm.CancelButtonClick(Sender: TObject);
begin
StyleChanged:=false;
SetupForm.Close;
end;

procedure TSetupForm.OKButtonClick(Sender: TObject);
var i,j:integer;
begin
try
if (SetupForm.Users.Items.Count=0)
 or (SetupForm.FtnAddr.Items.Count=0) then begin
 JvTabBar.Tabs.Items[0].Selected:=true;
 ShowMessage(lang.needuseraddr);
 Exit;
end;

if SetupForm.ShowContacts.Checked<>MainForm.ShowContacts.Checked
 then MainForm.ShowContacts.Execute;
MainForm.HintPanel.Visible:=SetupForm.ShowHintPanel.Checked;
FormStorage.SaveFormPlacement;
AppIniFileStorage.Flush;
SetupForm.Close;
MainForm.AreaList.Clear;
SendMessage(MainForm.Handle,ID_READCFG,0,0);
UpdateColors;
if StyleChanged then begin
 for i:=0 to Application.ComponentCount-1 do
 if (Application.Components[i].ClassName='TViewForm')
  and (Application.Components[i].Name<>'ViewForm') then
   with (Application.Components[i] as TViewForm) do begin
   HeaderPanel.Color:=SetupForm.ifcolors[24];
   HeaderPanel.Font.Color:=SetupForm.ifcolors[25];
   LNum.Font.Color:=HeaderPanel.Font.Color;
   LFrom.Font.Color:=HeaderPanel.Font.Color;
   LTo.Font.Color:=HeaderPanel.Font.Color;
   LSubj.Font.Color:=HeaderPanel.Font.Color;
   VNum.Font.Color:=SetupForm.ifcolors[26];
   VFrom.Font.Color:=VNum.Font.Color;
   VTo.Font.Color:=VNum.Font.Color;
   VSubj.Font.Color:=VNum.Font.Color;
   VRefer.Font.Color:=VNum.Font.Color;
   VPar.Font.Color:=VNum.Font.Color;
   for j:=1 to 15 do VSeeAlso[j].Font.Color:=VNum.Font.Color;
   VFromAddr.Font.Color:=VNum.Font.Color;
   VToAddr.Font.Color:=VNum.Font.Color;
   VDateTime.Font.Color:=VNum.Font.Color;
   (Application.Components[i] as TViewForm).MsgText.Color:=ifcolors[9];
   (Application.Components[i] as TViewForm).MsgList.OnSelectItem(Self,(Application.Components[i] as TViewForm).MsgList.Selected,true);
   (Application.Components[i] as TViewForm).MsgList.Repaint;
 end;
 for i:=0 to MainForm.ComponentCount-1 do
 if (MainForm.Components[i].ClassName='TViewForm')
  and (MainForm.Components[i].Name<>'ViewForm') then
   with (MainForm.Components[i] as TViewForm) do begin
   HeaderPanel.Color:=SetupForm.ifcolors[24];
   HeaderPanel.Font.Color:=SetupForm.ifcolors[25];
   LNum.Font.Color:=HeaderPanel.Font.Color;
   LFrom.Font.Color:=HeaderPanel.Font.Color;
   LTo.Font.Color:=HeaderPanel.Font.Color;
   LSubj.Font.Color:=HeaderPanel.Font.Color;
   VNum.Font.Color:=SetupForm.ifcolors[26];
   VFrom.Font.Color:=VNum.Font.Color;
   VTo.Font.Color:=VNum.Font.Color;
   VSubj.Font.Color:=VNum.Font.Color;
   VRefer.Font.Color:=VNum.Font.Color;
   VPar.Font.Color:=VNum.Font.Color;
   for j:=1 to 15 do VSeeAlso[j].Font.Color:=VNum.Font.Color;
   VFromAddr.Font.Color:=VNum.Font.Color;
   VToAddr.Font.Color:=VNum.Font.Color;
   VDateTime.Font.Color:=VNum.Font.Color;
   MsgText.Color:=ifcolors[9];
   MsgList.OnSelectItem(Self,(MainForm.Components[i] as TViewForm).MsgList.Selected,true);
   MsgList.Repaint;
  end;
 end;
MainForm.ShowTB;
StyleChanged:=false;
except
 on E:Exception do LogEvent ('TSetupForm.OKButtonClick encountered an exception: '+E.Message);
end;
end;

procedure TSetupForm.AddBtn(cb: TJvComboBox; pr: string);
begin
Prompt.Lbl.Caption:=pr;
Prompt.Edit.Text:='';
Prompt.add:=true;
Prompt.dstlb:=nil;
Prompt.dst:=cb;
Prompt.list:=false;
Prompt.Show;
SetupForm.CheckAllExecute(SetupForm);
end;

procedure TSetupForm.ChangeBtn(cb: TJvComboBox; pr: string);
begin
Prompt.Lbl.Caption:=pr;
Prompt.Edit.Text:=cb.Items[cb.ItemIndex];
Prompt.add:=false;
Prompt.dstlb:=nil;
Prompt.dst:=cb;
Prompt.list:=false;
Prompt.Show;
end;

procedure TSetupForm.DelBtn(cb: TJvComboBox);
var ii:Cardinal;
begin
ii:=cb.ItemIndex;
cb.Items.Delete(ii);
CheckAllExecute(SetupForm);
if cb.Items.Count>0 then begin
 if ii>0 then cb.ItemIndex:=ii-1 else cb.ItemIndex:=0;
end
else begin
 cb.Text:='';
 cb.Refresh;
end;
end;

procedure TSetupForm.AddBtn(lb: TJvListBox; pr: string);
begin
Prompt.Lbl.Caption:=pr;
Prompt.Edit.Text:='';
Prompt.add:=true;
Prompt.dst:=nil;
Prompt.dstlb:=lb;
Prompt.list:=false;
Prompt.Show;
SetupForm.CheckAllExecute(SetupForm);
end;

procedure TSetupForm.ChangeBtn(lb: TJvListBox; pr: string);
begin
Prompt.Lbl.Caption:=pr;
Prompt.Edit.Text:=lb.Items[lb.ItemIndex];
Prompt.add:=false;
Prompt.dst:=nil;
Prompt.dstlb:=lb;
Prompt.list:=false;
Prompt.Show;
end;

procedure TSetupForm.DelBtn(lb: TJvListBox);
var ii:Cardinal;
begin
ii:=lb.ItemIndex;
lb.Items.Delete(ii);
//CheckAllExecute(SetupForm);
if ii>0 then lb.ItemIndex:=ii-1 else lb.ItemIndex:=0;
lb.Refresh;
end;

procedure TSetupForm.UsersAddClick(Sender: TObject);
begin
AddBtn(Users,'Введите имя пользователя');
end;

procedure TSetupForm.UsersChangeClick(Sender: TObject);
begin
ChangeBtn(Users,'Введите имя пользователя');
end;

procedure TSetupForm.UsersSubClick(Sender: TObject);
begin
DelBtn(Users);
end;

procedure TSetupForm.CheckAllExecute(Sender: TObject);
begin
if Users.Items.Count=0 then begin
 UsersChange.Enabled:=false;
 UsersSub.Enabled:=false;
end
else begin
 UsersChange.Enabled:=true;
 UsersSub.Enabled:=true;
end;

if FtnAddr.Items.Count=0 then begin
 FtnAddrChange.Enabled:=false;
 FtnAddrSub.Enabled:=false;
end
else begin
 FtnAddrChange.Enabled:=true;
 FtnAddrSub.Enabled:=true;
end;

if Nodelists.Items.Count=0 then begin
 BtnNdlChange.Enabled:=false;
 BtnNdlSub.Enabled:=false;
 BtnNdlCompile.Enabled:=false;
end
else begin
 BtnNdlChange.Enabled:=true;
 BtnNdlSub.Enabled:=true;
 BtnNdlCompile.Enabled:=true;
end;

if Pointlists.Items.Count=0 then begin
 BtnPntChange.Enabled:=false;
 BtnPntSub.Enabled:=false;
end
else begin
 BtnPntChange.Enabled:=true;
 BtnPntSub.Enabled:=true;
end;

end;

procedure TSetupForm.CheckAllMsg(var Message);
begin
CheckAllExecute(SetupForm);
end;

procedure TSetupForm.HelpButtonClick(Sender: TObject);
begin
ShowMessage ('Ещё не реализовано / Not Implemented Yet');
end;

procedure TSetupForm.ReadFromAppStorage(AppStorage: TJvCustomAppStorage; const BasePath: string);
begin
end;

procedure TSetupForm.WriteToAppStorage(AppStorage: TJvCustomAppStorage; const BasePath: string);
begin
//  AppStorage.WriteBoolean(AppStorage.ConcatPaths([BasePath, 'MyCheckBox1']), CheckBox1.Checked);
//  AppStorage.WriteBoolean(AppStorage.ConcatPaths([BasePath, 'MyCheckBox2']), CheckBox2.Checked);

end;

procedure TSetupForm.FormShow(Sender: TObject);
begin
 try
  AppIniFileStorage.Reload;
  FormStorage.RestoreFormPlacement;
  ShowContacts.Checked:=MainForm.ShowContacts.Checked;
  StyleChanged:=false;
  JvTabBar.SelectedTab:=JvTabBar.Tabs[0];
  JvPageList.ActivePage:=UserPage;
  CheckAllExecute(SetupForm);
  ThemeForm.TextColors.ItemIndex:=0;
  ThemeForm.IfaceColors.ItemIndex:=0;
  ThemeForm.TextColors.Text:=ThemeForm.TextColors.Items[0];
  ThemeForm.TextColorBtn.SelectedColor:=txcolors[0];
  ThemeForm.IfaceColorBtn.SelectedColor:=ifcolors[0];
  ThemeForm.IfaceColors.Text:=ThemeForm.IfaceColors.Items[0];
  ThemeForm.Bold.Checked:=txbold[0];
  ThemeForm.Italic.Checked:=txitalic[0];
  ThemeForm.Underlined.Checked:=txunder[0];
  ShowThemes;
  LoadManualAreas;
  SetupForm.BringToFront;
 except
  on E: Exception do LogEvent('TSetupForm.FormShow encountered an exception: '+E.Message);
 end;
end;

procedure TSetupForm.FtnAddrAddClick(Sender: TObject);
begin
AddBtn (FtnAddr,'Введите адрес в формате z:n/f.p');
end;

procedure TSetupForm.FtnAddrChangeClick(Sender: TObject);
begin
ChangeBtn (FtnAddr,'Введите адрес в формате z:n/f.p');
end;

procedure TSetupForm.FtnAddrSubClick(Sender: TObject);
begin
DelBtn (FtnAddr);
end;

procedure TSetupForm.TosserBrowseClick(Sender: TObject);
begin
if HPT.Checked then TosserBrowseDlg.Filter:='HPT Config (config)|*.*';
if Partoss.Checked then TosserBrowseDlg.Filter:='squish.cfg|*.*';
if BBToss.Checked then TosserBrowseDlg.Filter:='BBToss Config (bbtarea.ini)|bbtarea.ini';
if AreasBBS.Checked then TosserBrowseDlg.Filter:='AREAS.BBS|areas.bbs';
if TosserBrowseDlg.Execute then TosserConfig.Text:=TosserBrowseDlg.FileName;
end;

procedure TSetupForm.FormStorageSavePlacement(Sender: TObject);
var i:byte;
begin
for i:=0 to 18 do begin
 FormStorage.WriteInteger('Style\TextColor'+IntToStr(i),txcolors[i]);
 FormStorage.WriteBoolean('Style\TextBold'+IntToStr(i),txbold[i]);
 FormStorage.WriteBoolean('Style\TextItalic'+IntToStr(i),txitalic[i]);
 FormStorage.WriteBoolean('Style\TextUnderlined'+IntToStr(i),txunder[i]);
end;
for i:=0 to 99 do
 FormStorage.WriteInteger('Style\IfaceColor'+IntToStr(i),ifcolors[i]);
FormStorage.WriteString('Style\TextFont',TextFont);
FormStorage.WriteFloat('Style\TextFontSize',TextFontSize);
end;

procedure TSetupForm.FormStorageRestorePlacement(Sender: TObject);
var i:byte;
begin
//0 Обычный текст
//1 Цитата 1
//2 Цитата 2
//3 Цитата 3
//4 Цитата 4
//5 Таглайн (...)
//6 Тирлайн (---)
//7 Ориджин (* Origin)
//8 Клуджи
//9 URL/E-Mail/FTN
//10 _Цвет_
//11 *Цвет*
//12 /Цвет/
//13 _/Цвет/_
//14 _*Цвет*_
//15 */Цвет/*
//16 _*/Цвет/*_

 txcolors[0]:=FormStorage.ReadInteger('Style\TextColor0',clBlack);
 txcolors[1]:=FormStorage.ReadInteger('Style\TextColor1',clMaroon);
 txcolors[2]:=FormStorage.ReadInteger('Style\TextColor2',clGreen);
 txcolors[3]:=FormStorage.ReadInteger('Style\TextColor3',clNavy);
 txcolors[4]:=FormStorage.ReadInteger('Style\TextColor4',clPurple);
 txcolors[5]:=FormStorage.ReadInteger('Style\TextColor5',clTeal);
 txcolors[6]:=FormStorage.ReadInteger('Style\TextColor6',clTeal);
 txcolors[7]:=FormStorage.ReadInteger('Style\TextColor7',clTeal);
 txcolors[8]:=FormStorage.ReadInteger('Style\TextColor8',clGray);
 txcolors[9]:=FormStorage.ReadInteger('Style\TextColor9',clWhite);
 txcolors[10]:=FormStorage.ReadInteger('Style\TextColor10',clBlue);
for i:=0 to 8 do begin
 txbold[i]:=FormStorage.ReadBoolean('Style\TextBold'+IntToStr(i),false);
 txitalic[i]:=FormStorage.ReadBoolean('Style\TextItalic'+IntToStr(i),false);
 txunder[i]:=FormStorage.ReadBoolean('Style\TextUnderlined'+IntToStr(i),false);
end;

txbold[9]:=FormStorage.ReadBoolean('Style\TextBold'+IntToStr(i),false);
txitalic[9]:=FormStorage.ReadBoolean('Style\TextItalic'+IntToStr(i),false);
txunder[9]:=FormStorage.ReadBoolean('Style\TextUnderlined'+IntToStr(i),true);
 
for i:=10 to 16 do begin
 txcolors[i]:=FormStorage.ReadInteger('Style\TextColor'+IntToStr(i),clBlack);
end;
 txbold[10]:=FormStorage.ReadBoolean('Style\TextBold10',false);
 txitalic[10]:=FormStorage.ReadBoolean('Style\TextItalic10',false);
 txunder[10]:=FormStorage.ReadBoolean('Style\TextUnderlined10',true);

 txbold[11]:=FormStorage.ReadBoolean('Style\TextBold11',true);
 txitalic[11]:=FormStorage.ReadBoolean('Style\TextItalic11',false);
 txunder[11]:=FormStorage.ReadBoolean('Style\TextUnderlined11',false);

 txbold[12]:=FormStorage.ReadBoolean('Style\TextBold12',false);
 txitalic[12]:=FormStorage.ReadBoolean('Style\TextItalic12',true);
 txunder[12]:=FormStorage.ReadBoolean('Style\TextUnderlined12',false);

 txbold[13]:=FormStorage.ReadBoolean('Style\TextBold13',false);
 txitalic[13]:=FormStorage.ReadBoolean('Style\TextItalic13',true);
 txunder[13]:=FormStorage.ReadBoolean('Style\TextUnderlined13',true);

 txbold[14]:=FormStorage.ReadBoolean('Style\TextBold14',true);
 txitalic[14]:=FormStorage.ReadBoolean('Style\TextItalic14',false);
 txunder[14]:=FormStorage.ReadBoolean('Style\TextUnderlined14',true);

 txbold[15]:=FormStorage.ReadBoolean('Style\TextBold15',false);
 txitalic[15]:=FormStorage.ReadBoolean('Style\TextItalic15',true);
 txunder[15]:=FormStorage.ReadBoolean('Style\TextUnderlined15',true);

 txbold[16]:=FormStorage.ReadBoolean('Style\TextBold16',true);
 txitalic[16]:=FormStorage.ReadBoolean('Style\TextItalic16',true);
 txunder[16]:=FormStorage.ReadBoolean('Style\TextUnderlined16',true);

//0 Списки: текст
//1 Списки: фон1
//2 Списки: фон2
//3 Списки: текущий элемент - текст
//4 Списки: текущий элемент - фон
//5 Список сообщений: персональное
//6 Список сообщений: непрочитанное
//7 Список сообщений: неотправленное
//8 Список сообщений: от модератора
//9 Текст сообщения: фон

//10 Заголовок: от
//11 Заголовок: до
//12 Разделитель: от
//13 Разделитель: до
//14 Фон окна

//15 Вкладки: фон
//16 Вкладки: фон2
//17 Вкладки: текст
//18 Вкладки: фон активной
//19 Вкладки: фон2 активной
//20 Вкладки: текст активной
//21
//22
//23 

//24 Заголовок сообщения: фон
//25 Заголовок сообщения: метки
//26 Заголовок сообщения: значения

//27 Поля ввода: фон
//28 Поля ввода: текст

//29 Панели инструментов

//30 Подсказка: фон (информация)
//31 Подсказка: фон (предупреждение)
//32 Подсказка: текст
//33 Подсказка: "скрыть"

 ifcolors[0]:=FormStorage.ReadInteger('Style\IfaceColor0',clBlack);
 ifcolors[1]:=FormStorage.ReadInteger('Style\IfaceColor1',clWhite);
 ifcolors[2]:=FormStorage.ReadInteger('Style\IfaceColor2',$00DDFFFF);
 ifcolors[3]:=FormStorage.ReadInteger('Style\IfaceColor3',clBlack);
 ifcolors[4]:=FormStorage.ReadInteger('Style\IfaceColor4',clSilver);
 ifcolors[5]:=FormStorage.ReadInteger('Style\IfaceColor5',clBlue);
 ifcolors[6]:=FormStorage.ReadInteger('Style\IfaceColor6',clGreen);
 ifcolors[7]:=FormStorage.ReadInteger('Style\IfaceColor7',clGreen);
 ifcolors[8]:=FormStorage.ReadInteger('Style\IfaceColor8',clRed);
 ifcolors[9]:=FormStorage.ReadInteger('Style\IfaceColor9',clWhite);
 ifcolors[10]:=FormStorage.ReadInteger('Style\IfaceColor10',clWhite);
 ifcolors[11]:=FormStorage.ReadInteger('Style\IfaceColor11',$00BDBEBD);
 ifcolors[12]:=FormStorage.ReadInteger('Style\IfaceColor12',$00C6C3C6);
 ifcolors[13]:=FormStorage.ReadInteger('Style\IfaceColor13',$008C8E8C);
 ifcolors[14]:=FormStorage.ReadInteger('Style\IfaceColor14',clBtnFace);
 ifcolors[15]:=FormStorage.ReadInteger('Style\IfaceColor15',-16777201);
 ifcolors[16]:=FormStorage.ReadInteger('Style\IfaceColor16',14342874);
 ifcolors[17]:=FormStorage.ReadInteger('Style\IfaceColor17',0);
 ifcolors[18]:=FormStorage.ReadInteger('Style\IfaceColor18',-16777201);
 ifcolors[19]:=FormStorage.ReadInteger('Style\IfaceColor19',16777201);
 ifcolors[20]:=FormStorage.ReadInteger('Style\IfaceColor20',0);
 ifcolors[21]:=FormStorage.ReadInteger('Style\IfaceColor21',$00868686);
 ifcolors[22]:=FormStorage.ReadInteger('Style\IfaceColor22',$00F4F4F4);
 ifcolors[23]:=FormStorage.ReadInteger('Style\IfaceColor23',clBlack);
 ifcolors[24]:=FormStorage.ReadInteger('Style\IfaceColor24',clBtnFace);
 ifcolors[25]:=FormStorage.ReadInteger('Style\IfaceColor25',clWindowText);
 ifcolors[26]:=FormStorage.ReadInteger('Style\IfaceColor26',clWindowText);
 ifcolors[27]:=FormStorage.ReadInteger('Style\IfaceColor27',clWindow);
 ifcolors[28]:=FormStorage.ReadInteger('Style\IfaceColor28',clWindowText);
 ifcolors[29]:=FormStorage.ReadInteger('Style\IfaceColor29',clBtnFace);
 ifcolors[30]:=FormStorage.ReadInteger('Style\IfaceColor30',$00E1FFFF);
 ifcolors[31]:=FormStorage.ReadInteger('Style\IfaceColor31',$00BBBBFF);
 ifcolors[32]:=FormStorage.ReadInteger('Style\IfaceColor32',clBlack);
 ifcolors[33]:=FormStorage.ReadInteger('Style\IfaceColor33',clBlue);
 ifcolors[34]:=FormStorage.ReadInteger('Style\IfaceColor34',clWhite);
 ifcolors[35]:=FormStorage.ReadInteger('Style\IfaceColor35',$00BDBEBD);
 ifcolors[36]:=FormStorage.ReadInteger('Style\IfaceColor36',clBlack);

 TextFont:=FormStorage.ReadString('Style\TextFont','');
 TextFontSize:=FormStorage.ReadFloat('Style\TextFontSize',14);
 ThemeForm.TextFont.FontName:=TextFont;
 ThemeForm.TextFontSize.Value:=TextFontSize;

 ThemeForm.IfaceColors.ItemIndex:=0;
 ThemeForm.IfaceColorBtn.SelectedColor:=ifcolors[0];
 UpdateColors;

 MainForm.ShowKludges.Checked:=SetupForm.ShowKludges.Checked;
end;

procedure TSetupForm.TextColorsChange(Sender: TObject);
begin
ThemeForm.TextColorBtn.SelectedColor:=txcolors[ThemeForm.TextColors.ItemIndex];
ThemeForm.Bold.Checked:=txbold[ThemeForm.TextColors.ItemIndex];
ThemeForm.Italic.Checked:=txitalic[ThemeForm.TextColors.ItemIndex];
ThemeForm.Underlined.Checked:=txunder[ThemeForm.TextColors.ItemIndex];
StyleChanged:=true;
end;

procedure TSetupForm.TextColorBtnChange(Sender: TObject);
begin
txcolors[ThemeForm.TextColors.ItemIndex]:=ThemeForm.TextColorBtn.SelectedColor;
StyleChanged:=true;
end;

procedure TSetupForm.BoldClick(Sender: TObject);
begin
txbold[ThemeForm.TextColors.ItemIndex]:=ThemeForm.Bold.Checked;
StyleChanged:=true;
end;

procedure TSetupForm.ItalicClick(Sender: TObject);
begin
txitalic[ThemeForm.TextColors.ItemIndex]:=ThemeForm.Italic.Checked;
StyleChanged:=true;
end;

procedure TSetupForm.UnderlinedClick(Sender: TObject);
begin
txunder[ThemeForm.TextColors.ItemIndex]:=ThemeForm.Underlined.Checked;
StyleChanged:=true;
end;

procedure TSetupForm.ShowKludgesClick(Sender: TObject);
begin
MainForm.ShowKludges.Checked:=SetupForm.ShowKludges.Checked;
end;

procedure TSetupForm.FormCreate(Sender: TObject);
begin
MainForm.ShowKludges.Checked:=SetupForm.ShowKludges.Checked;
end;

procedure TSetupForm.UpdateColors;
begin
 MainForm.AreaList.Color:=ifcolors[1];
 MainForm.ContactList.Color:=ifcolors[1];
 MainForm.AreaListHeader.Colors.ToolPanelColorFrom:=ifcolors[1];
 MainForm.AreaListHeader.Colors.ToolPanelColorTo:=ifcolors[1];
 MainForm.StyleMgr.Colors.ToolPanelColorFrom:=ifcolors[1];
 MainForm.StyleMgr.Colors.ToolPanelColorTo:=ifcolors[1];
 MainForm.BackPanel.Color:=ifcolors[14];
 MainForm.CloseBtn.Color:=ifcolors[14];

 MainForm.StyleMgr.Colors.SplitterColorFrom:=ifcolors[12];
 MainForm.StyleMgr.Colors.SplitterColorTo:=ifcolors[13];
 MainForm.StyleMgr.Colors.ToolPanelHeaderColorFrom:=ifcolors[10];
 MainForm.StyleMgr.Colors.ToolPanelHeaderColorTo:=ifcolors[11];

 MainForm.PageList.TabStyle.BackgrColor:=ifcolors[15];
 MainForm.PageList.TabStyle.Gradient.FromColor:=ifcolors[15];
 MainForm.PageList.TabStyle.Gradient.ToColor:=ifcolors[16];
 MainForm.PageList.TabStyle.Font.Color:=ifcolors[17];

 MainForm.PageList.TabSelectedStyle.BackgrColor:=ifcolors[18];
 MainForm.PageList.TabSelectedStyle.Gradient.FromColor:=ifcolors[18];
 MainForm.PageList.TabSelectedStyle.Gradient.ToColor:=ifcolors[19];
 MainForm.PageList.TabSelectedStyle.Font.Color:=ifcolors[20];
 MainForm.PageList.RemakeFonts;

// MainForm.MyPainter.CloseRectColor:=ifcolors[21];
// MainForm.MyPainter.CloseColorSelected:=ifcolors[22];
// MainForm.MyPainter.CloseCrossColorSelected:=ifcolors[23];

 MainForm.FastFind.Color:=ifcolors[27];
 MainForm.FastFind.Font.Color:=ifcolors[28];

 MainForm.MainBar.Color:=ifcolors[29];

 MainForm.MainBar.Options:=[sbTransparentBtns];
 if ThemeForm.FlatTB.Checked then
  MainForm.MainBar.Options:=MainForm.MainBar.Options+[sbFlatBtns];
 if ThemeForm.GrayedTB.Checked then
  MainForm.MainBar.Options:=MainForm.MainBar.Options+[sbGrayedBtns];

 MainForm.HintPanel.Color:=ifcolors[30];
 MainForm.HintLbl.Font.Color:=ifcolors[32];
 MainForm.HideLabel.Font.Color:=ifcolors[33];
end;

procedure TSetupForm.BNetmailFlagClick(Sender: TObject);
begin
if FlagsDialog.Execute then ENetmailFlag.Text:=FlagsDialog.FileName;
end;

procedure TSetupForm.BEchomailFlagClick(Sender: TObject);
begin
if FlagsDialog.Execute then EEchomailFlag.Text:=FlagsDialog.FileName;
end;

procedure TSetupForm.BExportListClick(Sender: TObject);
begin
if FlagsDialog.Execute then EExportList.Text:=FlagsDialog.FileName;
end;

procedure TSetupForm.NameAddBtnClick(Sender: TObject);
begin
AddBtn(TwitName,'Введите имя или FTN-адрес');
end;

procedure TSetupForm.NameChgBtnClick(Sender: TObject);
begin
ChangeBtn(TwitName,'Введите имя или FTN-адрес');
end;

procedure TSetupForm.NameDelBtnClick(Sender: TObject);
begin
DelBtn(TwitName);
end;

procedure TSetupForm.JvXPButton4Click(Sender: TObject);
begin
AddBtn(TwitSubj,'Введите имя или FTN-адрес');
end;

procedure TSetupForm.JvXPButton5Click(Sender: TObject);
begin
ChangeBtn(TwitSubj,'Введите имя или FTN-адрес');
end;

procedure TSetupForm.JvXPButton6Click(Sender: TObject);
begin
DelBtn(TwitSubj);
end;

procedure TSetupForm.SaveBtnClick(Sender: TObject);
var fn:string;
    i:byte;
begin
if LowerCase(Themes.Text)='default'
 then begin
  MainForm.JvBalloonHint1.ActivateHint(Themes,'Введите имя сохраняемой темы');
  exit;
 end;
 if not DirectoryExists(ExtractFilePath(Application.ExeName)+'themes') then begin
 {$I-}
 MkDir(ExtractFilePath(Application.ExeName)+'themes');
 if IOResult <> 0 then begin
  MainForm.JvBalloonHint1.ActivateHint(SaveBtn,'Невозможно создать папку themes');
  exit;
 end;
{$I+}
end;
fn:=ExtractFilePath(Application.ExeName)+'themes\'+Themes.Text+'.ini';
ThemeStorage.FileName:=fn;
for i:=0 to 18 do begin
 ThemeStorage.WriteInteger('Style\TextColor'+IntToStr(i),txcolors[i]);
 ThemeStorage.WriteBoolean('Style\TextBold'+IntToStr(i),txbold[i]);
 ThemeStorage.WriteBoolean('Style\TextItalic'+IntToStr(i),txitalic[i]);
 ThemeStorage.WriteBoolean('Style\TextUnderlined'+IntToStr(i),txunder[i]);
end;
for i:=0 to 99 do
 ThemeStorage.WriteInteger('Style\IfaceColor'+IntToStr(i),ifcolors[i]);
ThemeStorage.WriteBoolean('Style\NoStyleColors',ThemeForm.NoStyleColors.Checked);
ThemeStorage.WriteBoolean('Style\FlatTB',ThemeForm.FlatTB.Checked);
ThemeStorage.WriteBoolean('Style\GrayedTB',ThemeForm.GrayedTB.Checked);

// ThemeForm.TextFont.FontName:=FormStorage.ReadString('Style\TextFont','Times New Roman');
// ThemeForm.TextFontSize.Value:=FormStorage.ReadInteger('Style\TextFontSize',14);
ThemeStorage.WriteString('Style\TextFont',ThemeForm.TextFont.FontName);
ThemeStorage.WriteFloat('Style\TextFontSize',ThemeForm.TextFontSize.Value);

ThemeStorage.Flush;
ShowThemes;
end;

procedure TSetupForm.LoadBtnClick(Sender: TObject);
var fn:string;
    i:byte;
begin
StyleChanged:=true;
if LowerCase(Themes.Text)='default' then begin
txcolors[0]:=0;
txbold[0]:=false;
txitalic[0]:=false;
txunder[0]:=false;
txcolors[1]:=128;
txbold[1]:=false;
txitalic[1]:=false;
txunder[1]:=false;
txcolors[2]:=32768;
txbold[2]:=false;
txitalic[2]:=false;
txunder[2]:=false;
txcolors[3]:=8388608;
txbold[3]:=false;
txitalic[3]:=false;
txunder[3]:=false;
txcolors[4]:=8388736;
txbold[4]:=false;
txitalic[4]:=false;
txunder[4]:=false;
txcolors[5]:=8421376;
txbold[5]:=false;
txitalic[5]:=false;
txunder[5]:=false;
txcolors[6]:=8421376;
txbold[6]:=false;
txitalic[6]:=false;
txunder[6]:=false;
txcolors[7]:=8421376;
txbold[7]:=false;
txitalic[7]:=false;
txunder[7]:=false;
txcolors[8]:=8421504;
txbold[8]:=false;
txitalic[8]:=false;
txunder[8]:=false;
txcolors[9]:=16777215;
txbold[9]:=false;
txitalic[9]:=false;
txunder[9]:=true;
txcolors[10]:=0;
txbold[10]:=false;
txitalic[10]:=false;
txunder[10]:=true;
txcolors[11]:=0;
txbold[11]:=true;
txitalic[11]:=false;
txunder[11]:=false;
txcolors[12]:=0;
txbold[12]:=false;
txitalic[12]:=true;
txunder[12]:=false;
txcolors[13]:=0;
txbold[13]:=false;
txitalic[13]:=true;
txunder[13]:=true;
txcolors[14]:=0;
txbold[14]:=true;
txitalic[14]:=false;
txunder[14]:=true;
txcolors[15]:=0;
txbold[15]:=false;
txitalic[15]:=true;
txunder[15]:=true;
txcolors[16]:=0;
txbold[16]:=true;
txitalic[16]:=true;
txunder[16]:=true;
txcolors[17]:=0;
txbold[17]:=false;
txitalic[17]:=false;
txunder[17]:=false;
txcolors[18]:=0;
txbold[18]:=false;
txitalic[18]:=false;
txunder[18]:=false;
ifcolors[0]:=0;
ifcolors[1]:=16777215;
ifcolors[2]:=14548991;
ifcolors[3]:=0;
ifcolors[4]:=12632256;
ifcolors[5]:=16711680;
ifcolors[6]:=32768;
ifcolors[7]:=32768;
ifcolors[8]:=255;
ifcolors[9]:=16777215;
ifcolors[10]:=16777215;
ifcolors[11]:=12435133;
ifcolors[12]:=13026246;
ifcolors[13]:=9211532;
ifcolors[14]:=-16777201;
IfColors[15]:=-16777201;
IfColors[16]:=14342874;
IfColors[17]:=0;
IfColors[18]:=-16777201;
IfColors[19]:=16777201;
IfColors[20]:=0;
ifcolors[21]:=8816262;
ifcolors[22]:=16053492;
ifcolors[23]:=0;
ifcolors[24]:=-16777201;
ifcolors[25]:=-16777208;
ifcolors[26]:=-16777208;
ifcolors[27]:=-16777211;
ifcolors[28]:=-16777208;
ifcolors[29]:=-16777201;
ifcolors[30]:=14811135;
ifcolors[31]:=12303359;
ifcolors[32]:=0;
ifcolors[33]:=16711680;
ifcolors[34]:=0;
ifcolors[35]:=0;
ifcolors[36]:=0;
ifcolors[37]:=0;
ifcolors[38]:=0;
ifcolors[39]:=0;
ifcolors[40]:=0;
ifcolors[41]:=0;
ifcolors[42]:=0;
ifcolors[43]:=0;
ifcolors[44]:=0;
ifcolors[45]:=0;
ifcolors[46]:=0;
ifcolors[47]:=0;
ifcolors[48]:=0;
ifcolors[49]:=0;
ifcolors[50]:=0;
ifcolors[51]:=0;
ifcolors[52]:=0;
ifcolors[53]:=0;
ifcolors[54]:=0;
ifcolors[55]:=0;
ifcolors[56]:=0;
ifcolors[57]:=0;
ifcolors[58]:=0;
ifcolors[59]:=0;
ifcolors[60]:=0;
ifcolors[61]:=0;
ifcolors[62]:=0;
ifcolors[63]:=0;
ifcolors[64]:=0;
ifcolors[65]:=0;
ifcolors[66]:=0;
ifcolors[67]:=0;
ifcolors[68]:=0;
ifcolors[69]:=0;
ifcolors[70]:=0;
ifcolors[71]:=0;
ifcolors[72]:=0;
ifcolors[73]:=0;
ifcolors[74]:=0;
ifcolors[75]:=0;
ifcolors[76]:=0;
ifcolors[77]:=0;
ifcolors[78]:=0;
ifcolors[79]:=0;
ifcolors[80]:=0;
ifcolors[81]:=0;
ifcolors[82]:=0;
ifcolors[83]:=0;
ifcolors[84]:=0;
ifcolors[85]:=0;
ifcolors[86]:=0;
ifcolors[87]:=0;
ifcolors[88]:=0;
ifcolors[89]:=0;
ifcolors[90]:=0;
ifcolors[91]:=0;
ifcolors[92]:=0;
ifcolors[93]:=0;
ifcolors[94]:=0;
ifcolors[95]:=0;
ifcolors[96]:=0;
ifcolors[97]:=0;
ifcolors[98]:=0;
ifcolors[99]:=0;
ThemeForm.NoStyleColors.Checked:=true;
ThemeForm.FlatTB.Checked:=false;
ThemeForm.GrayedTB.Checked:=true;
end
else begin
//load
 fn:=ExtractFilePath(Application.ExeName)+'themes\'+Themes.Text+'.ini';
 if not FileExists(fn) then begin
  MainForm.JvBalloonHint1.ActivateHint(LoadBtn,'Файл не найден: '+fn);
  exit;
 end;
 ThemeStorage.FileName:=fn;
 ThemeStorage.Reload;
 
 txcolors[0]:=ThemeStorage.ReadInteger('Style\TextColor0',clBlack);
 txcolors[1]:=ThemeStorage.ReadInteger('Style\TextColor1',clMaroon);
 txcolors[2]:=ThemeStorage.ReadInteger('Style\TextColor2',clGreen);
 txcolors[3]:=ThemeStorage.ReadInteger('Style\TextColor3',clNavy);
 txcolors[4]:=ThemeStorage.ReadInteger('Style\TextColor4',clPurple);
 txcolors[5]:=ThemeStorage.ReadInteger('Style\TextColor5',clTeal);
 txcolors[6]:=ThemeStorage.ReadInteger('Style\TextColor6',clTeal);
 txcolors[7]:=ThemeStorage.ReadInteger('Style\TextColor7',clTeal);
 txcolors[8]:=ThemeStorage.ReadInteger('Style\TextColor8',clGray);
 txcolors[9]:=ThemeStorage.ReadInteger('Style\TextColor9',clBlue);
 txcolors[10]:=ThemeStorage.ReadInteger('Style\TextColor10',clBlue);
for i:=0 to 8 do begin
 txbold[i]:=ThemeStorage.ReadBoolean('Style\TextBold'+IntToStr(i),false);
 txitalic[i]:=ThemeStorage.ReadBoolean('Style\TextItalic'+IntToStr(i),false);
 txunder[i]:=ThemeStorage.ReadBoolean('Style\TextUnderlined'+IntToStr(i),false);
end;

txbold[9]:=ThemeStorage.ReadBoolean('Style\TextBold'+IntToStr(i),false);
txitalic[9]:=ThemeStorage.ReadBoolean('Style\TextItalic'+IntToStr(i),false);
txunder[9]:=ThemeStorage.ReadBoolean('Style\TextUnderlined'+IntToStr(i),true);

for i:=10 to 16 do begin
 txcolors[i]:=ThemeStorage.ReadInteger('Style\TextColor'+IntToStr(i),clBlack);
end;
 txbold[10]:=ThemeStorage.ReadBoolean('Style\TextBold10',false);
 txitalic[10]:=ThemeStorage.ReadBoolean('Style\TextItalic10',false);
 txunder[10]:=ThemeStorage.ReadBoolean('Style\TextUnderlined10',true);

 txbold[11]:=ThemeStorage.ReadBoolean('Style\TextBold11',true);
 txitalic[11]:=ThemeStorage.ReadBoolean('Style\TextItalic11',false);
 txunder[11]:=ThemeStorage.ReadBoolean('Style\TextUnderlined11',false);

 txbold[12]:=ThemeStorage.ReadBoolean('Style\TextBold12',false);
 txitalic[12]:=ThemeStorage.ReadBoolean('Style\TextItalic12',true);
 txunder[12]:=ThemeStorage.ReadBoolean('Style\TextUnderlined12',false);

 txbold[13]:=ThemeStorage.ReadBoolean('Style\TextBold13',false);
 txitalic[13]:=ThemeStorage.ReadBoolean('Style\TextItalic13',true);
 txunder[13]:=ThemeStorage.ReadBoolean('Style\TextUnderlined13',true);

 txbold[14]:=ThemeStorage.ReadBoolean('Style\TextBold14',true);
 txitalic[14]:=ThemeStorage.ReadBoolean('Style\TextItalic14',false);
 txunder[14]:=ThemeStorage.ReadBoolean('Style\TextUnderlined14',true);

 txbold[15]:=ThemeStorage.ReadBoolean('Style\TextBold15',false);
 txitalic[15]:=ThemeStorage.ReadBoolean('Style\TextItalic15',true);
 txunder[15]:=ThemeStorage.ReadBoolean('Style\TextUnderlined15',true);

 txbold[16]:=ThemeStorage.ReadBoolean('Style\TextBold16',true);
 txitalic[16]:=ThemeStorage.ReadBoolean('Style\TextItalic16',true);
 txunder[16]:=ThemeStorage.ReadBoolean('Style\TextUnderlined16',true);

 ThemeForm.NoStyleColors.Checked:=ThemeStorage.ReadBoolean('Style\NoStyleColors',true);
 ThemeForm.FlatTB.Checked:=ThemeStorage.ReadBoolean('Style\FlatTB',false);
 ThemeForm.GrayedTB.Checked:=ThemeStorage.ReadBoolean('Style\GrayedTB',false);

 ifcolors[0]:=ThemeStorage.ReadInteger('Style\IfaceColor0',clBlack);
 ifcolors[1]:=ThemeStorage.ReadInteger('Style\IfaceColor1',clWhite);
 ifcolors[2]:=ThemeStorage.ReadInteger('Style\IfaceColor2',$00DDFFFF);
 ifcolors[3]:=ThemeStorage.ReadInteger('Style\IfaceColor3',clBlack);
 ifcolors[4]:=ThemeStorage.ReadInteger('Style\IfaceColor4',clSilver);
 ifcolors[5]:=ThemeStorage.ReadInteger('Style\IfaceColor5',clBlue);
 ifcolors[6]:=ThemeStorage.ReadInteger('Style\IfaceColor6',clGreen);
 ifcolors[7]:=ThemeStorage.ReadInteger('Style\IfaceColor7',clGreen);
 ifcolors[8]:=ThemeStorage.ReadInteger('Style\IfaceColor8',clRed);
 ifcolors[9]:=ThemeStorage.ReadInteger('Style\IfaceColor9',clWhite);
 ifcolors[10]:=ThemeStorage.ReadInteger('Style\IfaceColor10',clWhite);
 ifcolors[11]:=ThemeStorage.ReadInteger('Style\IfaceColor11',$00BDBEBD);
 ifcolors[12]:=ThemeStorage.ReadInteger('Style\IfaceColor12',$00C6C3C6);
 ifcolors[13]:=ThemeStorage.ReadInteger('Style\IfaceColor13',$008C8E8C);
 ifcolors[14]:=ThemeStorage.ReadInteger('Style\IfaceColor14',clBtnFace);
 ifcolors[15]:=ThemeStorage.ReadInteger('Style\IfaceColor15',$00BDBEBD);
 ifcolors[16]:=ThemeStorage.ReadInteger('Style\IfaceColor16',$00A0A1A0);
 ifcolors[17]:=ThemeStorage.ReadInteger('Style\IfaceColor17',clBlack);
 ifcolors[18]:=ThemeStorage.ReadInteger('Style\IfaceColor18',clWhite);
 ifcolors[19]:=ThemeStorage.ReadInteger('Style\IfaceColor19',$00BDBEBD);
 ifcolors[20]:=ThemeStorage.ReadInteger('Style\IfaceColor20',clBlack);
 ifcolors[21]:=ThemeStorage.ReadInteger('Style\IfaceColor21',$00868686);
 ifcolors[22]:=ThemeStorage.ReadInteger('Style\IfaceColor22',$00F4F4F4);
 ifcolors[23]:=ThemeStorage.ReadInteger('Style\IfaceColor23',clBlack);
 ifcolors[24]:=ThemeStorage.ReadInteger('Style\IfaceColor24',clBtnFace);
 ifcolors[25]:=ThemeStorage.ReadInteger('Style\IfaceColor25',clWindowText);
 ifcolors[26]:=ThemeStorage.ReadInteger('Style\IfaceColor26',clWindowText);
 ifcolors[27]:=ThemeStorage.ReadInteger('Style\IfaceColor27',clWindow);
 ifcolors[28]:=ThemeStorage.ReadInteger('Style\IfaceColor28',clWindowText);
 ifcolors[29]:=ThemeStorage.ReadInteger('Style\IfaceColor29',clBtnFace);
 ifcolors[30]:=ThemeStorage.ReadInteger('Style\IfaceColor30',$00E1FFFF);
 ifcolors[31]:=ThemeStorage.ReadInteger('Style\IfaceColor31',$00BBBBFF);
 ifcolors[32]:=ThemeStorage.ReadInteger('Style\IfaceColor32',clBlack);
 ifcolors[33]:=ThemeStorage.ReadInteger('Style\IfaceColor33',clBlue);
 for i:=34 to 99 do ifcolors[i]:=ThemeStorage.ReadInteger('Style\IfaceColor'+inttostr(i),clBlack);

end;
ThemeForm.TextColors.ItemIndex:=0;
ThemeForm.IfaceColors.ItemIndex:=0;
ThemeForm.TextColors.Text:=ThemeForm.TextColors.Items[0];
ThemeForm.TextColorBtn.SelectedColor:=ifcolors[0];
ThemeForm.IfaceColorBtn.SelectedColor:=ifcolors[0];
ThemeForm.IfaceColors.Text:=ThemeForm.IfaceColors.Items[0];
ThemeForm.Bold.Checked:=txbold[0];
ThemeForm.Italic.Checked:=txitalic[0];
ThemeForm.Underlined.Checked:=txunder[0];
UpdateColors;
end;

procedure TSetupForm.ShowThemes;
var sr:TSearchRec;
begin
Themes.Clear;
Themes.Items.Add('default');
if FindFirst(ExtractFilePath(Application.ExeName)+'themes\*.ini', faAnyFile, sr) = 0 then
 begin
  repeat
   Themes.Items.Add(Copy(sr.Name,1,Pos('.ini',lowercase(sr.name))-1));
  until FindNext(sr) <> 0;
 FindClose(sr);
 end;
end;

procedure TSetupForm.BtnNdlAddClick(Sender: TObject);
begin
if NodelistDialog.Execute then
 Nodelists.Items.Add(NodelistDialog.FileName);
CheckAllExecute(SetupForm);
end;

procedure TSetupForm.BtnNdlChangeClick(Sender: TObject);
begin
if Nodelists.ItemIndex>=0 then
 if NodelistDialog.Execute then
 Nodelists.Items[Nodelists.ItemIndex]:=NodelistDialog.FileName;
CheckAllExecute(SetupForm);
end;

procedure TSetupForm.BtnNdlSubClick(Sender: TObject);
begin
if Nodelists.ItemIndex>=0 then Nodelists.Items.Delete(Nodelists.ItemIndex);
end;

procedure TSetupForm.BtnPntAddClick(Sender: TObject);
begin
if NodelistDialog.Execute then
 Pointlists.Items.Add(NodelistDialog.FileName);
CheckAllExecute(SetupForm);
end;

procedure TSetupForm.BtnPntChangeClick(Sender: TObject);
begin
if Pointlists.ItemIndex>=0 then
 if NodelistDialog.Execute then
 Pointlists.Items[Pointlists.ItemIndex]:=NodelistDialog.FileName;
CheckAllExecute(SetupForm);
end;

procedure TSetupForm.BtnPntSubClick(Sender: TObject);
begin
if Pointlists.ItemIndex>=0 then Pointlists.Items.Delete(Pointlists.ItemIndex);
end;

procedure TSetupForm.BtnNdlCompileClick(Sender: TObject);

var ZList:TStringList;
    t:PNodelist;

 function processndl(fname:string):boolean;
 var f:textfile;
      s:string;
     sl:TStringList;
     i:integer;
 begin
 if not FileExists(fname) then begin
  Result:=false;
  Exit;
 end;

 with NdlRec do begin
  sl:=TStringList.Create;
  assignfile(f,fname);
  reset(f);

  BtnNdlCompile.Caption:=ExtractFileName(fname)+'...';
  BtnNdlCompile.Repaint;
  BtnNdlCompile.Refresh;

  zone:=0;
  region:=0;
  net:=0;
  node:=0;
  point:=0;
  repeat
   ReadLn(f,s);
   if length(s)=0 then continue;
   if s[1]=';' then continue;
   sl.Clear;
   StrTokenToStrings(s,',',sl);
   if sl.Count<6 then continue;
   for i:=0 to sl.Count-1 do begin
    s:=sl[i];
   StrReplace(s,'''','''''',[rfReplaceAll]);
    StrReplace(s,'`','``',[rfReplaceAll]);
    sl[i]:=s;
   end;
   prefix:=sl[0];
   system:=sl[2];
   location:=sl[3];
   sysop:=sl[4];
   phone:=sl[5];
   flags:='';
   for i:=6 to sl.Count-1 do if flags='' then flags:=sl[i]
    else flags:=flags+','+sl[i];

   if prefix='Zone' then begin
    if ZList.IndexOf(sl[1])>=0 then begin
     closefile(f);
     ShowMessage(fname+#13+'Обнаружено дублирование зоны '+sl[1]+', что недопустимо.'+#13+'Компиляция прервана');
     Exit;
    end;
    ZList.Add(sl[1]);
    zone:=strtoint(sl[1]);
    region:=0;
    net:=0;
    node:=0;
    point:=0;
    NdlAdd(NdlRec);
    continue;
   end;
   if prefix='Region' then begin
    region:=strtoint(sl[1]);
    net:=region;
    node:=0;
    point:=0;
    NdlAdd(NdlRec);
    continue;
   end;
   if prefix='Host' then begin
    net:=strtoint(sl[1]);
    node:=0;
    point:=0;
    NdlAdd(NdlRec);
    continue;
   end;
   if (prefix='') or (prefix='Pvt') or (prefix='Hub')
     or (prefix='Hold') or (prefix='Down')
    then begin
    node:=strtoint(sl[1]);
    point:=0;
    NdlAdd(NdlRec);
    continue;
   end;
  until eof(f);
  closefile(f);
  sl.Free;
 end; //with ...
 Result:=true;
 end;

 function processpnt(fname:string):boolean;
 var f:textfile;
      s:string;
     i:integer;
    ba:TNetAddr;
     t:PNodelist;
    sl:TStringList;
 begin
 if not FileExists(fname) then begin
  Result:=false;
  Exit;
 end;

 with NdlRec do begin
  sl:=TStringList.Create;
  assignfile(f,fname);
  reset(f);

  BtnNdlCompile.Caption:=ExtractFileName(fname)+'...';
  BtnNdlCompile.Repaint;
  BtnNdlCompile.Refresh;

  zone:=0;
  region:=0;
  net:=0;
  node:=0;
  point:=0;
  repeat
   sl.Clear;
   ReadLn(f,s);
   if length(s)=0 then continue;
   if s[1]=';' then continue;
   StrTokenToStrings(s,',',sl);
   if sl.Count<2 then continue;
   if sl[0]='Boss' then begin
    ParseAddr(sl[1],ba,ba);
    t:=NdlFindAddr(ba.zone,ba.net,ba.node);
    if t=nil then ShowMessage('Node not found: '+inttostr(ba.zone)+':'+inttostr(ba.net)+'/'+inttostr(ba.node));
    if t.next<>nil then if (t.next.data.zone=ba.zone)
     and (t.next.data.net=ba.net) and (t.next.data.node=ba.node)
     then begin
     closefile(f);
     ShowMessage(fname+#13+'Обнаружено дублирование узла '+sl[1]+', что недопустимо.'+#13+'Компиляция прервана');
     Result:=false;
     Exit;
    end;
    zone:=ba.Zone;
    net:=ba.Net;
    node:=ba.Node;
    continue;
   end;

   if (sl.Count<6) or (sl[0]<>'Point') then continue;
   for i:=0 to sl.Count-1 do begin
    s:=sl[i];
    StrReplace(s,'''','''''',[rfReplaceAll]);
    StrReplace(s,'`','``',[rfReplaceAll]);
    sl[i]:=s;
   end;
   prefix:=sl[0];
   system:=sl[2];
   location:=sl[3];
   sysop:=sl[4];
   phone:=sl[5];
   flags:='';
   for i:=6 to sl.Count-1 do if flags='' then flags:=sl[i]
    else flags:=flags+','+sl[i];
   point:=StrToInt(sl[1]);
   t:=NdlInsert(NdlRec,t);
  until eof(f);
  closefile(f);
  sl.Free;
 end; //with ...
 Result:=true;
 end;

var i:integer;
 NodelistBin: file of TNodelistRec;

begin
NdlClear;
ZList:=TStringList.Create;
BtnNdlCompile.Caption:='Ждите...';
BtnNdlCompile.Enabled:=false;
BtnNdlCompile.Repaint;
BtnNdlCompile.Refresh;

AssignFile(nodelistbin,ExtractFilePath(Application.ExeName)+'nodelist.bin');
rewrite(nodelistbin);
LnkNodelist:=nil;

for i:=0 to Nodelists.Items.Count-1 do processndl(Nodelists.Items[i]);
for i:=0 to Pointlists.Items.Count-1 do processpnt(Pointlists.Items[i]);

t:=LnkNodelist;
while t<>nil do begin
 write(nodelistbin,t.data);
 t:=t.next;
end;
closefile(nodelistbin);

BtnNdlCompile.Caption:='Компиляция';
BtnNdlCompile.Enabled:=true;
ZList.Free;
NodeListForm.OnCreate(Self);
end;

procedure TSetupForm.StyleChange(Sender: TObject);
begin
StyleChanged:=true;
end;

procedure TSetupForm.TextColorBtnColorChange(Sender: TObject);
begin
StyleChanged:=true;
end;

procedure TSetupForm.IfaceColorBtnColorChange(Sender: TObject);
begin
ifcolors[ThemeForm.IfaceColors.ItemIndex]:=ThemeForm.IfaceColorBtn.SelectedColor;
StyleChanged:=true;
end;

procedure TSetupForm.IfaceColorBtnChange(Sender: TObject);
begin
ifcolors[ThemeForm.IfaceColors.ItemIndex]:=ThemeForm.IfaceColorBtn.SelectedColor;
StyleChanged:=true;
end;

procedure TSetupForm.ThemesBtnClick(Sender: TObject);
begin
ThemeForm.ShowModal;
StyleChanged:=true;
end;

procedure TSetupForm.CarbonAddClick(Sender: TObject);
begin
Prompt.dst:=nil;
Prompt.dstlb:=CarbonAreas;
Prompt.Lbl.caption:='Выберите область';
Prompt.add:=true;
Prompt.list:=true;
Prompt.OKButton.Enabled:=false;
Prompt.Show;
end;

procedure TSetupForm.CarbonChgClick(Sender: TObject);
begin
if CarbonAreas.ItemIndex<0 then Exit;
Prompt.dst:=nil;
Prompt.dstlb:=CarbonAreas;
Prompt.Lbl.caption:='Выберите область';
Prompt.add:=false;
Prompt.list:=true;
Prompt.Show;
end;

procedure TSetupForm.CarbonDelClick(Sender: TObject);
begin
if CarbonAreas.ItemIndex<0 then Exit;
CarbonAreas.Items.Delete(CarbonAreas.ItemIndex);
end;

procedure TSetupForm.ShowSmileysClick(Sender: TObject);
begin
StyleChanged:=true;
end;

procedure TSetupForm.JvXPButton1Click(Sender: TObject);
begin
DateTimeFormat.Text:='ddd, d mmm yyyy, hh:nn';
end;

procedure TSetupForm.LoadManualAreas;
var i:integer;
begin
//  SLMAreatag, SLMAction, SLMPath, SLMBaseType, SLMAreaType,
//  SLMFromAddr, SLMFromName: TStringList;

 ManualAreas.Clear;
 if Config.SLMAreatag.Count=0 then ManualAreas.RowCount:=2
  else ManualAreas.RowCount:=Config.SLMAreatag.Count+1;
 ManualAreas.FixedRows:=1;
 ManualAreas.Cells[0,0]:=lang.aAreatag;
 ManualAreas.Cells[1,0]:=lang.aAction;
 ManualAreas.Cells[2,0]:=lang.aPath;
 ManualAreas.Cells[3,0]:=lang.aBaseType;
 ManualAreas.Cells[4,0]:=lang.aAreaType;
 ManualAreas.Cells[5,0]:=lang.aFromAddr;
 ManualAreas.Cells[6,0]:=lang.aFromName;

 for i:=1 to Config.SLMAreatag.Count do begin
  ManualAreas.Cells[0,i]:=Config.SLMAreatag[i-1];
  ManualAreas.Cells[1,i]:=Config.SLMAction[i-1];
  ManualAreas.Cells[2,i]:=Config.SLMPath[i-1];
  ManualAreas.Cells[3,i]:=Config.SLMBaseType[i-1];
  ManualAreas.Cells[4,i]:=Config.SLMAreaType[i-1];
  ManualAreas.Cells[5,i]:=Config.SLMFromAddr[i-1];
  ManualAreas.Cells[6,i]:=Config.SLMFromName[i-1];
 end;

 if (ManualAreas.RowCount=2) and (ManualAreas.Cells[0,1]='') then begin
  MAreaChange.Enabled:=false;
  MAreaDelete.Enabled:=false;
 end
 else begin
  MAreaChange.Enabled:=true;
  MAreaDelete.Enabled:=true;
 end;
end;

procedure TSetupForm.MAreaAddClick(Sender: TObject);
begin
AreaForm.EditArea:='';
AreaForm.ShowModal;
end;

procedure TSetupForm.MAreaChangeClick(Sender: TObject);
begin
AreaForm.EditArea:=ManualAreas.Cells[0,ManualAreas.Row];
AreaForm.ShowModal;
end;

procedure TSetupForm.TaglineBrowseClick(Sender: TObject);
begin
if LinesOpenDialog.Execute then
 Tagline.Text:='@'+LinesOpenDialog.FileName;
end;

procedure TSetupForm.TearlineBrowseClick(Sender: TObject);
begin
if LinesOpenDialog.Execute then
 Tearline.Text:='@'+LinesOpenDialog.FileName;
end;

procedure TSetupForm.OriginBrowseClick(Sender: TObject);
begin
if LinesOpenDialog.Execute then
 Origin.Text:='@'+LinesOpenDialog.FileName;
end;

procedure TSetupForm.MAreaDeleteClick(Sender: TObject);
var i:longint;
begin
if ManualAreas.Cells[0,ManualAreas.Row]='' then Exit;
if Application.MessageBox(PAnsiChar(lang.delarea),PAnsiChar(lang.confirmation),MB_YESNO)=IDNO then Exit;
i:=Config.SLMAreatag.IndexOf(ManualAreas.Cells[0,ManualAreas.Row]);
if i=-1 then begin
 Showmessage(lang.areanotfound);
 Exit;
end;
Config.SLMAreatag.Delete(i);
Config.SLMAction.Delete(i);
Config.SLMPath.Delete(i);
Config.SLMBaseType.Delete(i);
Config.SLMAreaType.Delete(i);
Config.SLMFromAddr.Delete(i);
Config.SLMFromName.Delete(i);
Config.WriteAreaDefs;
LoadManualAreas;
end;

end.

