[Setup]
AppName                 = AonVendas - Versão 1.0.6, 01/02/2020 - Build 20200201
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
Name: _Servidor; Description: Instalação no Servidor
Name: _Cliente; Description: Instalação em Estações de Trabalho

[Components]
Name: Servidor; Description: AonVendas servidor; Types: _Servidor
Name: Cliente; Description: AonVendas cliente; Types: _Cliente

[Languages]
Name: default; MessagesFile: compiler:Languages\Brasil.isl

[LangOptions]
TitleFontSize=1

[Messages]
WelcomeLabel1            = Bem-vindo ao Assistente de Instalação dos Sistemas da Aon.
WelcomeLabel2            = Este programa irá instalar o [name] no seu computador.%n%nÉ recomendado que você feche as aplicações abertas antes de continuar. Isto evitará conflitos durante a instalação.
WizardReady              = Iniciar a instalação
ReadyLabel1              = Reveja as configurações antes de iniciar a instalação do [name]
ReadyLabel2a             = O Instalador Aon possui informações suficientes para começar a instalar. Se desejar rever ou alterar alguma configuração clique em Voltar. Se você estiver satisfeito com as configurações clique em Instalar para iniciar o processo.
InstallingLabel          = Aguarde um momento, por favor. O [name] está sendo instalado
FinishedHeadingLabel     = Instalação Concluída
FinishedLabelNoIcons     = O Instalador Aon instalou o [name] com sucesso.
ClickFinish              = Clique em concluir para finalizar.
WizardSelectComponents   = Tipo de Instalação
SelectComponentsDesc     = Selecione o Tipo de Instalação:
SelectComponentsLabel2   = Informe:%n%n    - Instalação no Servidor : Quando esta estação for a Servidora de Banco de Dados (AONVENDAS.FDB); ou %n%n    - Instalação em Estações de Trabalho : Quando a estação Servidora de Banco de Dados (AONVENDAS.FDB) for outra máquina da Rede.
SetupAppRunningError     = O Assistente de Instalação detectou que o Sistema está em execução.%n%nPor favor, finalize-o agora, e então clique em OK para continuar, ou Cancelar para não instalar.
UninstallAppRunningError = O Assistente de desinstalação detectou que o Sistema está em execução.%n%nPor favor, finalize-o agora, e então clique em OK para continuar, ou Cancelar para não desinstalar.
SetupAppTitle            = Assistente de Instalação dos Sistemas da Aon
UninstallAppTitle        = Assistente de Desinstalação dos Sistemas da Aon

[Tasks]
Name: desktopicon; Description: Criar ícone na área de trabalho; GroupDescription: Atalhos
Name: quicklaunchicon; Description: Criar ícone de inicialização rápida; Flags: unchecked; GroupDescription: Atalhos

[Files]
;Icone ( É utilizado no painel de controle, desinstalação )
Source: C:\Aon\Vendas\instalacao\imagens\aon.ico; DestDir: {pf}\Aon\AonVendas; Flags: replacesameversion

; Arquivos do Sistema
Source: C:\Aon\Vendas\instalacao\Arquivos\AonVendas.exe; DestDir  : {pf}\Aon\AonVendas; Flags: ignoreversion
Source: C:\Aon\Vendas\instalacao\Arquivos\Calculadora.exe; DestDir: {pf}\Aon\AonVendas; Flags: replacesameversion
Source: C:\Aon\Vendas\instalacao\Arquivos\AONVENDAS.FDB; DestDir  : {pf}\Aon\AonVendas\FDB; Components: Servidor; Flags: uninsneveruninstall promptifolder onlyifdoesntexist

; Arquivos Auxiliares e de Configuração
Source: C:\Aon\Vendas\instalacao\Arquivos\dll\fbclient.dll; DestDir: {pf}\Aon\AonVendas; Flags: onlyifdoesntexist
Source: C:\Aon\Vendas\instalacao\Arquivos\dll\midas.dll; DestDir   : {sys}; Flags: sharedfile
Source: C:\Aon\Vendas\instalacao\Arquivos\dll\dbexpint.dll; DestDir: {sys}; Flags: sharedfile
Source: C:\Aon\Vendas\instalacao\Arquivos\dll\qtintf.dll; DestDir  : {sys}; Flags: sharedfile

; Arquivo de configuração
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
