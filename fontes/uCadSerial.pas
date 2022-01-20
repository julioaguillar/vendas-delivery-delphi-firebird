unit uCadSerial;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uPadrao, StdCtrls, Buttons, Mask, IniFiles, IB_Components,
  IBODataset, DB, ExtCtrls, Grids, ValEdit;

type
  TfrmCadSerial = class(TfrmPadrao)
    gpbBotoes: TGroupBox;
    btnConfirmar: TBitBtn;
    btnCancelar: TBitBtn;
    qryInsertSerial: TIBOQuery;
    trnsCadSerial: TIBOTransaction;
    qryDeleteSerial: TIBOQuery;
    lblChaveAtivacao: TLabel;
    pnlAguarde: TPanel;
    GroupBox2: TGroupBox;
    lblAparenciaChave: TLabel;
    lblChaveProduto: TLabel;
    edtSerial: TMaskEdit;
    CamposObrigatorios: TValueListEditor;
    procedure btnConfirmarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadSerial: TfrmCadSerial;

implementation

uses uConstantes, uFuncoes, udmPrincipal;

{$R *.dfm}

procedure TfrmCadSerial.btnConfirmarClick(Sender: TObject);
var retorno: String;
begin
  inherited;

  if ( edtSerial.Text <> '     -     -     -     -     ' ) then
  begin

    if (CamposObrigatorios.Strings.Count > 0) then
    begin
      if ( not ( ValidaCampoObrigatorio(Self, CamposObrigatorios) ) ) then
        Abort;
    end;

    if ( ConexaoInternet ) then
    begin

      pnlAguarde.Visible := true;
      Application.ProcessMessages;

      //VERIFICA SE O SERIAL É VÁLIDO
      retorno := RetornaConsultaPHP('valida_serial', edtSerial.Text);

      if ( Trim( retorno ) = 'INVALIDO' ) then
      begin
        MsgBox('"Prezado Cliente"'#13'Serial informado não é válido', MB_OK);
        edtSerial.SetFocus;
        pnlAguarde.Visible := false;
        Abort;
      end
      else if ( Trim( retorno ) = 'BLOQUEADO' ) then
      begin
        MsgBox('"Prezado Cliente"'#13'Serial informado está bloqueado para utilização', MB_OK);
        edtSerial.SetFocus;
        pnlAguarde.Visible := false;
        Abort;
      end
      else if ( Trim( retorno ) = 'ATIVO' ) then
      begin
        MsgBox('"Prezado Cliente"'#13'Serial já está sendo utilizado por outro usuário.', MB_OK);
        edtSerial.SetFocus;
        pnlAguarde.Visible := false;
        Abort;
      end;

      //SETA O SERIAL PARA ATIVO
      retorno := RetornaConsultaPHP('update_ativo', edtSerial.Text);

      // GRAVA BANCO
      qryDeleteSerial.Close;
      qryDeleteSerial.ExecSQL;

      qryInsertSerial.Close;
      qryInsertSerial.ParamByName('NR_SERIAL').AsString  := fncCriptografia(Criptografar, edtSerial.Text);
      qryInsertSerial.ParamByName('FG_STATUS').AsString  := fncCriptografia(Criptografar, 'LIBERADO');
      qryInsertSerial.ExecSQL;

      trnsCadSerial.Commit;
      // **********************************

      pnlAguarde.Visible := false;
      ModalResult        := mrOk;

    end
    else
      MsgBox('"Prezado Cliente"'#13'Para informar o serial é necessário estar conectado na internet', MB_OK);

  end;

end;

end.
