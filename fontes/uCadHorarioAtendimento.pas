unit uCadHorarioAtendimento;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uCadPadrao, Menus, DB, IBODataset, IB_Components, Grids, ValEdit,
  StdCtrls, Buttons, DBGrids, DBCtrls, ComCtrls, DBClient;

type
  TfrmCadHorarioAtendimento = class(TfrmCadPadrao)
    gpbHorarioAtendimento: TGroupBox;
    dbgHorarioAtendimento: TDBGrid;
    gpbIntervalo: TGroupBox;
    cbbIntervalo: TComboBox;
    qryAtualizaIntervalo: TIBOQuery;
    btnRepetirHorario: TSpeedButton;
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure dbgHorarioAtendimentoKeyPress(Sender: TObject; var Key: Char);
    procedure dbgHorarioAtendimentoKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure dbgHorarioAtendimentoColEnter(Sender: TObject);
    procedure dbcHorarioKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure dbgHorarioAtendimentoCellClick(Column: TColumn);
    procedure dbgHorarioAtendimentoEnter(Sender: TObject);
    procedure qryCadPadraoAfterOpen(DataSet: TDataSet);
    procedure btnConfirmarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnRepetirHorarioClick(Sender: TObject);
    procedure qryCadPadraoAfterInsert(DataSet: TDataSet);
  private
    { Private declarations }
  public
    cdProfissional, fgIntervaloAtendimento: Integer;
    { Public declarations }
  end;

var
  frmCadHorarioAtendimento: TfrmCadHorarioAtendimento;

const
  Semana: array[1..7] of String = ('Segunda','Terca','Quarta','Quinta','Sexta','Sabado','Domingo');

implementation

uses udmPrincipal, uFuncoes;

{$R *.dfm}

procedure TfrmCadHorarioAtendimento.btnCancelarClick(Sender: TObject);
begin
  inherited;

  qryCadPadrao.Cancel;
  trnsCadPadrao.Rollback;

  ModalResult := mrCancel;

end;

