object frminstaller: Tfrminstaller
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'The Forest Server Installer/Updater'
  ClientHeight = 392
  ClientWidth = 687
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -16
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 19
  object pnl1: TPanel
    Left = 0
    Top = 0
    Width = 193
    Height = 392
    Align = alLeft
    TabOrder = 0
    object btn1: TButton
      Left = 32
      Top = 16
      Width = 129
      Height = 65
      Caption = 'Install'
      TabOrder = 0
      OnClick = btn1Click
    end
    object btn2: TButton
      Left = 32
      Top = 96
      Width = 129
      Height = 65
      Caption = 'Update'
      TabOrder = 1
      OnClick = btn2Click
    end
    object btn3: TButton
      Left = 32
      Top = 304
      Width = 129
      Height = 65
      Caption = 'Close'
      TabOrder = 2
      OnClick = btn3Click
    end
    object btn4: TButton
      Left = 32
      Top = 176
      Width = 129
      Height = 65
      Caption = 'Validate'
      TabOrder = 3
      OnClick = btn4Click
    end
  end
  object mmo1: TMemo
    Left = 193
    Top = 0
    Width = 494
    Height = 392
    Align = alClient
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    ReadOnly = True
    TabOrder = 1
  end
  object dscmnd1: TDosCommand
    InputToOutput = False
    MaxTimeAfterBeginning = 0
    MaxTimeAfterLastOutput = 0
    Left = 280
    Top = 96
  end
end
