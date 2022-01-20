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
OutputBaseFileName      = UpdateAonVendas
SetupIconFile           = C:\Aon\Vendas\instalacao\imagens\aon.ico
UninstallDisplayIcon    = {pf}\Aon\AonVendas\aon.ico

[Languages]
Name: default; MessagesFile: compiler:Languages\Brasil.isl

[LangOptions]
TitleFontSize = 1

[Messages]
SetupAppTitle         = Assistente de Atualização dos Sistemas da Aon
SetupWindowTitle      = Programa de Atualização - Aon
WelcomeLabel1         = Bem-vindo ao Assistente de Atualização dos Sistemas da Aon.
WelcomeLabel2         = Este programa irá atualizar o [name] no seu computador.%n%nÉ recomendado que você feche as aplicações abertas antes de continuar. Isto evitará conflitos durante a atualização.
WizardReady           = Iniciar a atualização
ReadyLabel1           = Reveja as configurações antes de iniciar a atualização do [name]
ReadyLabel2a          = O Atualizador Aon possui informações suficientes para começar a atualizar. Se desejar rever ou alterar alguma configuração clique em Voltar. Se você estiver satisfeito com as configurações clique em Atualizar para iniciar o processo.
InstallingLabel       = Aguarde um momento, por favor. O [name] está sendo atualizado
FinishedHeadingLabel  = Atualização Concluída
FinishedLabelNoIcons  = O Atualizador Aon atualizou o [name] com sucesso.

[Files]
; Arquivos do Sistema
Source: C:\Aon\Vendas\instalacao\Arquivos\AonVendas.exe  ; DestDir: {pf}\Aon\AonVendas; Flags: ignoreversion
Source: C:\Aon\Vendas\instalacao\Arquivos\Calculadora.exe; DestDir: {pf}\Aon\AonVendas; Flags: replacesameversion

; Arquivos Auxiliares e de Configuração
Source: C:\Aon\Vendas\instalacao\Arquivos\dll\fbclient.dll; DestDir: {pf}\Aon\AonVendas; Flags: onlyifdoesntexist
Source: C:\Aon\Vendas\instalacao\Arquivos\dll\midas.dll; DestDir   : {sys}; Flags: sharedfile
Source: C:\Aon\Vendas\instalacao\Arquivos\dll\dbexpint.dll; DestDir: {sys}; Flags: sharedfile
Source: C:\Aon\Vendas\instalacao\Arquivos\dll\qtintf.dll; DestDir  : {sys}; Flags: sharedfile
