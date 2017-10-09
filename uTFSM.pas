unit uTFSM;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.ComCtrls,
  Vcl.StdCtrls,
  Vcl.Buttons, uOxideModInstaller, uSteamCMDinstaller, uNeededFilesDownloader,
  IniFiles, DosCommand, Tlhelp32, Vcl.Samples.Spin, Vcl.WinXCtrls,
  IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient, IdHTTP, ShellAPI,
  Vcl.Themes;

type
  Tfrmmain = class(TForm)
    pnltop: TPanel;
    pnlleft: TPanel;
    pgctabs: TPageControl;
    tswelcome: TTabSheet;
    tsserverconfig: TTabSheet;
    tsserverinstaller: TTabSheet;
    tssettings: TTabSheet;
    lblinstallerlog: TLabel;
    mmosteamcmd: TMemo;
    btninstallserver: TButton;
    btninstalloxidemod: TButton;
    btninstallsteamcmd: TButton;
    btnverifyserverfiles: TButton;
    btnstopinstall: TButton;
    doscmdsteamcmd: TDosCommand;
    lbl1: TLabel;
    lblmadeby: TLabel;
    lblversion: TLabel;
    tspluginmanager: TTabSheet;
    lbl2: TLabel;
    lbl4: TLabel;
    lbledtservername: TLabeledEdit;
    lbledtserverpassword: TLabeledEdit;
    lbledtadminpassword: TLabeledEdit;
    lbledtserverip: TLabeledEdit;
    lbledtqueryport: TLabeledEdit;
    lbledtgameport: TLabeledEdit;
    lbledtsteamport: TLabeledEdit;
    lbledtcontactemail: TLabeledEdit;
    grpserversettings: TGroupBox;
    sedmaxplayers: TSpinEdit;
    lblautosave: TLabel;
    sedsaveinterval: TSpinEdit;
    lblmaxplayers: TLabel;
    lblsaveslot: TLabel;
    sedsaveslot: TSpinEdit;
    lbldifficulty: TLabel;
    cbbdifficulty: TComboBox;
    lblinittype: TLabel;
    cbbinittype: TComboBox;
    grpmisc: TGroupBox;
    lbl5: TLabel;
    tglswtchlogwindow: TToggleSwitch;
    lbl6: TLabel;
    tglswtchvac: TToggleSwitch;
    lbl7: TLabel;
    tglswtchveganmode: TToggleSwitch;
    lbl8: TLabel;
    tglswtchvegatarianmode: TToggleSwitch;
    lbl9: TLabel;
    tglswtchresetholesmode: TToggleSwitch;
    lbltreeregrowmode: TLabel;
    tglswtchtreeregrowmode: TToggleSwitch;
    lbl10: TLabel;
    tglswtchnobuildingdestruction: TToggleSwitch;
    lbl11: TLabel;
    tglswtchallowenemiescreative: TToggleSwitch;
    btnsaveconfig: TButton;
    btnstartserver: TButton;
    chkautorestart: TCheckBox;
    idhtplatestversion: TIdHTTP;
    btnupdatetfsm: TButton;
    btnreporterror: TButton;
    btngithub: TButton;
    btnwebsite: TButton;
    lblinstructions: TLabel;
    lbl12: TLabel;
    lbl13: TLabel;
    mmo1: TMemo;
    grptheme: TGroupBox;
    cbbtheme: TComboBox;
    grptransparency: TGroupBox;
    trckbrtransparency: TTrackBar;
    tsautobackup: TTabSheet;
    lbl3: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure btninstallsteamcmdClick(Sender: TObject);
    procedure btninstalloxidemodClick(Sender: TObject);
    procedure CheckNeededFiles;
    procedure FormActivate(Sender: TObject);
    procedure SaveSettingString(Section, Name, Value: string);
    function LoadSettingString(Section, Name, Value: string): string;
    procedure btninstallserverClick(Sender: TObject);
    procedure CleanUp;
    function KillTask(ExeFileName: string): Integer;
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure btnstopinstallClick(Sender: TObject);
    procedure btnsaveconfigClick(Sender: TObject);
    procedure LoadAllSettings;
    procedure btnstartserverClick(Sender: TObject);
    function GetLatestVersion: string;
    procedure OpenURL(URL: string);
    procedure btnupdatetfsmClick(Sender: TObject);
    procedure btnreporterrorClick(Sender: TObject);
    procedure btngithubClick(Sender: TObject);
    procedure btnwebsiteClick(Sender: TObject);
    procedure btnverifyserverfilesClick(Sender: TObject);
    procedure cbbthemeChange(Sender: TObject);
    procedure LoadThemeList;
    procedure trckbrtransparencyChange(Sender: TObject);
    procedure pgctabsChange(Sender: TObject);
  private
    // Global
    ini_settings: string;

    // Server Config
    servername, serverpassword, adminpassword, contactemail, serverip,
      queryport, gameport, steamport, difficulty, inittype,

      logwindow, vac, veganmode, vegatarianmode, resetholesmode, treeregrowmode,
      nobuildingdestruction, allowenemiescreative: string;

    maxplayers, saveslot, saveinterval: Integer;
  public
    { Public declarations }
  end;

