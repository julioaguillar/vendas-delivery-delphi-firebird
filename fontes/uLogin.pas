unit uLogin;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uPadrao, StdCtrls, Buttons, DB, IBODataset, DBCtrls, pngimage,
  ExtCtrls, IB_Components;

type
  TfrmLogin = class(TfrmPadrao)
    gpbBotoes: TGroupBox;
    btnCorrigir: TBitBtn;
    btnRetornar: TBitBtn;
    imgLogin: TImage;
    gpbUsuario: TGroupBox;
    gpbSenha: TGroupBox;
    edtSenha: TEdit;
    dblUsuario: TDBLookupComboBox;
    qryUsuario: TIBOQuery;
    dtsUsuario: TDataSource;
    trnsUsuario: TIB_Transaction;
    qryUsuarioOnline: TIBOQuery;
    qryConsUsuarioOnLine: TIBOQuery;
    procedure btnCorrigirClick(Sender: TObject);
    procedure btnRetornarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmLogin: TfrmLogin;

implementation

uses udmPrincipal, uFuncoes, uConstantes;

{$R *.dfm}

procedure TfrmLogin.btnCorrigirClick(Sender: TObject);
begin
  inherited;

  if ( edtSenha.Text <> fncCriptografia(Descriptografar, qryUsuario.FieldByName('DS_SENHA').AsString) ) then
  begin
    MsgBox('"Prezado Cliente"'#13'Senha inválida!', MB_OK+MB_ICONINFORMATION);
    edtSenha.SetFocus;
    Abort;
  end;

  if ( qryUsuario.FieldByName('FG_BLOQUEADO').AsString = 'SIM' ) then
  begin
    MsgBox('"Prezado Cliente"'#13'Usuário bloqueado.'#13'Entre em contato com o administrador do sistema', MB_OK+MB_ICONINFORMATION);
    edtSenha.SetFocus;
    Abort;
  end;

  qryConsUsuarioOnLine.Close;
  qryConsUsuarioOnLine.ParamByName('DS_USUARIO').AsString := qryUsuario.FieldByName('DS_USUARIO').AsString;
  qryConsUsuarioOnLine.Open;

  if ( not ( qryConsUsuarioOnLine.IsEmpty ) ) and
     ( MsgBox('"Prezado Cliente"'#13'Usuário já logado no sistema'#13'Deseja continuar?', MB_YESNO+MB_ICONQUESTION) = IDNO ) then
    Abort;

  GBL_USUARIO.DS_USUARIO       := qryUsuario.FieldByName('DS_USUARIO').AsString;
  GBL_USUARIO.DS_NOMEUSUARIO   := qryUsuario.FieldByName('DS_NOMEUSUARIO').AsString;
  GBL_USUARIO.DS_SENHA         := qryUsuario.FieldByName('DS_SENHA').AsString;
  GBL_USUARIO.FG_ADMINISTRADOR := qryUsuario.FieldByName('FG_ADMINISTRADOR').AsString;
  GBL_USUARIO.FG_BLOQUEADO     := qryUsuario.FieldByName('FG_BLOQUEADO').AsString;
  GBL_USUARIO.ID_GRUPOUSUARIO  := qryUsuario.FieldByName('ID_GRUPOUSUARIO').AsInteger;

  try

    qryUsuarioOnline.Close;
    qryUsuarioOnline.ParamByName('DS_USUARIO').AsString := GBL_USUARIO.DS_USUARIO;
    qryUsuarioOnline.ExecSQL;

    trnsUsuario.Commit;

  except
  end;

  ModalResult := mrOk;

end;

procedure TfrmLogin.btnRetornarClick(Sender: TObject);
begin
  inherited;

  ModalResult := mrRetry;

end;

procedure TfrmLogin.FormCreate(Sender: TObject);
begin
  inherited;

  qryUsuario.Close;
  qryUsuario.Open;

  if ( qryUsuario.RecordCount = 1 ) then
  begin

    dblUsuario.KeyValue := qryUsuario.FieldByName('DS_NOMEUSUARIO').Value;
    dblUsuario.Enabled  := false;
    ActiveControl       := edtSenha;

  end;

end;

end.
