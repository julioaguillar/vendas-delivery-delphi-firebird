unit uConsVendedorVenda;

interface

uses
  Windows, Messages, SysUtils, uConsPadrao, ExtCtrls, Buttons, StdCtrls,
  pngimage, Controls, DB, Grids, DBGrids, Classes, uPadrao, IBODataset;

type
  TfrmConsVendedorVenda = class(TfrmPadrao)
    dtsRegistros: TDataSource;
    qryConsVendedor: TIBOQuery;
    gpbPesquisa: TGroupBox;
    edtPesquisa: TEdit;
    gpbRegistros: TGroupBox;
    dbgRegistros: TDBGrid;
    gpbBotoes: TGroupBox;
    btnConfirmar: TBitBtn;
    btnRetornar: TBitBtn;
    procedure btnConfirmarClick(Sender: TObject);
    procedure btnRetornarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmConsVendedorVenda: TfrmConsVendedorVenda;

implementation

{$R *.dfm}

procedure TfrmConsVendedorVenda.btnConfirmarClick(Sender: TObject);
begin
  inherited;

  ModalResult := mrOk;

end;

procedure TfrmConsVendedorVenda.btnRetornarClick(Sender: TObject);
begin
  inherited;

  ModalResult := mrRetry;

end;

procedure TfrmConsVendedorVenda.DBGrid1DblClick(Sender: TObject);
begin
  inherited;

  btnConfirmarClick(btnConfirmar);

end;

procedure TfrmConsVendedorVenda.Edit1Change(Sender: TObject);
begin
  inherited;

  qryConsVendedor.Close;
  qryConsVendedor.SQL.Strings[qryConsVendedor.SQL.Count-2] := 'WHERE UPPER(CAD_PROFISSIONAL.DS_NOME) LIKE UPPER( '+QuotedStr('%'+edtPesquisa.Text+'%')+' )';
  qryConsVendedor.Open;

end;

procedure TfrmConsVendedorVenda.FormCreate(Sender: TObject);
begin
  inherited;

  qryConsVendedor.Close;
  qryConsVendedor.Open;

end;

end.
