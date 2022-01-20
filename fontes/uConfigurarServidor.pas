unit uConfigurarServidor;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uPadrao, StdCtrls, Buttons, IB_Components, DB, IBODataset, FileCtrl;

type
  TfrmConfigurarServidor = class(TfrmPadrao)
    gpbBotoes: TGroupBox;
    btnConfirmar: TBitBtn;
    btnCancelar: TBitBtn;
    gpbEstacaoServidora: TGroupBox;
    gpbPorta: TGroupBox;
    gpbCaminho: TGroupBox;
    edtServidor: TEdit;
    cbbCaminho: TComboBox;
    IB_Connection: TIB_Connection;
    btnDiretorio: TSpeedButton;
    qryUsuarioOnline: TIBOQuery;
    trnsUsuario: TIB_Transaction;
    gpbServidor: TGroupBox;
    cbbServidor: TComboBox;
    edtPorta: TComboBox;
    procedure FormCreate(Sender: TObject);
    procedure cbbCaminhoEnter(Sender: TObject);
    procedure btnConfirmarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnDiretorioClick(Sender: TObject);
    procedure cbbServidorChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmConfigurarServidor: TfrmConfigurarServidor;

implementation

uses uFuncoes, udmPrincipal, uConstantes;

{$R *.dfm}

procedure TfrmConfigurarServidor.btnConfirmarClick(Sender: TObject);
begin
  inherited;

  try

    IB_Connection.Database := edtServidor.Text + '/' + edtPorta.Text + ':' + cbbCaminho.Text + '/' + BANCO_EMPRESA;

    IB_Connection.Username := 'sysdba';
    IB_Connection.Password := 'masterkey';
    IB_Connection.CharSet  := 'WIN1252';
    IB_Connection.Connect;

    SetIniValue('Conexao', 'Servidor', edtServidor.Text);
    SetIniValue('Conexao', 'Porta'   , edtPorta.Text);
    SetIniValue('Conexao', 'CaminhoBanco' , cbbCaminho.Text);

    MsgBox('"Prezado Cliente"'#13'Para que as configurações tenhan efeito o sistema será encerado', MB_OK+MB_ICONINFORMATION);

    try

      if ( GBL_USUARIO.DS_USUARIO <> '' ) then
      begin

        qryUsuarioOnline.Close;
        qryUsuarioOnline.ParamByName('DS_USUARIO').AsString := GBL_USUARIO.DS_USUARIO;
        qryUsuarioOnline.ExecSQL;

        trnsUsuario.Commit;

      end;

    except
    end;

    Application.Terminate;

  except
    on e: Exception do
    begin
      MsgBox('"Prezado Cliente"'+#13+
             'Não foi possível estabelecer conexão com o Banco de Dados.'+#13+
             'Verifique as configurações informadas e tente novamente.'+#13#13+e.Message, MB_OK+MB_ICONERROR);
    end;
  end;

end;

procedure TfrmConfigurarServidor.btnCancelarClick(Sender: TObject);
begin
  inherited;

  Close;

end;

procedure TfrmConfigurarServidor.cbbCaminhoEnter(Sender: TObject);
begin
  inherited;

  cbbCaminho.DroppedDown := true;

end;

procedure TfrmConfigurarServidor.cbbServidorChange(Sender: TObject);
begin
  inherited;

  edtServidor.Enabled := cbbServidor.Text = 'REMOTO';

  if ( cbbServidor.Text = 'LOCAL' ) then
    edtServidor.Text := '127.0.0.1';

end;

procedure TfrmConfigurarServidor.FormCreate(Sender: TObject);
var servidor, porta, caminho: String;
begin
  inherited;

  cbbCaminho.Items.Clear;
  cbbCaminho.Items.Add('C:\Arquivos de Programas\'+NOME_EMPRESA+'\'+NOME_SISTEMA+'\FDB');
  cbbCaminho.Items.Add('C:\Program Files\'+NOME_EMPRESA+'\'+NOME_SISTEMA+'\FDB');
  cbbCaminho.Items.Add('C:\Arquivos de Programas (x86)\'+NOME_EMPRESA+'\'+NOME_SISTEMA+'\FDB');
  cbbCaminho.Items.Add('C:\Program Files (x86)\'+NOME_EMPRESA+'\'+NOME_SISTEMA+'\FDB');

  servidor := GetIniValue('Conexao', 'Servidor');
  porta    := GetIniValue('Conexao', 'Porta');
  caminho  := GetIniValue('Conexao', 'CaminhoBanco');

  if ( servidor <> '' ) then
    edtServidor.Text := servidor;

  if ( porta <> '' ) then
    edtPorta.Text := porta;

  if ( caminho <> '' ) then
    cbbCaminho.Text := caminho;

  if ( servidor = '127.0.0.1' ) then
    cbbServidor.ItemIndex := cbbServidor.Items.IndexOf('LOCAL')
  else
    cbbServidor.ItemIndex := cbbServidor.Items.IndexOf('REMOTO');

  cbbServidorChange(cbbServidor);

end;

procedure TfrmConfigurarServidor.btnDiretorioClick(Sender: TObject);
const SELDIRHELP = 1000;
var diretorio: String;
begin
  inherited;

  diretorio := 'C:\';

  if FileCtrl.SelectDirectory(diretorio, [sdAllowCreate, sdPerformCreate, sdPrompt], SELDIRHELP) then
    cbbCaminho.Text := diretorio;

end;

end.
