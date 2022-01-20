unit uCadUsuario;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uCadPadrao, StdCtrls, Buttons, DBCtrls, Menus, DB, IBODataset,
  IB_Components, Grids, ValEdit, DBGrids, Mask, ComCtrls, DBClient;

type
  TfrmCadUsuario = class(TfrmCadPadrao)
    gpbUsuarios: TGroupBox;
    dbgUsuarios: TDBGrid;
    qryConsGrupo: TIBOQuery;
    dstConsGrupo: TDataSource;
    qryConsUsuario: TIBOQuery;
    qryConsAdministrador: TIBOQuery;
    gpbUsuario: TGroupBox;
    dbeUsuario: TDBEdit;
    gpbNome: TGroupBox;
    dbeNome: TDBEdit;
    gpbSenha: TGroupBox;
    edtSenha: TEdit;
    gpbConfirmarSenha: TGroupBox;
    edtConfirmarSenha: TEdit;
    gpbParametros: TGroupBox;
    dbckAdministrador: TDBCheckBox;
    dbckUsuarioBloqueado: TDBCheckBox;
    procedure FormCreate(Sender: TObject);
    procedure btnIncluirClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure btnConfirmarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure qryCadPadraoAfterScroll(DataSet: TDataSet);
    procedure edtConfirmarSenhaExit(Sender: TObject);
    procedure dblGrupoKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormActivate(Sender: TObject);
    procedure edtSenhaEnter(Sender: TObject);
    procedure edtSenhaExit(Sender: TObject);
    procedure dbgUsuariosTitleClick(Column: TColumn);
  private
    dsSenha: String;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadUsuario: TfrmCadUsuario;

implementation

uses udmPrincipal, uFuncoes, uConstantes;

{$R *.dfm}

procedure TfrmCadUsuario.btnAlterarClick(Sender: TObject);
begin
  inherited;

  if ( not ( qryCadPadrao.IsEmpty ) ) then
  begin

    qryCadPadrao.Edit;
    dbeUsuario.Enabled := false;
    dbeNome.SetFocus;

  end;

end;

procedure TfrmCadUsuario.btnCancelarClick(Sender: TObject);
begin
  inherited;

  qryCadPadrao.Cancel;

  qryCadPadraoAfterScroll(qryCadPadrao);

end;

