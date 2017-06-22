unit uServerWipe;

interface

uses
  Winapi.Windows, Winapi.Messages, SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, System.IOUtils;

type
  Tfrmwipe = class(TForm)
    pnl1: TPanel;
    lst1: TListBox;
    btn1: TButton;
    btn2: TButton;
    pnl2: TPanel;
    chk1: TCheckBox;
    procedure btn1Click(Sender: TObject);
    procedure GetDirList(sPath: string);
    procedure btn2Click(Sender: TObject);
    procedure DeleteFilesMatchingPattern(const Directory, Pattern: string);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmwipe: Tfrmwipe;

implementation

{$R *.dfm}

procedure Tfrmwipe.btn1Click(Sender: TObject);
begin
  Close;
end;

procedure Tfrmwipe.btn2Click(Sender: TObject);
begin
  if chk1.Checked then
    begin
      if lst1.ItemIndex = -1 then
        begin
          ShowMessage('You have to select a server!');
        end
      else
        begin
          DeleteFilesMatchingPattern('.\server\' + lst1.Items[lst1.ItemIndex] + '\', '*.sav');
          ShowMessage('Server has been wiped!');
          Close;
        end;
    end
  else
    ShowMessage('You need to accept the fact that you know your server will be wiped!');

end;

procedure Tfrmwipe.DeleteFilesMatchingPattern(const Directory, Pattern: string);
var
  FileName: string;
begin
  for FileName in TDirectory.GetFiles(Directory, Pattern) do TFile.Delete(FileName);
end;

procedure Tfrmwipe.FormShow(Sender: TObject);
begin
  lst1.Clear;
  GetDirList('.\server');
end;

procedure Tfrmwipe.GetDirList(sPath: string);
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
          lst1.Items.Add(SearchRec.Name);
        Found := SysUtils.FindNext(SearchRec);
      end;
  finally
    SysUtils.FindClose(SearchRec);
  end;
end;

end.
