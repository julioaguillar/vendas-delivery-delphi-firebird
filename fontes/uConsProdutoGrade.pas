unit uConsProdutoGrade;

interface

uses
  Windows, Messages, SysUtils, uConsPadrao, ExtCtrls, Buttons, StdCtrls,
  pngimage, Controls, DB, Grids, DBGrids, Classes, uPadrao, IBODataset;

type
  TfrmConsProdutoGrade = class(TfrmPadrao)
    dtsRegistros: TDataSource;
    qryConsProduto: TIBOQuery;
    gpbPesquisa: TGroupBox;
    edtPesquisa: TEdit;
    gpbRegistros: TGroupBox;
    gpbBotoes: TGroupBox;
    btnConfirmar: TBitBtn;
    btnRetornar: TBitBtn;
    dbgRegistros: TDBGrid;
    procedure btnConfirmarClick(Sender: TObject);
    procedure btnRetornarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure edtPesquisaChange(Sender: TObject);
    procedure dbgRegistrosDblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmConsProdutoGrade: TfrmConsProdutoGrade;

implementation

{$R *.dfm}

procedure TfrmConsProdutoGrade.btnConfirmarClick(Sender: TObject);
begin
  inherited;

  ModalResult := mrOk;

end;

procedure TfrmConsProdutoGrade.btnRetornarClick(Sender: TObject);
begin
  inherited;

  ModalResult := mrRetry;

end;

procedure TfrmConsProdutoGrade.dbgRegistrosDblClick(Sender: TObject);
begin
  inherited;

  btnConfirmarClick(btnConfirmar);

end;

procedure TfrmConsProdutoGrade.edtPesquisaChange(Sender: TObject);
begin
  inherited;

  qryConsProduto.Close;
  qryConsProduto.SQL.Strings[qryConsProduto.SQL.Count-2] := 'WHERE UPPER(CAD_PRODUTO.DS_NOME) LIKE UPPER( '+QuotedStr('%'+edtPesquisa.Text+'%')+' )';
  qryConsProduto.Open;

end;

procedure TfrmConsProdutoGrade.FormCreate(Sender: TObject);
begin
  inherited;

  qryConsProduto.Close;
  qryConsProduto.Open;

end;

end.
