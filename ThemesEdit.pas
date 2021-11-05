unit ThemesEdit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, JvExExtCtrls, JvComponent, JvPanel,
  JvOfficeColorPanel, JvExControls, JvGroupHeader, StdCtrls, JvExStdCtrls,
  JvCheckBox, JvCombobox, Mask, JvExMask, JvSpin, JvStaticText,
  JvColorCombo, JvXPCore, JvXPButtons;

type
  TThemeForm = class(TForm)
    TextFont: TJvFontComboBox;
    JvStaticText9: TJvStaticText;
    TextFontSize: TJvSpinEdit;
    TextColors: TJvComboBox;
    JvStaticText8: TJvStaticText;
    Bold: TJvCheckBox;
    Italic: TJvCheckBox;
    Underlined: TJvCheckBox;
    IfaceColors: TJvComboBox;
    JvStaticText10: TJvStaticText;
    JvGroupHeader1: TJvGroupHeader;
    TextColorBtn: TJvOfficeColorPanel;
    IfaceColorBtn: TJvOfficeColorPanel;
    OKButton: TJvXPButton;
    FlatTB: TJvCheckBox;
    GrayedTB: TJvCheckBox;
    NoStyleColors: TJvCheckBox;
    JvGroupHeader2: TJvGroupHeader;
    procedure OKButtonClick(Sender: TObject);
    procedure IfaceColorsChange(Sender: TObject);
    procedure TextColorsChange(Sender: TObject);
    procedure IfaceColorBtnColorChange(Sender: TObject);
    procedure TextColorBtnColorChange(Sender: TObject);
    procedure TextFontChange(Sender: TObject);
    procedure TextFontSizeChange(Sender: TObject);
    procedure BoldClick(Sender: TObject);
    procedure ItalicClick(Sender: TObject);
    procedure UnderlinedClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ThemeForm: TThemeForm;

implementation

uses Setup;

{$R *.dfm}

procedure TThemeForm.OKButtonClick(Sender: TObject);
begin
ThemeForm.Close;
end;

procedure TThemeForm.IfaceColorsChange(Sender: TObject);
begin
IfaceColorBtn.SelectedColor:=SetupForm.ifcolors[ThemeForm.IfaceColors.ItemIndex];
IfaceColorBtn.Properties.DefaultColorColor:=SetupForm.ifcolors[ThemeForm.IfaceColors.ItemIndex];
end;

procedure TThemeForm.TextColorsChange(Sender: TObject);
begin
TextColorBtn.SelectedColor:=SetupForm.txcolors[ThemeForm.TextColors.ItemIndex];
TextColorBtn.Properties.DefaultColorColor:=SetupForm.txcolors[ThemeForm.TextColors.ItemIndex];
Bold.Checked:=SetupForm.txbold[TextColors.ItemIndex];
Italic.Checked:=SetupForm.txitalic[TextColors.ItemIndex];
Underlined.Checked:=SetupForm.txunder[TextColors.ItemIndex];
end;

procedure TThemeForm.IfaceColorBtnColorChange(Sender: TObject);
begin
SetupForm.ifcolors[IfaceColors.ItemIndex]:=IfaceColorBtn.SelectedColor;
IfaceColorBtn.Properties.DefaultColorColor:=IfaceColorBtn.SelectedColor;
end;

procedure TThemeForm.TextColorBtnColorChange(Sender: TObject);
begin
SetupForm.txcolors[TextColors.ItemIndex]:=TextColorBtn.SelectedColor;
TextColorBtn.Properties.DefaultColorColor:=TextColorBtn.SelectedColor;
end;

procedure TThemeForm.TextFontChange(Sender: TObject);
begin
SetupForm.TextFont:=TextFont.FontName;
end;

procedure TThemeForm.TextFontSizeChange(Sender: TObject);
begin
SetupForm.TextFontSize:=TextFontSize.Value;
end;

procedure TThemeForm.BoldClick(Sender: TObject);
begin
SetupForm.txbold[TextColors.ItemIndex]:=Bold.Checked;
end;

procedure TThemeForm.ItalicClick(Sender: TObject);
begin
SetupForm.txitalic[TextColors.ItemIndex]:=Italic.Checked;
end;

procedure TThemeForm.UnderlinedClick(Sender: TObject);
begin
SetupForm.txunder[TextColors.ItemIndex]:=Underlined.Checked;
end;

end.
