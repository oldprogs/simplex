unit About;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, JvExControls, JvComponent, JvXPCore, JvXPButtons, JvLabel,
  StdCtrls, JvExStdCtrls, JvHtControls, JvPoweredBy;

type
  TAboutForm = class(TForm)
    LProduct: TJvLabel;
    OkBtn: TJvXPButton;
    LCredits: TJvHTLabel;
    JvPoweredByJVCL1: TJvPoweredByJVCL;
    procedure OkBtnClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  AboutForm: TAboutForm;

implementation

{$R *.dfm}

uses Main;

procedure TAboutForm.OkBtnClick(Sender: TObject);
begin
Close;
end;

procedure TAboutForm.FormCreate(Sender: TObject);
begin
 LProduct.Caption:=ProductName+' '+GetFileVersion;
 LCredits.Caption:='(c) kaman, 2006-2007<br><br>how do u like this product?<br><br>write me 2 <a href="mailto:kaman@rndfido.net">kaman@rndfido.net</a> || 2:5061/120 <br>if u want some more';
end;

end.
