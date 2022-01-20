unit uConsGraficoVendas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uPadrao, StdCtrls, Buttons, Mask, TeEngine, ExtCtrls, TeeProcs, Chart,
  Series, DB, IBODataset, DateUtils;

type
  TfrmConsGraficoVendas = class(TfrmPadrao)
    gpbBotoes: TGroupBox;
    btnRetornar: TBitBtn;
    gpbPeriodo: TGroupBox;
    lblA: TLabel;
    ChartVendas: TChart;
    cbbPeriodoInicio: TComboBox;
    cbbPeriodoFim: TComboBox;
    lblDe: TLabel;
    edtAno: TEdit;
    gpbFiltro: TGroupBox;
    ckbVendas: TCheckBox;
    ckbEntrada: TCheckBox;
    btnFiltro: TBitBtn;
    SeriesVendas: TBarSeries;
    SeriesEntradas: TBarSeries;
    qryConsVendas: TIBOQuery;
    qryConsEntradas: TIBOQuery;
    btnImprimirRelatório: TSpeedButton;
    procedure btnRetornarClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure edtAnoExit(Sender: TObject);
    procedure btnFiltroClick(Sender: TObject);
    procedure btnImprimirRelatórioClick(Sender: TObject);
  private
    { Private declarations }

    procedure MontarGrafico;

  public
    { Public declarations }

    execActivate: Boolean;

  end;

var
  frmConsGraficoVendas: TfrmConsGraficoVendas;

  arrMesExtenso: Array [0..11] of String = ('Janeiro', 'Fevereiro', 'Março', 'Abril', 'Maio', 'Junho', 'Julho', 'Agosto', 'Setembro', 'Outubro', 'Novembro', 'Dezembro');

implementation

uses udmPrincipal, uFuncoes;

{$R *.dfm}

procedure TfrmConsGraficoVendas.edtAnoExit(Sender: TObject);
begin
  inherited;

  if ( edtAno.Text <> '' ) then
  begin

    try
      edtAno.Text := FormatDateTime('yyyy', StrToDate('01/01/'+edtAno.Text));
    except
      MsgBox('"Prezado Cliente"'#13'Ano inválido.', MB_OK+MB_ICONINFORMATION);
      edtAno.SetFocus;
      Abort;
    end;

  end
  else
    edtAno.Text := FormatDateTime('yyyy', Now);

end;

procedure TfrmConsGraficoVendas.FormActivate(Sender: TObject);
begin
  inherited;

  if ( execActivate ) then
  begin
    execActivate := False;
    MontarGrafico;
  end;

end;

procedure TfrmConsGraficoVendas.FormCreate(Sender: TObject);
begin
  inherited;

  execActivate := True;

  cbbPeriodoInicio.ItemIndex := 0;
  cbbPeriodoFim.ItemIndex    := MonthOf(Now) - 1;
  edtAno.Text                := FormatDateTime('yyyy', Now);

end;

procedure TfrmConsGraficoVendas.MontarGrafico;
var inicio, fim, I: Integer;
    valor: Double;
begin

  ChartVendas.Title.Caption := 'Gráfico de Vendas - '+edtAno.Text;

  SeriesVendas.Clear;
  SeriesEntradas.Clear;

  inicio := cbbPeriodoInicio.ItemIndex;
  fim    := cbbPeriodoFim.ItemIndex;

  for I := inicio to fim do
  begin

    if ( ckbVendas.Checked ) then
    begin

      valor := 0.0;

      qryConsVendas.Close;
      qryConsVendas.ParamByName('DT_REFERENCIAINICIO').AsDate := StrToDate('01/'+FormatFloat('00', I+1)+'/'+edtAno.Text);
      qryConsVendas.ParamByName('DT_REFERENCIAFIM').AsDate    := EndOfTheMonth(StrToDate('01/'+FormatFloat('00', I+1)+'/'+edtAno.Text));
      qryConsVendas.Open;

      while not ( qryConsVendas.Eof ) do
      begin
        valor := valor + qryConsVendas.FieldByName('VR_TOTALVENDA').AsFloat;
        qryConsVendas.Next;
      end;

      SeriesVendas.AddY(valor, arrMesExtenso[I]);

    end;

    if ( ckbEntrada.Checked ) then
    begin

      valor := 0.0;

      qryConsEntradas.Close;
      qryConsEntradas.ParamByName('DT_REFERENCIAINICIO').AsDate := StrToDate('01/'+FormatFloat('00', I+1)+'/'+edtAno.Text);
      qryConsEntradas.ParamByName('DT_REFERENCIAFIM').AsDate    := EndOfTheMonth(StrToDate('01/'+FormatFloat('00', I+1)+'/'+edtAno.Text));
      qryConsEntradas.Open;

      while not ( qryConsEntradas.Eof ) do
      begin
        valor := valor + qryConsEntradas.FieldByName('VR_TOTALENTRADA').AsFloat;
        qryConsEntradas.Next;
      end;

      SeriesEntradas.AddY(valor, arrMesExtenso[I]);

    end;

  end;

end;

procedure TfrmConsGraficoVendas.btnFiltroClick(Sender: TObject);
begin
  inherited;

  if ( not ckbVendas.Checked ) and ( not ckbEntrada.Checked ) then
  begin
    MsgBox('"Prezado Cliente"'#13'É preciso selecionar pelo menos uma opção de filtro', MB_OK+MB_ICONINFORMATION);
    Exit;
  end;

  MontarGrafico;

end;

procedure TfrmConsGraficoVendas.btnImprimirRelatórioClick(Sender: TObject);
begin
  inherited;

  ChartVendas.PrintLandscape;

end;

procedure TfrmConsGraficoVendas.btnRetornarClick(Sender: TObject);
begin
  inherited;

  Close;

end;

end.
