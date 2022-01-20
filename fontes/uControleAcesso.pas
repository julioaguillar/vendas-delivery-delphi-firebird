unit uControleAcesso;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Buttons, ComCtrls, Mask, DBCtrls, DB, StrUtils,
  IBODataset, Menus, uPadrao, AonProcessBar, ImgList, IB_Components;

type
  TPermissao = Record
    DS_CAPTION  : String;
    DS_NAME     : String;
    FG_PERMITIR : Boolean;
  end;

  PPermissao = ^TPermissao;

type
  TMenuSincronizar = Record
    Principal: String;
    Sincro   : String;
    Mutua    : Boolean;
  end;

type
  TfrmControleAcesso = class(TfrmPadrao)
    gpbUsuario: TGroupBox;
    grpbxNome: TGroupBox;
    GroupBox1: TGroupBox;
    trvPermissao: TTreeView;
    btnMarcarTodosMenu: TBitBtn;
    btnDesmarcarTodosMenu: TBitBtn;
    gpbBotoes: TGroupBox;
    btnAlterar: TBitBtn;
    btnConsultar: TBitBtn;
    btnConfirmar: TBitBtn;
    btnCancelar: TBitBtn;
    dbeUsuario: TDBEdit;
    dbeUsuarioNome: TDBEdit;
    qryUsuario: TIBOQuery;
    dtsUsuario: TDataSource;
    qryConsultaUsuarioPermissao: TIBOQuery;
    ImageList: TImageList;
    qryConsultaPermissao: TIBOQuery;
    trnsCadPadrao: TIB_Transaction;
    qryExecutar: TIBOQuery;
    btnCopiar: TBitBtn;
    qryExecutarCopia: TIBOQuery;
    gpbParametros: TGroupBox;
    dbckAdministrador: TDBCheckBox;
    procedure btnConsultarClick(Sender: TObject);
    procedure qryUsuarioAfterOpen(DataSet: TDataSet);
    procedure trvPermissaoClick(Sender: TObject);
    procedure trvPermissaoEnter(Sender: TObject);
    procedure trvPermissaoExit(Sender: TObject);
    procedure trvPermissaoKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure btnAlterarClick(Sender: TObject);
    procedure btnConfirmarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnMarcarTodosMenuClick(Sender: TObject);
    procedure btnDesmarcarTodosMenuClick(Sender: TObject);
    procedure btnCopiarClick(Sender: TObject);
  private
    { Private declarations }

    FMenuPrincipal: TMainMenu;

    procedure AddMenuPermissao(Node: TTreeNode; Menu: TMenuItem; qryConsulta: TIBOQuery);
    procedure ListarMenu;
    procedure SetMenuPrincipal(const Value: TMainMenu);
    procedure ToggleTreeViewCheckBoxes(Node: TTreeNode; cUnChecked, cChecked: Integer);
    procedure MenuPermissaoParent(Node: TTreeNode; StateIndex: Integer);
    procedure MenuPermissao(Node: TTreeNode; StateIndex: Integer);
    procedure prcAtualizarPermissao;

  public
    { Public declarations }

    property MenuPrincipal: TMainMenu read FMenuPrincipal write SetMenuPrincipal;

  end;

var
  frmControleAcesso: TfrmControleAcesso;

const
  cFlatUnCheck = 1;
  cFlatChecked = 2;

implementation

uses uConsUsuario, udmPrincipal, uFuncoes, uConstantes;

{$R *.dfm}

procedure TfrmControleAcesso.SetMenuPrincipal(const Value: TMainMenu);
begin

  FMenuPrincipal := Value;

end;

procedure TfrmControleAcesso.MenuPermissao(Node: TTreeNode; StateIndex: Integer);
var NodeP : TTreeNode;
begin

  NodeP := Node.getFirstChild;

  repeat

    // Ignoramos o estado do item "Manutencao de Usuarios" para o ADMINISTRADOR, pois ele nao podera ser desabilitado para este usuario
    if (
         (
           ( PPermissao(Node.Data).DS_NAME = 'mnCadastro' ) or
           ( PPermissao(Node.Data).DS_NAME = 'mniControleAcessoUsuario' ) or
           ( PPermissao(Node.Data).DS_NAME = 'mniCadastroUsuario' )
         ) and
         ( qryUsuario.FieldByName('FG_ADMINISTRADOR').AsString = 'SIM' )
       ) then
      NodeP := Node.GetNextChild( NodeP )
    else
    begin

      NodeP.ImageIndex    := 0;
      NodeP.SelectedIndex := 0;
      NodeP.StateIndex    := StateIndex;
      PPermissao(NodeP.Data).FG_PERMITIR := Node.StateIndex = cFlatChecked;

      if Assigned( NodeP ) then
        if NodeP.HasChildren then
          MenuPermissao(NodeP, NodeP.StateIndex);

      NodeP := Node.GetNextChild( NodeP );

    end;

  until not Assigned( NodeP );