var
  frmmain: Tfrmmain;

implementation

{$R *.dfm}

procedure Tfrmmain.btngithubClick(Sender: TObject);
begin
  OpenURL('https://github.com/Inforcer25/The-Forest-Server-Manager/');
end;

procedure Tfrmmain.btninstalloxidemodClick(Sender: TObject);
begin
  frmoxidemodinstaller.ShowModal;
end;

procedure Tfrmmain.btninstallserverClick(Sender: TObject);
var
  batfile: TStringList;
begin
  if FileExists('.\steamcmd\steamcmd.exe') then
  begin
    mmosteamcmd.Clear;
    if doscmdsteamcmd.IsRunning then
      doscmdsteamcmd.Stop;

    batfile := TStringList.Create;
    try
      batfile.Add('@echo off');
      batfile.Add('echo Starting Server Installation...');
      batfile.Add('.\steamcmd' +
        '\steamcmd.exe +login anonymous +force_install_dir "' + GetCurrentDir +
        '" +app_update 556450 +quit');
      batfile.Add('echo Done.')
    finally
      batfile.SaveToFile('.\InstallUpdate.bat');
      batfile.Free;
    end;

    doscmdsteamcmd.CommandLine := '.\InstallUpdate.bat';
    doscmdsteamcmd.OutputLines := mmosteamcmd.Lines;
    doscmdsteamcmd.Execute;
  end
  else
  begin
    case MessageDlg
      ('SteamCMD is not installed! Do you want TFSM to install it for you?',
      mtConfirmation, [mbYes, mbCancel], 0) of
      mrYes:
        begin
          frmsteamcmdinstaller.ShowModal;
          btninstallserver.Click;
        end;
    end;
  end;
end;

procedure Tfrmmain.btninstallsteamcmdClick(Sender: TObject);
begin
  frmsteamcmdinstaller.ShowModal;
end;

procedure Tfrmmain.btnreporterrorClick(Sender: TObject);
begin
  OpenURL('https://github.com/Inforcer25/The-Forest-Server-Manager/issues');
end;

