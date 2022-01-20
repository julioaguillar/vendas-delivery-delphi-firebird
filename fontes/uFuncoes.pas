unit uFuncoes;

interface

uses Windows, Forms, Registry, ValEdit, Classes, Mask, StdCtrls, DBCtrls, DB,
  DBXJson, SysUtils, Controls, jpeg, Graphics, Clipbrd, DateUtils, DBGrids,
  IBODataset, StrUtils, WinInet, WinSock, IdHTTP, ExtCtrls, ComObj, IniFiles,
  uSystemInformation;

type
  TCalcIdade = record
                 Dias   : Integer;
                 Meses  : Integer;
                 Anos   : Integer;
                 Extenso: String;
               end;

type
  TEndereco = record
                TipoLogradouro : String;
                Logradouro     : String;
                Complemento    : String;
                Cep            : String;
                Bairro         : String;
                UF             : String;
                Municipio      : String;
                CodigoMunicipio: Integer;
              end;

type
  TAcaoCriptografia = (Criptografar, Descriptografar);

type
  TEscalaCor = (Colorido, EscalaCinza);

function SetIniValue(Key, Value, Data: String): Boolean;
function GetIniValue(Key, Value: String): String;
function MsgBox(Texto: String; Flags: LongInt): Integer; Overload;
function MsgBox(Controle: HWND; Texto: String; Flags: LongInt): Integer; Overload;
function ValidaCampoObrigatorio(Form: TForm; CamposObrigatorios: TValueListEditor): Boolean;
function fncSomenteNumeros(AString: String): String;
function fncValidaCPFCNPJ(CPFCNPJ: String): Boolean;
function fncCalcIdade(DataNasc: TDateTime; DataFim: TDateTime = 0; DiaInclusive: Boolean = false): TCalcIdade;
function fncCalcMeses(DataInicial: TDate; DataFim: TDate = 0): Integer;
function fncCriptografia(Acao: TAcaoCriptografia; Texto: String): String;
function ConverteCaracterHTML(Texto: String): String;
function RemoveCaracterAcentuados(Texto: String; RemoverBranco: Boolean = false): String;
function ArredondaValor(sValor: Double; Casas: Byte): Double;
function FormataValor(Valor: String): String;
function ValorPorExtenso(Valor: Real): String;
function BlockingHookProc: Boolean; stdcall;
function IsConnectedToNet(HostIP: String; HostPort, CancelTimeMs: Word; FirstOctet: Byte; PError: PChar): Boolean;
function ConexaoInternet: Boolean;
function RetornaConsultaPHP(Operacao: String; Parametro: String): String;
function RetornarEndereco(CEP: String): TEndereco;

procedure ValidaPreenchimento(Componente: TComponent; Mensagem: String);
procedure BloquerMenuPrincipal(Value: Boolean);
procedure OrdenaGrid(Grid: TDBGrid; Coluna: TColumn; Table: String = ''; Complement: String = ''; OrderBy: String = ''; Linha: Integer = 0);
procedure prcManipulaImagem(Imagem: TImage; Color: TEscalaCor);
procedure pExportarDadosExcel(Query: TIBOQuery);

implementation

uses uCampoObrigatorio, uConstantes, uPrincipal, udmPrincipal;

var
  PError: array[0..255] of Char;
  WaitTimeMs: WORD;
  InitialTick, DifTick: DWORD;

function SetIniValue(Key, Value, Data: String): Boolean;
var arq, path: String;
    ArqIni : TIniFile;
begin

  Result := False;

  path := IncludeTrailingPathDelimiter(SpecialFolderPath(CommonAppData)) + 'Aon\AonVendas';

  if not DirectoryExists(path) then
    forceDirectories(path);

  arq := IncludeTrailingPathDelimiter(path) + 'parametros.ini';

  ArqIni := TIniFile.Create(arq);

  try
    ArqIni.WriteString(Key, Value, Data);
    Result := True;
  finally
    ArqIni.Free;
  end;

end;

function GetIniValue(Key, Value: String): String;
var arq, path: String;
    ArqIni: TIniFile;
begin

  Result := '';
  path   := IncludeTrailingPathDelimiter(SpecialFolderPath(CommonAppData)) + 'Aon\AonVendas';

  if not DirectoryExists(path) then
    forceDirectories(path);

  arq := IncludeTrailingPathDelimiter(path) + 'parametros.ini';

  ArqIni := TIniFile.Create(arq);

  try
    Result := ArqIni.ReadString(Key, Value, '');
  finally
    ArqIni.Free;
  end;

end;

function MsgBox(Texto: String; Flags: LongInt): Integer;
begin

  Result := Application.MessageBox(PWideChar(Texto), PWideChar( NOME_EMPRESA + ' Sistemas' ), Flags);

end;

function MsgBox(Controle: HWND; Texto: String; Flags: LongInt): Integer;
begin

  Result := MessageBox(Controle, PWideChar(Texto), PWideChar( NOME_EMPRESA ), Flags);

end;

procedure ValidaPreenchimento(Componente: TComponent; Mensagem: String);
var editMask: TMaskEdit;
begin

  if ( ( componente is TEdit )             and ( TEdit(componente).Text = '' ) )         or
     ( ( componente is TMemo )             and ( TMemo(componente).Lines.Text = '' ) )   or
     ( ( componente is TComboBox )         and ( TComboBox(componente).Text = '' ) )     or
     ( ( componente is TDBMemo )           and ( TDBMemo(componente).Lines.Text = '' ) ) or
     ( ( componente is TDBComboBox )       and ( TDBComboBox(componente).Text = '' ) )   or
     ( ( componente is TDBLookupComboBox ) and ( TDBLookupComboBox(componente).Text = '' ) ) then
  begin

    frmCampoObrigatorio.cdsCampoObrigatorio.Append;
    frmCampoObrigatorio.cdsCampoObrigatorio.FieldByName('DS_COMPONENTE').AsString := componente.Name;
    frmCampoObrigatorio.cdsCampoObrigatorio.FieldByName('DS_MENSAGEM').AsString   := mensagem;
    frmCampoObrigatorio.cdsCampoObrigatorio.Post;

  end
  else if ( componente is TDBEdit ) then
  begin

    editMask := TMaskEdit.Create(nil);
    editMask.EditMask := TDBEdit(componente).Field.EditMask;

    if ( TDBEdit(componente).Text = '' ) or ( TDBEdit(componente).Text = editMask.Text ) then
    begin

      frmCampoObrigatorio.cdsCampoObrigatorio.Append;
      frmCampoObrigatorio.cdsCampoObrigatorio.FieldByName('DS_COMPONENTE').AsString := componente.Name;
      frmCampoObrigatorio.cdsCampoObrigatorio.FieldByName('DS_MENSAGEM').AsString   := mensagem;
      frmCampoObrigatorio.cdsCampoObrigatorio.Post;

    end;

    FreeAndNil(editMask);

  end
  else if ( componente is TMaskEdit ) then
  begin

    editMask := TMaskEdit.Create(nil);
    editMask.EditMask := TMaskEdit(componente).EditMask;

    if ( ( TMaskEdit(componente).Text = '' ) or ( TMaskEdit(componente).Text = editMask.Text ) ) then
    begin

      frmCampoObrigatorio.cdsCampoObrigatorio.Append;
      frmCampoObrigatorio.cdsCampoObrigatorio.FieldByName('DS_COMPONENTE').AsString := componente.Name;
      frmCampoObrigatorio.cdsCampoObrigatorio.FieldByName('DS_MENSAGEM').AsString   := mensagem;
      frmCampoObrigatorio.cdsCampoObrigatorio.Post;

    end;

    FreeAndNil(editMask);

  end;

