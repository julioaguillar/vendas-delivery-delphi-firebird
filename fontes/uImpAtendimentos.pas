unit uImpAtendimentos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uPadrao, StdCtrls, Buttons, DB, IBODataset, Mask, DBCtrls, Grids,
  ValEdit, frxClass, frxDBSet, frxExportPDF, frxExportXML, frxExportMail,
  frxExportXLS, ComObj, excelXP;

type
  TTipoImpressaoAgenda = (fsAnalitica, fsSintetica);

type
  TfrmImpAtendimentos = class(TfrmPadrao)
    gpbProfissionais: TGroupBox;
    dblProfissionais: TDBLookupComboBox;
    gpbPeriodo: TGroupBox;
    edtDataReferencia: TMaskEdit;
    qryConsProfissionais: TIBOQuery;
    dtsConsProfissionais: TDataSource;
    qryConsAtendimento: TIBOQuery;
    gpbBotoes: TGroupBox;
    btnImprimir: TBitBtn;
    CamposObrigatorios: TValueListEditor;
    frxReport: TfrxReport;
    frxDBAtendimento: TfrxDBDataset;
    qryAtendimento: TIBOQuery;
    ckbAgendaBranco: TCheckBox;
    gpbPeriodoFim: TGroupBox;
    edtDataReferenciaFim: TMaskEdit;
    frxPDFExport: TfrxPDFExport;
    ckbOcultarHorario: TCheckBox;
    procedure FormCreate(Sender: TObject);
    procedure btnImprimirClick(Sender: TObject);
    procedure edtDataReferenciaExit(Sender: TObject);
    procedure edtDataReferenciaFimExit(Sender: TObject);
    procedure ckbAgendaBrancoClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmImpAtendimentos: TfrmImpAtendimentos;

implementation

uses udmPrincipal, uFuncoes, uConstantes;

{$R *.dfm}

procedure TfrmImpAtendimentos.btnImprimirClick(Sender: TObject);
begin
  inherited;

  if ( not ( ValidaCampoObrigatorio(Self, CamposObrigatorios) ) ) then
    Abort;

  if ( not ( ckbAgendaBranco.Checked ) ) then
  begin

    qryAtendimento.Close;
    qryAtendimento.ParamByName('P_IN_CD_PROFISSIONAL').AsInteger := qryConsProfissionais.FieldByName('CD_PROFISSIONAL').AsInteger;
    qryAtendimento.ParamByName('P_IN_ID_DIASEMANA').AsInteger    := DayOfWeek( StrToDate(edtDataReferencia.Text) );
    qryAtendimento.ParamByName('P_IN_DT_REFERENCIA').AsDate      := StrToDate(edtDataReferencia.Text);
    qryAtendimento.Open;

    if ( qryAtendimento.IsEmpty ) then
    begin
      MsgBox('"Prezado Cliente"'#13'Não existe consulta(s) agendada(s) na data informada', MB_OK+MB_ICONINFORMATION);
      Exit;
    end;

  end;

  qryConsAtendimento.Close;

  if ( ckbOcultarHorario.Checked ) then
    qryConsAtendimento.SQL.Strings[16] := 'WHERE STRDPRC_RETORNAAGENDA.P_OU_DS_NOME IS NOT NULL'
  else
    qryConsAtendimento.SQL.Strings[16] := '/*WHERE STRDPRC_RETORNAAGENDA.P_OU_DS_NOME IS NOT NULL*/';

  qryConsAtendimento.ParamByName('P_IN_CD_PROFISSIONAL').AsInteger := qryConsProfissionais.FieldByName('CD_PROFISSIONAL').AsInteger;
  qryConsAtendimento.ParamByName('P_IN_ID_DIASEMANA').AsInteger    := DayOfWeek( StrToDate(edtDataReferencia.Text) );
  qryConsAtendimento.ParamByName('P_IN_DT_REFERENCIA').AsDate      := StrToDate(edtDataReferencia.Text);
  qryConsAtendimento.Open;

  frxReport.Variables['DataAgenda']   := QuotedStr( edtDataReferencia.Text );
  frxReport.Variables['Profissional'] := QuotedStr( qryConsProfissionais.FieldByName('DS_NOME').AsString );

  if ( frxReport.PrepareReport ) then
    frxReport.ShowPreparedReport;

end;

procedure TfrmImpAtendimentos.ckbAgendaBrancoClick(Sender: TObject);
begin
  inherited;

  ckbOcultarHorario.Enabled := not ( ckbAgendaBranco.Checked );

  if ( not ( ckbOcultarHorario.Enabled ) ) then
    ckbOcultarHorario.Checked := False;

end;

procedure TfrmImpAtendimentos.edtDataReferenciaExit(Sender: TObject);
begin
  inherited;

  if ( edtDataReferencia.Text <> '  /  /    ' ) then
  begin

    try
      edtDataReferencia.Text := FormatDateTime('dd/mm/yyyy', StrToDate(edtDataReferencia.Text));
    except
      MsgBox('"Prezado Cliente"'+#13+'Data inválida', MB_OK+MB_ICONINFORMATION);
      edtDataReferencia.SetFocus;
      Abort;
    end;

  end;

end;

procedure TfrmImpAtendimentos.edtDataReferenciaFimExit(Sender: TObject);
begin
  inherited;

  if ( edtDataReferenciaFim.Text <> '  /  /    ' ) then
  begin

    try
      edtDataReferenciaFim.Text := FormatDateTime('dd/mm/yyyy', StrToDate(edtDataReferenciaFim.Text));
    except
      MsgBox('"Prezado Cliente"'#13'Data inválida', MB_OK+MB_ICONINFORMATION);
      edtDataReferenciaFim.SetFocus;
      Abort;
    end;

  end;

end;

procedure TfrmImpAtendimentos.FormCreate(Sender: TObject);
begin
  inherited;

  edtDataReferencia.Text := FormatDateTime('dd/mm/yyyy', Date);

  qryConsProfissionais.Close;
  qryConsProfissionais.Open;

  if ( qryConsProfissionais.RecordCount = 1 ) then
    dblProfissionais.KeyValue := qryConsProfissionais.FieldByName('CD_PROFISSIONAL').Value;

end;

end.
