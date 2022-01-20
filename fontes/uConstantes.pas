unit uConstantes;

interface

uses SysUtils;

type
  TUsuario = record
               DS_USUARIO       : String;
               DS_NOMEUSUARIO   : String;
               DS_SENHA         : String;
               FG_ADMINISTRADOR : String;
               FG_BLOQUEADO     : String;
               ID_GRUPOUSUARIO  : Integer;
             end;

const

  SISTEMA_DEMOSTRATIVO = False;

  VERSAO_SISTEMA = '1.0.6';
  BUILD_SISTEMA  = '20200201';
  DATA_SISTEMA   = '01/02/2020';

  VERSAO_BANCO = 6;
  DATA_BANCO   = '01/02/2020';

  CALC_EMPRESA = 'Calculadora';

var
  GBL_USUARIO: TUsuario;

  SISTEMA_BLOQUEADO: Boolean;

  VERIFICAR_CONEXAO: Boolean = true;

  NUM_BACKUP : Integer = 1134;
  NUM_RESTORE: Integer = 1138;

  NOME_EMPRESA,
  NOME_SISTEMA,

  SITE_EMPRESA,
  EMAIL_EMPRESA,

  MUTEX_EMPRESA,
  BANCO_EMPRESA,
  BACKUP_EMPRESA,
  BACKUP_EMPRESA_BCK,

  MSG_SISTEMA_BLOQUEADO, MSG_SERIAL_INVALIDO: String;

implementation

end.
