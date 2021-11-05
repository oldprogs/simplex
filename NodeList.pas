unit NodeList;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, JvExStdCtrls, JvListBox, JvExControls, JvComponent,
  JvSpecialProgress, ExtCtrls, JvExExtCtrls, JvPanel, ComCtrls,
  JvExComCtrls, JvComCtrls, JvLabel, Main, JvStaticText, JvEdit;

type PNodelist = ^RNodelist;
 RNodelist = record
 data: TNodelistRec;
 next: PNodelist;
end;

var LnkNodelist,EndNodelist: PNodelist;

procedure NdlClear;
procedure NdlAdd(entry: TNodelistRec);
function NdlFindAddr(zone,net,node:word;point:word=0):PNodelist;
function NdlInsert(entry:TNodelistRec;after:PNodelist):PNodelist;

type
  TNodelistForm = class(TForm)
    JvPanel1: TJvPanel;
    JvPanel2: TJvPanel;
    Tree: TJvTreeView;
    NdlInfo: TJvLabel;
    NdlAInfo: TJvLabel;
    ESearch: TJvEdit;
    LSearch: TJvStaticText;
    procedure FormCreate(Sender: TObject);
    procedure TreeChange(Sender: TObject; Node: TTreeNode);
    procedure ESearchChange(Sender: TObject);
    procedure TreeKeyPress(Sender: TObject; var Key: Char);
    procedure ESearchKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  NodelistForm: TNodelistForm;

implementation

{$R *.dfm}

uses StrUtils,JclStrings, Language, MkGlobT, Setup;

procedure NdlClear;
 var t: PNodelist;
 begin
 while LnkNodelist<>nil do begin
  t:=LnkNodelist.next;
  Dispose(LnkNodelist);
    LnkNodelist:=t;
 end;
 EndNodelist:=nil;
 end;

 procedure NdlAdd(entry: TNodelistRec);
 var t,t1:PNodelist;
 begin
 t:=EndNodelist;
 System.New(t1);
 if t<>nil then t.next:=t1 else LnkNodelist:=t1;
 t1.data:=entry;
 t1.next:=nil;
 EndNodelist:=t1;
 end;

 function NdlFindAddr(zone,net,node:word;point:word=0):PNodelist;
 var t:PNodelist;
 begin
 Result:=nil;
 t:=LnkNodelist;

 if t<>nil then repeat
  if (t.data.zone=zone) and (t.data.net=net) and (t.data.node=node)
   and (t.data.point=point)
  then begin
   Result:=t;
   break;
  end;
  t:=t.next;
 until t=nil
 end;

 function NdlInsert(entry:TNodelistRec;after:PNodelist):PNodelist;
 var t,t1:PNodelist;
 begin
 Result:=nil;
 if after=nil then Exit;
 t:=after;
 System.New(t1);
 t1.data:=entry;
 t1.next:=t.next;
 t.next:=t1;
 Result:=t1;
 end;

procedure TNodelistForm.FormCreate(Sender: TObject);
var PrevRec:TNodelistRec;
    czone,cregion,cnet,cnode: TTreeNode;
    s:string;
    worknodelistbin: file of TNodelistRec;
    t:PNodelist;
begin
Caption:=lang.lnodelist;
NdlClear;
if not FileExists(ExtractFilePath(Application.ExeName)+'nodelist.bin') then Exit;
AssignFile(worknodelistbin,ExtractFilePath(Application.ExeName)+'nodelist.bin');
Reset(worknodelistbin);
if not eof(worknodelistbin) then repeat
 Read(worknodelistbin,NdlRec);
 NdlAdd(NdlRec);
until eof(worknodelistbin);
closefile(worknodelistbin);

t:=LnkNodelist;
Tree.Items.Clear;
if not FileExists(ExtractFilePath(Application.ExeName)+'nodelist.bin') then Exit;
PrevRec.zone:=0;
if t<>nil then repeat
 NdlRec:=t.data;
 if length(NdlRec.prefix)=0 then s:='' else s:=NdlRec.prefix+', ';
 s:=s+inttostr(NdlRec.zone)+':'+inttostr(NdlRec.net)+'/'+inttostr(NdlRec.node);
 if NdlRec.point>0 then s:=s+'.'+inttostr(NdlRec.Point);
 s:=s+', '+NdlRec.system+', '+ndlRec.sysop;
 if PrevRec.zone<>NdlRec.zone then begin
  czone:=Tree.Items.AddChildObject(nil,s,t);
  cregion:=czone;
  cnet:=cregion;
  cnode:=cnet;
 end
 else begin
  if NdlRec.Point>0 then NdlRec.region:=PrevRec.region;
  if PrevRec.region<>NdlRec.region then begin
   cregion:=Tree.Items.AddChildObject(czone,s,t);
   cnet:=cregion;
   cnode:=cnet;
  end
  else begin
   if PrevRec.net<>NdlRec.net then begin
    cnet:=Tree.Items.AddChildObject(cregion,s,t);
    cnode:=cnet;
  end
  else begin
   if PrevRec.node<>NdlRec.node then begin
     cnode:=Tree.Items.AddChildObject(cnet,s,t);
    end
   else Tree.Items.AddChildObject(cnode,s,t);
  end;
 end;
