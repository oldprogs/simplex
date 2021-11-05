object EditForm: TEditForm
  Left = 285
  Top = 160
  BorderStyle = bsNone
  Caption = 'EditForm'
  ClientHeight = 444
  ClientWidth = 440
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object HeaderPanel: TJvPanel
    Left = 0
    Top = 0
    Width = 440
    Height = 81
    HotTrackFont.Charset = DEFAULT_CHARSET
    HotTrackFont.Color = clWindowText
    HotTrackFont.Height = -11
    HotTrackFont.Name = 'MS Sans Serif'
    HotTrackFont.Style = []
    Align = alTop
    TabOrder = 0
    object LFrom: TJvLabel
      Left = 8
      Top = 9
      Width = 26
      Height = 16
      Caption = #1054#1090':'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
      HotTrackFont.Charset = DEFAULT_CHARSET
      HotTrackFont.Color = clWindowText
      HotTrackFont.Height = -13
      HotTrackFont.Name = 'MS Sans Serif'
      HotTrackFont.Style = []
    end
    object LTo: TJvLabel
      Left = 8
      Top = 33
      Width = 44
      Height = 16
      Caption = #1050#1086#1084#1091':'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
      HotTrackFont.Charset = DEFAULT_CHARSET
      HotTrackFont.Color = clWindowText
      HotTrackFont.Height = -13
      HotTrackFont.Name = 'MS Sans Serif'
      HotTrackFont.Style = []
    end
    object LSubj: TJvLabel
      Left = 8
      Top = 57
      Width = 45
      Height = 16
      Caption = #1058#1077#1084#1072':'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
      HotTrackFont.Charset = DEFAULT_CHARSET
      HotTrackFont.Color = clWindowText
      HotTrackFont.Height = -13
      HotTrackFont.Name = 'MS Sans Serif'
      HotTrackFont.Style = []
    end
    object HMsgID: TJvLabel
      Left = 312
      Top = 53
      Width = 45
      Height = 16
      Caption = 'MSGID'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      Transparent = True
      Visible = False
      HotTrackFont.Charset = DEFAULT_CHARSET
      HotTrackFont.Color = clWindowText
      HotTrackFont.Height = -13
      HotTrackFont.Name = 'MS Sans Serif'
      HotTrackFont.Style = []
    end
    object EFrom: TEdit
      Left = 56
      Top = 8
      Width = 217
      Height = 21
      TabOrder = 0
      OnKeyDown = EKeyDown
    end
    object ETo: TEdit
      Left = 56
      Top = 32
      Width = 217
      Height = 21
      TabOrder = 2
      OnKeyDown = EKeyDown
    end
    object EToAddr: TEdit
      Left = 296
      Top = 32
      Width = 89
      Height = 21
      TabOrder = 3
      OnKeyDown = EKeyDown
    end
    object ESubj: TEdit
      Left = 56
      Top = 56
      Width = 329
      Height = 21
      TabOrder = 4
      OnKeyDown = EKeyDown
    end
    object EFromAddr: TComboBox
      Left = 296
      Top = 8
      Width = 89
      Height = 21
      ItemHeight = 13
      TabOrder = 1
      OnKeyDown = EKeyDown
    end
  end
  object MsgText: TJvRichEdit
    Left = 0
    Top = 110
    Width = 440
    Height = 266
    Align = alClient
    AutoURLDetect = False
    OLEDragDrop = False
    ScrollBars = ssVertical
    TabOrder = 2
    WantTabs = True
    OnKeyDown = MsgTextKeyDown
    OnKeyPress = MsgTextKeyPress
  end
  object FunctionsBar: TJvSpeedBar
    Left = 0
    Top = 81
    Width = 440
    Height = 29
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    Options = [sbAllowDrag, sbGrayedBtns, sbTransparentBtns]
    BtnOffsetHorz = 3
    BtnOffsetVert = 3
    BtnWidth = 24
    BtnHeight = 23
    Images = MainForm.Glyphs
    TabOrder = 1
    InternalVer = 1
    object JvSpeedBarSection1: TJvSpeedBarSection
    end
    object SaveMsg: TJvSpeedItem
      Action = SaveAction
      BtnCaption = #1057#1086#1093#1088#1072#1085#1080#1090#1100' '#1089#1086#1086#1073#1097#1077#1085#1080#1077
      Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100' '#1089#1086#1086#1073#1097#1077#1085#1080#1077
      Glyph.Data = {
        36040000424D3604000000000000360000002800000010000000100000000100
        2000000000000004000000000000000000000000000000000000FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF008E512B00B063
        3100BB703800BE773C00C17B4000C27E4200C2804500C3824700C3864900C386
        4A00C3874B00C3874B00C3874C00BD834900AC7440008E512B00A35D3100F8F3
        EE00F5ECE400FBF5F000FBF7F100FBF7F300FBF8F400FCF9F500FCF9F500FCF9
        F600FCF9F700FCFAF700FCFAF700F7F1EC00EAD9CC00AB764200BE6F3C00FCF9
        F500ECD0BC00F9E4D600FEECDF00FEEBDF00FEEBDE00FEEBDB00FEEBDC00FEEA
        DD00FDEADB00FDE8D800F8E0CD00EACBB300F3EBE300C78B5000C2764600FDFB
        F800F9E3D200ECCFB900F8E1D000FDE7D600F4D5BD00E9BFA000E9BFA200F4D3
        BD00FDE6D400F7DEC900EBCAB000F8DBC400F8F2EC00C98C5000C57D5000FDFB
        F900FDE9D800F9E1D000EBCAB300ECC5A700E3B69800F7E7DD00F7E8DE00E3B6
        9700ECC3A400EAC5A900F8DAC200FCDFC600F8F3ED00C88D5000C9865B00FDFB
        F900FDE8D700FDE6D400EDC6AB00DCAA8900F9ECE300FFFBF900FFFCFA00F9EE
        E600DCA88700EDBF9C00FCDBC000FCDBC000F8F3ED00C88C5000CC8E6600FDFB
        F900FDE5D300F1CCB200E3B59600F9EAE000FFF9F500FEF3EA00FEF4ED00FFFB
        F900F9EDE500E3B08D00F0C19E00FCD7B700F8F3ED00C88C5000D0967000FDFB
        F900F1CDB100E3B59600F9E9DE00FEF7F100FDEDE100FEEFE400FEF1E700FEF3
        EA00FFFAF700F9ECE300E2AE8A00F0BC9500F8F4EC00C88C5000D39D7B00FBF6
        F200E3B49600F9E8DC00FEF5EE00FDE9DA00FDEADC00FDECDE00FDEDE100FEEF
        E400FEF1E700FFFAF600F9EAE000E2AA8500F1E4D900C88C5000D7AB9100FDFA
        F800FCF5F100FFFCF900FFFCF900FFFCF900FFFCF900FFFCFA00FFFCFA00FFFC
        FA00FFFCFB00FFFDFB00FFFDFC00FBF6F300F8EFEA00AB774300C89A7C00D5A4
        8400D0977000CC8F6400CC8E6200CB8E6000CA8C5D00C98B5B00C88A5800C788
        5600C6865300C5845000C4824D00C1834D00B27948008E512B00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00}
      Hint = #1057#1086#1093#1088#1072#1085#1080#1090#1100' '#1089#1086#1086#1073#1097#1077#1085#1080#1077
      ImageIndex = 17
      ParentShowHint = False
      ShowHint = True
      Spacing = 1
      Left = 3
      Top = 3
      Visible = True
      OnClick = SaveActionExecute
      SectionName = ''
    end
    object JvSpeedItem1: TJvSpeedItem
      Action = InsertUUEAction
      BtnCaption = #1042#1089#1090#1072#1074#1080#1090#1100' '#1092#1072#1081#1083' '#1074' UUE'
      Caption = #1042#1089#1090#1072#1074#1080#1090#1100' '#1092#1072#1081#1083' '#1074' UUE'
      Glyph.Data = {
        36040000424D3604000000000000360000002800000010000000100000000100
        2000000000000004000000000000000000000000000000000000FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00552755002D2D
        2D0057575700FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF005D2B5D00FF00FF00FF00
        FF00B1B1B1005D5D5D00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00666666006C6C6C005555
        55001C1C1C00A7A7A70060606000FF00FF00FF00FF00FF00FF00B9664A00B966
        4A00BD713F00C0774200C37B4600C47E4800C4804B00A57F5F005E5E5E005F49
        3300C4894E003E362D008A7A690061616100B9736800B9736800AF724C00F8F3
        EE00F5ECE400FBF5F000FBF7F100FBF7F300FBF8F400FCF9F500CCCAC8006F6F
        6F00A8A7A700FCFAF7004C4C4B009795940060606000AA815800BE703D00FCF9
        F500ECD0BC00F9E4D600FEECDF00FEEBDF00FEEBDE00FEEBDB00FEEBDC00D5C8
        BF0070707000ACA49F00F8E0CD00554B44009C9893004F4D4A00C2764600FDFB
        F800F9E3D200ECCFB900F8E1D000FDE7D600F4D5BD00E9BFA000E9BFA200F4D3
        BD00D7C6BA007373730095908C00F8DBC400F8F2EC006A666200C57D5000FDFB
        F900FDE9D800F9E1D000EBCAB300ECC5A700E3B69800F7E7DD00F7E8DE00E3B6
        9700ECC3A400C8AF9B005B5B5B006767670063636300A77E5400C9865B00FDFB
        F900FDE8D700FDE6D400EDC6AB00DCAA8900F9ECE300FFFBF900FFFCFA00F9EE
        E600DCA88700EDBF9C00FCDBC000FCDBC000F8F3ED00C88C5000CC8E6600FDFB
        F900FDE5D300F1CCB200E3B59600F9EAE000FFF9F500FEF3EA00FEF4ED00FFFB
        F900F9EDE500E3B08D00F0C19E00FCD7B700F8F3ED00C88C5000D0967000FDFB
        F900F1CDB100E3B59600F9E9DE00FEF7F100FDEDE100FEEFE400FEF1E700FEF3
        EA00FFFAF700F9ECE300E2AE8A00F0BC9500F8F4EC00C88C5000D39D7C00FBF6
        F200E3B49600F9E8DC00FEF5EE00FDE9DA00FDEADC00FDECDE00FDEDE100FEEF
        E400FEF1E700FFFAF600F9EAE000E2AA8500F1E4D900C88C5100DCB7A000FDFA
        F800FCF5F100FFFCF900FFFCF900FFFCF900FFFCF900FFFCFA00FFFCFA00FFFC
        FA00FFFCFB00FFFDFB00FFFDFC00FBF6F300F8EFEA00B78A5E00DCB7A000D9A0
        9100D2977400CC8F6600CC8E6400CB8E6200CA8C5F00C98B5D00C88A5A00C788
        5800C6865500C5845200C5825000C5835800B78A5E00B78A5E00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00}
      Spacing = 1
      Left = 35
      Top = 3
      Visible = True
      OnClick = InsertUUEActionExecute
      SectionName = ''
    end
  end
  object FooterPanel: TJvPanel
    Left = 0
    Top = 376
    Width = 440
    Height = 68
    HotTrackFont.Charset = DEFAULT_CHARSET
    HotTrackFont.Color = clWindowText
    HotTrackFont.Height = -11
    HotTrackFont.Name = 'MS Sans Serif'
    HotTrackFont.Style = []
    FlatBorder = True
    Align = alBottom
    TabOrder = 3
    DesignSize = (
      440
      68)
    object LTagline: TJvLabel
      Left = 50
      Top = 4
      Width = 15
      Height = 16
      Caption = '...'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      Anchors = [akLeft, akRight, akBottom]
      ParentFont = False
      Transparent = True
      HotTrackFont.Charset = DEFAULT_CHARSET
      HotTrackFont.Color = clWindowText
      HotTrackFont.Height = -13
      HotTrackFont.Name = 'MS Sans Serif'
      HotTrackFont.Style = []
    end
    object LTearline: TJvLabel
      Left = 48
      Top = 28
      Width = 18
      Height = 16
      Caption = '---'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      Anchors = [akLeft, akRight, akBottom]
      ParentFont = False
      Transparent = True
      HotTrackFont.Charset = DEFAULT_CHARSET
      HotTrackFont.Color = clWindowText
      HotTrackFont.Height = -13
      HotTrackFont.Name = 'MS Sans Serif'
      HotTrackFont.Style = []
    end
    object LOrigin: TJvLabel
      Left = 8
      Top = 46
      Width = 58
      Height = 16
      Caption = '* Origin:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      Anchors = [akLeft, akRight, akBottom]
      ParentFont = False
      Transparent = True
      HotTrackFont.Charset = DEFAULT_CHARSET
      HotTrackFont.Color = clWindowText
      HotTrackFont.Height = -13
      HotTrackFont.Name = 'MS Sans Serif'
      HotTrackFont.Style = []
    end
    object JvLabel4: TJvLabel
      Left = 312
      Top = 53
      Width = 45
      Height = 16
      Caption = 'MSGID'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      Transparent = True
      Visible = False
      HotTrackFont.Charset = DEFAULT_CHARSET
      HotTrackFont.Color = clWindowText
      HotTrackFont.Height = -13
      HotTrackFont.Name = 'MS Sans Serif'
      HotTrackFont.Style = []
    end
    object EOrigin: TEdit
      Left = 71
      Top = 43
      Width = 370
      Height = 21
      Anchors = [akLeft, akRight, akBottom]
      BevelInner = bvNone
      BevelOuter = bvNone
      Ctl3D = True
      ParentCtl3D = False
      TabOrder = 0
      OnKeyDown = EKeyDown
    end
    object ETearline: TEdit
      Left = 71
      Top = 23
      Width = 370
      Height = 21
      Anchors = [akLeft, akRight, akBottom]
      BevelInner = bvNone
      BevelOuter = bvNone
      Ctl3D = True
      ParentCtl3D = False
      TabOrder = 1
      OnKeyDown = EKeyDown
    end
    object ETagline: TEdit
      Left = 71
      Top = 3
      Width = 370
      Height = 21
      Anchors = [akLeft, akRight, akBottom]
      BevelInner = bvNone
      BevelOuter = bvNone
      Ctl3D = True
      ParentCtl3D = False
      TabOrder = 2
      OnKeyDown = EKeyDown
    end
    object HideBtn: TJvImgBtn
      Left = 4
      Top = 1
      Width = 20
      Height = 19
      Hint = #1057#1082#1088#1099#1090#1100' '#1101#1090#1091' '#1087#1072#1085#1077#1083#1100
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 3
      OnClick = HideBtnClick
      Flat = True
      HotTrackFont.Charset = RUSSIAN_CHARSET
      HotTrackFont.Color = clWindowText
      HotTrackFont.Height = -11
      HotTrackFont.Name = 'MS Sans Serif'
      HotTrackFont.Style = []
      Images = MainForm.Glyphs
      ImageIndex = 26
    end
  end
  object EditActions: TActionList
    Images = MainForm.Glyphs
    Left = 408
    object SaveAction: TAction
      Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100' '#1089#1086#1086#1073#1097#1077#1085#1080#1077
      ImageIndex = 17
      ShortCut = 113
      OnExecute = SaveActionExecute
    end
    object InsertUUEAction: TAction
      Caption = #1042#1089#1090#1072#1074#1080#1090#1100' '#1092#1072#1081#1083' '#1074' UUE'
      ImageIndex = 16
      OnExecute = InsertUUEActionExecute
    end
  end
  object JvBalloonHint1: TJvBalloonHint
    CustomAnimationTime = 150
    DefaultBalloonPosition = bpRightDown
    DefaultIcon = ikNone
    ApplicationHintOptions = []
    Left = 408
    Top = 40
  end
  object InsertUUEDialog: TJvOpenDialog
    Options = [ofHideReadOnly, ofPathMustExist, ofFileMustExist, ofEnableSizing]
    ActiveStyle = asReport
    Height = 0
    Width = 0
    Left = 408
    Top = 81
  end
end
