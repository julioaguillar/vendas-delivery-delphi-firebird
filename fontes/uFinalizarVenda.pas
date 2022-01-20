unit uFinalizarVenda;

interface

uses Windows, uPadrao, Controls, Grids, DBGrids, StdCtrls, ExtCtrls, Buttons,
  pngimage, Classes, Mask, DBCtrls, DB, Forms, IBODataset, SysUtils, ValEdit;

type
  TfrmFinalizarVenda = class(TfrmPadrao)
    dtsVenda: TDataSource;
    qryConsCliente: TIBOQuery;
    dtsConsCliente: TDataSource;
    CamposObrigatorios: TValueListEditor;
    gpbCliente: TGroupBox;
    gpbFormaPagamento: TGroupBox;
    gpbValorVenda: TGroupBox;
    gpbValorPago: TGroupBox;
    gpbTroco: TGroupBox;
    dbtTroco: TDBText;
    dbeValorPago: TDBEdit;
    dbtTotal: TDBText;
    dbcFormaPagamento: TDBComboBox;
    gpbCodigo: TGroupBox;
    gpbNome: TGroupBox;
    dbeCliente: TDBEdit;
    dbeNomeCliente: TDBEdit;
    gpbBotoes: TGroupBox;
    btnConfirmar: TBitBtn;
    btnCancelar: TBitBtn;
    procedure btnConfirmarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dbeClienteExit(Sender: TObject);
    procedure dbeClienteKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure dbcFormaPagamentoChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmFinalizarVenda: TfrmFinalizarVenda;

implementation

uses uLctVenda, uConsClienteVenda, uFuncoes;

{$R *.dfm}

procedure TfrmFinalizarVenda.btnCancelarClick(Sender: TObject);
begin
  inherited;

  dtsVenda.DataSet.Cancel;
  ModalResult := mrCancel;

end;

procedure TfrmFinalizarVenda.btnConfirmarClick(Sender: TObject);
begin
  inherited;

  if ( not ( ValidaCampoObrigatorio(Self, CamposObrigatorios) ) ) then
    Abort;

  if ( dtsVenda.DataSet.FieldByName('VR_TOTALPAGO').AsFloat < dtsVenda.DataSet.FieldByName('VR_TOTALVENDA').AsFloat ) then
  begin
    MsgBox('"Prezado Cliente"'#13'Valor Pago menor que o Valor Total da Venda. Verifique', MB_OK+MB_ICONINFORMATION);
    dbeValorPago.SetFocus;
    Abort;
  end;

  dtsVenda.DataSet.Post;
  ModalResult := mrOk;

end;

procedure TfrmFinalizarVenda.dbcFormaPagamentoChange(Sender: TObject);
begin
  inherited;

  if ( dbcFormaPagamento.Text = 'CHEQUE' ) or ( dbcFormaPagamento.Text = 'CARTAO CREDITO' ) or ( dbcFormaPagamento.Text = 'CARTAO DEBITO' ) then
    dtsVenda.DataSet.FieldByName('VR_TOTALPAGO').AsFloat := dtsVenda.DataSet.FieldByName('VR_TOTALVENDA').AsFloat
  else
    dtsVenda.DataSet.FieldByName('VR_TOTALPAGO').AsFloat := 0.0;

end;

procedure TfrmFinalizarVenda.dbeClienteExit(Sender: TObject);
begin
  inherited;

  if dbeCliente.Text <> '' then
  begin

    qryConsCliente.Close;
    qryConsCliente.ParamByName('CD_CLIENTE').AsInteger := StrToInt(dbeCliente.Text);
    qryConsCliente.Open;

    if qryConsCliente.IsEmpty then
    begin
      MsgBox('"Prezado Cliente"'#13'Cliente não cadastrado', MB_OK+MB_ICONINFORMATION);
      dbeCliente.SetFocus;
      Abort;
    end;

  end;

end;

procedure TfrmFinalizarVenda.dbeClienteKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  inherited;

  if Key = VK_F9 then
  begin

    frmConsClienteVenda := TfrmConsClienteVenda.Create(Self);
    frmConsClienteVenda.ShowModal;

    if frmConsClienteVenda.ModalResult = mrOk then
      dtsVenda.DataSet.FieldByName('CD_CLIENTE').AsInteger := frmConsClienteVenda.qryConsCliente.FieldByName('CD_CLIENTE').AsInteger;

  end;

end;

procedure TfrmFinalizarVenda.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;

  if ( dtsVenda.DataSet.State in [dsInsert,dsEdit] ) then
    dtsVenda.DataSet.Cancel;

end;

procedure TfrmFinalizarVenda.FormCreate(Sender: TObject);
begin
  inherited;

  dtsVenda.DataSet := frmLctVenda.cdsVenda;

end;

end.
