unit uServerInstaller;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls;

type
  Tfrminstalleroption = class(TForm)
    pnl1: TPanel;
    btn1: TButton;
    btn2: TButton;
    rg1: TRadioGroup;
    procedure btn1Click(Sender: TObject);
    procedure btn2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    option: string;
  end;

var
  frminstalleroption: Tfrminstalleroption;

implementation

{$R *.dfm}

procedure Tfrminstalleroption.btn1Click(Sender: TObject);
begin
  Close;
  option := '';
end;

procedure Tfrminstalleroption.btn2Click(Sender: TObject);
begin
  if rg1.ItemIndex = 0 then option := 'normal'
    else if rg1.ItemIndex = 1 then option := 'staging'
      else if rg1.ItemIndex = 2 then option := 'prerelease'
        else ShowMessage('You need to choose a branch!');

  Close;
end;

procedure Tfrminstalleroption.FormCreate(Sender: TObject);
begin
  rg1.ItemIndex := 0;
end;

end.
