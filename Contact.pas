unit Contact;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, JvExControls, JvComponent, JvStaticText, StdCtrls, JvExStdCtrls,
  JvEdit, JvXPCore, JvXPButtons, JvSimpleXML, JvComponentBase,
  JvBalloonHint, Language;

type
  TContactForm = class(TForm)
    OKButton: TJvXPButton;
    CancelButton: TJvXPButton;
    EDisplayName: TJvEdit;
    LDisplayName: TJvStaticText;
    LName: TJvStaticText;
    EName: TJvEdit;
    LFTNAddr: TJvStaticText;
    EFTNAddr: TJvEdit;
    LEmail: TJvStaticText;
    EEmail: TJvEdit;
    EPhone: TJvEdit;
    LPhone: TJvStaticText;
    JvBalloonHint1: TJvBalloonHint;
    procedure EKeyPress(Sender: TObject; var Key: Char);
    procedure CancelButtonClick(Sender: TObject);
    procedure OKButtonClick(Sender: TObject);
    procedure SaveContact;
    procedure EDisplayNameExit(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    contact_id: integer; // -1 - добавить контакт
  end;

var
  ContactForm: TContactForm;

implementation

uses Main;

{$R *.dfm}

procedure TContactForm.EKeyPress(Sender: TObject; var Key: Char);
begin
if Key=#27 then ContactForm.Close;
if Key=#13 then SaveContact;
end;

procedure TContactForm.CancelButtonClick(Sender: TObject);
begin
ContactForm.Close;
end;

procedure TContactForm.OKButtonClick(Sender: TObject);
begin
SaveContact;
end;

procedure TContactForm.SaveContact;
var x:TJvSimpleXMLElem;
begin
if EDisplayName.Text='' then begin
 JvBalloonHint1.ActivateHint(EDisplayName,lang.fillstring);
 Exit;
end;
if EName.Text='' then begin
 JvBalloonHint1.ActivateHint(EName,lang.fillstring);
 Exit;
end;

if contact_id=-1 then begin
 x:=MainForm.ContactsXML.Root.Items.Add('contact');
 x.Items.Add('displayname',EDisplayName.Text);
 x.Items.Add('name',EName.Text);
 x.Items.Add('address',EFtnAddr.Text);
 x.Items.Add('e-mail',EEMail.Text);
 x.Items.Add('phone',EPhone.Text);
end
else begin
 x:=MainForm.ContactsXML.Root.Items[contact_id];
 if x=nil then exit;

 if x.Items.ItemNamed['displayname']=nil then x.Items.Add('displayname',EDisplayName.Text)
  else x.Items.ItemNamed['displayname'].Value:=EDisplayName.Text;
 if x.Items.ItemNamed['name']=nil then x.Items.Add('name',EName.Text)
  else x.Items.ItemNamed['name'].Value:=EName.Text;
 if x.Items.ItemNamed['address']=nil then x.Items.Add('address',EFtnAddr.Text)
  else x.Items.ItemNamed['address'].Value:=EFtnAddr.Text;
 if x.Items.ItemNamed['e-mail']=nil then x.Items.Add('e-mail',EEMail.Text)
  else x.Items.ItemNamed['e-mail'].Value:=EEmail.Text;
 if x.Items.ItemNamed['phone']=nil then x.Items.Add('phone',EPhone.Text)
  else x.Items.ItemNamed['phone'].Value:=EPhone.Text;
end;
ContactForm.Close;
MainForm.DoContactList;
end;

procedure TContactForm.EDisplayNameExit(Sender: TObject);
begin
if EName.Text='' then EName.Text:=EDisplayName.Text;
end;

procedure TContactForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
MainForm.SetFocus; // не работает :(
end;

end.
