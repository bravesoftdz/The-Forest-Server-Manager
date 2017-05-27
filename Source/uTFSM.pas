unit uTFSM;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.ExtCtrls,
  Vcl.StdCtrls, DosCommand, Vcl.Samples.Spin, ShellAPI, WinSock, IniFiles,
  FileCtrl, Vcl.Menus, Tlhelp32, uOxideModInstaller, uSteamCMDinstaller, Vcl.Themes, ClipBrd;

type
  TForm1 = class(TForm)
    pnl1: TPanel;
    pnl2: TPanel;
    btn1: TButton;
    pgc1: TPageControl;
    tsconfig: TTabSheet;
    tssettings: TTabSheet;
    lbl1: TLabel;
    edtservername: TEdit;
    lbl2: TLabel;
    edtserverpass: TEdit;
    btn2: TButton;
    lbl3: TLabel;
    edtadminpassword: TEdit;
    btn3: TButton;
    lbl4: TLabel;
    sedmaxplayers: TSpinEdit;
    lbl5: TLabel;
    lbl6: TLabel;
    lbl7: TLabel;
    edtsteamtoken: TEdit;
    btn4: TButton;
    rginittype: TRadioGroup;
    rgdifficulty: TRadioGroup;
    grp1: TGroupBox;
    chkvac: TCheckBox;
    chklog: TCheckBox;
    lbl8: TLabel;
    lbl9: TLabel;
    lbl10: TLabel;
    grp2: TGroupBox;
    lbledtedtsteamport: TLabeledEdit;
    lbledtgameport: TLabeledEdit;
    lbledtqueryport: TLabeledEdit;
    btn5: TButton;
    grp4: TGroupBox;
    trckbr1: TTrackBar;
    grp5: TGroupBox;
    lbledtserveremail: TLabeledEdit;
    lbl11: TLabel;
    seautosave: TSpinEdit;
    lbl12: TLabel;
    sesaveslot: TSpinEdit;
    btn7: TButton;
    chkwithoutsteam: TCheckBox;
    lblipv4: TLabel;
    mm1: TMainMenu;
    utorials1: TMenuItem;
    Video1: TMenuItem;
    ext1: TMenuItem;
    ReportaBUG1: TMenuItem;
    tsinstaller: TTabSheet;
    pnl4: TPanel;
    mmoinstaller: TMemo;
    btn8: TButton;
    btn9: TButton;
    btn10: TButton;
    btn11: TButton;
    dscmnd1: TDosCommand;
    btncancel: TButton;
    lbl13: TLabel;
    lbl14: TLabel;
    Links1: TMenuItem;
    GetOxidePlugins1: TMenuItem;
    Checkforupdates1: TMenuItem;
    cbbthemelist: TComboBox;
    btn13: TButton;
    btn12: TButton;
    lbl15: TLabel;
    procedure btn2MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure btn2MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure btn3MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure btn3MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure btn4MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure btn4MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure OpenURL(URL: string);
    procedure lbl10Click(Sender: TObject);
    procedure trckbr1Change(Sender: TObject);
    procedure btn5Click(Sender: TObject);
    function GetLocalIP: string;
    procedure FormCreate(Sender: TObject);
    procedure LoadServerConfig;
    procedure btn7Click(Sender: TObject);
    procedure btn1Click(Sender: TObject);
    procedure btn8Click(Sender: TObject);
    procedure btn9Click(Sender: TObject);
    procedure mmoinstallerChange(Sender: TObject);
    function KillTask(ExeFileName: string): Integer;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btn10Click(Sender: TObject);
    procedure btncancelClick(Sender: TObject);
    procedure btn11Click(Sender: TObject);
    procedure Video1Click(Sender: TObject);
    procedure ext1Click(Sender: TObject);
    procedure ReportaBUG1Click(Sender: TObject);
    procedure GetOxidePlugins1Click(Sender: TObject);
    procedure Checkforupdates1Click(Sender: TObject);
    procedure cbbthemelistChange(Sender: TObject);
    procedure btn13Click(Sender: TObject);
    procedure btn12Click(Sender: TObject);
  private
    //
  public
    serverconfig, ini_serverconfig, steamcmdpath: string;
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.btn10Click(Sender: TObject);
var
  command: TStringList;
begin
  if FileExists('.\steamcmd\steamcmd.exe') then
    begin
      btncancel.Click;
      dscmnd1.Stop;
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

      dscmnd1.CommandLine := 'UpdateInstall.bat';
      dscmnd1.OutputLines := mmoinstaller.Lines;
      dscmnd1.Execute;
    end
  else
    ShowMessage('It seems that steamcmd is not installed. Please click Install SteamCMD below');
