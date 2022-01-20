unit uCadEnderecoCEP;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uCadPadrao, Menus, DB, IBODataset, IB_Components, Grids, ValEdit,
  StdCtrls, Buttons, DBGrids, Mask, DBCtrls, AonProcessBar, ExtCtrls;

type
  TfrmCadEnderecoCEP = class(TfrmCadPadrao)
    gpbTipoLogradouro: TGroupBox;
    gpbComplemento: TGroupBox;
    gpbBairro: TGroupBox;
    gpbEndereco: TGroupBox;
    dbgEndereco: TDBGrid;
    dbeTipoLogradouro: TDBEdit;
    dbeComplemento: TDBEdit;
    dbeBairro: TDBEdit;
    qryConsUF: TIBOQuery;
    dtsConsUF: TDataSource;
    gpbLogradouro: TGroupBox;
    dbeLogradouro: TDBEdit;
    gpbCEP: TGroupBox;
    dbeCEP: TDBEdit;
    gpbUF: TGroupBox;
    dbcUF: TDBLookupComboBox;
    gpbCidade: TGroupBox;
    dbeCidade: TDBEdit;
    qryConsID: TIBOQuery;
    qryConsCEP: TIBOQuery;
    pnlAguarde: TPanel;
    Label1: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure btnIncluirClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure btnConfirmarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure dbcUFEnter(Sender: TObject);
    procedure dbeCEPKeyPress(Sender: TObject; var Key: Char);
    procedure dbeCEPExit(Sender: TObject);
    procedure btnConsultarClick(Sender: TObject);
  private
    { Private declarations }

    function RetornaCodigo: Integer;
    procedure BloquearControles(Value: Boolean);

  public
    { Public declarations }
  end;

var
  frmCadEnderecoCEP: TfrmCadEnderecoCEP;

implementation

uses udmPrincipal, uFuncoes, uConstantes;

{$R *.dfm}

procedure TfrmCadEnderecoCEP.BloquearControles(Value: Boolean);
begin

  pnlAguarde.Visible := Value;

  frmCadEnderecoCEP.Enabled := not ( Value );
  gpbCEP.Enabled            := not ( Value );
  gpbUF.Enabled             := not ( Value );
  gpbCidade.Enabled         := not ( Value );
  gpbTipoLogradouro.Enabled := not ( Value );
  gpbLogradouro.Enabled     := not ( Value );
  gpbComplemento.Enabled    := not ( Value );
  gpbBairro.Enabled         := not ( Value );
  gpbEndereco.Enabled       := not ( Value );
  gpbBotoes.Enabled         := not ( Value );

  pnlAguarde.Refresh;
  frmCadEnderecoCEP.Refresh;

  Application.ProcessMessages;

end;

function TfrmCadEnderecoCEP.RetornaCodigo(): Integer;
begin

  qryConsID.Close;
  qryConsID.Open;

  if ( qryConsID.IsEmpty ) then
    Result := 1
  else
    Result := qryConsID.FieldByName('ID').AsInteger + 1;

end;

procedure TfrmCadEnderecoCEP.btnAlterarClick(Sender: TObject);
begin
  inherited;

  if ( not ( qryCadPadrao.IsEmpty ) ) then
  begin

    BloquearControles(True);
    qryCadPadrao.Edit;
    BloquearControles(False);

    dbeCEP.Enabled    := False;
    dbcUF.Enabled     := False;
    dbeCidade.Enabled := False;

    dbeTipoLogradouro.SetFocus;

  end;

end;

procedure TfrmCadEnderecoCEP.btnCancelarClick(Sender: TObject);
begin
  inherited;

  qryCadPadrao.Cancel;

end;

procedure TfrmCadEnderecoCEP.btnConfirmarClick(Sender: TObject);
begin
  inherited;

  try

    BloquearControles(True);

    if ( qryCadPadrao.State = dsInsert ) then
      qryCadPadrao.FieldByName('CD_ENDERECO').AsInteger := RetornaCodigo;

    qryCadPadrao.Post;
    trnsCadPadrao.Commit;

    qryCadPadrao.Refresh;

    BloquearControles(False);

  except
    on e: Exception do
    begin
      trnsCadPadrao.Rollback;
      MsgBox('"Prezado Cliente"'#13'Ocorreu um erro na inclusão do registro com a seguinte mensagem:'+#13+e.Message, MB_OK+MB_ICONERROR);
    end;
  end;

end;

procedure TfrmCadEnderecoCEP.btnConsultarClick(Sender: TObject);
var cep  : String;
    achou: Boolean;
begin
  inherited;

  cep := InputBox(NOME_EMPRESA, 'Informe o CEP para pesquisa', '');

  if ( cep <> '' ) then
  begin

    BloquearControles(True);
    achou := qryCadPadrao.Locate('DS_CEP', cep, []);
    BloquearControles(False);

    if ( achou ) then
      dbgEndereco.SetFocus
    else
      MsgBox('"Prezado Cliente"'#13'CEP não encontrado', MB_OK+MB_ICONINFORMATION);

  end;

end;

procedure TfrmCadEnderecoCEP.btnExcluirClick(Sender: TObject);
begin
  inherited;

  if ( not ( qryCadPadrao.IsEmpty ) ) and
     ( MsgBox('"Prezado Cliente"'#13'Confirma a exclusão do registro', MB_YESNO+MB_ICONQUESTION) = IDYES ) then
  begin

    try

      BloquearControles(True);

      qryCadPadrao.Delete;
      trnsCadPadrao.Commit;

      BloquearControles(False);

    except
      on e: Exception do
      begin
        trnsCadPadrao.Rollback;
        MsgBox('"Prezado Cliente"'#13'Ocorreu um erro na exclusão do registro com a seguinte mensagem:'+#13+e.Message, MB_OK+MB_ICONERROR);
      end;
    end;

  end;

end;

procedure TfrmCadEnderecoCEP.btnIncluirClick(Sender: TObject);
begin
  inherited;

  BloquearControles(True);
  qryCadPadrao.Append;
  BloquearControles(False);

  dbeCEP.SetFocus;

end;

procedure TfrmCadEnderecoCEP.dbcUFEnter(Sender: TObject);
begin
  inherited;

  dbcUF.DropDown;

end;

procedure TfrmCadEnderecoCEP.dbeCEPExit(Sender: TObject);
begin
  inherited;

  if ( dbeCEP.Text <> '' ) then
  begin

    qryConsCEP.Close;
    qryConsCEP.ParamByName('DS_CEP').AsString := dbeCEP.Text;
    qryConsCEP.Open;

    if ( not ( qryConsCEP.IsEmpty ) ) then
    begin
      MsgBox('"Prezado Cliente"'#13'CEP já cadastrado', MB_OK+MB_ICONINFORMATION);
      dbeCEP.SetFocus;
      Abort;
    end;

  end;

end;

procedure TfrmCadEnderecoCEP.dbeCEPKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;

  if ( not ( Key in ['0'..'9', #8] ) ) then
    Key := #0;

end;

procedure TfrmCadEnderecoCEP.FormCreate(Sender: TObject);
begin
  inherited;

  qryCadPadrao.Close;
  qryCadPadrao.Open;

  qryConsUF.Close;
  qryConsUF.Open;

end;

end.
