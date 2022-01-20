unit uThreadStatusSerial;

interface

uses
  Classes, SysUtils;

type
  ThreadStatusSerial = class(TThread)
  private
    dsMensagem: String;
    procedure Mensagem;
    procedure SerialBloqueado;
    procedure SerialInvalido;
    { Private declarations }

  protected
    procedure Execute; override;
  end;

implementation

uses uFuncoes, udmPrincipal, uPrincipal, uConstantes;

{ ThreadStatusSerial }

procedure ThreadStatusSerial.Execute;
var retornoValido, retornoStatus, retornoProfissional: String;
begin

  retornoValido := '';
  retornoStatus := '';
  dsMensagem    := '';

  try

    if ( ConexaoInternet ) then
    begin

      dmPrincipal.qryConsSerial.Close;
      dmPrincipal.qryConsSerial.Open;

      // Atualiza quantidade de profissionais que pode ser cadastrado
      try

        retornoProfissional := RetornaConsultaPHP('numero_profissional', fncCriptografia(Descriptografar, dmPrincipal.qryConsSerial.FieldByName('NR_SERIAL').AsString));

        if ( Trim(retornoProfissional) <> '' ) then
        begin

          dmPrincipal.qryNumProfissional.Close;
          dmPrincipal.qryNumProfissional.ParamByName('NR_LIMITEUSUARIO').AsInteger := StrToInt(retornoProfissional);
          dmPrincipal.qryNumProfissional.ExecSQL;

          dmPrincipal.IB_Transaction.Commit;

        end;

      except
      end;
      // ***************************************************************


      if ( not ( dmPrincipal.qryConsSerial.IsEmpty ) ) then
      begin

        // VERIFICA SE O SERIAL É VÁLIDO
        retornoValido := RetornaConsultaPHP('valida_serial', fncCriptografia(Descriptografar, dmPrincipal.qryConsSerial.FieldByName('NR_SERIAL').AsString));

        // VERIFICA SE O SERIAL ESTA BLOQUEADO
        if ( Trim( retornoValido ) <> 'INVALIDO' ) then
          retornoStatus := RetornaConsultaPHP('status_serial', fncCriptografia(Descriptografar, dmPrincipal.qryConsSerial.FieldByName('NR_SERIAL').AsString));

        // VERIFICA MENSAGEM
        if ( Trim( retornoValido ) <> 'INVALIDO' ) and ( Trim( retornoStatus ) <> 'BLOQUEADO' ) then
          dsMensagem := RetornaConsultaPHP('mensagem', fncCriptografia(Descriptografar, dmPrincipal.qryConsSerial.FieldByName('NR_SERIAL').AsString));

        if ( Trim( retornoValido ) = 'INVALIDO' ) then
          Synchronize(SerialInvalido)
        else if ( Trim( retornoStatus ) = 'BLOQUEADO' ) then
          Synchronize(SerialBloqueado)
        else if ( Trim( dsMensagem ) <> '' ) then
          Synchronize(Mensagem);

      end;

    end;

  except
  end;

end;

procedure ThreadStatusSerial.SerialBloqueado;
begin

  try

    dmPrincipal.qryStatusSerial.Close;
    dmPrincipal.qryStatusSerial.ParamByName('FG_STATUS').AsString := fncCriptografia(Criptografar, 'BLOQUEADO');
    dmPrincipal.qryStatusSerial.ExecSQL;

    dmPrincipal.IB_Transaction.Commit;

  except
  end;

  frmPrincipal.edtMensagem.Text := MSG_SISTEMA_BLOQUEADO;
  BloquerMenuPrincipal(true);

end;

procedure ThreadStatusSerial.SerialInvalido;
begin

  frmPrincipal.edtMensagem.Text := MSG_SERIAL_INVALIDO;
  BloquerMenuPrincipal(true);

end;

procedure ThreadStatusSerial.Mensagem;
begin

  frmPrincipal.edtMensagem.Text := dsMensagem;

end;

end.
