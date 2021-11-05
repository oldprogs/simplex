object SelectDestArea: TSelectDestArea
  Left = 278
  Top = 195
  BorderStyle = bsDialog
  Caption = #1042#1099#1073#1077#1088#1080#1090#1077' '#1086#1073#1083#1072#1089#1090#1100
  ClientHeight = 262
  ClientWidth = 250
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object DestAreas: TJvListBox
    Left = 0
    Top = 0
    Width = 250
    Height = 216
    Align = alClient
    ItemHeight = 13
    Background.FillMode = bfmTile
    Background.Visible = False
    TabOrder = 0
    OnClick = DestAreasClick
    OnDblClick = DestAreasDblClick
    OnKeyDown = DestAreasKeyDown
    OnKeyPress = DestAreasKeyPress
  end
  object JvFooter1: TJvFooter
    Left = 0
    Top = 216
    Width = 250
    Height = 46
    Align = alBottom
    object OKButton: TJvXPButton
      Left = 41
      Top = 14
      Caption = 'OK'
      Enabled = False
      TabOrder = 0
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      OnClick = OKButtonClick
    end
    object CancelButton: TJvXPButton
      Left = 137
      Top = 14
      Caption = #1054#1090#1084#1077#1085#1072
      TabOrder = 1
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      OnClick = CancelButtonClick
    end
  end
end
