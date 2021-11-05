program SimpleX;

uses
  Forms,
  SysUtils,
  Dialogs,
  JclFileUtils,
  JclDateTime,
  Windows,
  Main in 'Main.pas' {MainForm},
  View in 'View.pas' {ViewForm},
  Setup in 'Setup.pas' {SetupForm},
  PromptDlg in 'PromptDlg.pas' {Prompt},
  Log in 'Log.pas' {LogForm},
  Edit in 'Edit.pas' {EditForm},
  About in 'About.pas' {AboutForm},
  SelDest in 'SelDest.pas' {SelectDestArea},
  Tree in 'Tree.pas' {TreeForm},
  NodeList in 'NodeList.pas' {NodelistForm},
  Language in 'Language.pas',
  ThemesEdit in 'ThemesEdit.pas' {ThemeForm},
  NdlCmpProgress in 'NdlCmpProgress.pas' {NdlCmpProgressForm},
  Area in 'Area.pas' {AreaForm},
  Contact in 'Contact.pas' {ContactForm},
  SimpleXForm in 'SimpleXForm.pas',
  ConfigType in 'ConfigType.pas',
  smapi,
  FGHIprocs in 'FGHIprocs.pas';

{$R *.res}

var i: integer;
    ndate, maxdate: double;
    mi:PMInf;

function FAge(fName:string):double;
var i,j:TDateTime;
begin
 i:=filetimetodatetime(GetFileCreation(fName));
 j:=filetimetodatetime(GetFileLastWrite(fName));
 if i>j then Result:=i else Result:=j;
end;

begin
  ChDir(ExtractFilePath(Application.ExeName));
  if not FileExists('pcre.dll') then begin
   ShowMessage('Required library not found: pcre.dll');
   Exit;
  end;
  Application.Initialize;
  Application.Title := 'SimpleX';

  MsgOpenApi(@MInf);

  Application.CreateForm(TMainForm, MainForm);
  Application.CreateForm(TViewForm, ViewForm);
  Application.CreateForm(TSetupForm, SetupForm);
  Application.CreateForm(TPrompt, Prompt);
  Application.CreateForm(TLogForm, LogForm);
  Application.CreateForm(TEditForm, EditForm);
  Application.CreateForm(TAboutForm, AboutForm);
  Application.CreateForm(TSelectDestArea, SelectDestArea);
  Application.CreateForm(TTreeForm, TreeForm);
  Application.CreateForm(TNodelistForm, NodelistForm);
  Application.CreateForm(TThemeForm, ThemeForm);
  Application.CreateForm(TNdlCmpProgressForm, NdlCmpProgressForm);
  Application.CreateForm(TAreaForm, AreaForm);
  Application.CreateForm(TContactForm, ContactForm);
  try
   SetupForm.AppIniFileStorage.Reload;
   SetupForm.FormStorage.RestoreFormPlacement;
  except
   on E: Exception do LogEvent('Reload / RestoreFormPlacement failed: '+E.Message);
  end;

  try
   if SetupForm.CompileAtStart.Checked then
    if not FileExists(ExtractFilePath(Application.ExeName)+'nodelist.bin')
     then SetupForm.BtnNdlCompile.OnClick(SetupForm) else
     if SetupForm.Nodelists.Count>0 then begin
      ndate:=FAge(ExtractFilePath(Application.ExeName)+'nodelist.bin');
      maxdate:=ndate;
      for i:=1 to SetupForm.Nodelists.Count do
       if FileExists(SetupForm.Nodelists.Items[i-1]) then
        if FAge(SetupForm.Nodelists.Items[i-1])>maxdate then maxdate:=FAge(SetupForm.Nodelists.Items[i-1]);
      for i:=1 to SetupForm.Pointlists.Count do
       if FileExists(SetupForm.Pointlists.Items[i-1]) then
        if FAge(SetupForm.Pointlists.Items[i-1])>maxdate then maxdate:=FAge(SetupForm.Pointlists.Items[i-1]);
      if maxdate>ndate then SetupForm.BtnNdlCompile.OnClick(SetupForm);
    end;

  except
   on E: Exception do LogEvent('Nodelist compilation failed: '+E.Message);
  end;

  system.New(mi);
  mi.def_zone:=0;
  if msgopenapi(mi)<>0 then LogEvent('msgopenapi failed');

  DebugEvent ('Starting SimpleX...');

  Application.Run;
  dispose(mi);
end.