end;

function ValidaCampoObrigatorio(Form: TForm; CamposObrigatorios: TValueListEditor): Boolean;
var index     : Integer;
    componente: TComponent;
    campo, mensagem: String;
begin

  Result := true;

  if ( CamposObrigatorios.Strings.Count > 1 ) or ( ( CamposObrigatorios.Strings[0] <> '=' ) and ( CamposObrigatorios.Strings[0] <> '' ) ) then
  begin

    frmCampoObrigatorio := TfrmCampoObrigatorio.Create(Form);

    for index := 0 to CamposObrigatorios.Strings.Count-1 do
    begin

      if ( ( CamposObrigatorios.Strings[index] <> '' ) and ( CamposObrigatorios.Strings[index] <> '=' ) ) then
      begin

        campo    := Copy(CamposObrigatorios.Strings[index], 1, Pos('=', CamposObrigatorios.Strings[index])-1);
        mensagem := Copy(CamposObrigatorios.Strings[index], Pos('=', CamposObrigatorios.Strings[index])+1, length(CamposObrigatorios.Strings[index]));

        componente := nil;
        componente := Form.FindComponent(campo);

        if ( componente <> nil ) then
          ValidaPreenchimento(componente, mensagem);

      end;

    end;

    if ( not ( frmCampoObrigatorio.cdsCampoObrigatorio.IsEmpty ) ) then
    begin

      frmCampoObrigatorio.cdsCampoObrigatorio.First;
      Result := false;

      frmCampoObrigatorio.ShowModal;

      if ( frmCampoObrigatorio.ModalResult = mrOk ) then
      begin

        componente := nil;
        componente := Form.FindComponent(frmCampoObrigatorio.cdsCampoObrigatorio.FieldByName('DS_COMPONENTE').AsString);

        if ( componente <> nil ) then
          Form.ActiveControl := TWinControl(componente);

      end;

    end;

    FreeAndNil(frmCampoObrigatorio);

  end;

end;

function fncSomenteNumeros(AString: String): String;
var I     : Integer;
    Limpos: String;
begin

  Limpos := '';

  for I := 1 to Length(AString) do
  begin

    if Pos(Copy(AString, I, 1), '0123456789') <> 0 then
      Limpos := Limpos + Copy(AString, i, 1);

  end;

  Result := Limpos;

end;

function fncValidaCPFCNPJ(CPFCNPJ: String): Boolean;
var sCPFCNPJ: String;
    iLocal1, iSoma1, iSoma2, iDv1, iDv2, iDigi1, iDigi2,
    iFccgcdfp, iFccgcrep, iFccgcdft, iFccgcpdg, iFccgcdfq,
    iFccgcsdg, iFccgcdfs , iFccgcdfu, iFccgcdfx, iFccgcres: Integer;
begin

  Result   := True;
  sCPFCNPJ := fncSomenteNumeros( CPFCNPJ );

  if ( sCPFCNPJ = '' ) then
  begin
    Result := False;
    Exit;
  end;

  if (Length( sCPFCNPJ ) = 11) and (Length( CPFCNPJ ) = 14) then
  begin

    iLocal1 := 1;

    if length( sCPFCNPJ ) < 11 then
      while Length( sCPFCNPJ ) < 11 do
        sCPFCNPJ := '0' + sCPFCNPJ;

    iDv1 := StrToInt(Copy(sCPFCNPJ, 10, 1));
    iDv2 := StrToInt(Copy(sCPFCNPJ, 11, 1));

    iSoma1 := 0;
    iSoma2 := 0;

    for iLocal1 := 1 to 9 do
      iSoma1 := iSoma1 + (iLocal1 + 1) * StrToInt(Copy(sCPFCNPJ, (10 - iLocal1), 1));

    iDigi1:= 11 - iSoma1 mod 11;

    if ( iDigi1 > 9 ) then
      iDigi1 := 0;

    if ( iDv1 = iDigi1 ) then
    begin

      iLocal1 := 1 ;

      for iLocal1 := 1 to 10 do
        iSoma2:= iSoma2 + (iLocal1 + 1) * StrToInt(Copy(sCPFCNPJ, (11 - iLocal1), 1));

      iDigi2:= 11 - iSoma2 mod 11;

      if (iDigi2 > 9) then
        iDigi2 := 0;

    end
    else
      idigi2 := iDv2;

    Result := not (( iDv1 <> iDigi1 ) or ( iDv2 <> iDigi2 ));

  end
  else
  begin

    if (Length( sCPFCNPJ ) = 14) and (Length( CPFCNPJ ) = 18) then
    begin

      iFccgcdfp := 5 * StrToInt(Copy(sCPFCNPJ,01,1)) + 4 * StrToInt(Copy(sCPFCNPJ,02,1)) + 3 *
                       StrToInt(Copy(sCPFCNPJ,03,1)) + 2 * StrToInt(Copy(sCPFCNPJ,04,1)) + 9 *
                       StrToInt(Copy(sCPFCNPJ,05,1)) + 8 * StrToInt(Copy(sCPFCNPJ,06,1)) + 7 *
                       StrToInt(Copy(sCPFCNPJ,07,1)) + 6 * StrToInt(Copy(sCPFCNPJ,08,1)) + 5 *
                       StrToInt(Copy(sCPFCNPJ,09,1)) + 4 * StrToInt(Copy(sCPFCNPJ,10,1)) + 3 *
                       StrToInt(Copy(sCPFCNPJ,11,1)) + 2 * StrToInt(Copy(sCPFCNPJ,12,1));

      iFccgcdfs := iFccgcdfp Div 11;
      iFccgcdft := (iFccgcdfs) * 11;

      iFccgcrep := iFccgcdfp - iFccgcdft;

      if ( iFccgcrep = 0 ) or ( iFccgcrep = 1 ) then
        iFccgcpdg := 0
      else
        iFccgcpdg := 11 - iFccgcrep;

      iFccgcdfq := 6 * StrToInt(Copy(sCPFCNPJ,01,1)) + 5 * StrToInt(Copy(sCPFCNPJ,02,1)) + 4 *
                       StrToInt(Copy(sCPFCNPJ,03,1)) + 3 * StrToInt(Copy(sCPFCNPJ,04,1)) + 2 *
                       StrToInt(Copy(sCPFCNPJ,05,1)) + 9 * StrToInt(Copy(sCPFCNPJ,06,1)) + 8 *
                       StrToInt(Copy(sCPFCNPJ,07,1)) + 7 * StrToInt(Copy(sCPFCNPJ,08,1)) + 6 *
                       StrToInt(Copy(sCPFCNPJ,09,1)) + 5 * StrToInt(Copy(sCPFCNPJ,10,1)) + 4 *
                       StrToInt(Copy(sCPFCNPJ,11,1)) + 3 * StrToInt(Copy(sCPFCNPJ,12,1)) + 2 *
                       iFccgcpdg;

      iFccgcdfu := iFccgcdfq Div 11;
      iFccgcdfx := (iFccgcdfu) * 11;

      iFccgcres := iFccgcdfq - iFccgcdfx;

      if ( iFccgcres = 0 ) or ( iFccgcres = 1 ) then
        iFccgcsdg := 0
      else
        iFccgcsdg := 11 - iFccgcres;

      Result := not ((iFccgcpdg <> StrToInt(Copy(sCPFCNPJ,13,1))) or (iFccgcsdg <> StrToInt(Copy(sCPFCNPJ,14,1))));

    end
    else
      Result := False;

  end;

