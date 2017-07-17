{
  ###                                                   #####  #######
  #  #    # ######  ####  #####   ####  ###### #####  #     # #
  #  ##   # #      #    # #    # #    # #      #    #       # #
  #  # #  # #####  #    # #    # #      #####  #    #  #####  ######
  #  #  # # #      #    # #####  #      #      #####  #             #
  #  #   ## #      #    # #   #  #    # #      #   #  #       #     #
  ### #    # #       ####  #    #  ####  ###### #    # #######  #####

  Follow me on Twitter for updates: https://twitter.com/inforcer25
  Subscribe to me on YouTube: https://www.youtube.com/Inforcer25
  GitHub: https://github.com/Inforcer25
  Donate to me: https://www.paypal.me/Inforcer25
}
unit uTFSM;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.ComCtrls,
  Vcl.Imaging.pngimage, uDownload, WinInet, Vcl.StdCtrls, uSteamCMDinstaller,
  uOxideModInstaller, DosCommand, Vcl.Samples.Spin, IniFiles;

type
  TForm1 = class(TForm)
    pnl1: TPanel;
    pnl2: TPanel;
    pgc1: TPageControl;
    tsserverconfig: TTabSheet;
    tsserverinstaller: TTabSheet;
    tswelcome: TTabSheet;
    lbl1: TLabel;
    mmoserverinstalllog: TMemo;
    btn1: TButton;
    btn2: TButton;
    btn3: TButton;
    dscmndserverinstaller: TDosCommand;
    btn4: TButton;
    btn5: TButton;
    btn6: TButton;
    img1: TImage;
    lbledtservername: TLabeledEdit;
    lbledtserverpass: TLabeledEdit;
    btn7: TButton;
    lbledtadminpass: TLabeledEdit;
    btn8: TButton;
    rginit: TRadioGroup;
    lbledtsteamtoken: TLabeledEdit;
    btn9: TButton;
    rgdifficulty: TRadioGroup;
    grpother: TGroupBox;
    lbledtemail: TLabeledEdit;
    chkvac: TCheckBox;
    chklogwindow: TCheckBox;
    lbl2: TLabel;
    sedsaveinterval: TSpinEdit;
    lbl3: TLabel;
    sedsaveslot: TSpinEdit;
    grp1: TGroupBox;
    lbl4: TLabel;
    edtsteamport: TEdit;
    lbl5: TLabel;
    edtgameport: TEdit;
    lbl6: TLabel;
    edtqueryport: TEdit;
    btn10: TButton;
    lbl7: TLabel;
    lbl8: TLabel;
    lblversion: TLabel;
    lbl9: TLabel;
    btn11: TButton;
    btn12: TButton;
    chkwithoutsteam: TCheckBox;
    lbl10: TLabel;
    sedmaxplayers: TSpinEdit;
    procedure FormActivate(Sender: TObject);
    function IsConnected: Boolean;
    procedure btn2Click(Sender: TObject);
    procedure btn3Click(Sender: TObject);
    procedure btn7MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure btn7MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure btn8MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure btn8MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure btn6Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btn11Click(Sender: TObject);
    procedure btn12Click(Sender: TObject);
    procedure btn1Click(Sender: TObject);
    procedure btn4Click(Sender: TObject);
    procedure btn5Click(Sender: TObject);
    procedure btn10Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.btn10Click(Sender: TObject);
var
  config: TStringList;
  steamport, gameport, queryport: string;
  servername, maxplayers, vac, serverpass: string;
  adminpass, steamtoken, autosave, difficulty, inittype: string;
  saveslot, showlog, email: string;
  ini: TIniFile;
