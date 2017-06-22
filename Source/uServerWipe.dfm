object frmwipe: Tfrmwipe
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Server Wipe'
  ClientHeight = 244
  ClientWidth = 448
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -16
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 19
  object pnl1: TPanel
    Left = 0
    Top = 203
    Width = 448
    Height = 41
    Align = alBottom
    TabOrder = 0
    object btn1: TButton
      Left = 360
      Top = 6
      Width = 75
      Height = 27
      Caption = 'Cancel'
      TabOrder = 0
      OnClick = btn1Click
    end
    object btn2: TButton
      Left = 7
      Top = 6
      Width = 75
      Height = 27
      Caption = 'Wipe'
      TabOrder = 1
      OnClick = btn2Click
    end
    object chk1: TCheckBox
      Left = 107
      Top = 7
      Width = 233
      Height = 27
      Caption = 'I want my server to be wiped'
      TabOrder = 2
    end
  end
  object lst1: TListBox
    Left = 0
    Top = 41
    Width = 448
    Height = 162
    Align = alClient
    ItemHeight = 19
    TabOrder = 1
  end
  object pnl2: TPanel
    Left = 0
    Top = 0
    Width = 448
    Height = 41
    Align = alTop
    Caption = 'Select a server and click Wipe'
    TabOrder = 2
  end
end