procedure Tfrmmain.btnsaveconfigClick(Sender: TObject);
begin
  // ==========================================================================
  servername := lbledtservername.Text;
  SaveSettingString('Server Config', 'servername', servername);

  serverpassword := lbledtserverpassword.Text;
  SaveSettingString('Server Config', 'serverpassword', serverpassword);

  adminpassword := lbledtadminpassword.Text;
  SaveSettingString('Server Config', 'adminpassword', adminpassword);

  contactemail := lbledtcontactemail.Text;
  SaveSettingString('Server Config', 'contactemail', contactemail);

  serverip := lbledtserverip.Text;
  SaveSettingString('Server Config', 'serverip', serverip);

  queryport := lbledtqueryport.Text;
  SaveSettingString('Server Config', 'queryport', queryport);

  gameport := lbledtgameport.Text;
  SaveSettingString('Server Config', 'gameport', gameport);

  steamport := lbledtsteamport.Text;
  SaveSettingString('Server Config', 'steamport', steamport);

  difficulty := cbbdifficulty.Text;
  SaveSettingString('Server Config', 'difficulty', difficulty);

  inittype := cbbinittype.Text;
  SaveSettingString('Server Config', 'inittype', inittype);
  // ==========================================================================
  if tglswtchlogwindow.State = tssOn then
  begin
    logwindow := 'on';
    SaveSettingString('Server Config', 'logwindow', logwindow);
  end
  else
  begin
    logwindow := 'off';
    SaveSettingString('Server Config', 'logwindow', logwindow);
  end;

  if tglswtchvac.State = tssOn then
  begin
    vac := 'on';
    SaveSettingString('Server Config', 'vac', vac);
  end
  else
  begin
    vac := 'off';
    SaveSettingString('Server Config', 'vac', vac);
  end;

  if tglswtchveganmode.State = tssOn then
  begin
    veganmode := 'on';
    SaveSettingString('Server Config', 'veganmode', veganmode);
  end
  else
  begin
    veganmode := 'off';
    SaveSettingString('Server Config', 'veganmode', veganmode);
  end;

  if tglswtchvegatarianmode.State = tssOn then
  begin
    vegatarianmode := 'on';
    SaveSettingString('Server Config', 'vegatarianmode', vegatarianmode);
  end
  else
  begin
    vegatarianmode := 'off';
    SaveSettingString('Server Config', 'vegatarianmode', vegatarianmode);
  end;

  if tglswtchresetholesmode.State = tssOn then
  begin
    resetholesmode := 'on';
    SaveSettingString('Server Config', 'resetholesmode', resetholesmode);
  end
  else
  begin
    resetholesmode := 'off';
    SaveSettingString('Server Config', 'resetholesmode', resetholesmode);
  end;

  if tglswtchtreeregrowmode.State = tssOn then
  begin
    treeregrowmode := 'on';
    SaveSettingString('Server Config', 'treeregrowmode', treeregrowmode);
  end
  else
  begin
    treeregrowmode := 'off';
    SaveSettingString('Server Config', 'treeregrowmode', treeregrowmode);
  end;

  if tglswtchnobuildingdestruction.State = tssOn then
  begin
    nobuildingdestruction := 'on';
    SaveSettingString('Server Config', 'nobuildingdestruction',
      nobuildingdestruction);
  end
  else
  begin
    nobuildingdestruction := 'off';
    SaveSettingString('Server Config', 'nobuildingdestruction',
      nobuildingdestruction);
  end;

  if tglswtchnobuildingdestruction.State = tssOn then
  begin
    nobuildingdestruction := 'on';
    SaveSettingString('Server Config', 'nobuildingdestruction',
      nobuildingdestruction);
  end
  else
  begin
    nobuildingdestruction := 'off';
    SaveSettingString('Server Config', 'nobuildingdestruction',
      nobuildingdestruction);
  end;

  if tglswtchallowenemiescreative.State = tssOn then
  begin
    allowenemiescreative := 'on';
    SaveSettingString('Server Config', 'allowenemiescreative',
      allowenemiescreative);
  end
  else
  begin
    allowenemiescreative := 'off';
    SaveSettingString('Server Config', 'allowenemiescreative',
      allowenemiescreative);
  end;
  // ==========================================================================
  maxplayers := sedmaxplayers.Value;
  SaveSettingString('Server Config', 'maxplayers', IntToStr(maxplayers));

  saveslot := sedsaveslot.Value;
  SaveSettingString('Server Config', 'saveslot', IntToStr(saveslot));

  saveinterval := sedsaveinterval.Value;
  SaveSettingString('Server Config', 'saveinterval', IntToStr(saveinterval));
end;

procedure Tfrmmain.btnstartserverClick(Sender: TObject);
var
  batfile: TStringList;
