unit uCadProdutoEntrada;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uPadrao, StdCtrls, Buttons, Mask, DBCtrls, DB, IBODataset, Grids,
  ValEdit, DBClient;

type
  TfrmCadProdutoEntrada = class(TfrmPadrao)
    gpbBotoes: TGroupBox;
    btnConfirmar: TBitBtn;
    btnCancelar: TBitBtn;
    gpbProduto: TGroupBox;
    gpbValorUnitario: TGroupBox;
    dbeValorUnitario: TDBEdit;
    gpbQuantidade: TGroupBox;
    dbeQuantidade: TDBEdit;
    gpbValorTotal: TGroupBox;
    dbeValorTotal: TDBEdit;
    gpbDesconto: TGroupBox;
    dbeDesconto: TDBEdit;
    dblProduto: TDBLookupComboBox;
    dtsProdutoPedido: TDataSource;
    CamposObrigatorios: TValueListEditor;
    edtCodigo: TEdit;
    btnConsProduto: TSpeedButton;
    qryProdutos: TIBOQuery;
    dtsProdutos: TDataSource;
    qryConsProduto: TIBOQuery;
    cdsEntradaItemCopy: TClientDataSet;
    cdsEntradaItemCopyID_PRODUTO: TIntegerField;
    cdsEntradaItemCopyVR_UNITARIO: TFloatField;
    cdsEntradaItemCopyNR_QUANTIDADEPRODUTO: TFloatField;
    cdsEntradaItemCopyVR_DESCONTO: TFloatField;
    cdsEntradaItemCopyVR_TOTAL: TFloatField;
    cdsEntradaItemCopyDS_NOME: TStringField;
    procedure btnConfirmarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure dbeValorUnitarioExit(Sender: TObject);
    procedure dbeQuantidadeExit(Sender: TObject);
    procedure dblProdutoClick(Sender: TObject);
    procedure dbeDescontoExit(Sender: TObject);
    procedure btnConsProdutoClick(Sender: TObject);
    procedure edtCodigoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtCodigoExit(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadProdutoEntrada: TfrmCadProdutoEntrada;

implementation

uses udmPrincipal, uFuncoes, uLctEntradaDetalhe, uConsProduto;

{$R *.dfm}

procedure TfrmCadProdutoEntrada.btnCancelarClick(Sender: TObject);
begin
  inherited;

  dtsProdutoPedido.DataSet.Cancel;
  ModalResult := mrCancel;

end;

procedure TfrmCadProdutoEntrada.btnConfirmarClick(Sender: TObject);
begin
  inherited;

  if ( not ( ValidaCampoObrigatorio(Self, CamposObrigatorios) ) ) then
    Abort;

  dtsProdutoPedido.DataSet.FieldByName('ID_PRODUTO').AsInteger := dblProduto.KeyValue;

  if (dtsProdutoPedido.DataSet.State = dsInsert) and (cdsEntradaItemCopy.Locate('ID_PRODUTO', dtsProdutoPedido.DataSet.FieldByName('ID_PRODUTO').AsInteger, [])) then
  begin
    MsgBox('"Prezado Cliente"'#13'Produto j? Lan?ado.', MB_OK+MB_ICONINFORMATION);
    edtCodigo.SetFocus;
    Abort;
  end;

  dtsProdutoPedido.DataSet.FieldByName('DS_NOME').AsString := qryProdutos.FieldByName('DS_NOME').AsString;
  dtsProdutoPedido.DataSet.Post;

  ModalResult := mrOk;

end;

procedure TfrmCadProdutoEntrada.btnConsProdutoClick(Sender: TObject);
begin
  inherited;

  frmConsProduto := TfrmConsProduto.Create(Self);
  frmConsProduto.ShowModal;

  if ( frmConsProduto.ModalResult = mrOk ) and ( not frmConsProduto.qryConsProduto.IsEmpty ) then
  begin

    dblProduto.KeyValue := frmConsProduto.qryConsProduto.FieldByName('ID_PRODUTO').AsInteger;
    edtCodigo.Text      := frmConsProduto.qryConsProduto.FieldByName('CD_PRODUTO').AsString;

  end;

  FreeAndNil(frmConsProduto);

end;

procedure TfrmCadProdutoEntrada.dbeDescontoExit(Sender: TObject);
begin
  inherited;

  if dtsProdutoPedido.DataSet.State in [dsInsert,dsEdit] then
    dtsProdutoPedido.DataSet.FieldByName('VR_TOTAL').AsFloat := (
                                                                  dtsProdutoPedido.DataSet.FieldByName('VR_UNITARIO').AsFloat *
                                                                  dtsProdutoPedido.DataSet.FieldByName('NR_QUANTIDADEPRODUTO').AsFloat
                                                                ) -
                                                                dtsProdutoPedido.DataSet.FieldByName('VR_DESCONTO').AsFloat;

end;

procedure TfrmCadProdutoEntrada.dbeQuantidadeExit(Sender: TObject);
begin
  inherited;

  if dtsProdutoPedido.DataSet.State in [dsInsert,dsEdit] then
    dtsProdutoPedido.DataSet.FieldByName('VR_TOTAL').AsFloat := (
                                                                  dtsProdutoPedido.DataSet.FieldByName('VR_UNITARIO').AsFloat *
                                                                  dtsProdutoPedido.DataSet.FieldByName('NR_QUANTIDADEPRODUTO').AsFloat
                                                                ) -
                                                                dtsProdutoPedido.DataSet.FieldByName('VR_DESCONTO').AsFloat;

end;

procedure TfrmCadProdutoEntrada.dbeValorUnitarioExit(Sender: TObject);
begin
  inherited;

  if dtsProdutoPedido.DataSet.State in [dsInsert,dsEdit] then
    dtsProdutoPedido.DataSet.FieldByName('VR_TOTAL').AsFloat := (
                                                                  dtsProdutoPedido.DataSet.FieldByName('VR_UNITARIO').AsFloat *
                                                                  dtsProdutoPedido.DataSet.FieldByName('NR_QUANTIDADEPRODUTO').AsFloat
                                                                ) -
                                                                dtsProdutoPedido.DataSet.FieldByName('VR_DESCONTO').AsFloat;

end;

procedure TfrmCadProdutoEntrada.dblProdutoClick(Sender: TObject);
begin
  inherited;

  if dtsProdutoPedido.DataSet.State in [dsInsert,dsEdit] then
  begin
    dtsProdutoPedido.DataSet.FieldByName('VR_UNITARIO').AsFloat          := qryProdutos.FieldByName('VR_PRECOCOMPRA').AsFloat;
    dtsProdutoPedido.DataSet.FieldByName('NR_QUANTIDADEPRODUTO').AsFloat := 0.0;
    dtsProdutoPedido.DataSet.FieldByName('VR_DESCONTO').AsFloat          := 0.0;
    dtsProdutoPedido.DataSet.FieldByName('VR_TOTAL').AsFloat             := 0.0;
  end;

end;

procedure TfrmCadProdutoEntrada.edtCodigoExit(Sender: TObject);
begin
  inherited;

  if ( edtCodigo.Text <> '' ) then
  begin

    qryConsProduto.Close;
    qryConsProduto.ParamByName('CD_PRODUTO').AsString := edtCodigo.Text;
    qryConsProduto.Open;

    if ( qryConsProduto.IsEmpty ) then
    begin
      MsgBox('"Prezado Cliente"'#13'Produto n?o cadastrado.', MB_OK+MB_ICONINFORMATION);
      edtCodigo.SetFocus;
      Abort;
    end;

    dblProduto.KeyValue := qryConsProduto.FieldByName('ID_PRODUTO').AsInteger;

    if dtsProdutoPedido.DataSet.State in [dsInsert] then
    begin
      dtsProdutoPedido.DataSet.FieldByName('VR_UNITARIO').AsFloat          := qryProdutos.FieldByName('VR_PRECOCOMPRA').AsFloat;
      dtsProdutoPedido.DataSet.FieldByName('NR_QUANTIDADEPRODUTO').AsFloat := 0.0;
      dtsProdutoPedido.DataSet.FieldByName('VR_DESCONTO').AsFloat          := 0.0;
      dtsProdutoPedido.DataSet.FieldByName('VR_TOTAL').AsFloat             := 0.0;
    end;

  end
  else
    dblProduto.KeyValue := Null;

end;

procedure TfrmCadProdutoEntrada.edtCodigoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;

  if ( Key = VK_F9 ) then
    btnConsProdutoClick(btnConsProduto);

end;

procedure TfrmCadProdutoEntrada.FormShow(Sender: TObject);
begin
  inherited;

  dtsProdutoPedido.DataSet := frmLctEntradaDetalhe.cdsEntradaItem;

  qryProdutos.Close;
  qryProdutos.Open;

  if (dtsProdutoPedido.DataSet.State = dsEdit) then
  begin
    edtCodigo.Text         := qryProdutos.FieldByName('CD_PRODUTO').AsString;
    btnConsProduto.Enabled := False;
    edtCodigo.Enabled      := False;
    dblProduto.Enabled     := False;
  end;

end;

end.
