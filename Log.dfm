object LogForm: TLogForm
  Left = 310
  Top = 136
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  Caption = 'Error Log'
  ClientHeight = 380
  ClientWidth = 441
  Color = clBtnFace
  Font.Charset = RUSSIAN_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 112
    Top = 16
    Width = 215
    Height = 16
    Caption = 'Oops!.. Something goes wrong:'
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object LogMemo: TJvMemo
    Left = 0
    Top = 48
    Width = 441
    Height = 273
    AutoSize = False
    MaxLines = 0
    HideCaret = False
    ReadOnly = True
    ScrollBars = ssBoth
    TabOrder = 0
    OnKeyPress = LogMemoKeyPress
  end
  object ContinueBtn: TButton
    Left = 88
    Top = 336
    Width = 81
    Height = 25
    Caption = '[>] Continue'
    TabOrder = 1
    OnClick = ContinueBtnClick
  end
  object CloseBtn: TButton
    Left = 184
    Top = 336
    Width = 81
    Height = 25
    Caption = '[x] Close App'
    TabOrder = 2
    OnClick = CloseBtnClick
  end
  object TerminateBtn: TButton
    Left = 280
    Top = 336
    Width = 81
    Height = 25
    Caption = '[X] HALT'
    TabOrder = 3
    OnClick = TerminateBtnClick
  end
end