procedure TfrmCadHorarioAtendimento.btnConfirmarClick(Sender: TObject);
begin
  inherited;

  try

    if ( qryCadPadrao.State in [dsInsert,dsEdit] ) then
      qryCadPadrao.Post;

    qryAtualizaIntervalo.Close;
    qryAtualizaIntervalo.ParamByName('CD_PROFISSIONAL').AsInteger := cdProfissional;

    if ( cbbIntervalo.Text = '5 minutos' ) then
      qryAtualizaIntervalo.ParamByName('FG_INTERVALOATENDIMENTO').AsInteger := 5
    else if ( cbbIntervalo.Text = '10 minutos' ) then
      qryAtualizaIntervalo.ParamByName('FG_INTERVALOATENDIMENTO').AsInteger := 10
    else if ( cbbIntervalo.Text = '15 minutos' ) then
      qryAtualizaIntervalo.ParamByName('FG_INTERVALOATENDIMENTO').AsInteger := 15
    else if ( cbbIntervalo.Text = '30 minutos' ) then
      qryAtualizaIntervalo.ParamByName('FG_INTERVALOATENDIMENTO').AsInteger := 30
    else if ( cbbIntervalo.Text = '45 minutos' ) then
      qryAtualizaIntervalo.ParamByName('FG_INTERVALOATENDIMENTO').AsInteger := 45
    else if ( cbbIntervalo.Text = '1 hora' ) then
      qryAtualizaIntervalo.ParamByName('FG_INTERVALOATENDIMENTO').AsInteger := 60;

    qryAtualizaIntervalo.ExecSQL;

    trnsCadPadrao.Commit;

  except
    on e: Exception do
    begin
      trnsCadPadrao.Rollback;
      MsgBox('"Prezado Cliente"'+#13+'Ocorreu um erro na inclusão do registro com a seguinte mensagem:'+#13+e.Message, MB_OK+MB_ICONERROR);
    end;
  end;

  ModalResult := mrOk;

end;

procedure TfrmCadHorarioAtendimento.dbcHorarioKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;

  if ( Key = VK_RETURN ) then
    Perform(WM_NEXTDLGCTL, 0, 0);

end;

procedure TfrmCadHorarioAtendimento.dbgHorarioAtendimentoCellClick(Column: TColumn);
begin
  inherited;

  if ( dbgHorarioAtendimento.SelectedIndex = 0 ) then
    dbgHorarioAtendimento.SelectedIndex := 1;

end;

procedure TfrmCadHorarioAtendimento.dbgHorarioAtendimentoColEnter(Sender: TObject);
begin
  inherited;

  if ( dbgHorarioAtendimento.SelectedIndex = 0 ) then
    dbgHorarioAtendimento.SelectedIndex := 1;

end;

procedure TfrmCadHorarioAtendimento.dbgHorarioAtendimentoEnter(Sender: TObject);
begin
  inherited;

  dbgHorarioAtendimento.SelectedIndex := 1;

end;

procedure TfrmCadHorarioAtendimento.dbgHorarioAtendimentoKeyDown(
  Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  inherited;

  if ( Key = VK_RETURN ) then
  begin

    if ( dbgHorarioAtendimento.SelectedIndex = 4 ) and ( qryCadPadrao.RecNo = 7 ) then
      Perform(WM_NEXTDLGCTL, 0, 0)
    else if ( dbgHorarioAtendimento.SelectedIndex = 4 ) then
    begin
      qryCadPadrao.Next;
      dbgHorarioAtendimento.SelectedIndex := 1;
    end
    else
      dbgHorarioAtendimento.SelectedIndex := dbgHorarioAtendimento.SelectedIndex + 1;

  end;

end;

procedure TfrmCadHorarioAtendimento.dbgHorarioAtendimentoKeyPress(
  Sender: TObject; var Key: Char);
begin
  inherited;

  if ( not ( Key in ['0'..'9',#8,#58] ) ) then
    Key := #0;

end;

procedure TfrmCadHorarioAtendimento.FormCreate(Sender: TObject);
begin
  inherited;

  cdProfissional         := 0;
  fgIntervaloAtendimento := 0;

end;

procedure TfrmCadHorarioAtendimento.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  //inherited;

end;

procedure TfrmCadHorarioAtendimento.FormShow(Sender: TObject);
begin
  inherited;

  ShowScrollBar(dbgHorarioAtendimento.Handle, SB_VERT, false);
  ShowScrollBar(dbgHorarioAtendimento.Handle, SB_HORZ, false);

  case fgIntervaloAtendimento of
    5 : cbbIntervalo.ItemIndex := 0;
    10: cbbIntervalo.ItemIndex := 1;
    15: cbbIntervalo.ItemIndex := 2;
    30: cbbIntervalo.ItemIndex := 3;
    45: cbbIntervalo.ItemIndex := 4;
    60: cbbIntervalo.ItemIndex := 5;
    else cbbIntervalo.ItemIndex := 2;
  end;

end;

procedure TfrmCadHorarioAtendimento.qryCadPadraoAfterInsert(DataSet: TDataSet);
begin
  inherited;

  if ( qryCadPadrao.FieldByName('DS_DIASEMANA').AsString = '' ) then
    qryCadPadrao.Cancel;

end;

procedure TfrmCadHorarioAtendimento.qryCadPadraoAfterOpen(DataSet: TDataSet);
begin
  inherited;

  TField( qryCadPadrao.FieldByName('HR_ENTRADA') ).OnSetText          := dmPrincipal.ValidaHora;
  TField( qryCadPadrao.FieldByName('HR_SAIDAINTERVALO') ).OnSetText   := dmPrincipal.ValidaHora;
  TField( qryCadPadrao.FieldByName('HR_ENTRADAINTERVALO') ).OnSetText := dmPrincipal.ValidaHora;
  TField( qryCadPadrao.FieldByName('HR_SAIDA') ).OnSetText            := dmPrincipal.ValidaHora;

end;

procedure TfrmCadHorarioAtendimento.btnRepetirHorarioClick(Sender: TObject);
var hrEntrada, hrSaidaIntervalo, hrEntradaIntervalo, hrSaida: Variant;
begin
  inherited;

  hrEntrada          := qryCadPadrao.FieldByName('HR_ENTRADA').Value;
  hrSaidaIntervalo   := qryCadPadrao.FieldByName('HR_SAIDAINTERVALO').Value;
  hrEntradaIntervalo := qryCadPadrao.FieldByName('HR_ENTRADAINTERVALO').Value;
  hrSaida            := qryCadPadrao.FieldByName('HR_SAIDA').Value;

  qryCadPadrao.Next;

  if ( qryCadPadrao.Eof ) then
    qryCadPadrao.First;

  qryCadPadrao.Edit;
  qryCadPadrao.FieldByName('HR_ENTRADA').Value          := hrEntrada;
  qryCadPadrao.FieldByName('HR_SAIDAINTERVALO').Value   := hrSaidaIntervalo;
  qryCadPadrao.FieldByName('HR_ENTRADAINTERVALO').Value := hrEntradaIntervalo;
  qryCadPadrao.FieldByName('HR_SAIDA').Value            := hrSaida;
  qryCadPadrao.Post;

end;

end.