end;

procedure TForm1.btn11Click(Sender: TObject);
begin
  frmoxidemodinstaller.ShowModal;
end;

procedure TForm1.btn12Click(Sender: TObject);
begin
  frmsteamcmdinstaller.ShowModal;
end;

procedure TForm1.btncancelClick(Sender: TObject);
begin
  dscmnd1.Stop;
  KillTask('steamcmd.exe');
  mmoinstaller.Lines.Clear;
  mmoinstaller.Lines.Add('stopped')
end;

procedure TForm1.btn13Click(Sender: TObject);
begin
  mmoinstaller.Lines.SaveToFile('installer-log.log');
end;

procedure TForm1.btn1Click(Sender: TObject);
begin
  if chkwithoutsteam.Checked then
    if FileExists('TheForestDedicatedServer.exe') then
      WinExec('TheForestDedicatedServer.exe -nosteamclient', SW_SHOWNORMAL)
    else
      ShowMessage('Could not find TheForestDedicatedServer.exe')
  else
    if FileExists('TheForestDedicatedServer.exe') then
      WinExec('TheForestDedicatedServer.exe', SW_SHOWNORMAL)
    else
      ShowMessage('Could not find TheForestDedicatedServer.exe')
end;

procedure TForm1.btn2MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  edtserverpass.PasswordChar := #0;
end;

procedure TForm1.btn2MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  edtserverpass.PasswordChar := '*';
end;

procedure TForm1.btn3MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  edtadminpassword.PasswordChar := #0;
end;

procedure TForm1.btn3MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  edtadminpassword.PasswordChar := '*';
end;

procedure TForm1.btn4MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  edtsteamtoken.PasswordChar := #0;
end;

procedure TForm1.btn4MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  edtsteamtoken.PasswordChar := '*';
end;

procedure TForm1.btn5Click(Sender: TObject);
var
  config: TStringList;
  steamport, gameport, queryport: string;
  servername, maxplayers, vac, serverpass: string;
  adminpass, steamtoken, autosave, difficulty, inittype: string;
  saveslot, showlog, email: string;
  ini: TIniFile;
begin
  steamport := lbledtedtsteamport.Text;
  gameport := lbledtgameport.Text;
  queryport := lbledtqueryport.Text;
  servername := edtservername.Text;
  maxplayers := IntToStr(sedmaxplayers.Value);

  if chkvac.Checked then
    vac := 'on'
  else
    vac := 'off';

  serverpass := edtserverpass.Text;
  adminpass := edtadminpassword.Text;
  steamtoken := edtsteamtoken.Text;
  autosave := IntToStr(seautosave.Value);

  if rgdifficulty.ItemIndex = 0 then
    difficulty := 'Peaceful';
  if rgdifficulty.ItemIndex = 1 then
    difficulty := 'Normal';
  if rgdifficulty.ItemIndex = 2 then
    difficulty := 'Hard';

  if rginittype.ItemIndex = 0 then
    inittype := 'New';
  if rginittype.ItemIndex = 1 then
    inittype := 'Continue';

  saveslot := IntToStr(sesaveslot.Value);

  if chklog.Checked then
    showlog := 'on'
  else
    showlog := 'off';

  email := lbledtserveremail.Text;

  config := TStringList.Create;
  try
    config.Add('serverIP ' + GetLocalIP);
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

procedure TForm1.btn7Click(Sender: TObject);
var
  ini : TIniFile;
begin
  ini := TIniFile.Create(ini_serverconfig);
  try
    ini.WriteString('Transparency', 'AlphaBlendValue', IntToStr(AlphaBlendValue));
    ini.WriteString('Application Settings', 'Theme', cbbthemelist.Items[cbbthemelist.ItemIndex]);
  finally
    ini.Free;
  end;
end;

procedure TForm1.btn8Click(Sender: TObject);
var
  command: TStringList;
begin
  if FileExists('.\steamcmd\steamcmd.exe') then
    begin
      btncancel.Click;
      dscmnd1.Stop;
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

      dscmnd1.CommandLine := 'UpdateInstall.bat';
      dscmnd1.OutputLines := mmoinstaller.Lines;
      dscmnd1.Execute;
    end
  else
    ShowMessage('It seems that steamcmd is not installed. Please click Install SteamCMD below');
end;

procedure TForm1.btn9Click(Sender: TObject);
var
  command: TStringList;
