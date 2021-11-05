unit Tree;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, JvExComCtrls, JvComCtrls, ConfigType, smapi, ImgList;

type
  TTreeForm = class(TForm)
    Tree: TJvTreeView;
    Glyphs: TImageList;
    procedure TreeKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure TreeDblClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure TreeCollapsing(Sender: TObject; Node: TTreeNode;
      var AllowCollapse: Boolean);
  private
    { Private declarations }
  public
    curmsg: longint;
    Area: TArea;
    { Public declarations }
  end;

var
  TreeForm: TTreeForm;

implementation

{$R *.dfm}

uses Main, Log, View, Language, Setup;

procedure TTreeForm.TreeKeyPress(Sender: TObject; var Key: Char);
begin
if Key=#27 then begin
 TreeForm.Close;
 MainForm.SetFocus;
end;
if key=#13 then TreeDblClick(Self);
end;

procedure TTreeForm.FormShow(Sender: TObject);
const MAXIDX=65535;
var z:longint;
    rootmsg: longint;
    root,sel:TTreeNode;
    sorted: boolean;
    numbers,indexes:array[0..MAXIDX] of longint;
    dnum,nm: longint;

 procedure swapnumandidx(i1,i2:longint);
 var t:longint;
 begin
 t:=numbers[i1];
 numbers[i1]:=numbers[i2];
 numbers[i2]:=t;
 t:=indexes[i1];
 indexes[i1]:=indexes[i2];
 indexes[i2]:=t;
 end;

 procedure AddCh(r: TTreeNode; n:longint);
 // r - узел дерева, n - номер сообщения ПО СЧЁТУ (НЕ UMsgID)
 var tn: TTreeNode;
     i: byte;
     z: longint;
    pm: PMsgHandle;
    xm: TXMSG;
    subj: string[80];

 function isRead(xm:TXMSG):boolean;
 begin
  result:=(xm.attr and MSGREAD)>0;
 end;

 function isLocal(xm:TXMSG):boolean;
 begin
  result:=(xm.attr and MSGLOCAL)>0;
 end;

 function isSent(xm:TXMSG):boolean;
 begin
  result:=(xm.attr and MSGSENT)>0;
 end;

 function isForMe(xm:TXMSG):boolean;
 begin
  result:=(SetupForm.Users.Items.IndexOf(xm._to)>=0)
 end;

 begin

  pm:=MsgOpenMsg(Area.msga,MOPEN_READ,n);
  if pm=nil then Exit;
  MsgReadMsg(pm,@xm,0,0,nil,0,nil);
  MsgCloseMsg(pm);

  subj:=OemToAnsiString(xm.subj);
  if length(subj)>20 then subj:=Copy(subj,1,20)+'...';

  tn:=TreeForm.Tree.Items.AddChild(r,IntToStr(n)+' '+
   OemToAnsiString(xm.from)+' "'+subj+'"');

  if (not isRead(xm)) and (not isLocal(xm)) then
   begin
    if isForMe(xm) then tn.StateIndex:=3 else tn.StateIndex:=2
   end
   else
   if (isLocal(xm)) and (not isSent(xm)) then tn.StateIndex:=4
   else tn.StateIndex:=0;

  if n=curmsg then sel:=tn;

  if Area.BaseType=btSquish then begin
   for i:=0 to MAX_REPLY-1 do begin
    z:=xm.replies[i];
    if z=0 then continue;
    z:=MsgUidToMsgn(Area.msga,z,UID_EXACT);
    if (z=0) or (z=n) or (z>Area.msga.num_msg) then continue;
    AddCh(tn,z);
   end
  end
  else if Area.BaseType=btJam then begin
   z:=xm.replies[0];
   if z>0 then begin
    z:=MsgUidToMsgn(Area.msga,z,UID_EXACT);
    if (z>0) and (z<>n) and (z<=Area.msga.num_msg)
     then AddCh(tn,z);
   end;
   z:=xm.replies[MAX_REPLY-1];
   if z>0 then begin
    z:=MsgUidToMsgn(Area.msga,z,UID_EXACT);
    if (z>0) and (z<>n) and (z<=Area.msga.num_msg)
     then AddCh(r,z);
   end;
  end;
 end;

var xm:TXMSG;
    pm:PMsgHandle;
begin
try
if not Area.Open then begin
 LogEvent('Unexpected messagebase error - unable to open '+Area.Path);
 TreeForm.Close;
 Exit;
end;

rootmsg:=curmsg;
pm:=MsgOpenMsg(Area.msga,MOPEN_READ,rootmsg);
if pm=nil then Exit;
MsgReadMsg(pm,@xm,0,0,nil,0,nil);
MsgCloseMsg(pm);

while xm.replyto>0 do begin
 rootmsg:=MsgUidToMsgn(Area.msga,xm.replyto,UID_EXACT);
 if rootmsg=0 then begin
  ShowMessage(lang.errnoroot);
  Exit;
 end;
 pm:=MsgOpenMsg(Area.msga,MOPEN_READ,rootmsg);
 if pm=nil then Exit;
 MsgReadMsg(pm,@xm,0,0,nil,0,nil);
 MsgCloseMsg(pm);
end;

root:=nil;
sel:=nil;
AddCh(root,rootmsg);

if SetupForm.TreeFullExpand.Checked then begin
 Tree.FullExpand;
 Tree.ShowButtons:=false;
end
else begin
 Tree.FullCollapse;
 if sel<>nil then begin
  if sel.AbsoluteIndex<>0 then sel.Parent.Expand(false);
  sel.Expand(true);
 end;
 Tree.ShowButtons:=true;
end;

Tree.Select(sel);

if sel<>nil then begin
 if sel.Parent<>nil then sel.Parent.MakeVisible;
 sel.MakeVisible;
end; 

except
 on E: Exception do LogEvent('TTreeForm.FormShow encountered an exception: '+E.Message);
end;
end;

procedure TTreeForm.TreeDblClick(Sender: TObject);
var nm:longint;
    vf:TViewForm;
begin
if (Pos(' ',Tree.Selected.Text)=0) or (Tree.Selected.Text[1]='(') then Exit;
nm:=strtoint(Copy(Tree.Selected.Text,1,Pos(' ',Tree.Selected.Text)-1))-1;
vf:=MainForm.PageList.ActivePage.Components[0] as TViewForm;
if vf<>nil then begin
 vf.MsgList.Selected:=vf.MsgList.Items.Item[nm];
 vf.MsgList.Selected.MakeVisible(false);
 if vf.MsgList.ItemIndex<vf.MsgList.Items.Count-1 then
  vf.MsgList.Items[vf.MsgList.Selected.Index+1].MakeVisible(false);
 TreeForm.Close;
 vf.Timer1.Enabled:=true;
end;
end;

procedure TTreeForm.FormCreate(Sender: TObject);
begin
Caption:=lang.ltree;
end;

procedure TTreeForm.TreeCollapsing(Sender: TObject; Node: TTreeNode;
  var AllowCollapse: Boolean);
begin
if SetupForm.TreeFullExpand.Checked then
 AllowCollapse:=false;
end;

end.
