unit uImpAniversariantes;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uPadrao, StdCtrls, Mask, Buttons, Grids, ValEdit, frxClass,
  frxExportPDF, frxDBSet, DB, IBODataset, frxExportXLS, frxExportMail, ComObj,
  excelXP;

type
  TfrmImpAniversariantes = class(TfrmPadrao)
    gpbBotoes: TGroupBox;
    Label1: TLabel;
    qryConsAniversariantes: TIBOQuery;
    frxReport: TfrxReport;
    frxDBDataset: TfrxDBDataset;
    gpbDataFim: TGroupBox;
    cbbMes: TComboBox;
    btnImprimir: TBitBtn;
    frxPDFExport: TfrxPDFExport;
    frxMailExport: TfrxMailExport;
    frxXLSExport: TfrxXLSExport;
    procedure FormCreate(Sender: TObject);
    procedure btnImprimirClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmImpAniversariantes: TfrmImpAniversariantes;

implementation

uses uFuncoes, udmPrincipal, uConstantes;

{$R *.dfm}

procedure TfrmImpAniversariantes.btnImprimirClick(Sender: TObject);
begin
  inherited;

  qryConsAniversariantes.Close;
  qryConsAniversariantes.ParamByName('P_IN_DT_MES').AsInteger := cbbMes.ItemIndex + 1;
  qryConsAniversariantes.Open;

  if ( qryConsAniversariantes.IsEmpty ) then
  begin
    MsgBox('"Prezado Cliente"'#13'Não existe nenhum Cliente fazendo aniversário no mês selecionado', MB_OK+MB_ICONINFORMATION);
    Exit;
  end;

  frxReport.Variables['MesAno'] := QuotedStr( cbbMes.Text + ' de ' + FormatDateTime('yyyy', Date) );

  if ( frxReport.PrepareReport ) then
    frxReport.ShowPreparedReport;

end;

procedure TfrmImpAniversariantes.FormCreate(Sender: TObject);
begin
  inherited;

  cbbMes.ItemIndex := cbbMes.Items.IndexOf( FormatDateTime('mmmm', Date) );

end;

end.
