unit SimpleXForm;

interface

uses Forms, ConfigType;

type TFormType = (ftView, ftEdit, ftFiles, ftPlugin);

type
  TSimpleXForm = class(TForm)
  public
    Area: TArea;
    FormType: TFormType;
end;

implementation

end.
 