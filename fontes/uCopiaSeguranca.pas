unit uCopiaSeguranca;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uPadrao, StdCtrls, Buttons, ComCtrls, IBOServices, IB_Components,
  FileCtrl, Grids, ValEdit;

type
  TfrmCopiaSeguranca = class(TfrmPadrao)
    pgcCopiaSeguranca: TPageControl;
    tbsCopiar: TTabSheet;
    tbsRestaurar: TTabSheet;
    gpbDestinoCopia: TGroupBox;
    gpbLocalCopia: TGroupBox;
    btnIniciarRestauracao: TBitBtn;
    btnIniciarCopia: TBitBtn;
    btnDestinoCopia: TSpeedButton;
    edtDestinoCopia: TEdit;
    edtLocalCopia: TEdit;
    btnLocalCopia: TSpeedButton;
    gpbConfiguracaoBanco: TGroupBox;
    lblServidor: TLabel;
    lblCamino: TLabel;
    lblDescServidor: TLabel;
    lblDescCaminho: TLabel;
    OpenDialogRestaurar: TOpenDialog;
    IBOBackupService: TIBOBackupService;
    IBORestoreService: TIBORestoreService;
    ProgressBarCopia: TProgressBar;
    lblProgressoCopia: TLabel;
    ProgressBarRestaurar: TProgressBar;
    lblProgressoRestaurar: TLabel;
    CamposObrigatorios: TValueListEditor;
    lblPorta: TLabel;
    lblDescPorta: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure btnDestinoCopiaClick(Sender: TObject);
    procedure btnLocalCopiaClick(Sender: TObject);
    procedure btnIniciarCopiaClick(Sender: TObject);
    procedure btnIniciarRestauracaoClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    procedure DesconectarBanco(Value: Boolean);
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCopiaSeguranca: TfrmCopiaSeguranca;

implementation

uses uFuncoes, udmPrincipal, uPrincipal, uConstantes;

{$R *.dfm}

procedure TfrmCopiaSeguranca.btnDestinoCopiaClick(Sender: TObject);
var path: String;
begin
  inherited;

  if FileCtrl.SelectDirectory(path, [sdAllowCreate, sdPerformCreate, sdPrompt], 1000) then
    edtDestinoCopia.Text := path;

end;

procedure TfrmCopiaSeguranca.btnIniciarCopiaClick(Sender: TObject);
var arquivoBck, arquivoFdb, portaFdb: String;
    erro: Boolean;
