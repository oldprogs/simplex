object ViewForm: TViewForm
  Left = 360
  Top = 143
  BorderStyle = bsNone
  Caption = 'ViewForm'
  ClientHeight = 521
  ClientWidth = 556
  Color = clWhite
  Font.Charset = RUSSIAN_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnPaint = FormPaint
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object ViewSplitter: TJvOutlookSplitter
    Left = 0
    Top = 153
    Width = 556
    Align = alTop
    MinSize = 1
    OnMoved = ViewSplitterMoved
    ColorFrom = 13026246
    ColorTo = 9211532
    StyleManager = MainForm.StyleMgr
    ParentStyleManager = False
    OnDblClick = ViewSplitterDblClick
  end
  object MsgList: TJvListView
    Left = 0
    Top = 0
    Width = 556
    Height = 153
    Align = alTop
    BorderStyle = bsNone
    Columns = <
      item
        Caption = 'Msg #'
        Width = 44
      end
      item
        Caption = #1054#1090
        Width = 150
      end
      item
        Caption = #1050#1086#1084#1091
        Width = 150
      end
      item
        Caption = #1058#1077#1084#1072
        Width = 215
      end
      item
        Caption = #1044#1072#1090#1072
        Width = 150
      end>
    ColumnClick = False
    OwnerData = True
    OwnerDraw = True
    ReadOnly = True
    RowSelect = True
    TabOrder = 0
    ViewStyle = vsReport
    OnData = MsgListData
    OnDrawItem = MsgListDrawItem
    OnKeyDown = MsgListKeyDown
    OnKeyPress = MsgListKeyPress
    OnMouseMove = MsgListMouseMove
    OnSelectItem = MsgListSelectItem
    AutoSelect = False
    ColumnsOrder = '0=44,1=150,2=150,3=215,4=150'
    OnMouseEnter = MsgListMouseEnter
    ExtendedColumns = <
      item
      end
      item
      end
      item
      end
      item
      end
      item
      end>
  end
  object MsgText: TJvRichEdit
    Left = 0
    Top = 361
    Width = 556
    Height = 160
    AdvancedTypography = False
    Align = alClient
    AutoAdvancedTypography = False
    AutoURLDetect = False
    AutoVerbMenu = False
    BorderStyle = bsNone
    ClipboardCommands = [caCopy]
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    LangOptions = []
    OLEDragDrop = False
    ParentFont = False
    ReadOnly = True
    ScrollBars = ssVertical
    StreamFormat = sfRichText
    StreamMode = [smSelection, smUnicode]
    TabOrder = 1
    OnKeyDown = MsgTextKeyDown
    OnKeyPress = MsgListKeyPress
    OnMouseMove = MsgTextMouseMove
    OnMouseWheel = MsgTextMouseWheel
    OnURLClick = MsgTextURLClick
    OnMouseEnter = MsgTextMouseEnter
  end
  object HeaderPanel: TJvPanel
    Left = 0
    Top = 160
    Width = 556
    Height = 88
    HotTrackFont.Charset = DEFAULT_CHARSET
    HotTrackFont.Color = clWindowText
    HotTrackFont.Height = -11
    HotTrackFont.Name = 'MS Sans Serif'
    HotTrackFont.Style = []
    OnMouseEnter = HeaderPanelMouseEnter
    Align = alTop
    TabOrder = 2
    OnMouseMove = HeaderPanelMouseMove
    object LFrom: TJvStaticText
      Left = 8
      Top = 26
      Width = 27
      Height = 20
      Caption = #1054#1090':'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      HotTrackFont.Charset = DEFAULT_CHARSET
      HotTrackFont.Color = clWindowText
      HotTrackFont.Height = -13
      HotTrackFont.Name = 'MS Sans Serif'
      HotTrackFont.Style = []
      Layout = tlTop
      ParentFont = False
      TabOrder = 8
      TextMargins.X = 0
      TextMargins.Y = 0
      WordWrap = False
    end
    object LTo: TJvStaticText
      Left = 8
      Top = 45
      Width = 45
      Height = 20
      Caption = #1050#1086#1084#1091':'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      HotTrackFont.Charset = DEFAULT_CHARSET
      HotTrackFont.Color = clWindowText
      HotTrackFont.Height = -13
      HotTrackFont.Name = 'MS Sans Serif'
      HotTrackFont.Style = []
      Layout = tlTop
      ParentFont = False
      TabOrder = 9
      TextMargins.X = 0
      TextMargins.Y = 0
      WordWrap = False
    end
    object LSubj: TJvStaticText
      Left = 8
      Top = 64
      Width = 46
      Height = 20
      Caption = #1058#1077#1084#1072':'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      HotTrackFont.Charset = DEFAULT_CHARSET
      HotTrackFont.Color = clWindowText
      HotTrackFont.Height = -13
      HotTrackFont.Name = 'MS Sans Serif'
      HotTrackFont.Style = []
      Layout = tlTop
      ParentFont = False
      TabOrder = 10
      TextMargins.X = 0
      TextMargins.Y = 0
      WordWrap = False
    end
    object VRefer: TJvStaticText
      Left = 104
      Top = 5
      Width = 7
      Height = 16
      Cursor = crHandPoint
      Hint = 'Exit|Quits the application'
      AutoSize = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsUnderline]
      HotTrackFont.Charset = DEFAULT_CHARSET
      HotTrackFont.Color = clWindowText
      HotTrackFont.Height = -13
      HotTrackFont.Name = 'MS Sans Serif'
      HotTrackFont.Style = []
      Layout = tlTop
      ParentFont = False
      TabOrder = 11
      TextMargins.X = 0
      TextMargins.Y = 0
      WordWrap = False
      OnClick = VRepliesClick
    end
    object VPar: TJvStaticText
      Left = 128
      Top = 5
      Width = 7
      Height = 16
      Cursor = crHandPoint
      Hint = 'Exit|Quits the application'
      AutoSize = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsUnderline]
      HotTrackFont.Charset = DEFAULT_CHARSET
      HotTrackFont.Color = clWindowText
      HotTrackFont.Height = -13
      HotTrackFont.Name = 'MS Sans Serif'
      HotTrackFont.Style = []
      Layout = tlTop
      ParentFont = False
      TabOrder = 12
      TextMargins.X = 0
      TextMargins.Y = 0
      WordWrap = False
      OnMouseDown = VParMouseDown
    end
    object VSubj: TJvStaticText
      Left = 56
      Top = 64
      Width = 4
      Height = 4
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      HotTrackFont.Charset = RUSSIAN_CHARSET
      HotTrackFont.Color = clWindowText
      HotTrackFont.Height = -13
      HotTrackFont.Name = 'MS Sans Serif'
      HotTrackFont.Style = []
      Layout = tlTop
      ParentFont = False
      TabOrder = 0
      TextMargins.X = 0
      TextMargins.Y = 0
      WordWrap = False
    end
    object VTo: TJvStaticText
      Left = 56
      Top = 45
      Width = 4
      Height = 4
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      HotTrackFont.Charset = RUSSIAN_CHARSET
      HotTrackFont.Color = clWindowText
      HotTrackFont.Height = -13
      HotTrackFont.Name = 'MS Sans Serif'
      HotTrackFont.Style = []
      Layout = tlTop
      ParentFont = False
      TabOrder = 1
      TextMargins.X = 0
      TextMargins.Y = 0
      WordWrap = False
    end
    object VFrom: TJvStaticText
      Left = 56
      Top = 26
      Width = 4
      Height = 4
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      HotTrackFont.Charset = RUSSIAN_CHARSET
      HotTrackFont.Color = clWindowText
      HotTrackFont.Height = -13
      HotTrackFont.Name = 'MS Sans Serif'
      HotTrackFont.Style = []
      Layout = tlTop
      ParentFont = False
      TabOrder = 2
      TextMargins.X = 0
      TextMargins.Y = 0
      WordWrap = False
    end
    object VToAddr: TJvStaticText
      Left = 360
      Top = 45
      Width = 4
      Height = 4
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      HotTrackFont.Charset = RUSSIAN_CHARSET
      HotTrackFont.Color = clWindowText
      HotTrackFont.Height = -13
      HotTrackFont.Name = 'MS Sans Serif'
      HotTrackFont.Style = []
      Layout = tlTop
      ParentFont = False
      TabOrder = 3
      TextMargins.X = 0
      TextMargins.Y = 0
      WordWrap = False
    end
    object VFromAddr: TJvStaticText
      Left = 360
      Top = 26
      Width = 4
      Height = 4
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      HotTrackFont.Charset = RUSSIAN_CHARSET
      HotTrackFont.Color = clWindowText
      HotTrackFont.Height = -13
      HotTrackFont.Name = 'MS Sans Serif'
      HotTrackFont.Style = []
      Layout = tlTop
      ParentFont = False
      TabOrder = 4
      TextMargins.X = 0
      TextMargins.Y = 0
      WordWrap = False
    end
    object VDateTime: TJvStaticText
      Left = 360
      Top = 5
      Width = 4
      Height = 4
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      HotTrackFont.Charset = RUSSIAN_CHARSET
      HotTrackFont.Color = clWindowText
      HotTrackFont.Height = -13
      HotTrackFont.Name = 'MS Sans Serif'
      HotTrackFont.Style = []
      Layout = tlTop
      ParentFont = False
      TabOrder = 5
      TextMargins.X = 0
      TextMargins.Y = 0
      WordWrap = False
    end
    object VNum: TJvStaticText
      Left = 20
      Top = 5
      Width = 25
      Height = 20
      Caption = '0/0'
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      HotTrackFont.Charset = RUSSIAN_CHARSET
      HotTrackFont.Color = clWindowText
      HotTrackFont.Height = -13
      HotTrackFont.Name = 'MS Sans Serif'
      HotTrackFont.Style = []
      Layout = tlTop
      ParentFont = False
      TabOrder = 6
      TextMargins.X = 0
      TextMargins.Y = 0
      WordWrap = False
    end
    object LNum: TJvStaticText
      Left = 8
      Top = 5
      Width = 12
      Height = 20
      Caption = '#'
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      HotTrackFont.Charset = RUSSIAN_CHARSET
      HotTrackFont.Color = clWindowText
      HotTrackFont.Height = -13
      HotTrackFont.Name = 'MS Sans Serif'
      HotTrackFont.Style = []
      Layout = tlTop
      ParentFont = False
      TabOrder = 7
      TextMargins.X = 0
      TextMargins.Y = 0
      WordWrap = False
    end
    object DebugLabel: TJvStaticText
      Left = 440
      Top = 60
      Width = 4
      Height = 4
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      HotTrackFont.Charset = DEFAULT_CHARSET
      HotTrackFont.Color = clWindowText
      HotTrackFont.Height = -13
      HotTrackFont.Name = 'MS Sans Serif'
      HotTrackFont.Style = []
      Layout = tlTop
      ParentFont = False
      TabOrder = 13
      TextMargins.X = 0
      TextMargins.Y = 0
      Visible = False
      WordWrap = False
    end
  end
  object SeeAlsoBox: TJvListBox
    Left = 0
    Top = 248
    Width = 121
    Height = 97
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ItemHeight = 16
    Background.FillMode = bfmTile
    Background.Visible = False
    ParentFont = False
    ScrollBars = ssNone
    TabOrder = 3
    Visible = False
    OnClick = SeeAlsoBoxClick
    OnKeyDown = SeeAlsoBoxKeyDown
    OnMouseMove = SeeAlsoBoxMouseMove
    OnMouseEnter = SeeAlsoBoxMouseEnter
  end
  object TwitBox: TJvGroupBox
    Left = 0
    Top = 336
    Width = 556
    Height = 193
    Align = alCustom
    TabOrder = 4
    Visible = False
    object TwitWarning: TJvStaticText
      Left = 32
      Top = 32
      Width = 164
      Height = 17
      Caption = #1069#1090#1086' '#1085#1077#1078#1077#1083#1072#1090#1077#1083#1100#1085#1086#1077' '#1089#1086#1086#1073#1097#1077#1085#1080#1077
      HotTrackFont.Charset = RUSSIAN_CHARSET
      HotTrackFont.Color = clWindowText
      HotTrackFont.Height = -11
      HotTrackFont.Name = 'MS Sans Serif'
      HotTrackFont.Style = []
      Layout = tlTop
      TabOrder = 0
      TextMargins.X = 0
      TextMargins.Y = 0
      WordWrap = False
    end
    object ReadBtn: TJvXPButton
      Left = 32
      Top = 64
      Caption = #1055#1088#1086#1095#1080#1090#1072#1090#1100
      TabOrder = 1
      OnClick = ReadBtnClick
    end
    object DeleteBtn: TJvXPButton
      Left = 120
      Top = 64
      Caption = #1059#1076#1072#1083#1080#1090#1100
      TabOrder = 2
      OnClick = DeleteBtnClick
    end
  end
  object SearchBox: TJvGroupBox
    Left = 0
    Top = 248
    Width = 556
    Height = 113
    Align = alTop
    TabOrder = 5
    Visible = False
    object LSearch: TJvStaticText
      Left = 24
      Top = 32
      Width = 44
      Height = 17
      Caption = #1048#1089#1082#1072#1090#1100':'
      HotTrackFont.Charset = RUSSIAN_CHARSET
      HotTrackFont.Color = clWindowText
      HotTrackFont.Height = -11
      HotTrackFont.Name = 'MS Sans Serif'
      HotTrackFont.Style = []
      Layout = tlTop
      TabOrder = 0
      TextMargins.X = 0
      TextMargins.Y = 0
      WordWrap = False
    end
    object SearchBtn: TJvXPButton
      Left = 72
      Top = 64
      Caption = #1055#1086#1080#1089#1082
      Enabled = False
      TabOrder = 1
      OnClick = SearchBtnClick
    end
    object SearchCancelBtn: TJvXPButton
      Left = 160
      Top = 64
      Caption = #1054#1090#1084#1077#1085#1072
      TabOrder = 2
      OnClick = SearchCancelBtnClick
    end
    object ESearch: TJvEdit
      Left = 72
      Top = 28
      Width = 161
      Height = 21
      Modified = False
      TabOrder = 3
      OnChange = ESearchChange
      OnKeyPress = ESearchKeyPress
    end
    object SOptFromFirst: TJvRadioButton
      Left = 256
      Top = 16
      Width = 180
      Height = 17
      Alignment = taLeftJustify
      Caption = #1074#1086' '#1074#1089#1077#1093' '#1089#1086#1086#1073#1097#1077#1085#1080#1103#1093', '#1089' '#1087#1077#1088#1074#1086#1075#1086
      TabOrder = 4
      OnClick = SOptFromFirstClick
      HotTrackFont.Charset = RUSSIAN_CHARSET
      HotTrackFont.Color = clWindowText
      HotTrackFont.Height = -11
      HotTrackFont.Name = 'MS Sans Serif'
      HotTrackFont.Style = []
      LinkedControls = <>
    end
    object SOptFromCurrent: TJvRadioButton
      Left = 256
      Top = 32
      Width = 187
      Height = 17
      Alignment = taLeftJustify
      Caption = #1074#1086' '#1074#1089#1077#1093' '#1089#1086#1086#1073#1097#1077#1085#1080#1103#1093', '#1089' '#1090#1077#1082#1091#1097#1077#1075#1086
      TabOrder = 5
      OnClick = SOptFromFirstClick
      HotTrackFont.Charset = RUSSIAN_CHARSET
      HotTrackFont.Color = clWindowText
      HotTrackFont.Height = -11
      HotTrackFont.Name = 'MS Sans Serif'
      HotTrackFont.Style = []
      LinkedControls = <>
    end
    object SOptOnlyHeader: TJvCheckBox
      Left = 256
      Top = 72
      Width = 207
      Height = 17
      Caption = #1090#1086#1083#1100#1082#1086' '#1074' '#1079#1072#1075#1086#1083#1086#1074#1086#1082#1077' ('#1086#1090'/'#1082#1086#1084#1091'/'#1090#1077#1084#1072')'
      Enabled = False
      TabOrder = 6
      LinkedControls = <>
      HotTrackFont.Charset = RUSSIAN_CHARSET
      HotTrackFont.Color = clWindowText
      HotTrackFont.Height = -11
      HotTrackFont.Name = 'MS Sans Serif'
      HotTrackFont.Style = []
    end
    object SOptOnlyCurrent: TJvRadioButton
      Left = 256
      Top = 48
      Width = 173
      Height = 17
      Alignment = taLeftJustify
      Caption = #1090#1086#1083#1100#1082#1086' '#1074' '#1090#1077#1082#1091#1097#1077#1084' '#1089#1086#1086#1073#1097#1077#1085#1080#1080
      Checked = True
      TabOrder = 7
      TabStop = True
      OnClick = SOptOnlyCurrentClick
      HotTrackFont.Charset = RUSSIAN_CHARSET
      HotTrackFont.Color = clWindowText
      HotTrackFont.Height = -11
      HotTrackFont.Name = 'MS Sans Serif'
      HotTrackFont.Style = []
      LinkedControls = <>
    end
  end
  object ActionList1: TActionList
    Left = 520
    Top = 168
    object Action1: TAction
      Caption = 'Action1'
      OnExecute = Action1Execute
    end
    object Action2: TAction
      Caption = 'Action2'
      OnExecute = Action2Execute
    end
    object Action3: TAction
      Caption = 'Action3'
      OnExecute = Action3Execute
    end
    object Action4: TAction
      Caption = 'Action4'
      OnExecute = Action4Execute
    end
    object Action5: TAction
      Caption = 'Action5'
      OnExecute = Action5Execute
    end
    object Action6: TAction
      Caption = 'Action6'
      OnExecute = Action6Execute
    end
    object Action7: TAction
      Caption = 'Action7'
      OnExecute = Action7Execute
    end
    object Action8: TAction
      Caption = 'Action8'
      OnExecute = Action8Execute
    end
    object Action9: TAction
      Caption = 'Action9'
    end
    object Action10: TAction
      Caption = 'Action10'
    end
    object Action11: TAction
      Caption = 'Action11'
    end
    object Action12: TAction
      Caption = 'Action12'
    end
    object Action13: TAction
      Caption = 'Action13'
    end
    object Action14: TAction
      Caption = 'Action14'
    end
    object Action15: TAction
      Caption = 'Action15'
    end
    object ShowTree: TAction
      Caption = 'ShowTree'
      ShortCut = 119
      OnExecute = ShowTreeExecute
    end
  end
  object JvRichEditToHtml: TJvRichEditToHtml
    Header.Strings = (
      '<HTML>'
      '  <HEAD>'
      '    <TITLE><#TITLE></TITLE>'
      '  </HEAD>'
      '  <BODY>')
    Footer.Strings = (
      '  </BODY>'
      '</HTML>')
    Left = 464
    Top = 168
  end
  object Timer1: TTimer
    Enabled = False
    Interval = 10
    OnTimer = Timer1Timer
    Left = 5
    Top = 251
  end
end