end;
PrevRec:=NdlRec;
t:=t.next;
until t=nil;
end;

procedure TNodelistForm.TreeChange(Sender: TObject; Node: TTreeNode);
var s:string;
   at:AddrType;
    t:PNodelist;
begin
if Tree.Selected=nil then Exit;
s:=Tree.Selected.Text;
if pos(':',s)<pos(',',s) then
 s:=copy(s,1,pos(',',s)-1)
 else begin
  s:=copy(s,pos(',',s)+2,length(s)-pos(',',s)-1);
  s:=copy(s,1,pos(',',s)-1);
 end;
 NdlInfo.Caption:=s+', ';
 NdlAInfo.Caption:='';
 ParseAddr(s,at,at);
 t:=LnkNodelist;
 repeat
  NdlRec:=t.data;
  if (NdlRec.zone=at.zone) and (NdlRec.net=at.net) and (NdlRec.node=at.node)
   and (NdlRec.point=at.point) then break;
  t:=t.next;
 until t=nil;

 if (NdlRec.zone=at.zone) and (NdlRec.net=at.net) and (NdlRec.node=at.node)
 and (NdlRec.point=at.point)
 then begin
  NdlInfo.Caption:=NdlInfo.Caption+NdlRec.system+', '+NdlRec.sysop;
  if NdlRec.Prefix<>'' then NdlInfo.Caption:=NdlInfo.Caption+' <'+NdlRec.prefix+'>';
  NdlAInfo.Caption:=lang.llocation+': '+NdlRec.location+#13+lang.lphone+': '+NdlRec.phone+
   #13+lang.lflags+': '+NdlRec.flags;
 end
 else begin
  NdlInfo.Caption:=NdlInfo.Caption+lang.noinfo;
 end;
end;

procedure TNodelistForm.ESearchChange(Sender: TObject);
var at:AddrType;
    t:PNodelist;
    i:longint;
    found:boolean;
begin
found:=false;
if (Pos(':',ESearch.Text)>0) then
 if (Pos('/',ESearch.Text)>Pos(':',ESearch.Text)) then begin
 ParseAddr(ESearch.Text,at,at);
 t:=NdlFindAddr(at.Zone,at.Net,at.Node,at.Point);
 if t<>nil then for i:=0 to Tree.Items.Count-1
  do if Tree.Items[i].Data=t then begin
  Tree.Items[i].Focused:=true;
  Tree.Items[i].Selected:=true;
  if NodeListForm.Visible then Tree.SetFocus;
  found:=true;
  break;
 end;
 if (not found) and (at.Point>0) then begin
  t:=NdlFindAddr(at.Zone,at.Net,at.Node,0);
  if t<>nil then for i:=0 to Tree.Items.Count-1
   do if Tree.Items[i].Data=t
    then begin
    Tree.Items[i].Focused:=true;
    Tree.Items[i].Selected:=true;
    if NodeListForm.Visible then Tree.SetFocus;
    found:=true;
    break;
   end;
  end;
 end;
end;

procedure TNodelistForm.TreeKeyPress(Sender: TObject; var Key: Char);
begin
if key=#27 then begin
  NodelistForm.Close;
  key:=#0;
 end
 else begin
  if (ord(key)>=32) and (key<>'-') and (key<>'+') then begin
   ESearch.Text:=ESearch.Text+key;
   ESearch.SetFocus;
   SendMessage(ESearch.Handle,WM_KEYDOWN,VK_END,0);
  end;
  if key=#8 then begin
   ESearch.Text:=Copy(ESearch.Text,1,length(ESearch.Text)-1);
   ESearch.SetFocus;
   SendMessage(ESearch.Handle,WM_KEYDOWN,VK_END,0);
  end;
 end;
end;

procedure TNodelistForm.ESearchKeyPress(Sender: TObject; var Key: Char);
begin
if key=#27 then begin
 NodelistForm.Close;
 key:=#0;
end;
if key='+' then Tree.SetFocus;
end;

end.
