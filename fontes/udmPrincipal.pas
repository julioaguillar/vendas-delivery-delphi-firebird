unit udmPrincipal;

interface

uses
  Windows, SysUtils, Classes, IB_Components, Forms, DB, IBODataset, IB_Process,
  IB_Script, IBOServices, IB_Session, IBOConnectionInfo, Graphics, DBClient,
  frxClass, frxDBSet, frxBarcode, DelphiZXingQRCode;

type
  TdmPrincipal = class(TDataModule)
    IB_Connection: TIB_Connection;
    IB_Transaction: TIB_Transaction;
    qryConsVersaoBanco: TIBOQuery;
    ibsAtualizaBancoDados: TIB_Script;
    qryConsSerial: TIBOQuery;
    qryStatusSerial: TIBOQuery;
    qryNumProfissional: TIBOQuery;
    qryLog: TIBOQuery;
    IB_ConnectionInfo: TIB_ConnectionInfo;
    iboConfigService: TIBOConfigService;
    IBOBackupService: TIBOBackupService;
    IBORestoreService: TIBORestoreService;
    qryConsCEP: TIBOQuery;
    qryConsMunicipio: TIBOQuery;
    cdsDadosCupom: TClientDataSet;
    cdsDadosCupomFant: TStringField;
    cdsDadosCupomNome: TStringField;
    cdsDadosCupomEndereco: TStringField;
    cdsDadosCupomCNPJ: TStringField;
    cdsDadosCupomIEIM: TStringField;
    cdsDadosCupomExtrato: TStringField;
    cdsDadosCupomDescCupom: TStringField;
    cdsDadosCupomCPFConsumidor: TStringField;
    cdsDadosCupomSubTotal: TStringField;
    cdsDadosCupomDesconto: TStringField;
    cdsDadosCupomAcrescimo: TStringField;
    cdsDadosCupomValorTotal: TStringField;
    cdsDadosCupomTroco: TStringField;
    cdsDadosCupomDestinatario: TStringField;
    cdsDadosCupomObservacao: TBlobField;
    cdsDadosCupomNumeroSAT: TStringField;
    cdsDadosCupomDataHora: TStringField;
    cdsDadosCupomQRCode: TBlobField;
    cdsItensCupom: TClientDataSet;
    cdsItensCupomItem: TIntegerField;
    cdsItensCupomCodItem: TStringField;
    cdsItensCupomDescItem: TStringField;
    cdsItensCupomQuantidade: TStringField;
    cdsItensCupomDescQtde: TStringField;
    cdsItensCupomValorUnitario: TStringField;
    cdsItensCupomValorTotal: TStringField;
    cdsItensCupomDesconto: TStringField;
    cdsItensCupomLiquidoDesc: TStringField;
    cdsItensCupomAcrescimo: TStringField;
    cdsItensCupomLiquidoAcres: TStringField;
    cdsPagamentos: TClientDataSet;
    cdsPagamentosDescricao: TStringField;
    cdsPagamentosValor: TStringField;
    frxDBPagamentos: TfrxDBDataset;
    frxDBDadosCupom: TfrxDBDataset;
    frxDBItensCupom: TfrxDBDataset;
    frxCupomFiscal: TfrxReport;
    qryConsVenda: TIBOQuery;
    qryConsVendaItens: TIBOQuery;
    frxBarCodeObject: TfrxBarCodeObject;
    qryConsTotal: TIBOQuery;
    qryUsuarioAuditoria: TIBOQuery;
    trnsUsuarioAuditoria: TIB_Transaction;
    cdsDadosCupomObservacaoDelivery: TStringField;
    frxCupomFiscalDelivery: TfrxReport;
    cdsDadosCupomNomeConsumidor: TStringField;
    cdsDadosCupomEnderecoConsumidor: TStringField;
    procedure ibsAtualizaBancoDadosStatement(Sender: TIB_Script; var Statement: AnsiString; var SkipIt: Boolean);
    procedure IB_ConnectionError(Sender: TObject; const ERRCODE: Integer; ErrorMessage, ErrorCodes: TStringList;
      const SQLCODE: Integer; SQLMessage, SQL: TStringList; var RaiseException: Boolean);
  private
    { Private declarations }

    msgErro: String;

    function AtualizaBancoDados(VersaoAtual: Integer): Boolean;
    function fncShutdown(ConfigService: TIBOConfigService; Servidor, CaminhoBanco: String): String;
    function fncBringOnline(ConfigService: TIBOConfigService; Servidor, CaminhoBanco: String): String;
    function fncRetornaNumeroConexoes: Integer;
    function fncRealizaBackup: String;
    function fncRealizaRestauracao: String;

  public
    { Public declarations }

    function ConexaoBanco: Boolean;
    function VerificaVersaoBanco: Boolean;
    function VerificaVersaoSistema: Boolean;

    procedure ValidaHora(Sender: TField; const Text: String);
    procedure ValidaData(Sender: TField; const Text: String);

    procedure AddLogUsuario(Origem: String; Descricao: String);
    procedure ImprimirExtrato(IdVenda: Integer; Assinatura: Boolean; ViewPrint: Boolean);
    procedure ImprimirExtratoDelivery(IdVenda: Integer; RetirarLocal: Boolean; Observacao: String; Assinatura: Boolean; ViewPrint: Boolean);

  end;

var
  dmPrincipal: TdmPrincipal;

const
  MSG_ERRO_EXECUTAR_SCRIPT     = ' Erro na atualização, não foi possível corrigir a estrutura do Banco de Dados.';
  MSG_N_SHUTDOWN_BANCO         = ' Erro na atualização, não foi possível desligar o banco de dados para efetuar a atualização.';
  MSG_ERRO_BACKUP              = ' Erro na atualização, não foi possível realizar o backup do Banco de Dados.';
  MSG_ERRO_RESTAURACAO         = ' Erro na atualização, não foi possível realizar a Restauracão do Banco de Dados.';
  MSG_N_BRINGONLINE_BANCO      = ' Erro na atualização, não foi possível iniciar o banco de dados após a correção da estrutura.';
  MSG_SISTEMA_EXECUCAO_OUTROPC = ' Erro na atualização, é necessário corrigir a estrutura do Banco de Dados, e foi detectado que outras estações estão executando o sistema. '+
                                 ' Favor solicite a todos os Usuários para encerrarem o sistema e em seguida tente novamente.';

