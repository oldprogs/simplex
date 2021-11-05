object ContactForm: TContactForm
  Left = 222
  Top = 71
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #1044#1072#1085#1085#1099#1077' '#1082#1086#1085#1090#1072#1082#1090#1072
  ClientHeight = 247
  ClientWidth = 396
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnClose = FormClose
  OnKeyPress = EKeyPress
  PixelsPerInch = 96
  TextHeight = 13
  object OKButton: TJvXPButton
    Left = 119
    Top = 206
    Caption = 'OK'
    TabOrder = 5
    OnClick = OKButtonClick
  end
  object CancelButton: TJvXPButton
    Left = 207
    Top = 206
    Caption = #1054#1090#1084#1077#1085#1072
    TabOrder = 6
    OnClick = CancelButtonClick
  end
  object EDisplayName: TJvEdit
    Left = 112
    Top = 24
    Width = 257
    Height = 21
    Modified = False
    TabOrder = 0
    OnExit = EDisplayNameExit
    OnKeyPress = EKeyPress
  end
  object LDisplayName: TJvStaticText
    Left = 20
    Top = 28
    Width = 77
    Height = 17
    Caption = #1055#1086#1082#1072#1079#1099#1074#1072#1090#1100
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    HotTrackFont.Charset = RUSSIAN_CHARSET
    HotTrackFont.Color = clWindowText
    HotTrackFont.Height = -11
    HotTrackFont.Name = 'MS Sans Serif'
    HotTrackFont.Style = []
    Layout = tlTop
    ParentFont = False
    TabOrder = 7
    TextMargins.X = 0
    TextMargins.Y = 0
    WordWrap = False
  end
  object LName: TJvStaticText
    Left = 20
    Top = 60
    Width = 90
    Height = 17
    Caption = #1048#1084#1103', '#1092#1072#1084#1080#1083#1080#1103
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    HotTrackFont.Charset = RUSSIAN_CHARSET
    HotTrackFont.Color = clWindowText
    HotTrackFont.Height = -11
    HotTrackFont.Name = 'MS Sans Serif'
    HotTrackFont.Style = []
    Layout = tlTop
    ParentFont = False
    TabOrder = 8
    TextMargins.X = 0
    TextMargins.Y = 0
    WordWrap = False
  end
  object EName: TJvEdit
    Left = 112
    Top = 56
    Width = 257
    Height = 21
    Modified = False
    TabOrder = 1
  end
  object LFTNAddr: TJvStaticText
    Left = 20
    Top = 92
    Width = 58
    Height = 17
    Caption = 'FTN '#1072#1076#1088#1077#1089
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
  object EFTNAddr: TJvEdit
    Left = 112
    Top = 88
    Width = 257
    Height = 21
    Modified = False
    TabOrder = 2
    OnKeyPress = EKeyPress
  end
  object LEmail: TJvStaticText
    Left = 20
    Top = 124
    Width = 66
    Height = 17
    Caption = 'E-Mail '#1072#1076#1088#1077#1089
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
  object EEmail: TJvEdit
    Left = 112
    Top = 120
    Width = 257
    Height = 21
    Modified = False
    TabOrder = 3
    OnKeyPress = EKeyPress
  end
  object EPhone: TJvEdit
    Left = 112
    Top = 152
    Width = 257
    Height = 21
    Modified = False
    TabOrder = 4
    OnKeyPress = EKeyPress
  end
  object LPhone: TJvStaticText
    Left = 20
    Top = 156
    Width = 49
    Height = 17
    Caption = #1058#1077#1083#1077#1092#1086#1085
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
  object JvBalloonHint1: TJvBalloonHint
    CustomAnimationTime = 150
    DefaultBalloonPosition = bpRightDown
    DefaultIcon = ikNone
    ApplicationHintOptions = []
    Left = 16
    Top = 8
  end
end
