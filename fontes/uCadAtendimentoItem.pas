unit uCadAtendimentoItem;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uPadrao, StdCtrls, Buttons, Mask, DBCtrls, ComCtrls, ImgList,
  ToolWin, ExtCtrls, RichEdit, DB, IBODataset, IB_Components, Grids, ValEdit;

type
  TfrmCadAtendimentoItem = class(TfrmPadrao)
    gpbCliente: TGroupBox;
    gpbDia: TGroupBox;
    gpbHora: TGroupBox;
    gpbProfissional: TGroupBox;
    edtNomeCliente: TEdit;
    gpbAnotacoes: TGroupBox;
    gpbRodape: TGroupBox;
    btnConfirmar: TBitBtn;
    btnCancelar: TBitBtn;
    lblProfissional: TLabel;
    edtCodCliente: TEdit;
    edtData: TDateTimePicker;
    gpbStatus: TGroupBox;
    cbbStatus: TComboBox;
    edtHora: TMaskEdit;
    lblDescProfissional: TLabel;
    qryCadAtendimento: TIBOQuery;
    trnsPadrao: TIBOTransaction;
    CamposObrigatorios: TValueListEditor;
    dtsCadConsulta: TDataSource;
    qryConsCliente: TIBOQuery;
    dbmAnotacoes: TDBMemo;
    btnConsultarCliente: TSpeedButton;
    qryCadAtendimentoCD_PROFISSIONAL: TIntegerField;
    qryCadAtendimentoFG_STATUS: TStringField;
    qryCadAtendimentoDS_ANOTACAO: TMemoField;
    gpbTelefoneResidencial: TGroupBox;
    dbeTelefoneResidencial: TDBEdit;
    gpbCelular: TGroupBox;
    dbeCelular: TDBEdit;
    qryCadAtendimentoNR_TELEFONERESIDENCIAL: TStringField;
    qryCadAtendimentoNR_CELULAR: TStringField;
    qryCadAtendimentoID_ATENDIMENTO: TIntegerField;
    qryCadAtendimentoCD_CLIENTE: TIntegerField;
    qryCadAtendimentoDT_ATENDIMENTO: TDateField;
    qryCadAtendimentoHR_ATENDIMENTO: TTimeField;
    btnCadastroCliente: TSpeedButton;
    procedure FormCreate(Sender: TObject);
    procedure cbbStatusEnter(Sender: TObject);
    procedure edtCodClienteKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure edtCodClienteExit(Sender: TObject);
    procedure btnConfirmarClick(Sender: TObject);
    procedure edtHoraExit(Sender: TObject);
    procedure dbmAnotacoesEnter(Sender: TObject);
    procedure dbmAnotacoesExit(Sender: TObject);
    procedure btnConsultarClienteClick(Sender: TObject);
    procedure edtCodClienteEnter(Sender: TObject);
    procedure edtDataEnter(Sender: TObject);
    procedure dbmAnotacoesKeyPress(Sender: TObject; var Key: Char);
    procedure btnCadastroClienteClick(Sender: TObject);
  private
    { Private declarations }

    codigoCliente, dataConsulta: String;

  public
    { Public declarations }

    idConsulta, cdProfissional: Integer;

  end;

var
  frmCadAtendimentoItem: TfrmCadAtendimentoItem;
  controle: Boolean = true;

implementation

uses udmPrincipal, uFuncoes, uConstantes, uConsCliente, uCadCliente;

{$R *.dfm}

procedure TfrmCadAtendimentoItem.btnCadastroClienteClick(Sender: TObject);
begin
  inherited;

  frmCadCliente := TfrmCadCliente.Create(Self);
  frmCadCliente.ShowModal;
  FreeAndNil(frmCadCliente);

end;