begin
  steamport := edtsteamport.Text;
  gameport := edtgameport.Text;
  queryport := edtqueryport.Text;
  servername := lbledtservername.Text;
  maxplayers := IntToStr(sedmaxplayers.Value);

  if chkvac.Checked then
    vac := 'on'
  else
    vac := 'off';

  serverpass := lbledtserverpass.Text;
  adminpass := lbledtadminpass.Text;
  steamtoken := lbledtsteamtoken.Text;
  autosave := IntToStr(sedsaveinterval.Value);

  if rgdifficulty.ItemIndex = 0 then
    difficulty := 'Peaceful';
  if rgdifficulty.ItemIndex = 1 then
    difficulty := 'Normal';
  if rgdifficulty.ItemIndex = 2 then
    difficulty := 'Hard';

  if rginit.ItemIndex = 0 then
    inittype := 'New';
  if rginit.ItemIndex = 1 then
    inittype := 'Continue';

  saveslot := IntToStr(sedsaveslot.Value);

  if chklogwindow.Checked then
    showlog := 'on'
  else
    showlog := 'off';

  email := lbledtemail.Text;

  config := TStringList.Create;
  try
    config.Add('serverIP ' + '0.0.0.0');
    config.Add('serverSteamPort ' + steamport);
    config.Add('serverGamePort ' + gameport);
    config.Add('serverQueryPort ' + queryport);
    config.Add('serverName ' + servername);
    config.Add('serverPlayers ' + maxplayers);
    config.Add('enableVAC ' + vac);
    config.Add('serverPassword ' + serverpass);
    config.Add('serverPasswordAdmin ' + adminpass);
    config.Add('serverSteamAccount ' + steamtoken);
    config.Add('serverAutoSaveInterval ' + autosave);
    config.Add('difficulty ' + difficulty);
    config.Add('initType ' + inittype);
    config.Add('slot ' + saveslot);
    config.Add('showLogs ' + showlog);
    config.Add('serverContact ' + email);
    config.SaveToFile(serverconfig);
  finally
    config.Clear;
    config.Free;
  end;

  if DirectoryExists(GetEnvironmentVariable('APPDATA') + '\TheForestServerManager') then
    begin
      ini := TIniFile.Create(ini_serverconfig);
      try
        ini.WriteString('Server Config', 'serverIP', '0.0.0.0');
        ini.WriteString('Server Config', 'serverSteamPort', steamport);
        ini.WriteString('Server Config', 'serverGamePort', gameport);
        ini.WriteString('Server Config', 'serverQueryPort', queryport);
        ini.WriteString('Server Config', 'serverName', servername);
        ini.WriteString('Server Config', 'serverPlayers', maxplayers);
        ini.WriteString('Server Config', 'enableVAC', vac);
        ini.WriteString('Server Config', 'serverPassword', serverpass);
        ini.WriteString('Server Config', 'serverPasswordAdmin', adminpass);
        ini.WriteString('Server Config', 'serverSteamAccount', steamtoken);
        ini.WriteString('Server Config', 'serverAutoSaveInterval', autosave);
        ini.WriteString('Server Config', 'difficulty', difficulty);
        ini.WriteString('Server Config', 'initType', inittype);
        ini.WriteString('Server Config', 'slot', saveslot);
        ini.WriteString('Server Config', 'showLogs', showlog);
        ini.WriteString('Server Config', 'serverContact', email);
      finally
        ini.Free;
      end;
    end
  else
    begin
      MkDir(GetEnvironmentVariable('APPDATA') + '\TheForestServerManager');

      ini := TIniFile.Create(ini_serverconfig);
      try
        ini.WriteString('Server Config', 'serverIP', GetLocalIP);
        ini.WriteString('Server Config', 'serverSteamPort', steamport);
        ini.WriteString('Server Config', 'serverGamePort', gameport);
        ini.WriteString('Server Config', 'serverQueryPort', queryport);
        ini.WriteString('Server Config', 'serverName', servername);
        ini.WriteString('Server Config', 'serverPlayers', maxplayers);
        ini.WriteString('Server Config', 'enableVAC', vac);
        ini.WriteString('Server Config', 'serverPassword', serverpass);
        ini.WriteString('Server Config', 'serverPasswordAdmin', adminpass);
        ini.WriteString('Server Config', 'serverSteamAccount', steamtoken);
        ini.WriteString('Server Config', 'serverAutoSaveInterval', autosave);
        ini.WriteString('Server Config', 'difficulty', difficulty);
        ini.WriteString('Server Config', 'initType', inittype);
        ini.WriteString('Server Config', 'slot', saveslot);
        ini.WriteString('Server Config', 'showLogs', showlog);
        ini.WriteString('Server Config', 'serverContact', email);
      finally
        ini.Free;
      end;
    end;

  ShowMessage('Config has been saved');
