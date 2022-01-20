unit uLctContasPagar;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uCadPadrao, DB, IBODataset, IB_Components, Grids, ValEdit, StdCtrls,
  Buttons, DBGrids, StrUtils, Mask, ExtCtrls, DateUtils;

type
  TDataReferencia = record
                      DataInicio: TDateTime;
                      DataFim   : TDateTime;
                    end;

  TfrmLctContasPagar = class(TfrmCadPadrao)
    gpbContas: TGroupBox;
    dbgContas: TDBGrid;
    cbbMes: TComboBox;
    edtAno: TEdit;
    lblDe: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure btnIncluirClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure btnConsultarClick(Sender: TObject);
    procedure edtAnoExit(Sender: TObject);
    procedure cbbMesChange(Sender: TObject);
    procedure dbgContasTitleClick(Column: TColumn);
    procedure qryCadPadraoAfterOpen(DataSet: TDataSet);
  private
    function RetornaDataReferencia: TDataReferencia;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmLctContasPagar: TfrmLctContasPagar;

implementation

uses udmPrincipal, uCadContasPagar, uFuncoes;

{$R *.dfm}

procedure TfrmLctContasPagar.btnAlterarClick(Sender: TObject);
begin
  inherited;

  if ( not ( qryCadPadrao.IsEmpty ) ) then
  begin

    qryCadPadrao.Edit;

    frmCadContasPagar := TfrmCadContasPagar.Create(Self);

    frmCadContasPagar.dbeDataVencimento.Enabled := false;
    frmCadContasPagar.dbeValor.Enabled          := false;

    frmCadContasPagar.ShowModal;

    if ( frmCadContasPagar.ModalResult = mrOk ) then
      qryCadPadrao.Refresh;

    FreeAndNil(frmCadContasPagar);

  end;

end;

procedure TfrmLctContasPagar.btnConsultarClick(Sender: TObject);
begin
  inherited;

  if ( not ( qryCadPadrao.IsEmpty ) ) then
  begin

    qryCadPadrao.Edit;

    frmCadContasPagar := TfrmCadContasPagar.Create(Self);

    frmCadContasPagar.dbeDataVencimento.Enabled := false;
    frmCadContasPagar.dbeValor.Enabled          := false;
    frmCadContasPagar.dbePagarA.Enabled         := false;
    frmCadContasPagar.dbeDescricao.Enabled      := false;
    frmCadContasPagar.dbeObservacao.Enabled     := false;
    frmCadContasPagar.btnConfirmar.Enabled      := false;

    frmCadContasPagar.ShowModal;

    if ( frmCadContasPagar.ModalResult = mrOk ) then
      qryCadPadrao.Refresh;

    FreeAndNil(frmCadContasPagar);

  end;

end;

procedure TfrmLctContasPagar.btnExcluirClick(Sender: TObject);
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

procedure TfrmLctContasPagar.btnIncluirClick(Sender: TObject);
begin
  inherited;

  qryCadPadrao.Append;
  qryCadPadrao.FieldByName('DT_VENCIMENTO').AsDateTime := Now;

  frmCadContasPagar := TfrmCadContasPagar.Create(Self);
  frmCadContasPagar.ShowModal;

  if ( frmCadContasPagar.ModalResult = mrOk ) then
    qryCadPadrao.Refresh;

  FreeAndNil(frmCadContasPagar);

end;

procedure TfrmLctContasPagar.cbbMesChange(Sender: TObject);
begin
  inherited;

  qryCadPadrao.Close;
  qryCadPadrao.ParamByName('DT_INICIO').AsDateTime := RetornaDataReferencia.DataInicio;
  qryCadPadrao.ParamByName('DT_FIM').AsDateTime    := RetornaDataReferencia.DataFim;
  qryCadPadrao.Open;

end;

procedure TfrmLctContasPagar.dbgContasTitleClick(Column: TColumn);
begin
  inherited;

  if ( Column.FieldName = 'DT_VENCIMENTO' ) then
    OrdenaGrid(dbgContas, Column, 'LCT_CONTASPAGAR', 'ASC')
  else
    OrdenaGrid(dbgContas, Column, 'LCT_CONTASPAGAR');

end;

procedure TfrmLctContasPagar.edtAnoExit(Sender: TObject);
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

procedure TfrmLctContasPagar.FormCreate(Sender: TObject);
begin
  inherited;

  cbbMes.ItemIndex := cbbMes.Items.IndexOf(FormatDateTime('mmmm', Date));
  edtAno.Text      := FormatDateTime('yyyy', Date);

  qryCadPadrao.Close;
  qryCadPadrao.ParamByName('DT_INICIO').AsDateTime := RetornaDataReferencia.DataInicio;
  qryCadPadrao.ParamByName('DT_FIM').AsDateTime    := RetornaDataReferencia.DataFim;
  qryCadPadrao.Open;

end;

procedure TfrmLctContasPagar.qryCadPadraoAfterOpen(DataSet: TDataSet);
begin
  inherited;

  with qryCadPadrao do
  begin
    ( qryCadPadrao.FieldByName('DT_VENCIMENTO') as TDateField ).OnSetText := dmPrincipal.ValidaData;
  end;

end;

function TfrmLctContasPagar.RetornaDataReferencia: TDataReferencia;
begin

  Result.DataInicio := 0;
  Result.DataFim    := 0;

  try

    Result.DataInicio := StrToDate('01/'+FormatFloat('00', cbbMes.ItemIndex+1) + '/' + edtAno.Text );
    Result.DataFim    := EndOfTheMonth(Result.DataInicio);

  except
  end;

end;

end.
