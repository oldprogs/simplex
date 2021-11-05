unit Language;

interface

type
  TLang = class
  lzone,lregion,lnet,lnode,lpoint: string;
  ndlerropen: string;
  ndlnotcompiled: string;
  extoomany, exlogname: string;
  editnotyours,editalreadysent:string;
  editclosetab: string;
  confirmation: string;
  msgdelete,msgdeleteunsent: string;
  errnonetmail: string;
  noinfo,llocation,lphone,lflags:string;
  lnodelist:string;
  ltree:string;
  notree:string;
  treedel:string;
  aAreatag, aPath, aBaseType, aAreaType,
  aFromAddr, aFromName, aAction, aNew, aOverride: string;
  alreadydef: string;
  noaction, noareatag, nopath, nobasetype,
  noareatype: string;
  conflict: string;
  areanotfound: string;
  msgnotfound: string;
  delarea: string;
  noaddr: string;
  selcontact: string;
  fillstring: string;
  erremptyareaname: string;
  errareaparams: string;
  errmsgopen: string;
  errbaseopen: string;
  nomsgs: string;
  needuseraddr: string;
  errarealocked: string;
  errnoroot: string;

  lMERR_NONE: string; // No error
  lMERR_BADH: string; // Invalid handle passed to function
  lMERR_BADF: string; // Invalid or corrupted file
  lMERR_NOMEM: string; // Not enough memory for specified operation
  lMERR_NODS: string; // Maybe not enough disk space for operation
  lMERR_NOENT: string; // File/message does not exist
  lMERR_BADA: string; // Bad argument passed to msgapi function
  lMERR_EOPEN: string; // Couldn't close - messages still open
  function GetError: string;
end;

var lang:TLang;

implementation

uses Setup, smapi;

function TLang.GetError;
begin
 case MsgGetMsgApiErr of
  MERR_NONE: result:= lMERR_NONE;
  MERR_BADH: result:= lMERR_BADH;
  MERR_BADF: result:= lMERR_BADF;
  MERR_NOMEM: result:= lMERR_NOMEM;
  MERR_NODS: result:= lMERR_NODS;
  MERR_NOENT: result:= lMERR_NOENT;
  MERR_BADA: result:= lMERR_BADA;
  MERR_EOPEN: result:= lMERR_EOPEN;
 end;
end;

begin
lang:=TLang.Create;
lang.lzone:='����';
lang.lregion:='������';
lang.lnet:='����';
lang.lnode:='����';
lang.lpoint:='�����';
lang.ndlerropen:='������ �������� ��������';
lang.ndlnotcompiled:='������� �� ������������� - ��������� ���������';
lang.extoomany:='���������� ������������ ������.'+#13+'����������, ������������� ���������� � ��������������� ������ � ��������� ��������';
lang.exlogname:='���������� ���������� ��������� � �����';
lang.editnotyours:='��� ��������� �� �� ���. �� �� ������ ������������� ���.'+#13+
 '��� ����������� ��������� �������������� �������� "�����"';
lang.editalreadysent:='��� ��������� ��� ���������� ��� ������������ � ��������.'+#13+
 '�� ������������� ������ ��������������� ���?';
lang.editclosetab:='������������ �������������� ���������.'+#13+'�������� ������� ������� � ��� ������!'+#13+'������� �������?';
lang.confirmation:='�������������';
lang.msgdelete:='������� ��� ���������?';
lang.msgdeleteunsent:='��� ��������� ��� �� ����������!'+#13+'������� ��� ���������, ����������� �� ��������?';
lang.errnonetmail:='�� ������� NETMAIL-������� �� ���������.'+#13+'��������� ��������� (������� �������).';
lang.noinfo:='��� ����������';
lang.llocation:='��������������';
lang.lphone:='�������';
lang.lflags:='�����';
lang.lnodelist:='�������';
lang.ltree:='������ �������';
lang.notree:='������ ����������';
lang.treedel:='�������� ���������';

lang.aAreatag:='��� �������';
lang.aPath:='���� � ����';
lang.aBaseType:='��� ����';
lang.aAreaType:='��� �������';
lang.aFromAddr:='����� �����������';
lang.aFromName:='��� �����������';
lang.aAction:='��������';
lang.aNew:='������� ����� �������';
lang.aOverride:='�������������� �������� �������';
lang.alreadydef:='������� � ����� ������ ��� ����������';
lang.noareatag:='������� ��� �������';
lang.noaction:='�������� ��������� �������� (�������� ������� ��� �������������� ������������)';
lang.nopath:='������� ���� � ����';
lang.nobasetype:='�������� ��� �������� ����';
lang.noareatype:='�������� ��� �������';

lang.conflict:='������������� �������� ��������� ��������. ��������� ������������.';
lang.areanotfound:='������� �� �������';
lang.delarea:='������� ��� �������?';
lang.noaddr:='���������� FTN-����� ��������';
lang.selcontact:='�������� ������� �� ������';
lang.fillstring:='����������, ������� ������';
lang.erremptyareaname:='���������� �������� ������� � ������ ������';
lang.errareaparams:='���������� �������� ������� � ������ �����������';
lang.errbaseopen:='*** ������ �������� ���� ��������� ***';
lang.errmsgopen:='*** ������ �������� ��������� ***';
lang.nomsgs:='*** ��������� ��� ***';
lang.needuseraddr:='���������� ������ ���� �� ���� ��� ������������ � ���� �����';
lang.errarealocked:='*** ������� ������������� ***';
lang.errnoroot:='���������� ����� ������ ��������� � �����'+#13+'���������� ������������� ����';
lang.msgnotfound:='��������� �� �������';

lang.lMERR_NONE:='OK';
lang.lMERR_BADH:='�������� ����������';
lang.lMERR_BADF:='���� ��������';
lang.lMERR_NOMEM:='������������ ������';
lang.lMERR_NODS:='������������ ��������� ������������';
lang.lMERR_NOENT:='���� ��� ��������� �� ����������';
lang.lMERR_BADA:='�������� ��������';
lang.lMERR_EOPEN:='�������� �������� ���������';
end.

