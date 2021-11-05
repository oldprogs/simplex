object NodelistForm: TNodelistForm
  Left = 521
  Top = 218
  BorderStyle = bsDialog
  Caption = 'NodelistForm'
  ClientHeight = 398
  ClientWidth = 477
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object JvPanel1: TJvPanel
    Left = 0
    Top = 0
    Width = 477
    Height = 57
    HotTrackFont.Charset = DEFAULT_CHARSET
    HotTrackFont.Color = clWindowText
    HotTrackFont.Height = -11
    HotTrackFont.Name = 'MS Sans Serif'
    HotTrackFont.Style = []
    Align = alTop
    BevelOuter = bvLowered
    TabOrder = 0
    object ESearch: TJvEdit
      Left = 144
      Top = 16
      Width = 321
      Height = 21
      Modified = False
      TabOrder = 0
      OnChange = ESearchChange
      OnKeyPress = ESearchKeyPress
    end
    object LSearch: TJvStaticText
      Left = 16
      Top = 20
      Width = 114
      Height = 17
      Alignment = taRightJustify
      AutoSize = False
      Caption = #1055#1086#1080#1089#1082':'
      HotTrackFont.Charset = DEFAULT_CHARSET
      HotTrackFont.Color = clWindowText
      HotTrackFont.Height = -11
      HotTrackFont.Name = 'MS Sans Serif'
      HotTrackFont.Style = []
      Layout = tlTop
      TabOrder = 1
      TextMargins.X = 0
      TextMargins.Y = 0
      WordWrap = False
    end
  end
  object JvPanel2: TJvPanel
    Left = 0
    Top = 327
    Width = 477
    Height = 71
    HotTrackFont.Charset = DEFAULT_CHARSET
    HotTrackFont.Color = clWindowText
    HotTrackFont.Height = -11
    HotTrackFont.Name = 'MS Sans Serif'
    HotTrackFont.Style = []
    Align = alBottom
    BevelOuter = bvLowered
    TabOrder = 1
    object NdlInfo: TJvLabel
      Left = 16
      Top = 8
      Width = 7
      Height = 13
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      HotTrackFont.Charset = DEFAULT_CHARSET
      HotTrackFont.Color = clWindowText
      HotTrackFont.Height = -11
      HotTrackFont.Name = 'MS Sans Serif'
      HotTrackFont.Style = []
    end
    object NdlAInfo: TJvLabel
      Left = 16
      Top = 24
      Width = 5
      Height = 13
      HotTrackFont.Charset = DEFAULT_CHARSET
      HotTrackFont.Color = clWindowText
      HotTrackFont.Height = -11
      HotTrackFont.Name = 'MS Sans Serif'
      HotTrackFont.Style = []
    end
  end
  object Tree: TJvTreeView
    Left = 0
    Top = 57
    Width = 477
    Height = 270
    Align = alClient
    HideSelection = False
    Indent = 19
    MultiSelectStyle = [msSiblingOnly]
    ReadOnly = True
    RowSelect = True
    TabOrder = 2
    OnChange = TreeChange
    OnKeyPress = TreeKeyPress
    LineColor = 13160660
  end
end
