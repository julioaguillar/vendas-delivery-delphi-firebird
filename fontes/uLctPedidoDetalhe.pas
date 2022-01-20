unit uLctPedidoDetalhe;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uPadrao, StdCtrls, Mask, DBCtrls, Buttons, Grids, DBGrids, DB,
  IBODataset, ValEdit, DBClient, ExtCtrls, IB_Components;

type
  TfrmLctPedidoDetalhe = class(TfrmPadrao)
    gpbData: TGroupBox;
    gpbNumero: TGroupBox;
    gpbCliente: TGroupBox;
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
    dblCliente: TDBLookupComboBox;
    CamposObrigatorios: TValueListEditor;
    cdsPedidoItem: TClientDataSet;
    dtsPedidoItem: TDataSource;
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    Panel5: TPanel;
    Label4: TLabel;
    cdsPedido: TClientDataSet;
    dtsPedido: TDataSource;
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
    btnConsCliente: TSpeedButton;
    gpbDescricao: TGroupBox;
    dbeObservacao: TDBEdit;
    cdsPedidoDT_PEDIDO: TDateField;
    cdsPedidoHR_PEDIDO: TTimeField;
    cdsPedidoNR_PEDIDO: TStringField;
    cdsPedidoDS_OBSERVACAO: TStringField;
    cdsPedidoNR_QUANTIDADEPRODUTOS: TFloatField;
    cdsPedidoVR_TOTALPEDIDO: TFloatField;
    cdsPedidoCD_CLIENTE: TIntegerField;
    cdsPedidoDS_NOME: TStringField;
    qryCliente: TIBOQuery;
    dtsCliente: TDataSource;
    cdsPedidoItemID_PRODUTO: TIntegerField;
    cdsPedidoItemVR_UNITARIO: TFloatField;
    cdsPedidoItemNR_QUANTIDADEPRODUTO: TFloatField;
    cdsPedidoItemVR_DESCONTO: TFloatField;
    cdsPedidoItemVR_TOTAL: TFloatField;
    cdsPedidoItemDS_NOME: TStringField;
    cdsPedidoID_PEDIDO: TIntegerField;
    Panel7: TPanel;
    lblTotalAcrescimo: TLabel;
    cdsPedidoItemVR_ACRESCIMO: TFloatField;
    dbeProduto: TDBEdit;
    procedure btnConfirmarClick(Sender: TObject);
    procedure btnIncluirClick(Sender: TObject);
    procedure cdsPedidoAfterOpen(DataSet: TDataSet);
    procedure btnExcluirClick(Sender: TObject);
    procedure dblClienteEnter(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure dbeProdutoEnter(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnConsClienteClick(Sender: TObject);
    procedure dblClienteKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }

    procedure CalculaTotais;

  public
    { Public declarations }

    fgOperacao: String;

  end;

var
  frmLctPedidoDetalhe: TfrmLctPedidoDetalhe;

implementation

uses udmPrincipal, uFuncoes, uCadProdutoPedido, uConsCliente;

{$R *.dfm}

procedure TfrmLctPedidoDetalhe.btnAlterarClick(Sender: TObject);
begin
  inherited;

  cdsPedidoItem.Edit;

  frmCadProdutoPedido := TfrmCadProdutoPedido.Create(Self);
  frmCadProdutoPedido.ShowModal;

  if ( frmCadProdutoPedido.ModalResult = mrOk ) then
    CalculaTotais;

  FreeAndNil(frmCadProdutoPedido);

end;

procedure TfrmLctPedidoDetalhe.btnCancelarClick(Sender: TObject);
begin
  inherited;

  if ( cdsPedido.State in [dsInsert,dsEdit] ) then
    cdsPedido.Cancel;

  if ( cdsPedidoItem.State in [dsInsert,dsEdit] ) then
    cdsPedidoItem.Cancel;

  ModalResult := mrCancel;

end;

procedure TfrmLctPedidoDetalhe.btnConfirmarClick(Sender: TObject);
var idPedido: Integer;
begin
  inherited;

  if ( not ( ValidaCampoObrigatorio(Self, CamposObrigatorios) ) ) then
    Abort;

  try

    if ( cdsPedido.State in [dsInsert, dsEdit] ) then
      cdsPedido.Post;

    qryLctPedido.Close;
    qryLctPedido.SQL.Clear;

    idPedido := 0;

    if ( fgOperacao = 'INSERCAO' ) then
    begin

      qryConsulta.Close;
      qryConsulta.SQL.Text := 'SELECT GEN_ID(GEN_ID_LCT_PEDIDO, 1) AS ID FROM RDB$DATABASE';
      qryConsulta.Open;

      idPedido := qryConsulta.FieldByName('ID').AsInteger;

      qryLctPedido.SQL.Text := 'INSERT INTO LCT_PEDIDO (                                         '+#13+
                               '  ID_PEDIDO, DT_PEDIDO, HR_PEDIDO, NR_PEDIDO, DS_OBSERVACAO,     '+#13+
                               '  NR_QUANTIDADEPRODUTOS, VR_TOTALPEDIDO, CD_CLIENTE)             '+#13+
                               'VALUES (                                                         '+#13+
                               '  :ID_PEDIDO, :DT_PEDIDO, :HR_PEDIDO, :NR_PEDIDO, :DS_OBSERVACAO,'+#13+
                               '  :NR_QUANTIDADEPRODUTOS, :VR_TOTALPEDIDO, :CD_CLIENTE)          ';

    end
    else if ( fgOperacao = 'ALTERACAO' ) then
    begin

      qryLctPedido.SQL.Text := 'UPDATE LCT_PEDIDO                                  '+#13+
                               'SET DT_PEDIDO = :DT_PEDIDO,                        '+#13+
                               '    HR_PEDIDO = :HR_PEDIDO,                        '+#13+
                               '    NR_PEDIDO = :NR_PEDIDO,                        '+#13+
                               '    DS_OBSERVACAO = :DS_OBSERVACAO,                '+#13+
                               '    NR_QUANTIDADEPRODUTOS = :NR_QUANTIDADEPRODUTOS,'+#13+
                               '    VR_TOTALPEDIDO = :VR_TOTALPEDIDO,              '+#13+
                               '    CD_CLIENTE = :CD_CLIENTE                       '+#13+
                               'WHERE ID_PEDIDO = :ID_PEDIDO                       ';

      idPedido := cdsPedido.FieldByName('ID_PEDIDO').Value;

    end;

    qryLctPedido.ParamByName('ID_PEDIDO').Value             := idPedido;
    qryLctPedido.ParamByName('DT_PEDIDO').Value             := cdsPedido.FieldByName('DT_PEDIDO').Value;
    qryLctPedido.ParamByName('HR_PEDIDO').Value             := cdsPedido.FieldByName('HR_PEDIDO').Value;
    qryLctPedido.ParamByName('NR_PEDIDO').Value             := cdsPedido.FieldByName('NR_PEDIDO').Value;
    qryLctPedido.ParamByName('DS_OBSERVACAO').Value         := cdsPedido.FieldByName('DS_OBSERVACAO').Value;
    qryLctPedido.ParamByName('NR_QUANTIDADEPRODUTOS').Value := cdsPedido.FieldByName('NR_QUANTIDADEPRODUTOS').Value;
    qryLctPedido.ParamByName('VR_TOTALPEDIDO').Value        := cdsPedido.FieldByName('VR_TOTALPEDIDO').Value;
    qryLctPedido.ParamByName('CD_CLIENTE').Value            := cdsPedido.FieldByName('CD_CLIENTE').Value;
    qryLctPedido.ExecSQL;

    // PRODUTOS

    qryDeletaProdutos.Close;
    qryDeletaProdutos.ParamByName('ID_PEDIDO').AsInteger := idPedido;
    qryDeletaProdutos.ExecSQL;

    cdsPedidoItem.DisableControls;
    cdsPedidoItem.First;

    while not ( cdsPedidoItem.Eof ) do
    begin

      qryConsulta.Close;
      qryConsulta.Open;

      qryLctPedidoProduto.Close;
      qryLctPedidoProduto.ParamByName('ID_PEDIDO').Value            := idPedido;
      qryLctPedidoProduto.ParamByName('ID_PEDIDOITEM').Value        := qryConsulta.FieldByName('ID').AsInteger;
      qryLctPedidoProduto.ParamByName('ID_PRODUTO').Value           := cdsPedidoItem.FieldByName('ID_PRODUTO').Value;
      qryLctPedidoProduto.ParamByName('VR_UNITARIO').Value          := cdsPedidoItem.FieldByName('VR_UNITARIO').Value;
      qryLctPedidoProduto.ParamByName('NR_QUANTIDADEPRODUTO').Value := cdsPedidoItem.FieldByName('NR_QUANTIDADEPRODUTO').Value;
      qryLctPedidoProduto.ParamByName('VR_ACRESCIMO').Value         := cdsPedidoItem.FieldByName('VR_ACRESCIMO').Value;
      qryLctPedidoProduto.ParamByName('VR_DESCONTO').Value          := cdsPedidoItem.FieldByName('VR_DESCONTO').Value;
      qryLctPedidoProduto.ParamByName('VR_TOTAL').Value             := cdsPedidoItem.FieldByName('VR_TOTAL').Value;
      qryLctPedidoProduto.ExecSQL;

      cdsPedidoItem.Next;

    end;

    // *******************************************************************

    trnsCadPadrao.Commit;

    ModalResult := mrOk;

  except
    on e: Exception do
    begin
      trnsCadPadrao.Rollback;
      MsgBox('"Prezado Cliente"'#13'Ocorreu um erro na gravação do Pedido com a seguinte mensagem:'+#13#13+e.Message, MB_OK+MB_ICONERROR);
      ModalResult := mrCancel;
    end;
  end;

end;

procedure TfrmLctPedidoDetalhe.btnConsClienteClick(Sender: TObject);
begin
  inherited;

  frmConsCliente := TfrmConsCliente.Create(Self);
  frmConsCliente.ShowModal;

  if ( frmConsCliente.ModalResult = mrOk ) and ( not frmConsCliente.qryConsCliente.IsEmpty ) then
    cdsPedido.FieldByName('CD_CLIENTE').AsInteger := frmConsCliente.qryConsCliente.FieldByName('CD_CLIENTE').AsInteger;

  FreeAndNil(frmConsCliente);

end;

procedure TfrmLctPedidoDetalhe.btnExcluirClick(Sender: TObject);
begin
  inherited;

  if ( not ( cdsPedidoItem.IsEmpty ) ) and
     ( MsgBox('"Prezado Cliente"'#13'Confirma a exclusão do registro', MB_YESNO+MB_ICONQUESTION) = IDYES ) then
  begin
    cdsPedidoItem.Delete;
    CalculaTotais;
  end;

end;

procedure TfrmLctPedidoDetalhe.btnIncluirClick(Sender: TObject);
begin
  inherited;

  cdsPedidoItem.DisableControls;
  cdsPedidoItem.First;

  frmCadProdutoPedido := TfrmCadProdutoPedido.Create(Self);

  while (not cdsPedidoItem.Eof) do
  begin

    frmCadProdutoPedido.cdsPedidoItemCopy.Append;
    frmCadProdutoPedido.cdsPedidoItemCopy.FieldByName('ID_PRODUTO').AsInteger := cdsPedidoItem.FieldByName('ID_PRODUTO').AsInteger;
    frmCadProdutoPedido.cdsPedidoItemCopy.Post;

    cdsPedidoItem.Next;

  end;

  cdsPedidoItem.EnableControls;

  cdsPedidoItem.Append;
  cdsPedidoItemVR_DESCONTO.AsFloat  := 0.0;
  cdsPedidoItemVR_ACRESCIMO.AsFloat := 0.0;

  frmCadProdutoPedido.ShowModal;

  if ( frmCadProdutoPedido.ModalResult = mrOk ) then
    CalculaTotais;

  FreeAndNil(frmCadProdutoPedido);

end;

procedure TfrmLctPedidoDetalhe.cdsPedidoAfterOpen(DataSet: TDataSet);
begin
  inherited;

  with cdsPedido do
  begin
    ( cdsPedido.FieldByName('DT_PEDIDO') as TDateField ).OnSetText := dmPrincipal.ValidaData;
    ( cdsPedido.FieldByName('HR_PEDIDO') as TTimeField ).OnSetText := dmPrincipal.ValidaHora;
  end;

end;

procedure TfrmLctPedidoDetalhe.dbeProdutoEnter(Sender: TObject);
begin
  inherited;

  if ( dbgProdutos.Enabled ) then
    dbgProdutos.SetFocus;

end;

procedure TfrmLctPedidoDetalhe.dblClienteEnter(Sender: TObject);
begin
  inherited;

  dblCliente.DropDown;

end;

procedure TfrmLctPedidoDetalhe.dblClienteKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  inherited;

  if ( Key = VK_F9 ) then
    btnConsClienteClick(btnConsCliente);

end;

procedure TfrmLctPedidoDetalhe.FormCreate(Sender: TObject);
begin
  inherited;

  qryCliente.Close;
  qryCliente.Open;

end;

procedure TfrmLctPedidoDetalhe.FormShow(Sender: TObject);
begin
  inherited;

  if (fgOperacao = 'ALTERACAO') then
    CalculaTotais;

end;

procedure TfrmLctPedidoDetalhe.CalculaTotais;
var totalUnitario, totalAcrescimo, totalDesconto, totalGeral: Double;
    totalQuantidade: Integer;
begin

  totalUnitario   := 0.0;
  totalAcrescimo  := 0.0;
  totalDesconto   := 0.0;
  totalGeral      := 0.0;
  totalQuantidade := 0;

  cdsPedidoItem.DisableControls;
  cdsPedidoItem.First;

  while not ( cdsPedidoItem.Eof ) do
  begin

    totalUnitario   := totalUnitario + cdsPedidoItemVR_UNITARIO.AsFloat;
    totalAcrescimo  := totalAcrescimo + cdsPedidoItemVR_ACRESCIMO.AsFloat;
    totalDesconto   := totalDesconto + cdsPedidoItemVR_DESCONTO.AsFloat;
    totalGeral      := totalGeral + cdsPedidoItemVR_TOTAL.AsFloat;
    totalQuantidade := totalQuantidade + cdsPedidoItemNR_QUANTIDADEPRODUTO.AsInteger;

    cdsPedidoItem.Next;

  end;

  cdsPedidoItem.First;
  cdsPedidoItem.EnableControls;

  lblTotalUnitario.Caption   := FormatFloat(',0.00', totalUnitario)+' ';
  lblTotalAcrescimo.Caption  := FormatFloat(',0.00', totalAcrescimo)+' ';
  lblTotalDesconto.Caption   := FormatFloat(',0.00', totalDesconto)+' ';
  lblTotalGeral.Caption      := FormatFloat(',0.00', totalGeral)+' ';
  lblTotalQuantidade.Caption := FormatFloat(',0.00', totalQuantidade)+' ';

  if (cdsPedido.State in [dsEdit, dsInsert]) then
  begin
    cdsPedido.FieldByName('NR_QUANTIDADEPRODUTOS').Value := cdsPedidoItem.RecordCount;
    cdsPedido.FieldByName('VR_TOTALPEDIDO').Value        := totalGeral;
  end;

end;

end.