end;

function fncCalcIdade(DataNasc: TDateTime; DataFim: TDateTime = 0; DiaInclusive: Boolean = false): TCalcIdade;
var DataFinal: TDateTime;
    AnoData, MesData, DiaData: Word;
    mesesAux, anosAux: Integer;
begin

  Result.Dias    := 0;
  Result.Meses   := 0;
  Result.Anos    := 0;
  Result.Extenso := '';

  if ( DataFim = 0 ) then
    DataFinal := Date
  else
    DataFinal := DataFim;

  DecodeDate(DataNasc, AnoData, MesData, DiaData);

  Result.Dias  := DaysBetween(DataFinal, DataNasc);
  Result.Anos  := AnoData;
  Result.Meses := MesData;

  while Result.Dias > 365 do
  begin
    Result.Dias := Result.Dias - DaysInAYear(Result.Anos);
    Result.Anos := Result.Anos + 1;
  end;

  mesesAux := Result.Meses;
  anosAux  := Result.Anos;

  while Result.Dias > 27 do
  begin

    if ( Result.Dias >= DaysInAMonth(anosAux, mesesAux) ) then
    begin

      Result.Dias := Result.Dias - DaysInAMonth(anosAux, mesesAux);

      if ( mesesAux >= 12 ) then
      begin
        mesesAux := 1;
        anosAux  := anosAux + 1;
      end
      else
        mesesAux := mesesAux + 1;

      Result.Meses := Result.Meses + 1;

    end
    else
      break;

  end;

  Result.Anos  := Result.Anos - AnoData;
  Result.Meses := Result.Meses - MesData;

  if ( Result.Anos > 0 ) then
  begin

    if ( Result.Anos = 1 ) then
      Result.Extenso := Result.Extenso + IntToStr(Result.Anos) + ' ano'
    else
      Result.Extenso := Result.Extenso + IntToStr(Result.Anos) + ' anos';

  end;

  if ( Result.Meses > 0 ) then
  begin

    if ( Result.Anos > 0 ) then
      Result.Extenso := Result.Extenso + ' ';

    if ( Result.Meses = 1 ) then
      Result.Extenso := Result.Extenso + IntToStr(Result.Meses) + ' mês'
    else
      Result.Extenso := Result.Extenso + IntToStr(Result.Meses) + ' meses';

  end;

  if ( Result.Dias > 0 ) then
  begin

    if ( Result.Anos > 0 ) or ( Result.Meses > 0 ) then
      Result.Extenso := Result.Extenso + ' ';

    if ( Result.Dias = 1 ) then
      Result.Extenso := Result.Extenso + IntToStr(Result.Dias) + ' dia'
    else if ( Result.Dias > 0 ) then
      Result.Extenso := Result.Extenso + IntToStr(Result.Dias) + ' dias';

  end;

  if ( Result.Anos + Result.Meses + Result.Dias > 0 ) then
    Result.Extenso := Result.Extenso + '.';

end;

function fncCalcMeses(DataInicial: TDate; DataFim: TDate = 0): Integer;
var YearI, MonthI, DayI: Word;
    YearF, MonthF, DayF: Word;
    ANO, MESES: INTEGER;
begin

  DecodeDate(DataInicial, YearI, MonthI, DayI);
  DecodeDate(DataFim, YearF, MonthF, DayF);

  ANO   := YearF - YearI;
  MESES := ((MonthF - MonthI) + (12 * ANO)) + 1;

  Result := MESES-1;

  if ( Result < 0 ) then
    Result := 0;

end;

function fncCriptografia(Acao: TAcaoCriptografia; Texto: String): String;
var KeyLen : Integer;
    KeyPos : Integer;
    OffSet : Integer;
    Dest, Key : String;
    SrcPos : Integer;
    SrcAsc : Integer;
    Range  : Integer;
    TmpSrcAsc : Integer;
