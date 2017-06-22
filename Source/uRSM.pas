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
unit uRSM;

interface

uses
  Winapi.Windows, Winapi.Messages, SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.ComCtrls, Vcl.StdCtrls,
  DosCommand, uOxideModInstaller, uSteamCMDinstaller, uServerInstaller, Tlhelp32, IniFiles,
  Vcl.Samples.Spin, Vcl.Imaging.pngimage, Vcl.Imaging.GIFImg, Vcl.Imaging.jpeg, ShellAPI, WinSock,
  uServerDescription, uServerWipe, uPluginConfigEditor, FileCtrl, VCL.Themes, WinInet, IdHTTP,
  IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient, Vcl.Styles.Utils.SysControls, Vcl.Styles,
  uVclStylesEQU, uMultiDownloader;

type
  TForm1 = class(TForm)
    pnl1: TPanel;
    pnl2: TPanel;
    pgc1: TPageControl;
    tsserverconfig: TTabSheet;
    tsinstaller: TTabSheet;
    mmoinstaller: TMemo;
    btn1: TButton;
    btn2: TButton;
    btn3: TButton;
    btn4: TButton;
    btn5: TButton;
    btncancel: TButton;
    dscmnd1: TDosCommand;
    btn6: TButton;
    lbledtservername: TLabeledEdit;
    rgserverlevel: TRadioGroup;
    grpports: TGroupBox;
    lbledtserverport: TLabeledEdit;
    lbledtrconport: TLabeledEdit;
    lbledtserverdescription: TLabeledEdit;
    lbledtserverurl: TLabeledEdit;
    lbledtserverbanner: TLabeledEdit;
    lbledtrconpass: TLabeledEdit;
    btn7: TButton;
    grprconsettings: TGroupBox;
    chkrconweb: TCheckBox;
    sedserverseed: TSpinEdit;
    lbl1: TLabel;
    lbl2: TLabel;
    sedworldsize: TSpinEdit;
    sedmaxplayers: TSpinEdit;
    lbl3: TLabel;
    btn8: TButton;
    lbledtserveridentity: TLabeledEdit;
    lstservers: TListBox;
    lblcurrentservers: TLabel;
    btn9: TButton;
    btn10: TButton;
    lbl5: TLabel;
    lbl6: TLabel;
    lbl7: TLabel;
    img1: TImage;
    grp1: TGroupBox;
    lbl8: TLabel;
    lbl9: TLabel;
    lbl10: TLabel;
    lbl11: TLabel;
    lbl12: TLabel;
    lbl13: TLabel;
    lblbranch: TLabel;
    btn11: TButton;
    lbledtserverip: TLabeledEdit;
    btn12: TButton;
    tsplugins: TTabSheet;
    lstplugins: TListBox;
    lbl14: TLabel;
    lbl15: TLabel;
    lstconfigs: TListBox;
    pnl3: TPanel;
    btnrefreshplugins: TButton;
    btn14: TButton;
    btn15: TButton;
    btn16: TButton;
    lbl4: TLabel;
    lblplugincount: TLabel;
    tsbackup: TTabSheet;
    lbledtbackuppath: TLabeledEdit;
    btnselectbackuppath: TButton;
    lbl16: TLabel;
    sedbackup: TSpinEdit;
    btnstartbackup: TButton;
    btnstopbackup: TButton;
    lbledtbackupstatus: TLabeledEdit;
    tmrbackup: TTimer;
    mmobackuplog: TMemo;
    dscmndbackup: TDosCommand;
    lbl17: TLabel;
    tmrnextbackup: TTimer;
    btn13: TButton;
    lstdata: TListBox;
    lbl18: TLabel;
    lbl19: TLabel;
    btn17: TButton;
    lbl20: TLabel;
    lbledtrconip: TLabeledEdit;
    lbl21: TLabel;
    btn18: TButton;
    btn19: TButton;
    lbl22: TLabel;
    btn20: TButton;
    tssettings: TTabSheet;
    grp2: TGroupBox;
    cbbthemelist: TComboBox;
    btn21: TButton;
    grp3: TGroupBox;
    chksaveactivetab: TCheckBox;
    chkautorestart: TCheckBox;
    grp4: TGroupBox;
    trckbrtransparency: TTrackBar;
    lblversion: TLabel;
    idhtp1: TIdHTTP;
    btn22: TButton;
    chkloadcustomtheme: TCheckBox;
    chkglobalchat: TCheckBox;
    sedsaveinterval: TSpinEdit;
    lbl23: TLabel;
    btn23: TButton;
    chklinuxautorestart: TCheckBox;
    tsextras: TTabSheet;
    pgc2: TPageControl;
    tsrcon: TTabSheet;
    lbl24: TLabel;
    lbl25: TLabel;
    btn24: TButton;
    btn25: TButton;
    mmorconwebadmin: TMemo;
    lbl26: TLabel;
    lbl27: TLabel;
    lbl28: TLabel;
    lbl29: TLabel;
    lbl30: TLabel;
    lbl31: TLabel;
    lbl32: TLabel;
    lbl34: TLabel;
    dscmndrconwebadmin: TDosCommand;
    lbl35: TLabel;
    lbl36: TLabel;
    lbl33: TLabel;
    chkradiation: TCheckBox;
    procedure btncancelClick(Sender: TObject);
    function KillTask(ExeFileName: string): Integer;
    procedure btn3Click(Sender: TObject);
    procedure btn2Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btn1Click(Sender: TObject);
    procedure btn4Click(Sender: TObject);
    function SelectServerBranch: string;
    procedure FormCreate(Sender: TObject);
    procedure LoadSettings;
    procedure btn7MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure btn7MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure btn8Click(Sender: TObject);
    procedure GetDirList(sPath: string);
    procedure lstserversDblClick(Sender: TObject);
    procedure btn10Click(Sender: TObject);
    procedure lbl7Click(Sender: TObject);
    procedure btn9Click(Sender: TObject);
    procedure btn5Click(Sender: TObject);
    procedure btn6Click(Sender: TObject);
    procedure OpenURL(url: string);
    procedure lbl8Click(Sender: TObject);
    procedure lbl9Click(Sender: TObject);
    procedure lbl10Click(Sender: TObject);
    procedure lbl11Click(Sender: TObject);
    procedure btn11Click(Sender: TObject);
    procedure btn12Click(Sender: TObject);
    procedure btn16Click(Sender: TObject);
    procedure ListFileDir(Path: string; FileList: TStrings);
    procedure btnrefreshpluginsClick(Sender: TObject);
    procedure btn14Click(Sender: TObject);
    procedure btn15Click(Sender: TObject);
    procedure lstconfigsDblClick(Sender: TObject);
    procedure btnselectbackuppathClick(Sender: TObject);
    procedure btnstartbackupClick(Sender: TObject);
    procedure btnstopbackupClick(Sender: TObject);
    function CopyPaste(xSourcePath, xDestPath, xPara: string): Boolean;
    procedure tmrbackupTimer(Sender: TObject);
    procedure tmrnextbackupTimer(Sender: TObject);
    procedure btn13Click(Sender: TObject);
    procedure lstdataDblClick(Sender: TObject);
    procedure btn17Click(Sender: TObject);
    procedure lbl20Click(Sender: TObject);
    procedure lbl21Click(Sender: TObject);
    procedure btn18Click(Sender: TObject);
    procedure OpenFolder(Folder: PWideChar);
    procedure btn19Click(Sender: TObject);
    procedure btn20Click(Sender: TObject);
    procedure cbbthemelistChange(Sender: TObject);
    procedure btn21Click(Sender: TObject);
    procedure trckbrtransparencyChange(Sender: TObject);
    function IsConnected: Boolean;
    function GetLatesVersion: string;
    procedure btn22Click(Sender: TObject);
    procedure btn23Click(Sender: TObject);
    procedure lbl27Click(Sender: TObject);
    procedure lbl30Click(Sender: TObject);
    procedure lbl34Click(Sender: TObject);
    procedure MultiDownloader(link: string);
    procedure btn24Click(Sender: TObject);
    procedure lbl32Click(Sender: TObject);
    procedure lbl36Click(Sender: TObject);
    procedure btn25Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    ini_settings, Branch: String;
    servername, description, serverurl, serverbanner, saveinterval: string;
    serverseed, worldsize, maxplayers, serveridentity, rconip: string;
    rconpass, rconport, serverport, maptype, backupdir, serverip: string;
    rconweb: Integer;
    nextbackup: Real;
    rtime: Real;
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.btn10Click(Sender: TObject);
begin
  mmoinstaller.Lines.SaveToFile('installer.log');
