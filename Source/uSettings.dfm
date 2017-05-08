object frmsettings: Tfrmsettings
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Settings'
  ClientHeight = 173
  ClientWidth = 412
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -16
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  PixelsPerInch = 96
  TextHeight = 19
  object pnl2: TPanel
    Left = 0
    Top = 0
    Width = 412
    Height = 173
    Align = alClient
    TabOrder = 0
    ExplicitHeight = 177
    object grp2: TGroupBox
      Left = 8
      Top = 16
      Width = 393
      Height = 105
      Caption = 'Locations'
      TabOrder = 0
      object lbl1: TLabel
        Left = 16
        Top = 24
        Width = 88
        Height = 19
        Caption = 'Steam CMD:'
      end
      object lblstatus: TLabel
        Left = 16
        Top = 79
        Width = 58
        Height = 19
        Caption = 'lblstatus'
        StyleElements = [seClient, seBorder]
      end
      object edt1: TEdit
        Left = 16
        Top = 49
        Width = 329
        Height = 24
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        OnChange = edt1Change
      end
      object btn3: TButton
        Left = 351
        Top = 48
        Width = 33
        Height = 24
        Caption = '...'
        TabOrder = 1
        OnClick = btn3Click
      end
    end
    object btn1: TButton
      Left = 224
      Top = 127
      Width = 81
      Height = 33
      Caption = 'Save'
      TabOrder = 1
      OnClick = btn1Click
    end
    object btn2: TButton
      Left = 311
      Top = 127
      Width = 81
      Height = 33
      Caption = 'Close'
      TabOrder = 2
      OnClick = btn2Click
    end
  end
  object dlg1: TOpenTextFileDialog
    Left = 88
    Top = 120
  end
end
