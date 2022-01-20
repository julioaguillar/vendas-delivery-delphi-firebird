unit uImpVendas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uPadrao, Grids, ValEdit, StdCtrls, Buttons, frxExportXLS, DateUtils,
  frxExportMail, frxClass, frxExportPDF, frxDBSet, DB, IBODataset, Mask;

type
  TfrmImpVendas = class(TfrmPadrao)
    frxRelatorioResumido: TfrxReport;
    frxPDFExport: TfrxPDFExport;
    frxMailExport: TfrxMailExport;
    frxXLSExport: TfrxXLSExport;
    gpbBotoes: TGroupBox;
    btnImprimir: TBitBtn;
    CamposObrigatorios: TValueListEditor;
    frxDBVenda: TfrxDBDataset;
    qryLctVenda: TIBOQuery;
    gpbPeriodo: TGroupBox;
    lblA: TLabel;
    edtPeriodoInicio: TMaskEdit;
    edtPeriodoFim: TMaskEdit;
    gpbImprimirContas: TGroupBox;
    rdbResumido: TRadioButton;
    rdbDetalhado: TRadioButton;
    frxRelatorioDetalhado: TfrxReport;
    frxDBVendaResumido: TfrxDBDataset;
    qryLctVendaResumido: TIBOQuery;
    qryLctVendaItem: TIBOQuery;
    frxDBVendaItem: TfrxDBDataset;
    procedure btnImprimirClick(Sender: TObject);
    procedure edtPeriodoInicioExit(Sender: TObject);
    procedure edtPeriodoFimExit(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure qryLctVendaAfterScroll(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmImpVendas: TfrmImpVendas;

implementation

uses udmPrincipal, uFuncoes, uConsLctPedido;

{$R *.dfm}

procedure TfrmImpVendas.btnImprimirClick(Sender: TObject);
begin
  inherited;

  if ( not ( ValidaCampoObrigatorio(Self, CamposObrigatorios) ) ) then
    Abort;

  if ( rdbResumido.Checked ) then
  begin

    qryLctVendaResumido.Close;
    qryLctVendaResumido.ParamByName('DT_VENDAINICIO').AsDateTime := StrToDateDef(edtPeriodoInicio.Text, 0);
    qryLctVendaResumido.ParamByName('DT_VENDAFIM').AsDateTime    := StrToDateDef(edtPeriodoFim.Text, 0);
    qryLctVendaResumido.Open;

    if ( not qryLctVendaResumido.IsEmpty ) then
    begin

      frxRelatorioResumido.Variables['PeriodoInicio'] := QuotedStr( edtPeriodoInicio.Text );
      frxRelatorioResumido.Variables['PeriodoFim']    := QuotedStr( edtPeriodoFim.Text );

      if ( frxRelatorioResumido.PrepareReport ) then
        frxRelatorioResumido.ShowPreparedReport;

    end
    else
      MsgBox('"Prezado Cliente"'#13'Não foi encontrado lançamento no período. Verifique!', MB_OK+MB_ICONINFORMATION);

  end
  else
  begin

    qryLctVenda.Close;
    qryLctVenda.ParamByName('DT_VENDAINICIO').AsDateTime := StrToDateDef(edtPeriodoInicio.Text, 0);
    qryLctVenda.ParamByName('DT_VENDAFIM').AsDateTime    := StrToDateDef(edtPeriodoFim.Text, 0);
    qryLctVenda.Open;

    if ( not qryLctVenda.IsEmpty ) then
    begin

      frxRelatorioDetalhado.Variables['PeriodoInicio'] := QuotedStr( edtPeriodoInicio.Text );
      frxRelatorioDetalhado.Variables['PeriodoFim']    := QuotedStr( edtPeriodoFim.Text );

      if ( frxRelatorioDetalhado.PrepareReport ) then
        frxRelatorioDetalhado.ShowPreparedReport;

    end;

  end;

end;

procedure TfrmImpVendas.edtPeriodoFimExit(Sender: TObject);
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

procedure TfrmImpVendas.edtPeriodoInicioExit(Sender: TObject);
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

procedure TfrmImpVendas.FormCreate(Sender: TObject);
begin
  inherited;

  edtPeriodoInicio.Text := FormatDateTime('dd/mm/yyyy', StartOfTheMonth(Now));
  edtPeriodoFim.Text    := FormatDateTime('dd/mm/yyyy', Now);

end;

procedure TfrmImpVendas.qryLctVendaAfterScroll(DataSet: TDataSet);
begin
  inherited;

  qryLctVendaItem.Close;

  if ( qryLctVenda.Active ) then
  begin
    qryLctVendaItem.ParamByName('ID_VENDA').AsInteger := qryLctVenda.FieldByName('ID_VENDA').AsInteger;
    qryLctVendaItem.Open;
  end;

end;

end.
