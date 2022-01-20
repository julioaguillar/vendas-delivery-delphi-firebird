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
OutputBaseFileName      = UpdateAonVendas
SetupIconFile           = C:\Aon\Vendas\instalacao\imagens\aon.ico
UninstallDisplayIcon    = {pf}\Aon\AonVendas\aon.ico

[Languages]
Name: default; MessagesFile: compiler:Languages\Brasil.isl

[LangOptions]
TitleFontSize = 1

[Messages]
SetupAppTitle         = Assistente de Atualiza��o dos Sistemas da Aon
SetupWindowTitle      = Programa de Atualiza��o - Aon
WelcomeLabel1         = Bem-vindo ao Assistente de Atualiza��o dos Sistemas da Aon.
WelcomeLabel2         = Este programa ir� atualizar o [name] no seu computador.%n%n� recomendado que voc� feche as aplica��es abertas antes de continuar. Isto evitar� conflitos durante a atualiza��o.
WizardReady           = Iniciar a atualiza��o
ReadyLabel1           = Reveja as configura��es antes de iniciar a atualiza��o do [name]
ReadyLabel2a          = O Atualizador Aon possui informa��es suficientes para come�ar a atualizar. Se desejar rever ou alterar alguma configura��o clique em Voltar. Se voc� estiver satisfeito com as configura��es clique em Atualizar para iniciar o processo.
InstallingLabel       = Aguarde um momento, por favor. O [name] est� sendo atualizado
FinishedHeadingLabel  = Atualiza��o Conclu�da
FinishedLabelNoIcons  = O Atualizador Aon atualizou o [name] com sucesso.

[Files]
; Arquivos do Sistema
Source: C:\Aon\Vendas\instalacao\Arquivos\AonVendas.exe  ; DestDir: {pf}\Aon\AonVendas; Flags: ignoreversion
Source: C:\Aon\Vendas\instalacao\Arquivos\Calculadora.exe; DestDir: {pf}\Aon\AonVendas; Flags: replacesameversion

; Arquivos Auxiliares e de Configura��o
Source: C:\Aon\Vendas\instalacao\Arquivos\dll\fbclient.dll; DestDir: {pf}\Aon\AonVendas; Flags: onlyifdoesntexist
Source: C:\Aon\Vendas\instalacao\Arquivos\dll\midas.dll; DestDir   : {sys}; Flags: sharedfile
Source: C:\Aon\Vendas\instalacao\Arquivos\dll\dbexpint.dll; DestDir: {sys}; Flags: sharedfile
Source: C:\Aon\Vendas\instalacao\Arquivos\dll\qtintf.dll; DestDir  : {sys}; Flags: sharedfile