begin
  batfile := TStringList.Create;
  try
    batfile.Add('@echo off');
    batfile.Add(':start');
    batfile.Add('cls');
    batfile.Add('echo Starting Server...');
    batfile.Add('TheForestDedicatedServer.exe ^');
    batfile.Add('-nosteamclient ^');
    batfile.Add('-serverip ' + serverip + ' ^');
    batfile.Add('-servergameport ' + gameport + ' ^');
    batfile.Add('-serverqueryport ' + queryport + ' ^');
    batfile.Add('-serversteamport ' + steamport + ' ^');
    batfile.Add('-servername "' + servername + '" ^');
    batfile.Add('-serverplayers ' + IntToStr(maxplayers) + ' ^');
    batfile.Add('-serverautosaveinterval ' + IntToStr(saveinterval) + ' ^');
    batfile.Add('-serverpassword "' + serverpassword + '" ^');
    batfile.Add('-serverpassword_admin "' + adminpassword + '" ^');
    batfile.Add('-enableVAC ' + vac + ' ^');
    batfile.Add('-difficulty ' + difficulty + ' ^');
    batfile.Add('-inittype ' + inittype + ' ^');
    batfile.Add('-slot ' + IntToStr(saveslot) + ' ^');
    batfile.Add('-showlogs ' + logwindow + ' ^');
    batfile.Add('-veganmode ' + veganmode + ' ^');
    batfile.Add('-vegetarianmode ' + vegatarianmode + ' ^');
    batfile.Add('-resetholesmode ' + resetholesmode + ' ^');
    batfile.Add('-treeregrowmode ' + treeregrowmode + ' ^');
    batfile.Add('-nobuildingdestruction ' + nobuildingdestruction + ' ^');
    batfile.Add('-allowenemiescreative ' + allowenemiescreative);
    if chkautorestart.Checked then
    begin
      batfile.Add('cls');
      batfile.Add('echo Restarting Server...');
      batfile.Add('timeout /t 10');
      batfile.Add('goto start');
    end;
  finally
    batfile.SaveToFile('start.bat');
    batfile.Free;
  end;

  if FileExists('TheForestDedicatedServer.exe') then
    WinExec('start.bat', SW_SHOWNORMAL)
  else
    ShowMessage
      ('Could not find TheForestDedicatedServer.exe. Is the server installed?');
end;

procedure Tfrmmain.btnstopinstallClick(Sender: TObject);
begin
  if doscmdsteamcmd.IsRunning then
  begin
    doscmdsteamcmd.Stop;
    mmosteamcmd.Clear;
    KillTask('steamcmd.exe');
  end;
end;

procedure Tfrmmain.btnupdatetfsmClick(Sender: TObject);
begin
  OpenURL('https://inforcer25.co.za/');
end;

procedure Tfrmmain.btnverifyserverfilesClick(Sender: TObject);
var
  batfile: TStringList;
begin
  if FileExists('.\steamcmd\steamcmd.exe') then
  begin
    mmosteamcmd.Clear;
    if doscmdsteamcmd.IsRunning then
      doscmdsteamcmd.Stop;

    batfile := TStringList.Create;
    try
      batfile.Add('@echo off');
      batfile.Add('echo Starting Server Validation...');
      batfile.Add('.\steamcmd' +
        '\steamcmd.exe +login anonymous +force_install_dir "' + GetCurrentDir +
        '" +app_update 556450 validate +quit');
      batfile.Add('echo Done.')
    finally
      batfile.SaveToFile('.\InstallUpdate.bat');
      batfile.Free;
    end;

    doscmdsteamcmd.CommandLine := '.\InstallUpdate.bat';
    doscmdsteamcmd.OutputLines := mmosteamcmd.Lines;
    doscmdsteamcmd.Execute;
  end
  else
  begin
    case MessageDlg
      ('SteamCMD is not installed! Do you want TFSM to install it for you?',
      mtConfirmation, [mbYes, mbCancel], 0) of
      mrYes:
        begin
          frmsteamcmdinstaller.ShowModal;
          btnverifyserverfiles.Click;;
        end;
    end;
  end;
end;

procedure Tfrmmain.btnwebsiteClick(Sender: TObject);
begin
  OpenURL('https://inforcer25.co.za/the-forest-server-manager.html');
end;

procedure Tfrmmain.cbbthemeChange(Sender: TObject);
begin
  TStyleManager.TrySetStyle(cbbtheme.Text);
  SaveSettingString('App Settings', 'theme', cbbtheme.Text);
end;