implementation

uses uFuncoes, uConstantes, uScript, uAtualizacaoBanco;

{$R *.dfm}

function TdmPrincipal.ConexaoBanco: Boolean;
var servidor, porta, caminho: String;
begin

  Result := false;

  servidor := GetIniValue('Conexao', 'Servidor');
  porta    := GetIniValue('Conexao', 'Porta');
  caminho  := GetIniValue('Conexao', 'CaminhoBanco');

  if ( servidor <> '' ) then
  begin

    try

      IB_Connection.Database := AnsiString( Servidor + '/' + Porta + ':' + Caminho + '/' + BANCO_EMPRESA );

      IB_Connection.Username := 'sysdba';
      IB_Connection.Password := 'masterkey';
      IB_Connection.CharSet  := 'WIN1252';
      IB_Connection.Connect;

      Result := true;

    except

      MsgBox('"Prezado Cliente"'+#13+
             'Não foi possível estabelecer conexão com o Banco de Dados.'+#13+
             'A Ferramenta de configuração será executada, informe os dados e tente conectar novamente',
             MB_OK+MB_ICONERROR);

    end;

  end;

end;

procedure TdmPrincipal.ibsAtualizaBancoDadosStatement(Sender: TIB_Script;
  var Statement: AnsiString; var SkipIt: Boolean);
begin

  if ( Assigned(frmAtualizacaoBanco) ) then
    frmAtualizacaoBanco.pgbAtualizando.Position := ibsAtualizaBancoDados.BeginPos;

  msgErro := ibsAtualizaBancoDados.CurrentSQL;

end;

procedure TdmPrincipal.IB_ConnectionError(Sender: TObject;
  const ERRCODE: Integer; ErrorMessage, ErrorCodes: TStringList;
  const SQLCODE: Integer; SQLMessage, SQL: TStringList; var RaiseException: Boolean);
var Aux: String;
    i  : Integer;
begin

  if ( VERIFICAR_CONEXAO ) then
  begin

    for i := 0 to ErrorMessage.Count - 1 do
    begin

      Aux :=  ErrorMessage[i];

      if ( Pos( 'forcibly', Aux ) > 0 ) or ( Pos ( 'network request', Aux ) > 0 ) or  ( Pos ('reading', Aux ) > 0 ) then
      begin

        MsgBox('"Prezado Cliente"'+#13+
               'O Sistema '+NOME_SISTEMA+' será finalizado porque a conexão com o Banco de Dados '+
               'foi perdida. Verifique a conexão de Rede e o Servidor de Banco de Dados. Em'+
               ' seguida inicie o sistema novamente.', MB_OK+MB_ICONERROR);

        Halt;

      end;

      Aux :=  '';

    end;

  end;

end;

procedure TdmPrincipal.ValidaHora(Sender: TField; const Text: String);
var horaFormatada: String;
begin

  try

    if ( ( Text = '  :  :  ' ) or ( Text = '  :  ' ) or ( Text = '' ) ) then
    begin
      Sender.AsString := '';
      Exit;
    end;

    horaFormatada := StringReplace(Text, ' ', '0', [rfReplaceAll]);

    if ( Length(horaFormatada) > 5 ) then
      Sender.Value := FormatDateTime('hh:mm:ss', StrToTime(horaFormatada))
    else
      Sender.Value := FormatDateTime('hh:mm', StrToTime(horaFormatada));

  except
    MsgBox('Hora Inválida, digite novamente !', MB_OK+MB_ICONERROR);
    Sender.FocusControl;
    Abort;
  end;

end;

function TdmPrincipal.fncRetornaNumeroConexoes: Integer;
begin

  Result := 1;

  try

    Result := IB_ConnectionInfo.UserNames.Count;

  except
  end;

end;

function TdmPrincipal.fncRealizaBackup: String;
var servidor, porta, caminho: String;
begin

  if ( Assigned(frmAtualizacaoBanco) ) then
  begin
    frmAtualizacaoBanco.pgbBackup.Position := 1;
    frmAtualizacaoBanco.pgbBackup.Max      := NUM_BACKUP;
  end;

  Result   := '';

  servidor := GetIniValue('Conexao', 'Servidor');
  porta    := GetIniValue('Conexao', 'Porta');
  caminho  := GetIniValue('Conexao', 'CaminhoBanco');

  iboBackupService.ServerName  := servidor + '/' + porta;
  iboBackupService.LoginPrompt := False;
  iboBackupService.Protocol    := cpTCP_IP;

  iboBackupService.Params.Add('user_name=SYSDBA');
  iboBackupService.Params.Add('password=masterkey');

  iboBackupService.Active := True;

  try

    try

      iboBackupService.Verbose := True;

      iboBackupService.DatabaseName := caminho + '/' + BANCO_EMPRESA;
      iboBackupService.BackupFile.Add( caminho + '/' + BACKUP_EMPRESA );

      iboBackupService.ServiceStart;

      while not iboBackupService.Eof do
      begin

        iboBackupService.GetNextLine;

        if ( Assigned(frmAtualizacaoBanco) ) then
          frmAtualizacaoBanco.pgbBackup.Position := frmAtualizacaoBanco.pgbBackup.Position + 1;

        Application.ProcessMessages;

      end;

    except
      Result := MSG_ERRO_BACKUP;
    end;

  finally
    iboBackupService.Active := False;
  end;

  if ( Assigned(frmAtualizacaoBanco) ) then
    frmAtualizacaoBanco.pgbBackup.Position := 1;

end;

