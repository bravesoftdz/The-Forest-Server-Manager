program pTFSM;

uses
  Vcl.Forms,
  uTFSM in 'uTFSM.pas' {Form1},
  Vcl.Themes,
  Vcl.Styles,
  uDownload in 'uDownload.pas' {frmextradownload},
  uSteamCMDinstaller in 'uSteamCMDinstaller.pas' {frmsteamcmdinstaller},
  uOxideModInstaller in 'uOxideModInstaller.pas' {frmoxidemodinstaller};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  TStyleManager.TrySetStyle('Aqua Graphite');
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(Tfrmextradownload, frmextradownload);
  Application.CreateForm(Tfrmsteamcmdinstaller, frmsteamcmdinstaller);
  Application.CreateForm(Tfrmoxidemodinstaller, frmoxidemodinstaller);
  Application.Run;
end.
