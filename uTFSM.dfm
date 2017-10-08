object Form1: TForm1
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'The Forest Server Manager'
  ClientHeight = 677
  ClientWidth = 850
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -16
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnActivate = FormActivate
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 19
  object pnltop: TPanel
    Left = 0
    Top = 0
    Width = 850
    Height = 129
    Align = alTop
    Caption = 'The Forest Server Manager'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -96
    Font.Name = 'TheForest'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
  end
  object pnlleft: TPanel
    Left = 0
    Top = 129
    Width = 185
    Height = 548
    Align = alLeft
    TabOrder = 1
    object lbl1: TLabel
      Left = 8
      Top = 520
      Width = 47
      Height = 19
      Caption = 'v1.0 | '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object lblmadeby: TLabel
      Left = 8
      Top = 495
      Width = 138
      Height = 19
      Caption = 'Made by Inforcer25'
    end
    object lblversion: TLabel
      Left = 61
      Top = 520
      Width = 88
      Height = 19
      Caption = 'latestversion'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clLime
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      StyleElements = [seClient, seBorder]
    end
    object btnstartserver: TButton
      Left = 8
      Top = 6
      Width = 171
      Height = 59
      Caption = 'Start Server'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -37
      Font.Name = 'TheForest'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      OnClick = btnstartserverClick
    end
    object chkautorestart: TCheckBox
      Left = 8
      Top = 71
      Width = 113
      Height = 17
      Caption = 'Auto Restart'
      Checked = True
      State = cbChecked
      TabOrder = 1
    end
    object btnupdatetfsm: TButton
      Left = 8
      Top = 446
      Width = 171
      Height = 43
      Caption = 'Update Software'
      TabOrder = 2
      OnClick = btnupdatetfsmClick
    end
  end
  object pgctabs: TPageControl
    Left = 185
    Top = 129
    Width = 665
    Height = 548
    ActivePage = tsserverinstaller
    Align = alClient
    TabOrder = 2
    object tswelcome: TTabSheet
      Caption = 'Welcome'
      object lbl4: TLabel
        Left = 2
        Top = 3
        Width = 327
        Height = 57
        Caption = 
          'Welcome to The Forest Server Manager BETA.'#13#10#13#10'This documentation' +
          ' is yet to be finished.'
        WordWrap = True
      end
    end
    object tsserverinstaller: TTabSheet
      Caption = 'Server Config'
      ImageIndex = 2
      object lbledtservername: TLabeledEdit
        Left = 24
        Top = 40
        Width = 385
        Height = 27
        EditLabel.Width = 97
        EditLabel.Height = 19
        EditLabel.Caption = 'Server Name:'
        TabOrder = 0
        TextHint = 'This is my Forest Server'
      end
      object lbledtserverpassword: TLabeledEdit
        Left = 24
        Top = 96
        Width = 385
        Height = 27
        EditLabel.Width = 123
        EditLabel.Height = 19
        EditLabel.Caption = 'Server Password:'
        PasswordChar = '*'
        TabOrder = 1
        TextHint = 'Leave blank for no password'
      end
      object lbledtadminpassword: TLabeledEdit
        Left = 24
        Top = 152
        Width = 385
        Height = 27
        EditLabel.Width = 125
        EditLabel.Height = 19
        EditLabel.Caption = 'Admin Password:'
        PasswordChar = '*'
        TabOrder = 2
        Text = '12345678'
        TextHint = 'I am a awesome password'
      end
      object lbledtserverip: TLabeledEdit
        Left = 24
        Top = 264
        Width = 187
        Height = 27
        EditLabel.Width = 71
        EditLabel.Height = 19
        EditLabel.Caption = 'Server IP:'
        TabOrder = 3
        Text = '0.0.0.0'
        TextHint = '0.0.0.0'
      end
      object lbledtqueryport: TLabeledEdit
        Left = 222
        Top = 264
        Width = 187
        Height = 27
        EditLabel.Width = 83
        EditLabel.Height = 19
        EditLabel.Caption = 'Query Port:'
        TabOrder = 4
        Text = '27016'
        TextHint = '27016'
      end
      object lbledtgameport: TLabeledEdit
        Left = 24
        Top = 320
        Width = 187
        Height = 27
        EditLabel.Width = 81
        EditLabel.Height = 19
        EditLabel.Caption = 'Game Port:'
        TabOrder = 5
        Text = '27015'
        TextHint = '27015'
      end
      object lbledtsteamport: TLabeledEdit
        Left = 222
        Top = 320
        Width = 187
        Height = 27
        EditLabel.Width = 84
        EditLabel.Height = 19
        EditLabel.Caption = 'Steam Port:'
        TabOrder = 6
        Text = '27016'
        TextHint = '27016'
      end
      object lbledtcontactemail: TLabeledEdit
        Left = 24
        Top = 208
        Width = 385
        Height = 27
        EditLabel.Width = 103
        EditLabel.Height = 19
        EditLabel.Caption = 'Contact Email:'
        TabOrder = 7
        TextHint = 'email@domain.com'
      end
      object grpserversettings: TGroupBox
        Left = 24
        Top = 353
        Width = 385
        Height = 158
        Caption = 'Server Settings'
        TabOrder = 8
        object lblautosave: TLabel
          Left = 220
          Top = 26
          Width = 98
          Height = 19
          Caption = 'Save Interval:'
        end
        object lblmaxplayers: TLabel
          Left = 14
          Top = 26
          Width = 89
          Height = 19
          Caption = 'Max Players:'
        end
        object lblsaveslot: TLabel
          Left = 124
          Top = 26
          Width = 71
          Height = 19
          Caption = 'Save Slot:'
        end
        object lbldifficulty: TLabel
          Left = 14
          Top = 86
          Width = 68
          Height = 19
          Caption = 'Difficulty:'
        end
        object lblinittype: TLabel
          Left = 188
          Top = 86
          Width = 70
          Height = 19
          Caption = 'Init Type:'
        end
        object sedmaxplayers: TSpinEdit
          Left = 14
          Top = 51
          Width = 58
          Height = 29
          MaxValue = 100
          MinValue = 1
          TabOrder = 0
          Value = 8
        end
        object sedsaveinterval: TSpinEdit
          Left = 220
          Top = 51
          Width = 58
          Height = 29
          MaxValue = 9999
          MinValue = 15
          TabOrder = 1
          Value = 0
        end
        object sedsaveslot: TSpinEdit
          Left = 124
          Top = 51
          Width = 58
          Height = 29
          MaxLength = 1
          MaxValue = 5
          MinValue = 1
          TabOrder = 2
          Value = 1
        end
        object cbbdifficulty: TComboBox
          Left = 14
          Top = 111
          Width = 145
          Height = 27
          Style = csDropDownList
          ItemIndex = 1
          TabOrder = 3
          Text = 'Normal'
          Items.Strings = (
            'Peaceful'
            'Normal'
            'Hard')
        end
        object cbbinittype: TComboBox
          Left = 188
          Top = 111
          Width = 145
          Height = 27
          Style = csDropDownList
          ItemIndex = 0
          TabOrder = 4
          Text = 'New'
          Items.Strings = (
            'New'
            'Continue')
        end
      end
      object grpmisc: TGroupBox
        Left = 415
        Top = 13
        Width = 239
        Height = 408
        Caption = 'Other Settings'
        TabOrder = 9
        object lbl5: TLabel
          Left = 5
          Top = 27
          Width = 83
          Height = 18
          Caption = 'Log Window:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object lbl6: TLabel
          Left = 5
          Top = 52
          Width = 32
          Height = 18
          Caption = 'VAC:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object lbl7: TLabel
          Left = 5
          Top = 77
          Width = 87
          Height = 18
          Caption = 'Vegan Mode:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object lbl8: TLabel
          Left = 5
          Top = 102
          Width = 115
          Height = 18
          Caption = 'Vegetarian Mode:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object lbl9: TLabel
          Left = 5
          Top = 127
          Width = 123
          Height = 18
          Caption = 'Reset Holes Mode:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object lbltreeregrowmode: TLabel
          Left = 5
          Top = 152
          Width = 130
          Height = 18
          Caption = 'Tree Regrow Mode:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object lbl10: TLabel
          Left = 5
          Top = 177
          Width = 143
          Height = 18
          Caption = 'NoBuildingDestruction:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object lbl11: TLabel
          Left = 5
          Top = 202
          Width = 143
          Height = 18
          Caption = 'AllowEnemiesCreative:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object tglswtchlogwindow: TToggleSwitch
          Left = 160
          Top = 27
          Width = 73
          Height = 19
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          SwitchHeight = 19
          TabOrder = 0
        end
        object tglswtchvac: TToggleSwitch
          Left = 160
          Top = 52
          Width = 73
          Height = 19
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          SwitchHeight = 19
          TabOrder = 1
        end
        object tglswtchveganmode: TToggleSwitch
          Left = 160
          Top = 77
          Width = 73
          Height = 19
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          SwitchHeight = 19
          TabOrder = 2
        end
        object tglswtchvegatarianmode: TToggleSwitch
          Left = 160
          Top = 102
          Width = 73
          Height = 19
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          SwitchHeight = 19
          TabOrder = 3
        end
        object tglswtchresetholesmode: TToggleSwitch
          Left = 160
          Top = 127
          Width = 73
          Height = 19
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          SwitchHeight = 19
          TabOrder = 4
        end
        object tglswtchtreeregrowmode: TToggleSwitch
          Left = 160
          Top = 152
          Width = 73
          Height = 19
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          SwitchHeight = 19
          TabOrder = 5
        end
        object tglswtchnobuildingdestruction: TToggleSwitch
          Left = 160
          Top = 177
          Width = 73
          Height = 19
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          SwitchHeight = 19
          TabOrder = 6
        end
        object tglswtchallowenemiescreative: TToggleSwitch
          Left = 160
          Top = 202
          Width = 73
          Height = 19
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          SwitchHeight = 19
          TabOrder = 7
        end
      end
      object btnsaveconfig: TButton
        Left = 415
        Top = 427
        Width = 239
        Height = 83
        Caption = 'Save Config'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -48
        Font.Name = 'TheForest'
        Font.Style = []
        ParentFont = False
        TabOrder = 10
        OnClick = btnsaveconfigClick
      end
    end
    object tsserverconfig: TTabSheet
      Caption = 'Server Installer'
      ImageIndex = 1
      object lblinstallerlog: TLabel
        Left = 3
        Top = 3
        Width = 83
        Height = 19
        Caption = 'SteamCMD:'
      end
      object mmosteamcmd: TMemo
        Left = 2
        Top = 28
        Width = 652
        Height = 89
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
      end
      object btninstallserver: TButton
        Left = 3
        Top = 123
        Width = 220
        Height = 49
        Caption = 'Install / Update Server'
        TabOrder = 1
        OnClick = btninstallserverClick
      end
      object btninstalloxidemod: TButton
        Left = 2
        Top = 271
        Width = 206
        Height = 49
        Caption = 'Install / Update Oxidemod'
        TabOrder = 2
        OnClick = btninstalloxidemodClick
      end
      object btninstallsteamcmd: TButton
        Left = 2
        Top = 216
        Width = 206
        Height = 49
        Caption = 'Install SteamCMD'
        TabOrder = 3
        OnClick = btninstallsteamcmdClick
      end
      object btnverifyserverfiles: TButton
        Left = 229
        Top = 123
        Width = 213
        Height = 49
        Caption = 'Verify Server Files'
        Enabled = False
        TabOrder = 4
        Visible = False
      end
      object btnstopinstall: TButton
        Left = 448
        Top = 123
        Width = 206
        Height = 49
        Caption = 'Stop (Can Continue)'
        TabOrder = 5
        OnClick = btnstopinstallClick
      end
    end
    object tspluginmanager: TTabSheet
      Caption = 'Plugin Manager'
      ImageIndex = 4
      object lbl2: TLabel
        Left = 223
        Top = 248
        Width = 211
        Height = 39
        Caption = 'Coming Soon'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -32
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
    end
    object tssettings: TTabSheet
      Caption = 'Application Settings'
      ImageIndex = 3
      object lbl3: TLabel
        Left = 223
        Top = 248
        Width = 211
        Height = 39
        Caption = 'Coming Soon'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -32
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
    end
  end
  object doscmdsteamcmd: TDosCommand
    InputToOutput = False
    MaxTimeAfterBeginning = 0
    MaxTimeAfterLastOutput = 0
    Left = 29
    Top = 71
  end
  object idhtplatestversion: TIdHTTP
    AllowCookies = True
    ProxyParams.BasicAuthentication = False
    ProxyParams.ProxyPort = 0
    Request.ContentLength = -1
    Request.ContentRangeEnd = -1
    Request.ContentRangeStart = -1
    Request.ContentRangeInstanceLength = -1
    Request.Accept = 'text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8'
    Request.BasicAuthentication = False
    Request.UserAgent = 'Mozilla/3.0 (compatible; Indy Library)'
    Request.Ranges.Units = 'bytes'
    Request.Ranges = <>
    HTTPOptions = [hoForceEncodeParams]
    Left = 740
    Top = 492
  end
end
