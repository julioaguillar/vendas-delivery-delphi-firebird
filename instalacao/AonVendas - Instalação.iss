[Setup]
AppName                 = AonVendas - Vers�o 1.0.6, 01/02/2020 - Build 20200201
AppID                   = AonVendas
AppVerName              = AonVendas
AppPublisher            = Aon
AppPublisherURL         = www.aonsistemas.com.br
AppSupportURL           = www.aonsistemas.com.br
AppUpdatesURL           = www.aonsistemas.com.br
DefaultDirName          = {pf}\Aon\AonVendas
DefaultGroupName        = Aon
DisableDirPage          = yes
DisableProgramGroupPage = yes
OutputDir               = C:\Aon\Vendas\instalacao\exe
SolidCompression        = true
WindowShowCaption       = no
ShowLanguageDialog      = no
LanguageDetectionMethod = none
OutputBaseFileName      = InstallAonVendas
SetupIconFile           = C:\Aon\Vendas\instalacao\imagens\aon.ico
UninstallDisplayIcon    = {pf}\Aon\AonVendas\aon.ico

[Types]
Name: _Servidor; Description: Instala��o no Servidor
Name: _Cliente; Description: Instala��o em Esta��es de Trabalho

[Components]
Name: Servidor; Description: AonVendas servidor; Types: _Servidor
Name: Cliente; Description: AonVendas cliente; Types: _Cliente

[Languages]
Name: default; MessagesFile: compiler:Languages\Brasil.isl

[LangOptions]
TitleFontSize=1

[Messages]
WelcomeLabel1            = Bem-vindo ao Assistente de Instala��o dos Sistemas da Aon.
WelcomeLabel2            = Este programa ir� instalar o [name] no seu computador.%n%n� recomendado que voc� feche as aplica��es abertas antes de continuar. Isto evitar� conflitos durante a instala��o.
WizardReady              = Iniciar a instala��o
ReadyLabel1              = Reveja as configura��es antes de iniciar a instala��o do [name]
ReadyLabel2a             = O Instalador Aon possui informa��es suficientes para come�ar a instalar. Se desejar rever ou alterar alguma configura��o clique em Voltar. Se voc� estiver satisfeito com as configura��es clique em Instalar para iniciar o processo.
InstallingLabel          = Aguarde um momento, por favor. O [name] est� sendo instalado
FinishedHeadingLabel     = Instala��o Conclu�da
FinishedLabelNoIcons     = O Instalador Aon instalou o [name] com sucesso.
ClickFinish              = Clique em concluir para finalizar.
WizardSelectComponents   = Tipo de Instala��o
SelectComponentsDesc     = Selecione o Tipo de Instala��o:
SelectComponentsLabel2   = Informe:%n%n    - Instala��o no Servidor : Quando esta esta��o for a Servidora de Banco de Dados (AONVENDAS.FDB); ou %n%n    - Instala��o em Esta��es de Trabalho : Quando a esta��o Servidora de Banco de Dados (AONVENDAS.FDB) for outra m�quina da Rede.
SetupAppRunningError     = O Assistente de Instala��o detectou que o Sistema est� em execu��o.%n%nPor favor, finalize-o agora, e ent�o clique em OK para continuar, ou Cancelar para n�o instalar.
UninstallAppRunningError = O Assistente de desinstala��o detectou que o Sistema est� em execu��o.%n%nPor favor, finalize-o agora, e ent�o clique em OK para continuar, ou Cancelar para n�o desinstalar.
SetupAppTitle            = Assistente de Instala��o dos Sistemas da Aon
UninstallAppTitle        = Assistente de Desinstala��o dos Sistemas da Aon

[Tasks]
Name: desktopicon; Description: Criar �cone na �rea de trabalho; GroupDescription: Atalhos
Name: quicklaunchicon; Description: Criar �cone de inicializa��o r�pida; Flags: unchecked; GroupDescription: Atalhos

[Files]
;Icone ( � utilizado no painel de controle, desinstala��o )
Source: C:\Aon\Vendas\instalacao\imagens\aon.ico; DestDir: {pf}\Aon\AonVendas; Flags: replacesameversion

; Arquivos do Sistema
Source: C:\Aon\Vendas\instalacao\Arquivos\AonVendas.exe; DestDir  : {pf}\Aon\AonVendas; Flags: ignoreversion
Source: C:\Aon\Vendas\instalacao\Arquivos\Calculadora.exe; DestDir: {pf}\Aon\AonVendas; Flags: replacesameversion
Source: C:\Aon\Vendas\instalacao\Arquivos\AONVENDAS.FDB; DestDir  : {pf}\Aon\AonVendas\FDB; Components: Servidor; Flags: uninsneveruninstall promptifolder onlyifdoesntexist

; Arquivos Auxiliares e de Configura��o
Source: C:\Aon\Vendas\instalacao\Arquivos\dll\fbclient.dll; DestDir: {pf}\Aon\AonVendas; Flags: onlyifdoesntexist
Source: C:\Aon\Vendas\instalacao\Arquivos\dll\midas.dll; DestDir   : {sys}; Flags: sharedfile
Source: C:\Aon\Vendas\instalacao\Arquivos\dll\dbexpint.dll; DestDir: {sys}; Flags: sharedfile
Source: C:\Aon\Vendas\instalacao\Arquivos\dll\qtintf.dll; DestDir  : {sys}; Flags: sharedfile

; Arquivo de configura��o
Source: C:\Aon\Vendas\instalacao\Arquivos\parametros.ini; DestDir: {commonappdata}\Aon\AonVendas; Flags: onlyifdoesntexist;

[INI]
Filename: {commonappdata}\Aon\AonVendas\parametros.ini; Section: Conexao; Key: Servidor;     String: 127.0.0.1;              Flags: createkeyifdoesntexist;
Filename: {commonappdata}\Aon\AonVendas\parametros.ini; Section: Conexao; Key: CaminhoBanco; String: {pf}\Aon\AonVendas\FDB; Flags: createkeyifdoesntexist;
Filename: {commonappdata}\Aon\AonVendas\parametros.ini; Section: Conexao; Key: Porta;        String: 3052;                   Flags: createkeyifdoesntexist;

[Icons]
Name: {group}\Aon; Filename: {pf}\Aon\AonVendas\AonVendas.exe; IconFilename: {pf}\Aon\AonVendas\aon.ico; IconIndex: 0
Name: {userdesktop}\AonVendas; Filename: {pf}\Aon\AonVendas\AonVendas.exe; Tasks: desktopicon

[UninstallDelete]
type: files; Name: {app}\fbclient.dll
type: files; Name: {app}\anotacao.xml
