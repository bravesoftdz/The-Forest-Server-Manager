unit uAbout;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls,
  Vcl.Imaging.pngimage;

type
  Tfrmabout = class(TForm)
    btn1: TButton;
    pnl1: TPanel;
    pnl2: TPanel;
    img1: TImage;
    lbl1: TLabel;
    lbl2: TLabel;
    procedure btn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmabout: Tfrmabout;

implementation

{$R *.dfm}

procedure Tfrmabout.btn1Click(Sender: TObject);
begin
  Close;
end;

end.