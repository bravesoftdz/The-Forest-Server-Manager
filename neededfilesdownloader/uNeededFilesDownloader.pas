unit uNeededFilesDownloader;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls,
  Vcl.ComCtrls, IdBaseComponent, IdComponent,
  IdTCPConnection, IdTCPClient, IdHTTP, System.Zip, ActiveX;

type

  TDownload = class;

  Tfrmneededdownload = class(TForm)
    btn1: TButton;
    pnl1: TPanel;
    pb1: TProgressBar;
    procedure btn1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

  TDownload = class(TThread)
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
  frmneededdownload: Tfrmneededdownload;

implementation

{$R *.dfm}
{ TDownload }

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
var
  Stream: TMemoryStream;
begin
  Stream := TMemoryStream.Create;
  try
    httpclient.Get(url, Stream);
    Stream.SaveToFile(filename);
  finally
    Stream.Free;
    frmneededdownload.Caption := 'Done Downloading. Extracting...';
    Sleep(2000);
    ExtractZip('needed.zip', '.\');
  end;
end;

procedure TDownload.ExtractZip(ZipFile, ExtractPath: string);
begin
  if TZipFile.IsValid(ZipFile) then
  begin
    TZipFile.ExtractZipFile(ZipFile, ExtractPath);
    DeleteFile(ZipFile);
    frmneededdownload.Caption := 'Success! APP RESTART NEEDED!';
    frmneededdownload.btn1.Enabled := True;
  end
  else
  begin
    frmneededdownload.Caption := 'Error Extracting or Downloading files...';
    frmneededdownload.btn1.Enabled := True;
  end;
end;

procedure TDownload.UpdateProgressBar;
var
  ZipFile: string;
begin
  frmneededdownload.pb1.Position := progressbarstatus;
  frmneededdownload.Caption := 'Downloading...';
end;

procedure TDownload.SetMaxProgressBar;
begin
  frmneededdownload.pb1.Max := maxprogressbar;
end;

destructor TDownload.Destroy;
begin
  FreeAndNil(httpclient);
  inherited Destroy;
end;

procedure Tfrmneededdownload.btn1Click(Sender: TObject);
begin
  Hide;
end;

procedure Tfrmneededdownload.FormShow(Sender: TObject);
var
  DownloadThread: TDownload;
  link: string;
begin
  link := 'http://inforcer25.co.za/nextcloud/index.php/s/B6gKGC1NcgknE5u/download';
  DownloadThread := TDownload.Create(True, link, 'needed.zip');
  DownloadThread.FreeOnTerminate := True;
  DownloadThread.Start;
end;

end.
