object AboutForm: TAboutForm
  Left = 377
  Top = 223
  BorderStyle = bsDialog
  Caption = #1054' '#1087#1088#1086#1075#1088#1072#1084#1084#1077
  ClientHeight = 255
  ClientWidth = 345
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsStayOnTop
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object LProduct: TJvLabel
    Left = 24
    Top = 25
    Width = 60
    Height = 16
    Caption = 'SimpleX'
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
  object LCredits: TJvHTLabel
    Left = 24
    Top = 56
    Width = 49
    Height = 17
    Caption = 'LCredits'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object JvPoweredByJVCL1: TJvPoweredByJVCL
    Left = 64
    Top = 160
    URL = 'http://homepages.borland.com/jedi/jvcl/PoweredByJVCL.htm'
  end
  object OkBtn: TJvXPButton
    Left = 144
    Top = 216
    Caption = 'OK'
    TabOrder = 0
    OnClick = OkBtnClick
  end
end
