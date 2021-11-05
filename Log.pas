unit Log;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, JvExStdCtrls, JvMemo, DateUtils;

type
  TLogForm = class(TForm)
    LogMemo: TJvMemo;
    ContinueBtn: TButton;
    CloseBtn: TButton;
    TerminateBtn: TButton;
    Label1: TLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ContinueBtnClick(Sender: TObject);
    procedure CloseBtnClick(Sender: TObject);
    procedure TerminateBtnClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure LogMemoKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

const MAXERRS=50;  

var
  LogForm: TLogForm;

  procedure LogEvent(LogString: String);
  procedure DebugEvent(LogString: String);

implementation

{$R *.dfm}

uses Main, Language;

procedure LogEvent;
var i:integer;
    logname:string;
begin
Screen.Cursor:=crDefault;
LogForm.LogMemo.Lines.Add(DateTimeToStr(Now)+' ERROR: '+LogString);
if LogForm.LogMemo.Lines.Count>MAXERRS then begin
 logname:='crashed '+inttostr(YearOf(Now))+'_'+
  inttostr(MonthOf(Now))+'_'+inttostr(DayOf(Now))+' '+
  inttostr(HourOf(Now))+'_'+inttostr(MinuteOf(Now))+'_'+
  inttostr(SecondOf(Now))+'.log';
{ try
  LogForm.LogMemo.Lines.SaveToFile(ExtractFilePath(Application.ExeName)+logname);
  ShowMessage(lang.extoomany+#13+lang.exlogname+' '+logname);
 except
  on E: Exception do ShowMessage(lang.extoomany);
 end;
 Application.Terminate;}
end;
if not LogForm.Visible then LogForm.ShowModal;
LogForm.BringToFront;
end;

procedure DebugEvent;
begin
LogForm.LogMemo.Lines.Add(DateTimeToStr(Now)+' DEBUG: '+LogString);
end;

procedure TLogForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
Action:=caHide;
end;

procedure TLogForm.ContinueBtnClick(Sender: TObject);
begin
Close;
end;

procedure TLogForm.CloseBtnClick(Sender: TObject);
begin
MainForm.Close;
end;

procedure TLogForm.TerminateBtnClick(Sender: TObject);
begin
Application.Terminate;
end;

procedure TLogForm.FormShow(Sender: TObject);
begin
SendMessage(LogMemo.Handle,WM_VSCROLL,SB_BOTTOM,0);
end;

procedure TLogForm.LogMemoKeyPress(Sender: TObject; var Key: Char);
begin
if key=#27 then ContinueBtn.Click;

end;

end.
