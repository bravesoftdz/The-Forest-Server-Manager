program pTFSM;

uses
  Vcl.Forms,
  uTFSM in 'uTFSM.pas' {frmmain},
  Vcl.Themes,
  Vcl.Styles,
  uSettings in 'uSettings.pas' {frmsettings},
  uInstaller in 'uInstaller.pas' {frminstaller},
  uAbout in 'uAbout.pas' {frmabout};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  TStyleManager.TrySetStyle('Amakrits');
  Application.CreateForm(Tfrmmain, frmmain);
  Application.CreateForm(Tfrmsettings, frmsettings);
  Application.CreateForm(Tfrminstaller, frminstaller);
  Application.CreateForm(Tfrmabout, frmabout);
  Application.Run;
end.
