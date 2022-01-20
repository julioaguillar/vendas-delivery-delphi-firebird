#define BaseVer "2_5_2_AON"
#define MyAppName "Firebird Database Server 2.5.2 (AON)"
#define MyAppVerName "Firebird Database Server 2.5.2 (AON)"

[Setup]
AppName                 = {#MyAppName}
AppVerName              = {#MyAppVerName}
DefaultDirName          = {pf}\Firebird\Firebird_{#BaseVer}
DisableDirPage          = yes
DefaultGroupName        = {#MyAppName}
DisableProgramGroupPage = yes
UninstallDisplayIcon    = {pf}\Firebird\Firebird_{#BaseVer}\bin\fbserver.exe
Compression             = lzma
SolidCompression        = yes
OutputBaseFilename      = InstallFirebird_2_5
OutputDir               = C:\Aon\Vendas\instalacao\exe

[Languages]
Name: brasil; MessagesFile: compiler:Languages\Brasil.isl

[LangOptions]
TitleFontSize = 1

[Run]
;Força a execução do MSVC. Necessita do Windows Installer 3.0
Filename: msiexec.exe; Parameters: "/qn /i ""{tmp}\vccrt8_Win32.msi"" /L*v {tmp}\vccrt8_Win32.log "; Check: not CheckWin9x; StatusMsg: "Instalando MSVC Runtime Libraries";

Filename: {pf}\Firebird\Firebird_{#BaseVer}\bin\instreg.exe; Parameters: "install ""{pf}\Firebird"""; WorkingDir: {pf}\Firebird\Firebird_{#BaseVer}\Bin; Flags: waituntilterminated  runhidden runminimized; StatusMsg: "Registrando";
Filename: {pf}\Firebird\Firebird_{#BaseVer}\bin\instsvc.exe; Parameters: i -s -a -g -n Firebird_{#BaseVer}; Check: CheckWinVista() or CheckNT2000XP(); WorkingDir: {pf}\Firebird\Firebird_{#BaseVer}\bin; Flags: waituntilterminated runhidden runminimized; StatusMsg: "Criando serviço";
Filename: {pf}\Firebird\Firebird_{#BaseVer}\bin\instsvc.exe; Parameters: Start -n Firebird_{#BaseVer}; Check: CheckWinVista() or CheckNT2000XP(); WorkingDir: {pf}\Firebird\Firebird_{#BaseVer}\bin; Flags: waituntilterminated runhidden runminimized; StatusMsg: "Iniciando o serviço";
Filename: {pf}\Firebird\Firebird_{#BaseVer}\Bin\fbguard.exe; Parameters: Start -n Firebird_{#BaseVer}; Check: CheckWinVista() or CheckNT2000XP(); WorkingDir: {pf}\Firebird\Firebird_{#BaseVer}\bin; Flags: waituntilterminated runhidden runminimized; StatusMsg: "Iniciando o Guardian";

[Files]
;Copia os arquivos necessários para instalação do 2.5.2
Source: C:\Aon\Vendas\instalacao\Arquivos\Firebird_2_5\Arquivos\*                              ; DestDir: {pf}\Firebird\Firebird_{#BaseVer}; Flags: recursesubdirs;
Source: C:\Aon\Vendas\instalacao\Arquivos\Firebird_2_5\Arquivos\system32\vccrt8_Win32.msi      ; DestDir: {tmp}; Check: not CheckWin9x; MinVersion: 0,5.0;
Source: C:\Aon\Vendas\instalacao\Arquivos\Firebird_2_5\Arquivos\bin\Microsoft.VC80.CRT.manifest; DestDir: {sys}; Flags: sharedfile uninsneveruninstall;
Source: C:\Aon\Vendas\instalacao\Arquivos\Firebird_2_5\Arquivos\bin\msvcr80.dll                ; DestDir: {sys}; Flags: sharedfile uninsneveruninstall;
Source: C:\Aon\Vendas\instalacao\Arquivos\Firebird_2_5\Arquivos\bin\msvcp80.dll                ; DestDir: {sys}; Flags: sharedfile uninsneveruninstall;

[Code]
function CheckNT2000XP(): Boolean;
begin

  Result := UsingWinNT();
  
end;

function CheckWin9x(): Boolean;
begin

  Result := not UsingWinNT();
  
end;

function CheckWinVista(): Boolean;
var Version: TWindowsVersion;
begin

  GetWindowsVersionEx(Version);
  Result:= ( Version.Major >= 6 );
  
end;

//Cancela a instalação caso o Sistema Operacional seja Windows 98
function InitializeSetup(): Boolean;
begin

  Result := True;

  if not UsingWinNT() then
  begin
    MsgBox('Prezado cliente, '+#13+
           'Este instalador não está disponível para essa versão do sistema operacional.'+#13+
           'Para mais informações, entre em contato com nosso suporte tecnológico.', mbCriticalError, MB_OK);
    Result := False;
    Exit;
  end;

end;

[UninstallRun]
;Para o serviço do 2.5.2 em execução nas Ferramentas Adm.
Filename: {pf}\Firebird\Firebird_{#BaseVer}\bin\instsvc.exe; Parameters: Stop -n Firebird_{#BaseVer}; Check: CheckWinVista() or CheckNT2000XP(); WorkingDir: {pf}\Firebird\Firebird_{#BaseVer}\bin; Flags: runhidden waituntilterminated

;Remove os aqruivos do serviço do 2.5.2 na pasta do Arquivos de Programas
Filename: {pf}\Firebird\Firebird_{#BaseVer}\bin\instsvc.exe; Parameters: Remove -n Firebird_{#BaseVer}; Check: CheckWinVista() or CheckNT2000XP(); WorkingDir: {pf}\Firebird\Firebird_{#BaseVer}\bin; Flags: runhidden waituntilterminated
Filename: {pf}\Firebird\Firebird_{#BaseVer}\bin\instreg.exe; Parameters: Remove -n Firebird_{#BaseVer}; Check: CheckWinVista() or CheckNT2000XP(); WorkingDir: {pf}\Firebird\Firebird_{#BaseVer}\bin; Flags: runhidden waituntilterminated

[UninstallDelete]
;Remove outros arquivos importados na instalação do 2.5.2
Type: files; Name: {app}\*.conf
Type: files; Name: {app}\*.lck
Type: files; Name: {app}\*.bat
Type: files; Name: {app}\*.ori
Type: filesandordirs ; Name: "{app}\Importar"
Type: files; Name: {pf}\Firebird\Firebird_{#BaseVer}\*
