object Prompt: TPrompt
  Left = 385
  Top = 218
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  Caption = #1042#1074#1086#1076' '#1076#1072#1085#1085#1099#1093
  ClientHeight = 122
  ClientWidth = 307
  Color = clBtnFace
  Font.Charset = RUSSIAN_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Lbl: TJvLabel
    Left = 24
    Top = 16
    Width = 16
    Height = 13
    Caption = 'Lbl'
    HotTrackFont.Charset = RUSSIAN_CHARSET
    HotTrackFont.Color = clWindowText
    HotTrackFont.Height = -11
    HotTrackFont.Name = 'MS Sans Serif'
    HotTrackFont.Style = []
  end
  object OKButton: TJvXPButton
    Left = 79
    Top = 86
    Caption = 'OK'
    TabOrder = 0
    OnClick = OKButtonClick
  end
  object CancelButton: TJvXPButton
    Left = 167
    Top = 86
    Caption = #1054#1090#1084#1077#1085#1072
    TabOrder = 1
    OnClick = CancelButtonClick
  end
  object Edit: TJvEdit
    Left = 24
    Top = 40
    Width = 257
    Height = 21
    Modified = False
    TabOrder = 2
    OnKeyPress = EditKeyPress
  end
  object AreasCB: TJvComboBox
    Left = 24
    Top = 40
    Width = 257
    Height = 21
    ItemHeight = 13
    TabOrder = 3
    Visible = False
    OnChange = AreasCBChange
    OnKeyPress = AreasCBKeyPress
  end
end
