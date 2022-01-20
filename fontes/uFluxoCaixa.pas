unit uFluxoCaixa;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uPadrao, Grids, DBGrids, StdCtrls, Buttons, Mask, DBCtrls, ValEdit,
  DB, IBODataset, StrUtils, ExtCtrls, DateUtils;

type
  TfrmFluxoCaixa = class(TfrmPadrao)
    gpbPeriodo: TGroupBox;
    gpbContasRecebidas: TGroupBox;
    gpbContasPagas: TGroupBox;
    dbgContasRecebidas: TDBGrid;
    dbgContasPagas: TDBGrid;
    edtPeriodoInicio: TMaskEdit;
    edtPeriodoFim: TMaskEdit;
    lblA: TLabel;
    CamposObrigatorios: TValueListEditor;
    qryLancamentoSaida: TIBOQuery;
    qryLancamentoEntrada: TIBOQuery;
    dtsLancamentoSaida: TDataSource;
    dtsLancamentoEntrada: TDataSource;
    dtsTotais: TDataSource;
    qryTotais: TIBOQuery;
    btnBuscar: TBitBtn;
    gpbBotoes: TGroupBox;
    btnImprimir: TSpeedButton;
    Panel1: TPanel;
    lblTotalRecebido: TLabel;
    dbeTotalRecebido: TDBEdit;
    Panel2: TPanel;
    lblTotalPago: TLabel;
    dbeTotalPago: TDBEdit;
    Panel3: TPanel;
    lblTotalLiquido: TLabel;
    dbeTotalLiquido: TDBEdit;
    pnlDescVenda: TPanel;
    dbmVenda: TDBMemo;
    pnlEntrada: TPanel;
    dbmEntrada: TDBMemo;
    qryTotaisVR_TOTALSAIDA: TIBOBCDField;
    qryTotaisVR_TOTALENTRADA: TIBOBCDField;
    qryTotaisVR_TOTAL: TFloatField;
    procedure edtPeriodoInicioExit(Sender: TObject);
    procedure edtPeriodoFimExit(Sender: TObject);
    procedure qryTotaisCalcFields(DataSet: TDataSet);
    procedure btnBuscarClick(Sender: TObject);
    procedure btnImprimirClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    procedure AtualizarContas;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmFluxoCaixa: TfrmFluxoCaixa;

implementation

uses uFuncoes, udmPrincipal, uImpFluxoCaixa, uConstantes;

{$R *.dfm}

procedure TfrmFluxoCaixa.AtualizarContas;
begin

  qryLancamentoEntrada.Close;
  qryLancamentoEntrada.ParamByName('DT_REFERENCIAINICIO').AsDateTime := StrToDate( edtPeriodoInicio.Text );
  qryLancamentoEntrada.ParamByName('DT_REFERENCIAFIM').AsDateTime    := StrToDate( edtPeriodoFim.Text );
  qryLancamentoEntrada.Open;

  qryLancamentoSaida.Close;
  qryLancamentoSaida.ParamByName('DT_REFERENCIAINICIO').AsDateTime := StrToDate( edtPeriodoInicio.Text );
  qryLancamentoSaida.ParamByName('DT_REFERENCIAFIM').AsDateTime    := StrToDate( edtPeriodoFim.Text );
  qryLancamentoSaida.Open;

  qryTotais.Close;
  qryTotais.ParamByName('DT_REFERENCIAINICIO').AsDateTime := StrToDate( edtPeriodoInicio.Text );
  qryTotais.ParamByName('DT_REFERENCIAFIM').AsDateTime    := StrToDate( edtPeriodoFim.Text );
  qryTotais.Open;

end;

procedure TfrmFluxoCaixa.btnBuscarClick(Sender: TObject);
begin
  inherited;

  if ( not ( ValidaCampoObrigatorio(Self, CamposObrigatorios) ) ) then
    Abort;

  AtualizarContas;

end;

procedure TfrmFluxoCaixa.btnImprimirClick(Sender: TObject);
begin
  inherited;

  frmImpFluxoCaixa := TfrmImpFluxoCaixa.Create(Self);

  frmImpFluxoCaixa.edtPeriodoInicio.Text := edtPeriodoInicio.Text;
  frmImpFluxoCaixa.edtPeriodoFim.Text    := edtPeriodoFim.Text;

  frmImpFluxoCaixa.ShowModal;
  FreeAndNil(frmImpFluxoCaixa);

end;

procedure TfrmFluxoCaixa.edtPeriodoFimExit(Sender: TObject);
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

    if ( edtPeriodoInicio.Text <> '  /  /    ' ) and ( StrToDate(edtPeriodoFim.Text) < StrToDate(edtPeriodoInicio.Text) ) then
    begin
      MsgBox('"Prezado Cliente"'#13'Período fim menor que período início', MB_OK+MB_ICONINFORMATION);
      edtPeriodoFim.SetFocus;
      Abort;
    end;

  end;

end;

procedure TfrmFluxoCaixa.edtPeriodoInicioExit(Sender: TObject);
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
    begin
      MsgBox('"Prezado Cliente"'#13'Período início maior que período fim', MB_OK+MB_ICONINFORMATION);
      edtPeriodoInicio.SetFocus;
      Abort;
    end;

  end;

end;

procedure TfrmFluxoCaixa.FormCreate(Sender: TObject);
begin
  inherited;

  edtPeriodoInicio.Text := FormatDateTime('dd/MM/yyyy', StartOfTheMonth(Now));
  edtPeriodoFim.Text    := FormatDateTime('dd/MM/yyyy', Now);

end;

procedure TfrmFluxoCaixa.FormShow(Sender: TObject);
begin
  inherited;

  if (GBL_USUARIO.FG_ADMINISTRADOR <> 'SIM') then
  begin
    MsgBox('"Prezado Cliente"'#13'Recurso disponível apenas para o administrador do sistema.', MB_OK+MB_ICONWARNING);
    PostMessage(Handle, WM_CLOSE, 0, 0);
  end;

end;

procedure TfrmFluxoCaixa.qryTotaisCalcFields(DataSet: TDataSet);
begin
  inherited;

  qryTotais.FieldByName('VR_TOTAL').AsFloat := qryTotais.FieldByName('VR_TOTALSAIDA').AsFloat - qryTotais.FieldByName('VR_TOTALENTRADA').AsFloat;

end;

end.
