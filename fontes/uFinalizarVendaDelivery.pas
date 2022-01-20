unit uFinalizarVendaDelivery;

interface

uses Windows, uPadrao, Controls, Grids, DBGrids, StdCtrls, ExtCtrls, Buttons,
  pngimage, Classes, Mask, DBCtrls, DB, Forms, IBODataset, SysUtils, ValEdit;

type
  TfrmFinalizarVendaDelivery = class(TfrmPadrao)
    dtsVenda: TDataSource;
    CamposObrigatorios: TValueListEditor;
    gpbFormaPagamento: TGroupBox;
    gpbValorVenda: TGroupBox;
    gpbValorPago: TGroupBox;
    gpbTroco: TGroupBox;
    dbtTroco: TDBText;
    dbeValorPago: TDBEdit;
    dbtTotal: TDBText;
    dbcFormaPagamento: TDBComboBox;
    gpbBotoes: TGroupBox;
    btnConfirmar: TBitBtn;
    btnCancelar: TBitBtn;
    procedure btnConfirmarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dbcFormaPagamentoChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmFinalizarVendaDelivery: TfrmFinalizarVendaDelivery;

implementation

uses uLctVendaDelivery, uConsClienteVenda, uFuncoes;

{$R *.dfm}

procedure TfrmFinalizarVendaDelivery.btnCancelarClick(Sender: TObject);
begin
  inherited;

  dtsVenda.DataSet.Cancel;
  ModalResult := mrCancel;

end;

procedure TfrmFinalizarVendaDelivery.btnConfirmarClick(Sender: TObject);
begin
  inherited;

  if ( not ( ValidaCampoObrigatorio(Self, CamposObrigatorios) ) ) then
    Abort;

  if ( dtsVenda.DataSet.FieldByName('VR_TOTALPAGO').AsFloat < dtsVenda.DataSet.FieldByName('VR_TOTALVENDA').AsFloat ) then
  begin
    MsgBox('"Prezado Cliente"'#13'Valor Pago menor que o Valor Total da Venda. Verifique!', MB_OK+MB_ICONINFORMATION);
    dbeValorPago.SetFocus;
    Abort;
  end;

  dtsVenda.DataSet.Post;
  ModalResult := mrOk;

end;

procedure TfrmFinalizarVendaDelivery.dbcFormaPagamentoChange(Sender: TObject);
begin
  inherited;

  if ( dbcFormaPagamento.Text = 'CHEQUE' ) or ( dbcFormaPagamento.Text = 'CARTAO CREDITO' ) or ( dbcFormaPagamento.Text = 'CARTAO DEBITO' ) then
    dtsVenda.DataSet.FieldByName('VR_TOTALPAGO').AsFloat := dtsVenda.DataSet.FieldByName('VR_TOTALVENDA').AsFloat
  else
    dtsVenda.DataSet.FieldByName('VR_TOTALPAGO').AsFloat := 0.0;

end;

procedure TfrmFinalizarVendaDelivery.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;

  if ( dtsVenda.DataSet.State in [dsInsert,dsEdit] ) then
    dtsVenda.DataSet.Cancel;

end;

procedure TfrmFinalizarVendaDelivery.FormCreate(Sender: TObject);
begin
  inherited;

  dtsVenda.DataSet := frmLctVendaDelivery.cdsVenda;

end;

end.
