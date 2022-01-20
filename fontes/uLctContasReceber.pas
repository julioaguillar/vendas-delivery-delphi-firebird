unit uLctContasReceber;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uCadPadrao, DB, IBODataset, IB_Components, Grids, ValEdit, StdCtrls,
  Buttons, Mask, ExtCtrls, DBGrids, StrUtils, DateUtils;

type

  TDataReferencia = record
                      DataInicio: TDateTime;
                      DataFim   : TDateTime;
                    end;

  TfrmLctContasReceber = class(TfrmCadPadrao)
    gpbContas: TGroupBox;
    dbgContas: TDBGrid;
    cbbMes: TComboBox;
    lblDe: TLabel;
    edtAno: TEdit;
    procedure btnAlterarClick(Sender: TObject);
    procedure btnConsultarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnIncluirClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure cbbMesChange(Sender: TObject);
    procedure edtAnoExit(Sender: TObject);
    procedure dbgContasTitleClick(Column: TColumn);
    procedure qryCadPadraoAfterOpen(DataSet: TDataSet);
  private
    function RetornaDataReferencia: TDataReferencia;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmLctContasReceber: TfrmLctContasReceber;

implementation

uses udmPrincipal, uCadContasReceber, uFuncoes;

{$R *.dfm}

procedure TfrmLctContasReceber.btnAlterarClick(Sender: TObject);
begin
  inherited;

  if ( not ( qryCadPadrao.IsEmpty ) ) then
  begin

    qryCadPadrao.Edit;

    frmCadContasReceber := TfrmCadContasReceber.Create(Self);

    frmCadContasReceber.dbeDataRecebimento.Enabled := false;
    frmCadContasReceber.dbeReceberDe.Enabled       := false;

    frmCadContasReceber.ShowModal;

    if ( frmCadContasReceber.ModalResult = mrOk ) then
      qryCadPadrao.Refresh;

    FreeAndNil(frmCadContasReceber);

  end;

end;

procedure TfrmLctContasReceber.btnConsultarClick(Sender: TObject);
begin
  inherited;

  if ( not ( qryCadPadrao.IsEmpty ) ) then
  begin

    qryCadPadrao.Edit;

    frmCadContasReceber := TfrmCadContasReceber.Create(Self);

    frmCadContasReceber.dbeDataRecebimento.Enabled := false;
    frmCadContasReceber.dbeValor.Enabled           := false;
    frmCadContasReceber.dbeReceberDe.Enabled       := false;
    frmCadContasReceber.dbeDescricao.Enabled       := false;
    frmCadContasReceber.dbeObservacao.Enabled      := false;
    frmCadContasReceber.btnConfirmar.Enabled       := false;

    frmCadContasReceber.ShowModal;

    if ( frmCadContasReceber.ModalResult = mrOk ) then
      qryCadPadrao.Refresh;

    FreeAndNil(frmCadContasReceber);

  end;

end;

procedure TfrmLctContasReceber.btnExcluirClick(Sender: TObject);
begin
  inherited;

  if ( not ( qryCadPadrao.IsEmpty ) ) and
     ( MsgBox('"Prezado Cliente"'#13'Confirma a exclusão do registro', MB_YESNO+MB_ICONQUESTION) = IDYES ) then
  begin

    try

      qryCadPadrao.Delete;
      trnsCadPadrao.Commit;

    except
      on e: Exception do
      begin
        trnsCadPadrao.Rollback;
        MsgBox('"Prezado Cliente"'#13'Ocorreu um erro na exclusão do registro com a seguinte mensagem:'+#13+e.Message, MB_OK+MB_ICONERROR);
      end;
    end;

  end;

end;

procedure TfrmLctContasReceber.btnIncluirClick(Sender: TObject);
begin
  inherited;

  qryCadPadrao.Append;
  qryCadPadrao.FieldByName('DT_RECEBIMENTO').AsDateTime := Now;

  frmCadContasReceber := TfrmCadContasReceber.Create(Self);
  frmCadContasReceber.ShowModal;

  if ( frmCadContasReceber.ModalResult = mrOk ) then
    qryCadPadrao.Refresh;

  FreeAndNil(frmCadContasReceber);

end;

procedure TfrmLctContasReceber.cbbMesChange(Sender: TObject);
begin
  inherited;

  qryCadPadrao.Close;
  qryCadPadrao.ParamByName('DT_INICIO').AsDateTime := RetornaDataReferencia.DataInicio;
  qryCadPadrao.ParamByName('DT_FIM').AsDateTime    := RetornaDataReferencia.DataFim;
  qryCadPadrao.Open;

end;

procedure TfrmLctContasReceber.dbgContasTitleClick(Column: TColumn);
begin
  inherited;

  if ( Column.FieldName = 'DT_RECEBIMENTO' ) then
    OrdenaGrid(dbgContas, Column, 'LCT_CONTASRECEBER', 'ASC')
  else
    OrdenaGrid(dbgContas, Column, 'LCT_CONTASRECEBER');

end;

procedure TfrmLctContasReceber.edtAnoExit(Sender: TObject);
begin
  inherited;

  if ( edtAno.Text <> '' ) then
  begin

    try

      edtAno.Text := FormatDateTime('yyyy', StrToDate('01/01/'+edtAno.Text));

      qryCadPadrao.Close;
      qryCadPadrao.ParamByName('DT_INICIO').AsDateTime := RetornaDataReferencia.DataInicio;
      qryCadPadrao.ParamByName('DT_FIM').AsDateTime    := RetornaDataReferencia.DataFim;
      qryCadPadrao.Open;

    except
    end;

  end;

end;

procedure TfrmLctContasReceber.FormCreate(Sender: TObject);
begin
  inherited;

  cbbMes.ItemIndex := cbbMes.Items.IndexOf(FormatDateTime('mmmm', Date));
  edtAno.Text      := FormatDateTime('yyyy', Date);

  qryCadPadrao.Close;
  qryCadPadrao.ParamByName('DT_INICIO').AsDateTime := RetornaDataReferencia.DataInicio;
  qryCadPadrao.ParamByName('DT_FIM').AsDateTime    := RetornaDataReferencia.DataFim;
  qryCadPadrao.Open;

end;

procedure TfrmLctContasReceber.qryCadPadraoAfterOpen(DataSet: TDataSet);
begin
  inherited;

  with qryCadPadrao do
  begin
    ( qryCadPadrao.FieldByName('DT_RECEBIMENTO') as TDateField ).OnSetText := dmPrincipal.ValidaData;
  end;

end;

function TfrmLctContasReceber.RetornaDataReferencia: TDataReferencia;
begin

  Result.DataInicio := 0;
  Result.DataFim    := 0;

  try

    Result.DataInicio := StrToDate( '01/' + FormatFloat('00', cbbMes.ItemIndex+1) + '/' + edtAno.Text );
    Result.DataFim    := EndOfTheMonth(Result.DataInicio);

  except
  end;

end;

end.