begin

  if ( Trim( Texto ) = '' ) then
  begin
    Result := '';
    Exit;
  end;

  //Key    := 'YUQL23KL23DF90WI5E1JAS467NMCXXL6JAOAUWWMCL0AOMM4A4VZYW9KHJUI2347EJHJKDF3424SKL K3LAKDJSL9RTIKJ';
  Key    := 'W9KHXL6JAOAJF90YI2UQL23KL23DW4VZYWI5E1JAS467NMHJKMM3M4ADF342CXCL0AOUWU47EJ4SKL AKDJSK3LTIKL9RJ';
  Dest   := '';
  KeyLen := Length( Key );
  KeyPos := 0;
  SrcPos := 0;
  SrcAsc := 0;
  Range  := 256;

  if Acao = Criptografar then
  begin

    Randomize;
    OffSet := Random( Range );
    Dest   := Format( '%1.2x',[ OffSet ] );

    for SrcPos := 1 to Length( Texto ) do
    begin

      Application.ProcessMessages;
      SrcAsc := ( Ord( Texto[ SrcPos ] ) + OffSet ) mod 255;

      if KeyPos < KeyLen then
        KeyPos := KeyPos + 1
      else
        KeyPos := 1;

      SrcAsc := SrcAsc xor Ord( Key[ KeyPos ] );
      Dest   := Dest + Format( '%1.2x',[ SrcAsc ] );
      OffSet := SrcAsc;
    end;

  end
  else if Acao = Descriptografar then
  begin

    OffSet := StrToInt('$'+ Copy( Texto, 1, 2 ) );
    SrcPos := 3;

    repeat
      SrcAsc := StrToInt( '$'+ Copy( Texto, SrcPos, 2 ) );

      if ( KeyPos < KeyLen ) then
        KeyPos := KeyPos + 1
      else
        KeyPos := 1;

      TmpSrcAsc := SrcAsc Xor Ord( Key[ KeyPos ] );

      if TmpSrcAsc <= OffSet then
        TmpSrcAsc := 255 + TmpSrcAsc - OffSet
      else
        TmpSrcAsc := TmpSrcAsc - OffSet;

      Dest   := Dest + Chr( TmpSrcAsc );
      OffSet := SrcAsc;
      SrcPos := SrcPos + 2;

    until ( SrcPos >= Length( Texto ) );

  end;

  Result := Dest;

end;

function ConverteCaracterHTML(Texto: String): String;
var index: Integer;
begin

  Result := '';

  for index := 1 to Length(Texto) do
  begin

    case Texto[index] of
      '<': Result := Result + '&lt;';
      '>': Result := Result + '&gt;';
      '&': Result := Result + '&amp;';
      '': Result := Result + '';
      else Result := Result + Texto[index];
    end;

  end;

  Result := Trim(Result);

end;

function RemoveCaracterAcentuados(Texto: String; RemoverBranco: Boolean = false): String;
var index: Integer;
begin

  Result := '';

  for index := 1 to Length(Texto) do
  begin

    case Texto[index] of
      'á': Result := Result + 'a';
      'é': Result := Result + 'e';
      'í': Result := Result + 'i';
      'ó': Result := Result + 'o';
      'ú': Result := Result + 'u';
      'à': Result := Result + 'a';
      'è': Result := Result + 'e';
      'ì': Result := Result + 'i';
      'ò': Result := Result + 'o';
      'ù': Result := Result + 'u';
      'â': Result := Result + 'a';
      'ê': Result := Result + 'e';
      'î': Result := Result + 'i';
      'ô': Result := Result + 'o';
      'û': Result := Result + 'u';
      'ä': Result := Result + 'a';
      'ë': Result := Result + 'e';
      'ï': Result := Result + 'i';
      'ö': Result := Result + 'o';
      'ü': Result := Result + 'u';
      'ã': Result := Result + 'a';
      'õ': Result := Result + 'o';
      'ñ': Result := Result + 'n';
      'ç': Result := Result + 'c';
      'Á': Result := Result + 'A';
      'É': Result := Result + 'E';
      'Í': Result := Result + 'I';
      'Ó': Result := Result + 'O';
      'Ú': Result := Result + 'U';
      'À': Result := Result + 'A';
      'È': Result := Result + 'E';
      'Ì': Result := Result + 'I';
      'Ò': Result := Result + 'O';
      'Ù': Result := Result + 'U';
      'Â': Result := Result + 'A';
      'Ê': Result := Result + 'E';
      'Î': Result := Result + 'I';
      'Ô': Result := Result + 'O';
      'Û': Result := Result + 'U';
      'Ä': Result := Result + 'A';
      'Ë': Result := Result + 'E';
      'Ï': Result := Result + 'I';
      'Ö': Result := Result + 'O';
      'Ü': Result := Result + 'U';
      'Ã': Result := Result + 'A';
      'Õ': Result := Result + 'O';
      'Ñ': Result := Result + 'N';
      'Ç': Result := Result + 'C';
    else Result := Result + Texto[index];
    end;

  end;

  Result := Trim(Result);

  // REMOVE ESPAÇOS EM BRANCO
  if ( RemoverBranco ) then
  begin

    while Pos(' ', Result) > 0 do
      Result := StringReplace(Result, ' ', '', []);

  end;

end;

function ArredondaValor(sValor: Double; Casas: Byte): Double;
var i : integer;
    Zeros : String;
begin

  Zeros := '' ;

  for i := 1  to Casas do
    Zeros := Zeros + '0';

  Result := StrToFloat(FormatFloat('##0.'+Zeros,StrToFloat(FloatToStr(sValor))));

end;

(*

function fncShutdown(ConfigService: TIBOConfigService; Servidor, CaminhoBanco, Protocolo: String ): String;
begin

  Result := '';

  with ConfigService do
  begin

    Try
      ServerName     := Servidor;
      LoginPrompt    := False;

      if Protocolo = 'LOCALHOST' then
        Protocol := cpLocal
      else
        Protocol := cpTCP_IP;

      Params.Clear;
      Params.Add('user_name=SFIDPADM');
      Params.Add('password=dpmaster');

      DatabaseName := CaminhoBanco;
      Active := True;

      try
        ShutdownDatabase( Forced, 0 );
      finally
        Active := False;
      end;

    except
      Result := MSG_N_SHUTDOWN_BANCO;
    end;
  end;

end;

function fncBringOnline(ConfigService: TIBOConfigService; Servidor, CaminhoBanco, Protocolo: String): String;
begin

  with ConfigService do
  begin
    try
      ServerName     := Servidor;
      LoginPrompt    := False;

      if Protocolo = 'LOCALHOST' then
        Protocol := cpLocal
      else
        Protocol := cpTCP_IP;

      Params.Clear;
      Params.Add('user_name=SFIDPADM');
      Params.Add('password=dpmaster');

      DatabaseName := CaminhoBanco;
      Active := True;

      try
        BringDatabaseOnline;

      finally
        Active := False;
      end;
    except
      Result := MSG_N_BRINGONLINE_BANCO;
    end;
  end;

end;

*)

