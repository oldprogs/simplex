object AreaForm: TAreaForm
  Left = 122
  Top = 48
  Width = 417
  Height = 377
  Caption = #1054#1087#1080#1089#1072#1085#1080#1077' '#1086#1073#1083#1072#1089#1090#1080
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object OKButton: TJvXPButton
    Left = 119
    Top = 302
    Caption = 'OK'
    TabOrder = 8
    OnClick = OKButtonClick
  end
  object CancelButton: TJvXPButton
    Left = 215
    Top = 302
    Caption = #1054#1090#1084#1077#1085#1072
    TabOrder = 9
    OnClick = CancelButtonClick
  end
  object Areatag: TJvEdit
    Left = 128
    Top = 24
    Width = 257
    Height = 21
    Modified = False
    TabOrder = 0
  end
  object LAreatag: TJvStaticText
    Left = 20
    Top = 28
    Width = 70
    Height = 17
    Caption = #1048#1084#1103' '#1086#1073#1083#1072#1089#1090#1080
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    HotTrackFont.Charset = RUSSIAN_CHARSET
    HotTrackFont.Color = clWindowText
    HotTrackFont.Height = -11
    HotTrackFont.Name = 'MS Sans Serif'
    HotTrackFont.Style = []
    Layout = tlTop
    ParentFont = False
    TabOrder = 10
    TextMargins.X = 0
    TextMargins.Y = 0
    WordWrap = False
  end
  object JvStaticText1: TJvStaticText
    Left = 20
    Top = 72
    Width = 54
    Height = 17
    Caption = #1044#1077#1081#1089#1090#1074#1080#1077
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    HotTrackFont.Charset = RUSSIAN_CHARSET
    HotTrackFont.Color = clWindowText
    HotTrackFont.Height = -11
    HotTrackFont.Name = 'MS Sans Serif'
    HotTrackFont.Style = []
    Layout = tlTop
    ParentFont = False
    TabOrder = 11
    TextMargins.X = 0
    TextMargins.Y = 0
    WordWrap = False
  end
  object defNew: TJvRadioButton
    Left = 128
    Top = 64
    Width = 140
    Height = 17
    Alignment = taLeftJustify
    Caption = #1086#1087#1080#1089#1072#1090#1100' '#1085#1086#1074#1091#1102' '#1086#1073#1083#1072#1089#1090#1100
    TabOrder = 1
    HotTrackFont.Charset = DEFAULT_CHARSET
    HotTrackFont.Color = clWindowText
    HotTrackFont.Height = -11
    HotTrackFont.Name = 'MS Sans Serif'
    HotTrackFont.Style = []
    LinkedControls = <>
  end
  object defOverride: TJvRadioButton
    Left = 128
    Top = 84
    Width = 260
    Height = 17
    Alignment = taLeftJustify
    Caption = #1087#1077#1088#1077#1086#1087#1088#1077#1076#1077#1083#1080#1090#1100' '#1086#1087#1080#1089#1072#1085#1080#1077' '#1080#1079' '#1082#1086#1085#1092#1080#1075#1072' '#1090#1086#1089#1089#1077#1088#1072
    TabOrder = 2
    HotTrackFont.Charset = DEFAULT_CHARSET
    HotTrackFont.Color = clWindowText
    HotTrackFont.Height = -11
    HotTrackFont.Name = 'MS Sans Serif'
    HotTrackFont.Style = []
    LinkedControls = <>
  end
  object Path: TJvEdit
    Left = 128
    Top = 120
    Width = 257
    Height = 21
    Modified = False
    TabOrder = 3
  end
  object JvStaticText2: TJvStaticText
    Left = 20
    Top = 124
    Width = 64
    Height = 17
    Caption = #1055#1091#1090#1100' '#1082' '#1073#1072#1079#1077
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    HotTrackFont.Charset = RUSSIAN_CHARSET
    HotTrackFont.Color = clWindowText
    HotTrackFont.Height = -11
    HotTrackFont.Name = 'MS Sans Serif'
    HotTrackFont.Style = []
    Layout = tlTop
    ParentFont = False
    TabOrder = 12
    TextMargins.X = 0
    TextMargins.Y = 0
    WordWrap = False
  end
  object BaseType: TJvComboBox
    Left = 128
    Top = 152
    Width = 257
    Height = 21
    Style = csDropDownList
    ItemHeight = 13
    ItemIndex = 0
    TabOrder = 4
    Text = #1085#1077' '#1086#1087#1088#1077#1076#1077#1083#1077#1085#1086
    Items.Strings = (
      #1085#1077' '#1086#1087#1088#1077#1076#1077#1083#1077#1085#1086
      'Jam'
      'Squish'
      'Fido/Msg')
  end
  object JvStaticText3: TJvStaticText
    Left = 20
    Top = 156
    Width = 52
    Height = 17
    Caption = #1058#1080#1087' '#1073#1072#1079#1099
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    HotTrackFont.Charset = RUSSIAN_CHARSET
    HotTrackFont.Color = clWindowText
    HotTrackFont.Height = -11
    HotTrackFont.Name = 'MS Sans Serif'
    HotTrackFont.Style = []
    Layout = tlTop
    ParentFont = False
    TabOrder = 13
    TextMargins.X = 0
    TextMargins.Y = 0
    WordWrap = False
  end
  object JvStaticText4: TJvStaticText
    Left = 20
    Top = 188
    Width = 67
    Height = 17
    Caption = #1058#1080#1087' '#1086#1073#1083#1072#1089#1090#1080
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    HotTrackFont.Charset = RUSSIAN_CHARSET
    HotTrackFont.Color = clWindowText
    HotTrackFont.Height = -11
    HotTrackFont.Name = 'MS Sans Serif'
    HotTrackFont.Style = []
    Layout = tlTop
    ParentFont = False
    TabOrder = 14
    TextMargins.X = 0
    TextMargins.Y = 0
    WordWrap = False
  end
  object AreaType: TJvComboBox
    Left = 128
    Top = 184
    Width = 257
    Height = 21
    Style = csDropDownList
    ItemHeight = 13
    ItemIndex = 0
    TabOrder = 5
    Text = #1085#1077' '#1086#1087#1088#1077#1076#1077#1083#1077#1085#1086
    Items.Strings = (
      #1085#1077' '#1086#1087#1088#1077#1076#1077#1083#1077#1085#1086
      #1069#1093#1086'-'#1086#1073#1083#1072#1089#1090#1100
      #1053#1077#1090#1084#1077#1081#1083'-'#1086#1073#1083#1072#1089#1090#1100
      #1051#1086#1082#1072#1083#1100#1085#1072#1103' '#1086#1073#1083#1072#1089#1090#1100)
  end
  object JvStaticText5: TJvStaticText
    Left = 20
    Top = 220
    Width = 102
    Height = 17
    Caption = #1040#1076#1088#1077#1089' '#1086#1090#1087#1088#1072#1074#1080#1090#1077#1083#1103
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    HotTrackFont.Charset = RUSSIAN_CHARSET
    HotTrackFont.Color = clWindowText
    HotTrackFont.Height = -11
    HotTrackFont.Name = 'MS Sans Serif'
    HotTrackFont.Style = []
    Layout = tlTop
    ParentFont = False
    TabOrder = 15
    TextMargins.X = 0
    TextMargins.Y = 0
    WordWrap = False
  end
  object FromAddr: TJvComboBox
    Left = 128
    Top = 216
    Width = 257
    Height = 21
    ItemHeight = 13
    TabOrder = 6
  end
  object JvStaticText6: TJvStaticText
    Left = 20
    Top = 252
    Width = 93
    Height = 17
    Caption = #1048#1084#1103' '#1086#1090#1087#1088#1072#1074#1080#1090#1077#1083#1103
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    HotTrackFont.Charset = RUSSIAN_CHARSET
    HotTrackFont.Color = clWindowText
    HotTrackFont.Height = -11
    HotTrackFont.Name = 'MS Sans Serif'
    HotTrackFont.Style = []
    Layout = tlTop
    ParentFont = False
    TabOrder = 16
    TextMargins.X = 0
    TextMargins.Y = 0
    WordWrap = False
  end
  object FromName: TJvComboBox
    Left = 128
    Top = 248
    Width = 257
    Height = 21
    ItemHeight = 13
    TabOrder = 7
  end
end
