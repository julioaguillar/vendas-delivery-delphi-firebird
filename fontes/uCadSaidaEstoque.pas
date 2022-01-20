unit uCadSaidaEstoque;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uPadrao, DB, IBODataset, Grids, ValEdit, StdCtrls, Buttons, Mask,
  DBCtrls, DBGrids;

type
  TfrmCadSaidaEstoque = class(TfrmPadrao)
    gpbProdutos: TGroupBox;
    dbgProdutos: TDBGrid;
    gpbItem: TGroupBox;
    dbeItem: TDBEdit;
    gpbObservacao: TGroupBox;
    dbeObservacao: TDBEdit;
    gpbBotoes: TGroupBox;
    btnConfirmar: TBitBtn;
    btnCancelar: TBitBtn;
    gpbPrecoVenda: TGroupBox;
    dbePrecoVenda: TDBEdit;
    gpbData: TGroupBox;
    dbeData: TDBEdit;
    gpbQuantidadeSaida: TGroupBox;
    dbeQuantidadeSaida: TDBEdit;
    gpbTotal: TGroupBox;
    dbeTotal: TDBEdit;
    CamposObrigatorios: TValueListEditor;
    qryConsProdutos: TIBOQuery;
    dtsConsProduto: TDataSource;
    dtsLancamentoProduto: TDataSource;
    procedure btnCancelarClick(Sender: TObject);
    procedure btnConfirmarClick(Sender: TObject);
    procedure dbePrecoVendaExit(Sender: TObject);
    procedure dbeQuantidadeSaidaExit(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure qryConsProdutosAfterScroll(DataSet: TDataSet);
    procedure dbgProdutosTitleClick(Column: TColumn);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadSaidaEstoque: TfrmCadSaidaEstoque;

implementation

uses uLctSaidaEstoque, uFuncoes, udmPrincipal;

{$R *.dfm}

procedure TfrmCadSaidaEstoque.btnCancelarClick(Sender: TObject);
begin
  inherited;

  ModalResult := mrCancel;

end;

procedure TfrmCadSaidaEstoque.btnConfirmarClick(Sender: TObject);
begin
  inherited;

  if ( qryConsProdutos.IsEmpty ) then
  begin
    MsgBox('"Prezado Cliente'+#13+'É necessário informar um material para realizar o lançamento de saída', MB_OK+MB_ICONINFORMATION);
    Abort;
  end;

  if ( not ( ValidaCampoObrigatorio(Self, CamposObrigatorios) ) ) then
    Abort;

  try

    dtsLancamentoProduto.DataSet.FieldByName('ID_SAIDAPRODUTO').AsInteger := 0;
    dtsLancamentoProduto.DataSet.FieldByName('ID_PRODUTO').AsInteger      := qryConsProdutos.FieldByName('ID_PRODUTO').AsInteger;

    dtsLancamentoProduto.DataSet.Post;
    frmLctSaidaEstoque.trnsCadPadrao.Commit;

  except
    on e: Exception do
    begin
      frmLctSaidaEstoque.trnsCadPadrao.Rollback;
      MsgBox('"Prezado Cliente"'+#13+'Ocorreu um erro na inclusão do registro com a seguinte mensagem: '+e.Message, MB_OK+MB_ICONINFORMATION);
    end;
  end;

  ModalResult := mrOk;

end;

procedure TfrmCadSaidaEstoque.dbePrecoVendaExit(Sender: TObject);
begin
  inherited;

  dtsLancamentoProduto.DataSet.FieldByName('VR_TOTAL').AsFloat := dtsLancamentoProduto.DataSet.FieldByName('VR_PRECOPRODUTO').AsFloat * dtsLancamentoProduto.DataSet.FieldByName('QT_SAIDAPRODUTO').AsInteger;

end;

procedure TfrmCadSaidaEstoque.dbeQuantidadeSaidaExit(Sender: TObject);
begin
  inherited;

  if ( dbeQuantidadeSaida.Text <> '' ) and ( qryConsProdutos.FieldByName('NR_QUANTIDADEESTOQUE').AsInteger < StrToInt(dbeQuantidadeSaida.Text) ) then
  begin
    MsgBox('"Prezado Cliente"'+#13+'Quantidade de Saída informada maior que a quantidade do material em estoque', MB_OK+MB_ICONINFORMATION);
    dbeQuantidadeSaida.SetFocus;
    Abort;
  end;

  dtsLancamentoProduto.DataSet.FieldByName('VR_TOTAL').AsFloat := dtsLancamentoProduto.DataSet.FieldByName('VR_PRECOPRODUTO').AsFloat * dtsLancamentoProduto.DataSet.FieldByName('QT_SAIDAPRODUTO').AsInteger;

end;

procedure TfrmCadSaidaEstoque.dbgProdutosTitleClick(Column: TColumn);
begin
  inherited;

  OrdenaGrid(dbgProdutos, Column, 'CAD_PRODUTO');

end;

procedure TfrmCadSaidaEstoque.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;

  if ( dtsLancamentoProduto.DataSet.State in [dsInsert,dsEdit] ) then
    dtsLancamentoProduto.DataSet.Cancel;

end;

procedure TfrmCadSaidaEstoque.FormCreate(Sender: TObject);
begin
  inherited;

  qryConsProdutos.Close;
  qryConsProdutos.Open;

end;

procedure TfrmCadSaidaEstoque.qryConsProdutosAfterScroll(DataSet: TDataSet);
begin
  inherited;

  if ( dtsLancamentoProduto.DataSet.State in [dsInsert,dsEdit] ) then
  begin
    dtsLancamentoProduto.DataSet.FieldByName('VR_PRECOPRODUTO').AsFloat := qryConsProdutos.FieldByName('VR_PRECOVENDA').AsFloat;
    dtsLancamentoProduto.DataSet.FieldByName('VR_TOTAL').AsFloat        := dtsLancamentoProduto.DataSet.FieldByName('VR_PRECOPRODUTO').AsFloat * dtsLancamentoProduto.DataSet.FieldByName('QT_SAIDAPRODUTO').AsInteger;
  end;

end;

end.