end;

procedure TfrmControleAcesso.MenuPermissaoParent(Node: TTreeNode; StateIndex: Integer);
var NodeP : TTreeNode;
begin

  NodeP := Node.Parent;

  repeat

    NodeP.ImageIndex    := 0;
    NodeP.SelectedIndex := 0;
    NodeP.StateIndex    := StateIndex;

    PPermissao(NodeP.Data).FG_PERMITIR := Node.StateIndex = cFlatChecked;

    NodeP := NodeP.Parent;

  until not Assigned( NodeP );

end;

procedure TfrmControleAcesso.ToggleTreeViewCheckBoxes(Node: TTreeNode; cUnChecked, cChecked: Integer);
begin

  if Assigned( Node ) then
  begin

    if (
         (
           ( PPermissao(Node.Data).DS_NAME = 'mnCadastro' ) or
           ( PPermissao(Node.Data).DS_NAME = 'mniControleAcessoUsuario' ) or
           ( PPermissao(Node.Data).DS_NAME = 'mniCadastroUsuario' )
         ) and
        ( qryUsuario.FieldByName('FG_ADMINISTRADOR').AsString = 'SIM' )
       ) then
    begin
      MsgBox('"Prezado Cliente"'#13'Esta opção não pode ser desmarcada para o Usuário ADMINISTRADOR.', MB_OK OR MB_ICONINFORMATION);
      Exit;
    end;

    if ( Node.StateIndex = cUnChecked ) then
      Node.StateIndex := cChecked
    else if ( Node.StateIndex = cChecked ) then
      Node.StateIndex := cUnChecked;

    PPermissao(Node.Data).FG_PERMITIR := Node.StateIndex = cChecked;

    if ( Node.StateIndex = cChecked ) and ( Assigned(Node.Parent) ) then
      MenuPermissaoParent(Node, Node.StateIndex);

    if ( Node.HasChildren ) then
      MenuPermissao(Node, Node.StateIndex);

  end;

end;

procedure TfrmControleAcesso.trvPermissaoClick(Sender: TObject);
var P: TPoint;
begin
  inherited;

  if ( trvPermissao.ReadOnly ) then
    Exit;

  GetCursorPos( P );

  P := trvPermissao.ScreenToClient( P );

  if ( htOnStateIcon in trvPermissao.GetHitTestInfoAt(P.X, P.Y) ) then
    ToggleTreeViewCheckBoxes( trvPermissao.Selected, cFlatUnCheck, cFlatChecked );

end;

procedure TfrmControleAcesso.trvPermissaoEnter(Sender: TObject);
begin
  inherited;

  KeyPreview := False;
  trvPermissao.Color := $00DDFFFF;

end;

procedure TfrmControleAcesso.trvPermissaoExit(Sender: TObject);
begin
  inherited;

  KeyPreview := True;
  trvPermissao.Color := clWindow;

end;

procedure TfrmControleAcesso.trvPermissaoKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  inherited;

  if ( trvPermissao.ReadOnly ) then
    Exit;

  if ( Key = VK_SPACE ) and Assigned( trvPermissao.Selected ) then
    ToggleTreeViewCheckBoxes( trvPermissao.Selected, cFlatUnCheck, cFlatChecked );

end;

procedure TfrmControleAcesso.btnAlterarClick(Sender: TObject);
begin
  inherited;

  if ( not qryUsuario.Active ) or ( qryUsuario.IsEmpty ) then
  begin
    MsgBox('"Prezado Cliente"'#13'Selecione um Usuário', MB_OK+MB_ICONINFORMATION);
    Exit;
  end;

  btnAlterar.Enabled   := False;
  btnConsultar.Enabled := False;
  btnConfirmar.Enabled := True;
  btnCancelar.Enabled  := True;
  btnCopiar.Enabled    := False;

  btnMarcarTodosMenu.Enabled    := True;
  btnDesmarcarTodosMenu.Enabled := True;

  trvPermissao.ReadOnly := False;

end;

procedure TfrmControleAcesso.btnCancelarClick(Sender: TObject);
begin
  inherited;

  btnAlterar.Enabled   := True;
  btnConsultar.Enabled := True;
  btnConfirmar.Enabled := False;
  btnCancelar.Enabled  := False;
  btnCopiar.Enabled    := True;

  btnMarcarTodosMenu.Enabled    := False;
  btnDesmarcarTodosMenu.Enabled := False;

  trvPermissao.ReadOnly := True;

end;

procedure TfrmControleAcesso.btnConfirmarClick(Sender: TObject);
begin
  inherited;

  try

    if ( trnsCadPadrao.InTransaction ) then
      trnsCadPadrao.Rollback;

    trnsCadPadrao.StartTransaction;

    prcAtualizarPermissao;

    trnsCadPadrao.Commit;

  except
    on e: Exception do
    begin
      trnsCadPadrao.Rollback;
      MsgBox('"Prezado Cliente"'+#13+'Ocorreu um erro na gravação com a seguinte mensagem:'+#13+e.Message, MB_OK+MB_ICONINFORMATION);
    end;
  end;

  btnAlterar.Enabled   := True;
  btnConsultar.Enabled := True;
  btnConfirmar.Enabled := False;
  btnCancelar.Enabled  := False;
  btnCopiar.Enabled    := True;

  btnMarcarTodosMenu.Enabled    := False;
  btnDesmarcarTodosMenu.Enabled := False;

  trvPermissao.ReadOnly := True;

end;

procedure TfrmControleAcesso.btnConsultarClick(Sender: TObject);
begin
  inherited;

  frmConsUsuario := TfrmConsUsuario.Create(Self);
  frmConsUsuario.ShowModal;

  if ( frmConsUsuario.ModalResult = mrOk ) and ( not ( frmConsUsuario.qryConsulta.IsEmpty ) ) then
  begin

    qryUsuario.Close;
    qryUsuario.ParamByName('DS_USUARIO').AsString := frmConsUsuario.qryConsulta.FieldByName('DS_USUARIO').AsString;
    qryUsuario.Open;

  end;

  FreeAndNil(frmConsUsuario);

end;

procedure TfrmControleAcesso.btnDesmarcarTodosMenuClick(Sender: TObject);
var index: Integer;
begin
  inherited;

  for index := 0 to trvPermissao.Items.Count-1 do
  begin

    if (qryUsuario.FieldByName('FG_ADMINISTRADOR').AsString = 'SIM') and
       (
         ( PPermissao(trvPermissao.Items[index].Data).DS_NAME = 'mnCadastro' ) or
         ( PPermissao(trvPermissao.Items[index].Data).DS_NAME = 'mniControleAcessoUsuario' ) or
         ( PPermissao(trvPermissao.Items[index].Data).DS_NAME = 'mniCadastroUsuario' )
       ) then
      Continue;

    trvPermissao.Items[index].StateIndex := cFlatUnCheck;
    PPermissao(trvPermissao.Items[index].Data).FG_PERMITIR := False;

  end;

  trvPermissao.Selected := trvPermissao.Items[0];

end;

procedure TfrmControleAcesso.btnCopiarClick(Sender: TObject);
begin
  inherited;

  if ( not qryUsuario.Active ) or ( qryUsuario.IsEmpty ) then
  begin
    MsgBox('"Prezado Cliente"'+#13+'Selecione um Usuário', MB_OK+MB_ICONINFORMATION);
    Exit;
  end;

  frmConsUsuario := TfrmConsUsuario.Create(Self);
  frmConsUsuario.ShowModal;

  if ( frmConsUsuario.ModalResult = mrOk ) and ( not ( frmConsUsuario.qryConsulta.IsEmpty ) ) then
  begin

    if ( MsgBox('"Prezado Cliente"'+#13+'Confirma a copia das permissões do Usuário "'+frmConsUsuario.qryConsulta.FieldByName('DS_USUARIO').AsString+'" para o Usuário "'+qryUsuario.ParamByName('DS_USUARIO').AsString+'"?', MB_YESNO+MB_ICONQUESTION) = IDYes ) then
    begin

      try

        if ( trnsCadPadrao.InTransaction ) then
          trnsCadPadrao.Rollback;

        trnsCadPadrao.StartTransaction;

        qryExecutarCopia.Close;
        qryExecutarCopia.ParamByName('DS_USUARIOORIGEM').AsString  := frmConsUsuario.qryConsulta.FieldByName('DS_USUARIO').AsString;
        qryExecutarCopia.ParamByName('DS_USUARIODESTINO').AsString := qryUsuario.ParamByName('DS_USUARIO').AsString;
        qryExecutarCopia.ExecSQL;

        trnsCadPadrao.Commit;

        qryUsuario.Close;
        qryUsuario.ParamByName('DS_USUARIO').AsString := frmConsUsuario.qryConsulta.FieldByName('DS_USUARIO').AsString;
        qryUsuario.Open;

      except
        on e: Exception do
        begin
          trnsCadPadrao.Rollback;
          MsgBox('"Prezado Cliente"'+#13+'Ocorreu um erro na copia com a seguinte mensagem:'+#13+e.Message, MB_OK+MB_ICONINFORMATION);
        end;
      end;

    end;

  end;

  FreeAndNil(frmConsUsuario);

end;

procedure TfrmControleAcesso.btnMarcarTodosMenuClick(Sender: TObject);
var index: Integer;
begin
  inherited;

  for index := 0 to trvPermissao.Items.Count-1 do
  begin
    trvPermissao.Items[index].StateIndex := cFlatChecked;
    PPermissao(trvPermissao.Items[index].Data).FG_PERMITIR := True;
  end;

  trvPermissao.Selected := trvPermissao.Items[0];

end;

procedure TfrmControleAcesso.AddMenuPermissao(Node: TTreeNode; Menu: TMenuItem; qryConsulta: TIBOQuery);
var i        : Integer;
    NodeP    : TTreeNode;
    Permissao: PPermissao;
    menuPai  : TMenuItem;
begin

  for i := 0 to Menu.Count - 1 do
  begin

    menuPai := Menu;
    while ( menuPai.Parent.name <> '' ) do
      menuPai := menuPai.Parent;

    if ( Trim( StringReplace( Menu.Items[i].Caption, '&', '', [ rfReplaceAll ] ) ) <> '-' ) and
       ( UpperCase( RightStr(Menu.Items[i].Name, 12) ) <> 'DESABILITADO' ) then
    begin

      New( Permissao );
      Permissao.DS_CAPTION  := StringReplace( Menu.Items[i].Caption, '&', '', [ rfReplaceAll ] );
      Permissao.DS_NAME     := Menu.Items[i].Name;
      Permissao.FG_PERMITIR := not ( qryConsulta.Locate('DS_MENU', Permissao.DS_NAME, []) );

      NodeP := trvPermissao.Items.AddChild(Node, Permissao.DS_CAPTION);
      NodeP.Data          := Permissao;
      NodeP.ImageIndex    := 0;
      NodeP.SelectedIndex := 0;
      NodeP.StateIndex    := 1;

      if Permissao.FG_PERMITIR then
        NodeP.StateIndex := 2
      else
        NodeP.StateIndex := 1;

      AddMenuPermissao(NodeP, Menu.Items[i], qryConsulta);

    end;

  end;

end;

procedure TfrmControleAcesso.ListarMenu;
var i        : Integer;
    Node     : TTreeNode;
    Permissao: PPermissao;
    Wait     : TProcessamento;
    menuPai  : TMenuItem;
begin

  Wait := nil;
  Wait.CreateProcess;

  try

    Wait.NumProcess := 1;
    Wait.Caption := 'Carregando Permissões do Usuário ' + qryUsuario.FieldByName('DS_USUARIO').AsString + '...';
    Wait.SetMinMax(0, Pred( FMenuPrincipal.Items.Count ));
    Wait.StartProcess;

    qryConsultaUsuarioPermissao.Close;
    qryConsultaUsuarioPermissao.ParamByName('DS_USUARIO').AsString := qryUsuario.FieldByName('DS_USUARIO').AsString;
    qryConsultaUsuarioPermissao.Open;

    trvPermissao.Items.BeginUpdate;

    try

      trvPermissao.Items.Clear;

      for i := 0 to FMenuPrincipal.Items.Count - 1 do
      begin

        Wait.PositionBar := Wait.PositionBar + 1;

        menuPai := FMenuPrincipal.Items[i];
        while ( menuPai.Parent.name <> '' ) do
          menuPai := menuPai.Parent;

        if ( Trim( StringReplace( FMenuPrincipal.Items[i].Caption, '&', '', [ rfReplaceAll ] ) ) <> '-' ) then
        begin

          New( Permissao );
          Permissao.DS_CAPTION  := StringReplace( FMenuPrincipal.Items[i].Caption, '&', '', [ rfReplaceAll ] );
          Permissao.DS_NAME     := FMenuPrincipal.Items[i].Name;
          Permissao.FG_PERMITIR := not ( qryConsultaUsuarioPermissao.Locate('DS_MENU', Permissao.DS_NAME, []) );

          Node := trvPermissao.Items.Add(nil, Permissao.DS_CAPTION);
          Node.Data          := Permissao;
          Node.ImageIndex    := 0;
          Node.SelectedIndex := 0;
          Node.StateIndex    := 1;

          if Permissao.FG_PERMITIR then
            Node.StateIndex := 2
          else
            Node.StateIndex := 1;

          AddMenuPermissao(Node, FMenuPrincipal.Items[i], qryConsultaUsuarioPermissao);
          Application.ProcessMessages;

        end;

      end;

    finally
      trvPermissao.Items.EndUpdate;
      trvPermissao.Items[0].Selected := True;
    end;

  finally
    Wait.CloseProcess;
  end;

end;

procedure TfrmControleAcesso.qryUsuarioAfterOpen(DataSet: TDataSet);
begin
  inherited;

  if ( not ( qryUsuario.IsEmpty ) ) then
    ListarMenu;

end;

procedure TfrmControleAcesso.prcAtualizarPermissao;
var i   : Word;
    Wait: TProcessamento;
const
  SQL_INCLUIR = 'INSERT INTO CAD_USUARIOPERMISSAO                                          '+#13+
                '  ( CD_PERMISSAO, DS_USUARIO, DS_MENU, FG_PERMITIR )                      '+#13+
                'VALUES                                                                    '+#13+
                '  ( GEN_ID(GEN_ID_USUARIOPERMISSAO, 1), :DS_USUARIO, :DS_MENU, :FG_PERMITIR)';

  SQL_ALTERAR = 'UPDATE CAD_USUARIOPERMISSAO     '+#13+
                '  SET FG_PERMITIR = :FG_PERMITIR'+#13+
                'WHERE DS_USUARIO  = :DS_USUARIO '+#13+
                '      AND DS_MENU = :DS_MENU    ';

begin

  Wait := nil;
  Wait.CreateProcess;

  try

    Wait.NumProcess := 1;
    Wait.Caption := 'Salvando Permissões do Usuário...';
    Wait.SetMinMax(0, Pred( trvPermissao.Items.Count ) );
    Wait.StartProcess;

    try

      for i := 0 to trvPermissao.Items.Count - 1 do
      begin

        Wait.PositionBar := Wait.PositionBar + 1;

        // Menu Diversos nao sera desabilitado para o ADMINISTRADOR pois sempre havera o item "Manutencao de Usuario" habilitado para o ADMINISTRADOR
        if (
             (
               ( PPermissao( trvPermissao.Items[i].Data ).DS_NAME = 'mnCadastro') or
               ( PPermissao( trvPermissao.Items[i].Data ).DS_NAME = 'mniControleAcessoUsuario') or
               ( PPermissao( trvPermissao.Items[i].Data ).DS_NAME = 'mniCadastroUsuario')
             ) and
             ( qryUsuario.FieldByName('FG_ADMINISTRADOR').AsString = 'SIM' )
           ) then
          Continue;

        qryConsultaPermissao.Close;
        qryConsultaPermissao.ParamByName('DS_USUARIO').AsString := qryUsuario.FieldByName('DS_USUARIO').AsString;
        qryConsultaPermissao.ParamByName('DS_MENU').AsString    := PPermissao( trvPermissao.Items[i].Data ).DS_NAME;
        qryConsultaPermissao.Open;

        qryExecutar.Close;

        if ( qryConsultaPermissao.IsEmpty ) then
          qryExecutar.SQL.Text := SQL_INCLUIR
        else
          qryExecutar.SQL.Text := SQL_ALTERAR;

        qryExecutar.ParamByName('DS_USUARIO').AsString := qryUsuario.FieldByName('DS_USUARIO').AsString;
        qryExecutar.ParamByName('DS_MENU').AsString    := PPermissao( trvPermissao.Items[i].Data ).DS_NAME;

        if PPermissao( trvPermissao.Items[i].Data ).FG_PERMITIR then
          qryExecutar.ParamByName('FG_PERMITIR').AsInteger := 1
        else
          qryExecutar.ParamByName('FG_PERMITIR').AsInteger := 0;

        qryExecutar.ExecSQL;

        Application.ProcessMessages;
      end;

    except
      on e: Exception do
        raise Exception.Create( e.Message );
    end;

  finally
    Wait.CloseProcess;
  end;

end;

end.