function TdmPrincipal.fncRealizaRestauracao: String;
var servidor, porta, caminho: String;
begin

  if ( Assigned(frmAtualizacaoBanco) ) then
  begin
    frmAtualizacaoBanco.pgbRestaurando.Position := 1;
    frmAtualizacaoBanco.pgbRestaurando.Max      := NUM_RESTORE;
  end;

  Result   := '';

  servidor := GetIniValue('Conexao', 'Servidor');
  porta    := GetIniValue('Conexao', 'Porta');
  caminho  := GetIniValue('Conexao', 'CaminhoBanco');

  iboRestoreService.ServerName  := servidor + '/' + porta;
  iboRestoreService.LoginPrompt := False;
  iboRestoreService.Protocol    := cpTCP_IP;

  iboRestoreService.Params.Add('user_name=SYSDBA');
  iboRestoreService.Params.Add('password=masterkey');

  iboRestoreService.Active := True;

  try

    try

      iboRestoreService.Verbose := True;

      iboRestoreService.DatabaseName.Add( caminho + '/' + BANCO_EMPRESA);
      iboRestoreService.BackupFile.Add( caminho + '/' + BACKUP_EMPRESA );

      iboRestoreService.ServiceStart;

      while not iboRestoreService.Eof do
      begin

        iboRestoreService.GetNextLine;

        if ( Assigned(frmAtualizacaoBanco) ) then
          frmAtualizacaoBanco.pgbRestaurando.Position := frmAtualizacaoBanco.pgbRestaurando.Position + 1;

        Application.ProcessMessages;

      end;

    except
      Result := MSG_ERRO_RESTAURACAO;
    end;

  finally
    iboRestoreService.Active := False;
  end;

  if ( Assigned(frmAtualizacaoBanco) ) then
    frmAtualizacaoBanco.pgbRestaurando.Position := 1;

end;

function TdmPrincipal.fncShutdown(ConfigService: TIBOConfigService; Servidor, CaminhoBanco: String): String;
begin

  Result := '';

  try

    ConfigService.ServerName  := Servidor;
    ConfigService.LoginPrompt := False;
    ConfigService.Protocol    := cpTCP_IP;

    ConfigService.Params.Clear;
    ConfigService.Params.Add('user_name=SYSDBA');
    ConfigService.Params.Add('password=masterkey');

    ConfigService.DatabaseName := CaminhoBanco;
    ConfigService.Active := True;

    try

      ConfigService.ShutdownDatabase(Forced, 0);

    finally
      ConfigService.Active := False;
    end;

  except
    Result := MSG_N_SHUTDOWN_BANCO;
  end;

end;

function TdmPrincipal.fncBringOnline(ConfigService: TIBOConfigService; Servidor, CaminhoBanco: String): String;
begin

  try

    ConfigService.ServerName  := Servidor;
    ConfigService.LoginPrompt := False;
    ConfigService.Protocol    := cpTCP_IP;

    ConfigService.Params.Clear;
    ConfigService.Params.Add('user_name=SYSDBA');
    ConfigService.Params.Add('password=masterkey');

    ConfigService.DatabaseName := CaminhoBanco;
    ConfigService.Active := True;

    try

      ConfigService.BringDatabaseOnline;

    finally
      ConfigService.Active := False;
    end;

  except
    Result := MSG_N_BRINGONLINE_BANCO;
  end;

end;

function TdmPrincipal.AtualizaBancoDados(VersaoAtual: Integer): Boolean;
var error: Boolean;
    index, i: Integer;
    servidor, porta, caminho: String;
