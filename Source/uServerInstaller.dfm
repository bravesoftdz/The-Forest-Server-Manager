object frminstalleroption: Tfrminstalleroption
  Left = 0
  Top = 0
  BorderIcons = []
  BorderStyle = bsDialog
  Caption = 'Select  a branch for your server'
  ClientHeight = 218
  ClientWidth = 289
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -16
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 19
  object pnl1: TPanel
    Left = 0
    Top = 165
    Width = 289
    Height = 53
    Align = alBottom
    TabOrder = 0
    object btn1: TButton
      Left = 148
      Top = 6
      Width = 89
      Height = 41
      Caption = 'Cancel'
      TabOrder = 0
      OnClick = btn1Click
    end
    object btn2: TButton
      Left = 37
      Top = 6
      Width = 89
      Height = 41
      Caption = 'Install'
      TabOrder = 1
      OnClick = btn2Click
    end
  end
  object rg1: TRadioGroup
    Left = 0
    Top = 0
    Width = 289
    Height = 165
    Align = alClient
    Caption = 'Select Branch'
    Items.Strings = (
      'Normal (recommended)'
      'Staging'
      'Pre-Release')
    TabOrder = 1
  end
end
