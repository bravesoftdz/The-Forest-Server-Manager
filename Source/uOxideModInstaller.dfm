object frmoxidemod: Tfrmoxidemod
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'OxideMod Installer'
  ClientHeight = 204
  ClientWidth = 458
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -21
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  PixelsPerInch = 96
  TextHeight = 25
  object lbl1: TLabel
    Left = 0
    Top = 0
    Width = 458
    Height = 50
    Align = alTop
    Alignment = taCenter
    Caption = 
      'To start the installation press the button below.  It will downl' +
      'oad and install oxidemod'
    WordWrap = True
    ExplicitWidth = 425
  end
  object lblStatus: TLabel
    Left = 8
    Top = 58
    Width = 36
    Height = 16
    Caption = 'Status'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object lbl2: TLabel
    Left = 0
    Top = 168
    Width = 458
    Height = 36
    Align = alBottom
    Alignment = taCenter
    Caption = 
      'You need to reinstall Oxide after updating/Validating the server' +
      #13#10
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    ExplicitTop = 186
    ExplicitWidth = 409
  end
  object btn1: TButton
    Left = 145
    Top = 103
    Width = 169
    Height = 49
    Caption = 'Install/Reinstall'
    TabOrder = 0
    OnClick = btn1Click
  end
  object pb1: TProgressBar
    Left = 8
    Top = 80
    Width = 433
    Height = 17
    TabOrder = 1
  end
end