end;

procedure TForm1.btn11Click(Sender: TObject);
begin
  if chkwithoutsteam.Checked then
    if FileExists('TheForestDedicatedServer.exe') then
      WinExec('TheForestDedicatedServer.exe -nosteamclient', SW_SHOWNORMAL)
    else
      ShowMessage('Could not find TheForestDedicatedServer.exe! Is the server installed?')
  else
    if FileExists('TheForestDedicatedServer.exe') then
      WinExec('TheForestDedicatedServer.exe', SW_SHOWNORMAL)
    else
      ShowMessage('Could not find TheForestDedicatedServer.exe! Is the server installed?');
end;

procedure TForm1.btn12Click(Sender: TObject);
begin
  lbledtservername.Clear;
  lbledtserverpass.Clear;
  lbledtadminpass.Clear;
  lbledtsteamtoken.Clear;
  lbledtemail.Clear;
  edtsteamport.Text := '8766';
  edtgameport.Text := '27015';
  edtqueryport.Text := '27016';
end;

procedure TForm1.btn1Click(Sender: TObject);
var
  command: TStringList;
begin
  dscmndserverinstaller.Stop;
  mmoserverinstalllog.Clear;
  if FileExists('.\steamcmd\steamcmd.exe') then
    begin
      command:= TStringlist.create;
      try
        command.Clear;
        command.Add('@echo off');
        command.Add('echo Starting Installation...');
        command.Add('.\steamcmd' + '\steamcmd.exe +login anonymous +force_install_dir "' + GetCurrentDir + '" +app_update 556450 +quit');
        command.Add('echo Done');
        command.SaveToFile('UpdateInstall.bat');
      finally
        command.Free
      end;

      dscmndserverinstaller.CommandLine := 'UpdateInstall.bat';
      dscmndserverinstaller.OutputLines := mmoserverinstalllog.Lines;
      dscmndserverinstaller.Execute;
    end
  else
    ShowMessage('It seems that steamcmd is not installed. Please click Install SteamCMD below');
end;

procedure TForm1.btn2Click(Sender: TObject);
begin
  frmsteamcmdinstaller.ShowModal;
end;

procedure TForm1.btn3Click(Sender: TObject);
begin
  frmoxidemodinstaller.ShowModal;
end;

procedure TForm1.btn4Click(Sender: TObject);
var
  command: TStringList;
begin
  dscmndserverinstaller.Stop;
  mmoserverinstalllog.Clear;
  if FileExists('.\steamcmd\steamcmd.exe') then
    begin
      command:= TStringlist.create;
      try
        command.Clear;
        command.Add('@echo off');
        command.Add('echo Starting Installation...');
        command.Add('.\steamcmd' + '\steamcmd.exe +login anonymous +force_install_dir "' + GetCurrentDir + '" +app_update 556450 +quit');
        command.Add('echo Done');
        command.SaveToFile('UpdateInstall.bat');
      finally
        command.Free
      end;

      dscmndserverinstaller.CommandLine := 'UpdateInstall.bat';
      dscmndserverinstaller.OutputLines := mmoserverinstalllog.Lines;
      dscmndserverinstaller.Execute;
    end
  else
    ShowMessage('It seems that steamcmd is not installed. Please click Install SteamCMD below');
end;

procedure TForm1.btn5Click(Sender: TObject);
var
  command: TStringList;
