unit FGHIprocs;

interface

uses SysUtils,Classes;

type FGHIrec = record
 scheme: string[7];
 schemeSpecificPart: string;
 requiredPart: string;
 optionalPart: string;
 optionalParam: array of record
  name: string;
  value: string;
 end;
 echoName: string;
 station: string;
 request: string;
 objectPath: string;
end;

Type TFGHI = class
 procedure UpdateAddrText;
 procedure DoAddr(URI: string);
end;

var FGHI: TFGHI;

implementation

uses Main,View,SimpleXForm,ConfigType,Log,JclStrings,
     StrUtils,Dialogs,JclShell,Language;

procedure TFGHI.UpdateAddrText;
var xf: TSimpleXForm;
    t:string;
begin
 if MainForm.PageList.PageCount=0 then begin
  MainForm.FGHIaddr.Text:='area://';
  Exit;
 end;

 xf:=MainForm.PageList.ActivePage.Components[0] as TSimpleXForm;
 if xf=nil then begin
  DebugEvent ('FGHIaddr update failed -- no active form found');
  Exit;
 end;

 if xf.FormType=ftView then begin
  if (xf as TViewForm).MsgList.Items.Count=0 then
   MainForm.FGHIaddr.Text:='area://'+strlower(xf.Area.Name)
  else begin
   t:=(xf as TViewForm).msgid;
   JclStrings.StrReplace(t,' ','+',[rfReplaceAll]);
   MainForm.FGHIaddr.Text:='area://'+strlower(xf.Area.Name)+'?msgid='+t;
  end;
  DebugEvent('FGHIaddr set OK (for ViewForm)');
  Exit;
 end;

 MainForm.FGHIaddr.Text:='';
end;

procedure TFGHI.DoAddr;
var sl,sl1:TStringList;
    areaname:string;
    params:string;
    nm,i:integer;
    msgn:integer;
    vf:TViewForm;
    Area: TArea;
begin
 sl:=TStringList.Create;
 sl1:=TStringList.Create;
 if Pos(':',URI)=0 then URI:='http://'+URI;
 // decode
 StrReplace(URI,'+',' ',[rfReplaceAll]);
 if AnsiStartsStr('netmail:',URI) then begin
  ShowMessage('not implemented yet');
 end
 else if AnsiStartsStr('areafix:',URI) then begin
  ShowMessage('not implemented yet');
 end
 else if AnsiStartsStr('echomail:',URI) then begin
  ShowMessage('not implemented yet');
 end
 else if AnsiStartsStr('area://',URI) then begin
  Delete(URI,1,length('area://'));
//    ShowMessage(URI);
  StrTokenToStrings(URI,'?',sl);
  if sl.Count=0 then MainForm.AreaList.SetFocus
  else begin
   areaname:=StrLower(sl[0]);
   if areaname[length(areaname)]='/' then
    Delete(areaname,length(areaname),1);
   nm:=-1;
   for i:=0 to MainForm.AreaList.Items.Count-1 do
   if StrLower(MainForm.AreaList.Items[i].Caption)=areaname
    then begin
     nm:=i;
     break;
    end;
    if nm=-1 then begin
     ShowMessage(lang.areanotfound+': '+areaname);
     sl.Free;
     sl1.Free;
     Exit;
    end;

    if sl.count=1 then begin
     MainForm.AreaList.UnselectAll;
     kbd:=false;
     MainForm.AreaList.Selected:=MainForm.AreaList.Items[nm];
     MainForm.AreaList.ItemFocused:=MainForm.AreaList.Items[nm];
     MainForm.AreaListSelectItem(MainForm.AreaList,MainForm.AreaList.Items[nm],true);
    end;

    if sl.count=2 then begin
     params:=sl[1];
     sl.Clear;
     StrTokenToStrings(params,'&',sl);

     for i:=0 to sl.Count-1 do begin
      sl1.Clear;
      StrTokenToStrings(sl[i],'=',sl1);
      if sl1.count=0 then continue;
      if sl1.count=1 then continue; // здесь нет параметров без значений
      if (strlower(sl1[0])='msgid') or (strlower(sl1[0])='mid')
       then begin
       Area:=Config.Areas.FindEchoArea(areaname);
       msgn:=Area.GetMsg(sl1[1]);

       if msgn=0 then begin
        ShowMessage(lang.msgnotfound);
        sl.Free;
        sl1.free;
        Exit;
       end;

       MainForm.AreaList.UnselectAll;
       kbd:=false;
       MainForm.AreaList.Selected:=MainForm.AreaList.Items[nm];
       MainForm.AreaList.ItemFocused:=MainForm.AreaList.Items[nm];
       MainForm.AreaListSelectItem(MainForm.AreaList,MainForm.AreaList.Items[nm],true);

       vf:=TViewForm(MainForm.PageList.ActivePage.Components[0]);
       if vf=nil then continue;
       if vf.MsgList.Items.Count>0 then begin
       if msgn>0 then with vf do begin
         MsgList.UnselectAll;
         MsgList.Selected:=MsgList.Items[msgn-1];
         MsgList.ItemFocused:=MsgList.Selected;
         MsgList.Selected.MakeVisible(false);
        end;
       end;
      end;
     end; // for
    end; // if sl.count>1...
   end // if sl.count=0...
  end //area
 else if AnsiStartsStr('faqserv://',URI) then begin
  ShowMessage('not implemented yet');
 end
 else if AnsiStartsStr('fecho://',URI) then begin
  ShowMessage('not implemented yet');
 end
 else if AnsiStartsStr('freq://',URI) then begin
  ShowMessage('not implemented yet');
 end
 else ShellExecEx(URI);
 sl.Free;
 sl1.Free;
end;

end.
