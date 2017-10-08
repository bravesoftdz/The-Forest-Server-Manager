program TFSM;

uses
  Vcl.Forms,
  uTFSM in 'uTFSM.pas' {Form1},
  uOxideModInstaller in 'ServerInstaller\uOxideModInstaller.pas' {frmoxidemodinstaller},
  uSteamCMDinstaller in 'ServerInstaller\uSteamCMDinstaller.pas' {frmsteamcmdinstaller},
  uNeededFilesDownloader in 'neededfilesdownloader\uNeededFilesDownloader.pas' {frmneededdownload},
  Vcl.Themes,
  Vcl.Styles;

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  TStyleManager.TrySetStyle('Material Black Pearl');
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(Tfrmoxidemodinstaller, frmoxidemodinstaller);
  Application.CreateForm(Tfrmsteamcmdinstaller, frmsteamcmdinstaller);
  Application.CreateForm(Tfrmneededdownload, frmneededdownload);
  Application.Run;
end.
