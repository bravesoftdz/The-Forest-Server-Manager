program TFSM;

uses
  Vcl.Forms,
  uTFSM in 'uTFSM.pas' {frmmain},
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
  Application.CreateForm(Tfrmmain, frmmain);
  Application.CreateForm(Tfrmoxidemodinstaller, frmoxidemodinstaller);
  Application.CreateForm(Tfrmsteamcmdinstaller, frmsteamcmdinstaller);
  Application.CreateForm(Tfrmneededdownload, frmneededdownload);
  Application.Run;
end.
