unit uLctSaida;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uPadrao, Grids, DBGrids, StdCtrls, Buttons, DB, IBODataset, DBCtrls,
  IB_Components, Mask, ExtCtrls, frxClass, frxExportPDF, frxDBSet, frxExportRTF,
  frxExportMail, frxExportODF, FileCtrl, frxExportXLS;

type
  TfrmLctSaida = class(TfrmPadrao)
    gpbCliente: TGroupBox;
    gpbBotoes: TGroupBox;
    gpbLancamentos: TGroupBox;
    dblCliente: TDBLookupComboBox;
    dtsLancamentoSaida: TDataSource;
    gpbFiltro: TGroupBox;
    edtPeriodoInicio: TMaskEdit;
    edtPeriodoFim: TMaskEdit;
    lblA: TLabel;
    pnlTotal: TPanel;
    pnlTotalVenda: TPanel;
    pnlRodape: TPanel;
    qryLancamentoSaida: TIBOQuery;
    qryCliente: TIBOQuery;
    dtsCliente: TDataSource;
    btnConsultar: TBitBtn;
    qryTotais: TIBOQuery;
    dtsTotais: TDataSource;
    dbgPedidos: TDBGrid;
    lblTotal: TLabel;
    dbtTotalVenda: TDBText;
    btnExcluir: TBitBtn;
    trnsCadPadrao: TIB_Transaction;
    frxMailExport: TfrxMailExport;
    frxXLSExport: TfrxXLSExport;
    frxPDFExport: TfrxPDFExport;
    frxReport: TfrxReport;
    frxDBLancamentos: TfrxDBDataset;
    btnImprimirCupom: TSpeedButton;
    btnImprimirRelatório: TSpeedButton;
    btnGrafico: TSpeedButton;
    procedure edtPeriodoInicioExit(Sender: TObject);
    procedure edtPeriodoFimExit(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure dblClienteClick(Sender: TObject);
    procedure dblVendedorClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure dblClienteKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure btnConsultarClick(Sender: TObject);
    procedure btnImprimirRelatórioClick(Sender: TObject);
    procedure btnImprimirCupomClick(Sender: TObject);
    procedure btnGraficoClick(Sender: TObject);
  private
    { Private declarations }

    procedure filtraLancamentos;

  public
    { Public declarations }
  end;

var
  frmLctSaida: TfrmLctSaida;

implementation

uses udmPrincipal, uFuncoes, uLctSaidaDetalhamento, uConsGraficoVendas;

{$R *.dfm}

procedure TfrmLctSaida.btnConsultarClick(Sender: TObject);
begin
  inherited;

  if ( not ( qryLancamentoSaida.IsEmpty ) ) then
  begin

    frmLctSaidaDetalhamento := TfrmLctSaidaDetalhamento.Create(Self);
    frmLctSaidaDetalhamento.IDVenda := qryLancamentoSaida.FieldByName('ID_VENDA').AsInteger;
    frmLctSaidaDetalhamento.ShowModal;
    FreeAndNil(frmLctSaidaDetalhamento);

  end;

end;

procedure TfrmLctSaida.btnExcluirClick(Sender: TObject);
begin
  inherited;

  if ( not ( qryLancamentoSaida.IsEmpty ) ) then
  begin

    if ( MsgBox('"Prezado Cliente"'#13'Confirma a exclusão do registro selecionado?', MB_YESNO+MB_ICONQUESTION) = IDYES ) then
    begin

      try

        qryLancamentoSaida.Delete;
        trnsCadPadrao.Commit;

      except
        on e: Exception do
        begin
          trnsCadPadrao.Rollback;
          MsgBox('"Prezado Cliente"'#13'Ocorreu um erro na exclusão do registro com a seguinte mensagem:'+#13#13+e.Message, MB_OK+MB_ICONINFORMATION);
        end;
      end;

    end;

  end;

end;

procedure TfrmLctSaida.btnGraficoClick(Sender: TObject);
begin
  inherited;

  frmConsGraficoVendas := TfrmConsGraficoVendas.Create(Self);
  frmConsGraficoVendas.ShowModal;
  FreeAndNil(frmConsGraficoVendas);

end;

procedure TfrmLctSaida.btnImprimirCupomClick(Sender: TObject);
var QuantidadeVias: String;
begin
  inherited;

  if ( not qryLancamentoSaida.IsEmpty ) then
  begin

    QuantidadeVias := GetIniValue('Parametros', 'QuantidadeVias');

    if ( qryLancamentoSaida.FieldByName('FG_ORIGEM').AsString = 'D' ) then
    begin

      dmPrincipal.ImprimirExtratoDelivery(qryLancamentoSaida.FieldByName('ID_VENDA').AsInteger, qryLancamentoSaida.FieldByName('FG_RETIRARLOCAL').AsString = 'S', qryLancamentoSaida.FieldByName('DS_OBSERVACAO').AsString, False, True);

      if ( QuantidadeVias = '2' ) then
        dmPrincipal.ImprimirExtratoDelivery(qryLancamentoSaida.FieldByName('ID_VENDA').AsInteger, qryLancamentoSaida.FieldByName('FG_RETIRARLOCAL').AsString = 'S', qryLancamentoSaida.FieldByName('DS_OBSERVACAO').AsString, True, True);

    end
    else
    begin

      dmPrincipal.ImprimirExtrato(qryLancamentoSaida.FieldByName('ID_VENDA').AsInteger, False, True);

      if ( QuantidadeVias = '2' ) then
        dmPrincipal.ImprimirExtrato(qryLancamentoSaida.FieldByName('ID_VENDA').AsInteger, True, True);

    end;

  end;

end;

procedure TfrmLctSaida.btnImprimirRelatórioClick(Sender: TObject);
begin
  inherited;

  if edtPeriodoInicio.Text <> '  /  /    ' then
    frxReport.Variables['PeriodoInicio'] := QuotedStr(edtPeriodoInicio.Text)
  else
    frxReport.Variables['PeriodoInicio'] := QuotedStr('');

  if edtPeriodoFim.Text <> '  /  /    ' then
    frxReport.Variables['PeriodoFim'] := QuotedStr(edtPeriodoFim.Text)
  else
    frxReport.Variables['PeriodoFim'] := QuotedStr('');

  if ( frxReport.PrepareReport ) then
    frxReport.ShowPreparedReport;

end;

procedure TfrmLctSaida.dblClienteClick(Sender: TObject);
begin
  inherited;

  filtraLancamentos;

end;

procedure TfrmLctSaida.dblClienteKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  inherited;

  if ( Key = VK_DELETE ) or ( Key = VK_BACK ) then
  begin
    dblCliente.KeyValue := Null;
    filtraLancamentos;
  end;

end;

procedure TfrmLctSaida.dblVendedorClick(Sender: TObject);
begin
  inherited;

  filtraLancamentos;

end;

procedure TfrmLctSaida.edtPeriodoFimExit(Sender: TObject);
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

procedure TfrmLctSaida.edtPeriodoInicioExit(Sender: TObject);
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

procedure TfrmLctSaida.filtraLancamentos;
begin

  qryLancamentoSaida.Close;
  qryTotais.Close;

  if (dblCliente.KeyValue <> null) then
  begin
    qryLancamentoSaida.SQL.Strings[25] := 'AND LCT_VENDA.CD_CLIENTE = ' + IntToStr(dblCliente.KeyValue);
    qryTotais.SQL.Strings[3]           := 'AND LCT_VENDA.CD_CLIENTE = ' + IntToStr(dblCliente.KeyValue);
  end
  else
  begin
    qryLancamentoSaida.SQL.Strings[25] := '/*AND LCT_VENDA.CD_CLIENTE = :CD_CLIENTE*/';
    qryTotais.SQL.Strings[3]           := '/*AND LCT_VENDA.CD_CLIENTE = :CD_CLIENTE*/';
  end;

  if (edtPeriodoInicio.Text <> '  /  /    ') or (edtPeriodoFim.Text <> '  /  /    ') then
  begin

    qryLancamentoSaida.SQL.Strings[26] := 'AND LCT_VENDA.DT_VENDA BETWEEN :DT_REFERENCIAINICIO AND :DT_REFERENCIAFIM';
    qryTotais.SQL.Strings[4]           := 'AND LCT_VENDA.DT_VENDA BETWEEN :DT_REFERENCIAINICIO AND :DT_REFERENCIAFIM';

    if (edtPeriodoInicio.Text <> '  /  /    ') then
    begin

      qryLancamentoSaida.ParamByName('DT_REFERENCIAINICIO').AsDateTime := StrToDate(edtPeriodoInicio.Text);
      qryTotais.ParamByName('DT_REFERENCIAINICIO').AsDateTime          := StrToDate(edtPeriodoInicio.Text);

      if (edtPeriodoFim.Text = '  /  /    ') then
      begin
        qryLancamentoSaida.ParamByName('DT_REFERENCIAFIM').AsDateTime := StrToDate('31/12/9999');
        qryTotais.ParamByName('DT_REFERENCIAFIM').AsDateTime          := StrToDate('31/12/9999');
      end
      else
      begin
        qryLancamentoSaida.ParamByName('DT_REFERENCIAFIM').AsDateTime := StrToDate(edtPeriodoFim.Text);
        qryTotais.ParamByName('DT_REFERENCIAFIM').AsDateTime          := StrToDate(edtPeriodoFim.Text);
      end;

    end
    else
    begin

      qryLancamentoSaida.ParamByName('DT_REFERENCIAFIM').AsDateTime := StrToDate(edtPeriodoFim.Text);
      qryTotais.ParamByName('DT_REFERENCIAFIM').AsDateTime          := StrToDate(edtPeriodoFim.Text);

      if (edtPeriodoInicio.Text = '  /  /    ') then
      begin
        qryLancamentoSaida.ParamByName('DT_REFERENCIAINICIO').AsDateTime := StrToDate('01/01/0001');
        qryTotais.ParamByName('DT_REFERENCIAINICIO').AsDateTime          := StrToDate('01/01/0001');
      end
      else
      begin
        qryLancamentoSaida.ParamByName('DT_REFERENCIAINICIO').AsDateTime := StrToDate(edtPeriodoInicio.Text);
        qryTotais.ParamByName('DT_REFERENCIAINICIO').AsDateTime          := StrToDate(edtPeriodoInicio.Text);
      end;

    end;

  end
  else
  begin

    qryLancamentoSaida.SQL.Strings[26] := '/*AND LCT_VENDA.DT_VENDA BETWEEN :DT_REFERENCIAINICIO AND :DT_REFERENCIAFIM*/';
    qryTotais.SQL.Strings[4]           := '/*AND LCT_VENDA.DT_VENDA BETWEEN :DT_REFERENCIAINICIO AND :DT_REFERENCIAFIM*/';

  end;

  qryLancamentoSaida.Open;
  qryTotais.Open;

end;

procedure TfrmLctSaida.FormCreate(Sender: TObject);
begin
  inherited;

  qryCliente.Close;
  qryCliente.Open;

  qryLancamentoSaida.Close;
  qryLancamentoSaida.Open;

  qryTotais.Close;
  qryTotais.Open;

end;

end.
