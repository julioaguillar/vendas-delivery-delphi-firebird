unit uConsClienteVenda;

interface

uses
  Windows, Messages, SysUtils, uConsPadrao, ExtCtrls, Buttons, StdCtrls,
  pngimage, Controls, DB, Grids, DBGrids, Classes, uPadrao, IBODataset;

type
  TfrmConsClienteVenda = class(TfrmPadrao)
    dtsRegistros: TDataSource;
    qryConsCliente: TIBOQuery;
    gpbPesquisa: TGroupBox;
    edtPesquisa: TEdit;
    gpbBotoes: TGroupBox;
    btnConfirmar: TBitBtn;
    btnRetornar: TBitBtn;
    btnIncluir: TBitBtn;
    gpbRegistros: TGroupBox;
    dbgRegistros: TDBGrid;
    procedure btnConfirmarClick(Sender: TObject);
    procedure btnRetornarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnIncluirClick(Sender: TObject);
    procedure edtPesquisaChange(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmConsClienteVenda: TfrmConsClienteVenda;

implementation

uses uCadCliente;

{$R *.dfm}

procedure TfrmConsClienteVenda.btnConfirmarClick(Sender: TObject);
begin
  inherited;

  ModalResult := mrOk;

end;

procedure TfrmConsClienteVenda.btnIncluirClick(Sender: TObject);
begin
  inherited;

  frmCadCliente := TfrmCadCliente.Create(Self);
  frmCadCliente.ShowModal;
  FreeAndNil(frmCadCliente);

  qryConsCliente.Close;
  qryConsCliente.Open;

end;

procedure TfrmConsClienteVenda.btnRetornarClick(Sender: TObject);
begin
  inherited;

  ModalResult := mrRetry;

end;

procedure TfrmConsClienteVenda.DBGrid1DblClick(Sender: TObject);
begin
  inherited;

  btnConfirmarClick(btnConfirmar);

end;

procedure TfrmConsClienteVenda.edtPesquisaChange(Sender: TObject);
begin
  inherited;

  qryConsCliente.Close;
  qryConsCliente.SQL.Strings[qryConsCliente.SQL.Count-2] := 'WHERE UPPER(CAD_CLIENTE.DS_NOME) LIKE UPPER( '+QuotedStr('%'+edtPesquisa.Text+'%')+' )';
  qryConsCliente.Open;

end;

procedure TfrmConsClienteVenda.FormCreate(Sender: TObject);
begin
  inherited;

  qryConsCliente.Close;
  qryConsCliente.Open;

end;

end.