begin
  inherited;

  CamposObrigatorios.Strings.Clear;
  CamposObrigatorios.Strings.Add('edtDestinoCopia=O destino da cópia deve ser informado');

  if ( not ( ValidaCampoObrigatorio(Self, CamposObrigatorios) ) ) then
    Abort;

  ProgressBarCopia.Max := 920;
  erro                 := false;

  if ( edtDestinoCopia.Text <> '' ) then
  begin

    arquivoBck := edtDestinoCopia.Text + '\'+BACKUP_EMPRESA_BCK;
    arquivoFdb := lblDescCaminho.Caption + '\' + BANCO_EMPRESA;
    portaFdb   := lblDescPorta.Caption;

    IBOBackupService.ServerName := lblDescServidor.Caption + '/' + portaFdb;
    IBOBackupService.Params.Add('user_name=SYSDBA');
    IBOBackupService.Params.Add('password=masterkey');

    try

      try

        IBOBackupService.Attach;

        IBOBackupService.BackupFile.Add( arquivoBck );
        IBOBackupService.DatabaseName := arquivoFdb;

        IBOBackupService.Active := true;
        IBOBackupService.ServiceStart;

        while ( not IBOBackupService.Eof ) do
        begin

          lblProgressoCopia.Caption := IBOBackupService.GetNextLine;
          ProgressBarCopia.Position := ProgressBarCopia.Position + 1;

          Application.ProcessMessages;

        end;

      except

        on e: exception do
        begin
          erro := true;
          MsgBox('"Prezado Cliente"'#13'Ocorreu um erro na geração do Backup com a seguinte mensagem:'+#13+e.Message, MB_OK+MB_ICONERROR);
        end;

      end;

    finally

      ProgressBarCopia.Position := 0;

      if ( IBOBackupService.Active ) then
        IBOBackupService.Active := false;

      if ( erro ) and ( FileExists(arquivoBck) ) then
        DeleteFile(arquivoBck);

    end;

  end;

  if ( not ( erro ) ) then
    MsgBox('"Prezado Cliente"'+#13+
           'Copia de Segurança gerada com sucesso.'#13#13'Salve o arquivo '+arquivoBck+' em um lugar seguro.'+
           ' É recomendado que seja salvo em mais de um lugar, caso precise restaurar o banco esse é o seu único recurso.', MB_OK+MB_ICONINFORMATION);

end;

procedure TfrmCopiaSeguranca.DesconectarBanco(Value: Boolean);
var janela: THandle;
begin

  if ( Value ) then
  begin

    // Verifica formulários que utilizão a conexão

    if ( frmPrincipal.timerHora.Enabled ) then
      frmPrincipal.timerHora.Enabled := false;

    janela := null;
    janela := FindWindow(nil, PWideChar(NOME_EMPRESA+' - Mensagens'));

    if ( ( janela <> Null ) or ( janela > 0 ) ) then
      PostMessage(janela, WM_CLOSE, 0, 0);

    janela := null;
    janela := FindWindow(nil, PWideChar(NOME_EMPRESA+' - Agenda'));

    if ( ( janela <> Null ) or ( janela > 0 ) ) then
      PostMessage(janela, WM_CLOSE, 0, 0);

    // *************************************************

    dmPrincipal.IB_Connection.Disconnect;

  end;

end;

procedure TfrmCopiaSeguranca.btnIniciarRestauracaoClick(Sender: TObject);
var arquivoBck, arquivoFdb, portaFdb: String;
    erro  : Boolean;
begin
  inherited;

  CamposObrigatorios.Strings.Clear;
  CamposObrigatorios.Strings.Add('edtLocalCopia=O arquivo de backup deve ser informado');

  if ( not ( ValidaCampoObrigatorio(Self, CamposObrigatorios) ) ) then
    Abort;

  if ( MsgBox('"Prezado Cliente"'#13'Para realizar a restauração é necessário que todos os usuários finalizem o sistema.'#13'Deseja continuar?', MB_YESNO+MB_ICONQUESTION) = IDYES ) then
  begin

    DesconectarBanco(true);

    ProgressBarRestaurar.Max := 920;
    erro                     := false;

    if ( edtLocalCopia.Text <> '' ) then
    begin

      arquivoBck := edtLocalCopia.Text;
      arquivoFdb := lblDescCaminho.Caption + '\' + BANCO_EMPRESA;
      portaFdb   := lblDescPorta.Caption;

      IBORestoreService.ServerName := lblDescServidor.Caption + '/' + portaFdb;
      IBORestoreService.Params.Add('user_name=SYSDBA');
      IBORestoreService.Params.Add('password=masterkey');

      try

        try

          IBORestoreService.Attach;

          IBORestoreService.BackupFile.Add( arquivoBck );
          IBORestoreService.DatabaseName.Add( arquivoFdb );

          IBORestoreService.Active := true;
          IBORestoreService.ServiceStart;

          while ( not IBORestoreService.Eof ) do
          begin

            lblProgressoRestaurar.Caption := IBORestoreService.GetNextLine;
            ProgressBarRestaurar.Position := ProgressBarRestaurar.Position + 1;

            Application.ProcessMessages;

          end;

        except

          on e: exception do
          begin
            erro := true;
            MsgBox('"Prezado Cliente"'#13'Ocorreu um erro na restauração do Backup com a seguinte mensagem:'+#13+e.Message, MB_OK+MB_ICONERROR);
          end;

        end;

      finally

        ProgressBarRestaurar.Position := 0;

        if ( IBORestoreService.Active ) then
          IBORestoreService.Active := false;

        if ( erro ) and ( not ( dmPrincipal.IB_Connection.Connected ) ) then
          dmPrincipal.IB_Connection.Connect;

      end;

    end;

    if ( not ( erro ) ) then
    begin

      MsgBox('"Prezado Cliente"'#13'Backup restaurado com sucesso.'#13'Para que a restauração tenha efeito o sistema será finalizado', MB_OK+MB_ICONINFORMATION);

      try

        frmPrincipal.qryUsuarioOnline.Close;
        frmPrincipal.qryUsuarioOnline.ParamByName('DS_USUARIO').AsString := GBL_USUARIO.DS_USUARIO;
        frmPrincipal.qryUsuarioOnline.ExecSQL;

        frmPrincipal.trnsUsuario.Commit;

      except
      end;

      Application.Terminate;

    end;

  end;

end;

procedure TfrmCopiaSeguranca.btnLocalCopiaClick(Sender: TObject);
begin
  inherited;

  if ( OpenDialogRestaurar.Execute(frmCopiaSeguranca.Handle) ) then
    edtLocalCopia.Text := OpenDialogRestaurar.FileName;

end;

procedure TfrmCopiaSeguranca.FormCreate(Sender: TObject);
var servidor, caminho, porta: String;
begin
  inherited;

  pgcCopiaSeguranca.ActivePage := tbsCopiar;

  servidor := GetIniValue('Conexao', 'Servidor');
  caminho  := GetIniValue('Conexao', 'CaminhoBanco');
  porta    := GetIniValue('Conexao', 'Porta');

  lblDescServidor.Caption := servidor;
  lblDescCaminho.Caption  := caminho;
  lblDescPorta.Caption    := porta;

  OpenDialogRestaurar.InitialDir := caminho;

end;

procedure TfrmCopiaSeguranca.FormShow(Sender: TObject);
begin
  inherited;

  OpenDialogRestaurar.FileName := BACKUP_EMPRESA_BCK;
  OpenDialogRestaurar.Filter   := BACKUP_EMPRESA_BCK+'|'+BACKUP_EMPRESA_BCK;

end;

end.
