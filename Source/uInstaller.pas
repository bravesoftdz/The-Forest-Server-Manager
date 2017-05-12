unit uInstaller;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, DosCommand, Tlhelp32;

type
  Tfrminstaller = class(TForm)
    pnl1: TPanel;
    mmo1: TMemo;
    btn1: TButton;
    btn2: TButton;
    btn3: TButton;
    dscmnd1: TDosCommand;
    procedure btn3Click(Sender: TObject);
    procedure btn1Click(Sender: TObject);
    procedure btn2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    function KillTask(ExeFileName: string): Integer;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
    command: TStringList;
    steamcmdpath: string;
  end;

var
  frminstaller: Tfrminstaller;

implementation

{$R *.dfm}

procedure Tfrminstaller.btn1Click(Sender: TObject);
begin
  dscmnd1.Stop;
  command:= TStringlist.create;
  try
    command.Clear;
    command.Add('@echo off');
    command.Add('echo Starting Installation DO NOT CLOSE THIS WINDOW!');
    command.Add(steamcmdpath + '\steamcmd.exe +login anonymous +force_install_dir "' + GetCurrentDir + '" +app_update 556450 +quit');
    command.Add('echo Done');
    command.SaveToFile('UpdateInstall.bat');
  finally
    command.Free
  end;

  dscmnd1.CommandLine := 'UpdateInstall.bat';
  dscmnd1.OutputLines := mmo1.Lines;
  dscmnd1.Execute;
end;

procedure Tfrminstaller.btn2Click(Sender: TObject);
begin
  dscmnd1.Stop;
  command:= TStringlist.create;
  try
    command.Clear;
    command.Add('@echo off');
    command.Add('echo Starting Update DO NOT CLOSE THIS WINDOW!');
    command.Add(steamcmdpath + '\steamcmd.exe +login anonymous +force_install_dir "' + GetCurrentDir + '" +app_update 556450 +quit');
    command.Add('echo Done');
    command.SaveToFile('UpdateInstall.bat');
  finally
    command.Free
  end;

  dscmnd1.CommandLine := 'UpdateInstall.bat';
  dscmnd1.OutputLines := mmo1.Lines;
  dscmnd1.Execute;
end;

procedure Tfrminstaller.btn3Click(Sender: TObject);
begin
  Close;
  dscmnd1.Stop;
end;

procedure Tfrminstaller.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  KillTask('steamcmd.exe');
end;

procedure Tfrminstaller.FormShow(Sender: TObject);
begin
  mmo1.SetFocus;
end;

function Tfrminstaller.KillTask(ExeFileName: string): Integer;
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

end.