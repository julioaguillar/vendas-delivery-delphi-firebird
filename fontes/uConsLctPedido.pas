unit uConsLctPedido;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uPadrao, StdCtrls, Buttons, DBCtrls, ExtCtrls, Grids, DBGrids, Mask,
  DB, IBODataset;

type
  TfrmConsLctPedido = class(TfrmPadrao)
    gpbCliente: TGroupBox;
    dblCliente: TDBLookupComboBox;
    gpbPeriodo: TGroupBox;
    Label1: TLabel;
    edtPeriodoInicio: TMaskEdit;
    edtPeriodoFim: TMaskEdit;
    gpbLancamentos: TGroupBox;
    dbgPedidos: TDBGrid;
    Panel1: TPanel;
    Panel5: TPanel;
    Label6: TLabel;
    Panel6: TPanel;
    dbtTotal: TDBText;
    Panel7: TPanel;
    gpbBotoes: TGroupBox;
    btnRetornar: TBitBtn;
    dtsLancamentoPedido: TDataSource;
    qryLancamentoPedido: TIBOQuery;
    dtsTotais: TDataSource;
    qryTotais: TIBOQuery;
    qryCliente: TIBOQuery;
    dtsCliente: TDataSource;
    btnConfirmar: TBitBtn;
    procedure btnRetornarClick(Sender: TObject);
    procedure dblClienteClick(Sender: TObject);
    procedure dblClienteKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure edtPeriodoInicioExit(Sender: TObject);
    procedure edtPeriodoFimExit(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnConfirmarClick(Sender: TObject);
  private
    { Private declarations }

    procedure filtraLancamentos;

  public
    { Public declarations }
  end;

var
  frmConsLctPedido: TfrmConsLctPedido;

implementation

uses uFuncoes, udmPrincipal;

{$R *.dfm}

procedure TfrmConsLctPedido.filtraLancamentos;
begin

  qryLancamentoPedido.Close;
  qryTotais.Close;

  if (dblCliente.KeyValue <> null) then
  begin
    qryLancamentoPedido.SQL.Strings[14] := 'AND LCT_PEDIDO.CD_CLIENTE = ' + IntToStr(dblCliente.KeyValue);
    qryTotais.SQL.Strings[4]            := 'AND LCT_PEDIDO.CD_CLIENTE = ' + IntToStr(dblCliente.KeyValue);
  end
  else
  begin
    qryLancamentoPedido.SQL.Strings[14] := '/*AND LCT_PEDIDO.CD_CLIENTE = :CD_CLIENTE*/';
    qryTotais.SQL.Strings[4]            := '/*AND LCT_PEDIDO.CD_CLIENTE = :CD_CLIENTE*/';
  end;

  if (edtPeriodoInicio.Text <> '  /  /    ') or (edtPeriodoFim.Text <> '  /  /    ') then
  begin

    qryLancamentoPedido.SQL.Strings[15] := 'AND LCT_PEDIDO.DT_PEDIDO BETWEEN :DT_REFERENCIAINICIO AND :DT_REFERENCIAFIM';

    if (edtPeriodoInicio.Text <> '  /  /    ') then
    begin

      qryLancamentoPedido.ParamByName('DT_REFERENCIAINICIO').AsDateTime := StrToDate(edtPeriodoInicio.Text);

      if (edtPeriodoFim.Text = '  /  /    ') then
        qryLancamentoPedido.ParamByName('DT_REFERENCIAFIM').AsDateTime := StrToDate('31/12/9999')
      else
        qryLancamentoPedido.ParamByName('DT_REFERENCIAFIM').AsDateTime := StrToDate(edtPeriodoFim.Text);

    end
    else
    begin

      qryLancamentoPedido.ParamByName('DT_REFERENCIAFIM').AsDateTime := StrToDate(edtPeriodoFim.Text);

      if (edtPeriodoInicio.Text = '  /  /    ') then
        qryLancamentoPedido.ParamByName('DT_REFERENCIAINICIO').AsDateTime := StrToDate('01/01/0001')
      else
        qryLancamentoPedido.ParamByName('DT_REFERENCIAINICIO').AsDateTime := StrToDate(edtPeriodoInicio.Text);

    end;

  end
  else
    qryLancamentoPedido.SQL.Strings[15] := '/*AND LCT_PEDIDO.DT_PEDIDO BETWEEN :DT_REFERENCIAINICIO AND :DT_REFERENCIAFIM*/';

  qryLancamentoPedido.Open;
  qryTotais.Open;

end;

procedure TfrmConsLctPedido.FormCreate(Sender: TObject);
begin
  inherited;

  qryCliente.Close;
  qryCliente.Open;

  qryLancamentoPedido.Close;
  qryLancamentoPedido.Open;

  qryTotais.Close;
  qryTotais.Open;

end;

procedure TfrmConsLctPedido.btnConfirmarClick(Sender: TObject);
begin
  inherited;

  ModalResult := mrOk;

end;

procedure TfrmConsLctPedido.btnRetornarClick(Sender: TObject);
begin
  inherited;

  ModalResult := mrRetry;

end;

procedure TfrmConsLctPedido.dblClienteClick(Sender: TObject);
begin
  inherited;

  filtraLancamentos;

end;

procedure TfrmConsLctPedido.dblClienteKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  inherited;

  if ( Key = VK_DELETE ) or ( Key = VK_BACK ) then
  begin
    dblCliente.KeyValue := Null;
    filtraLancamentos;
  end;

end;

procedure TfrmConsLctPedido.edtPeriodoFimExit(Sender: TObject);
begin
  inherited;

  if ( edtPeriodoFim.Text <> '  /  /    ' ) then
  begin

    try
      edtPeriodoFim.Text := FormatDateTime('dd/mm/yyyy', StrToDate(edtPeriodoFim.Text));
    except
      MsgBox('"Prezado Cliente"'#13'Data inválida', MB_OK+MB_ICONINFORMATION);
      edtPeriodoFim.SetFocus;
      Abort;
    end;

    if ( edtPeriodoInicio.Text = '  /  /    ' ) then
    begin
      MsgBox('"Prezado Cliente"'#13'Data inicial deve ser informada!', MB_OK+MB_ICONINFORMATION);
      edtPeriodoInicio.SetFocus;
      Abort;
    end;

    if ( edtPeriodoInicio.Text <> '  /  /    ' ) and ( StrToDate(edtPeriodoFim.Text) < StrToDate(edtPeriodoInicio.Text) ) then
    begin
      MsgBox('"Prezado Cliente"'#13'Data fim menor que a data início!', MB_OK+MB_ICONINFORMATION);
      edtPeriodoFim.SetFocus;
      Abort;
    end;

  end;

  filtraLancamentos;

end;

procedure TfrmConsLctPedido.edtPeriodoInicioExit(Sender: TObject);
begin
  inherited;

  if ( edtPeriodoInicio.Text <> '  /  /    ' ) then
  begin

    try
      edtPeriodoInicio.Text := FormatDateTime('dd/mm/yyyy', StrToDate(edtPeriodoInicio.Text));
    except
      MsgBox('"Prezado Cliente"'#13'Data inválida', MB_OK+MB_ICONINFORMATION);
      edtPeriodoInicio.SetFocus;
      Abort;
    end;

    if ( edtPeriodoFim.Text <> '  /  /    ' ) and ( StrToDate(edtPeriodoInicio.Text) > StrToDate(edtPeriodoFim.Text) ) then
      edtPeriodoFim.Clear;

  end;

  filtraLancamentos;

end;

end.