(*procedure PrintScreen(Path: String; SalvarJPG: Boolean = true);
var DC: HDC;
    TelaBitmap: TBitmap;
    Telajpg   : TJPEGImage;
begin

   DC := GetDC(getDesktopWindow);

   TelaBitmap := TBitmap.Create;

   try

     TelaBitmap.Width  := GetDeviceCaps(DC, HORZRES);
     TelaBitmap.Height := GetDeviceCaps(DC, VERTRES);

     BitBlt(TelaBitmap.Canvas.Handle, 0, 0, TelaBitmap.Width, TelaBitmap.Height, DC, 0, 0, SRCCOPY);

   finally
      ReleaseDC(GetDesktopWindow, DC);
   end;

   if ( SalvarJPG ) then
   begin

      Telajpg := TJpegImage.Create;

      Telajpg.Assign(TelaBitmap);
      Telajpg.CompressionQuality := 90;
      Telajpg.JPEGNeeded;
      Telajpg.SaveToFile(Path);
      Telajpg.Destroy;

   end
   else
     TelaBitmap.SaveToFile(Path);

end;

procedure PrintScreenException(Sender: TObject; E: Exception);
var bmp  : TBitmap;
    jpeg : TJPEGImage;
    error: TextFile;
    path, nomeArquivo: String;
begin



  try

    path := ExtractFilePath(Application.ExeName)+'doc';

    if ( not ( DirectoryExists(path) ) ) then
      CreateDir(path);

    // GERANDO IMAGEM DE ERRO
    bmp := TBitmap.Create;

    Clipboard.Clear;

    keybd_event(VK_SNAPSHOT, 0, 0, 0);

    Application.ProcessMessages;

    bmp.LoadFromClipboardFormat(CF_BITMAP, Clipboard.GetAsHandle(CF_BITMAP), 0);

    jpeg := TJPEGImage.Create;
    jpeg.Assign(bmp);

    nomeArquivo := FormatDateTime('yyyymmddssmmhh', Now)+'.'+NOME_EMPRESA;

    jpeg.CompressionQuality := 50;

    jpeg.SaveToFile(path+'\'+nomeArquivo);
    jpeg.Free;

    bmp.Free;


    // GERANDO ARQUIVO DE ERRO
    try

      AssignFile(error, path+'\error.log');

      if ( not ( FileExists(path+'\error.log') ) ) then
        Rewrite(error, path+'\error.log');

      Append(error);

      WriteLn(error, 'Data do erro: '+FormatDateTime('dd/mm/yyyy', Now)+' Hora: '+FormatDateTime('hh:mm:ss', Now)+'     '+'Arquivo de imagem: '+nomeArquivo);
      WriteLn(error, '');

      if ( Sender is TComponent ) then
      begin
        WriteLn(error, 'Componente: '+TComponent(Sender).Name+'     '+'Owner: '+TComponent(Sender).Owner.Name);
        WriteLn(error, '');
      end;

      WriteLn(error, 'Classe componente: '+Sender.ClassName+'     '+'Unit: '+Sender.UnitName);
      WriteLn(error, 'Classe exceção: '+e.ClassName+'     '+'Unit: '+e.UnitName);
      WriteLn(error, 'StackTrace: '+e.StackTrace);
      WriteLn(error, '');

      WriteLn(error, 'Mensagem de erro: '+e.Message);

      WriteLn(error, '-------------------------------------------------------------------------------------------------------------------------------');

    finally
      CloseFile(error);
    end;

  except
  end;

end;*)

procedure BloquerMenuPrincipal(Value: Boolean);
begin

  SISTEMA_BLOQUEADO := true;

  if ( Assigned(frmPrincipal) ) then
    frmPrincipal.edtMensagem.Text := MSG_SISTEMA_BLOQUEADO;


  (*if ( Assigned(frmPrincipal) ) then
  begin

    frmPrincipal.toolBar.Enabled           := not ( Value );
    frmPrincipal.btnPaciente.Enabled       := not ( Value );
    frmPrincipal.btnAgenda.Enabled         := not ( Value );
    frmPrincipal.btnTarefa.Enabled         := not ( Value );
    frmPrincipal.btnEspera.Enabled         := not ( Value );
    frmPrincipal.btnTelefone.Enabled       := not ( Value );
    frmPrincipal.btnImpDocumentos.Enabled  := not ( Value );
    frmPrincipal.btnCalculadora.Enabled    := not ( Value );
    frmPrincipal.btnCalendario.Enabled     := not ( Value );
    frmPrincipal.btnEntradaEstoque.Enabled := not ( Value );
    frmPrincipal.btnSaidaEstoque.Enabled   := not ( Value );
    frmPrincipal.btnContasPagar.Enabled    := not ( Value );
    frmPrincipal.btnContasReceber.Enabled  := not ( Value );
    frmPrincipal.btnEnviarMensagem.Enabled := not ( Value );

    frmPrincipal.pnlData.Enabled  := not ( Value );
    frmPrincipal.imgFundo.Enabled := not ( Value );

    for index := 0 to frmPrincipal.mnPrincipal.Items.Count-1 do
    begin

      if ( frmPrincipal.mnPrincipal.Items[index].Name <> 'mnAjuda' ) then
        frmPrincipal.mnPrincipal.Items[index].Enabled := not ( Value );

    end;

    frmPrincipal.fgBloquearSistema := Value;

  end;*)

end;

(*procedure ValidaSistemaDemostrativo;
var dadoRegistro, bloqSistema, numAcess, dtAcess, dia, mes, ano: String;
    dtInstalacao, dtMensagem, dtCorrente: TDate;
    bloquear: Boolean;
begin

  dadoRegistro := GetRegValue('Software\WinDesk 1.0\Dcs', 'ExeSys');
  bloqSistema  := GetRegValue('Software\WinDesk 1.0\Dcs', 'DueSys');
  numAcess     := GetRegValue('Software\WinDesk 1.0\Dcs', 'Acess');
  dtAcess      := GetRegValue('Software\WinDesk 1.0\Dcs', 'AcessCurrent');

  if ( dadoRegistro <> '' ) then
  begin

    dia := Copy(dadoRegistro, 9, 2);
    mes := Copy(dadoRegistro, 6, 2);
    ano := Copy(dadoRegistro, 1, 4);

    try

      dtInstalacao := StrToDate(dia + '/' + mes + '/' + ano);

      //if ( dtInstalacao > StrToDate(VALIDADE_SISTEMA) ) then
       // dtInstalacao := StrToDate(VALIDADE_SISTEMA);

    except
    end

  end
  else
  begin

    dadoRegistro := FormatDateTime('yyyy', Date) + '0' + FormatDateTime('mm', Date) + '1' + FormatDateTime('dd', Date);
    dtInstalacao := Date;
    SetRegValue('Software\WinDesk 1.0\Dcs', 'ExeSys', dadoRegistro);

  end;

  dtMensagem := dtInstalacao;
  dtMensagem := IncDay(dtMensagem, 60);

  bloquear := ( bloqSistema = '1010001101' );

  if ( Assigned(frmPrincipal) ) then
    frmPrincipal.edtMensagem.Text := 'SISTEMA DEMOSTRATIVO - VÁLIDO ATÉ: '+FormatDateTime('dd/mm/yyyy', dtMensagem)+' ('+IntToStr(DaysBetween(Now, dtMensagem))+' DIAS)';

  if ( dtAcess <> '' ) then
  begin

    try

      dia := Copy(dtAcess, length('201104200140612') + 3, 2);
      mes := Copy(dtAcess, length('201104200140612') + 1, 2);
      ano := Copy(dtAcess, length('201104200140612') + 5, 2);

      dtCorrente :=  StrToDate(dia+'/'+mes+'/'+ano);

      if ( FormatDateTime('mmddyyyy', Now) <> FormatDateTime('mmddyyyy', dtCorrente) ) then
      begin

        numAcess := IntToStr( StrToInt(numAcess) + 3512 );

        SetRegValue('Software\WinDesk 1.0\Dcs', 'Acess', numAcess);
        SetRegValue('Software\WinDesk 1.0\Dcs', 'AcessCurrent', '201104200140612'+FormatDateTime('mmddyy', Now)+'310782310183');

      end;

      bloquear := ( StrToInt(numAcess) > 1210720 );

    except
      SetRegValue('Software\WinDesk 1.0\Dcs', 'Acess', '1000000');
      SetRegValue('Software\WinDesk 1.0\Dcs', 'AcessCurrent', '201104200140612'+FormatDateTime('mmddyy', Now)+'310782310183');
    end;

  end
  else
  begin
    SetRegValue('Software\WinDesk 1.0\Dcs', 'Acess', '1000000');
    SetRegValue('Software\WinDesk 1.0\Dcs', 'AcessCurrent', '201104200140612'+FormatDateTime('mmddyy', Now)+'310782310183');
  end;

  if ( DaysBetween(dtInstalacao, Date) > 60 ) or ( bloquear ) then
  begin

    BloquerMenuPrincipal(true);
    SetRegValue('Software\WinDesk 1.0\Dcs', 'DueSys', '1011001110');

    if ( Assigned(frmPrincipal) ) then
      frmPrincipal.edtMensagem.Text := 'SISTEMA DEMOSTRATIVO - A VALIDADE DO SEU SITEMA TERMINO';

  end;

end;*)

procedure OrdenaGrid(Grid: TDBGrid; Coluna: TColumn; Table: String = ''; Complement: String = ''; OrderBy: String = ''; Linha: Integer = 0);
var index: Integer;
    abrirConsulta: Boolean;
begin

  try

    if ( grid.DataSource.DataSet.State in [dsInsert,dsEdit] ) then
      Exit;

    abrirConsulta := grid.DataSource.DataSet.Active;

    grid.DataSource.DataSet.Close;

    if ( grid.DataSource.DataSet is TIBOQuery ) then
    begin

      if ( Linha > 0 ) then
      begin

        if ( OrderBy <> '' ) then
          TIBOQuery( grid.DataSource.DataSet ).SQL.Strings[Linha] := OrderBy
        else
        begin

          if ( Complement <> '' ) then
            TIBOQuery( grid.DataSource.DataSet ).SQL.Strings[Linha] := 'ORDER BY ' + IfThen(Table <> '', Table+'.'+Coluna.FieldName+' '+Complement, Coluna.FieldName+' '+Complement)
          else
            TIBOQuery( grid.DataSource.DataSet ).SQL.Strings[Linha] := 'ORDER BY ' + IfThen(Table <> '', Table+'.'+Coluna.FieldName, Coluna.FieldName);

        end;

      end
      else
      begin

        if ( OrderBy <> '' ) then
          TIBOQuery( grid.DataSource.DataSet ).SQL.Strings[TIBOQuery( grid.DataSource.DataSet ).SQL.Count-1] := OrderBy
        else
        begin

          if ( Complement <> '' ) then
            TIBOQuery( grid.DataSource.DataSet ).SQL.Strings[TIBOQuery( grid.DataSource.DataSet ).SQL.Count-1] := 'ORDER BY ' + IfThen(Table <> '', Table+'.'+Coluna.FieldName+' '+Complement, Coluna.FieldName+' '+Complement)
          else
            TIBOQuery( grid.DataSource.DataSet ).SQL.Strings[TIBOQuery( grid.DataSource.DataSet ).SQL.Count-1] := 'ORDER BY ' + IfThen(Table <> '', Table+'.'+Coluna.FieldName, Coluna.FieldName);

        end;

      end;

    end;

    if ( abrirConsulta ) then
      grid.DataSource.DataSet.Open;

    for index := 0 to Grid.Columns.Count-1 do
    begin
      Grid.Columns[index].Title.Font.Color := clWindowText;
      Grid.Columns[index].Title.Font.Style := [];
    end;

    Coluna.Title.Font.Color := clNavy;
    Coluna.Title.Font.Style := [fsBold];

  except
  end;

end;

function FormataValor(Valor:String):String;
var i: Integer;
    NovoValor : String;
begin

  //função para formatar os valores dos campos monetários.
  NovoValor := '';

  if Valor = '' then
    Valor := '0,00';

  for i := 1 to Length(Valor) do
  begin

    if Valor[i] <> '.' then
      NovoValor := NovoValor + Valor[i];

  end;

  Result := NovoValor;

end;

function ValorPorExtenso(Valor: Real): String;
const
  unidade: array[1..19] of string = ('Um', 'Dois', 'Três', 'Quatro', 'Cinco', 'Seis', 'Sete', 'Oito', 'Nove', 'Dez', 'Onze', 'Doze', 'Treze', 'Quatorze', 'Quinze', 'Dezesseis', 'Dezessete', 'Dezoito', 'Dezenove');
  centena: array[1..9] of string = ('Cento', 'Duzentos', 'Trezentos', 'Quatrocentos', 'Quinhentos', 'Seiscentos', 'Setecentos', 'Oitocentos', 'Novecentos');
  dezena: array[2..9] of string = ('Vinte', 'Trinta', 'Quarenta', 'Cinquenta', 'Sessenta', 'Setenta', 'Oitenta', 'Noventa');
  qualificaS: array[0..4] of string = ('', 'Mil', 'Milhão', 'Bilhão', 'Trilhão');
  qualificaP: array[0..4] of string = ('', 'Mil', 'Milhões', 'Bilhões', 'Trilhões');

var
  inteiro: Int64;
  resto: Real;
  vlrS, s, saux, vlrP, centavos: string;
  n, unid, dez, cent, tam, i: integer;
  umReal, tem: boolean;
begin

  if (Valor = 0) then
  begin
    valorPorExtenso := 'Zero';
    exit;
  end;

  inteiro := Trunc(Valor); // parte inteira do valor
  resto   := Valor - inteiro; // parte fracionária do valor
  vlrS    := IntToStr(inteiro);

  if (length(vlrS) > 15) then
  begin
    valorPorExtenso := 'Erro: valor superior a 999 trilhões.';
    exit;
  end;

  s        := '';
  centavos := inttostr(round(resto * 100));

  // definindo o extenso da parte inteira do valor
  i      := 0;
  umReal := false;
  tem    := false;

  while (vlrS <> '0') do
  begin

    tam := length(vlrS);

    // retira do valor a 1a. parte, 2a. parte, por exemplo, para 123456789:
    // 1a. parte = 789 (centena)
    // 2a. parte = 456 (mil)
    // 3a. parte = 123 (milhões)
    if (tam > 3) then
    begin
      vlrP := copy(vlrS, tam-2, tam);
      vlrS := copy(vlrS, 1, tam-3);
    end
    else
    begin // última parte do valor
      vlrP := vlrS;
      vlrS := '0';
    end;

    if (vlrP <> '000') then
    begin

      saux := '';

      if (vlrP = '100') then
        saux := 'Cem'
      else
      begin

        n := strtoint(vlrP);        // para n = 371, tem-se:
        cent := n div 100;          // cent = 3 (centena trezentos)
        dez := (n mod 100) div 10;  // dez  = 7 (dezena setenta)
        unid := (n mod 100) mod 10; // unid = 1 (unidade um)

        if (cent <> 0) then
          saux := centena[cent];

        if ((dez <> 0) or (unid <> 0)) then
        begin

          if ((n mod 100) <= 19) then
          begin

            if (length(saux) <> 0) then
              saux := saux + ' e ' + unidade[n mod 100]
            else
              saux := unidade[n mod 100];

          end
          else
          begin

            if (length(saux) <> 0) then
              saux := saux + ' e ' + dezena[dez]
            else saux := dezena[dez];

            if (unid <> 0) then
              if (length(saux) <> 0) then
                saux := saux + ' e ' + unidade[unid]
              else
                saux := unidade[unid];

          end;

        end;

      end;

      if ((vlrP = '1') or (vlrP = '001')) then
      begin

        if (i = 0) then
          umReal := true
        else
          saux := saux + ' ' + qualificaS[i];

        end
        else if (i <> 0) then
          saux := saux + ' ' + qualificaP[i];

        if (length(s) <> 0) then
          s := saux + ', ' + s
        else s := saux;

      end;

    if (((i = 0) or (i = 1)) and (length(s) <> 0)) then
      tem := true; // tem centena ou mil no valor

    i := i + 1; // próximo qualificador: 1- mil, 2- milhão, 3- bilhão, ...

  end;

  if (length(s) <> 0) then
  begin

    if (umReal) then
      s := s + ' Real'
    else if (tem) then
      s := s + ' Reais'
    else
      s := s + ' de Reais';

  end;

  // definindo o extenso dos centavos do valor
  if (centavos <> '0') then
  begin

    if (length(s) <> 0) then
      s := s + ' e ';

    if (centavos = '1') then
      s := s + 'Um Centavo'
    else
    begin

      n := strtoint(centavos);

      if (n <= 19) then
        s := s + unidade[n]
      else
      begin                 // para n = 37, tem-se:

        unid := n mod 10;   // unid = 37 % 10 = 7 (unidade sete)
        dez  := n div 10;    // dez  = 37 / 10 = 3 (dezena trinta)
        s    := s + dezena[dez];

        if (unid <> 0) then
          s := s + ' e ' + unidade[unid];

      end;

      s := s + ' Centavos';

    end;

  end;

  valorPorExtenso := s;

end;

function BlockingHookProc: Boolean; stdcall;
begin

  Result := False;

  if (GetTickCount < InitialTick) then
    DifTick := $FFFFFFFF - InitialTick + GetTickCount
  else
    DifTick := GetTickCount - InitialTick;

  if ( ( DifTick > WaitTimeMs ) and ( WSAIsBlocking ) ) then
    WSACancelBlockingCall;

end;

function IsConnectedToNet(HostIP: String; HostPort, CancelTimeMs: Word; FirstOctet: Byte; PError: PChar): Boolean;
var GInitData   : TWSAData;
    SockDescript: TSocket;
    SockAddr    : TSockAddr;
    NameLen     : Integer;

  procedure SaveError(Proc: String; LastError: Integer);
  begin
    StrLCopy(PError, PChar(Proc + ' - Error no.' +  IntToStr(LastError)), 255);
  end;

begin

  Result     := False;
  WaitTimeMs := CancelTimeMs;

  try

    if ( PError <> nil ) then
      PError[0] := #0;

    if ( WSAStartup($101, GInitData) <> 0 ) then
    begin

      if ( PError <> nil ) then
        SaveError('WSAStartup', WSAGetLastError);

      Exit;

    end;

    try

      if WSASetBlockingHook(@BlockingHookProc) = nil then
      begin

        if ( PError <> nil ) then
          SaveError('WSASetBlockingHook', WSAGetLastError);

        Exit;

      end;

      try

        SockDescript := Socket(PF_INET, SOCK_STREAM, IPPROTO_TCP);

        if ( SockDescript = INVALID_SOCKET ) then
        begin

          if ( PError <> nil ) then
            SaveError('Socket', WSAGetLastError);

          Exit;

        end;

        try

          SockAddr.sin_family      := AF_INET;
          SockAddr.sin_port        := 0;
          SockAddr.sin_addr.S_addr := 0;

          if Bind(SockDescript, SockAddr, SizeOf(SockAddr)) <> 0 then
          begin

            if ( PError <> nil ) then
              SaveError('Bind', WSAGetLastError);

            Exit;

          end;

          SockAddr.sin_family := AF_INET;
          SockAddr.sin_port   := htons(HostPort);

          if ( FirstOctet in [1..4] ) then
            SockAddr.sin_addr := in_addr(inet_addr(PAnsiChar((HostIP))))
          else
            SockAddr.sin_addr := in_addr(inet_addr(PAnsiChar(HostIP)));

          InitialTick := GetTickCount;

          if Connect(SockDescript, SockAddr, SizeOf(SockAddr)) <> 0 then
          begin

            Result := (WSAGetLastError = WSAECONNREFUSED) or (WSAGetLastError = WSAEINTR) or (WSAGetLastError = WSAETIMEDOUT);

            if ( PError <> nil ) then
              SaveError('Connect', WSAGetLastError);

          end
          else
          begin

            NameLen := SizeOf(SockAddr);
            Result  := (GetPeerName(SockDescript, SockAddr, NameLen) = 0);

            if not Result and (PError <> nil) then
              SaveError('GetPeerName', WSAGetLastError);

          end;

        finally
          CloseSocket(SockDescript);
        end;

      finally
        WSAUnhookBlockingHook;
      end;

    finally
      WSACleanup;
    end;

  except
    on E:Exception do
      MsgBox('"Prezado Cliente"'#13'Ocorreu exceção em IsConnectedToNet - ' +E.Message, MB_OK+MB_ICONWARNING);
  end;

end;

function ConexaoInternet: Boolean;
var KConnected: boolean;
    Flags: Dword;
begin

   Result := True;

   if ( not ( InternetGetConnectedState(@Flags, 0) ) ) then
   begin

     KConnected := IsConnectedToNet('200.176.3.142', 80, 5000, 4, PError);

     if ( StrLen(PError) > 0 ) then
       Result := False;

   end;

end;

function RetornaConsultaPHP(Operacao: String; Parametro: String): String;
var IdHTTP   : TIdHTTP;
    resultado: String;
begin

  IdHTTP    := TIdHTTP.Create( Application );
  resultado := '';

  try

    try
      resultado := IdHTTP.Get('http://www.aonsistemas.com.br/serial/funcoes.php?operacao='+Operacao+'&parametro='+Parametro)
    except
      resultado := '';
    end;

  finally
    IdHTTP.Free;
  end;

  Result := AnsiUpperCase(resultado);

end;

procedure prcManipulaImagem(Imagem: TImage; Color: TEscalaCor);
var bJPEG: Boolean;
begin

  (*if ( Color = EscalaCinza ) then
    frmPrincipal.Color := $00363636
  else if ( Color = Colorido ) then
    frmPrincipal.Color := $00663300;*)

  bJPEG := Imagem.Picture.Graphic is TJPEGImage;

  if ( bJPEG ) then
  begin

    with TJPEGImage(Imagem.Picture.Graphic) do
    begin
      Scale              := jsFullSize;
      Performance        := jpBestQuality;
      ProgressiveDisplay := True;
      Grayscale          := Boolean(ord(Color));
      Smoothing          := True;
    end;

  end;

end;

procedure pExportarDadosExcel(Query: TIBOQuery);
var Excel   : Variant;
    Linha, i: Integer;
begin

  if ( not ( Query.IsEmpty ) ) then
  begin

    Query.First;

    Excel := CreateOleObject('Excel.Application');
    Excel.Visible := True;
    Excel.Workbooks.Add;

    Linha := 1;

    for i := 0 to Query.FieldCount - 1 do
      Excel.WorkBooks[1].Sheets[1].Cells[Linha,i+1] := Query.Fields[i].DisplayName;

    Linha := 2;

    While not Query.Eof do
    Begin

      for i := 0 to Query.FieldCount - 1 do
        Excel.WorkBooks[1].Sheets[1].Cells[Linha,i+1] := Query.Fields[i].Value;

      Query.Next;

      Linha := Linha+1;

    end;

  end;

end;

function RetornarEndereco(CEP: String): TEndereco;
var cepAux: String;
begin

  Result.TipoLogradouro  := '';
  Result.Logradouro      := '';
  Result.Complemento     := '';
  Result.Cep             := '';
  Result.Bairro          := '';
  Result.UF              := '';
  Result.Municipio       := '';
  Result.CodigoMunicipio := 0;

  try

    if ( Trim(CEP) <> '' ) then
    begin

      cepAux := fncSomenteNumeros(CEP);

      dmPrincipal.qryConsCEP.Close;
      dmPrincipal.qryConsCEP.ParamByName('DS_CEP').AsString := cepAux;
      dmPrincipal.qryConsCEP.Open;

      if ( not ( dmPrincipal.qryConsCEP.IsEmpty ) ) then
      begin

        Result.TipoLogradouro := dmPrincipal.qryConsCEP.FieldByName('DS_TIPOLOGRADOURO').AsString;
        Result.Logradouro     := dmPrincipal.qryConsCEP.FieldByName('DS_LOGRADOURO').AsString;
        Result.Complemento    := dmPrincipal.qryConsCEP.FieldByName('DS_COMPLEMENTO').AsString;
        Result.Cep            := dmPrincipal.qryConsCEP.FieldByName('DS_CEP').AsString;
        Result.Bairro         := dmPrincipal.qryConsCEP.FieldByName('DS_BAIRRO').AsString;
        Result.UF             := dmPrincipal.qryConsCEP.FieldByName('CD_UF').AsString;

        dmPrincipal.qryConsMunicipio.Close;
        dmPrincipal.qryConsMunicipio.ParamByName('CD_UF').AsString        := dmPrincipal.qryConsCEP.FieldByName('CD_UF').AsString;
        dmPrincipal.qryConsMunicipio.ParamByName('DS_MUNICIPIO').AsString := AnsiUpperCase( RemoveCaracterAcentuados(dmPrincipal.qryConsCEP.FieldByName('DS_MUNICIPIO').AsString) );
        dmPrincipal.qryConsMunicipio.Open;

        if ( not ( dmPrincipal.qryConsMunicipio.IsEmpty ) ) then
        begin
          Result.CodigoMunicipio := dmPrincipal.qryConsMunicipio.FieldByName('CD_MUNICIPIO').AsInteger;
          Result.Municipio       := dmPrincipal.qryConsMunicipio.FieldByName('DS_MUNICIPIO').AsString;
        end;

      end;

    end;

  except
  end;

end;

end.
