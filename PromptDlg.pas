unit PromptDlg;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, JvExStdCtrls, JvEdit, JvExControls, JvComponent,
  JvXPCore, JvXPButtons, JvLabel, JvComboBox, JvListBox, ConfigType;

type
  TPrompt = class(TForm)
    OKButton: TJvXPButton;
    CancelButton: TJvXPButton;
    Edit: TJvEdit;
    Lbl: TJvLabel;
    AreasCB: TJvComboBox;
    procedure OKButtonClick(Sender: TObject);
    procedure CancelButtonClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure EditKeyPress(Sender: TObject; var Key: Char);
    procedure AreasCBKeyPress(Sender: TObject; var Key: Char);
    procedure AreasCBChange(Sender: TObject);
  private
    { Private declarations }
  public
   dst: TJvComboBox;
   dstlb: TJvListBox;
   add: boolean;
   list: boolean;
  end;

var
  Prompt: TPrompt;

implementation

uses Setup,Main, SelDest;

{$R *.dfm}

procedure TPrompt.OKButtonClick(Sender: TObject);
var ii:Cardinal;
begin
if list then Edit.Text:=AreasCB.Text;
if Edit.Text='' then exit;
if dst<>nil then begin
 if add then begin
  dst.Items.Add(Edit.Text);
  if dst.Items.Count=1 then dst.ItemIndex:=0;
 end
 else if Edit.Text<>'' then begin
  ii:=dst.ItemIndex;
  dst.Items[ii]:=Edit.Text;
  dst.ItemIndex:=ii;
 end;
end
else begin
 if add then begin
  dstlb.Items.Add(Edit.Text);
  if dstlb.Items.Count=1 then dstlb.ItemIndex:=0;
 end
 else if Edit.Text<>'' then begin
  ii:=dstlb.ItemIndex;
  dstlb.Items[ii]:=Edit.Text;
  dstlb.ItemIndex:=ii;
 end;
end;
SendMessage(SetupForm.Handle,ID_CHECKALL,0,0);
Hide;
end;

procedure TPrompt.CancelButtonClick(Sender: TObject);
begin
SendMessage(SetupForm.Handle,ID_CHECKALL,0,0);
Hide;
end;

procedure TPrompt.FormShow(Sender: TObject);
begin
if list then begin
 AreasCB.Show;
 Edit.Hide;
 AreasCB.Clear;
 AreasCB.Items:=SelectDestArea.DestAreas.Items;
 if not Add then
  if dstlb.Items.Count>0 then AreasCB.Text:=dstlb.Items[dstlb.ItemIndex];
 AreasCB.SetFocus;
end
else begin
 Edit.Show;
 AreasCB.Hide;
 Edit.Clear;
 Edit.SetFocus;
end;
end;

procedure TPrompt.EditKeyPress(Sender: TObject; var Key: Char);
begin
if Key=#13 then OKButtonClick(Prompt) else
 if Key=#27 then CancelButtonClick(Prompt);
end;

procedure TPrompt.AreasCBKeyPress(Sender: TObject; var Key: Char);
begin
 if Key=#27 then CancelButton.OnClick(self);
 if key=#27 then OkButton.OnClick(self);
end;

procedure TPrompt.AreasCBChange(Sender: TObject);
begin
 Prompt.OKButton.Enabled:=true;
end;

end.
