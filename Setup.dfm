object SetupForm: TSetupForm
  Left = 229
  Top = 114
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  Caption = #1053#1072#1089#1090#1088#1086#1081#1082#1080
  ClientHeight = 506
  ClientWidth = 569
  Color = clBtnFace
  Font.Charset = RUSSIAN_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object JvBevel1: TJvBevel
    Left = 0
    Top = 454
    Width = 569
    Height = 52
    Align = alBottom
  end
  object JvTabBar: TJvTabBar
    Left = 0
    Top = 0
    Width = 569
    Height = 25
    CloseButton = False
    PageListTabLink = True
    PageList = JvPageList
    Tabs = <
      item
        Caption = #1055#1086#1083#1100#1079#1086#1074#1072#1090#1077#1083#1100
        Selected = True
      end
      item
        Caption = #1054#1073#1083#1072#1089#1090#1080
      end
      item
        Caption = #1057#1080#1089#1090#1077#1084#1072
      end
      item
        Caption = #1055#1088#1086#1089#1084#1086#1090#1088
      end
      item
        Caption = #1056#1077#1076#1072#1082#1090#1086#1088
      end
      item
        Caption = #1064#1072#1073#1083#1086#1085#1099
      end
      item
        Caption = #1054#1092#1086#1088#1084#1083#1077#1085#1080#1077
      end
      item
        Caption = #1048#1075#1085#1086#1088#1080#1088#1086#1074#1072#1085#1080#1077
      end>
  end
  object JvPageList: TJvPageList
    Left = 0
    Top = 25
    Width = 569
    Height = 429
    ActivePage = ViewerPage
    PropagateEnable = False
    Align = alClient
    object UserPage: TJvStandardPage
      Left = 0
      Top = 0
      Width = 569
      Height = 429
      Caption = #1055#1086#1083#1100#1079#1086#1074#1072#1090#1077#1083#1100
      object UsersAdd: TJvXPButton
        Left = 208
        Top = 64
        Width = 57
        Caption = #1044#1086#1073#1072#1074#1080#1090#1100
        TabOrder = 1
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        OnClick = UsersAddClick
      end
      object UsersSub: TJvXPButton
        Left = 352
        Top = 64
        Width = 57
        Caption = #1059#1076#1072#1083#1080#1090#1100
        Enabled = False
        TabOrder = 3
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        OnClick = UsersSubClick
      end
      object Users: TJvComboBox
        Left = 168
        Top = 32
        Width = 241
        Height = 21
        AutoDropDown = True
        Style = csDropDownList
        ItemHeight = 13
        TabOrder = 0
      end
      object UsersChange: TJvXPButton
        Left = 280
        Top = 64
        Width = 57
        Caption = #1048#1079#1084#1077#1085#1080#1090#1100
        Enabled = False
        TabOrder = 2
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        OnClick = UsersChangeClick
      end
      object JvStaticText1: TJvStaticText
        Left = 60
        Top = 36
        Width = 103
        Height = 17
        Caption = #1048#1084#1103' '#1087#1086#1083#1100#1079#1086#1074#1072#1090#1077#1083#1103':'
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
      object JvStaticText2: TJvStaticText
        Left = 92
        Top = 116
        Width = 67
        Height = 17
        Caption = 'FTN-'#1072#1076#1088#1077#1089#1072':'
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
      object RealName: TJvEdit
        Left = 168
        Top = 192
        Width = 241
        Height = 21
        Modified = False
        TabOrder = 8
      end
      object FtnAddr: TJvComboBox
        Left = 168
        Top = 112
        Width = 241
        Height = 21
        AutoDropDown = True
        Style = csDropDownList
        ItemHeight = 13
        TabOrder = 4
      end
      object FtnAddrAdd: TJvXPButton
        Left = 208
        Top = 144
        Width = 57
        Caption = #1044#1086#1073#1072#1074#1080#1090#1100
        TabOrder = 5
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        OnClick = FtnAddrAddClick
      end
      object FtnAddrChange: TJvXPButton
        Left = 280
        Top = 144
        Width = 57
        Caption = #1048#1079#1084#1077#1085#1080#1090#1100
        Enabled = False
        TabOrder = 6
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        OnClick = FtnAddrChangeClick
      end
      object FtnAddrSub: TJvXPButton
        Left = 352
        Top = 144
        Width = 57
        Caption = #1059#1076#1072#1083#1080#1090#1100
        Enabled = False
        TabOrder = 7
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        OnClick = FtnAddrSubClick
      end
      object JvStaticText3: TJvStaticText
        Left = 84
        Top = 196
        Width = 82
        Height = 17
        Caption = #1056#1077#1072#1083#1100#1085#1086#1077' '#1080#1084#1103': '
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
    end
    object AreasPage: TJvStandardPage
      Left = 0
      Top = 0
      Width = 569
      Height = 429
      Caption = #1054#1073#1083#1072#1089#1090#1080
      object JvGroupHeader5: TJvGroupHeader
        Left = 6
        Top = 257
        Width = 569
        Height = 17
        Caption = #1056#1091#1095#1085#1086#1077' '#1086#1087#1080#1089#1072#1085#1080#1077' '#1080' '#1087#1077#1088#1077#1086#1087#1088#1077#1076#1077#1083#1077#1085#1080#1077' '#1086#1073#1083#1072#1089#1090#1077#1081
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object JvStaticText4: TJvStaticText
        Left = 20
        Top = 28
        Width = 152
        Height = 17
        Caption = #1060#1072#1081#1083' '#1082#1086#1085#1092#1080#1075#1091#1088#1072#1094#1080#1080' '#1090#1086#1089#1089#1077#1088#1072
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
      object TosserConfig: TJvEdit
        Left = 176
        Top = 24
        Width = 273
        Height = 21
        Modified = False
        TabOrder = 2
      end
      object TosserBrowse: TJvXPButton
        Left = 456
        Top = 24
        Caption = #1054#1073#1079#1086#1088'...'
        TabOrder = 3
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        OnClick = TosserBrowseClick
      end
      object HPT: TJvRadioButton
        Tag = 1
        Left = 184
        Top = 56
        Width = 43
        Height = 17
        Alignment = taLeftJustify
        Caption = 'HPT'
        Checked = True
        TabOrder = 4
        TabStop = True
        HotTrackFont.Charset = RUSSIAN_CHARSET
        HotTrackFont.Color = clWindowText
        HotTrackFont.Height = -11
        HotTrackFont.Name = 'MS Sans Serif'
        HotTrackFont.Style = []
        LinkedControls = <>
      end
      object BBToss: TJvRadioButton
        Tag = 1
        Left = 320
        Top = 56
        Width = 58
        Height = 17
        Alignment = taLeftJustify
        Caption = 'BBToss'
        TabOrder = 6
        HotTrackFont.Charset = RUSSIAN_CHARSET
        HotTrackFont.Color = clWindowText
        HotTrackFont.Height = -11
        HotTrackFont.Name = 'MS Sans Serif'
        HotTrackFont.Style = []
        LinkedControls = <>
      end
      object JvGroupBox1: TJvGroupBox
        Left = 22
        Top = 80
        Width = 531
        Height = 129
        Caption = ' C'#1086#1088#1090#1080#1088#1086#1074#1082#1072' '#1086#1073#1083#1072#1089#1090#1077#1081' '
        TabOrder = 0
        object Rule1: TJvComboBox
          Left = 96
          Top = 24
          Width = 249
          Height = 21
          AutoDropDown = True
          Style = csDropDownList
          ItemHeight = 13
          ItemIndex = 2
          TabOrder = 3
          Text = #1055#1086' '#1090#1080#1087#1091' (net/echo/local)'
          Items.Strings = (
            #1041#1077#1079' '#1089#1086#1088#1090#1080#1088#1086#1074#1082#1080
            #1055#1086' '#1080#1084#1077#1085#1080
            #1055#1086' '#1090#1080#1087#1091' (net/echo/local)'
            #1055#1086' '#1090#1080#1087#1091' (net/local/echo)'
            #1055#1086' '#1085#1072#1083#1080#1095#1080#1102' '#1085#1086#1074#1099#1093' '#1087#1080#1089#1077#1084
            #1055#1086' AKA')
        end
        object JvStaticText5: TJvStaticText
          Left = 20
          Top = 28
          Width = 60
          Height = 17
          Caption = #1055#1088#1072#1074#1080#1083#1086' 1:'
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
          TabOrder = 0
          TextMargins.X = 0
          TextMargins.Y = 0
          WordWrap = False
        end
        object Rule1Reverse: TJvCheckBox
          Left = 360
          Top = 26
          Width = 125
          Height = 17
          Caption = #1042' '#1086#1073#1088#1072#1090#1085#1086#1084' '#1087#1086#1088#1103#1076#1082#1077
          TabOrder = 4
          LinkedControls = <>
          HotTrackFont.Charset = RUSSIAN_CHARSET
          HotTrackFont.Color = clWindowText
          HotTrackFont.Height = -11
          HotTrackFont.Name = 'MS Sans Serif'
          HotTrackFont.Style = []
        end
        object JvStaticText6: TJvStaticText
          Left = 20
          Top = 60
          Width = 60
          Height = 17
          Caption = #1055#1088#1072#1074#1080#1083#1086' 2:'
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
        object Rule2: TJvComboBox
          Left = 96
          Top = 56
          Width = 249
          Height = 21
          AutoDropDown = True
          Style = csDropDownList
          ItemHeight = 13
          ItemIndex = 1
          TabOrder = 5
          Text = #1055#1086' '#1080#1084#1077#1085#1080
          Items.Strings = (
            #1041#1077#1079' '#1089#1086#1088#1090#1080#1088#1086#1074#1082#1080
            #1055#1086' '#1080#1084#1077#1085#1080
            #1055#1086' '#1090#1080#1087#1091' (net/echo/local)'
            #1055#1086' '#1090#1080#1087#1091' (net/local/echo)'
            #1055#1086' '#1085#1072#1083#1080#1095#1080#1102' '#1085#1086#1074#1099#1093' '#1087#1080#1089#1077#1084
            #1055#1086' AKA')
        end
        object Rule2Reverse: TJvCheckBox
          Left = 360
          Top = 58
          Width = 125
          Height = 17
          Caption = #1042' '#1086#1073#1088#1072#1090#1085#1086#1084' '#1087#1086#1088#1103#1076#1082#1077
          TabOrder = 6
          LinkedControls = <>
          HotTrackFont.Charset = RUSSIAN_CHARSET
          HotTrackFont.Color = clWindowText
          HotTrackFont.Height = -11
          HotTrackFont.Name = 'MS Sans Serif'
          HotTrackFont.Style = []
        end
        object JvStaticText7: TJvStaticText
          Left = 20
          Top = 92
          Width = 60
          Height = 17
          Caption = #1055#1088#1072#1074#1080#1083#1086' 3:'
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
          TabOrder = 2
          TextMargins.X = 0
          TextMargins.Y = 0
          WordWrap = False
        end
        object Rule3: TJvComboBox
          Left = 96
          Top = 88
          Width = 249
          Height = 21
          AutoDropDown = True
          Style = csDropDownList
          ItemHeight = 13
          ItemIndex = 0
          TabOrder = 7
          Text = #1041#1077#1079' '#1089#1086#1088#1090#1080#1088#1086#1074#1082#1080
          Items.Strings = (
            #1041#1077#1079' '#1089#1086#1088#1090#1080#1088#1086#1074#1082#1080
            #1055#1086' '#1080#1084#1077#1085#1080
            #1055#1086' '#1090#1080#1087#1091' (net/echo/local)'
            #1055#1086' '#1090#1080#1087#1091' (net/local/echo)'
            #1055#1086' '#1085#1072#1083#1080#1095#1080#1102' '#1085#1086#1074#1099#1093' '#1087#1080#1089#1077#1084
            #1055#1086' AKA')
        end
        object Rule3Reverse: TJvCheckBox
          Left = 360
          Top = 90
          Width = 125
          Height = 17
          Caption = #1042' '#1086#1073#1088#1072#1090#1085#1086#1084' '#1087#1086#1088#1103#1076#1082#1077
          TabOrder = 8
          LinkedControls = <>
          HotTrackFont.Charset = RUSSIAN_CHARSET
          HotTrackFont.Color = clWindowText
          HotTrackFont.Height = -11
          HotTrackFont.Name = 'MS Sans Serif'
          HotTrackFont.Style = []
        end
      end
      object AreasBBS: TJvRadioButton
        Tag = 1
        Left = 392
        Top = 56
        Width = 81
        Height = 17
        Alignment = taLeftJustify
        Caption = 'AREAS.BBS'
        TabOrder = 7
        HotTrackFont.Charset = RUSSIAN_CHARSET
        HotTrackFont.Color = clWindowText
        HotTrackFont.Height = -11
        HotTrackFont.Name = 'MS Sans Serif'
        HotTrackFont.Style = []
        LinkedControls = <>
      end
      object Partoss: TJvRadioButton
        Tag = 1
        Left = 248
        Top = 56
        Width = 56
        Height = 17
        Alignment = taLeftJustify
        Caption = 'Partoss'
        TabOrder = 5
        HotTrackFont.Charset = RUSSIAN_CHARSET
        HotTrackFont.Color = clWindowText
        HotTrackFont.Height = -11
        HotTrackFont.Name = 'MS Sans Serif'
        HotTrackFont.Style = []
        LinkedControls = <>
      end
      object HLAreasUnread: TJvCheckBox
        Left = 16
        Top = 226
        Width = 287
        Height = 17
        Caption = #1042#1099#1076#1077#1083#1103#1090#1100' '#1086#1073#1083#1072#1089#1090#1080' '#1089' '#1085#1077#1087#1088#1086#1095#1080#1090#1072#1085#1085#1099#1084#1080' '#1089#1086#1086#1073#1097#1077#1085#1080#1103#1084#1080
        TabOrder = 8
        LinkedControls = <>
        HotTrackFont.Charset = RUSSIAN_CHARSET
        HotTrackFont.Color = clWindowText
        HotTrackFont.Height = -11
        HotTrackFont.Name = 'MS Sans Serif'
        HotTrackFont.Style = []
      end
      object ManualAreas: TJvStringGrid
        Left = 22
        Top = 288
        Width = 529
        Height = 97
        ColCount = 7
        FixedCols = 0
        RowCount = 2
        Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goRowSelect]
        TabOrder = 9
        Alignment = taLeftJustify
        FixedFont.Charset = DEFAULT_CHARSET
        FixedFont.Color = clWindowText
        FixedFont.Height = -11
        FixedFont.Name = 'MS Sans Serif'
        FixedFont.Style = []
        ColWidths = (
          92
          57
          113
          64
          64
          64
          64)
      end
      object MAreaAdd: TJvXPButton
        Left = 160
        Top = 396
        Caption = #1044#1086#1073#1072#1074#1080#1090#1100
        TabOrder = 10
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        OnClick = MAreaAddClick
      end
      object MAreaChange: TJvXPButton
        Left = 248
        Top = 396
        Caption = #1048#1079#1084#1077#1085#1080#1090#1100
        TabOrder = 11
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        OnClick = MAreaChangeClick
      end
      object MAreaDelete: TJvXPButton
        Left = 336
        Top = 396
        Caption = #1059#1076#1072#1083#1080#1090#1100
        TabOrder = 12
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        OnClick = MAreaDeleteClick
      end
    end
    object SystemPage: TJvStandardPage
      Left = 0
      Top = 0
      Width = 569
      Height = 429
      Caption = #1057#1080#1089#1090#1077#1084#1072
      object JvGroupHeader3: TJvGroupHeader
        Left = 8
        Top = 201
        Width = 569
        Height = 17
        Caption = #1053#1086#1076'- '#1080' '#1087#1086#1080#1085#1090#1083#1080#1089#1090#1099
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object JvLabel3: TJvLabel
        Left = 64
        Top = 222
        Width = 98
        Height = 13
        Caption = #1060#1072#1081#1083#1099' '#1085#1086#1076#1083#1080#1089#1090#1086#1074':'
        HotTrackFont.Charset = RUSSIAN_CHARSET
        HotTrackFont.Color = clWindowText
        HotTrackFont.Height = -11
        HotTrackFont.Name = 'MS Sans Serif'
        HotTrackFont.Style = []
      end
      object JvLabel4: TJvLabel
        Left = 392
        Top = 222
        Width = 109
        Height = 13
        Caption = #1060#1072#1081#1083#1099' '#1087#1086#1080#1085#1090#1083#1080#1089#1090#1086#1074':'
        HotTrackFont.Charset = RUSSIAN_CHARSET
        HotTrackFont.Color = clWindowText
        HotTrackFont.Height = -11
        HotTrackFont.Name = 'MS Sans Serif'
        HotTrackFont.Style = []
      end
      object LNetmailFlag: TJvStaticText
        Left = 20
        Top = 36
        Width = 162
        Height = 17
        Caption = #1060#1083#1072#1075' '#1089#1082#1072#1085#1080#1088#1086#1074#1072#1085#1080#1103' '#1085#1077#1090#1084#1077#1081#1083#1072':'
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
        TabOrder = 0
        TextMargins.X = 0
        TextMargins.Y = 0
        WordWrap = False
      end
      object ENetmailFlag: TJvEdit
        Left = 192
        Top = 32
        Width = 257
        Height = 21
        Modified = False
        TabOrder = 1
      end
      object BNetmailFlag: TJvXPButton
        Left = 456
        Top = 32
        Caption = #1054#1073#1079#1086#1088'...'
        TabOrder = 2
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        OnClick = BNetmailFlagClick
      end
      object LEchomailFlag: TJvStaticText
        Left = 20
        Top = 68
        Width = 162
        Height = 17
        Caption = #1060#1083#1072#1075' '#1089#1082#1072#1085#1080#1088#1086#1074#1072#1085#1080#1103' '#1101#1093#1086#1084#1077#1081#1083#1072':'
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
        TabOrder = 3
        TextMargins.X = 0
        TextMargins.Y = 0
        WordWrap = False
      end
      object EEchomailFlag: TJvEdit
        Left = 192
        Top = 64
        Width = 257
        Height = 21
        Modified = False
        TabOrder = 4
      end
      object BEchomailFlag: TJvXPButton
        Left = 456
        Top = 64
        Caption = #1054#1073#1079#1086#1088'...'
        TabOrder = 5
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        OnClick = BEchomailFlagClick
      end
      object LExportList: TJvStaticText
        Left = 20
        Top = 100
        Width = 75
        Height = 17
        Caption = #1069#1082#1089#1087#1086#1088#1090'-'#1083#1080#1089#1090':'
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
        TabOrder = 6
        TextMargins.X = 0
        TextMargins.Y = 0
        WordWrap = False
      end
      object EExportList: TJvEdit
        Left = 192
        Top = 96
        Width = 257
        Height = 21
        Modified = False
        TabOrder = 7
      end
      object BExportList: TJvXPButton
        Left = 456
        Top = 96
        Caption = #1054#1073#1079#1086#1088'...'
        TabOrder = 8
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        OnClick = BExportListClick
      end
      object Nodelists: TJvListBox
        Left = 16
        Top = 240
        Width = 209
        Height = 81
        ItemHeight = 13
        Background.FillMode = bfmTile
        Background.Visible = False
        TabOrder = 9
      end
      object Pointlists: TJvListBox
        Left = 344
        Top = 240
        Width = 209
        Height = 81
        ItemHeight = 13
        Background.FillMode = bfmTile
        Background.Visible = False
        TabOrder = 10
      end
      object BtnNdlAdd: TJvXPButton
        Left = 16
        Top = 328
        Width = 65
        Caption = #1044#1086#1073#1072#1074#1080#1090#1100
        TabOrder = 11
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        OnClick = BtnNdlAddClick
      end
      object BtnNdlChange: TJvXPButton
        Left = 88
        Top = 328
        Width = 65
        Caption = #1047#1072#1084#1077#1085#1080#1090#1100
        Enabled = False
        TabOrder = 12
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        OnClick = BtnNdlChangeClick
      end
      object BtnNdlSub: TJvXPButton
        Left = 160
        Top = 328
        Width = 65
        Caption = #1059#1076#1072#1083#1080#1090#1100
        Enabled = False
        TabOrder = 13
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        OnClick = BtnNdlSubClick
      end
      object BtnNdlCompile: TJvXPButton
        Left = 240
        Top = 328
        Width = 89
        Caption = #1050#1086#1084#1087#1080#1083#1080#1088#1086#1074#1072#1090#1100
        TabOrder = 14
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        OnClick = BtnNdlCompileClick
      end
      object BtnPntAdd: TJvXPButton
        Left = 344
        Top = 328
        Width = 65
        Caption = #1044#1086#1073#1072#1074#1080#1090#1100
        TabOrder = 15
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        OnClick = BtnPntAddClick
      end
      object BtnPntChange: TJvXPButton
        Left = 416
        Top = 328
        Width = 65
        Caption = #1047#1072#1084#1077#1085#1080#1090#1100
        Enabled = False
        TabOrder = 16
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        OnClick = BtnPntChangeClick
      end
      object BtnPntSub: TJvXPButton
        Left = 488
        Top = 328
        Width = 65
        Caption = #1059#1076#1072#1083#1080#1090#1100
        Enabled = False
        TabOrder = 17
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        OnClick = BtnPntSubClick
      end
      object CompileAtStart: TJvCheckBox
        Left = 24
        Top = 368
        Width = 170
        Height = 17
        Caption = #1040#1074#1090#1086#1084#1072#1090#1080#1095#1077#1089#1082#1072#1103' '#1082#1086#1084#1087#1080#1083#1103#1094#1080#1103
        Checked = True
        State = cbChecked
        TabOrder = 18
        LinkedControls = <>
        HotTrackFont.Charset = RUSSIAN_CHARSET
        HotTrackFont.Color = clWindowText
        HotTrackFont.Height = -11
        HotTrackFont.Name = 'MS Sans Serif'
        HotTrackFont.Style = []
      end
    end
    object ViewerPage: TJvStandardPage
      Left = 0
      Top = 0
      Width = 569
      Height = 429
      Caption = #1055#1088#1086#1089#1084#1086#1090#1088
      object LLeftMargin: TJvLabel
        Left = 32
        Top = 252
        Width = 81
        Height = 13
        Caption = #1051#1077#1074#1072#1103' '#1075#1088#1072#1085#1080#1094#1072':'
        HotTrackFont.Charset = RUSSIAN_CHARSET
        HotTrackFont.Color = clWindowText
        HotTrackFont.Height = -11
        HotTrackFont.Name = 'MS Sans Serif'
        HotTrackFont.Style = []
      end
      object JvGroupHeader2: TJvGroupHeader
        Left = 8
        Top = 224
        Width = 569
        Height = 17
        Caption = #1054#1082#1085#1086' '#1087#1088#1086#1089#1084#1086#1090#1088#1072' '#1089#1086#1086#1073#1097#1077#1085#1080#1103
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object JvGroupBox2: TJvGroupBox
        Left = 24
        Top = 24
        Width = 249
        Height = 89
        Caption = ' '#1069#1083#1077#1084#1077#1085#1090#1099' '#1086#1082#1085#1072' '
        TabOrder = 0
        object ShowHintPanel: TJvCheckBox
          Left = 16
          Top = 18
          Width = 116
          Height = 17
          Caption = #1055#1072#1085#1077#1083#1100' '#1087#1086#1076#1089#1082#1072#1079#1086#1082
          TabOrder = 0
          LinkedControls = <>
          HotTrackFont.Charset = RUSSIAN_CHARSET
          HotTrackFont.Color = clWindowText
          HotTrackFont.Height = -11
          HotTrackFont.Name = 'MS Sans Serif'
          HotTrackFont.Style = []
        end
        object ShowContacts: TJvCheckBox
          Left = 16
          Top = 42
          Width = 113
          Height = 17
          Caption = #1057#1087#1080#1089#1086#1082' '#1082#1086#1085#1090#1072#1082#1090#1086#1074
          Checked = True
          State = cbChecked
          TabOrder = 1
          LinkedControls = <>
          HotTrackFont.Charset = RUSSIAN_CHARSET
          HotTrackFont.Color = clWindowText
          HotTrackFont.Height = -11
          HotTrackFont.Name = 'MS Sans Serif'
          HotTrackFont.Style = []
        end
        object ShowFGHIaddr: TJvCheckBox
          Left = 16
          Top = 66
          Width = 108
          Height = 17
          Caption = #1040#1076#1088#1077#1089#1085#1072#1103' '#1089#1090#1088#1086#1082#1072
          Checked = True
          State = cbChecked
          TabOrder = 2
          LinkedControls = <>
          HotTrackFont.Charset = RUSSIAN_CHARSET
          HotTrackFont.Color = clWindowText
          HotTrackFont.Height = -11
          HotTrackFont.Name = 'MS Sans Serif'
          HotTrackFont.Style = []
        end
      end
      object StyleHL: TJvRadioGroup
        Left = 24
        Top = 280
        Width = 249
        Height = 97
        Caption = ' '#1056#1077#1078#1080#1084' '#1089#1090#1080#1083#1077#1074#1086#1075#1086' '#1074#1099#1076#1077#1083#1077#1085#1080#1103'  '
        ItemIndex = 2
        Items.Strings = (
          #1054#1090#1082#1083#1102#1095#1077#1085#1086
          #1042#1082#1083#1102#1095#1077#1085#1086
          #1042#1082#1083#1102#1095#1077#1085#1086', '#1089#1082#1088#1099#1090#1100' '#1082#1086#1076#1099)
        TabOrder = 1
        CaptionVisible = True
      end
      object ELeftMargin: TJvSpinEdit
        Left = 120
        Top = 248
        Width = 41
        Height = 21
        MaxValue = 30.000000000000000000
        TabOrder = 2
      end
      object ShowToolBar: TJvRadioGroup
        Left = 296
        Top = 24
        Width = 249
        Height = 89
        Caption = #1055#1072#1085#1077#1083#1100' '#1080#1085#1089#1090#1088#1091#1084#1077#1085#1090#1086#1074
        ItemIndex = 2
        Items.Strings = (
          #1054#1090#1082#1083#1102#1095#1077#1085#1072
          #1042#1082#1083#1102#1095#1077#1085#1072', '#1090#1086#1083#1100#1082#1086' '#1079#1085#1072#1095#1082#1080
          #1042#1082#1083#1102#1095#1077#1085#1072', '#1079#1085#1072#1095#1082#1080' '#1080' '#1087#1086#1076#1087#1080#1089#1080)
        TabOrder = 3
        CaptionVisible = True
      end
      object JvGroupBox4: TJvGroupBox
        Left = 304
        Top = 280
        Width = 249
        Height = 97
        Caption = ' '#1054#1087#1094#1080#1080' '#1087#1088#1086#1089#1084#1086#1090#1088#1072
        TabOrder = 4
        object ShowKludges: TJvCheckBox
          Left = 13
          Top = 24
          Width = 124
          Height = 17
          Caption = #1055#1086#1082#1072#1079#1099#1074#1072#1090#1100' '#1082#1083#1091#1076#1078#1080
          TabOrder = 0
          OnClick = ShowKludgesClick
          LinkedControls = <>
          HotTrackFont.Charset = RUSSIAN_CHARSET
          HotTrackFont.Color = clWindowText
          HotTrackFont.Height = -11
          HotTrackFont.Name = 'MS Sans Serif'
          HotTrackFont.Style = []
        end
        object ShowRegion: TJvCheckBox
          Left = 14
          Top = 48
          Width = 189
          Height = 17
          Caption = #1055#1086#1082#1072#1079#1099#1074#1072#1090#1100' '#1088#1077#1075#1080#1086#1085' '#1086#1090#1087#1088#1072#1074#1080#1090#1077#1083#1103
          Checked = True
          State = cbChecked
          TabOrder = 1
          LinkedControls = <>
          HotTrackFont.Charset = RUSSIAN_CHARSET
          HotTrackFont.Color = clWindowText
          HotTrackFont.Height = -11
          HotTrackFont.Name = 'MS Sans Serif'
          HotTrackFont.Style = []
        end
        object TreeFullExpand: TJvCheckBox
          Left = 14
          Top = 72
          Width = 224
          Height = 17
          Caption = #1055#1086#1083#1085#1086#1089#1090#1100#1102' '#1088#1072#1089#1082#1088#1099#1074#1072#1090#1100' '#1076#1077#1088#1077#1074#1086' '#1086#1090#1074#1077#1090#1086#1074
          TabOrder = 2
          LinkedControls = <>
          HotTrackFont.Charset = RUSSIAN_CHARSET
          HotTrackFont.Color = clWindowText
          HotTrackFont.Height = -11
          HotTrackFont.Name = 'MS Sans Serif'
          HotTrackFont.Style = []
        end
      end
      object AreasOnClick: TJvRadioGroup
        Left = 24
        Top = 136
        Width = 521
        Height = 73
        Caption = ' '#1044#1077#1081#1089#1090#1074#1080#1103' '#1087#1088#1080' '#1074#1099#1073#1086#1088#1077' '#1086#1073#1083#1072#1089#1090#1080' '#1074' '#1089#1087#1080#1089#1082#1077' '
        ItemIndex = 0
        Items.Strings = (
          
            'Click / Enter - '#1086#1090#1082#1088#1099#1090#1100' '#1074' '#1085#1086#1074#1086#1081' '#1074#1082#1083#1072#1076#1082#1077', Shift+ Click / Enter - ' +
            #1074' '#1090#1077#1082#1091#1097#1077#1081
          
            'Click / Enter - '#1086#1090#1082#1088#1099#1090#1100' '#1074' '#1090#1077#1082#1091#1097#1077#1081' '#1074#1082#1083#1072#1076#1082#1077', Shift+ Click / Enter ' +
            '- '#1074' '#1085#1086#1074#1086#1081)
        TabOrder = 5
        CaptionVisible = True
      end
      object JvStaticText9: TJvStaticText
        Left = 36
        Top = 396
        Width = 133
        Height = 17
        Caption = #1060#1086#1088#1084#1072#1090' '#1076#1072#1090#1099' '#1080' '#1074#1088#1077#1084#1077#1085#1080':'
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
        TabOrder = 6
        TextMargins.X = 0
        TextMargins.Y = 0
        WordWrap = False
      end
      object DateTimeFormat: TJvEdit
        Left = 192
        Top = 392
        Width = 241
        Height = 21
        Modified = False
        TabOrder = 7
        Text = 'ddd, d mmm yyyy, hh:nn'
      end
      object JvXPButton1: TJvXPButton
        Left = 448
        Top = 393
        Width = 97
        Caption = #1055#1086' '#1091#1084#1086#1083#1095#1072#1085#1080#1102
        TabOrder = 8
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        OnClick = JvXPButton1Click
      end
    end
    object EditPage: TJvStandardPage
      Left = 0
      Top = 0
      Width = 569
      Height = 429
      Caption = #1056#1077#1076#1072#1082#1090#1086#1088
      object Tagline: TJvEdit
        Left = 112
        Top = 32
        Width = 353
        Height = 21
        Modified = False
        MaxLength = 72
        TabOrder = 0
        Text = 'simply a tagline'
      end
      object JvStaticText11: TJvStaticText
        Left = 44
        Top = 36
        Width = 49
        Height = 17
        Caption = #1058#1072#1075#1083#1072#1081#1085':'
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
      object Tearline: TJvEdit
        Left = 112
        Top = 72
        Width = 353
        Height = 21
        Modified = False
        MaxLength = 72
        TabOrder = 2
        Text = '@LongPID @Version'
      end
      object Origin: TJvEdit
        Left = 112
        Top = 112
        Width = 353
        Height = 21
        Modified = False
        MaxLength = 55
        TabOrder = 3
        Text = 'my simple origin'
      end
      object JvStaticText12: TJvStaticText
        Left = 44
        Top = 76
        Width = 50
        Height = 17
        Caption = #1058#1080#1088#1083#1072#1081#1085':'
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
      object JvStaticText13: TJvStaticText
        Left = 44
        Top = 116
        Width = 53
        Height = 17
        Caption = #1054#1088#1080#1076#1078#1080#1085':'
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
        TabOrder = 5
        TextMargins.X = 0
        TextMargins.Y = 0
        WordWrap = False
      end
      object JvGroupBox3: TJvGroupBox
        Left = 16
        Top = 168
        Width = 257
        Height = 93
        Caption = ' '#1054#1087#1094#1080#1080' '
        TabOrder = 6
        object FixedFromAddr: TJvCheckBox
          Left = 13
          Top = 24
          Width = 239
          Height = 17
          Caption = #1047#1072#1087#1088#1077#1090#1080#1090#1100' '#1080#1079#1084#1077#1085#1077#1085#1080#1077' '#1072#1076#1088#1077#1089#1072' '#1086#1090#1087#1088#1072#1074#1080#1090#1077#1083#1103
          TabOrder = 0
          LinkedControls = <>
          HotTrackFont.Charset = RUSSIAN_CHARSET
          HotTrackFont.Color = clWindowText
          HotTrackFont.Height = -11
          HotTrackFont.Name = 'MS Sans Serif'
          HotTrackFont.Style = []
        end
        object ShowFooterPanel: TJvCheckBox
          Left = 13
          Top = 48
          Width = 207
          Height = 17
          Caption = #1055#1072#1085#1077#1083#1100' "'#1090#1072#1075#1083#1072#1081#1085'/'#1090#1080#1088#1083#1072#1081#1085'/'#1086#1088#1080#1076#1078#1080#1085'"'
          Checked = True
          State = cbChecked
          TabOrder = 1
          LinkedControls = <>
          HotTrackFont.Charset = RUSSIAN_CHARSET
          HotTrackFont.Color = clWindowText
          HotTrackFont.Height = -11
          HotTrackFont.Name = 'MS Sans Serif'
          HotTrackFont.Style = []
        end
      end
      object LAll: TJvStaticText
        Left = 20
        Top = 284
        Width = 123
        Height = 17
        Caption = #1040#1076#1088#1077#1089#1072#1090' '#1087#1086' '#1091#1084#1086#1083#1095#1072#1085#1080#1102':'
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
        TabOrder = 7
        TextMargins.X = 0
        TextMargins.Y = 0
        WordWrap = False
      end
      object EAll: TJvEdit
        Left = 152
        Top = 280
        Width = 121
        Height = 21
        Modified = False
        TabOrder = 8
        Text = 'All'
      end
      object JvGroupBox5: TJvGroupBox
        Left = 288
        Top = 168
        Width = 265
        Height = 241
        Caption = ' '#1054#1073#1083#1072#1089#1090#1080' '
        TabOrder = 9
        object LNetmail: TJvStaticText
          Left = 15
          Top = 20
          Width = 114
          Height = 17
          Caption = 'NetMail '#1087#1086' '#1091#1084#1086#1083#1095#1072#1085#1080#1102
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
          TabOrder = 0
          TextMargins.X = 0
          TextMargins.Y = 0
          WordWrap = False
        end
        object ENetMail: TJvComboBox
          Left = 16
          Top = 40
          Width = 169
          Height = 21
          AutoDropDown = True
          ItemHeight = 13
          TabOrder = 1
          Text = 'NETMAIL'
        end
        object CarbonAreas: TJvListBox
          Left = 16
          Top = 92
          Width = 233
          Height = 105
          ItemHeight = 13
          Background.FillMode = bfmTile
          Background.Visible = False
          TabOrder = 2
        end
        object CarbonAdd: TJvXPButton
          Left = 16
          Top = 208
          Caption = #1044#1086#1073#1072#1074#1080#1090#1100
          TabOrder = 3
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          OnClick = CarbonAddClick
        end
        object CarbonChg: TJvXPButton
          Left = 96
          Top = 208
          Caption = #1048#1079#1084#1077#1085#1080#1090#1100
          TabOrder = 4
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          OnClick = CarbonChgClick
        end
        object CarbonDel: TJvXPButton
          Left = 176
          Top = 208
          Caption = #1059#1076#1072#1083#1080#1090#1100
          TabOrder = 5
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          OnClick = CarbonDelClick
        end
        object JvStaticText8: TJvStaticText
          Left = 19
          Top = 68
          Width = 166
          Height = 17
          Caption = #1054#1090#1074#1077#1095#1072#1090#1100' '#1085#1072#1087#1088#1103#1084#1091#1102' '#1074' '#1086#1073#1083#1072#1089#1090#1103#1093':'
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
          TabOrder = 6
          TextMargins.X = 0
          TextMargins.Y = 0
          WordWrap = False
        end
      end
      object TaglineBrowse: TJvXPButton
        Left = 472
        Top = 32
        Caption = #1060#1072#1081#1083'...'
        TabOrder = 10
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        OnClick = TaglineBrowseClick
      end
      object TearlineBrowse: TJvXPButton
        Left = 472
        Top = 72
        Caption = #1060#1072#1081#1083'...'
        TabOrder = 11
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        OnClick = TearlineBrowseClick
      end
      object OriginBrowse: TJvXPButton
        Left = 472
        Top = 112
        Caption = #1060#1072#1081#1083'...'
        TabOrder = 12
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        OnClick = OriginBrowseClick
      end
    end
    object TemplatesPage: TJvStandardPage
      Left = 0
      Top = 0
      Width = 569
      Height = 429
      Caption = #1064#1072#1073#1083#1086#1085#1099
      object Template: TJvMemo
        Left = 0
        Top = 0
        Width = 569
        Height = 429
        AutoSize = False
        MaxLines = 0
        HideCaret = False
        Align = alClient
        Lines.Strings = (
          '; '#1084#1085#1086#1078#1077#1089#1090#1074#1077#1085#1085#1099#1077' '#1096#1072#1073#1083#1086#1085#1099' '#1073#1091#1076#1091#1090' '#1088#1077#1072#1083#1080#1079#1086#1074#1072#1085#1099' '#1074' '#1089#1083#1077#1076#1091#1102#1097#1077#1081' '#1074#1077#1088#1089#1080#1080
          ';'
          '@Moved*** '#1054#1090#1074#1077#1090' '#1085#1072' '#1087#1080#1089#1100#1084#1086' '#1074' @OEcho.'
          '@Moved'
          
            '@Forward========================================================' +
            '================='
          '@Forward* '#1060#1086#1088#1074#1072#1088#1076' '#1089#1076#1077#1083#1072#1085' @FName (@FAddr)'
          '@Forward* '#1040#1088#1080#1103' : @OEcho'
          '@Forward* '#1054#1090'   : @OName, @OAddr (@OTime)'
          '@Forward* '#1050#1086#1084#1091' : @DName'
          '@Forward* '#1058#1077#1084#1072' : @Subject'
          
            '@Forward========================================================' +
            '================='
          '@Forward@Message'
          
            '@Forward========================================================' +
            '================='
          #1055#1088#1080#1074#1077#1090', @TName!'
          ''
          '@Reply@OTime, @OName '#1087#1080#1089#1072#1083'('#1072') @DName'
          '@Position'
          '@Quote'
          ''
          #1044#1086' '#1085#1086#1074#1099#1093' '#1074#1089#1090#1088#1077#1095'! @FName')
        TabOrder = 0
      end
    end
    object ThemesPage: TJvStandardPage
      Left = 0
      Top = 0
      Width = 569
      Height = 429
      Caption = #1054#1092#1086#1088#1084#1083#1077#1085#1080#1077
      object JvGroupHeader1: TJvGroupHeader
        Left = 8
        Top = 16
        Width = 649
        Height = 17
        Caption = #1058#1077#1084#1099' '#1086#1092#1086#1088#1084#1083#1077#1085#1080#1103
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object JvGroupHeader4: TJvGroupHeader
        Left = 8
        Top = 112
        Width = 649
        Height = 17
        Caption = #1054#1087#1094#1080#1080
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Themes: TJvComboBox
        Left = 96
        Top = 48
        Width = 217
        Height = 21
        ItemHeight = 13
        ItemIndex = 0
        TabOrder = 0
        Text = 'default'
        Items.Strings = (
          'default')
      end
      object LoadBtn: TJvXPButton
        Left = 328
        Top = 48
        Width = 89
        Caption = #1047#1072#1075#1088#1091#1079#1080#1090#1100
        TabOrder = 1
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        OnClick = LoadBtnClick
      end
      object SaveBtn: TJvXPButton
        Left = 424
        Top = 48
        Width = 89
        Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
        TabOrder = 2
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        OnClick = SaveBtnClick
      end
      object ThemesBtn: TJvXPButton
        Left = 144
        Top = 80
        Width = 137
        Height = 25
        Caption = #1056#1077#1076#1072#1082#1090#1086#1088' '#1090#1077#1084'...'
        TabOrder = 3
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        OnClick = ThemesBtnClick
      end
      object ShowSmileys: TJvCheckBox
        Left = 13
        Top = 136
        Width = 141
        Height = 17
        Caption = #1043#1088#1072#1092#1080#1095#1077#1089#1082#1080#1077' '#1089#1084#1072#1081#1083#1080#1082#1080
        TabOrder = 4
        OnClick = ShowSmileysClick
        LinkedControls = <>
        HotTrackFont.Charset = RUSSIAN_CHARSET
        HotTrackFont.Color = clWindowText
        HotTrackFont.Height = -11
        HotTrackFont.Name = 'MS Sans Serif'
        HotTrackFont.Style = []
      end
    end
    object IgnorePage: TJvStandardPage
      Left = 0
      Top = 0
      Width = 569
      Height = 429
      Caption = #1048#1075#1085#1086#1088#1080#1088#1086#1074#1072#1085#1080#1077
      object JvLabel1: TJvLabel
        Left = 72
        Top = 16
        Width = 128
        Height = 13
        Caption = #1053#1077#1078#1077#1083#1072#1090#1077#1083#1100#1085#1099#1077' '#1072#1074#1090#1086#1088#1099':'
        HotTrackFont.Charset = RUSSIAN_CHARSET
        HotTrackFont.Color = clWindowText
        HotTrackFont.Height = -11
        HotTrackFont.Name = 'MS Sans Serif'
        HotTrackFont.Style = []
      end
      object JvLabel2: TJvLabel
        Left = 376
        Top = 16
        Width = 93
        Height = 13
        Caption = #1053#1072#1076#1086#1077#1074#1096#1080#1077' '#1090#1077#1084#1099':'
        HotTrackFont.Charset = RUSSIAN_CHARSET
        HotTrackFont.Color = clWindowText
        HotTrackFont.Height = -11
        HotTrackFont.Name = 'MS Sans Serif'
        HotTrackFont.Style = []
      end
      object NameAddBtn: TJvXPButton
        Left = 24
        Top = 266
        Caption = #1044#1086#1073#1072#1074#1080#1090#1100
        TabOrder = 0
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        OnClick = NameAddBtnClick
      end
      object NameChgBtn: TJvXPButton
        Left = 112
        Top = 266
        Caption = #1048#1079#1084#1077#1085#1080#1090#1100
        TabOrder = 1
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        OnClick = NameChgBtnClick
      end
      object NameDelBtn: TJvXPButton
        Left = 200
        Top = 266
        Caption = #1059#1076#1072#1083#1080#1090#1100
        TabOrder = 2
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        OnClick = NameDelBtnClick
      end
      object JvXPButton4: TJvXPButton
        Left = 296
        Top = 266
        Caption = #1044#1086#1073#1072#1074#1080#1090#1100
        TabOrder = 3
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        OnClick = JvXPButton4Click
      end
      object JvXPButton5: TJvXPButton
        Left = 384
        Top = 266
        Caption = #1048#1079#1084#1077#1085#1080#1090#1100
        TabOrder = 4
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        OnClick = JvXPButton5Click
      end
      object JvXPButton6: TJvXPButton
        Left = 472
        Top = 266
        Caption = #1059#1076#1072#1083#1080#1090#1100
        TabOrder = 5
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        OnClick = JvXPButton6Click
      end
      object TwitTo: TJvCheckBox
        Left = 16
        Top = 296
        Width = 131
        Height = 17
        Caption = #1042#1082#1083#1102#1095#1072#1103' '#1087#1086#1083#1091#1095#1072#1090#1077#1083#1077#1081
        Checked = True
        State = cbChecked
        TabOrder = 6
        LinkedControls = <>
        HotTrackFont.Charset = RUSSIAN_CHARSET
        HotTrackFont.Color = clWindowText
        HotTrackFont.Height = -11
        HotTrackFont.Name = 'MS Sans Serif'
        HotTrackFont.Style = []
      end
      object TwitKill: TJvCheckBox
        Left = 16
        Top = 320
        Width = 287
        Height = 17
        Caption = #1059#1076#1072#1083#1103#1090#1100' '#1073#1077#1079' '#1087#1086#1076#1090#1074#1077#1088#1078#1076#1077#1085#1080#1103' ('#1073#1091#1076#1077#1090' '#1074' '#1089#1083#1077#1076'. '#1074#1077#1088#1089#1080#1103#1093')'
        Enabled = False
        TabOrder = 7
        LinkedControls = <>
        HotTrackFont.Charset = RUSSIAN_CHARSET
        HotTrackFont.Color = clWindowText
        HotTrackFont.Height = -11
        HotTrackFont.Name = 'MS Sans Serif'
        HotTrackFont.Style = []
      end
      object TwitName: TJvListBox
        Left = 8
        Top = 32
        Width = 265
        Height = 225
        ItemHeight = 13
        Background.FillMode = bfmTile
        Background.Visible = False
        TabOrder = 8
      end
      object TwitSubj: TJvListBox
        Left = 288
        Top = 32
        Width = 265
        Height = 225
        ItemHeight = 13
        Background.FillMode = bfmTile
        Background.Visible = False
        TabOrder = 9
      end
    end
  end
  object OKButton: TJvXPButton
    Left = 296
    Top = 470
    Caption = 'OK'
    TabOrder = 2
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    OnClick = OKButtonClick
  end
  object CancelButton: TJvXPButton
    Left = 384
    Top = 470
    Caption = #1054#1090#1084#1077#1085#1072
    TabOrder = 3
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    OnClick = CancelButtonClick
  end
  object HelpButton: TJvXPButton
    Left = 472
    Top = 470
    Caption = #1057#1087#1088#1072#1074#1082#1072
    TabOrder = 4
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    OnClick = HelpButtonClick
  end
  object ActionList: TActionList
    Left = 552
    Top = 23
    object CheckAll: TAction
      Caption = 'CheckAll'
      OnExecute = CheckAllExecute
    end
  end
  object FormStorage: TJvFormStorage
    AppStorage = AppIniFileStorage
    AppStoragePath = 'SetupForm\'
    Options = [fpState, fpSize]
    OnSavePlacement = FormStorageSavePlacement
    OnRestorePlacement = FormStorageRestorePlacement
    StoredProps.Strings = (
      'Users.Items'
      'Users.ItemIndex'
      'FtnAddr.Items'
      'FtnAddr.ItemIndex'
      'RealName.Text'
      'BBToss.Checked'
      'HPT.Checked'
      'TosserConfig.Text'
      'Template.Lines'
      'Tagline.Text'
      'Tearline.Text'
      'Origin.Text'
      'EEchomailFlag.Text'
      'ENetmailFlag.Text'
      'ShowContacts.Checked'
      'ShowHintPanel.Checked'
      'TwitName.Items'
      'TwitSubj.Items'
      'TwitTo.Checked'
      'TwitKill.Checked'
      'AreasBBS.Checked'
      'EExportList.Text'
      'Partoss.Checked'
      'ShowToolBar.ItemIndex'
      'Nodelists.Items'
      'Pointlists.Items'
      'AreasOnClick.ItemIndex'
      'HLAreasUnread.Checked'
      'ShowRegion.Checked'
      'TreeFullExpand.Checked'
      'ShowSmileys.Checked'
      'ShowFooterPanel.Checked'
      'EAll.Text'
      'ENetMail.Text'
      'CarbonAreas.Items'
      'Rule1.ItemIndex'
      'Rule1Reverse.Checked'
      'Rule2.ItemIndex'
      'Rule2Reverse.Checked'
      'Rule3.ItemIndex'
      'Rule3Reverse.Checked'
      'CompileAtStart.Checked'
      'ShowFGHIaddr.Checked')
    StoredValues = <>
    Left = 24
    Top = 456
  end
  object TosserBrowseDlg: TJvOpenDialog
    Height = 0
    Width = 0
    Left = 520
    Top = 23
  end
  object AppIniFileStorage: TJvAppIniFileStorage
    StorageOptions.BooleanStringTrueValues = 'TRUE, YES, Y'
    StorageOptions.BooleanStringFalseValues = 'FALSE, NO, N'
    StorageOptions.SetAsString = True
    StorageOptions.FloatAsString = True
    StorageOptions.DefaultIfReadConvertError = True
    StorageOptions.PreserveLeadingTrailingBlanks = True
    FileName = 'config.ini'
    FlushOnDestroy = False
    DefaultSection = 'General'
    SubStorages = <>
    Left = 64
    Top = 456
  end
  object FlagsDialog: TJvSaveDialog
    Height = 0
    Width = 0
    Left = 488
    Top = 23
  end
  object ThemeStorage: TJvAppIniFileStorage
    StorageOptions.BooleanStringTrueValues = 'TRUE, YES, Y'
    StorageOptions.BooleanStringFalseValues = 'FALSE, NO, N'
    StorageOptions.DefaultIfValueNotExists = False
    FlushOnDestroy = False
    Location = flCustom
    DefaultSection = 'Theme'
    SubStorages = <>
    Left = 144
    Top = 424
  end
  object NodelistDialog: TJvOpenDialog
    Height = 0
    Width = 0
    Left = 104
    Top = 423
  end
  object LinesOpenDialog: TJvOpenDialog
    Options = [ofEnableSizing]
    Height = 0
    Width = 0
    Left = 464
    Top = 71
  end
end
