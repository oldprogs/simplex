object ThemeForm: TThemeForm
  Left = 272
  Top = 142
  BorderStyle = bsDialog
  Caption = #1056#1077#1076#1072#1082#1090#1086#1088' '#1090#1077#1084
  ClientHeight = 537
  ClientWidth = 669
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object JvGroupHeader1: TJvGroupHeader
    Left = 8
    Top = 72
    Width = 657
    Height = 17
    Caption = #1058#1077#1084#1099' '#1086#1092#1086#1088#1084#1083#1077#1085#1080#1103
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object JvGroupHeader2: TJvGroupHeader
    Left = 12
    Top = 384
    Width = 657
    Height = 17
    Caption = #1054#1087#1094#1080#1080
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object TextFont: TJvFontComboBox
    Left = 264
    Top = 32
    Width = 233
    Height = 22
    DroppedDownWidth = 233
    MaxMRUCount = 0
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ItemIndex = -1
    Options = [foAnsiOnly, foNoOEMFonts, foPreviewFont]
    ParentFont = False
    Sorted = False
    TabOrder = 0
    OnChange = TextFontChange
  end
  object JvStaticText9: TJvStaticText
    Left = 136
    Top = 36
    Width = 113
    Height = 17
    Alignment = taCenter
    AutoSize = False
    Caption = #1064#1088#1080#1092#1090' '#1087#1086' '#1091#1084#1086#1083#1095#1072#1085#1080#1102':'
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
    TabOrder = 1
    TextMargins.X = 0
    TextMargins.Y = 0
    WordWrap = False
  end
  object TextFontSize: TJvSpinEdit
    Left = 504
    Top = 32
    Width = 49
    Height = 21
    MaxValue = 18.000000000000000000
    MinValue = 8.000000000000000000
    Value = 12.000000000000000000
    TabOrder = 2
    OnChange = TextFontSizeChange
  end
  object TextColors: TJvComboBox
    Left = 88
    Top = 112
    Width = 201
    Height = 21
    Style = csDropDownList
    ItemHeight = 13
    ItemIndex = 0
    TabOrder = 3
    Text = #1054#1073#1099#1095#1085#1099#1081' '#1090#1077#1082#1089#1090
    OnChange = TextColorsChange
    Items.Strings = (
      #1054#1073#1099#1095#1085#1099#1081' '#1090#1077#1082#1089#1090
      #1062#1080#1090#1072#1090#1072' 1'
      #1062#1080#1090#1072#1090#1072' 2'
      #1062#1080#1090#1072#1090#1072' 3'
      #1062#1080#1090#1072#1090#1072' 4'
      #1058#1072#1075#1083#1072#1081#1085'/'#1090#1080#1088#1083#1072#1081#1085'/'#1086#1088#1080#1076#1078#1080#1085
      'reserved'
      'reserved'
      #1050#1083#1091#1076#1078#1080
      #1057#1089#1099#1083#1082#1080' ('#1092#1086#1085')'
      '_'#1062#1074#1077#1090'_'
      '*'#1062#1074#1077#1090'*'
      '/'#1062#1074#1077#1090'/'
      '_/'#1062#1074#1077#1090'/_'
      '_*'#1062#1074#1077#1090'*_'
      '*/'#1062#1074#1077#1090'/*'
      '_*/'#1062#1074#1077#1090'/*_')
  end
  object JvStaticText8: TJvStaticText
    Left = 128
    Top = 92
    Width = 113
    Height = 17
    Alignment = taCenter
    AutoSize = False
    Caption = #1058#1077#1082#1089#1090' '#1089#1086#1086#1073#1097#1077#1085#1080#1103':'
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
    TabOrder = 4
    TextMargins.X = 0
    TextMargins.Y = 0
    WordWrap = False
  end
  object Bold: TJvCheckBox
    Left = 64
    Top = 152
    Width = 97
    Height = 17
    Caption = #1055#1086#1083#1091#1078#1080#1088#1085#1099#1081
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 5
    OnClick = BoldClick
    LinkedControls = <>
    HotTrackFont.Charset = RUSSIAN_CHARSET
    HotTrackFont.Color = clWindowText
    HotTrackFont.Height = -11
    HotTrackFont.Name = 'MS Sans Serif'
    HotTrackFont.Style = [fsBold]
  end
  object Italic: TJvCheckBox
    Left = 168
    Top = 152
    Width = 63
    Height = 17
    Caption = #1050#1091#1088#1089#1080#1074
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsItalic]
    ParentFont = False
    TabOrder = 6
    OnClick = ItalicClick
    LinkedControls = <>
    HotTrackFont.Charset = RUSSIAN_CHARSET
    HotTrackFont.Color = clWindowText
    HotTrackFont.Height = -11
    HotTrackFont.Name = 'MS Sans Serif'
    HotTrackFont.Style = [fsItalic]
  end
  object Underlined: TJvCheckBox
    Left = 240
    Top = 152
    Width = 94
    Height = 17
    Caption = #1055#1086#1076#1095#1105#1088#1082#1085#1091#1090#1099#1081
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsUnderline]
    ParentFont = False
    TabOrder = 7
    OnClick = UnderlinedClick
    LinkedControls = <>
    HotTrackFont.Charset = RUSSIAN_CHARSET
    HotTrackFont.Color = clWindowText
    HotTrackFont.Height = -11
    HotTrackFont.Name = 'MS Sans Serif'
    HotTrackFont.Style = []
  end
  object IfaceColors: TJvComboBox
    Left = 384
    Top = 112
    Width = 201
    Height = 21
    Style = csDropDownList
    ItemHeight = 13
    TabOrder = 8
    OnChange = IfaceColorsChange
    Items.Strings = (
      #1057#1087#1080#1089#1082#1080': '#1090#1077#1082#1089#1090
      #1057#1087#1080#1089#1082#1080': '#1092#1086#1085'1'
      #1057#1087#1080#1089#1082#1080': '#1092#1086#1085'2'
      #1057#1087#1080#1089#1082#1080': '#1090#1077#1082#1091#1097#1080#1081' '#1101#1083#1077#1084#1077#1085#1090' - '#1090#1077#1082#1089#1090
      #1057#1087#1080#1089#1082#1080': '#1090#1077#1082#1091#1097#1080#1081' '#1101#1083#1077#1084#1077#1085#1090' - '#1092#1086#1085
      #1057#1087#1080#1089#1086#1082' '#1089#1086#1086#1073#1097#1077#1085#1080#1081': '#1087#1077#1088#1089#1086#1085#1072#1083#1100#1085#1086#1077
      #1057#1087#1080#1089#1086#1082' '#1089#1086#1086#1073#1097#1077#1085#1080#1081': '#1085#1077#1087#1088#1086#1095#1080#1090#1072#1085#1085#1086#1077
      #1057#1087#1080#1089#1086#1082' '#1089#1086#1086#1073#1097#1077#1085#1080#1081': '#1085#1077#1086#1090#1087#1088#1072#1074#1083#1077#1085#1085#1086#1077
      #1057#1087#1080#1089#1086#1082' '#1089#1086#1086#1073#1097#1077#1085#1080#1081': '#1086#1090' '#1084#1086#1076#1077#1088#1072#1090#1086#1088#1072
      #1058#1077#1082#1089#1090' '#1089#1086#1086#1073#1097#1077#1085#1080#1103': '#1092#1086#1085
      #1047#1072#1075#1086#1083#1086#1074#1086#1082': '#1086#1090
      #1047#1072#1075#1086#1083#1086#1074#1086#1082': '#1076#1086
      #1056#1072#1079#1076#1077#1083#1080#1090#1077#1083#1100': '#1086#1090
      #1056#1072#1079#1076#1077#1083#1080#1090#1077#1083#1100': '#1076#1086
      #1060#1086#1085' '#1086#1082#1085#1072
      #1042#1082#1083#1072#1076#1082#1080': '#1092#1086#1085' - '#1086#1090
      #1042#1082#1083#1072#1076#1082#1080': '#1092#1086#1085' - '#1076#1086
      #1042#1082#1083#1072#1076#1082#1080': '#1090#1077#1082#1089#1090
      #1042#1082#1083#1072#1076#1082#1080': '#1092#1086#1085' '#1072#1082#1090#1080#1074#1085#1086#1081' - '#1086#1090
      #1042#1082#1083#1072#1076#1082#1080': '#1092#1086#1085' '#1072#1082#1090#1080#1074#1085#1086#1081' - '#1076#1086
      #1042#1082#1083#1072#1076#1082#1080': '#1090#1077#1082#1089#1090' '#1072#1082#1090#1080#1074#1085#1086#1081
      #1079#1072#1088#1077#1079#1077#1088#1074#1080#1088#1086#1074#1072#1085#1086
      #1079#1072#1088#1077#1079#1077#1088#1074#1080#1088#1086#1074#1072#1085#1086
      #1079#1072#1088#1077#1079#1077#1088#1074#1080#1088#1086#1074#1072#1085#1086
      #1047#1072#1075#1086#1083#1086#1074#1086#1082' '#1089#1086#1086#1073#1097#1077#1085#1080#1103': '#1092#1086#1085
      #1047#1072#1075#1086#1083#1086#1074#1086#1082' '#1089#1086#1086#1073#1097#1077#1085#1080#1103': '#1084#1077#1090#1082#1080
      #1047#1072#1075#1086#1083#1086#1074#1086#1082' '#1089#1086#1086#1073#1097#1077#1085#1080#1103': '#1079#1085#1072#1095#1077#1085#1080#1103
      #1055#1086#1083#1103' '#1074#1074#1086#1076#1072': '#1092#1086#1085
      #1055#1086#1083#1103' '#1074#1074#1086#1076#1072': '#1090#1077#1082#1089#1090
      #1055#1072#1085#1077#1083#1080' '#1080#1085#1089#1090#1088#1091#1084#1077#1085#1090#1086#1074
      #1055#1086#1076#1089#1082#1072#1079#1082#1072': '#1092#1086#1085' ('#1080#1085#1092#1086#1088#1084#1072#1094#1080#1103')'
      #1055#1086#1076#1089#1082#1072#1079#1082#1072': '#1092#1086#1085' ('#1087#1088#1077#1076#1091#1087#1088#1077#1078#1076#1077#1085#1080#1077')'
      #1055#1086#1076#1089#1082#1072#1079#1082#1072': '#1090#1077#1082#1089#1090
      #1055#1086#1076#1089#1082#1072#1079#1082#1072': "'#1089#1082#1088#1099#1090#1100'"')
  end
  object JvStaticText10: TJvStaticText
    Left = 416
    Top = 92
    Width = 129
    Height = 17
    Alignment = taCenter
    AutoSize = False
    Caption = #1069#1083#1077#1084#1077#1085#1090#1099' '#1080#1085#1090#1077#1088#1092#1077#1081#1089#1072':'
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
    TabOrder = 9
    TextMargins.X = 0
    TextMargins.Y = 0
    WordWrap = False
  end
  object TextColorBtn: TJvOfficeColorPanel
    Left = 112
    Top = 192
    Width = 152
    Height = 162
    SelectedColor = clDefault
    HotTrackFont.Charset = DEFAULT_CHARSET
    HotTrackFont.Color = clWindowText
    HotTrackFont.Height = -11
    HotTrackFont.Name = 'MS Sans Serif'
    HotTrackFont.Style = []
    TabOrder = 10
    Properties.ShowUserColors = True
    Properties.HoldCustomColor = True
    Properties.NoneColorCaption = 'No Color'
    Properties.DefaultColorCaption = #1062#1074#1077#1090
    Properties.CustomColorCaption = 'Other Colors...'
    Properties.NoneColorHint = 'No Color'
    Properties.DefaultColorHint = 'Automatic'
    Properties.CustomColorHint = 'Other Colors...'
    Properties.DefaultColorColor = clBlack
    Properties.NoneColorFont.Charset = DEFAULT_CHARSET
    Properties.NoneColorFont.Color = clWindowText
    Properties.NoneColorFont.Height = -11
    Properties.NoneColorFont.Name = 'MS Sans Serif'
    Properties.NoneColorFont.Style = []
    Properties.DefaultColorFont.Charset = DEFAULT_CHARSET
    Properties.DefaultColorFont.Color = clWindowText
    Properties.DefaultColorFont.Height = -11
    Properties.DefaultColorFont.Name = 'MS Sans Serif'
    Properties.DefaultColorFont.Style = []
    Properties.CustomColorFont.Charset = DEFAULT_CHARSET
    Properties.CustomColorFont.Color = clWindowText
    Properties.CustomColorFont.Height = -11
    Properties.CustomColorFont.Name = 'MS Sans Serif'
    Properties.CustomColorFont.Style = []
    OnColorChange = TextColorBtnColorChange
  end
  object IfaceColorBtn: TJvOfficeColorPanel
    Left = 408
    Top = 192
    Width = 152
    Height = 162
    SelectedColor = clDefault
    HotTrackFont.Charset = DEFAULT_CHARSET
    HotTrackFont.Color = clWindowText
    HotTrackFont.Height = -11
    HotTrackFont.Name = 'MS Sans Serif'
    HotTrackFont.Style = []
    TabOrder = 11
    Properties.ShowUserColors = True
    Properties.HoldCustomColor = True
    Properties.NoneColorCaption = 'No Color'
    Properties.DefaultColorCaption = #1062#1074#1077#1090
    Properties.CustomColorCaption = 'Other Colors...'
    Properties.NoneColorHint = 'No Color'
    Properties.DefaultColorHint = 'Automatic'
    Properties.CustomColorHint = 'Other Colors...'
    Properties.DefaultColorColor = clBlack
    Properties.NoneColorFont.Charset = DEFAULT_CHARSET
    Properties.NoneColorFont.Color = clWindowText
    Properties.NoneColorFont.Height = -11
    Properties.NoneColorFont.Name = 'MS Sans Serif'
    Properties.NoneColorFont.Style = []
    Properties.DefaultColorFont.Charset = DEFAULT_CHARSET
    Properties.DefaultColorFont.Color = clWindowText
    Properties.DefaultColorFont.Height = -11
    Properties.DefaultColorFont.Name = 'MS Sans Serif'
    Properties.DefaultColorFont.Style = []
    Properties.CustomColorFont.Charset = DEFAULT_CHARSET
    Properties.CustomColorFont.Color = clWindowText
    Properties.CustomColorFont.Height = -11
    Properties.CustomColorFont.Name = 'MS Sans Serif'
    Properties.CustomColorFont.Style = []
    OnColorChange = IfaceColorBtnColorChange
  end
  object OKButton: TJvXPButton
    Left = 296
    Top = 488
    Width = 89
    Height = 33
    Caption = 'OK'
    TabOrder = 12
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    OnClick = OKButtonClick
  end
  object FlatTB: TJvCheckBox
    Left = 24
    Top = 432
    Width = 223
    Height = 17
    Caption = #1055#1083#1086#1089#1082#1080#1077' '#1082#1085#1086#1087#1082#1080' '#1087#1072#1085#1077#1083#1077#1081' '#1080#1085#1089#1090#1088#1091#1084#1077#1085#1090#1086#1074
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 13
    LinkedControls = <>
    HotTrackFont.Charset = RUSSIAN_CHARSET
    HotTrackFont.Color = clWindowText
    HotTrackFont.Height = -11
    HotTrackFont.Name = 'MS Sans Serif'
    HotTrackFont.Style = []
  end
  object GrayedTB: TJvCheckBox
    Left = 24
    Top = 452
    Width = 249
    Height = 17
    Caption = #1047#1072#1090#1077#1084#1085#1105#1085#1085#1099#1077' '#1082#1085#1086#1087#1082#1080' '#1087#1072#1085#1077#1083#1077#1081' '#1080#1085#1089#1090#1088#1091#1084#1077#1085#1090#1086#1074
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 14
    LinkedControls = <>
    HotTrackFont.Charset = RUSSIAN_CHARSET
    HotTrackFont.Color = clWindowText
    HotTrackFont.Height = -11
    HotTrackFont.Name = 'MS Sans Serif'
    HotTrackFont.Style = []
  end
  object NoStyleColors: TJvCheckBox
    Left = 24
    Top = 412
    Width = 319
    Height = 17
    Caption = #1053#1077' '#1074#1099#1076#1077#1083#1103#1090#1100' '#1094#1074#1077#1090#1086#1084', '#1080#1089#1087#1086#1083#1100#1079#1086#1074#1072#1090#1100' '#1090#1086#1083#1100#1082#1086' '#1089#1090#1080#1083#1100' ('#1046'/'#1050'/'#1063')'
    Checked = True
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    State = cbChecked
    TabOrder = 15
    LinkedControls = <>
    HotTrackFont.Charset = RUSSIAN_CHARSET
    HotTrackFont.Color = clWindowText
    HotTrackFont.Height = -11
    HotTrackFont.Name = 'MS Sans Serif'
    HotTrackFont.Style = []
  end
end
