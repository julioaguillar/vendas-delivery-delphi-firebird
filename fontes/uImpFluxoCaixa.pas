unit uImpFluxoCaixa;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uPadrao, frxClass, frxExportPDF, frxDBSet, DB, IBODataset, Grids,
  ValEdit, StdCtrls, Mask, Buttons, StrUtils, DateUtils, frxExportXLS,
  frxExportMail, ComObj, excelXP;

type
  TfrmImpFluxoCaixa = class(TfrmPadrao)
    gpbBotoes: TGroupBox;
    gpbPeriodo: TGroupBox;
    lblA: TLabel;
    edtPeriodoInicio: TMaskEdit;
    edtPeriodoFim: TMaskEdit;
    CamposObrigatorios: TValueListEditor;
    qrySaidas: TIBOQuery;
    qryEntradas: TIBOQuery;
    qryTotais: TIBOQuery;
    frxReport: TfrxReport;
    frxDBSaidas: TfrxDBDataset;
    frxDBEntradas: TfrxDBDataset;
    frxDBTotal: TfrxDBDataset;
    btnImprimir: TBitBtn;
    gpbImprimirContas: TGroupBox;
    ckbSaidas: TCheckBox;
    ckbEntradas: TCheckBox;
    frxPDFExport: TfrxPDFExport;
    frxMailExport: TfrxMailExport;
    frxXLSExport: TfrxXLSExport;
    procedure edtPeriodoFimExit(Sender: TObject);
    procedure edtPeriodoInicioExit(Sender: TObject);
    procedure qryTotaisCalcFields(DataSet: TDataSet);
    procedure btnImprimirClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmImpFluxoCaixa: TfrmImpFluxoCaixa;

implementation

uses uFuncoes, udmPrincipal, uConstantes;

{$R *.dfm}

procedure TfrmImpFluxoCaixa.btnImprimirClick(Sender: TObject);
begin
  inherited;

  if ( not ( ValidaCampoObrigatorio(Self, CamposObrigatorios) ) ) then
    Abort;

  if ( not ( ckbEntradas.Checked ) ) and ( not ( ckbSaidas.Checked ) ) then
  begin
    MsgBox('"Prezado Cliente"'#13'Selecione o tipo de conta a ser impresso', MB_OK+MB_ICONINFORMATION);
    ActiveControl := ckbEntradas;
    Exit;
  end;

  qryEntradas.Close;

  if ( ckbEntradas.Checked ) then
  begin
    qryEntradas.ParamByName('DT_REFERENCIAINICIO').AsDateTime := StrToDate( edtPeriodoInicio.Text );
    qryEntradas.ParamByName('DT_REFERENCIAFIM').AsDateTime    := StrToDate( edtPeriodoFim.Text );
  end
  else
  begin
    qryEntradas.ParamByName('DT_REFERENCIAINICIO').AsDateTime := 0;
    qryEntradas.ParamByName('DT_REFERENCIAFIM').AsDateTime    := 0;
  end;

  qryEntradas.Open;

  qrySaidas.Close;

  if ( ckbSaidas.Checked ) then
  begin
    qrySaidas.ParamByName('DT_REFERENCIAINICIO').AsDateTime := StrToDate( edtPeriodoInicio.Text );
    qrySaidas.ParamByName('DT_REFERENCIAFIM').AsDateTime    := StrToDate( edtPeriodoFim.Text );
  end
  else
  begin
    qrySaidas.ParamByName('DT_REFERENCIAINICIO').AsDateTime := 0;
    qrySaidas.ParamByName('DT_REFERENCIAFIM').AsDateTime    := 0;
  end;

  qrySaidas.Open;

  if ( qryEntradas.IsEmpty ) and ( qrySaidas.IsEmpty ) then
  begin
    MsgBox('"Prezado Cliente"'#13'Não existe contas no período informado', MB_OK+MB_ICONINFORMATION);
    Exit;
  end;

  qryTotais.Close;
  qryTotais.ParamByName('DT_REFERENCIAINICIO').AsDateTime := StrToDate( edtPeriodoInicio.Text );
  qryTotais.ParamByName('DT_REFERENCIAFIM').AsDateTime    := StrToDate( edtPeriodoFim.Text );
  qryTotais.Open;

  (frxReport.FindObject('hdSaida') as TfrxHeader).Visible     := not (qrySaidas.IsEmpty);
  (frxReport.FindObject('mdSaida') as TfrxMasterData).Visible := not (qrySaidas.IsEmpty);
  (frxReport.FindObject('ftSaida') as TfrxFooter).Visible     := not (qrySaidas.IsEmpty);

  (frxReport.FindObject('hdEntrada') as TfrxHeader).Visible     := not (qryEntradas.IsEmpty);
  (frxReport.FindObject('mdEntrada') as TfrxMasterData).Visible := not (qryEntradas.IsEmpty);
  (frxReport.FindObject('ftEntrada') as TfrxFooter).Visible     := not (qryEntradas.IsEmpty);

  frxReport.Variables['PeriodoInicio'] := QuotedStr( edtPeriodoInicio.Text );
  frxReport.Variables['PeriodoFim']    := QuotedStr( edtPeriodoFim.Text );

  if ( frxReport.PrepareReport ) then
    frxReport.ShowPreparedReport;

end;

procedure TfrmImpFluxoCaixa.edtPeriodoFimExit(Sender: TObject);
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

procedure TfrmImpFluxoCaixa.edtPeriodoInicioExit(Sender: TObject);
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

procedure TfrmImpFluxoCaixa.FormCreate(Sender: TObject);
begin
  inherited;

  edtPeriodoInicio.Text := FormatDateTime('dd/mm/yyyy', StartOfTheMonth(Now));
  edtPeriodoFim.Text    := FormatDateTime('dd/mm/yyyy', Now);

end;

procedure TfrmImpFluxoCaixa.FormShow(Sender: TObject);
begin
  inherited;

  if (GBL_USUARIO.FG_ADMINISTRADOR <> 'SIM') then
  begin
    MsgBox('"Prezado Cliente"'#13'Recurso disponível apenas para o administrador do sistema.', MB_OK+MB_ICONWARNING);
    PostMessage(Handle, WM_CLOSE, 0, 0);
  end;

end;

procedure TfrmImpFluxoCaixa.qryTotaisCalcFields(DataSet: TDataSet);
begin
  inherited;

  qryTotais.FieldByName('VR_TOTAL').AsFloat := qryTotais.FieldByName('VR_TOTALCONTARECEBER').AsFloat -
                                               qryTotais.FieldByName('VR_TOTALCONTAPAGAR').AsFloat;

end;

end.
