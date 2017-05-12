unit uTFSM;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls,
  Vcl.Imaging.pngimage, uSettings, inifiles, ShellAPI;

type
  Tfrmmain = class(TForm)
    pnl1: TPanel;
    mmo1: TMemo;
    pnl2: TPanel;
    img1: TImage;
    lbl1: TLabel;
    btnstart: TButton;
    btnupdate: TButton;
    btnsettings: TButton;
    btnsaveconfig: TButton;
    btnrefreshconfig: TButton;
    lbl2: TLabel;
    chk1: TCheckBox;
    lbl3: TLabel;
    lbl4: TLabel;
    procedure FormShow(Sender: TObject);
    procedure btnsettingsClick(Sender: TObject);
    procedure btnstartClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnrefreshconfigClick(Sender: TObject);
    procedure btnsaveconfigClick(Sender: TObject);
    procedure LoadSettings;
    procedure btnupdateClick(Sender: TObject);
    procedure lbl3Click(Sender: TObject);
    procedure OpenURL (url : string);
  private
    { Private declarations }
  public
    serverconf: string;
  end;

var
  frmmain: Tfrmmain;

implementation

{$R *.dfm}

procedure Tfrmmain.btnstartClick(Sender: TObject);
begin
  if chk1.Checked then
    WinExec('TheForestDedicatedServer.exe -nosteamclient', SW_SHOWNORMAL)
  else
    WinExec('TheForestDedicatedServer.exe', SW_SHOWNORMAL)
end;

procedure Tfrmmain.btnupdateClick(Sender: TObject);
var
  parameters: string;
  steamcmd: string;
begin
  steamcmd := frmsettings.steamcmdpath + '\steamcmd.exe';
  parameters := ' +login anonymous +force_install_dir "' + GetCurrentDir + '" +app_update 556450 +quit';
  ShellExecute(0, 'open', PChar(steamcmd), PChar(parameters), nil, SW_SHOW);
end;

procedure Tfrmmain.btnrefreshconfigClick(Sender: TObject);
begin
  mmo1.Lines.LoadFromFile(serverconf);
  ShowMessage('Server config reloaded!');
end;

procedure Tfrmmain.btnsaveconfigClick(Sender: TObject);
begin
  mmo1.Lines.SaveToFile(serverconf);
  ShowMessage('Server Config Saved!');
end;

procedure Tfrmmain.btnsettingsClick(Sender: TObject);
begin
  frmsettings.ShowModal;
end;

procedure Tfrmmain.FormCreate(Sender: TObject);
begin
  Application.Title := 'The Forest Server Manager';
  serverconf := GetEnvironmentVariable('USERPROFILE') + '\AppData\LocalLow\SKS\TheForestDedicatedServer\ds\Server.cfg';

  if FileExists('TheForestDedicatedServer.exe') then
    begin
      btnstart.Enabled := True;
      btnupdate.Enabled := True;
    end
  else
    begin
      ShowMessage('Error: Could not find "TheForestDedicatedServer.exe"' + #13 + #13 +  'Is the server manager in the same folder as the server?');
    end;

  if FileExists(serverconf) then
    mmo1.Lines.LoadFromFile(serverconf)
  else
    begin
      mmo1.Lines.Add('Error: Could not find "Server.cfg"');
      btnsaveconfig.Enabled := False;
      btnrefreshconfig.Enabled := False;
    end;

end;

procedure Tfrmmain.FormShow(Sender: TObject);
begin
  mmo1.SetFocus;
  LoadSettings;
end;

procedure Tfrmmain.lbl3Click(Sender: TObject);
begin
  OpenURL('https://github.com/Inforcer25/The-Forest-Server-Manager');
end;

procedure Tfrmmain.LoadSettings;
var
  ini: TIniFile;
begin
  frmsettings.ini_settings := GetHomePath + '\TheForestServerManager\settings.ini';
  if DirectoryExists(GetHomePath + '\TheForestServerManager\') then
    begin
      ini := TIniFile.Create(frmsettings.ini_settings);

      try
        frmsettings.steamcmdpath := ini.ReadString('Locations', 'SteamCMD', '');
        frmsettings.edt1.Text := frmsettings.steamcmdpath;
      finally
        ini.Free;
      end;

    end;

  if frmsettings.steamcmd = True then
    btnupdate.Enabled := True;

end;

procedure Tfrmmain.OpenURL(url: string);
begin
  ShellExecute(self.WindowHandle,'open',PChar(url),nil,nil, SW_SHOWNORMAL);
end;

end.
