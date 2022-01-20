unit uSystemInformation;

interface

type
  FolderType = (AppData, LocalAppData, Desktop, Documents, Music, Pictures,
    Video, Profile, ProgramFiles, ProgramFilesX86, CommonAppData, CommonDesktop);

function SpecialFolderPath(Folder: FolderType): string;
function WindowsFolderPath: string;
function SystemFolderPath: string;
function TempFolderPath: string;

implementation

uses
  Windows, ShlObj, Types;

const
  {$IFDEF MSWINDOWS}
    shell32 = 'shell32.dll';
    shdocvw = 'shdocvw.dll';
    mydocs = 'mydocs.dll';
  {$ENDIF}
  {$IFDEF LINUX}
    shell32 = 'libshell32.borland.so';
  {$ENDIF}

  CSIDL_LOCAL_APPDATA           = $001c;          // <user name>\Local Settings\Applicaiton Data (non roaming)
  {$EXTERNALSYM CSIDL_LOCAL_APPDATA}
  CSIDL_MYDOCUMENTS             = CSIDL_PERSONAL; // Personal was just a silly name for My Documents
  {$EXTERNALSYM CSIDL_MYDOCUMENTS}
  CSIDL_MYMUSIC                 = $000d;          // "My Music" folder
  {$EXTERNALSYM CSIDL_MYMUSIC}
  CSIDL_MYPICTURES              = $0027;          // C:\Program Files\My Pictures
  {$EXTERNALSYM CSIDL_MYPICTURES}
  CSIDL_MYVIDEO                 = $000e;          // "My Videos" folder
  {$EXTERNALSYM CSIDL_MYVIDEO}
  CSIDL_PROFILE                 = $0028;          // USERPROFILE
  {$EXTERNALSYM CSIDL_PROFILE}
  CSIDL_PROGRAM_FILES           = $0026;          // C:\Program Files
  {$EXTERNALSYM CSIDL_PROGRAM_FILES}
  CSIDL_PROGRAM_FILESX86        = $002a;          // x86 C:\Program Files on RISC
  {$EXTERNALSYM CSIDL_PROGRAM_FILESX86}
  CSIDL_COMMON_APPDATA          = $0023;          // All Users\Application Data
  {$EXTERNALSYM CSIDL_COMMON_APPDATA}
  CSIDL_WINDOWS                 = $0024;          // GetWindowsDirectory()
  {$EXTERNALSYM CSIDL_WINDOWS}
  CSIDL_SYSTEM                  = $0025;          // GetSystemDirectory()
  {$EXTERNALSYM CSIDL_SYSTEM}

  SHGFP_TYPE_CURRENT = 0;      // current value for user, verify it exists
  {$EXTERNALSYM SHGFP_TYPE_CURRENT}
  SHGFP_TYPE_DEFAULT = 1;      // default value, may not exist
  {$EXTERNALSYM SHGFP_TYPE_DEFAULT}

  CLSID: array[FolderType] of integer = (
    CSIDL_APPDATA,
    CSIDL_LOCAL_APPDATA,
    CSIDL_DESKTOPDIRECTORY,
    CSIDL_MYDOCUMENTS,
    CSIDL_MYMUSIC,
    CSIDL_MYPICTURES,
    CSIDL_MYVIDEO,
    CSIDL_PROFILE,
    CSIDL_PROGRAM_FILES,
    CSIDL_PROGRAM_FILESX86,
    CSIDL_COMMON_APPDATA,
    CSIDL_COMMON_DESKTOPDIRECTORY
  );

var
  Path2: array[0..MAX_PATH] of WideChar;
  Path: array[0..MAX_PATH] of AnsiChar;

function SHGetFolderPath(hwnd: HWND; csidl: Integer; hToken: THandle;
  dwFlags: DWORD; pszPath: LPSTR): HResult; stdcall; external shell32 name 'SHGetFolderPathA';

function SpecialFolderPath(Folder: FolderType): string;
begin

  Result := '';

  if (SHGetFolderPath(0, CLSID[Folder], 0, SHGFP_TYPE_CURRENT, Path) = S_OK) then
    Result := String(Path);

end;

function WindowsFolderPath: string;
begin

  Result := '';

  if (SHGetFolderPath(0, CSIDL_WINDOWS, 0, SHGFP_TYPE_CURRENT, Path) = S_OK) then
    Result := String(Path);

end;

function SystemFolderPath: string;
begin

  Result := '';

  if (SHGetFolderPath(0, CSIDL_SYSTEM, 0, SHGFP_TYPE_CURRENT, Path) = S_OK) then
    Result := String(Path);

end;

function TempFolderPath: string;
begin

  GetTempPath(MAX_PATH, Path2);

  Result := String(Path2);

end;

end.