procedure Tfrmmain.CheckNeededFiles;
begin
  if not FileExists('libeay32.dll') or not FileExists('ssleay32.dll') or
    not FileExists('TheForest.ttf') then
  begin
    DeleteFile('ssleay32.dll');
    DeleteFile('libeay32.dll');

    ShowMessage('Some files seem to be missing. It will now be downloaded.');
    frmneededdownload.ShowModal;
  end;
end;

procedure Tfrmmain.CleanUp;
begin
  RemoveFontResource('TheForest.ttf');
  if doscmdsteamcmd.IsRunning then
    doscmdsteamcmd.Stop;
  KillTask('steamcmd.exe');
end;

procedure Tfrmmain.FormActivate(Sender: TObject);
begin
  CheckNeededFiles;
  lblversion.Caption := GetLatestVersion;
end;

procedure Tfrmmain.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  try
    CleanUp;
  finally
    CanClose := True;
  end;
end;

procedure Tfrmmain.FormCreate(Sender: TObject);
begin
  Application.Title := 'TFSM';
  ini_settings := '.\TFSMConfig.ini';
  AddFontResource('TheForest.ttf');
  LoadThemeList;
  LoadAllSettings;
end;

function Tfrmmain.GetLatestVersion: string;
begin
  Result := idhtplatestversion.Get('http://41.185.91.51/TFSM/version.html');
end;

function Tfrmmain.KillTask(ExeFileName: string): Integer;
const
  PROCESS_TERMINATE = $0001;
var
  ContinueLoop: BOOL;
  FSnapshotHandle: THandle;
  FProcessEntry32: TProcessEntry32;
begin
  Result := 0;
  FSnapshotHandle := CreateToolhelp32Snapshot(TH32CS_SNAPPROCESS, 0);
  FProcessEntry32.dwSize := sizeof(FProcessEntry32);
  ContinueLoop := Process32First(FSnapshotHandle, FProcessEntry32);

  while Integer(ContinueLoop) <> 0 do
  begin
    if ((UpperCase(ExtractFileName(FProcessEntry32.szExeFile))
      = UpperCase(ExeFileName)) or (UpperCase(FProcessEntry32.szExeFile)
      = UpperCase(ExeFileName))) then
      Result := Integer(TerminateProcess(OpenProcess(PROCESS_TERMINATE, BOOL(0),
        FProcessEntry32.th32ProcessID), 0));
    ContinueLoop := Process32Next(FSnapshotHandle, FProcessEntry32);
  end;
  CloseHandle(FSnapshotHandle);
end;

procedure Tfrmmain.LoadAllSettings;
var
  i: Integer;
