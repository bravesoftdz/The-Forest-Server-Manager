unit uOxideModInstaller;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.ComCtrls, Vcl.StdCtrls, IdBaseComponent, IdComponent,
  IdTCPConnection, IdTCPClient, IdHTTP, System.Zip;

type

  TDownload = class;

  Tfrmoxidemod = class(TForm)
    lbl1: TLabel;
    btn1: TButton;
    pb1: TProgressBar;
    lblStatus: TLabel;
    procedure btn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

  TDownload = class (TThread)
  private
    httpclient: TIdHTTP;
    url: string;
    filename: string;
    maxprogressbar: integer;
    progressbarstatus: integer;
    procedure ExtractZip(ZipFile: string; ExtractPath: string);
    procedure idhttp1Work(ASender: TObject; AWorkMode: TWorkMode;
      AWorkCount: Int64);
    procedure idhttp1WorkBegin(ASender: TObject; AWorkMode: TWorkMode;
      AWorkCountMax: Int64);
    procedure UpdateProgressBar;
    procedure SetMaxProgressBar;
  protected
    procedure Execute; override;
  public
    constructor Create(CreateSuspended: boolean; aurl, afilename: string);
    destructor Destroy; override;
  end;

var
  frmoxidemod: Tfrmoxidemod;

implementation

{$R *.dfm}

{ Thread }

constructor TDownload.Create(CreateSuspended: boolean; aurl, afilename: string);
begin
  inherited Create(CreateSuspended);
  httpclient := TIdHTTP.Create(nil);
  httpclient.OnWorkBegin := idhttp1WorkBegin;
  httpclient.OnWork := idhttp1Work;
  url := aurl;
  filename := afilename;
end;

procedure TDownload.idhttp1Work(ASender: TObject; AWorkMode: TWorkMode;
  AWorkCount: Int64);
begin
  progressbarstatus := AWorkCount;
  Queue(UpdateProgressBar);

end;

procedure TDownload.idhttp1WorkBegin(ASender: TObject; AWorkMode: TWorkMode;
   AWorkCountMax: Int64);
begin
  maxprogressbar := AWorkCountMax;
  Queue(SetMaxProgressBar);
end;

procedure TDownload.Execute;
var Stream: TMemoryStream;
begin
  Stream := TMemoryStream.Create;
  try
    httpclient.Get(url, Stream);
    Stream.SaveToFile(FileName);
  finally
    Stream.Free;
  end;
end;

procedure TDownload.UpdateProgressBar;
var
  ZipFile: string;
begin
  frmoxidemod.pb1.Position := progressbarstatus;
  frmoxidemod.lblStatus.Caption := 'Downloading...';

  if frmoxidemod.pb1.Position = frmoxidemod.pb1.Max then
    begin
      frmoxidemod.lblStatus.Caption := 'Done Downloading. Installing...';
      Sleep(2000);
      ExtractZip('oxide.zip', GetCurrentDir);
    end;
end;

procedure TDownload.SetMaxProgressBar;
begin
  frmoxidemod.pb1.Max := maxprogressbar;
end;

destructor TDownload.Destroy;
begin
  FreeAndNil(httpclient);
  inherited Destroy;
end;

{ TForm1 }

procedure Tfrmoxidemod.btn1Click(Sender: TObject);
var
  DownloadThread: TDownload;
  link: string;
begin
  link := 'http://41.185.91.51/TFSM/Oxide-TheForest.zip';
   DownloadThread := TDownload.Create(true, link, 'oxide.zip');
   DownloadThread.FreeOnTerminate:=true;
   DownloadThread.Start;
end;

procedure TDownload.ExtractZip(ZipFile, ExtractPath: string);
begin
  if TZipFile.IsValid(ZipFile) then
    begin
      TZipFile.ExtractZipFile(ZipFile, ExtractPath);
      frmoxidemod.lblStatus.Caption := 'Oxide Installed!';
    end
  else
    begin
      ShowMessage('Zip File is not valid');
      frmoxidemod.lblStatus.Caption := 'Error Installing Oxide!';
    end;
end;

end.
