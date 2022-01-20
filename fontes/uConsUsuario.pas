unit uConsUsuario;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uConsPadrao, DB, Grids, DBGrids, StdCtrls, Buttons, IBODataset;

type
  TfrmConsUsuario = class(TfrmConsPadrao)
    qryConsulta: TIBOQuery;
    procedure FormCreate(Sender: TObject);
    procedure btnConfirmarClick(Sender: TObject);
    procedure btnRetornarClick(Sender: TObject);
    procedure dbgRegistrosDblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmConsUsuario: TfrmConsUsuario;

implementation

uses udmPrincipal;

{$R *.dfm}

procedure TfrmConsUsuario.btnConfirmarClick(Sender: TObject);
begin
  inherited;

  ModalResult := mrOk;

end;

procedure TfrmConsUsuario.btnRetornarClick(Sender: TObject);
begin
  inherited;

  ModalResult := mrRetry;

end;

procedure TfrmConsUsuario.dbgRegistrosDblClick(Sender: TObject);
begin
  inherited;

  btnConfirmarClick(btnConfirmar);

end;

procedure TfrmConsUsuario.FormCreate(Sender: TObject);
begin
  inherited;

  qryConsulta.Close;
  qryConsulta.Open;

end;

end.
