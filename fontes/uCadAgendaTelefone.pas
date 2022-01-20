unit uCadAgendaTelefone;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uPadrao, DB, Grids, ValEdit, StdCtrls, Buttons, DBCtrls, Mask;

type
  TfrmCadAgendaTelefone = class(TfrmPadrao)
    gpbBotoes: TGroupBox;
    btnConfirmar: TBitBtn;
    btnCancelar: TBitBtn;
    CamposObrigatorios: TValueListEditor;
    dtsAgendaTelefone: TDataSource;
    gpbContato: TGroupBox;
    dbeContato: TDBEdit;
    gpbResidencial: TGroupBox;
    dbeResidencial: TDBEdit;
    gpbComercial: TGroupBox;
    dbeComercial: TDBEdit;
    gpbCelular: TGroupBox;
    dbeCelular: TDBEdit;
    gpbEmail: TGroupBox;
    dbeEmail: TDBEdit;
    gpbAnotacoes: TGroupBox;
    dbmAnotacoes: TDBMemo;
    procedure btnConfirmarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadAgendaTelefone: TfrmCadAgendaTelefone;

implementation

uses uAgendaTelefone, uFuncoes;

{$R *.dfm}

procedure TfrmCadAgendaTelefone.btnCancelarClick(Sender: TObject);
begin
  inherited;

  ModalResult := mrCancel;

end;

procedure TfrmCadAgendaTelefone.btnConfirmarClick(Sender: TObject);
begin
  inherited;

  if ( not ( ValidaCampoObrigatorio(Self, CamposObrigatorios) ) ) then
    Abort;

  try

    if ( frmAgendaTelefone.qryAgendaTelefone.State = dsInsert ) then
      frmAgendaTelefone.qryAgendaTelefone.FieldByName('ID_AGENDATELEFONE').AsInteger := 0;

    frmAgendaTelefone.qryAgendaTelefone.Post;
    frmAgendaTelefone.trnsPadrao.Commit;

  except
    on e: exception do
    begin
      frmAgendaTelefone.trnsPadrao.Rollback;
      MsgBox('"Prezado Cliente"'#13'Ocorreu um erro na gravação do registro com a seguinte mensagem:'+#13#13+e.Message, MB_OK+MB_ICONERROR);
    end;
  end;

  ModalResult := mrOk;

end;

procedure TfrmCadAgendaTelefone.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;

  if ( frmAgendaTelefone.qryAgendaTelefone.State in [dsInsert,dsEdit] ) then
    frmAgendaTelefone.qryAgendaTelefone.Cancel;

end;

end.
