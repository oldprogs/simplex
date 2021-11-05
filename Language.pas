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
lang.lzone:='Зона';
lang.lregion:='Регион';
lang.lnet:='Сеть';
lang.lnode:='Нода';
lang.lpoint:='Поинт';
lang.ndlerropen:='Ошибка открытия нодлиста';
lang.ndlnotcompiled:='Нодлист не скомпилирован - проверьте настройки';
lang.extoomany:='Обнаружена неустранимая ошибка.'+#13+'Пожалуйста, перезапустите приложение и проинформируйте автора с описанием проблемы';
lang.exlogname:='Отладочная информация сохранена в файле';
lang.editnotyours:='Это сообщение не от Вас. Вы не можете редактировать его.'+#13+
 'Для продолжения дискуссии воспользуйтесь функцией "Ответ"';
lang.editalreadysent:='Это сообщение уже отправлено или подготовлено к отправке.'+#13+
 'Вы действительно хотите отредактировать его?';
lang.editclosetab:='Производится редактирование сообщения.'+#13+'Закрытие вкладки приведёт к его потере!'+#13+'Закрыть вкладку?';
lang.confirmation:='Подтверждение';
lang.msgdelete:='Удалить это сообщение?';
lang.msgdeleteunsent:='Это сообщение ещё не отправлено!'+#13+'Удалить это сообщение, отказавшись от отправки?';
lang.errnonetmail:='Не выбрана NETMAIL-область по умолчанию.'+#13+'Проверьте настройки (вкладка Области).';
lang.noinfo:='Нет информации';
lang.llocation:='Местоположение';
lang.lphone:='Телефон';
lang.lflags:='Флаги';
lang.lnodelist:='Нодлист';
lang.ltree:='Дерево ответов';
lang.notree:='Дерево недоступно';
lang.treedel:='удалённое сообщение';

lang.aAreatag:='Имя области';
lang.aPath:='Путь к базе';
lang.aBaseType:='Тип базы';
lang.aAreaType:='Тип области';
lang.aFromAddr:='Адрес отправителя';
lang.aFromName:='Имя отправителя';
lang.aAction:='Действие';
lang.aNew:='Описать новую область';
lang.aOverride:='Переопределить описание тоссера';
lang.alreadydef:='Область с таким именем уже определена';
lang.noareatag:='Укажите имя области';
lang.noaction:='Выберите требуемое действие (добавить область или переопределить существующую)';
lang.nopath:='Укажите путь к базе';
lang.nobasetype:='Выберите тип почтовой базы';
lang.noareatype:='Выберите тип области';

lang.conflict:='Повторяющиеся описания следующих областей. Проверьте конфигурацию.';
lang.areanotfound:='Область не найдена';
lang.delarea:='Удалить эту область?';
lang.noaddr:='Недоступен FTN-адрес контакта';
lang.selcontact:='Выберите контакт из списка';
lang.fillstring:='Пожалуйста, введите данные';
lang.erremptyareaname:='Невозможно добавить область с пустым именем';
lang.errareaparams:='Невозможно добавить область с такими параметрами';
lang.errbaseopen:='*** Ошибка открытия базы сообщений ***';
lang.errmsgopen:='*** Ошибка открытия сообщения ***';
lang.nomsgs:='*** Сообщений нет ***';
lang.needuseraddr:='Необходимо ввести хотя бы одно имя пользователя и один адрес';
lang.errarealocked:='*** Область заблокирована ***';
lang.errnoroot:='Невозможно найти первое сообщение в треде'+#13+'Попробуйте перелинковать базу';
lang.msgnotfound:='Сообщение не найдено';

lang.lMERR_NONE:='OK';
lang.lMERR_BADH:='Неверный дескриптор';
lang.lMERR_BADF:='Файл повреждён';
lang.lMERR_NOMEM:='Недостаточно памяти';
lang.lMERR_NODS:='Недостаточно дискового пространства';
lang.lMERR_NOENT:='Файл или сообщение не существует';
lang.lMERR_BADA:='Неверный аргумент';
lang.lMERR_EOPEN:='Остались открытые сообщения';
end.

