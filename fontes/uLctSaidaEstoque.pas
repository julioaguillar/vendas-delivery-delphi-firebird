unit uLctSaidaEstoque;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uPadrao, IB_Components, DB, IBODataset, StdCtrls, Buttons, Grids,
  DBGrids, Mask, DBCtrls, StrUtils, Math;

type
  TfrmLctSaidaEstoque = class(TfrmPadrao)
    gpbLancamento: TGroupBox;
    dbgLancamentoProduto: TDBGrid;
    gpbBotoes: TGroupBox;
    btnConsultar: TBitBtn;
    btnIncluir: TBitBtn;
    btnExcluir: TBitBtn;
    btnAlterar: TBitBtn;
    dtsLctEntradaProduto: TDataSource;
    qryLctSaidaProduto: TIBOQuery;
    trnsCadPadrao: TIB_Transaction;
    lblProduto: TLabel;
    dblProduto: TDBLookupComboBox;
    lblPeriodo: TLabel;
    edtDataInicio: TMaskEdit;
    lblA: TLabel;
    edtDataFim: TMaskEdit;
    btnFiltro: TBitBtn;
    qryConsProdutos: TIBOQuery;
    dtsConsProdutos: TDataSource;
    procedure btnAlterarClick(Sender: TObject);
    procedure btnConsultarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnIncluirClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure dblProdutoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtDataInicioExit(Sender: TObject);
    procedure edtDataFimExit(Sender: TObject);
    procedure btnFiltroClick(Sender: TObject);
    procedure dbgLancamentoProdutoTitleClick(Column: TColumn);
    procedure qryLctSaidaProdutoAfterOpen(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmLctSaidaEstoque: TfrmLctSaidaEstoque;

implementation

uses udmPrincipal, uCadSaidaEstoque, uFuncoes;

{$R *.dfm}

procedure TfrmLctSaidaEstoque.btnAlterarClick(Sender: TObject);
begin
  inherited;

  if ( not ( qryLctSaidaProduto.IsEmpty ) ) then
  begin

    qryLctSaidaProduto.Edit;

    frmCadSaidaEstoque := TfrmCadSaidaEstoque.Create(Self);

    frmCadSaidaEstoque.qryConsProdutos.Locate('ID_PRODUTO', qryLctSaidaProduto.FieldByName('ID_PRODUTO').AsInteger, []);
    frmCadSaidaEstoque.dbgProdutos.Enabled := false;

    frmCadSaidaEstoque.ShowModal;

    if ( frmCadSaidaEstoque.ModalResult = mrOk ) then
      qryLctSaidaProduto.Refresh;

    FreeAndNil(frmCadSaidaEstoque);

  end;

end;

procedure TfrmLctSaidaEstoque.btnConsultarClick(Sender: TObject);
begin
  inherited;

  if ( not ( qryLctSaidaProduto.IsEmpty ) ) then
  begin

    frmCadSaidaEstoque := TfrmCadSaidaEstoque.Create(Self);

    frmCadSaidaEstoque.qryConsProdutos.Locate('ID_PRODUTO', qryLctSaidaProduto.FieldByName('ID_PRODUTO').AsInteger, []);
    frmCadSaidaEstoque.dbgProdutos.Enabled := false;

    frmCadSaidaEstoque.dbeData.Enabled            := false;
    frmCadSaidaEstoque.dbeQuantidadeSaida.Enabled := false;
    frmCadSaidaEstoque.dbeObservacao.Enabled      := false;
    frmCadSaidaEstoque.dbePrecoVenda.Enabled      := false;
    frmCadSaidaEstoque.dbeTotal.Enabled           := false;

    frmCadSaidaEstoque.btnConfirmar.Enabled := false;

    frmCadSaidaEstoque.ShowModal;

    FreeAndNil(frmCadSaidaEstoque);

  end;

end;

procedure TfrmLctSaidaEstoque.btnExcluirClick(Sender: TObject);
begin
  inherited;

  if ( not ( qryLctSaidaProduto.IsEmpty ) ) and
     ( MsgBox('"Prezado Cliente"'+#13+'Confirma a exclusão do registro', MB_YESNO+MB_ICONQUESTION) = IDYES ) then
  begin

    try

      qryLctSaidaProduto.Delete;
      trnsCadPadrao.Commit;

    except
      on e: Exception do
      begin
        trnsCadPadrao.Rollback;
        MsgBox('"Prezado Cliente"'+#13+'Ocorreu um erro na exclusão do registro com a seguinte mensagem:'+#13+e.Message, MB_OK+MB_ICONERROR);
      end;
    end;

  end;

end;

procedure TfrmLctSaidaEstoque.btnFiltroClick(Sender: TObject);
begin
  inherited;

  if ( edtDataInicio.Text <> '  /  /    ' ) and ( edtDataFim.Text = '  /  /    ' ) then
  begin
    MsgBox('"Prezado Cliente"'+#13+'Informe a data fim', MB_OK);
    edtDataFim.SetFocus;
    Exit;
  end;

  if ( edtDataFim.Text <> '  /  /    ' ) and ( edtDataInicio.Text = '  /  /    ' ) then
  begin
    MsgBox('"Prezado Cliente"'+#13+'Informe a data início', MB_OK);
    edtDataInicio.SetFocus;
    Exit;
  end;

  qryLctSaidaProduto.Close;
  qryLctSaidaProduto.ParamByName('FG_TODOSTRODUTOS').AsString := IfThen(dblProduto.Text <> '', 'NAO', 'SIM');
  qryLctSaidaProduto.ParamByName('ID_PRODUTO').AsInteger      := IfThen(dblProduto.Text <> '', qryConsProdutos.FieldByName('ID_PRODUTO').AsInteger);
  qryLctSaidaProduto.ParamByName('FG_TODOSPERIODOS').AsString := IfThen(edtDataInicio.Text <> '  /  /    ', 'NAO', 'SIM');

  if ( edtDataInicio.Text <> '  /  /    ' ) then
  begin
    qryLctSaidaProduto.ParamByName('DT_INICIO').AsDateTime := StrToDate(edtDataInicio.Text);
    qryLctSaidaProduto.ParamByName('DT_FIM').AsDateTime    := StrToDate(edtDataFim.Text);
  end
  else
  begin
    qryLctSaidaProduto.ParamByName('DT_INICIO').AsDateTime := Date;
    qryLctSaidaProduto.ParamByName('DT_FIM').AsDateTime    := Date;
  end;

  qryLctSaidaProduto.Open;

end;

procedure TfrmLctSaidaEstoque.btnIncluirClick(Sender: TObject);
begin
  inherited;

  qryLctSaidaProduto.Append;

  frmCadSaidaEstoque := TfrmCadSaidaEstoque.Create(Self);

  if ( dblProduto.Text <> '' ) then
    frmCadSaidaEstoque.dbgProdutos.Enabled := not ( frmCadSaidaEstoque.qryConsProdutos.Locate('ID_PRODUTO', qryConsProdutos.FieldByName('ID_PRODUTO').AsInteger, []) )
  else
    frmCadSaidaEstoque.dbgProdutos.Enabled := true;

  if ( frmCadSaidaEstoque.dbgProdutos.Enabled ) then
  begin
    frmCadSaidaEstoque.gpbProdutos.Caption    := 'Produtos (Selecione o produto para lançamento)';
    frmCadSaidaEstoque.gpbProdutos.Font.Style := [fsBold];
  end
  else
  begin
    frmCadSaidaEstoque.gpbProdutos.Caption    := 'Produto';
    frmCadSaidaEstoque.gpbProdutos.Font.Style := [];
  end;

  frmCadSaidaEstoque.ShowModal;

  if ( frmCadSaidaEstoque.ModalResult = mrOk ) then
    qryLctSaidaProduto.Refresh;

  FreeAndNil(frmCadSaidaEstoque);

end;

procedure TfrmLctSaidaEstoque.dbgLancamentoProdutoTitleClick(Column: TColumn);
begin
  inherited;

  if ( Column.FieldName = 'DT_SAIDAPRODUTO' ) then
    OrdenaGrid(dbgLancamentoProduto, Column, 'LCT_SAIDAPRODUTO', 'DESC')
  else if ( Column.FieldName = 'DS_NOME' ) then
    OrdenaGrid(dbgLancamentoProduto, Column, 'CAD_PRODUTO')
  else
    OrdenaGrid(dbgLancamentoProduto, Column, 'LCT_SAIDAPRODUTO');

end;

procedure TfrmLctSaidaEstoque.dblProdutoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;

  if ( Key = VK_DELETE ) then
    dblProduto.KeyValue := Null;

end;

procedure TfrmLctSaidaEstoque.edtDataFimExit(Sender: TObject);
begin
  inherited;

  if ( edtDataFim.Text <> '  /  /    ' ) then
  begin

    try
      edtDataFim.Text := FormatDateTime('dd/mm/yyyy', StrToDate(edtDataFim.Text));
    except
      MsgBox('"Prezado Cliente"'+#13+'Data inválida', MB_OK);
      edtDataFim.SetFocus;
      Abort;
    end;

    if ( edtDataInicio.Text <> '  /  /    ' ) and ( StrToDate(edtDataInicio.Text) > StrToDate(edtDataFim.Text) ) then
    begin
      MsgBox('"Prezado Cliente"'+#13+'Data fim menor que a data início', MB_OK);
      edtDataFim.SetFocus;
      Abort;
    end;

  end;

end;

procedure TfrmLctSaidaEstoque.edtDataInicioExit(Sender: TObject);
begin
  inherited;

  if ( edtDataInicio.Text <> '  /  /    ' ) then
  begin

    try
      edtDataInicio.Text := FormatDateTime('dd/mm/yyyy', StrToDate(edtDataInicio.Text));
    except
      MsgBox('"Prezado Cliente"'+#13+'Data inválida', MB_OK);
      edtDataInicio.SetFocus;
      Abort;
    end;

    if ( edtDataFim.Text <> '  /  /    ' ) and ( StrToDate(edtDataInicio.Text) > StrToDate(edtDataFim.Text) ) then
    begin
      MsgBox('"Prezado Cliente"'+#13+'Data início maior que a data fim', MB_OK);
      edtDataInicio.SetFocus;
      Abort;
    end;

  end;

end;

procedure TfrmLctSaidaEstoque.FormCreate(Sender: TObject);
begin
  inherited;

  qryLctSaidaProduto.Close;
  qryLctSaidaProduto.ParamByName('FG_TODOSTRODUTOS').AsString := 'SIM';
  qryLctSaidaProduto.ParamByName('ID_PRODUTO').AsInteger      := 0;
  qryLctSaidaProduto.ParamByName('FG_TODOSPERIODOS').AsString := 'SIM';
  qryLctSaidaProduto.ParamByName('DT_INICIO').AsDateTime      := Date;
  qryLctSaidaProduto.ParamByName('DT_FIM').AsDateTime         := Date;
  qryLctSaidaProduto.Open;

  qryConsProdutos.Close;
  qryConsProdutos.Open;

end;

procedure TfrmLctSaidaEstoque.qryLctSaidaProdutoAfterOpen(DataSet: TDataSet);
begin
  inherited;

  with qryLctSaidaProduto do
  begin

    ( qryLctSaidaProduto.FieldByName('DT_SAIDAPRODUTO') as TDateField ).OnSetText := dmPrincipal.ValidaData;

  end;

end;

end.
