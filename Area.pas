unit Area;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, JvExControls, JvComponent, JvXPCore, JvXPButtons, JvStaticText,
  StdCtrls, JvExStdCtrls, JvEdit, JvCombobox, JvRadioButton, ConfigType;

type
  TAreaForm = class(TForm)
    OKButton: TJvXPButton;
    CancelButton: TJvXPButton;
    Areatag: TJvEdit;
    LAreatag: TJvStaticText;
    JvStaticText1: TJvStaticText;
    defNew: TJvRadioButton;
    defOverride: TJvRadioButton;
    Path: TJvEdit;
    JvStaticText2: TJvStaticText;
    BaseType: TJvComboBox;
    JvStaticText3: TJvStaticText;
    JvStaticText4: TJvStaticText;
    AreaType: TJvComboBox;
    JvStaticText5: TJvStaticText;
    FromAddr: TJvComboBox;
    JvStaticText6: TJvStaticText;
    FromName: TJvComboBox;
    procedure CancelButtonClick(Sender: TObject);
    procedure OKButtonClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    EditArea: string;
    { Public declarations }
  end;

var
  AreaForm: TAreaForm;

implementation

uses Main, Language, Setup, Log;

{$R *.dfm}

procedure TAreaForm.CancelButtonClick(Sender: TObject);
begin
AreaForm.Close;
end;

procedure TAreaForm.OKButtonClick(Sender: TObject);
var i:longint;
begin
if Areatag.Text='' then begin
 ShowMessage(lang.noareatag);
 Exit;
end;

if (defNew.Checked=false) and (defOverride.Checked=false)
 then begin
 ShowMessage(lang.noaction);
 Exit;
end;

if defNew.Checked then begin
 if Path.Text='' then begin
  ShowMessage(lang.nopath);
  Exit;
 end;
 if BaseType.ItemIndex<=0 then begin
  ShowMessage(lang.nobasetype);
  Exit;
 end;
 if AreaType.ItemIndex<=0 then begin
  ShowMessage(lang.noareatype);
  Exit;
 end;
end;

if EditArea='' then begin
//добавляем новую арию
 if ((Config.Areas.FindEchoArea(AreaTag.Text)<>nil)
  and (defNew.Checked)) then begin
  ShowMessage(lang.alreadydef);
  Exit;
 end;
 Config.SLMAreatag.Add(AreaTag.Text);
 if defNew.Checked then Config.SLMAction.Add('new')
  else Config.SLMAction.Add('override');
 Config.SLMPath.Add(Path.Text);

 case BaseType.ItemIndex of
  -1,0: Config.SLMBaseType.Add('');
  1: Config.SLMBaseType.Add('J');
  2: Config.SLMBaseType.Add('S');
  3: Config.SLMBaseType.Add('F');
 end;

 case AreaType.ItemIndex of
  -1,0: Config.SLMAreaType.Add('');
  1: Config.SLMAreaType.Add('echo');
  2: Config.SLMAreaType.Add('net');
  3: Config.SLMAreaType.Add('local');
 end;

 Config.SLMFromAddr.Add(FromAddr.Text);
 Config.SLMFromName.Add(FromName.Text);
end
else begin
//изменяем арию из списка
 i:=Config.SLMAreatag.IndexOf(EditArea);
 if i=-1 then begin
  ShowMessage(lang.areanotfound);
  Exit;
 end;
 Config.SLMAreatag[i]:=AreaTag.Text;
 if defNew.Checked then Config.SLMAction[i]:='new'
  else Config.SLMAction[i]:='override';
 Config.SLMPath[i]:=Path.Text;

 case BaseType.ItemIndex of
  -1,0: Config.SLMBaseType[i]:='';
  1: Config.SLMBaseType[i]:='J';
  2: Config.SLMBaseType[i]:='S';
  3: Config.SLMBaseType[i]:='F';
 end;

 case AreaType.ItemIndex of
  -1,0: Config.SLMAreaType[i]:='';
  1: Config.SLMAreaType[i]:='echo';
  2: Config.SLMAreaType[i]:='net';
  3: Config.SLMAreaType[i]:='local';
 end;

 Config.SLMFromAddr[i]:=FromAddr.Text;
 Config.SLMFromName[i]:=FromName.Text;
end;
Config.WriteAreaDefs;
SetupForm.LoadManualAreas;
AreaForm.Close;
end;

procedure TAreaForm.FormShow(Sender: TObject);
var i:integer;
begin
 FromName.Items:=SetupForm.Users.Items;
 FromAddr.Items:=SetupForm.FtnAddr.Items;
 if EditArea<>'' then begin
  AreaTag.Text:=EditArea;
  i:=Config.SLMAreatag.IndexOf(EditArea);
  if i=-1 then begin
   LogEvent(lang.areanotfound+': '+EditArea);
   AreaForm.Close;
   Exit;
  end;
  if Config.SLMAction[i]='new' then
   defNew.Checked:=true else defOverride.Checked:=true;
  Path.Text:=Config.SLMPath[i];
  case Config.SLMBaseType[i][1] of
   'J': BaseType.ItemIndex:=0;
   'S': BaseType.ItemIndex:=1;
   'F': BaseType.ItemIndex:=2;
  end;
  if Config.SLMAreaType[i]='echo' then AreaType.ItemIndex:=0;
  if Config.SLMAreaType[i]='net' then AreaType.ItemIndex:=1;
  if Config.SLMAreaType[i]='local' then AreaType.ItemIndex:=2;
  FromName.Text:=Config.SLMFromName[i];
  FromAddr.Text:=Config.SLMFromAddr[i];
 end
 else begin
  defNew.Checked:=true;
  AreaTag.Text:='';
  Path.Text:='';
  BaseType.ItemIndex:=0;
  AreaType.ItemIndex:=0;
  if FromAddr.Items.Count>0 then FromAddr.ItemIndex:=0;
  if FromName.Items.Count>0 then FromName.ItemIndex:=0;
 end;
end;

end.