begin
  if FileExists('.\steamcmd\steamcmd.exe') then
    begin
      btncancel.Click;
      dscmnd1.Stop;
      command:= TStringlist.create;
      try
        command.Clear;
        command.Add('@echo off');
        command.Add('echo Starting Update...');
        command.Add('.\steamcmd' + '\steamcmd.exe +login anonymous +force_install_dir "' + GetCurrentDir + '" +app_update 556450 +quit');
        command.Add('echo Done');
        command.SaveToFile('UpdateInstall.bat');
      finally
        command.Free
      end;

      dscmnd1.CommandLine := 'UpdateInstall.bat';
      dscmnd1.OutputLines := mmoinstaller.Lines;
      dscmnd1.Execute;
    end
  else
    ShowMessage('It seems that steamcmd is not installed. Please click Install SteamCMD below');
end;

procedure TForm1.cbbthemelistChange(Sender: TObject);
begin
  TStyleManager.SetStyle(cbbthemelist.Items[cbbthemelist.ItemIndex]);
end;

procedure TForm1.Checkforupdates1Click(Sender: TObject);
begin
  OpenURL('https://github.com/Inforcer25/The-Forest-Server-Manager/releases');
end;

procedure TForm1.ext1Click(Sender: TObject);
begin
  OpenURL('https://inforcer25.github.io/The-Forest-Server-Manager/');
end;

procedure TForm1.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  KillTask('steamcmd.exe');
  btncancel.Click;
 // btn5.Click;
 // btn7.Click;
end;

procedure TForm1.FormCreate(Sender: TObject);
var
  stylename: string;
begin
  Application.Title := 'The Forest Server Manager';
  Height := 595;
  Width := 910;

    if DirectoryExists(GetEnvironmentVariable('USERPROFILE') + '\AppData\LocalLow\SKS\TheForestDedicatedServer\ds') then
    serverconfig := GetEnvironmentVariable('USERPROFILE') + '\AppData\LocalLow\SKS\TheForestDedicatedServer\ds\Server.cfg'
  else
    begin
      ForceDirectories(GetEnvironmentVariable('USERPROFILE') + '\AppData\LocalLow\SKS\TheForestDedicatedServer\ds');
      serverconfig := GetEnvironmentVariable('USERPROFILE') + '\AppData\LocalLow\SKS\TheForestDedicatedServer\ds\Server.cfg'
    end;

  ini_serverconfig := GetEnvironmentVariable('APPDATA') + '\TheForestServerManager\serverconfig.ini';

  lblipv4.Caption := 'IPv4: ' + GetLocalIP;

  if DirectoryExists(GetEnvironmentVariable('APPDATA') + '\TheForestServerManager') then
    //
  else
    MkDir(GetEnvironmentVariable('APPDATA') + '\TheForestServerManager');

  LoadServerConfig;
end;

function TForm1.GetLocalIP: string;
type
  TaPInAddr = array [0..10] of PInAddr;
  PaPInAddr = ^TaPInAddr;
var
  phe : PHostEnt;
  pptr : PaPInAddr;
  Buffer : array [0..63] of AnsiChar;
  i : Integer;
  GInitData : TWSADATA;
begin
  WSAStartup($101, GInitData);
  Result := '';
  GetHostName(Buffer, SizeOf(Buffer));
  phe :=GetHostByName(buffer);
  if phe = nil then Exit;
  pptr := PaPInAddr(Phe^.h_addr_list);
  i := 0;
  while pptr^[i] <> nil do begin
    result:=StrPas(inet_ntoa(pptr^[i]^));
    Inc(i);
  end;
  WSACleanup;
end;

procedure TForm1.GetOxidePlugins1Click(Sender: TObject);
begin
  OpenURL('http://oxidemod.org/plugins/categories/the-forest.51/');
end;

function TForm1.KillTask(ExeFileName: string): Integer;
const
  PROCESS_TERMINATE = $0001;
var
  ContinueLoop: BOOL;
  FSnapshotHandle: THandle;
  FProcessEntry32: TProcessEntry32;
begin
  Result := 0;
  FSnapshotHandle := CreateToolhelp32Snapshot(TH32CS_SNAPPROCESS, 0);
  FProcessEntry32.dwSize := SizeOf(FProcessEntry32);
  ContinueLoop := Process32First(FSnapshotHandle, FProcessEntry32);

  while Integer(ContinueLoop) <> 0 do
  begin
    if ((UpperCase(ExtractFileName(FProcessEntry32.szExeFile)) =
      UpperCase(ExeFileName)) or (UpperCase(FProcessEntry32.szExeFile) =
      UpperCase(ExeFileName))) then
      Result := Integer(TerminateProcess(
                        OpenProcess(PROCESS_TERMINATE,
                                    BOOL(0),
                                    FProcessEntry32.th32ProcessID),
                                    0));
     ContinueLoop := Process32Next(FSnapshotHandle, FProcessEntry32);
  end;
  CloseHandle(FSnapshotHandle);
