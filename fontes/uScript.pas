unit uScript;

interface

type
  TScriptBanco = record
                   Versao: Integer;
                   SQL   : WideString;
                 end;

const
  ScriptBanco: array[0..5] of TScriptBanco = (
                                               ( Versao: 1; SQL: '' ),
                                               ( Versao: 2; SQL: 'ALTER TABLE LCT_VENDA ADD FG_ORIGEM CHAR(1), ADD FG_RETIRARLOCAL CHAR(1), ADD DS_OBSERVACAO VARCHAR(250);'+#13+
                                                                 ''+#13+
                                                                 'DELETE FROM CAD_CONTROLEVERSAO;'+#13+
                                                                 'INSERT INTO CAD_CONTROLEVERSAO (NR_VERSAOSISTEMA, NR_BUILDSISTEMA, DT_SISTEMA, NR_VERSAOBANCO, DT_BANCO) VALUES (''1.0.1'', ''20190801'', ''1-AUG-2019'', 2, ''1-AUG-2019'');'+#13+
                                                                 'COMMIT WORK;' ),
                                               ( Versao: 3; SQL: 'CREATE TABLE LCT_CONTASPAGAR ('+#13+
                                                                 '    ID_CONTAPAGAR  INTEGER NOT NULL,'+#13+
                                                                 '    DT_VENCIMENTO  DATE,'+#13+
                                                                 '    VR_CONTAPAGAR  DM_VALOR,'+#13+
                                                                 '    DS_PAGARA      VARCHAR(50),'+#13+
                                                                 '    DS_DESCRICAO   VARCHAR(50),'+#13+
                                                                 '    DS_OBSERVACAO  VARCHAR(50),'+#13+
                                                                 '    FG_STATUS      CHAR(1),'+#13+
                                                                 '    CONSTRAINT PK_LCT_CONTASPAGAR PRIMARY KEY (ID_CONTAPAGAR)'+#13+
                                                                 ');'+#13+
                                                                 ''+#13+
                                                                 'CREATE TABLE LCT_CONTASRECEBER ('+#13+
                                                                 '    ID_CONTARECEBER  INTEGER NOT NULL,'+#13+
                                                                 '    DT_RECEBIMENTO   DATE,'+#13+
                                                                 '    VR_CONTARECEBER  DM_VALOR,'+#13+
                                                                 '    DS_RECEBERDE     VARCHAR(50),'+#13+
                                                                 '    DS_DESCRICAO     VARCHAR(50),'+#13+
                                                                 '    DS_OBSERVACAO    VARCHAR(50),'+#13+
                                                                 '    FG_STATUS        CHAR(1),'+#13+
                                                                 '    CONSTRAINT PK_LCT_CONTASRECEBER PRIMARY KEY (ID_CONTARECEBER)'+#13+
                                                                 ');'+#13+
                                                                 ''+#13+
                                                                 'CREATE SEQUENCE GEN_ID_LCT_CONTASPAGAR;'+#13+
                                                                 ''+#13+
                                                                 'CREATE SEQUENCE GEN_ID_LCT_CONTASRECEBER;'+#13+
                                                                 ''+#13+
                                                                 'SET TERM ^ ;'+#13+
                                                                 ''+#13+
                                                                 'create or alter procedure STRDPRC_RETORNAFLUXOCAIXA ('+#13+
                                                                 '    P_IN_FG_TIPOLANCAMENTO varchar(7),'+#13+
                                                                 '    P_IN_DT_REFERENCIAINICIO date,'+#13+
                                                                 '    P_IN_DT_REFERENCIAFIM date)'+#13+
                                                                 'returns ('+#13+
                                                                 '    P_OU_FG_TIPOLANCAMENTO varchar(7),'+#13+
                                                                 '    P_OU_DS_LANCAMENTO varchar(40),'+#13+
                                                                 '    P_OU_DS_DESCRICAO varchar(50),'+#13+
                                                                 '    P_OU_DT_LANCAMENTO date,'+#13+
                                                                 '    P_OU_VR_LANCAMENTO DM_VALOR)'+#13+
                                                                 'as'+#13+
                                                                 'BEGIN'+#13+
                                                                 ''+#13+
                                                                 '  IF ( ( :P_IN_FG_TIPOLANCAMENTO = ''SAIDA'' ) OR ( :P_IN_FG_TIPOLANCAMENTO = ''TODOS'' ) ) THEN'+#13+
                                                                 '  BEGIN'+#13+
                                                                 ''+#13+
                                                                 '    FOR SELECT ''SAIDA'','+#13+
                                                                 '               CASE'+#13+
                                                                 '                 WHEN LCT_VENDA.FG_ORIGEM = ''D'' THEN ''Delivery de Produtos/Mercadorias'''+#13+
                                                                 '                 ELSE ''Venda de Produtos/Mercadorias'''+#13+
                                                                 '               END,'+#13+
                                                                 '               LCT_VENDA.DS_FORMAPAGAMENTO,'+#13+
                                                                 '               LCT_VENDA.DT_VENDA,'+#13+
                                                                 '               LCT_VENDA.VR_TOTALVENDA'+#13+
                                                                 '        FROM LCT_VENDA'+#13+
                                                                 '        WHERE LCT_VENDA.DT_VENDA BETWEEN :P_IN_DT_REFERENCIAINICIO AND :P_IN_DT_REFERENCIAFIM'+#13+
                                                                 '        INTO :P_OU_FG_TIPOLANCAMENTO,'+#13+
                                                                 '             :P_OU_DS_LANCAMENTO,'+#13+
                                                                 '             :P_OU_DS_DESCRICAO,'+#13+
                                                                 '             :P_OU_DT_LANCAMENTO,'+#13+
                                                                 '             :P_OU_VR_LANCAMENTO'+#13+
                                                                 '    DO'+#13+
                                                                 '    BEGIN'+#13+
                                                                 '      SUSPEND;'+#13+
                                                                 '    END'+#13+
                                                                 ''+#13+
                                                                 '    FOR SELECT ''SAIDA'','+#13+
                                                                 '               ''Contas a Receber'','+#13+
                                                                 '               LCT_CONTASRECEBER.DS_DESCRICAO,'+#13+
                                                                 '               LCT_CONTASRECEBER.DT_RECEBIMENTO,'+#13+
                                                                 '               LCT_CONTASRECEBER.VR_CONTARECEBER'+#13+
                                                                 '        FROM LCT_CONTASRECEBER'+#13+
                                                                 '        WHERE LCT_CONTASRECEBER.DT_RECEBIMENTO BETWEEN :P_IN_DT_REFERENCIAINICIO AND :P_IN_DT_REFERENCIAFIM'+#13+
                                                                 '        INTO :P_OU_FG_TIPOLANCAMENTO,'+#13+
                                                                 '             :P_OU_DS_LANCAMENTO,'+#13+
                                                                 '             :P_OU_DS_DESCRICAO,'+#13+
                                                                 '             :P_OU_DT_LANCAMENTO,'+#13+
                                                                 '             :P_OU_VR_LANCAMENTO'+#13+
                                                                 '    DO'+#13+
                                                                 '    BEGIN'+#13+
                                                                 '      SUSPEND;'+#13+
                                                                 '    END'+#13+
                                                                 ''+#13+
                                                                 '  END'+#13+
                                                                 ''+#13+
                                                                 '  IF ( ( :P_IN_FG_TIPOLANCAMENTO = ''ENTRADA'' ) OR ( :P_IN_FG_TIPOLANCAMENTO = ''TODOS'' ) ) THEN'+#13+
                                                                 '  BEGIN'+#13+
                                                                 ''+#13+
                                                                 '    FOR SELECT ''ENTRADA'','+#13+
                                                                 '               ''Entrada de Produtos/Mercadorias'','+#13+
                                                                 '               LCT_ENTRADA.DS_ENTRADA,'+#13+
                                                                 '               LCT_ENTRADA.DT_ENTRADA,'+#13+
                                                                 '               LCT_ENTRADA.VR_TOTALENTRADA'+#13+
                                                                 '        FROM LCT_ENTRADA'+#13+
                                                                 '        WHERE LCT_ENTRADA.DT_ENTRADA BETWEEN :P_IN_DT_REFERENCIAINICIO AND :P_IN_DT_REFERENCIAFIM'+#13+
                                                                 '        INTO :P_OU_FG_TIPOLANCAMENTO,'+#13+
                                                                 '             :P_OU_DS_LANCAMENTO,'+#13+
                                                                 '             :P_OU_DS_DESCRICAO,'+#13+
                                                                 '             :P_OU_DT_LANCAMENTO,'+#13+
                                                                 '             :P_OU_VR_LANCAMENTO'+#13+
                                                                 '    DO'+#13+
                                                                 '    BEGIN'+#13+
                                                                 '      SUSPEND;'+#13+
                                                                 '    END'+#13+
                                                                 ''+#13+
                                                                 '    FOR SELECT ''ENTRADA'','+#13+
                                                                 '               ''Contas a Pagar'','+#13+
                                                                 '               LCT_CONTASPAGAR.DS_DESCRICAO,'+#13+
                                                                 '               LCT_CONTASPAGAR.DT_VENCIMENTO,'+#13+
                                                                 '               LCT_CONTASPAGAR.VR_CONTAPAGAR'+#13+
                                                                 '        FROM LCT_CONTASPAGAR'+#13+
                                                                 '        WHERE LCT_CONTASPAGAR.DT_VENCIMENTO BETWEEN :P_IN_DT_REFERENCIAINICIO AND :P_IN_DT_REFERENCIAFIM'+#13+
                                                                 '        INTO :P_OU_FG_TIPOLANCAMENTO,'+#13+
                                                                 '             :P_OU_DS_LANCAMENTO,'+#13+
                                                                 '             :P_OU_DS_DESCRICAO,'+#13+
                                                                 '             :P_OU_DT_LANCAMENTO,'+#13+
                                                                 '             :P_OU_VR_LANCAMENTO'+#13+
                                                                 '    DO'+#13+
                                                                 '    BEGIN'+#13+
                                                                 '      SUSPEND;'+#13+
                                                                 '    END'+#13+
                                                                 ''+#13+
                                                                 '  END'+#13+
                                                                 ''+#13+
                                                                 'END^'+#13+
                                                                 ''+#13+
                                                                 'SET TERM ; ^'+#13+
                                                                 ''+#13+
                                                                 'DELETE FROM CAD_CONTROLEVERSAO;'+#13+
                                                                 'INSERT INTO CAD_CONTROLEVERSAO (NR_VERSAOSISTEMA, NR_BUILDSISTEMA, DT_SISTEMA, NR_VERSAOBANCO, DT_BANCO) VALUES (''1.0.3'', ''20190819'', ''19-AUG-2019'', 3, ''19-AUG-2019'');'+#13+
                                                                 'COMMIT WORK;' ),
                                               ( Versao: 4; SQL: 'ALTER TABLE CAD_PRODUTO ADD CD_FABRICANTE VARCHAR(30), ADD FT_PRODUTO BLOB SUB_TYPE 0 SEGMENT SIZE 80;'+#13+
                                                                 ''+#13+
                                                                 'DELETE FROM CAD_CONTROLEVERSAO;'+#13+
                                                                 'INSERT INTO CAD_CONTROLEVERSAO (NR_VERSAOSISTEMA, NR_BUILDSISTEMA, DT_SISTEMA, NR_VERSAOBANCO, DT_BANCO) VALUES (''1.0.4'', ''20190821'', ''21-AUG-2019'', 4, ''21-AUG-2019'');'+#13+
                                                                 'COMMIT WORK;' ),
                                               ( Versao: 5; SQL: 'CREATE TABLE CAD_USUARIOPERMISSAO ('+#13+
                                                                 '    DS_USUARIO    VARCHAR(15) NOT NULL,'+#13+
                                                                 '    CD_PERMISSAO  INTEGER NOT NULL,'+#13+
                                                                 '    DS_MENU       VARCHAR(100),'+#13+
                                                                 '    FG_PERMITIR   SMALLINT,'+#13+
                                                                 '    CONSTRAINT PK_CAD_USUARIOPERMISSAO PRIMARY KEY (DS_USUARIO, CD_PERMISSAO),'+#13+
                                                                 '    CONSTRAINT FK_CAD_USUARIOPERMISSAO_1 FOREIGN KEY (DS_USUARIO) REFERENCES CAD_USUARIO (DS_USUARIO) ON DELETE CASCADE'+#13+
                                                                 ');'+#13+
                                                                 ''+#13+
                                                                 'CREATE SEQUENCE GEN_ID_USUARIOPERMISSAO;'+#13+
                                                                 ''+#13+
                                                                 'DELETE FROM CAD_CONTROLEVERSAO;'+#13+
                                                                 'INSERT INTO CAD_CONTROLEVERSAO (NR_VERSAOSISTEMA, NR_BUILDSISTEMA, DT_SISTEMA, NR_VERSAOBANCO, DT_BANCO) VALUES (''1.0.5'', ''20200128'', ''28-JAN-2020'', 5, ''28-JAN-2020'');'+#13+
                                                                 'COMMIT WORK;' ),


                                               ( Versao: 6; SQL: 'ALTER TABLE CAD_PROFISSIONAL DROP DS_CONSELHOPROFISSIONAL;'+#13+
                                                                 'ALTER TABLE CAD_PROFISSIONAL DROP NR_CONSELHOPROFISSIONAL;'+#13+
                                                                 'ALTER TABLE CAD_PROFISSIONAL DROP FG_PUBLICAR;'+#13+
                                                                 ''+#13+
                                                                 'CREATE TABLE CAD_PROFISSIONALHORARIO ('+#13+
                                                                 '    CD_PROFISSIONAL      INTEGER NOT NULL,'+#13+
                                                                 '    ID_DIASEMANA         INTEGER NOT NULL,'+#13+
                                                                 '    DS_DIASEMANA         VARCHAR(7),'+#13+
                                                                 '    HR_ENTRADA           TIME,'+#13+
                                                                 '    HR_SAIDAINTERVALO    TIME,'+#13+
                                                                 '    HR_ENTRADAINTERVALO  TIME,'+#13+
                                                                 '    HR_SAIDA             TIME,'+#13+
                                                                 '    CONSTRAINT R_0015 PRIMARY KEY (CD_PROFISSIONAL, ID_DIASEMANA),'+#13+
                                                                 '    CONSTRAINT R_0036 FOREIGN KEY (CD_PROFISSIONAL) REFERENCES CAD_PROFISSIONAL (CD_PROFISSIONAL) ON DELETE CASCADE'+#13+
                                                                 ');'+#13+
                                                                 ''+#13+
                                                                 'CREATE TABLE CAD_ATENDIMENTO ('+#13+
                                                                 '    ID_ATENDIMENTO          INTEGER NOT NULL,'+#13+
                                                                 '    CD_PROFISSIONAL         INTEGER,'+#13+
                                                                 '    CD_CLIENTE              INTEGER,'+#13+
                                                                 '    DT_ATENDIMENTO          DATE,'+#13+
                                                                 '    HR_ATENDIMENTO          TIME,'+#13+
                                                                 '    FG_STATUS               CHAR(1),'+#13+
                                                                 '    DS_ANOTACAO             BLOB SUB_TYPE 1 SEGMENT SIZE 80,'+#13+
                                                                 '    NR_TELEFONERESIDENCIAL  DM_TELEFONE,'+#13+
                                                                 '    NR_CELULAR              DM_TELEFONE,'+#13+
                                                                 '    CONSTRAINT UNQ1_CAD_ATENDIMENTO UNIQUE (CD_PROFISSIONAL, DT_ATENDIMENTO, HR_ATENDIMENTO),'+#13+
                                                                 '    CONSTRAINT PK_CAD_ATENDIMENTO PRIMARY KEY (ID_ATENDIMENTO),'+#13+
                                                                 '    CONSTRAINT FK_CAD_ATENDIMENTO_1 FOREIGN KEY (CD_PROFISSIONAL) REFERENCES CAD_PROFISSIONAL (CD_PROFISSIONAL),'+#13+
                                                                 '    CONSTRAINT FK_CAD_ATENDIMENTO_2 FOREIGN KEY (CD_CLIENTE) REFERENCES CAD_CLIENTE (CD_CLIENTE)'+#13+
                                                                 ');'+#13+
                                                                 ''+#13+
                                                                 'CREATE SEQUENCE GEN_ID_CAD_ATENDIMENTO;'+#13+
                                                                 ''+#13+
                                                                 'SET TERM ^ ;'+#13+
                                                                 ''+#13+
                                                                 'CREATE OR ALTER TRIGGER TRG_ID_CAD_ATENDIMENTO FOR CAD_ATENDIMENTO'+#13+
                                                                 'ACTIVE BEFORE INSERT POSITION 0'+#13+
                                                                 'AS'+#13+
                                                                 'BEGIN'+#13+
                                                                 ''+#13+
                                                                 '  NEW.ID_ATENDIMENTO = GEN_ID(GEN_ID_CAD_ATENDIMENTO, 1);'+#13+
                                                                 ''+#13+
                                                                 'END'+#13+
                                                                 '^'+#13+
                                                                 ''+#13+
                                                                 'SET TERM ; ^'+#13+
                                                                 ''+#13+
                                                                 'SET TERM ^ ;'+#13+
                                                                 ''+#13+
                                                                 'create or alter procedure STRDPRC_RETORNAAGENDA ('+#13+
                                                                 '    P_IN_CD_PROFISSIONAL integer,'+#13+
                                                                 '    P_IN_ID_DIASEMANA integer,'+#13+
                                                                 '    P_IN_DT_REFERENCIA date)'+#13+
                                                                 'returns ('+#13+
                                                                 '    P_OU_HR_HORARIO time,'+#13+
                                                                 '    P_OU_ID_PERIODO integer,'+#13+
                                                                 '    P_OU_ID_ATENDIMENTO integer,'+#13+
                                                                 '    P_OU_CD_PROFISSIONAL integer,'+#13+
                                                                 '    P_OU_CD_CLIENTE integer,'+#13+
                                                                 '    P_OU_DT_ATENDIMENTO date,'+#13+
                                                                 '    P_OU_HR_ATENDIMENTO time,'+#13+
                                                                 ' P_OU_DS_NOME varchar(70),'+#13+
                                                                 '    P_OU_FG_STATUS char(1),'+#13+
                                                                 '    P_OU_DS_ANOTACAO blob sub_type 1 segment size 80,'+#13+
                                                                 '    P_OU_NR_TELEFONERESIDENCIAL varchar(15),'+#13+
                                                                 '    P_OU_NR_TELEFONECOMERCIAL varchar(15),'+#13+
                                                                 '    P_OU_NR_CELULAR varchar(15))'+#13+
                                                                 'as'+#13+
                                                                 'declare variable VAR_HR_ENTRADA time;'+#13+
                                                                 'declare variable VAR_HR_SAIDAINTERVALO time;'+#13+
                                                                 'declare variable VAR_HR_ENTRADAINTERVALO time;'+#13+
                                                                 'declare variable VAR_HR_SAIDA time;'+#13+
                                                                 'declare variable VAR_HORA integer;'+#13+
                                                                 'declare variable VAR_MINUTO integer;'+#13+
                                                                 'declare variable VAR_NR_INTERVALO integer;'+#13+
                                                                 'declare variable VAR_FG_SUSPEND integer;'+#13+
                                                                 'declare variable VAR_NR_CONTADOR integer;'+#13+
                                                                 'declare variable VAR_DS_FERIADO varchar(30);'+#13+
                                                                 'declare variable VAR_FG_BLOQUEAR integer;'+#13+
                                                                 'declare variable VAR_DS_MOTIVOBLOQUEIO varchar(50);'+#13+
                                                                 'declare variable VAR_HR_CONSULTA time;'+#13+
                                                                 'BEGIN'+#13+
                                                                 ''+#13+
                                                                 '  VAR_DS_FERIADO = NULL;'+#13+
                                                                 ''+#13+
                                                                 '  SELECT CAD_FERIADO.DS_FERIADO'+#13+
                                                                 '  FROM CAD_FERIADO'+#13+
                                                                 '  WHERE CAD_FERIADO.DT_DIAFERIADO = EXTRACT(DAY FROM :P_IN_DT_REFERENCIA) AND'+#13+
                                                                 '        CAD_FERIADO.DT_MESFERIADO = EXTRACT(MONTH FROM :P_IN_DT_REFERENCIA)'+#13+
                                                                 '  INTO :VAR_DS_FERIADO;'+#13+
                                                                 ''+#13+
                                                                 '  SELECT COALESCE(CAD_PROFISSIONAL.FG_INTERVALOATENDIMENTO, 15)'+#13+
                                                                 '  FROM CAD_PROFISSIONAL'+#13+
                                                                 '  WHERE CAD_PROFISSIONAL.CD_PROFISSIONAL = :P_IN_CD_PROFISSIONAL'+#13+
                                                                 '  INTO :VAR_NR_INTERVALO;'+#13+
                                                                 ''+#13+
                                                                 '  SELECT CAD_PROFISSIONALHORARIO.HR_ENTRADA,'+#13+
                                                                 '         CAD_PROFISSIONALHORARIO.HR_SAIDAINTERVALO,'+#13+
                                                                 '         CAD_PROFISSIONALHORARIO.HR_ENTRADAINTERVALO,'+#13+
                                                                 '         CAD_PROFISSIONALHORARIO.HR_SAIDA'+#13+
                                                                 '  FROM CAD_PROFISSIONALHORARIO'+#13+
                                                                 '  WHERE CAD_PROFISSIONALHORARIO.CD_PROFISSIONAL = :P_IN_CD_PROFISSIONAL AND'+#13+
                                                                 '        CAD_PROFISSIONALHORARIO.ID_DIASEMANA = :P_IN_ID_DIASEMANA'+#13+
                                                                 '  INTO :VAR_HR_ENTRADA,'+#13+
                                                                 '       :VAR_HR_SAIDAINTERVALO,'+#13+
                                                                 '       :VAR_HR_ENTRADAINTERVALO,'+#13+
                                                                 '       :VAR_HR_SAIDA;'+#13+
                                                                 ''+#13+
                                                                 '  IF ( :VAR_HR_SAIDAINTERVALO IS NULL AND :VAR_HR_ENTRADAINTERVALO IS NULL AND :VAR_HR_SAIDA IS NOT NULL ) THEN'+#13+
                                                                 '  BEGIN'+#13+
                                                                 '    VAR_HR_SAIDAINTERVALO = :VAR_HR_SAIDA;'+#13+
                                                                 '    VAR_HR_SAIDA = NULL;'+#13+
                                                                 '  END'+#13+
                                                                 ''+#13+
                                                                 '  FOR SELECT CAD_ATENDIMENTO.ID_ATENDIMENTO,'+#13+
                                                                 '             CAD_ATENDIMENTO.CD_PROFISSIONAL,'+#13+
                                                                 '             CAD_ATENDIMENTO.CD_CLIENTE,'+#13+
                                                                 '             CAD_ATENDIMENTO.DT_ATENDIMENTO,'+#13+
                                                                 '             CAD_ATENDIMENTO.HR_ATENDIMENTO,'+#13+
                                                                 '             CAD_ATENDIMENTO.FG_STATUS,'+#13+
                                                                 '             CAD_ATENDIMENTO.DS_ANOTACAO,'+#13+
                                                                 '             CAD_CLIENTE.DS_NOME,'+#13+
                                                                 '             COALESCE(CAD_CLIENTE.NR_TELEFONERESIDENCIAL, CAD_ATENDIMENTO.NR_TELEFONERESIDENCIAL),'+#13+
                                                                 '             CAD_CLIENTE.NR_TELEFONECOMERCIAL,'+#13+
                                                                 '             COALESCE(CAD_CLIENTE.NR_CELULAR, CAD_ATENDIMENTO.NR_CELULAR)'+#13+
                                                                 '      FROM CAD_ATENDIMENTO'+#13+
                                                                 '      LEFT JOIN CAD_CLIENTE ON(CAD_CLIENTE.CD_CLIENTE = CAD_ATENDIMENTO.CD_CLIENTE)'+#13+
                                                                 '      WHERE CAD_ATENDIMENTO.CD_PROFISSIONAL = :P_IN_CD_PROFISSIONAL AND'+#13+
                                                                 '            CAD_ATENDIMENTO.DT_ATENDIMENTO = :P_IN_DT_REFERENCIA AND'+#13+
                                                                 '            ('+#13+
                                                                 '              ('+#13+
                                                                 '                ( CAD_ATENDIMENTO.HR_ATENDIMENTO < :VAR_HR_ENTRADA OR CAD_ATENDIMENTO.HR_ATENDIMENTO >= :VAR_HR_SAIDAINTERVALO ) AND'+#13+
                                                                 '                ( CAD_ATENDIMENTO.HR_ATENDIMENTO < :VAR_HR_ENTRADAINTERVALO OR CAD_ATENDIMENTO.HR_ATENDIMENTO >= :VAR_HR_SAIDA )'+#13+
                                                                 '              ) OR'+#13+
                                                                 '              ('+#13+
                                                                 '                ( CAD_ATENDIMENTO.HR_ATENDIMENTO < :VAR_HR_ENTRADA OR CAD_ATENDIMENTO.HR_ATENDIMENTO >= :VAR_HR_SAIDAINTERVALO ) AND'+#13+
                                                                 '                ( :VAR_HR_ENTRADAINTERVALO IS NULL AND :VAR_HR_SAIDA IS NULL )'+#13+
                                                                 '              ) OR'+#13+
                                                                 '              ('+#13+
                                                                 '                ( :VAR_HR_ENTRADA IS NULL AND :VAR_HR_SAIDAINTERVALO IS NULL ) AND'+#13+
                                                                 '                ( CAD_ATENDIMENTO.HR_ATENDIMENTO < :VAR_HR_ENTRADAINTERVALO OR CAD_ATENDIMENTO.HR_ATENDIMENTO >= :VAR_HR_SAIDA )'+#13+
                                                                 '              ) OR'+#13+
                                                                 '              ('+#13+
                                                                 '                ( :VAR_HR_ENTRADA IS NULL AND :VAR_HR_SAIDAINTERVALO IS NULL AND :VAR_HR_ENTRADAINTERVALO IS NULL AND :VAR_HR_SAIDA IS NULL )'+#13+
                                                                 '              )'+#13+
                                                                 '            )'+#13+
                                                                 '      INTO :P_OU_ID_ATENDIMENTO,'+#13+
                                                                 '           :P_OU_CD_PROFISSIONAL,'+#13+
                                                                 '           :P_OU_CD_CLIENTE,'+#13+
                                                                 '           :P_OU_DT_ATENDIMENTO,'+#13+
                                                                 '           :P_OU_HR_ATENDIMENTO,'+#13+
                                                                 '           :P_OU_FG_STATUS,'+#13+
                                                                 '           :P_OU_DS_ANOTACAO,'+#13+
                                                                 '           :P_OU_DS_NOME,'+#13+
                                                                 '           :P_OU_NR_TELEFONERESIDENCIAL,'+#13+
                                                                 '           :P_OU_NR_TELEFONECOMERCIAL,'+#13+
                                                                 '           :P_OU_NR_CELULAR'+#13+
                                                                 '  DO'+#13+
                                                                 '  BEGIN'+#13+
                                                                 ''+#13+
                                                                 '    P_OU_HR_HORARIO = :P_OU_HR_ATENDIMENTO;'+#13+
                                                                 ''+#13+
                                                                 '    IF ( :P_OU_HR_HORARIO BETWEEN CAST( ''00:00:00'' AS TIME ) AND CAST( ''05:59:00'' AS TIME ) ) THEN'+#13+
                                                                 '      P_OU_ID_PERIODO = 1;'+#13+
                                                                 '    ELSE IF ( :P_OU_HR_HORARIO BETWEEN CAST( ''06:00:00'' AS TIME ) AND CAST( ''11:59:00'' AS TIME ) ) THEN'+#13+
                                                                 '      P_OU_ID_PERIODO = 2;'+#13+
                                                                 '    ELSE IF ( :P_OU_HR_HORARIO BETWEEN CAST( ''12:00:00'' AS TIME ) AND CAST( ''17:59:00'' AS TIME ) ) THEN'+#13+
                                                                 '      P_OU_ID_PERIODO = 3;'+#13+
                                                                 '    ELSE IF ( :P_OU_HR_HORARIO BETWEEN CAST( ''18:00:00'' AS TIME ) AND CAST( ''23:59:00'' AS TIME ) ) THEN'+#13+
                                                                 '      P_OU_ID_PERIODO = 4;'+#13+
                                                                 ''+#13+
                                                                 '    SUSPEND;'+#13+
                                                                 ''+#13+
                                                                 '  END'+#13+
                                                                 ''+#13+
                                                                 '  VAR_NR_CONTADOR = 0;'+#13+
                                                                 ''+#13+
                                                                 '  WHILE ( :VAR_HR_ENTRADA < :VAR_HR_SAIDAINTERVALO ) DO'+#13+
                                                                 '  BEGIN'+#13+
                                                                 ''+#13+
                                                                 '    VAR_FG_SUSPEND = 1;'+#13+
                                                                 ''+#13+
                                                                 '    P_OU_ID_ATENDIMENTO         = NULL;'+#13+
                                                                 '    P_OU_CD_PROFISSIONAL        = NULL;'+#13+
                                                                 '    P_OU_CD_CLIENTE             = NULL;'+#13+
                                                                 '    P_OU_DT_ATENDIMENTO         = NULL;'+#13+
                                                                 '    P_OU_HR_ATENDIMENTO         = NULL;'+#13+
                                                                 '    P_OU_DS_NOME                = NULL;'+#13+
                                                                 '    P_OU_FG_STATUS              = NULL;'+#13+
                                                                 '    P_OU_DS_ANOTACAO            = NULL;'+#13+
                                                                 '    P_OU_NR_TELEFONERESIDENCIAL = NULL;'+#13+
                                                                 '    P_OU_NR_TELEFONECOMERCIAL   = NULL;'+#13+
                                                                 '    P_OU_NR_CELULAR             = NULL;'+#13+
                                                                 ''+#13+
                                                                 '    IF ( ( :VAR_DS_FERIADO IS NOT NULL ) AND ( :VAR_DS_FERIADO <> '''' ) ) THEN'+#13+
                                                                 '    BEGIN'+#13+
                                                                 '      P_OU_DS_NOME = :VAR_DS_FERIADO;'+#13+
                                                                 '    END'+#13+
                                                                 ''+#13+
                                                                 '    P_OU_HR_HORARIO = :VAR_HR_ENTRADA;'+#13+
                                                                 ''+#13+
                                                                 '    VAR_HORA   = EXTRACT( HOUR   FROM :VAR_HR_ENTRADA );'+#13+
                                                                 '    VAR_MINUTO = EXTRACT( MINUTE FROM :VAR_HR_ENTRADA );'+#13+
                                                                 ''+#13+
                                                                 '    VAR_MINUTO = :VAR_MINUTO + :VAR_NR_INTERVALO;'+#13+
                                                                 '    IF ( :VAR_MINUTO > 59 ) THEN'+#13+
                                                                 '    BEGIN'+#13+
                                                                 ''+#13+
                                                                 '      VAR_HORA = :VAR_HORA + 1;'+#13+
                                                                 '      VAR_NR_CONTADOR = :VAR_HORA;'+#13+
                                                                 '      IF ( :VAR_HORA > 23 ) THEN'+#13+
                                                                 '        VAR_HORA = 0;'+#13+
                                                                 ''+#13+
                                                                 '      VAR_MINUTO = 60 - :VAR_MINUTO;'+#13+
                                                                 '      IF ( :VAR_MINUTO < 0 ) THEN'+#13+
                                                                 '        VAR_MINUTO = ( VAR_MINUTO * -1);'+#13+
                                                                 ''+#13+
                                                                 '    END'+#13+
                                                                 ''+#13+
                                                                 '    VAR_HR_ENTRADA = CAST( :VAR_HORA || '':'' || :VAR_MINUTO || '':00'' AS TIME );'+#13+
                                                                 ''+#13+
                                                                 '    IF ( :P_OU_HR_HORARIO BETWEEN CAST( ''00:00:00'' AS TIME ) AND CAST( ''05:59:00'' AS TIME ) ) THEN'+#13+
                                                                 '      P_OU_ID_PERIODO = 1;'+#13+
                                                                 '    ELSE IF ( :P_OU_HR_HORARIO BETWEEN CAST( ''06:00:00'' AS TIME ) AND CAST( ''11:59:00'' AS TIME ) ) THEN'+#13+
                                                                 '      P_OU_ID_PERIODO = 2;'+#13+
                                                                 '    ELSE IF ( :P_OU_HR_HORARIO BETWEEN CAST( ''12:00:00'' AS TIME ) AND CAST( ''17:59:00'' AS TIME ) ) THEN'+#13+
                                                                 '      P_OU_ID_PERIODO = 3;'+#13+
                                                                 '    ELSE IF ( :P_OU_HR_HORARIO BETWEEN CAST( ''18:00:00'' AS TIME ) AND CAST( ''23:59:00'' AS TIME ) ) THEN'+#13+
                                                                 '      P_OU_ID_PERIODO = 4;'+#13+
                                                                 ''+#13+
                                                                 '    FOR SELECT FIRST 1 CAD_ATENDIMENTO.HR_ATENDIMENTO'+#13+
                                                                 '        FROM CAD_ATENDIMENTO'+#13+
                                                                 '        WHERE CAD_ATENDIMENTO.CD_PROFISSIONAL = :P_IN_CD_PROFISSIONAL AND'+#13+
                                                                 '              CAD_ATENDIMENTO.DT_ATENDIMENTO = :P_IN_DT_REFERENCIA AND'+#13+
                                                                 '              ( CAD_ATENDIMENTO.HR_ATENDIMENTO >= :P_OU_HR_HORARIO AND CAD_ATENDIMENTO.HR_ATENDIMENTO < :VAR_HR_ENTRADA )'+#13+
                                                                 '        ORDER BY CAD_ATENDIMENTO.HR_ATENDIMENTO'+#13+
                                                                 '        INTO :VAR_HR_CONSULTA'+#13+
                                                                 '    DO'+#13+
                                                                 '    BEGIN'+#13+
                                                                 ''+#13+
                                                                 '      IF ( :P_OU_HR_HORARIO <> :VAR_HR_CONSULTA ) THEN'+#13+
                                                                 '        SUSPEND;'+#13+
                                                                 ''+#13+
                                                                 '      BREAK;'+#13+
                                                                 ''+#13+
                                                                 '    END'+#13+
                                                                 ''+#13+
                                                                 '    FOR SELECT CAD_ATENDIMENTO.ID_ATENDIMENTO,'+#13+
                                                                 '               CAD_ATENDIMENTO.CD_PROFISSIONAL,'+#13+
                                                                 '               CAD_ATENDIMENTO.CD_CLIENTE,'+#13+
                                                                 '               CAD_ATENDIMENTO.DT_ATENDIMENTO,'+#13+
                                                                 '               CAD_ATENDIMENTO.HR_ATENDIMENTO,'+#13+
                                                                 '               CAD_ATENDIMENTO.FG_STATUS,'+#13+
                                                                 '               CAD_ATENDIMENTO.DS_ANOTACAO,'+#13+
                                                                 '               CAD_CLIENTE.DS_NOME,'+#13+
                                                                 '               COALESCE(CAD_CLIENTE.NR_TELEFONERESIDENCIAL, CAD_ATENDIMENTO.NR_TELEFONERESIDENCIAL),'+#13+
                                                                 '               CAD_CLIENTE.NR_TELEFONECOMERCIAL,'+#13+
                                                                 '               COALESCE(CAD_CLIENTE.NR_CELULAR, CAD_ATENDIMENTO.NR_CELULAR)'+#13+
                                                                 '        FROM CAD_ATENDIMENTO'+#13+
                                                                 '        LEFT JOIN CAD_CLIENTE ON(CAD_CLIENTE.CD_CLIENTE = CAD_ATENDIMENTO.CD_CLIENTE)'+#13+
                                                                 '        WHERE CAD_ATENDIMENTO.CD_PROFISSIONAL = :P_IN_CD_PROFISSIONAL AND'+#13+
                                                                 '              CAD_ATENDIMENTO.DT_ATENDIMENTO = :P_IN_DT_REFERENCIA AND'+#13+
                                                                 '              ( CAD_ATENDIMENTO.HR_ATENDIMENTO >= :P_OU_HR_HORARIO AND CAD_ATENDIMENTO.HR_ATENDIMENTO < :VAR_HR_ENTRADA )'+#13+
                                                                 '        ORDER BY CAD_ATENDIMENTO.HR_ATENDIMENTO ASC'+#13+
                                                                 '        INTO :P_OU_ID_ATENDIMENTO,'+#13+
                                                                 '             :P_OU_CD_PROFISSIONAL,'+#13+
                                                                 '             :P_OU_CD_CLIENTE,'+#13+
                                                                 '             :P_OU_DT_ATENDIMENTO,'+#13+
                                                                 '             :P_OU_HR_ATENDIMENTO,'+#13+
                                                                 '             :P_OU_FG_STATUS,'+#13+
                                                                 '             :P_OU_DS_ANOTACAO,'+#13+
                                                                 '             :P_OU_DS_NOME,'+#13+
                                                                 '             :P_OU_NR_TELEFONERESIDENCIAL,'+#13+
                                                                 '             :P_OU_NR_TELEFONECOMERCIAL,'+#13+
                                                                 '             :P_OU_NR_CELULAR'+#13+
                                                                 '    DO'+#13+
                                                                 '    BEGIN'+#13+
                                                                 ''+#13+
                                                                 '      VAR_FG_SUSPEND = 2;'+#13+
                                                                 ''+#13+
                                                                 '      IF ( :P_OU_HR_HORARIO <> :P_OU_HR_ATENDIMENTO ) THEN'+#13+
                                                                 '        P_OU_HR_HORARIO = :P_OU_HR_ATENDIMENTO;'+#13+
                                                                 ''+#13+
                                                                 '      SUSPEND;'+#13+
                                                                 ''+#13+
                                                                 '    END'+#13+
                                                                 ''+#13+
                                                                 '    IF ( :VAR_FG_SUSPEND = 1 ) THEN'+#13+
                                                                 '    BEGIN'+#13+
                                                                 ''+#13+
                                                                 '      /*VAR_FG_BLOQUEAR = 0;'+#13+
                                                                 ''+#13+
                                                                 '      FOR SELECT CAD_HORARIOBLOQUEIO.DS_MOTIVO'+#13+
                                                                 '          FROM CAD_HORARIOBLOQUEIO'+#13+
                                                                 '          WHERE ( CAD_HORARIOBLOQUEIO.CD_PROFISSIONAL = :P_IN_CD_PROFISSIONAL ) AND'+#13+
                                                                 '                ( :P_IN_DT_REFERENCIA BETWEEN CAD_HORARIOBLOQUEIO.DT_INICIO AND CAD_HORARIOBLOQUEIO.DT_FIM ) AND'+#13+
                                                                 '                ( :P_OU_HR_HORARIO BETWEEN CAD_HORARIOBLOQUEIO.HR_INICIO AND CAD_HORARIOBLOQUEIO.HR_FIM )'+#13+
                                                                 '          ORDER BY CAD_HORARIOBLOQUEIO.DT_FIM ASC, CAD_HORARIOBLOQUEIO.HR_FIM ASC'+#13+
                                                                 '          INTO :VAR_DS_MOTIVOBLOQUEIO'+#13+
                                                                 '      DO'+#13+
                                                                 '      BEGIN'+#13+
                                                                 ''+#13+
                                                                 '        VAR_FG_BLOQUEAR = VAR_FG_BLOQUEAR + 1;'+#13+
                                                                 ''+#13+
                                                                 '      END'+#13+
                                                                 ''+#13+
                                                                 '      IF ( :VAR_FG_BLOQUEAR > 0 ) THEN'+#13+
                                                                 '      BEGIN'+#13+
                                                                 '        P_OU_FG_TIPO = ''BLOQUEADO'';'+#13+
                                                                 '        P_OU_DS_NOME = :VAR_DS_MOTIVOBLOQUEIO;'+#13+
                                                                 '      END*/'+#13+
                                                                 ''+#13+
                                                                 '      SUSPEND;'+#13+
                                                                 ''+#13+
                                                                 '    END'+#13+
                                                                 ''+#13+
                                                                 '    IF ( :VAR_NR_CONTADOR > 23 ) THEN'+#13+
                                                                 '      BREAK;'+#13+
                                                                 ''+#13+
                                                                 '  END'+#13+
                                                                 ''+#13+
                                                                 '  VAR_NR_CONTADOR = 0;'+#13+
                                                                 ''+#13+
                                                                 '  WHILE ( :VAR_HR_ENTRADAINTERVALO < :VAR_HR_SAIDA ) DO'+#13+
                                                                 '  BEGIN'+#13+
                                                                 ''+#13+
                                                                 '    VAR_FG_SUSPEND = 1;'+#13+
                                                                 ''+#13+
                                                                 '    P_OU_ID_ATENDIMENTO         = NULL;'+#13+
                                                                 '    P_OU_CD_PROFISSIONAL        = NULL;'+#13+
                                                                 '    P_OU_CD_CLIENTE             = NULL;'+#13+
                                                                 '    P_OU_DT_ATENDIMENTO         = NULL;'+#13+
                                                                 '    P_OU_HR_ATENDIMENTO         = NULL;'+#13+
                                                                 '    P_OU_DS_NOME                = NULL;'+#13+
                                                                 '    P_OU_FG_STATUS              = NULL;'+#13+
                                                                 '    P_OU_DS_ANOTACAO            = NULL;'+#13+
                                                                 '    P_OU_NR_TELEFONERESIDENCIAL = NULL;'+#13+
                                                                 '    P_OU_NR_TELEFONECOMERCIAL   = NULL;'+#13+
                                                                 '    P_OU_NR_CELULAR             = NULL;'+#13+
                                                                 ''+#13+
                                                                 '    IF ( ( :VAR_DS_FERIADO IS NOT NULL ) AND ( :VAR_DS_FERIADO <> '''' ) ) THEN'+#13+
                                                                 '    BEGIN'+#13+
                                                                 '      P_OU_DS_NOME = :VAR_DS_FERIADO;'+#13+
                                                                 '    END'+#13+
                                                                 ''+#13+
                                                                 '    P_OU_HR_HORARIO = :VAR_HR_ENTRADAINTERVALO;'+#13+
                                                                 ''+#13+
                                                                 '    VAR_HORA   = EXTRACT( HOUR   FROM :VAR_HR_ENTRADAINTERVALO );'+#13+
                                                                 '    VAR_MINUTO = EXTRACT( MINUTE FROM :VAR_HR_ENTRADAINTERVALO );'+#13+
                                                                 ''+#13+
                                                                 '    VAR_MINUTO = :VAR_MINUTO + :VAR_NR_INTERVALO;'+#13+
                                                                 '    IF ( :VAR_MINUTO > 59 ) THEN'+#13+
                                                                 '    BEGIN'+#13+
                                                                 ''+#13+
                                                                 '      VAR_HORA = :VAR_HORA + 1;'+#13+
                                                                 '      VAR_NR_CONTADOR = :VAR_HORA;'+#13+
                                                                 '      IF ( :VAR_HORA > 23 ) THEN'+#13+
                                                                 '        VAR_HORA = 0;'+#13+
                                                                 ''+#13+
                                                                 '      VAR_MINUTO = 60 - :VAR_MINUTO;'+#13+
                                                                 '      IF ( :VAR_MINUTO < 0 ) THEN'+#13+
                                                                 '        VAR_MINUTO = ( VAR_MINUTO * -1);'+#13+
                                                                 ''+#13+
                                                                 '    END'+#13+
                                                                 ''+#13+
                                                                 '    VAR_HR_ENTRADAINTERVALO = CAST( :VAR_HORA || '':'' || :VAR_MINUTO || '':00'' AS TIME );'+#13+
                                                                 ''+#13+
                                                                 '    IF ( :P_OU_HR_HORARIO BETWEEN CAST( ''00:00:00'' AS TIME ) AND CAST( ''05:59:00'' AS TIME ) ) THEN'+#13+
                                                                 '      P_OU_ID_PERIODO = 1;'+#13+
                                                                 '    ELSE IF ( :P_OU_HR_HORARIO BETWEEN CAST( ''06:00:00'' AS TIME ) AND CAST( ''11:59:00'' AS TIME ) ) THEN'+#13+
                                                                 '      P_OU_ID_PERIODO = 2;'+#13+
                                                                 '    ELSE IF ( :P_OU_HR_HORARIO BETWEEN CAST( ''12:00:00'' AS TIME ) AND CAST( ''17:59:00'' AS TIME ) ) THEN'+#13+
                                                                 '      P_OU_ID_PERIODO = 3;'+#13+
                                                                 '    ELSE IF ( :P_OU_HR_HORARIO BETWEEN CAST( ''18:00:00'' AS TIME ) AND CAST( ''23:59:00'' AS TIME ) ) THEN'+#13+
                                                                 '      P_OU_ID_PERIODO = 4;'+#13+
                                                                 ''+#13+
                                                                 '    FOR SELECT FIRST 1 CAD_ATENDIMENTO.HR_ATENDIMENTO'+#13+
                                                                 '        FROM CAD_ATENDIMENTO'+#13+
                                                                 '        WHERE CAD_ATENDIMENTO.CD_PROFISSIONAL = :P_IN_CD_PROFISSIONAL AND'+#13+
                                                                 '              CAD_ATENDIMENTO.DT_ATENDIMENTO = :P_IN_DT_REFERENCIA AND'+#13+
                                                                 '              ( CAD_ATENDIMENTO.HR_ATENDIMENTO >= :P_OU_HR_HORARIO AND CAD_ATENDIMENTO.HR_ATENDIMENTO < :VAR_HR_ENTRADAINTERVALO )'+#13+
                                                                 '        ORDER BY CAD_ATENDIMENTO.HR_ATENDIMENTO'+#13+
                                                                 '        INTO :VAR_HR_CONSULTA'+#13+
                                                                 '    DO'+#13+
                                                                 '    BEGIN'+#13+
                                                                 ''+#13+
                                                                 '      IF ( :P_OU_HR_HORARIO <> :VAR_HR_CONSULTA ) THEN'+#13+
                                                                 '        SUSPEND;'+#13+
                                                                 ''+#13+
                                                                 '      BREAK;'+#13+
                                                                 ''+#13+
                                                                 '    END'+#13+
                                                                 ''+#13+
                                                                 '    FOR SELECT CAD_ATENDIMENTO.ID_ATENDIMENTO,'+#13+
                                                                 '               CAD_ATENDIMENTO.CD_PROFISSIONAL,'+#13+
                                                                 '               CAD_ATENDIMENTO.CD_CLIENTE,'+#13+
                                                                 '               CAD_ATENDIMENTO.DT_ATENDIMENTO,'+#13+
                                                                 '               CAD_ATENDIMENTO.HR_ATENDIMENTO,'+#13+
                                                                 '               CAD_ATENDIMENTO.FG_STATUS,'+#13+
                                                                 '               CAD_ATENDIMENTO.DS_ANOTACAO,'+#13+
                                                                 '               CAD_CLIENTE.DS_NOME,'+#13+
                                                                 '               COALESCE(CAD_CLIENTE.NR_TELEFONERESIDENCIAL, CAD_ATENDIMENTO.NR_TELEFONERESIDENCIAL),'+#13+
                                                                 '               CAD_CLIENTE.NR_TELEFONECOMERCIAL,'+#13+
                                                                 '               COALESCE(CAD_CLIENTE.NR_CELULAR, CAD_ATENDIMENTO.NR_CELULAR)'+#13+
                                                                 '        FROM CAD_ATENDIMENTO'+#13+
                                                                 '        LEFT JOIN CAD_CLIENTE ON(CAD_CLIENTE.CD_CLIENTE = CAD_ATENDIMENTO.CD_CLIENTE)'+#13+
                                                                 '        WHERE CAD_ATENDIMENTO.CD_PROFISSIONAL = :P_IN_CD_PROFISSIONAL AND'+#13+
                                                                 '              CAD_ATENDIMENTO.DT_ATENDIMENTO = :P_IN_DT_REFERENCIA AND'+#13+
                                                                 '              ( CAD_ATENDIMENTO.HR_ATENDIMENTO >= :P_OU_HR_HORARIO AND CAD_ATENDIMENTO.HR_ATENDIMENTO < :VAR_HR_ENTRADAINTERVALO )'+#13+
                                                                 '        ORDER BY CAD_ATENDIMENTO.HR_ATENDIMENTO ASC'+#13+
                                                                 '        INTO :P_OU_ID_ATENDIMENTO,'+#13+
                                                                 '             :P_OU_CD_PROFISSIONAL,'+#13+
                                                                 '             :P_OU_CD_CLIENTE,'+#13+
                                                                 '             :P_OU_DT_ATENDIMENTO,'+#13+
                                                                 '             :P_OU_HR_ATENDIMENTO,'+#13+
                                                                 '             :P_OU_FG_STATUS,'+#13+
                                                                 '             :P_OU_DS_ANOTACAO,'+#13+
                                                                 '             :P_OU_DS_NOME,'+#13+
                                                                 '             :P_OU_NR_TELEFONERESIDENCIAL,'+#13+
                                                                 '             :P_OU_NR_TELEFONECOMERCIAL,'+#13+
                                                                 '             :P_OU_NR_CELULAR'+#13+
                                                                 '    DO'+#13+
                                                                 '    BEGIN'+#13+
                                                                 ''+#13+
                                                                 '      VAR_FG_SUSPEND = 2;'+#13+
                                                                 ''+#13+
                                                                 '      IF ( :P_OU_HR_HORARIO <> :P_OU_HR_ATENDIMENTO ) THEN'+#13+
                                                                 '        P_OU_HR_HORARIO = :P_OU_HR_ATENDIMENTO;'+#13+
                                                                 ''+#13+
                                                                 '      SUSPEND;'+#13+
                                                                 ''+#13+
                                                                 '    END'+#13+
                                                                 ''+#13+
                                                                 '    IF ( :VAR_FG_SUSPEND = 1 ) THEN'+#13+
                                                                 '    BEGIN'+#13+
                                                                 ''+#13+
                                                                 '      /*VAR_FG_BLOQUEAR = 0;'+#13+
                                                                 ''+#13+
                                                                 '      FOR SELECT CAD_HORARIOBLOQUEIO.DS_MOTIVO'+#13+
                                                                 '          FROM CAD_HORARIOBLOQUEIO'+#13+
                                                                 '          WHERE ( CAD_HORARIOBLOQUEIO.CD_PROFISSIONAL = :P_IN_CD_PROFISSIONAL ) AND'+#13+
                                                                 '                ( :P_IN_DT_REFERENCIA BETWEEN CAD_HORARIOBLOQUEIO.DT_INICIO AND CAD_HORARIOBLOQUEIO.DT_FIM ) AND'+#13+
                                                                 '                ( :P_OU_HR_HORARIO BETWEEN CAD_HORARIOBLOQUEIO.HR_INICIO AND CAD_HORARIOBLOQUEIO.HR_FIM )'+#13+
                                                                 '          ORDER BY CAD_HORARIOBLOQUEIO.DT_FIM ASC, CAD_HORARIOBLOQUEIO.HR_FIM ASC'+#13+
                                                                 '          INTO :VAR_DS_MOTIVOBLOQUEIO'+#13+
                                                                 '      DO'+#13+
                                                                 '      BEGIN'+#13+
                                                                 ''+#13+
                                                                 '        VAR_FG_BLOQUEAR = VAR_FG_BLOQUEAR + 1;'+#13+
                                                                 ''+#13+
                                                                 '      END'+#13+
                                                                 ''+#13+
                                                                 '      IF ( :VAR_FG_BLOQUEAR > 0 ) THEN'+#13+
                                                                 '      BEGIN'+#13+
                                                                 '        P_OU_DS_NOME = :VAR_DS_MOTIVOBLOQUEIO;'+#13+
                                                                 '      END */'+#13+
                                                                 ''+#13+
                                                                 '      SUSPEND;'+#13+
                                                                 ''+#13+
                                                                 '    END'+#13+
                                                                 ''+#13+
                                                                 '    IF ( :VAR_NR_CONTADOR > 23 ) THEN'+#13+
                                                                 '      BREAK;'+#13+
                                                                 ''+#13+
                                                                 '  END'+#13+
                                                                 ''+#13+
                                                                 'END^'+#13+
                                                                 ''+#13+
                                                                 'SET TERM ; ^'+#13+
                                                                 ''+#13+
                                                                 'SET TERM ^ ;'+#13+
                                                                 ''+#13+
                                                                 'create or alter procedure STRDPRC_RETORNAAGENDASEMANA ('+#13+
                                                                 '    P_IN_CD_PROFISSIONAL integer,'+#13+
                                                                 '    P_IN_DT_REFERENCIAINICIO date,'+#13+
                                                                 '    P_IN_DT_REFERENCIAFIM date)'+#13+
                                                                 'returns ('+#13+
                                                                 '    P_OU_ID_PERIODO integer,'+#13+
                                                                 '    P_OU_FG_DOMINGO integer,'+#13+
                                                                 '    P_OU_FG_SEGUNDA integer,'+#13+
                                                                 '    P_OU_FG_TERCA integer,'+#13+
                                                                 '    P_OU_FG_QUARTA integer,'+#13+
                                                                 '    P_OU_FG_QUINTA integer,'+#13+
                                                                 '    P_OU_FG_SEXTA integer,'+#13+
                                                                 '    P_OU_FG_SABADO integer)'+#13+
                                                                 'as'+#13+
                                                                 'declare variable VAR_DT_CONSULTA date;'+#13+
                                                                 'declare variable VAR_INDEX integer;'+#13+
                                                                 'BEGIN'+#13+
                                                                 ''+#13+
                                                                 '  VAR_INDEX = 1;'+#13+
                                                                 ''+#13+
                                                                 '  WHILE ( :VAR_INDEX <= 4 ) DO'+#13+
                                                                 '  BEGIN'+#13+
                                                                 ''+#13+
                                                                 '    P_OU_FG_DOMINGO = NULL;'+#13+
                                                                 '    P_OU_FG_SEGUNDA = NULL;'+#13+
                                                                 '    P_OU_FG_TERCA   = NULL;'+#13+
                                                                 '    P_OU_FG_QUARTA  = NULL;'+#13+
                                                                 '    P_OU_FG_QUINTA  = NULL;'+#13+
                                                                 '    P_OU_FG_SEXTA   = NULL;'+#13+
                                                                 '    P_OU_FG_SABADO  = NULL;'+#13+
                                                                 ''+#13+
                                                                 '    P_OU_ID_PERIODO = :VAR_INDEX;'+#13+
                                                                 ''+#13+
                                                                 '    FOR SELECT CAD_ATENDIMENTO.DT_ATENDIMENTO'+#13+
                                                                 '        FROM CAD_ATENDIMENTO'+#13+
                                                                 '        WHERE CAD_ATENDIMENTO.CD_PROFISSIONAL = :P_IN_CD_PROFISSIONAL AND'+#13+
                                                                 '              ( CAD_ATENDIMENTO.DT_ATENDIMENTO BETWEEN :P_IN_DT_REFERENCIAINICIO AND :P_IN_DT_REFERENCIAFIM ) AND'+#13+
                                                                 '              ('+#13+
                                                                 '                ( ( :P_OU_ID_PERIODO = 1 ) AND ( CAD_ATENDIMENTO.HR_ATENDIMENTO BETWEEN CAST( ''00:00:00'' AS TIME ) AND CAST( ''05:59:59'' AS TIME ) ) ) OR'+#13+
                                                                 '                ( ( :P_OU_ID_PERIODO = 2 ) AND ( CAD_ATENDIMENTO.HR_ATENDIMENTO BETWEEN CAST( ''06:00:00'' AS TIME ) AND CAST( ''11:59:59'' AS TIME ) ) ) OR'+#13+
                                                                 '                ( ( :P_OU_ID_PERIODO = 3 ) AND ( CAD_ATENDIMENTO.HR_ATENDIMENTO BETWEEN CAST( ''12:00:00'' AS TIME ) AND CAST( ''17:59:59'' AS TIME ) ) ) OR'+#13+
                                                                 '                ( ( :P_OU_ID_PERIODO = 4 ) AND ( CAD_ATENDIMENTO.HR_ATENDIMENTO BETWEEN CAST( ''18:00:00'' AS TIME ) AND CAST( ''23:59:59'' AS TIME ) ) )'+#13+
                                                                 '              )'+#13+
                                                                 '        GROUP BY 1'+#13+
                                                                 '        INTO :VAR_DT_CONSULTA'+#13+
                                                                 '    DO'+#13+
                                                                 '    BEGIN'+#13+
                                                                 ''+#13+
                                                                 '      IF ( EXTRACT(WEEKDAY FROM :VAR_DT_CONSULTA) = 0 ) THEN'+#13+
                                                                 '        P_OU_FG_DOMINGO = 1;'+#13+
                                                                 '      ELSE IF ( EXTRACT(WEEKDAY FROM :VAR_DT_CONSULTA) = 1 ) THEN'+#13+
                                                                 '        P_OU_FG_SEGUNDA = 1;'+#13+
                                                                 '      ELSE IF ( EXTRACT(WEEKDAY FROM :VAR_DT_CONSULTA) = 2 ) THEN'+#13+
                                                                 '        P_OU_FG_TERCA = 1;'+#13+
                                                                 '      ELSE IF ( EXTRACT(WEEKDAY FROM :VAR_DT_CONSULTA) = 3 ) THEN'+#13+
                                                                 '        P_OU_FG_QUARTA = 1;'+#13+
                                                                 '      ELSE IF ( EXTRACT(WEEKDAY FROM :VAR_DT_CONSULTA) = 4 ) THEN'+#13+
                                                                 '        P_OU_FG_QUINTA = 1;'+#13+
                                                                 '      ELSE IF ( EXTRACT(WEEKDAY FROM :VAR_DT_CONSULTA) = 5 ) THEN'+#13+
                                                                 '        P_OU_FG_SEXTA = 1;'+#13+
                                                                 '      ELSE IF ( EXTRACT(WEEKDAY FROM :VAR_DT_CONSULTA) = 6 ) THEN'+#13+
                                                                 '        P_OU_FG_SABADO = 1;'+#13+
                                                                 ''+#13+
                                                                 '    END'+#13+
                                                                 ''+#13+
                                                                 '    VAR_INDEX = :VAR_INDEX + 1;'+#13+
                                                                 ''+#13+
                                                                 '    SUSPEND;'+#13+
                                                                 ''+#13+
                                                                 '  END'+#13+
                                                                 ''+#13+
                                                                 'END^'+#13+
                                                                 ''+#13+
                                                                 'SET TERM ; ^'+#13+
                                                                 ''+#13+
                                                                 'SET TERM ^ ;'+#13+
                                                                 ''+#13+
                                                                 'create or alter procedure STRDPRC_VALIDAHORAATENDIMENTO ('+#13+
                                                                 '    P_IN_CD_PROFISSIONAL integer,'+#13+
                                                                 '    P_IN_HR_REFERENCIA time)'+#13+
                                                                 'returns ('+#13+
                                                                 '    P_OU_FG_VALIDACAO char(3))'+#13+
                                                                 'as'+#13+
                                                                 'declare variable VAR_HR_ENTRADA time;'+#13+
                                                                 'declare variable VAR_HR_SAIDAINTERVALO time;'+#13+
                                                                 'declare variable VAR_HR_ENTRADAINTERVALO time;'+#13+
                                                                 'declare variable VAR_HR_SAIDA time;'+#13+
                                                                 'BEGIN'+#13+
                                                                 ''+#13+
                                                                 '  P_OU_FG_VALIDACAO = ''NAO'';'+#13+
                                                                 ''+#13+
                                                                 '  SELECT MIN( CAD_PROFISSIONALHORARIO.HR_ENTRADA ),'+#13+
                                                                 '         MAX( CAD_PROFISSIONALHORARIO.HR_SAIDAINTERVALO ),'+#13+
                                                                 '         MIN( CAD_PROFISSIONALHORARIO.HR_ENTRADAINTERVALO ),'+#13+
                                                                 '         MAX( CAD_PROFISSIONALHORARIO.HR_SAIDA )'+#13+
                                                                 '  FROM CAD_PROFISSIONALHORARIO'+#13+
                                                                 '  WHERE CAD_PROFISSIONALHORARIO.CD_PROFISSIONAL = :P_IN_CD_PROFISSIONAL'+#13+
                                                                 '  INTO :VAR_HR_ENTRADA,'+#13+
                                                                 '       :VAR_HR_SAIDAINTERVALO,'+#13+
                                                                 '       :VAR_HR_ENTRADAINTERVALO,'+#13+
                                                                 '       :VAR_HR_SAIDA;'+#13+
                                                                 ''+#13+
                                                                 '  IF ('+#13+
                                                                 '       ( :P_IN_HR_REFERENCIA BETWEEN :VAR_HR_ENTRADA AND :VAR_HR_SAIDAINTERVALO ) OR'+#13+
                                                                 '       ( :P_IN_HR_REFERENCIA BETWEEN :VAR_HR_ENTRADAINTERVALO AND :VAR_HR_SAIDA )'+#13+
                                                                 '     ) THEN'+#13+
                                                                 '    P_OU_FG_VALIDACAO = ''SIM'';'+#13+
                                                                 ''+#13+
                                                                 '  IF ('+#13+
                                                                 '       ( :VAR_HR_SAIDAINTERVALO IS NULL AND :VAR_HR_ENTRADAINTERVALO IS NULL ) AND'+#13+
                                                                 '       ( :P_IN_HR_REFERENCIA BETWEEN :VAR_HR_ENTRADA AND :VAR_HR_SAIDA )'+#13+
                                                                 '     ) THEN'+#13+
                                                                 '    P_OU_FG_VALIDACAO = ''SIM'';'+#13+
                                                                 ''+#13+
                                                                 '  SUSPEND;'+#13+
                                                                 ''+#13+
                                                                 'END^'+#13+
                                                                 ''+#13+
                                                                 'SET TERM ; ^'+#13+
                                                                 'DELETE FROM CAD_CONTROLEVERSAO;'+#13+
                                                                 'INSERT INTO CAD_CONTROLEVERSAO (NR_VERSAOSISTEMA, NR_BUILDSISTEMA, DT_SISTEMA, NR_VERSAOBANCO, DT_BANCO) VALUES (''1.0.6'', ''20200201'', ''1-FEB-2020'', 6, ''1-FEB-2020'');'+#13+
                                                                 'COMMIT WORK;' )
                                             );

implementation

end.