end;

procedure TForm1.btn11Click(Sender: TObject);
var
  description: string;
begin
  description := lbledtserverdescription.Text;
  description := StringReplace(description,' \n',#13#10,[rfReplaceAll]);
  frmdescription.mmo1.Text := description;
  frmdescription.ShowModal;
  lbledtserverdescription.Text := frmdescription.description;
end;

procedure TForm1.btn12Click(Sender: TObject);
begin
  frmwipe.ShowModal;
end;

procedure TForm1.btn13Click(Sender: TObject);
begin
  OpenURL('http://oxidemod.org/plugins/categories/rust.24/?order=rating_weighted');
end;

procedure TForm1.btnselectbackuppathClick(Sender: TObject);
var
  ini: TIniFile;
begin
  if selectdirectory('Select a directory to backup too', '', backupdir) then
    lbledtbackuppath.Text := backupdir;

  ini := TIniFile.Create(ini_settings);
  try
    ini.WriteString('Application Settings', 'backupto', backupdir);
  finally
    ini.Free;
  end;
end;

procedure TForm1.btnrefreshpluginsClick(Sender: TObject);
begin
  lstplugins.Clear;
  lstconfigs.Clear;
  lstdata.Clear;
  ListFileDir('.\oxide\plugins\', lstplugins.Items);
  ListFileDir('.\oxide\config\', lstconfigs.Items);
  ListFileDir('.\oxide\data\', lstdata.Items);
  lblplugincount.Caption := '[' + IntToStr(lstplugins.Items.Count) + ']';
end;

function TForm1.CopyPaste(xSourcePath, xDestPath, xPara: string): Boolean;
var
  PFileMsg: TSHFileOpStruct;
  mNowPath: string;
begin
  Result := False;
  FillChar(PFileMsg, sizeof(PFileMsg), #0);
  if pos('.', xpara) = 0 then
    exit;
  mNowPath := GetCurrentDir;
  if xSourcePath <> '' then
    if not DirectoryExists(xSourcePath) then
    begin
      showmessage('The source path does not exist !');
      exit;
    end;
  if xDestPath <> '' then
    if not DirectoryExists(xDestPath) then
    begin
      showmessage('The destination path does not exist !');
      exit;
    end;
  if SetCurrentDirectory(Pchar(xSourcePath)) then
  begin
    with PFileMsg do
    begin
      if Owner is TForm then
        Wnd := TForm(Owner).Handle
      else
        Wnd := Application.Handle;
      if xDestPath <> '' then
      begin
        wFunc := FO_COPY;
        PTo := pChar(xDestPath);
        fFlags := FOF_MULTIDESTFILES + FOF_NOCONFIRMATION;
      end
      else
      begin
        wFunc := FO_DELETE;
        fFlags := FOF_ALLOWUNDO + FOF_NOCONFIRMATION;
      end;
      pFrom := PChar(xPara + #0#0);
    end;
    SHFileOperation(PFileMsg);
    SetCurrentDirectory(Pchar(mNowPath));
    Application.ProcessMessages;
    Result := True;
  end;
end;

procedure TForm1.btn14Click(Sender: TObject);
begin
  if lstplugins.ItemIndex = -1 then
    ShowMessage('You have to select a plugin!')
  else
    begin
      DeleteFile('.\oxide\plugins\' + lstplugins.Items[lstplugins.ItemIndex]);
      btnrefreshplugins.Click;
    end;
end;

procedure TForm1.btn15Click(Sender: TObject);
begin
  if lstconfigs.ItemIndex = -1 then
    ShowMessage('You have to select a config!')
  else
    begin
      DeleteFile('.\oxide\config\' + lstconfigs.Items[lstconfigs.ItemIndex]);
      btnrefreshplugins.Click;
    end;
end;

procedure TForm1.btn16Click(Sender: TObject);
begin
  OpenURL('http://oxidemod.org/plugins/categories/universal.58/');
end;

procedure TForm1.btn17Click(Sender: TObject);
begin
  if Trim(lbledtbackuppath.Text) <> '' then
    begin
      mmobackuplog.Clear;
      dscmndbackup.CommandLine := 'xcopy "' + GetCurrentDir + '" "' + backupdir + '\" /h/i/c/k/e/r/y';
      dscmndbackup.OutputLines := mmobackuplog.Lines;
      if dscmndbackup.IsRunning = False then
        dscmndbackup.Execute
      else
        begin
          dscmndbackup.Stop;
          dscmndbackup.Execute
        end;
    end
  else
    ShowMessage('You need to select a path!');
end;

procedure TForm1.btn18Click(Sender: TObject);
begin
  OpenFolder('.\oxide\plugins');
end;

procedure TForm1.btn19Click(Sender: TObject);
begin
  OpenFolder('.\oxide\config');
end;

procedure TForm1.btnstartbackupClick(Sender: TObject);
var
  time: Integer;
  command: TStringList;
begin
  if Trim(lbledtbackuppath.Text) <> '' then
    begin
      sedbackup.Enabled := False;
      btnstartbackup.Enabled := False;
      btnstopbackup.Enabled := True;
      nextbackup := 0;
      time := sedbackup.Value * 60000;
      tmrbackup.Interval := time;
      tmrbackup.Enabled := True;
      rtime := tmrbackup.Interval / 60000;
      nextbackup := rtime;
      tmrnextbackup.Enabled := True;
      lbledtbackupstatus.Text := 'Next Backup: ' + IntToStr(sedbackup.Value) + ' mins';
      btnselectbackuppath.Enabled := False;
      lbledtbackuppath.Enabled := False;
    end
  else
    ShowMessage('You need to select a path!');

end;

procedure TForm1.btnstopbackupClick(Sender: TObject);
begin
  lbledtbackupstatus.Text := 'Stopped...';
  tmrbackup.Enabled := False;
  tmrnextbackup.Enabled := False;
  sedbackup.Enabled := True;
  btnstopbackup.Enabled := False;
  btnstartbackup.Enabled := True;
  btnselectbackuppath.Enabled := True;
  lbledtbackuppath.Enabled := True;
end;

procedure TForm1.cbbthemelistChange(Sender: TObject);
begin
  TStyleManager.SetStyle(cbbthemelist.Text);
end;

procedure TForm1.btn1Click(Sender: TObject);
var
  command: TStringList;
  ini: TIniFile;
begin
  branch := SelectServerBranch;
  lblbranch.Caption := Branch;

  if branch = 'normal' then
    begin

      ini := TIniFile.Create(ini_settings);
      try
        ini.WriteString('ServerSettings','Branch', branch);
      finally
        ini.Free;
      end;

      if FileExists('.\steamcmd\steamcmd.exe') then
        begin
          btncancel.Click;
          dscmnd1.Stop;
          command:= TStringlist.create;
          try
            command.Clear;
            command.Add('@echo off');
            command.Add('echo Starting Installation...');
            command.Add('.\steamcmd' + '\steamcmd.exe +login anonymous +force_install_dir "' + GetCurrentDir + '" +app_update 258550 +quit');
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

  if branch = 'staging' then
    begin
      ini := TIniFile.Create(ini_settings);
      try
        ini.WriteString('ServerSettings','Branch', branch);
      finally
        ini.Free;
      end;
    
      if FileExists('.\steamcmd\steamcmd.exe') then
        begin
          btncancel.Click;
          dscmnd1.Stop;
          command:= TStringlist.create;
          try
            command.Clear;
            command.Add('@echo off');
            command.Add('echo Starting Installation...');
            command.Add('.\steamcmd' + '\steamcmd.exe +login anonymous +force_install_dir "' + GetCurrentDir + '" +app_update 258550 -beta staging +quit');
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

  if branch = 'prerelease' then
    begin
      ini := TIniFile.Create(ini_settings);
      try
        ini.WriteString('ServerSettings','Branch', branch);
      finally
        ini.Free;
      end;
    
      if FileExists('.\steamcmd\steamcmd.exe') then
        begin
          btncancel.Click;
          dscmnd1.Stop;
          command:= TStringlist.create;
          try
            command.Clear;
            command.Add('@echo off');
            command.Add('echo Starting Installation...');
            command.Add('.\steamcmd' + '\steamcmd.exe +login anonymous +force_install_dir "' + GetCurrentDir + '" +app_update 258550 -beta prerelease +quit');
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
end;

procedure TForm1.btn20Click(Sender: TObject);
begin
  ShowMessage('To stop your server you need to type quit in the console');
end;

procedure TForm1.btn21Click(Sender: TObject);
var
  ini: TIniFile;
begin
  ini := TIniFile.Create(ini_settings);
  try
    ini.WriteString('Application Settings', 'theme', cbbthemelist.Text);
    ini.WriteString('Application Settings', 'remember last tab', BoolToStr(chksaveactivetab.Checked));
    ini.WriteString('Application Settings', 'transparency', IntToStr(trckbrtransparency.Position));
    ini.WriteString('Application Settings', 'loadcustomtheme', BoolToStr(chkloadcustomtheme.Checked));
  finally
    ini.Free;
  end;
end;

procedure TForm1.btn22Click(Sender: TObject);
begin
  FrmHueSat.ShowModal
end;

procedure TForm1.btn23Click(Sender: TObject);
var
  commands: TStringList;
begin
  if chklinuxautorestart.Checked = True then
    begin

      commands := TStringList.Create;
      try
        commands.Add('#!/bin/sh');
        commands.Add('export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$(pwd)');
        commands.Add('clear');
        commands.Add('while :');
        commands.Add('do');
        commands.Add('    echo "Starting server...\n"');
        commands.Add(' ');
        commands.Add('    exec ./RustDedicated -batchmode -nographics \');
        commands.Add('    -rcon.ip ' + rconip + ' \');
        commands.Add('    -rcon.port ' + rconport + ' \');
        commands.Add('    -rcon.password "' + rconpass + '" \');
        commands.Add('    -server.ip ' + serverip + ' \');
        commands.Add('    -server.port ' + serverport + ' \');
        commands.Add('    -server.maxplayers ' + maxplayers + ' \');
        commands.Add('    -server.hostname "' + servername + '" \');
        commands.Add('    -server.identity "' + serveridentity + '" \');
        commands.Add('    -server.level "' + maptype + '" \');
        commands.Add('    -server.seed ' + serverseed + ' \');
        commands.Add('    -server.worldsize ' + worldsize + ' \');
        commands.Add('    -server.saveinterval ' + saveinterval + ' \');
        commands.Add('    -server.globalchat ' + BoolToStr(chkglobalchat.Checked) + ' \');
        commands.Add('    -server.description "' + description + '" \');
        commands.Add('    -server.headerimage "' + serverbanner + '" \');
        commands.Add('    -server.url "' + serverurl + '" \');
        commands.Add('    -server.radiation ' + BoolToStr(chkradiation.Checked));
        commands.Add(' ');
        commands.Add('    echo "\nRestarting server...\n"');
        commands.Add('    sleep 10');
        commands.Add('done');
      finally
        commands.SaveToFile('LinuxStart.sh');
        ShowMessage('Script Generated!');
        commands.Free;
      end;
    end
  else
    begin
      commands := TStringList.Create;
      try
        commands.Add('#!/bin/sh');
        commands.Add('export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$(pwd)');
        commands.Add('clear');
        commands.Add('    echo "Starting server...\n"');
        commands.Add('    exec ./RustDedicated -batchmode -nographics \');
        commands.Add('    -rcon.ip ' + rconip + ' \');
        commands.Add('    -rcon.port ' + rconport + ' \');
        commands.Add('    -rcon.password "' + rconpass + '" \');
        commands.Add('    -server.ip ' + serverip + ' \');
        commands.Add('    -server.port ' + serverport + ' \');
        commands.Add('    -server.maxplayers ' + maxplayers + ' \');
        commands.Add('    -server.hostname "' + servername + '" \');
        commands.Add('    -server.identity "' + serveridentity + '" \');
        commands.Add('    -server.level "' + maptype + '" \');
        commands.Add('    -server.seed ' + serverseed + ' \');
        commands.Add('    -server.worldsize ' + worldsize + ' \');
        commands.Add('    -server.saveinterval ' + saveinterval + ' \');
        commands.Add('    -server.globalchat ' + BoolToStr(chkglobalchat.Checked) + ' \');
        commands.Add('    -server.description "' + description + '" \');
        commands.Add('    -server.headerimage "' + serverbanner + '" \');
        commands.Add('    -server.url "' + serverurl + '" \');
        commands.Add('    -server.radiation ' + BoolToStr(chkradiation.Checked));
      finally
        commands.SaveToFile('LinuxStart.sh');
        ShowMessage('Script Generated!');
        commands.Free;
      end;
    end;
end;

procedure TForm1.btn24Click(Sender: TObject);
begin
  dscmndrconwebadmin.Stop;
  dscmndrconwebadmin.OutputLines := mmorconwebadmin.Lines;
  dscmndrconwebadmin.CommandLine := '.\rcon-web-admin\startscripts\start-windows.bat';
  dscmndrconwebadmin.Execute;
end;

procedure TForm1.btn25Click(Sender: TObject);
begin
  dscmndrconwebadmin.Stop;
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
  ini: TIniFile;
begin
  if branch = 'normal' then
      if FileExists('.\steamcmd\steamcmd.exe') then
        begin
          btncancel.Click;
          dscmnd1.Stop;
          command:= TStringlist.create;
          try
            command.Clear;
            command.Add('@echo off');
            command.Add('echo Starting Server Update...');
            command.Add('.\steamcmd' + '\steamcmd.exe +login anonymous +force_install_dir "' + GetCurrentDir + '" +app_update 258550 +quit');
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

  if branch = 'staging' then
    begin
      if FileExists('.\steamcmd\steamcmd.exe') then
        begin
          btncancel.Click;
          dscmnd1.Stop;
          command:= TStringlist.create;
          try
            command.Clear;
            command.Add('@echo off');
            command.Add('echo Starting Server Update...');
            command.Add('.\steamcmd' + '\steamcmd.exe +login anonymous +force_install_dir "' + GetCurrentDir + '" +app_update 258550 -beta staging +quit');
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

  if branch = 'prerelease' then
    begin
      if FileExists('.\steamcmd\steamcmd.exe') then
        begin
          btncancel.Click;
          dscmnd1.Stop;
          command:= TStringlist.create;
          try
            command.Clear;
            command.Add('@echo off');
            command.Add('echo Starting Server Update...');
            command.Add('.\steamcmd' + '\steamcmd.exe +login anonymous +force_install_dir "' + GetCurrentDir + '" +app_update 258550 -beta prerelease +quit');
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
end;

procedure TForm1.btn5Click(Sender: TObject);
var
  command: TStringList;
  ini: TIniFile;
begin
  if branch = 'normal' then
      if FileExists('.\steamcmd\steamcmd.exe') then
        begin
          btncancel.Click;
          dscmnd1.Stop;
          command:= TStringlist.create;
          try
            command.Clear;
            command.Add('@echo off');
            command.Add('echo Starting Validation...');
            command.Add('.\steamcmd' + '\steamcmd.exe +login anonymous +force_install_dir "' + GetCurrentDir + '" +app_update 258550 validate +quit');
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

  if branch = 'staging' then
    begin
      if FileExists('.\steamcmd\steamcmd.exe') then
        begin
          btncancel.Click;
          dscmnd1.Stop;
          command:= TStringlist.create;
          try
            command.Clear;
            command.Add('@echo off');
            command.Add('echo Starting Validation...');
            command.Add('.\steamcmd' + '\steamcmd.exe +login anonymous +force_install_dir "' + GetCurrentDir + '" +app_update 258550 -beta staging validate +quit');
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

  if branch = 'prerelease' then
    begin
      if FileExists('.\steamcmd\steamcmd.exe') then
        begin
          btncancel.Click;
          dscmnd1.Stop;
          command:= TStringlist.create;
          try
            command.Clear;
            command.Add('@echo off');
            command.Add('echo Starting Validation...');
            command.Add('.\steamcmd' + '\steamcmd.exe +login anonymous +force_install_dir "' + GetCurrentDir + '" +app_update 258550 -beta prerelease validate +quit');
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
end;

procedure TForm1.btn6Click(Sender: TObject);
var
  commands: TStringList;
begin
  if chkautorestart.Checked = True then
    begin
      commands := TStringList.Create;
      try
        commands.Add('@echo off');
        commands.Add(':start');
        commands.Add('cls');
        commands.Add('echo Starting Server...');
        commands.Add('echo This may take a while...');
        commands.Add('RustDedicated.exe -batchmode -nographics ^');
        commands.Add('+rcon.ip ' + rconip + ' ^');
        commands.Add('+rcon.port ' + rconport + ' ^');
        commands.Add('+rcon.password "' + rconpass + '" ^');
        commands.Add('+server.ip ' + serverip + ' ^');
        commands.Add('+server.port ' + serverport + ' ^');
        commands.Add('+server.maxplayers ' + maxplayers + ' ^');
        commands.Add('+server.hostname "' + servername + '" ^');
        commands.Add('+server.identity "' + serveridentity + '" ^');
        commands.Add('+server.level "' + maptype + '" ^');
        commands.Add('+server.seed ' + serverseed + ' +server.worldsize ' + worldsize + ' ^');
        commands.Add('+server.saveinterval ' + saveinterval + ' ^');
        commands.Add('+server.globalchat ' + BoolToStr(chkglobalchat.Checked) + ' ^');
        commands.Add('+server.description "' + description + '" ^');
        commands.Add('+server.headerimage "' + serverbanner + '" ^');
        commands.Add('+server.url "' + serverurl + '" ^');
        commands.Add('+server.radiation ' + BoolToStr(chkradiation.Checked));
        commands.Add('echo.');
        commands.Add('echo Restarting Server...');
        commands.Add('timeout /t 10');
        commands.Add('goto start');
      finally
        commands.SaveToFile('start.bat');
        commands.Free;
      end;

      if FileExists('RustDedicated.exe') then
        WinExec('start.bat', SW_SHOWNORMAL)
      else
        ShowMessage('Could not find RustDedicated.exe');
    end
  else
    begin
      commands := TStringList.Create;
      try
        commands.Add('@echo off');
        commands.Add('echo Starting Server...');
        commands.Add('echo This may take a while...');
        commands.Add(':start');
        commands.Add('RustDedicated.exe -batchmode -nographics ^');
        commands.Add('+rcon.ip ' + rconip + ' ^');
        commands.Add('+rcon.port ' + rconport + ' ^');
        commands.Add('+rcon.password "' + rconpass + '" ^');
        commands.Add('+server.ip ' + serverip + ' ^');
        commands.Add('+server.port ' + serverport + ' ^');
        commands.Add('+server.maxplayers ' + maxplayers + ' ^');
        commands.Add('+server.hostname "' + servername + '" ^');
        commands.Add('+server.identity "' + serveridentity + '" ^');
        commands.Add('+server.level "' + maptype + '" ^');
        commands.Add('+server.seed ' + serverseed + ' +server.worldsize ' + worldsize + ' ^');
        commands.Add('+server.saveinterval ' + saveinterval + ' ^');
        commands.Add('+server.globalchat ' + BoolToStr(chkglobalchat.Checked) + ' ^');
        commands.Add('+server.description "' + description + '" ^');
        commands.Add('+server.headerimage "' + serverbanner + '" ^');
        commands.Add('+server.url "' + serverurl + '" ^');
        commands.Add('+server.radiation ' + BoolToStr(chkradiation.Checked));
      finally
        commands.SaveToFile('start.bat');
        commands.Free;
      end;

      if FileExists('RustDedicated.exe') then
        WinExec('start.bat', SW_SHOWNORMAL)
      else
        ShowMessage('Could not find RustDedicated.exe');
    end;

  lstservers.Clear;
  GetDirList('.\server');

end;

procedure TForm1.btn7MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  lbledtrconpass.PasswordChar := #0;
end;

procedure TForm1.btn7MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  lbledtrconpass.PasswordChar := '*';
end;

procedure TForm1.btn8Click(Sender: TObject);
begin
  sedserverseed.Value := Random(02147483647);
end;

procedure TForm1.btn9Click(Sender: TObject);
var
  ini: TIniFile;
begin
  servername := lbledtservername.Text;
  description := lbledtserverdescription.Text;
  serverurl := lbledtserverurl.Text;
  serverbanner := lbledtserverbanner.Text;
  serverseed := IntToStr(sedserverseed.Value);
  worldsize := IntToStr(sedworldsize.Value);
  maxplayers := IntToStr(sedmaxplayers.Value);
  serveridentity := lbledtserveridentity.Text;
  rconpass := lbledtrconpass.Text;
  rconport := lbledtrconport.Text;
  serverport := lbledtserverport.Text;
  serverip := lbledtserverip.Text;
  rconip := lbledtrconip.Text;
  saveinterval := IntToStr(sedsaveinterval.Value);
  if rgserverlevel.ItemIndex = -1 then ShowMessage('Error: You need to select a map! The config was still saved but you may get errors');
  if rgserverlevel.ItemIndex = 0 then maptype := 'Procedural Map';
  if rgserverlevel.ItemIndex = 1 then maptype := 'Barren';
  if rgserverlevel.ItemIndex = 2 then maptype := 'HapisIsland';
  if rgserverlevel.ItemIndex = 3 then maptype := 'SavasIslandp';
  if rgserverlevel.ItemIndex = 4 then maptype := 'SavasIsland_koth';
  if chkrconweb.Checked then
    rconweb := 1
  else
    rconweb := 0;

  ini := TIniFile.Create(ini_settings);
  try
    ini.WriteString('Server Config', 'servername', servername);
    ini.WriteString('Server Config', 'description', description);
    ini.WriteString('Server Config', 'serverurl', serverurl);
    ini.WriteString('Server Config', 'serverbanner', serverbanner);
    ini.WriteString('Server Config', 'serverseed', serverseed);
    ini.WriteString('Server Config', 'worldsize', worldsize);
    ini.WriteString('Server Config', 'maxplayers', maxplayers);
    ini.WriteString('Server Config', 'serveridentity', serveridentity);
    ini.WriteString('Server Config', 'rconpass', rconpass);
    ini.WriteString('Server Config', 'rconport', rconport);
    ini.WriteString('Server Config', 'serverport', serverport);
    ini.WriteString('Server Config', 'maptype', maptype);
    ini.WriteString('Server Config', 'rconweb', IntToStr(rconweb));
    ini.WriteString('ServerSettings','Branch', branch);
    ini.WriteString('ServerSettings','serverip', serverip);
    ini.WriteString('ServerSettings','rconip', rconip);
    ini.WriteString('ServerSettings','saveinterval', saveinterval);
    ini.WriteString('ServerSettings','globalchat', BoolToStr(chkglobalchat.Checked));
    ini.WriteString('ServerSettings','radiation', BoolToStr(chkradiation.Checked));
  finally
    ini.Free;
  end;

end;

procedure TForm1.btncancelClick(Sender: TObject);
begin
  if dscmnd1.IsRunning then dscmnd1.Stop;
  KillTask('steamcmd.exe');
end;

procedure TForm1.FormClose(Sender: TObject; var Action: TCloseAction);
var
  lasttab: string;
  ini: TIniFile;
begin
  if dscmnd1.IsRunning then
    dscmnd1.Stop;

  KillTask('steamcmd.exe');

  if chksaveactivetab.Checked then
    begin
      ini := TIniFile.Create(ini_settings);
      try
        ini.WriteString('Application Settings', 'lasttab', IntToStr(pgc1.ActivePageIndex));
      finally
        ini.Free;
      end;
    end;
end;

procedure TForm1.FormCreate(Sender: TObject);
var
  stylename: string;
begin
  lstplugins.Repaint;
  Application.Title := 'Rust Server Manager';
  ini_settings := '.\settings.ini';
  LoadSettings;
  btnrefreshplugins.Click;
  lstservers.Clear;
  GetDirList('.\server');
  lblcurrentservers.Caption := 'Current Servers: [' + IntToStr(lstservers.Items.Count) + ']';

  lblversion.Caption := GetLatesVersion;

  for stylename in TStylemanager.StyleNames do
    cbbthemelist.Items.Add(stylename);

  cbbthemelist.ItemIndex := cbbthemelist.Items.IndexOf(TStyleManager.ActiveStyle.Name);
end;

procedure TForm1.GetDirList(sPath: string);
var
  Found: Integer;
  SearchRec: TSearchRec;
begin
  Found := SysUtils.FindFirst(IncludeTrailingBackslash(sPath)
  + '*.*', faDirectory, SearchRec);

  try
    while Found = 0 do
      begin
        if ((SearchRec.Attr and faDirectory) = faDirectory) and (SearchRec.Name[1] <> '.') then
          lstservers.Items.Add(SearchRec.Name);
        Found := SysUtils.FindNext(SearchRec);
      end;
  finally
    SysUtils.FindClose(SearchRec);
  end;
end;

function TForm1.GetLatesVersion: string;
var
  version: string;
begin
  if IsConnected = True then
    begin
      version := idhtp1.Get('http://41.185.91.51/RSM/latestversion.html');
      Result := version;
    end
  else
    Result := 'Offline';
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
  Result:= InternetGetConnectedState(@InetState, 0);
  if (
    Result
    and
    (
      InetState and INTERNET_CONNECTION_CONFIGURED
        = INTERNET_CONNECTION_CONFIGURED)
    ) then
  begin
    // so far we ONLY know there's a valid connection. See if we can grab some
    // known URL ...
    hHttpSession:= InternetOpen(
      PChar(Application.Title), // this line is the agent string
      INTERNET_OPEN_TYPE_PRECONFIG, nil, nil, 0
    );
    try
      hReqUrl:= InternetOpenURL(
        hHttpSession,
        PChar('41.185.91.51'{ the URL to check }),
        nil,
        0,
        0,
        0
      );
      Result := hReqUrl <> nil;
      InternetCloseHandle(hReqUrl);
    finally
      InternetCloseHandle(hHttpSession);
    end;
  end
  else
    if (
      InetState and INTERNET_CONNECTION_OFFLINE = INTERNET_CONNECTION_OFFLINE
    ) then
      Result := False; // we know for sure we are offline.
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
  OpenURL('https://github.com/Inforcer25/Rust-Server-Manager');
end;

procedure TForm1.lbl11Click(Sender: TObject);
begin
  OpenURL('https://www.paypal.me/Inforcer25');
end;

procedure TForm1.lbl20Click(Sender: TObject);
begin
  OpenURL('http://oxidemod.org/threads/using-the-oxide-permission-system.24291/');
end;

procedure TForm1.lbl21Click(Sender: TObject);
begin
  OpenURL('http://oxidemod.org/resources/rust-server-manager.2494/');
end;

procedure TForm1.lbl27Click(Sender: TObject);
begin
  OpenURL('https://nodejs.org/en/');
end;

procedure TForm1.lbl30Click(Sender: TObject);
begin
  OpenURL('https://nodejs.org/en/');
end;

procedure TForm1.lbl32Click(Sender: TObject);
begin
  MultiDownloader('http://41.185.91.51/RSM/rcon-web-admin.zip');
end;

procedure TForm1.lbl34Click(Sender: TObject);
begin
  OpenURL('https://github.com/brainfoolong/rcon-web-admin');
end;

procedure TForm1.lbl36Click(Sender: TObject);
var
  commands1, commands2: TStringList;
begin
  if DirectoryExists('.\rcon-web-admin') then
    begin
      commands1 := TStringList.Create;
      try
        commands1.Add('@echo off');
        commands1.Add('cd rcon-web-admin');
        commands1.Add('npm install');
        commands1.Add('start rcon-web-admin-install-widget.bat');
      finally
        commands1.SaveToFile('rcon-web-admin-install-npm.bat');
        commands1.Free;
        if FileExists('rcon-web-admin-install-npm.bat') then
          WinExec('rcon-web-admin-install-npm.bat', SW_SHOWNORMAL)
        else
          ShowMessage('Something went wrong. Does the program have write permission?');
      end;
    end
  else
    ShowMessage('You need to download rcon web admin first!');

  if DirectoryExists('.\rcon-web-admin') then
    begin
      commands2 := TStringList.Create;
      try
        commands2.Add('@echo off');
        commands2.Add('cd rcon-web-admin');
        commands2.Add('node src/main.js install-core-widgets');
      finally
        commands2.SaveToFile('rcon-web-admin-install-widget.bat');
        commands2.Free;
        if FileExists('rcon-web-admin-install-widget.bat') then
          WinExec('rcon-web-admin-install-widget.bat', SW_SHOWNORMAL)
        else
          ShowMessage('Something went wrong. Does the program have write permission?');
      end;
    end
  else
    ShowMessage('You need to download rcon web admin first!');
end;

procedure TForm1.lbl7Click(Sender: TObject);
begin
  lstservers.Clear;
  GetDirList('.\server');
  lblcurrentservers.Caption := 'Current Servers: [' + IntToStr(lstservers.Items.Count) + ']';
end;

procedure TForm1.lbl8Click(Sender: TObject);
begin
  OpenURL('http://oxidemod.org/resources/rust-server-manager.2494/');
end;

procedure TForm1.lbl9Click(Sender: TObject);
begin
  OpenURL('https://github.com/Inforcer25/Rust-Server-Manager/issues');
end;

procedure TForm1.ListFileDir(Path: string; FileList: TStrings);
var
  SR: TSearchRec;
begin
  if FindFirst(Path + '*.*', faAnyFile, SR) = 0 then
  begin
    repeat
      if (SR.Attr <> faDirectory) then
      begin
        FileList.Add(SR.Name);
      end;
    until FindNext(SR) <> 0;
    FindClose(SR);
  end;
end;

procedure TForm1.LoadSettings;
var
  ini: TIniFile;
begin
  if FileExists(ini_settings) then
    begin
      ini := TIniFile.Create(ini_settings);
      try
        Branch := ini.ReadString('ServerSettings','Branch', 'normal');
        servername := ini.ReadString('Server Config', 'servername', '');
        description := ini.ReadString('Server Config', 'description', '');
        serverurl := ini.ReadString('Server Config', 'serverurl', '');
        serverbanner := ini.ReadString('Server Config', 'serverbanner', '');
        serverseed := ini.ReadString('Server Config', 'serverseed', '54162');
        worldsize := ini.ReadString('Server Config', 'worldsize', '4000');
        maxplayers := ini.ReadString('Server Config', 'maxplayers', '10');
        serveridentity := ini.ReadString('Server Config', 'serveridentity', '');
        rconpass := ini.ReadString('Server Config', 'rconpass', '');
        rconport := ini.ReadString('Server Config', 'rconport', '28016');
        serverport := ini.ReadString('Server Config', 'serverport', '28015');
        maptype := ini.ReadString('Server Config', 'maptype', 'Procedural Map');
        rconweb := StrToInt(ini.ReadString('Server Config', 'rconweb', '1'));
        serverip := ini.ReadString('ServerSettings','serverip', '0.0.0.0');
        rconip := ini.ReadString('ServerSettings','rconip', '0.0.0.0');
        saveinterval := ini.ReadString('ServerSettings','saveinterval', '300');

        lblbranch.Caption := Branch;
        lbledtservername.Text := servername;
        lbledtserverdescription.Text := description;
        lbledtserverurl.Text := serverurl;
        lbledtserverbanner.Text := serverbanner;
        sedserverseed.Value := StrToInt(serverseed);
        sedworldsize.Value := StrToInt(worldsize);
        sedmaxplayers.Value := StrToInt(maxplayers);
        lbledtserveridentity.Text := serveridentity;
        lbledtrconpass.Text := rconpass;
        lbledtrconport.Text := rconport;
        lbledtserverport.Text := serverport;
        lbledtserverip.Text := serverip;
        lbledtrconip.Text := rconip;
        sedsaveinterval.Value := StrToInt(saveinterval);
        if maptype = 'Procedural Map' then rgserverlevel.ItemIndex := 0;
        if maptype = 'Barren' then rgserverlevel.ItemIndex := 1;
        if maptype = 'HapisIsland' then rgserverlevel.ItemIndex := 2;
        if maptype = 'SavasIslandp' then rgserverlevel.ItemIndex := 3;
        if maptype = 'SavasIsland_koth' then rgserverlevel.ItemIndex := 4;
        if rconweb = 1 then chkrconweb.Checked
          else chkrconweb.Checked := False;

        backupdir := ini.ReadString('Application Settings', 'backupto', '');
        lbledtbackuppath.Text := backupdir;

        TStyleManager.SetStyle(ini.ReadString('Application Settings', 'theme', 'Ruby Graphite'));

        trckbrtransparency.Position := StrToInt(ini.ReadString('Application Settings', 'transparency', '255'));
        Form1.AlphaBlendValue := trckbrtransparency.Position;

        pgc1.ActivePageIndex := StrToInt(ini.ReadString('Application Settings', 'lasttab', '0'));
        chksaveactivetab.Checked := StrToBool(ini.ReadString('Application Settings', 'remember last tab', 'True'));
        if chksaveactivetab.Checked = False then
          pgc1.ActivePageIndex := 0;

        chkloadcustomtheme.Checked := StrToBool(ini.Readstring('Application Settings', 'loadcustomtheme', 'True'));
        if chkloadcustomtheme.Checked = True then
          begin
            if FileExists('theme.vsf') then
              begin
                TStyleManager.LoadFromFile('theme.vsf');
                TStyleManager.SetStyle('theme');
              end;
          end;

        chkglobalchat.Checked := StrToBool(ini.ReadString('ServerSettings','globalchat', 'True'));
        chkradiation.Checked := StrToBool(ini.ReadString('ServerSettings','radiation', 'True'));

      finally
        ini.Free;
      end;
    end;
end;

procedure TForm1.lstconfigsDblClick(Sender: TObject);
begin
  frmconfigeditor.sfolder := '.\oxide\config\';
  frmconfigeditor.sfile := lstconfigs.Items[lstconfigs.ItemIndex];
  frmconfigeditor.ShowModal;
end;

procedure TForm1.lstdataDblClick(Sender: TObject);
begin
  frmconfigeditor.sfolder := '.\oxide\data\';
  frmconfigeditor.sfile := lstdata.Items[lstdata.ItemIndex];
  frmconfigeditor.ShowModal;
end;

procedure TForm1.lstserversDblClick(Sender: TObject);
begin
  lbledtserveridentity.Text := lstservers.Items[lstservers.ItemIndex];
end;

procedure TForm1.MultiDownloader(link: string);
begin
  frmmultidownloader.multilink := link;
  frmmultidownloader.ShowModal;
end;

procedure TForm1.OpenFolder(Folder: PWideChar);
begin
    ShellExecute(Application.Handle, nil, Folder, nil, nil, SW_NORMAL);
end;

procedure TForm1.OpenURL(url: string);
begin
  ShellExecute(self.WindowHandle,'open',PChar(url),nil,nil, SW_SHOWNORMAL);
end;

function TForm1.SelectServerBranch: string;
begin
  frminstalleroption.ShowModal;
  Result := frminstalleroption.option;
end;

procedure TForm1.tmrbackupTimer(Sender: TObject);
begin
  mmobackuplog.Clear;
  dscmndbackup.CommandLine := 'xcopy "' + GetCurrentDir + '" "' + backupdir + '\" /h/i/c/k/e/r/y';
  dscmndbackup.OutputLines := mmobackuplog.Lines;
  if dscmndbackup.IsRunning = False then
    dscmndbackup.Execute
  else
    begin
      dscmndbackup.Stop;
      dscmndbackup.Execute
    end;
end;

procedure TForm1.tmrnextbackupTimer(Sender: TObject);
begin
  nextbackup := nextbackup - 1;
  if nextbackup = 0 then
    nextbackup := rtime;
  lbledtbackupstatus.Text := 'Next Backup: ' + FloatToStr(nextbackup) + ' mins';
end;

procedure TForm1.trckbrtransparencyChange(Sender: TObject);
begin
  Form1.AlphaBlendValue := trckbrtransparency.Position;
end;

end.