begin
  // Server Config
  servername := LoadSettingString('Server Config', 'servername',
    'Welcome to my server.');
  lbledtservername.Text := servername;

  serverpassword := LoadSettingString('Server Config', 'serverpassword', '');
  lbledtserverpassword.Text := serverpassword;

  adminpassword := LoadSettingString('Server Config', 'adminpassword',
    'changeme');
  lbledtadminpassword.Text := adminpassword;

  contactemail := LoadSettingString('Server Config', 'contactemail', '');
  lbledtcontactemail.Text := contactemail;

  serverip := LoadSettingString('Server Config', 'serverip', '0.0.0.0');
  lbledtserverip.Text := serverip;

  queryport := LoadSettingString('Server Config', 'queryport', '27016');
  lbledtqueryport.Text := queryport;

  gameport := LoadSettingString('Server Config', 'gameport', '27015');
  lbledtgameport.Text := gameport;

  steamport := LoadSettingString('Server Config', 'steamport', '27016');
  lbledtsteamport.Text := steamport;

  difficulty := LoadSettingString('Server Config', 'difficulty', 'Normal');
  cbbdifficulty.ItemIndex := cbbdifficulty.Items.IndexOf(difficulty);

  inittype := LoadSettingString('Server Config', 'inittype', 'New');
  cbbinittype.ItemIndex := cbbinittype.Items.IndexOf(inittype);

  logwindow := LoadSettingString('Server Config', 'logwindow', 'off');
  if logwindow = 'on' then
    tglswtchlogwindow.State := tssOn
  else
    tglswtchlogwindow.State := tssOff;

  vac := LoadSettingString('Server Config', 'vac', 'on');
  if vac = 'on' then
    tglswtchvac.State := tssOn
  else
    tglswtchvac.State := tssOff;

  veganmode := LoadSettingString('Server Config', 'veganmode', 'off');
  if veganmode = 'on' then
    tglswtchveganmode.State := tssOn
  else
    tglswtchveganmode.State := tssOff;

  vegatarianmode := LoadSettingString('Server Config', 'vegatarianmode', 'off');
  if vegatarianmode = 'on' then
    tglswtchvegatarianmode.State := tssOn
  else
    tglswtchvegatarianmode.State := tssOff;

  resetholesmode := LoadSettingString('Server Config', 'resetholesmode', 'off');
  if resetholesmode = 'on' then
    tglswtchresetholesmode.State := tssOn
  else
    tglswtchresetholesmode.State := tssOff;

  treeregrowmode := LoadSettingString('Server Config', 'treeregrowmode', 'off');
  if resetholesmode = 'on' then
    tglswtchtreeregrowmode.State := tssOn
  else
    tglswtchtreeregrowmode.State := tssOff;

  nobuildingdestruction := LoadSettingString('Server Config',
    'nobuildingdestruction', 'off');
  if nobuildingdestruction = 'on' then
    tglswtchnobuildingdestruction.State := tssOn
  else
    tglswtchnobuildingdestruction.State := tssOff;

  allowenemiescreative := LoadSettingString('Server Config',
    'allowenemiescreative', 'off');
  if allowenemiescreative = 'on' then
    tglswtchallowenemiescreative.State := tssOn
  else
    tglswtchallowenemiescreative.State := tssOff;

  maxplayers := StrToInt(LoadSettingString('Server Config', 'maxplayers', '8'));
  sedmaxplayers.Value := maxplayers;

  saveslot := StrToInt(LoadSettingString('Server Config', 'saveslot', '1'));
  sedsaveslot.Value := saveslot;

  saveinterval := StrToInt(LoadSettingString('Server Config',
    'saveinterval', '15'));
  sedsaveinterval.Value := saveinterval;

  // App Settings
  TStyleManager.TrySetStyle(LoadSettingString('App Settings', 'theme',
    'Material Oxford Blue'));
  cbbtheme.ItemIndex := cbbtheme.Items.IndexOf(TStyleManager.ActiveStyle.Name);

  trckbrtransparency.Position := StrToInt(LoadSettingString('App Settings', 'transparency', '255'));

  pgctabs.ActivePageIndex := StrToInt(LoadSettingString('App Settings', 'lasttab', '1'));
end;

function Tfrmmain.LoadSettingString(Section, Name, Value: string): string;
var
  ini: TIniFile;
begin
  ini := TIniFile.Create(ini_settings);
  try
    Result := ini.ReadString(Section, Name, Value);
  finally
    ini.Free;
  end;
end;

procedure Tfrmmain.LoadThemeList;
var
  stylename: string;
begin
  for stylename in TStyleManager.StyleNames do
    cbbtheme.Items.Add(stylename);
end;

procedure Tfrmmain.OpenURL(URL: string);
begin
  ShellExecute(self.WindowHandle, 'open', PChar(URL), nil, nil, SW_SHOWNORMAL);
end;

procedure Tfrmmain.pgctabsChange(Sender: TObject);
begin
  SaveSettingString('App Settings', 'lasttab', IntToStr(pgctabs.ActivePageIndex));
end;

procedure Tfrmmain.SaveSettingString(Section, Name, Value: string);
var
  ini: TIniFile;
begin
  ini := TIniFile.Create(ini_settings);
  try
    ini.WriteString(Section, Name, Value);
  finally
    ini.Free;
  end;
end;

procedure Tfrmmain.trckbrtransparencyChange(Sender: TObject);
begin
  AlphaBlendValue := trckbrtransparency.Position;
  SaveSettingString('App Settings', 'transparency',
    IntToStr(trckbrtransparency.Position));
end;

initialization

ReportMemoryLeaksOnShutdown := True;

end.