procedure TfrmCadUsuario.btnConfirmarClick(Sender: TObject);
begin
  inherited;

  if ( qryCadPadrao.State = dsEdit ) and ( not ( dbckAdministrador.Checked ) ) then
  begin

    qryConsAdministrador.Close;
    qryConsAdministrador.ParamByName('DS_USUARIO').AsString := dbeUsuario.Text;
    qryConsAdministrador.Open;

    if ( qryConsAdministrador.IsEmpty ) then
    begin
      MsgBox('"Prezado Cliente"'#13'É necessário ter pelo menos um usuário administrador cadastrado no sistema', MB_OK+MB_ICONINFORMATION);
      Abort;
    end;

  end;

  if ( qryCadPadrao.State = dsInsert ) then
  begin

    qryConsUsuario.Close;
    qryConsUsuario.ParamByName('DS_USUARIO').AsString := qryCadPadrao.FieldByName('DS_USUARIO').AsString;
    qryConsUsuario.Open;

    if ( not ( qryConsUsuario.IsEmpty ) ) then
    begin
      MsgBox('"Prezado Cliente"'#13'Usuário já cadastrado!', MB_OK+MB_ICONINFORMATION);
      dbeUsuario.SetFocus;
      Abort;
    end;

  end;

  try

    qryCadPadrao.FieldByName('DS_SENHA').AsString := fncCriptografia(Criptografar, edtSenha.Text);
    qryCadPadrao.Post;

    trnsCadPadrao.Commit;

    qryCadPadrao.Refresh;
    qryCadPadraoAfterScroll(qryCadPadrao);

  except
    on e: Exception do
    begin
      trnsCadPadrao.Rollback;
      MsgBox('"Prezado Cliente"'#13'Ocorreu um erro na inclusão do registro com a seguinte mensagem:'+#13+e.Message, MB_OK+MB_ICONERROR);
    end;
  end;

end;

procedure TfrmCadUsuario.btnExcluirClick(Sender: TObject);
begin
  inherited;

  if ( dbckAdministrador.Checked ) then
  begin

    qryConsAdministrador.Close;
    qryConsAdministrador.ParamByName('DS_USUARIO').AsString := dbeUsuario.Text;
    qryConsAdministrador.Open;

    if ( qryConsAdministrador.IsEmpty ) then
    begin
      MsgBox('"Prezado Cliente"'#13'É necessário ter pelo menos um usuário administrador cadastrado no sistema', MB_OK+MB_ICONINFORMATION);
      Abort;
    end;

  end;

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

procedure TfrmCadUsuario.btnIncluirClick(Sender: TObject);
begin
  inherited;

  qryCadPadrao.Append;
  qryCadPadrao.FieldByName('FG_ADMINISTRADOR').AsString := 'NAO';
  qryCadPadrao.FieldByName('FG_BLOQUEADO').AsString     := 'NAO';

  edtSenha.Clear;
  edtConfirmarSenha.Clear;
  dbeUsuario.SetFocus;

end;

procedure TfrmCadUsuario.dbgUsuariosTitleClick(Column: TColumn);
begin
  inherited;

  OrdenaGrid(dbgUsuarios, Column, 'CAD_USUARIO');

end;

procedure TfrmCadUsuario.dblGrupoKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  inherited;

  if ( Key = VK_BACK ) then
    qryCadPadrao.FieldByName('ID_GRUPOUSUARIO').Value := null;

end;

procedure TfrmCadUsuario.edtSenhaEnter(Sender: TObject);
begin
  inherited;

  dsSenha := edtSenha.Text;

end;

procedure TfrmCadUsuario.edtSenhaExit(Sender: TObject);
begin
  inherited;

  if ( edtSenha.Text <> dsSenha ) then
    edtConfirmarSenha.Clear;

end;

procedure TfrmCadUsuario.edtConfirmarSenhaExit(Sender: TObject);
begin
  inherited;

  if ( ( edtConfirmarSenha.Text <> '' ) and ( edtSenha.Text <> edtConfirmarSenha.Text ) ) then
  begin
    MsgBox('"Prezado Cliente"'#13'Senha não confere', MB_OK+MB_ICONINFORMATION);
    edtConfirmarSenha.SetFocus;
    Abort;
  end;

end;

procedure TfrmCadUsuario.FormActivate(Sender: TObject);
begin
  inherited;

  if ( GBL_USUARIO.FG_ADMINISTRADOR <> 'SIM' ) then
  begin

    MsgBox('"Prezado Cliente'#13'Somente o usuário administrador pode alterar o cadastro', MB_OK);

    btnIncluir.Enabled := false;
    btnExcluir.Enabled := false;
    btnAlterar.Enabled := false;

  end;

end;

procedure TfrmCadUsuario.FormCreate(Sender: TObject);
begin
  inherited;

  qryConsGrupo.Close;
  qryConsGrupo.Open;

  qryCadPadrao.Close;
  qryCadPadrao.Open;

end;

procedure TfrmCadUsuario.qryCadPadraoAfterScroll(DataSet: TDataSet);
begin
  inherited;

  if ( qryCadPadrao.FieldByName('DS_SENHA').AsString <> '' ) then
  begin
    edtSenha.Text          := fncCriptografia(Descriptografar, qryCadPadrao.FieldByName('DS_SENHA').AsString);
    edtConfirmarSenha.Text := fncCriptografia(Descriptografar, qryCadPadrao.FieldByName('DS_SENHA').AsString);
  end
  else
  begin
    edtSenha.Clear;
    edtConfirmarSenha.Clear;
  end;

end;

end.
