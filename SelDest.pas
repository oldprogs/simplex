unit SelDest;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, JvExStdCtrls, JvListBox, JvExControls, JvComponent,
  JvXPCore, JvXPButtons, ExtCtrls, JvExExtCtrls, JvFooter;

type
  TSelectDestArea = class(TForm)
    DestAreas: TJvListBox;
    JvFooter1: TJvFooter;
    OKButton: TJvXPButton;
    CancelButton: TJvXPButton;
    procedure DestAreasKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure OKButtonClick(Sender: TObject);
    procedure CancelButtonClick(Sender: TObject);
    procedure DestAreasKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DestAreasClick(Sender: TObject);
    procedure DestAreasDblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  SelectDestArea: TSelectDestArea;
  q:string='';

implementation

uses Setup, Main, View, StrUtils, SimpleXForm, ConfigType;

{$R *.dfm}

procedure TSelectDestArea.DestAreasKeyPress(Sender: TObject;
  var Key: Char);
var i:longint;
begin
case Key of
 #13: OKButtonClick(SelectDestArea);
 #27: CancelButtonClick(SelectDestArea);
 else if (ord(key)>=33) and (ord(key)<=122) then begin
  q:=q+key;      
  i:=-1;
  repeat
   inc(i);
  until (i=DestAreas.Count) or (AnsiStartsText(q,DestAreas.Items[i]));
  if i<DestAreas.Count then DestAreas.ItemIndex:=i;
 key:=#0; 
 end;
end; //case
end;

procedure TSelectDestArea.FormShow(Sender: TObject);
var i:longint;
begin
DestAreas.UnselectAll;
OKButton.Enabled:=false;
i:=DestAreas.Items.IndexOf(SetupForm.ENetMail.Text);
if i>-1 then begin
 DestAreas.Selected[i]:=true;
 OKButton.Enabled:=true;
end;
end;

procedure TSelectDestArea.OKButtonClick(Sender: TObject);
var vf:TViewForm;
begin
if not OKButton.Enabled then Exit;
case SelectDestArea.Tag of
 0: begin //quote in another
  if MainForm.PageList.PageCount=0 then Exit;
  vf:=MainForm.PageList.ActivePage.Components[0] as TViewForm;
  if vf.FormType<>ftView then Exit;
  MainForm.NewMsg(Config.Areas.FindEchoArea(DestAreas.Items[DestAreas.ItemIndex]),vf.Area,vf.msgnum,Quote);
  MainForm.HintText('Производится ОТВЕТ В ДРУГУЮ ОБЛАСТЬ на сообщение.'+#13+
  'Чаще всего данная функция используется, когда необходимо ответить автору сообщения эхи нетмейлом.');
 end;
 1: begin //forward
  if MainForm.PageList.PageCount=0 then Exit;
  vf:=MainForm.PageList.ActivePage.Components[0] as TViewForm;
  if vf.FormType<>ftView then Exit;
  MainForm.NewMsg(Config.Areas.FindEchoArea(DestAreas.Items[DestAreas.ItemIndex]),vf.Area,vf.msgnum,Fwd);
  MainForm.HintText('Производится ПЕРЕСЫЛКА сообщения в другую область, она же форвард.');
 end;
end; //case
SelectDestArea.Close;
end;

procedure TSelectDestArea.CancelButtonClick(Sender: TObject);
begin
SelectDestArea.Close;
end;

procedure TSelectDestArea.DestAreasKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if DestAreas.ItemIndex>=0 then OKButton.Enabled:=true;
if (key=VK_UP) or (key=VK_DOWN) or
 (key=VK_HOME) or (key=VK_END) or
 (key=VK_PRIOR) or (key=VK_NEXT) then q:='';
end;

procedure TSelectDestArea.DestAreasClick(Sender: TObject);
begin
if DestAreas.ItemIndex>=0 then OKButton.Enabled:=true;
end;

procedure TSelectDestArea.DestAreasDblClick(Sender: TObject);
begin
OKButtonClick(SelectDestArea);
end;

end.