end;

procedure TForm1.lbl10Click(Sender: TObject);
begin
  ShowMessage('The appid for The Forest is 242760. It has been copied to your clipboard');
  Clipboard.AsText := '242760';
  OpenURL('https://steamcommunity.com/dev/managegameservers');
end;

procedure TForm1.LoadServerConfig;
var
  steamport, gameport, queryport: string;
  servername, maxplayers, vac, serverpass: string;
  adminpass, steamtoken, autosave, difficulty, inittype: string;
  saveslot, showlog, email, stylename, theme: string;
  ini: TIniFile;
begin
  if FileExists(ini_serverconfig) then
    begin
      ini := TIniFile.Create(ini_serverconfig);
      try
        steamport := ini.ReadString('Server Config', 'serverSteamPort', '8766');
        gameport := ini.ReadString('Server Config', 'serverGamePort', '27015');
        queryport := ini.ReadString('Server Config', 'serverQueryPort', '27016');
        servername := ini.ReadString('Server Config', 'serverName', '');
        maxplayers := ini.ReadString('Server Config', 'serverPlayers', '8');
        vac := ini.ReadString('Server Config', 'enableVAC', 'on');
        serverpass := ini.ReadString('Server Config', 'serverPassword', '');
        adminpass := ini.ReadString('Server Config', 'serverPasswordAdmin', '');
        steamtoken := ini.ReadString('Server Config', 'serverSteamAccount', '');
        autosave := ini.ReadString('Server Config', 'serverAutoSaveInterval', '30');
        difficulty := ini.ReadString('Server Config', 'difficulty', 'Normal');
        inittype := ini.ReadString('Server Config', 'initType', 'Continue');
        saveslot := ini.ReadString('Server Config', 'slot', '1');
        showlog := ini.ReadString('Server Config', 'showLogs', 'on');
        email := ini.ReadString('Server Config', 'serverContact', '');

        lbledtedtsteamport.Text := steamport;
        lbledtgameport.Text := gameport;
        lbledtqueryport.Text := queryport;
        edtservername.Text := servername;
        sedmaxplayers.Value := StrToInt(maxplayers);
        if vac = 'on' then
          chkvac.Checked := True
        else
          chkvac.Checked := False;
        edtserverpass.Text := serverpass;
        edtadminpassword.Text := adminpass;
        seautosave.Value := StrToInt(autosave);
        if difficulty = 'Peaceful' then
          rgdifficulty.ItemIndex := 0;
        if difficulty = 'Normal' then
          rgdifficulty.ItemIndex := 1;
        if difficulty = 'Hard' then
          rgdifficulty.ItemIndex := 2;
        if inittype = 'New' then
          rginittype.ItemIndex := 0;
        if inittype = 'Continue' then
          rginittype.ItemIndex := 1;
        sesaveslot.Value := StrToInt(saveslot);
        if showlog = 'on' then
          chklog.Checked := True
        else
          chklog.Checked := False;
        lbledtserveremail.Text := email;

        steamcmdpath := '.\steamcmd';
        AlphaBlendValue := StrToInt(ini.ReadString('Transparency', 'AlphaBlendValue', '255'));
        trckbr1.Position := AlphaBlendValue;

        TStyleManager.SetStyle(ini.ReadString('Application Settings', 'Theme', cbbthemelist.Items[cbbthemelist.ItemIndex]));

      finally
        ini.Free;
      end;
    end;

  for stylename in TStylemanager.StyleNames do
    begin
      cbbthemelist.Items.Add(stylename);
      cbbthemelist.ItemIndex := cbbthemelist.Items.IndexOf(TStyleManager.ActiveStyle.Name);
    end;
end;

procedure TForm1.mmoinstallerChange(Sender: TObject);
var
  lineNumber: Integer;
begin
  for lineNumber := 0 to mmoinstaller.lines.count-1 do
    if Pos( 'Done', mmoinstaller.lines[lineNumber] ) > 0 then
      begin
        KillTask('steamcmd.exe');
      end;
end;

procedure TForm1.OpenURL(URL: string);
begin
  ShellExecute(self.WindowHandle,'open',PChar(URL),nil,nil, SW_SHOWNORMAL);
end;

procedure TForm1.ReportaBUG1Click(Sender: TObject);
begin
  OpenURL('https://github.com/Inforcer25/The-Forest-Server-Manager/issues');
end;

procedure TForm1.trckbr1Change(Sender: TObject);
begin
  AlphaBlendValue := trckbr1.Position;
end;

procedure TForm1.Video1Click(Sender: TObject);
begin
  OpenURL('https://www.youtube.com/watch?v=k73XwYgzims');
end;

end.