begin

  msgErro := '';

  error   := false;
  Result  := false;

  if ( fncRetornaNumeroConexoes <= 1 ) then
  begin

    try

      frmAtualizacaoBanco := TfrmAtualizacaoBanco.Create(Application);
      frmAtualizacaoBanco.Show;

      frmAtualizacaoBanco.Refresh;
      Application.ProcessMessages;

      frmAtualizacaoBanco.lblVerificandoConexao.Font.Style := [fsBold];
      frmAtualizacaoBanco.Refresh;
      Application.ProcessMessages;

      servidor := GetIniValue('Conexao', 'Servidor');
      porta    := GetIniValue('Conexao', 'Porta');
      caminho  := GetIniValue('Conexao', 'CaminhoBanco');

      // Shutdown
      msgErro := fncShutdown( iboConfigService, Servidor+'/'+Porta, Caminho+'/'+BANCO_EMPRESA );

      if ( msgErro <> '' ) then
      begin
        MsgBox('"Prezado Cliente"'+#13+msgErro, MB_OK+MB_ICONERROR);
        Exit;
      end;

      dmPrincipal.IB_Connection.Close;
      dmPrincipal.IB_Connection.Database := servidor + '/' + porta + ':' + caminho + '/' + BANCO_EMPRESA;
      dmPrincipal.IB_Connection.Username := 'SYSDBA';
      dmPrincipal.IB_Connection.Password := 'masterkey';
      dmPrincipal.IB_Connection.CharSet  := 'WIN1252';
      dmPrincipal.IB_Connection.Connect;

      frmAtualizacaoBanco.ckbVerificando.Checked := True;
      frmAtualizacaoBanco.lblVerificandoConexao.Font.Style := [];
      frmAtualizacaoBanco.Refresh;
      Application.ProcessMessages;

      frmAtualizacaoBanco.lblCriandoPontoRecuperacao.Font.Style := [fsBold];
      frmAtualizacaoBanco.Refresh;
      Application.ProcessMessages;

      // backup
      msgErro := fncRealizaBackup;

      if ( msgErro <> '' ) then
      begin
        MsgBox('"Prezado Cliente"'+#13+msgErro, MB_OK+MB_ICONERROR);
        Exit;
      end;

      frmAtualizacaoBanco.ckbCriando.Checked := True;
      frmAtualizacaoBanco.lblCriandoPontoRecuperacao.Font.Style := [];
      frmAtualizacaoBanco.Refresh;
      Application.ProcessMessages;

      frmAtualizacaoBanco.lblAtualizando.Font.Style := [fsBold];
      frmAtualizacaoBanco.Refresh;
      Application.ProcessMessages;

      i := 0;

      for index := 0 to Length(ScriptBanco)-1 do
      begin

        if ( ScriptBanco[i].Versao > VersaoAtual ) and ( Trim(ScriptBanco[i].SQL) <> '' ) then
        begin

          try

            frmAtualizacaoBanco.pgbAtualizando.Position := 1;
            frmAtualizacaoBanco.pgbAtualizando.Max := Length( ScriptBanco[i].SQL );

            frmAtualizacaoBanco.Refresh;
            Application.ProcessMessages;

            ibsAtualizaBancoDados.SQL.Clear;
            ibsAtualizaBancoDados.SQL.Add( ScriptBanco[i].SQL );

            ibsAtualizaBancoDados.Prepare;
            ibsAtualizaBancoDados.Execute;

            IB_Transaction.Commit;

          except
            on e: Exception do
            begin
              IB_Transaction.Rollback;
              error := true;
              Break;
            end;
          end;

        end;

        Inc(i);

      end;

      frmAtualizacaoBanco.ckbAtualizando.Checked := True;
      frmAtualizacaoBanco.lblAtualizando.Font.Style := [];
      frmAtualizacaoBanco.Refresh;
      Application.ProcessMessages;

      if ( error ) then
      begin

        frmAtualizacaoBanco.ckbRestaurando.Enabled := True;
        frmAtualizacaoBanco.lblRestaurando.Enabled := True;
        frmAtualizacaoBanco.pgbRestaurando.Enabled := True;

        frmAtualizacaoBanco.lblAtualizando.Font.Style := [fsBold];
        frmAtualizacaoBanco.Refresh;
        Application.ProcessMessages;

        msgErro := fncBringOnline(iboConfigService, Servidor+'/'+Porta, Caminho + '/'+BANCO_EMPRESA);

        if ( msgErro <> '' ) then
          MsgBox('"Prezado Cliente"'+#13+msgErro, MB_OK+MB_ICONERROR);

        // restaura backup
        msgErro := fncRealizaRestauracao;
        Result  := False;

        frmAtualizacaoBanco.ckbRestaurando.Checked := True;
        frmAtualizacaoBanco.lblRestaurando.Font.Style := [];
        frmAtualizacaoBanco.Refresh;
        Application.ProcessMessages;

        MsgBox('"Prezado Cliente"'+#13+MSG_ERRO_EXECUTAR_SCRIPT, MB_OK+MB_ICONERROR);

        Exit;

      end;

      frmAtualizacaoBanco.lblFinalizando.Font.Style := [fsBold];
      frmAtualizacaoBanco.Refresh;
      Application.ProcessMessages;

      msgErro := fncBringOnline(iboConfigService, servidor + '/' + porta, caminho + '/'+BANCO_EMPRESA);

      if ( msgErro <> '' ) then
      begin
        MsgBox('"Prezado Cliente"'+#13+msgErro, MB_OK+MB_ICONERROR);
        Exit;
      end;

      dmPrincipal.IB_Connection.Close;
      dmPrincipal.IB_Connection.Database := servidor + '/' + porta + ':' + caminho + '/' + BANCO_EMPRESA;
      dmPrincipal.IB_Connection.Username := 'SYSDBA';
      dmPrincipal.IB_Connection.Password := 'masterkey';
      dmPrincipal.IB_Connection.CharSet  := 'WIN1252';
      dmPrincipal.IB_Connection.Connect;

      Result := not ( error );

      frmAtualizacaoBanco.ckbFinalizando.Checked := True;
      frmAtualizacaoBanco.lblFinalizando.Font.Style := [];
      frmAtualizacaoBanco.Refresh;
      Application.ProcessMessages;

      if ( error ) then
        MsgBox('"Prezado Cliente"'#13'Ocorreu um erro na atualização do Banco de Dados e o sistema não pode ser inicializado corretamente', MB_OK+MB_ICONERROR);

    finally
      frmAtualizacaoBanco.Close;
      FreeAndNil(frmAtualizacaoBanco);
    end;

  end
  else
    MsgBox('"Prezado Cliente"'+#13+MSG_SISTEMA_EXECUCAO_OUTROPC, MB_OK+MB_ICONERROR);

end;

function TdmPrincipal.VerificaVersaoBanco: Boolean;
begin

  Result := false;

  qryConsVersaoBanco.Close;
  qryConsVersaoBanco.Open;

  if ( qryConsVersaoBanco.FieldByName('NR_VERSAOBANCO').AsInteger < VERSAO_BANCO ) then
    Result := AtualizaBancoDados(qryConsVersaoBanco.FieldByName('NR_VERSAOBANCO').AsInteger)
  else
  begin

    if ( qryConsVersaoBanco.FieldByName('NR_VERSAOBANCO').AsInteger > VERSAO_BANCO ) then
      MsgBox('"Prezado Cliente"'+#13+
             'Seu Sistema encontra-se desatualizado para seu perfeito funcionamento é necessário sua atualização.', MB_OK+MB_ICONINFORMATION);

    result := true;

  end;

end;

function TdmPrincipal.VerificaVersaoSistema: Boolean;
begin

  qryConsVersaoBanco.Close;
  qryConsVersaoBanco.Open;

  Result := VERSAO_BANCO < qryConsVersaoBanco.FieldByName('NR_VERSAOBANCO').AsInteger;

end;

procedure TdmPrincipal.ValidaData(Sender: TField; const Text: String);
begin

  try

    if ( ( Text = '  /  /    ' ) or ( Text = '' ) ) then
    begin
      Sender.AsString := '';
      Exit;
    end;

    Sender.Value := StrToDate(Text);

  except
    MsgBox('Data inválida, digite novamente !', MB_OK + MB_ICONERROR);
    Sender.FocusControl;
    Abort;
  end;

end;

procedure TdmPrincipal.AddLogUsuario(Origem: String; Descricao: String);
begin

  try

    if ( trnsUsuarioAuditoria.InTransaction ) then
      trnsUsuarioAuditoria.Rollback;

    trnsUsuarioAuditoria.StartTransaction;

    qryUsuarioAuditoria.Close;
    qryUsuarioAuditoria.ParamByName('DS_USUARIO').AsString         := GBL_USUARIO.DS_USUARIO;
    qryUsuarioAuditoria.ParamByName('DS_NOMEUSUARIO').AsString     := GBL_USUARIO.DS_NOMEUSUARIO;
    qryUsuarioAuditoria.ParamByName('DT_USUARIOAUDITORIA').AsDate  := Now;
    qryUsuarioAuditoria.ParamByName('HR_USUARIOAUDITORIA').AsTime  := Now;
    qryUsuarioAuditoria.ParamByName('DS_ORIGEMFUNCAO').AsString    := Origem;
    qryUsuarioAuditoria.ParamByName('DS_DESCRICAOFUNCAO').AsString := Descricao;
    qryUsuarioAuditoria.ExecSQL;

    trnsUsuarioAuditoria.Commit;

  except
    trnsUsuarioAuditoria.Rollback;
  end;

end;

procedure TdmPrincipal.ImprimirExtrato(IdVenda: Integer; Assinatura: Boolean; ViewPrint: Boolean);

  var VisualizarImpressao: String;

  procedure GerarQRCode(var Bitmap: TBitmap; Dados: WideString; Encoding: TQRCodeEncoding);
  var QRCode: TDelphiZXingQRCode;
      Row, Column: Integer;
  begin

    QRCode := TDelphiZXingQRCode.Create;

    try

      QRCode.Data      := Dados;
      QRCode.Encoding  := Encoding;
      QRCode.QuietZone := 2;

      Bitmap.SetSize(QRCode.Rows, QRCode.Columns);

      for Row := 0 to QRCode.Rows - 1 do
      begin

        for Column := 0 to QRCode.Columns - 1 do
        begin

          if (QRCode.IsBlack[Row, Column]) then
            Bitmap.Canvas.Pixels[Column, Row] := clBlack
          else
            Bitmap.Canvas.Pixels[Column, Row] := clWhite;

        end;

      end;

    finally
      QRCode.Free;
    end;

  end;

  procedure GerarDadosCupom(QueryDados: TIBOQuery);
  var endereco, qrcode: String;
      Descontos, Acrescimos, TotalProduto: Double;
      Imagem: TBitmap;
  begin

    cdsDadosCupom.Append;
    cdsDadosCupom.FieldByName('Fant').AsString := QueryDados.FieldByName('DS_NOMEFANTASIA').AsString;
    cdsDadosCupom.FieldByName('Nome').AsString := QueryDados.FieldByName('DS_NOMEEMPRESARIAL').AsString;

    endereco := '';

    if (QueryDados.FieldByName('DS_LOGRADOURO').AsString <> '') then
      endereco := QueryDados.FieldByName('DS_LOGRADOURO').AsString;
    if (QueryDados.FieldByName('NR_NUMERO').AsInteger > 0) then
      endereco := endereco + ' ' + IntToStr(QueryDados.FieldByName('NR_NUMERO').AsInteger);
    if (QueryDados.FieldByName('DS_COMPLEMENTO').AsString <> '') then
      endereco := endereco + ' ' + QueryDados.FieldByName('DS_COMPLEMENTO').AsString;
    if (QueryDados.FieldByName('DS_BAIRRO').AsString <> '') then
      endereco := endereco + ' ' + QueryDados.FieldByName('DS_BAIRRO').AsString;
    if (QueryDados.FieldByName('DS_MUNICIPIO').AsString <> '') then
      endereco := endereco + ' ' + QueryDados.FieldByName('DS_MUNICIPIO').AsString;
    if (QueryDados.FieldByName('NR_CEP').AsString <> '') then
      endereco := endereco + ' ' + QueryDados.FieldByName('NR_CEP').AsString;

    cdsDadosCupom.FieldByName('Endereco').AsString := endereco;

    if ( QueryDados.FieldByName('FG_TIPODOCUMENTO').AsString = 'CPF' ) then
      cdsDadosCupom.FieldByName('CNPJ').AsString := 'CPF:' + QueryDados.FieldByName('NR_CNPJCPF').AsString
    else
      cdsDadosCupom.FieldByName('CNPJ').AsString := 'CNPJ:' + QueryDados.FieldByName('NR_CNPJCPF').AsString;

    cdsDadosCupom.FieldByName('Extrato').AsString   := 'Extrato No. ' + IntToStr(QueryDados.FieldByName('ID_VENDA').AsInteger);
    cdsDadosCupom.FieldByName('DescCupom').AsString := 'CUPOM ELETRONICO';

    if ( fncSomenteNumeros(QueryDados.FieldByName('NR_CPF').AsString) <> '' ) then
      cdsDadosCupom.FieldByName('CPFConsumidor').AsString := 'CPF/CNPJ do Consumidor: ' + QueryDados.FieldByName('NR_CPF').AsString
    else if ( fncSomenteNumeros(QueryDados.FieldByName('NR_CNPJ').AsString) <> '' ) then
      cdsDadosCupom.FieldByName('CPFConsumidor').AsString := 'CPF/CNPJ do Consumidor: ' + QueryDados.FieldByName('NR_CNPJ').AsString
    else
      cdsDadosCupom.FieldByName('CPFConsumidor').AsString := 'CPF/CNPJ do Consumidor:';

    qryConsTotal.Close;
    qryConsTotal.ParamByName('ID_VENDA').AsInteger := IdVenda;
    qryConsTotal.Open;

    Descontos    := qryConsTotal.FieldByName('VR_DESCONTO').AsFloat;  // Valor Total desconto
    Acrescimos   := qryConsTotal.FieldByName('VR_ACRESCIMO').AsFloat; // Valor Total acrescimo
    TotalProduto := qryConsTotal.FieldByName('VR_TOTALITEM').AsFloat; // Valor Total dos itens sem desconto e acrescimo

    if ( (Descontos > 0.0) or (Acrescimos > 0.0) ) then
      cdsDadosCupom.FieldByName('SubTotal').AsString := FormatFloat(',0.00', TotalProduto);

    if (Descontos > 0.0) then
      cdsDadosCupom.FieldByName('Desconto').AsString := FormatFloat('-,0.00', Descontos);

    if (Acrescimos > 0.0) then
      cdsDadosCupom.FieldByName('Acrescimo').AsString := FormatFloat('+,0.00', Acrescimos);

    cdsDadosCupom.FieldByName('ValorTotal').AsString := FormatFloat(',0.00', QueryDados.FieldByName('VR_TOTALVENDA').AsFloat);

    if ( QueryDados.FieldByName('VR_TROCO').AsFloat > 0.0 ) then
      cdsDadosCupom.FieldByName('Troco').AsString := FormatFloat(',0.00', QueryDados.FieldByName('VR_TROCO').AsFloat);

    if ( Trim(QueryDados.FieldByName('DS_OBSERVACAOCUPOM').AsString) <> '' ) then
      cdsDadosCupom.FieldByName('Observacao').AsString := QueryDados.FieldByName('DS_OBSERVACAOCUPOM').AsString;

    cdsDadosCupom.FieldByName('NumeroSAT').AsString := 'No. 0001';
    cdsDadosCupom.FieldByName('DataHora').AsString  := FormatDateTime('dd/MM/yyyy', QueryDados.FieldByName('DT_VENDA').AsDateTime) + ' - ' + FormatDateTime('hh:mm', QueryDados.FieldByName('HR_VENDA').AsDateTime);

    qrcode := QueryDados.FieldByName('DS_NOMEFANTASIA').AsString + ' ' + endereco;
    Imagem := TBitmap.Create;

    try
      GerarQRCode(Imagem, qrcode, qrAuto);
      cdsDadosCupom.FieldByName('QRCode').Assign(Imagem);
    finally
      Imagem.Free;
    end;

    cdsDadosCupom.Post;

    // Fatura
    cdsPagamentos.Append;
    cdsPagamentos.FieldByName('Descricao').AsString := QueryDados.FieldByName('DS_FORMAPAGAMENTO').AsString;
    cdsPagamentos.FieldByName('Valor').AsString     := FormatFloat(',0.00', QueryDados.FieldByName('VR_TOTALVENDA').AsFloat);
    cdsPagamentos.Post;
    // ***************************

  end;

  procedure GerarItensCupom(QueryDados: TIBOQuery);
  var index: Integer;
  begin

    index := 1;
    QueryDados.First;

    while ( not QueryDados.Eof ) do
    begin

      cdsItensCupom.Append;
      cdsItensCupom.FieldByName('Item').AsInteger         := index;
      cdsItensCupom.FieldByName('CodItem').AsString       := QueryDados.FieldByName('CD_PRODUTO').AsString;
      cdsItensCupom.FieldByName('DescItem').AsString      := Copy(QueryDados.FieldByName('DS_NOME').AsString, 1, 30);
      cdsItensCupom.FieldByName('Quantidade').AsString    := FormatFloat(',0.000', QueryDados.FieldByName('NR_QUANTIDADE').AsFloat);
      cdsItensCupom.FieldByName('DescQtde').AsString      := Copy(QueryDados.FieldByName('FG_UNIDADEMEDIDA').AsString, 1, 2) + ' X ';
      cdsItensCupom.FieldByName('ValorUnitario').AsString := FormatFloat(',0.00', QueryDados.FieldByName('VR_UNITARIO').AsFloat);
      cdsItensCupom.FieldByName('ValorTotal').AsString    := FormatFloat(',0.00', QueryDados.FieldByName('VR_TOTALITEM').AsFloat);

      if ( QueryDados.FieldByName('VR_DESCONTO').AsFloat > 0.0 ) then
      begin
        cdsItensCupom.FieldByName('Desconto').AsString    := FormatFloat('-,0.00', QueryDados.FieldByName('VR_DESCONTO').AsFloat);
        cdsItensCupom.FieldByName('LiquidoDesc').AsString := FormatFloat(',0.00', QueryDados.FieldByName('VR_TOTALITEM').AsFloat - QueryDados.FieldByName('VR_DESCONTO').AsFloat);
      end;

      if ( QueryDados.FieldByName('VR_ACRESCIMO').AsFloat > 0 ) then
      begin
        cdsItensCupom.FieldByName('Acrescimo').AsString    := FormatFloat('+,0.00', QueryDados.FieldByName('VR_ACRESCIMO').AsFloat);
        cdsItensCupom.FieldByName('LiquidoAcres').AsString := FormatFloat(',0.00', QueryDados.FieldByName('VR_TOTALITEM').AsFloat + QueryDados.FieldByName('VR_ACRESCIMO').AsFloat);
      end;

      Inc(index);
      QueryDados.Next;

    end;

  end;

begin

  try

    qryConsVenda.Close;
    qryConsVenda.ParamByName('ID_VENDA').AsInteger := IdVenda;
    qryConsVenda.Open;

    if ( not qryConsVenda.IsEmpty ) then
    begin

      qryConsVendaItens.Close;
      qryConsVendaItens.ParamByName('ID_VENDA').AsInteger := IdVenda;
      qryConsVendaItens.Open;

      cdsDadosCupom.EmptyDataSet;
      cdsItensCupom.EmptyDataSet;
      cdsPagamentos.EmptyDataSet;

      GerarDadosCupom(qryConsVenda);
      GerarItensCupom(qryConsVendaItens);

      (frxCupomFiscal.FindObject('imgQrCode') as TfrxPictureView).Visible := not Assinatura;
      (frxCupomFiscal.FindObject('mmAssinatura') as TfrxMemoView).Visible := Assinatura;

      VisualizarImpressao := GetIniValue('Parametros', 'VisualizarImpressao');
      if ( ( VisualizarImpressao = 'SIM' ) or ( ViewPrint ) ) then
      begin

        if ( frxCupomFiscal.PrepareReport ) then
          frxCupomFiscal.ShowPreparedReport;

      end
      else
      begin
        frxCupomFiscal.PrepareReport;
        frxCupomFiscal.Print;
      end;

    end;

  except
    MsgBox('"Prezado Cliente"'#13'Ocorreu um erro ao imprimir o Cupom Fiscal Eletrônico', MB_OK+MB_ICONINFORMATION);
  end;

end;

procedure TdmPrincipal.ImprimirExtratoDelivery(IdVenda: Integer; RetirarLocal: Boolean; Observacao: String; Assinatura: Boolean; ViewPrint: Boolean);

  var VisualizarImpressao: String;

  procedure GerarQRCode(var Bitmap: TBitmap; Dados: WideString; Encoding: TQRCodeEncoding);
  var QRCode: TDelphiZXingQRCode;
      Row, Column: Integer;
  begin

    QRCode := TDelphiZXingQRCode.Create;

    try

      QRCode.Data      := Dados;
      QRCode.Encoding  := Encoding;
      QRCode.QuietZone := 2;

      Bitmap.SetSize(QRCode.Rows, QRCode.Columns);

      for Row := 0 to QRCode.Rows - 1 do
      begin

        for Column := 0 to QRCode.Columns - 1 do
        begin

          if (QRCode.IsBlack[Row, Column]) then
            Bitmap.Canvas.Pixels[Column, Row] := clBlack
          else
            Bitmap.Canvas.Pixels[Column, Row] := clWhite;

        end;

      end;

    finally
      QRCode.Free;
    end;

  end;

  procedure GerarDadosCupom(QueryDados: TIBOQuery);
  var endereco, enderecoCliente, qrcode: String;
      Descontos, Acrescimos, TotalProduto: Double;
      Imagem: TBitmap;
  begin

    cdsDadosCupom.Append;
    cdsDadosCupom.FieldByName('Fant').AsString := QueryDados.FieldByName('DS_NOMEFANTASIA').AsString;
    cdsDadosCupom.FieldByName('Nome').AsString := QueryDados.FieldByName('DS_NOMEEMPRESARIAL').AsString;

    if ( QueryDados.FieldByName('FG_TIPODOCUMENTO').AsString = 'CPF' ) then
      cdsDadosCupom.FieldByName('CNPJ').AsString := 'CPF:' + QueryDados.FieldByName('NR_CNPJCPF').AsString
    else
      cdsDadosCupom.FieldByName('CNPJ').AsString := 'CNPJ:' + QueryDados.FieldByName('NR_CNPJCPF').AsString;

    cdsDadosCupom.FieldByName('Extrato').AsString   := 'Extrato No. ' + IntToStr(QueryDados.FieldByName('ID_VENDA').AsInteger);
    cdsDadosCupom.FieldByName('DescCupom').AsString := 'CUPOM ELETRONICO';

    endereco := '';

    if (QueryDados.FieldByName('DS_LOGRADOURO').AsString <> '') then
      endereco := QueryDados.FieldByName('DS_LOGRADOURO').AsString;
    if (QueryDados.FieldByName('NR_NUMERO').AsInteger > 0) then
      endereco := endereco + ', nº ' + IntToStr(QueryDados.FieldByName('NR_NUMERO').AsInteger);
    if (QueryDados.FieldByName('DS_COMPLEMENTO').AsString <> '') then
      endereco := endereco + ' ' + QueryDados.FieldByName('DS_COMPLEMENTO').AsString;
    if (QueryDados.FieldByName('DS_BAIRRO').AsString <> '') then
      endereco := endereco + ' - ' + QueryDados.FieldByName('DS_BAIRRO').AsString;
    if (QueryDados.FieldByName('DS_MUNICIPIO').AsString <> '') then
      endereco := endereco + ' - ' + QueryDados.FieldByName('DS_MUNICIPIO').AsString;

    enderecoCliente := '';

    if ( RetirarLocal ) then
      enderecoCliente := 'Retirar no local'
    else
    begin

      if (QueryDados.FieldByName('DS_LOGRADOUROCLIENTE').AsString <> '') then
        enderecoCliente := QueryDados.FieldByName('DS_LOGRADOUROCLIENTE').AsString;
      if (QueryDados.FieldByName('NR_NUMEROCLIENTE').AsInteger > 0) then
        enderecoCliente := enderecoCliente + ', nº ' + IntToStr(QueryDados.FieldByName('NR_NUMEROCLIENTE').AsInteger);
      if (QueryDados.FieldByName('DS_COMPLEMENTOCLIENTE').AsString <> '') then
        enderecoCliente := enderecoCliente + ' ' + QueryDados.FieldByName('DS_COMPLEMENTOCLIENTE').AsString;
      if (QueryDados.FieldByName('DS_BAIRROCLIENTE').AsString <> '') then
        enderecoCliente := enderecoCliente + ' - ' + QueryDados.FieldByName('DS_BAIRROCLIENTE').AsString;
      if (QueryDados.FieldByName('DS_MUNICIPIOCLIENTE').AsString <> '') then
        enderecoCliente := enderecoCliente + ' - ' + QueryDados.FieldByName('DS_MUNICIPIOCLIENTE').AsString;

    end;

    cdsDadosCupom.FieldByName('Endereco').AsString           := endereco;
    cdsDadosCupom.FieldByName('EnderecoConsumidor').AsString := enderecoCliente;
    cdsDadosCupom.FieldByName('NomeConsumidor').AsString     := QueryDados.FieldByName('DS_NOMECLIENTE').AsString;

    if ( fncSomenteNumeros(QueryDados.FieldByName('NR_CPF').AsString) <> '' ) then
      cdsDadosCupom.FieldByName('CPFConsumidor').AsString := 'CPF/CNPJ do Consumidor: ' + QueryDados.FieldByName('NR_CPF').AsString
    else if ( fncSomenteNumeros(QueryDados.FieldByName('NR_CNPJ').AsString) <> '' ) then
      cdsDadosCupom.FieldByName('CPFConsumidor').AsString := 'CPF/CNPJ do Consumidor: ' + QueryDados.FieldByName('NR_CNPJ').AsString
    else
      cdsDadosCupom.FieldByName('CPFConsumidor').AsString := 'CPF/CNPJ do Consumidor:';

    qryConsTotal.Close;
    qryConsTotal.ParamByName('ID_VENDA').AsInteger := IdVenda;
    qryConsTotal.Open;

    Descontos    := qryConsTotal.FieldByName('VR_DESCONTO').AsFloat;  // Valor Total desconto
    Acrescimos   := qryConsTotal.FieldByName('VR_ACRESCIMO').AsFloat; // Valor Total acrescimo
    TotalProduto := qryConsTotal.FieldByName('VR_TOTALITEM').AsFloat; // Valor Total dos itens sem desconto e acrescimo

    if ( (Descontos > 0.0) or (Acrescimos > 0.0) ) then
      cdsDadosCupom.FieldByName('SubTotal').AsString := FormatFloat(',0.00', TotalProduto);

    if (Descontos > 0.0) then
      cdsDadosCupom.FieldByName('Desconto').AsString := FormatFloat('-,0.00', Descontos);

    if (Acrescimos > 0.0) then
      cdsDadosCupom.FieldByName('Acrescimo').AsString := FormatFloat('+,0.00', Acrescimos);

    cdsDadosCupom.FieldByName('ValorTotal').AsString := FormatFloat(',0.00', QueryDados.FieldByName('VR_TOTALVENDA').AsFloat);

    if ( QueryDados.FieldByName('VR_TROCO').AsFloat > 0.0 ) then
      cdsDadosCupom.FieldByName('Troco').AsString := FormatFloat(',0.00', QueryDados.FieldByName('VR_TROCO').AsFloat);

    if ( Trim(QueryDados.FieldByName('DS_OBSERVACAOCUPOM').AsString) <> '' ) then
      cdsDadosCupom.FieldByName('Observacao').AsString := QueryDados.FieldByName('DS_OBSERVACAOCUPOM').AsString;

    cdsDadosCupom.FieldByName('NumeroSAT').AsString := 'No. 0001';
    cdsDadosCupom.FieldByName('DataHora').AsString  := FormatDateTime('dd/MM/yyyy', QueryDados.FieldByName('DT_VENDA').AsDateTime) + ' - ' + FormatDateTime('hh:mm', QueryDados.FieldByName('HR_VENDA').AsDateTime);

    qrcode := QueryDados.FieldByName('DS_NOMEFANTASIA').AsString + ' ' + endereco;
    Imagem := TBitmap.Create;

    try
      GerarQRCode(Imagem, qrcode, qrAuto);
      cdsDadosCupom.FieldByName('QRCode').Assign(Imagem);
    finally
      Imagem.Free;
    end;

    cdsDadosCupom.FieldByName('ObservacaoDelivery').AsString := Observacao;
    cdsDadosCupom.Post;

    // Fatura
    cdsPagamentos.Append;
    cdsPagamentos.FieldByName('Descricao').AsString := QueryDados.FieldByName('DS_FORMAPAGAMENTO').AsString;
    cdsPagamentos.FieldByName('Valor').AsString     := FormatFloat(',0.00', QueryDados.FieldByName('VR_TOTALVENDA').AsFloat);
    cdsPagamentos.Post;
    // ***************************

  end;

  procedure GerarItensCupom(QueryDados: TIBOQuery);
  var index: Integer;
  begin

    index := 1;
    QueryDados.First;

    while ( not QueryDados.Eof ) do
    begin

      cdsItensCupom.Append;
      cdsItensCupom.FieldByName('Item').AsInteger         := index;
      cdsItensCupom.FieldByName('CodItem').AsString       := QueryDados.FieldByName('CD_PRODUTO').AsString;
      cdsItensCupom.FieldByName('DescItem').AsString      := Copy(QueryDados.FieldByName('DS_NOME').AsString, 1, 30);
      cdsItensCupom.FieldByName('Quantidade').AsString    := FormatFloat(',0.000', QueryDados.FieldByName('NR_QUANTIDADE').AsFloat);
      cdsItensCupom.FieldByName('DescQtde').AsString      := Copy(QueryDados.FieldByName('FG_UNIDADEMEDIDA').AsString, 1, 2) + ' X ';
      cdsItensCupom.FieldByName('ValorUnitario').AsString := FormatFloat(',0.00', QueryDados.FieldByName('VR_UNITARIO').AsFloat);
      cdsItensCupom.FieldByName('ValorTotal').AsString    := FormatFloat(',0.00', QueryDados.FieldByName('VR_TOTALITEM').AsFloat);

      if ( QueryDados.FieldByName('VR_DESCONTO').AsFloat > 0.0 ) then
      begin
        cdsItensCupom.FieldByName('Desconto').AsString    := FormatFloat('-,0.00', QueryDados.FieldByName('VR_DESCONTO').AsFloat);
        cdsItensCupom.FieldByName('LiquidoDesc').AsString := FormatFloat(',0.00', QueryDados.FieldByName('VR_TOTALITEM').AsFloat - QueryDados.FieldByName('VR_DESCONTO').AsFloat);
      end;

      if ( QueryDados.FieldByName('VR_ACRESCIMO').AsFloat > 0 ) then
      begin
        cdsItensCupom.FieldByName('Acrescimo').AsString    := FormatFloat('+,0.00', QueryDados.FieldByName('VR_ACRESCIMO').AsFloat);
        cdsItensCupom.FieldByName('LiquidoAcres').AsString := FormatFloat(',0.00', QueryDados.FieldByName('VR_TOTALITEM').AsFloat + QueryDados.FieldByName('VR_ACRESCIMO').AsFloat);
      end;

      Inc(index);
      QueryDados.Next;

    end;

  end;

begin

  try

    qryConsVenda.Close;
    qryConsVenda.ParamByName('ID_VENDA').AsInteger := IdVenda;
    qryConsVenda.Open;

    if ( not qryConsVenda.IsEmpty ) then
    begin

      qryConsVendaItens.Close;
      qryConsVendaItens.ParamByName('ID_VENDA').AsInteger := IdVenda;
      qryConsVendaItens.Open;

      cdsDadosCupom.EmptyDataSet;
      cdsItensCupom.EmptyDataSet;
      cdsPagamentos.EmptyDataSet;

      GerarDadosCupom(qryConsVenda);
      GerarItensCupom(qryConsVendaItens);

      (frxCupomFiscalDelivery.FindObject('imgQrCode') as TfrxPictureView).Visible := not Assinatura;
      (frxCupomFiscalDelivery.FindObject('mmAssinatura') as TfrxMemoView).Visible := Assinatura;
      (frxCupomFiscalDelivery.FindObject('chObservacao') as TfrxChild).Visible    := Trim(Observacao) <> '';

      VisualizarImpressao := GetIniValue('Parametros', 'VisualizarImpressao');
      if ( ( VisualizarImpressao = 'SIM' ) or ( ViewPrint ) ) then
      begin

        if ( frxCupomFiscalDelivery.PrepareReport ) then
          frxCupomFiscalDelivery.ShowPreparedReport;

      end
      else
      begin
        frxCupomFiscalDelivery.PrepareReport;
        frxCupomFiscalDelivery.Print;
      end;

    end;

  except
    MsgBox('"Prezado Cliente"'#13'Ocorreu um erro ao imprimir o Cupom Fiscal Eletrônico', MB_OK+MB_ICONINFORMATION);
  end;

end;

end.
