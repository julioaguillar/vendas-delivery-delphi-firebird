unit uLctEntradaDetalhe;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uPadrao, StdCtrls, Mask, DBCtrls, Buttons, Grids, DBGrids, DB,
  IBODataset, ValEdit, DBClient, ExtCtrls, IB_Components;

type
  TfrmLctEntradaDetalhe = class(TfrmPadrao)
    gpbData: TGroupBox;
    gpbNumero: TGroupBox;
    gpbFornecedor: TGroupBox;
    gpbProdutos: TGroupBox;
    dbgProdutos: TDBGrid;
    gpbBotoes: TGroupBox;
    btnConfirmar: TBitBtn;
    btnCancelar: TBitBtn;
    btnIncluir: TBitBtn;
    btnExcluir: TBitBtn;
    btnAlterar: TBitBtn;
    dbeData: TDBEdit;
    dbeNumero: TDBEdit;
    dblFabrica: TDBLookupComboBox;
    CamposObrigatorios: TValueListEditor;
    cdsEntradaItem: TClientDataSet;
    dtsEntradaItem: TDataSource;
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    Panel5: TPanel;
    Label4: TLabel;
    cdsEntrada: TClientDataSet;
    dtsEntrada: TDataSource;
    Panel6: TPanel;
    lblTotalUnitario: TLabel;
    lblTotalQuantidade: TLabel;
    lblTotalDesconto: TLabel;
    lblTotalGeral: TLabel;
    trnsCadPadrao: TIB_Transaction;
    qryLctPedido: TIBOQuery;
    qryDeletaProdutos: TIBOQuery;
    qryLctPedidoProduto: TIBOQuery;
    qryConsulta: TIBOQuery;
    gpbHora: TGroupBox;
    dbeHora: TDBEdit;
    gpbDescricao: TGroupBox;
    dbeDescricao: TDBEdit;
    cdsEntradaDT_ENTRADA: TDateField;
    cdsEntradaHR_ENTRADA: TTimeField;
    cdsEntradaNR_ENTRADA: TStringField;
    cdsEntradaDS_ENTRADA: TStringField;
    cdsEntradaNR_QUANTIDADEPRODUTOS: TFloatField;
    cdsEntradaVR_TOTALENTRADA: TFloatField;
    cdsEntradaCD_FORNECEDOR: TIntegerField;
    cdsEntradaDS_NOME: TStringField;
    qryFornecedor: TIBOQuery;
    dtsFornecedor: TDataSource;
    cdsEntradaItemID_PRODUTO: TIntegerField;
    cdsEntradaItemVR_UNITARIO: TFloatField;
    cdsEntradaItemNR_QUANTIDADEPRODUTO: TFloatField;
    cdsEntradaItemVR_DESCONTO: TFloatField;
    cdsEntradaItemVR_TOTAL: TFloatField;
    cdsEntradaItemDS_NOME: TStringField;
    cdsEntradaID_ENTRADA: TIntegerField;
    dbeProduto: TDBEdit;
    procedure btnConfirmarClick(Sender: TObject);
    procedure btnIncluirClick(Sender: TObject);
    procedure cdsEntradaAfterOpen(DataSet: TDataSet);
    procedure btnExcluirClick(Sender: TObject);
    procedure dblFabricaEnter(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure dbeProdutoEnter(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    procedure CalculaTotais;
    { Private declarations }
  public
    { Public declarations }

    fgOperacao: String;

  end;

var
  frmLctEntradaDetalhe: TfrmLctEntradaDetalhe;

implementation

uses udmPrincipal, uFuncoes, uCadProdutoEntrada;

{$R *.dfm}

procedure TfrmLctEntradaDetalhe.btnAlterarClick(Sender: TObject);
begin
  inherited;

  cdsEntradaItem.Edit;

  frmCadProdutoEntrada := TfrmCadProdutoEntrada.Create(Self);
  frmCadProdutoEntrada.ShowModal;

  if ( frmCadProdutoEntrada.ModalResult = mrOk ) then
    CalculaTotais;

  FreeAndNil(frmCadProdutoEntrada);

end;

procedure TfrmLctEntradaDetalhe.btnCancelarClick(Sender: TObject);
begin
  inherited;

  if ( cdsEntrada.State in [dsInsert,dsEdit] ) then
    cdsEntrada.Cancel;

  if ( cdsEntradaItem.State in [dsInsert,dsEdit] ) then
    cdsEntradaItem.Cancel;

  ModalResult := mrCancel;

end;

procedure TfrmLctEntradaDetalhe.btnConfirmarClick(Sender: TObject);
var
  idEntrada: Integer;
begin
  inherited;

  if ( not ( ValidaCampoObrigatorio(Self, CamposObrigatorios) ) ) then
    Abort;

  try

    if ( cdsEntrada.State in [dsInsert, dsEdit] ) then
      cdsEntrada.Post;

    qryLctPedido.Close;
    qryLctPedido.SQL.Clear;

    idEntrada := 0;

    if ( fgOperacao = 'INSERCAO' ) then
    begin

      qryConsulta.Close;
      qryConsulta.SQL.Text := 'SELECT GEN_ID(GEN_ID_LCT_ENTRADA, 1) AS ID FROM RDB$DATABASE';
      qryConsulta.Open;

      idEntrada := qryConsulta.FieldByName('ID').AsInteger;

      qryLctPedido.SQL.Add('INSERT INTO LCT_ENTRADA (                                          ');
      qryLctPedido.SQL.Add('  ID_ENTRADA, DT_ENTRADA, HR_ENTRADA, NR_ENTRADA, DS_ENTRADA,      ');
      qryLctPedido.SQL.Add('  NR_QUANTIDADEPRODUTOS, VR_TOTALENTRADA, CD_FORNECEDOR)           ');
      qryLctPedido.SQL.Add('VALUES (                                                           ');
      qryLctPedido.SQL.Add('  :ID_ENTRADA, :DT_ENTRADA, :HR_ENTRADA, :NR_ENTRADA, :DS_ENTRADA, ');
      qryLctPedido.SQL.Add('  :NR_QUANTIDADEPRODUTOS, :VR_TOTALENTRADA, :CD_FORNECEDOR)        ');

    end
    else if ( fgOperacao = 'ALTERACAO' ) then
    begin

      qryLctPedido.SQL.Add('UPDATE LCT_ENTRADA                                  ');
      qryLctPedido.SQL.Add('SET DT_ENTRADA = :DT_ENTRADA,                       ');
      qryLctPedido.SQL.Add('    HR_ENTRADA = :HR_ENTRADA,                       ');
      qryLctPedido.SQL.Add('    NR_ENTRADA = :NR_ENTRADA,                       ');
      qryLctPedido.SQL.Add('    DS_ENTRADA = :DS_ENTRADA,                       ');
      qryLctPedido.SQL.Add('    NR_QUANTIDADEPRODUTOS = :NR_QUANTIDADEPRODUTOS, ');
      qryLctPedido.SQL.Add('    VR_TOTALENTRADA = :VR_TOTALENTRADA,             ');
      qryLctPedido.SQL.Add('    CD_FORNECEDOR = :CD_FORNECEDOR                  ');
      qryLctPedido.SQL.Add('WHERE ID_ENTRADA = :ID_ENTRADA                      ');

      idEntrada := cdsEntrada.FieldByName('ID_ENTRADA').Value;

    end;

    qryLctPedido.ParamByName('ID_ENTRADA').Value            := idEntrada;
    qryLctPedido.ParamByName('DT_ENTRADA').Value            := cdsEntrada.FieldByName('DT_ENTRADA').Value;
    qryLctPedido.ParamByName('HR_ENTRADA').Value            := cdsEntrada.FieldByName('HR_ENTRADA').Value;
    qryLctPedido.ParamByName('NR_ENTRADA').Value            := cdsEntrada.FieldByName('NR_ENTRADA').Value;
    qryLctPedido.ParamByName('DS_ENTRADA').Value            := cdsEntrada.FieldByName('DS_ENTRADA').Value;
    qryLctPedido.ParamByName('NR_QUANTIDADEPRODUTOS').Value := cdsEntrada.FieldByName('NR_QUANTIDADEPRODUTOS').Value;
    qryLctPedido.ParamByName('VR_TOTALENTRADA').Value       := cdsEntrada.FieldByName('VR_TOTALENTRADA').Value;
    qryLctPedido.ParamByName('CD_FORNECEDOR').Value         := cdsEntrada.FieldByName('CD_FORNECEDOR').Value;
    qryLctPedido.ExecSQL;

    // PRODUTOS

    qryDeletaProdutos.Close;
    qryDeletaProdutos.ParamByName('ID_ENTRADA').AsInteger := idEntrada;
    qryDeletaProdutos.ExecSQL;

    cdsEntradaItem.DisableControls;
    cdsEntradaItem.First;

    while not ( cdsEntradaItem.Eof ) do
    begin

      qryConsulta.Close;
      qryConsulta.Open;

      qryLctPedidoProduto.Close;
      qryLctPedidoProduto.ParamByName('ID_ENTRADA').Value           := idEntrada;
      qryLctPedidoProduto.ParamByName('ID_ENTRADAITEM').Value       := qryConsulta.FieldByName('ID').AsInteger;
      qryLctPedidoProduto.ParamByName('ID_PRODUTO').Value           := cdsEntradaItem.FieldByName('ID_PRODUTO').Value;
      qryLctPedidoProduto.ParamByName('VR_UNITARIO').Value          := cdsEntradaItem.FieldByName('VR_UNITARIO').Value;
      qryLctPedidoProduto.ParamByName('NR_QUANTIDADEPRODUTO').Value := cdsEntradaItem.FieldByName('NR_QUANTIDADEPRODUTO').Value;
      qryLctPedidoProduto.ParamByName('VR_DESCONTO').Value          := cdsEntradaItem.FieldByName('VR_DESCONTO').Value;
      qryLctPedidoProduto.ParamByName('VR_TOTAL').Value             := cdsEntradaItem.FieldByName('VR_TOTAL').Value;
      qryLctPedidoProduto.ExecSQL;

      cdsEntradaItem.Next;

    end;

    // *******************************************************************

    trnsCadPadrao.Commit;

    ModalResult := mrOk;

  except
    on e: Exception do
    begin
      trnsCadPadrao.Rollback;
      MsgBox('"Prezado Cliente"'#13'Ocorreu um erro na gravação da Entrada com a seguinte mensagem:'+#13#13+e.Message, MB_OK+MB_ICONERROR);
      ModalResult := mrCancel;
    end;
  end;

end;

procedure TfrmLctEntradaDetalhe.btnExcluirClick(Sender: TObject);
begin
  inherited;

  if ( not ( cdsEntradaItem.IsEmpty ) ) and
     ( MsgBox('"Prezado Cliente"'#13'Confirma a exclusão do registro', MB_YESNO+MB_ICONQUESTION) = IDYES ) then
  begin
    cdsEntradaItem.Delete;
    CalculaTotais;
  end;

end;

procedure TfrmLctEntradaDetalhe.btnIncluirClick(Sender: TObject);
begin
  inherited;

  cdsEntradaItem.DisableControls;
  cdsEntradaItem.First;

  frmCadProdutoEntrada := TfrmCadProdutoEntrada.Create(Self);

  while (not cdsEntradaItem.Eof) do
  begin
    frmCadProdutoEntrada.cdsEntradaItemCopy.Append;
    frmCadProdutoEntrada.cdsEntradaItemCopy.FieldByName('ID_PRODUTO').AsInteger := cdsEntradaItem.FieldByName('ID_PRODUTO').AsInteger;
    frmCadProdutoEntrada.cdsEntradaItemCopy.Post;

    cdsEntradaItem.Next;
  end;

  cdsEntradaItem.EnableControls;

  cdsEntradaItem.Append;
  cdsEntradaItemVR_DESCONTO.AsFloat := 0.0;

  frmCadProdutoEntrada.ShowModal;

  if ( frmCadProdutoEntrada.ModalResult = mrOk ) then
    CalculaTotais;

  FreeAndNil(frmCadProdutoEntrada);

end;

procedure TfrmLctEntradaDetalhe.cdsEntradaAfterOpen(DataSet: TDataSet);
begin
  inherited;

  with cdsEntrada do
  begin

    ( cdsEntrada.FieldByName('DT_ENTRADA') as TDateField ).OnSetText := dmPrincipal.ValidaData;
    ( cdsEntrada.FieldByName('HR_ENTRADA') as TTimeField ).OnSetText := dmPrincipal.ValidaHora;

  end;

end;

procedure TfrmLctEntradaDetalhe.dbeProdutoEnter(Sender: TObject);
begin
  inherited;

  if ( dbgProdutos.Enabled ) then
    dbgProdutos.SetFocus;

end;

procedure TfrmLctEntradaDetalhe.dblFabricaEnter(Sender: TObject);
begin
  inherited;

  dblFabrica.DropDown;

end;

procedure TfrmLctEntradaDetalhe.FormCreate(Sender: TObject);
begin
  inherited;

  qryFornecedor.Close;
  qryFornecedor.Open;

end;

procedure TfrmLctEntradaDetalhe.FormShow(Sender: TObject);
begin
  inherited;

  if (fgOperacao = 'ALTERACAO') then
    CalculaTotais;

end;

procedure TfrmLctEntradaDetalhe.CalculaTotais;
var totalUnitario, totalDesconto, totalGeral: Double;
    totalQuantidade: Integer;
begin

  totalUnitario   := 0.0;
  totalDesconto   := 0.0;
  totalGeral      := 0.0;
  totalQuantidade := 0;

  cdsEntradaItem.DisableControls;
  cdsEntradaItem.First;

  while not ( cdsEntradaItem.Eof ) do
  begin

    totalUnitario   := totalUnitario + cdsEntradaItemVR_UNITARIO.AsFloat;
    totalDesconto   := totalDesconto + cdsEntradaItemVR_DESCONTO.AsFloat;
    totalGeral      := totalGeral + cdsEntradaItemVR_TOTAL.AsFloat;
    totalQuantidade := totalQuantidade + cdsEntradaItemNR_QUANTIDADEPRODUTO.AsInteger;

    cdsEntradaItem.Next;

  end;

  cdsEntradaItem.First;
  cdsEntradaItem.EnableControls;

  lblTotalUnitario.Caption   := FormatFloat('#,###,###,##0.00', totalUnitario)+' ';
  lblTotalDesconto.Caption   := FormatFloat('#,###,###,##0.00', totalDesconto)+' ';
  lblTotalGeral.Caption      := FormatFloat('#,###,###,##0.00', totalGeral)+' ';
  lblTotalQuantidade.Caption := FormatFloat('#,###,###,##0.00', totalQuantidade)+' ';

  if (cdsEntrada.State in [dsEdit, dsInsert]) then
  begin
    cdsEntrada.FieldByName('NR_QUANTIDADEPRODUTOS').Value := cdsEntradaItem.RecordCount;
    cdsEntrada.FieldByName('VR_TOTALENTRADA').Value       := totalGeral;
  end;

end;

end.
