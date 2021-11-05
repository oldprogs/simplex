unit NdlCmpProgress;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TNdlCmpProgressForm = class(TForm)
    curAddr: TLabel;
    curFile: TLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  NdlCmpProgressForm: TNdlCmpProgressForm;

implementation

{$R *.dfm}

end.
