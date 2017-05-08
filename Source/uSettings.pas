unit uSettings;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, inifiles,
  Vcl.ExtDlgs, FileCtrl;

type
  Tfrmsettings = class(TForm)
    pnl2: TPanel;
    grp2: TGroupBox;
    edt1: TEdit;
    lbl1: TLabel;
    btn1: TButton;
    btn2: TButton;
    btn3: TButton;
    lblstatus: TLabel;
    dlg1: TOpenTextFileDialog;
    procedure btn2Click(Sender: TObject);
    procedure btn1Click(Sender: TObject);
    procedure btn3Click(Sender: TObject);
    procedure edt1Change(Sender: TObject);
  private
    { Private declarations }
  public
    steamcmdpath: string;
    steamcmd: Boolean;
    ini_settings: string;
  end;

var
  frmsettings: Tfrmsettings;

implementation

{$R *.dfm}

procedure Tfrmsettings.btn1Click(Sender: TObject);
var
  ini: TIniFile;
begin
  if DirectoryExists(GetHomePath + '\TheForestServerManager\') then
    Begin
      ini := TIniFile.Create(ini_settings);

      try
        ini.WriteString('Locations', 'SteamCMD', steamcmdpath);
      finally
        ini.Free;
      end;

    End
  else
    begin
      MkDir(GetHomePath + '\TheForestServerManager\');

      ini := TIniFile.Create(ini_settings);

      try
        ini.WriteString('Locations', 'SteamCMD', steamcmdpath);
      finally
        ini.Free;
      end;
    end;

  Close;

end;

procedure Tfrmsettings.btn2Click(Sender: TObject);
begin
  Close;
end;

procedure Tfrmsettings.btn3Click(Sender: TObject);
begin
  if SelectDirectory('Select your steamcmd dir', '', steamcmdpath) then
    begin
      edt1.Text := steamcmdpath;
    end;
end;

procedure Tfrmsettings.edt1Change(Sender: TObject);
begin
  if FileExists(steamcmdpath + '\steamcmd.exe') then
    begin
      lblstatus.Caption := 'steamcmd.exe found!';
      lblstatus.Font.Color := clLime;
      steamcmd := True;
    end
  else
    begin
      lblstatus.Caption := 'Could not find steamcmd.exe';
      lblstatus.Font.Color := clRed;
      steamcmd := False;
    end;
end;

end.