begin
  if FileExists('.\steamcmd\steamcmd.exe') then
    begin
      dscmndserverinstaller.Stop;
      mmoserverinstalllog.Clear;
      command:= TStringlist.create;
      try
        command.Clear;
        command.Add('@echo off');
        command.Add('echo Starting Validation DO NOT CLOSE THIS WINDOW!');
        command.Add('.\steamcmd' + '\steamcmd.exe +login anonymous +force_install_dir "' + GetCurrentDir + '" +app_update 556450 validate +quit');
        command.Add('echo Done');
        command.SaveToFile('UpdateInstall.bat');
      finally
        command.Free
      end;

      dscmndserverinstaller.CommandLine := 'UpdateInstall.bat';
      dscmndserverinstaller.OutputLines := mmoserverinstalllog.Lines;
      dscmndserverinstaller.Execute;
    end
  else
    ShowMessage('It seems that steamcmd is not installed. Please click Install SteamCMD below');
end;

procedure TForm1.btn6Click(Sender: TObject);
begin
  dscmndserverinstaller.Stop;
  if dscmndserverinstaller.IsRunning = True then
    ShowMessage('There was some kind of unknown error while trying to stop the current task. Please restart TFSM')
  else
    begin
      ShowMessage('Task has been stopped!');
      mmoserverinstalllog.Clear;
    end;
end;

procedure TForm1.btn7MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  lbledtserverpass.PasswordChar := #0;
end;

procedure TForm1.btn7MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  lbledtserverpass.PasswordChar := '*';
end;

procedure TForm1.btn8MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  lbledtadminpass.PasswordChar := #0;
end;

procedure TForm1.btn8MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  lbledtadminpass.PasswordChar := '*';
end;

procedure TForm1.FormActivate(Sender: TObject);
begin
  if FileExists('libeay32.dll') and FileExists('ssleay32.dll') then
    //
  else
    begin
      ShowMessage('TFSM needs 2 missing files to work. They will be downloaded after clicking ok. (Size: 1mb)');

      if IsConnected = True then
        frmextradownload.ShowModal
      else
        ShowMessage('Error: There is no internet connection!');
    end;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  Application.Title := 'The Forest Server Manager';
end;

function TForm1.IsConnected: Boolean;
const
  // Local system has a valid connection to the Internet, but it might or might
  // not be currently connected.
  INTERNET_CONNECTION_CONFIGURED = $40;

  // Local system uses a local area network to connect to the Internet.
  INTERNET_CONNECTION_LAN = $02;

  // Local system uses a modem to connect to the Internet
  INTERNET_CONNECTION_MODEM = $01;

  // Local system is in offline mode.
  INTERNET_CONNECTION_OFFLINE = $20;

  // Local system uses a proxy server to connect to the Internet
  INTERNET_CONNECTION_PROXY = $04;

  // Local system has RAS installed.
  INTERNET_RAS_INSTALLED = $10;

var
  InetState: DWORD;
  hHttpSession, hReqUrl: HInternet;
begin
  Result := InternetGetConnectedState(@InetState, 0);
  if (Result and (InetState and INTERNET_CONNECTION_CONFIGURED =
    INTERNET_CONNECTION_CONFIGURED)) then
  begin
    // so far we ONLY know there's a valid connection. See if we can grab some
    // known URL ...
    hHttpSession := InternetOpen(Pchar(Application.Title),
      // this line is the agent string
      INTERNET_OPEN_TYPE_PRECONFIG, nil, nil, 0);
    try
      hReqUrl := InternetOpenURL(hHttpSession,
        Pchar('41.185.91.51' { the URL to check } ), nil, 0, 0, 0);
      Result := hReqUrl <> nil;
      InternetCloseHandle(hReqUrl);
    finally
      InternetCloseHandle(hHttpSession);
    end;
  end
  else if (InetState and INTERNET_CONNECTION_OFFLINE =
    INTERNET_CONNECTION_OFFLINE) then
    Result := False; // we know for sure we are offline.
end;

end.