procedure TfrmCadAtendimentoItem.btnConfirmarClick(Sender: TObject);
begin
  inherited;

  if ( not ( ValidaCampoObrigatorio(Self, CamposObrigatorios) ) ) then
    Abort;

  try

    qryCadAtendimento.FieldByName('ID_ATENDIMENTO').AsInteger  := idConsulta;
    qryCadAtendimento.FieldByName('CD_PROFISSIONAL').AsInteger := cdProfissional;
    qryCadAtendimento.FieldByName('CD_CLIENTE').AsInteger      := StrToInt(edtCodCliente.Text);
    qryCadAtendimento.FieldByName('DT_ATENDIMENTO').AsDateTime := edtData.Date;
    qryCadAtendimento.FieldByName('HR_ATENDIMENTO').AsDateTime := StrToTime(edtHora.Text);

    if ( cbbStatus.Text = 'Agendado' ) then
      qryCadAtendimento.FieldByName('FG_STATUS').AsString := 'A'
    else if ( cbbStatus.Text = 'Confirmado' ) then
      qryCadAtendimento.FieldByName('FG_STATUS').AsString := 'O'
    else if ( cbbStatus.Text = 'Faltou' ) then
      qryCadAtendimento.FieldByName('FG_STATUS').AsString := 'F'
    else if ( cbbStatus.Text = 'Desmarcou' ) then
      qryCadAtendimento.FieldByName('FG_STATUS').AsString := 'D'
    else if ( cbbStatus.Text = 'Concluido' ) then
      qryCadAtendimento.FieldByName('FG_STATUS').AsString := 'C';

    qryCadAtendimento.FieldByName('NR_TELEFONERESIDENCIAL').Clear;
    qryCadAtendimento.FieldByName('NR_CELULAR').Clear;
    qryCadAtendimento.Post;

    trnsPadrao.Commit;

  except

    on e: Exception do
    begin

      trnsPadrao.Rollback;

      if ( Pos('violation of PRIMARY or UNIQUE KEY', e.Message) > 0 ) then
        MsgBox('"Prezado Cliente"'#13'Já existe um registro no mesmo dia/hora', MB_OK+MB_ICONERROR)
      else
        MsgBox('"Prezado Cliente"'#13'Ocorreu um erro na inclusão do registro com a seguinte mensagem:'+#13+#13+e.Message, MB_OK+MB_ICONERROR);

    end;

  end;

  ModalResult := mrOk;

end;

procedure TfrmCadAtendimentoItem.btnConsultarClienteClick(Sender: TObject);
begin
  inherited;

  frmConsCliente := TfrmConsCliente.Create(Self);
  frmConsCliente.ShowModal;

  if ( frmConsCliente.ModalResult = mrOk ) then
  begin

    ActiveControl := edtCodCliente;

    edtCodCliente.Text  := frmConsCliente.qryConsCliente.FieldByName('CD_CLIENTE').AsString;
    edtNomeCliente.Text := frmConsCliente.qryConsCliente.FieldByName('DS_NOME').AsString;

  end;

  FreeAndNil(frmConsCliente);

end;

procedure TfrmCadAtendimentoItem.cbbStatusEnter(Sender: TObject);
begin
  inherited;

  cbbStatus.DroppedDown;

end;

procedure TfrmCadAtendimentoItem.dbmAnotacoesEnter(Sender: TObject);
begin
  inherited;

  KeyPreview := false;

end;

procedure TfrmCadAtendimentoItem.dbmAnotacoesExit(Sender: TObject);
begin
  inherited;

  KeyPreview := true;

end;

procedure TfrmCadAtendimentoItem.dbmAnotacoesKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;

  if ( Key = #13 ) and ( Trim(dbmAnotacoes.Lines.Text) = '' ) then
  begin
    Key := #0;
    Perform(Wm_NextDlgCtl,0,0);
  end
  else if ( Key = #27 ) then
  begin
    Key := #0;
    Perform(Wm_NextDlgCtl,1,0);
  end;

end;

procedure TfrmCadAtendimentoItem.edtCodClienteEnter(Sender: TObject);
begin
  inherited;

  codigoCliente := edtCodCliente.Text;

end;

procedure TfrmCadAtendimentoItem.edtCodClienteExit(Sender: TObject);
begin
  inherited;

  if ( edtCodCliente.Text <> '' ) then
  begin

    qryConsCliente.Close;
    qryConsCliente.ParamByName('CD_CLIENTE').AsInteger := StrToInt(edtCodCliente.Text);
    qryConsCliente.Open;

    if ( qryConsCliente.IsEmpty ) then
    begin

      MsgBox('"Prezado Cliente"'#13'Cliente não cadastrado', MB_OK+MB_ICONINFORMATION);
      edtCodCliente.SetFocus;
      Abort;

    end;

    edtNomeCliente.Text := qryConsCliente.FieldByName('DS_NOME').AsString;

  end
  else
    edtNomeCliente.Clear;

end;

procedure TfrmCadAtendimentoItem.edtCodClienteKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;

  if ( Key = VK_F9 ) then
    btnConsultarClienteClick(btnConsultarCliente);

end;

procedure TfrmCadAtendimentoItem.edtDataEnter(Sender: TObject);
begin
  inherited;

  dataConsulta := FormatDateTime('dd/mm/yyyy', edtData.Date);

end;

procedure TfrmCadAtendimentoItem.edtHoraExit(Sender: TObject);
begin
  inherited;

  if ( edtHora.Text <> '  :  ' ) then
  begin

    try
      edtHora.Text := FormatDateTime('hh:mm', StrToTime(edtHora.Text));
    except
      MsgBox('"Prezado Cliente'#13'Hora inválida', MB_OK+MB_ICONINFORMATION);
      edtHora.SetFocus;
      Abort;
    end;

  end;

end;

procedure TfrmCadAtendimentoItem.FormCreate(Sender: TObject);
begin
  inherited;

  idConsulta     := 0;
  cdProfissional := 0;

end;

end.
