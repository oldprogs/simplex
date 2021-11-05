unit MsgText;

interface

uses
  SysUtils, Classes, Messages, Controls, StdCtrls, JvExStdCtrls, JvRichEdit;

type
  TMsgText = class(TJvRichEdit)
  private
    procedure kpress(var Message); message WM_KEYDOWN;
    { Private declarations }
  protected
    { Protected declarations }
  public
    { Public declarations }
  published
    { Published declarations }
  end;

procedure Register;

implementation

procedure Register;
begin
  RegisterComponents('SimpleX-related', [TMsgText]);
end;

procedure TMsgText.kpress(var Message);
begin
//
end;

end.
