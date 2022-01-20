unit uExecucaoScript;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uPadrao, StdCtrls, Buttons, IB_Process, IB_Script, IB_Components,
  ComCtrls;

type
  TfrmExecucaoScript = class(TfrmPadrao)
    gpbArquivoScript: TGroupBox;
    gpbBotoes: TGroupBox;
    btnConfirmar: TBitBtn;
    btnCancelar: TBitBtn;
    edtArquivo: TEdit;
    btnLocalizarArquivo: TSpeedButton;
    OpenDialog: TOpenDialog;
    IB_Transaction: TIB_Transaction;
    ibsAtualizaBancoDados: TIB_Script;
    ProgressBar: TProgressBar;
    procedure FormCreate(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure btnLocalizarArquivoClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnConfirmarClick(Sender: TObject);
    procedure ibsAtualizaBancoDadosStatement(Sender: TIB_Script;
      var Statement: AnsiString; var SkipIt: Boolean);
    procedure FormShow(Sender: TObject);
  private
    ExecActivate: Boolean;
    msgErro     : String;
    procedure CarregaSQL(PathArquivo: WideString);
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmExecucaoScript: TfrmExecucaoScript;

implementation

uses uFuncoes, udmPrincipal, uConstantes, uPrincipal;

{$R *.dfm}

procedure TfrmExecucaoScript.CarregaSQL(PathArquivo: WideString);
var arquivo: TextFile;
    linha  : WideString;
begin

  AssignFile(arquivo, PathArquivo);
  Reset(arquivo);

  while not Eof(arquivo) do
  begin

    Readln(arquivo, linha);
    ibsAtualizaBancoDados.SQL.Add(linha);

   end;

   CloseFile(arquivo);

end;

procedure TfrmExecucaoScript.btnCancelarClick(Sender: TObject);
begin
  inherited;

  Close;

end;

procedure TfrmExecucaoScript.btnConfirmarClick(Sender: TObject);
begin
  inherited;

  if ( FileExists(edtArquivo.Text) ) then
  begin

    if ( dmPrincipal.IB_Connection.Users.Count > 1 ) then
    begin

      MsgBox('"Prezado Cliente"'#13'Existem outros usuários conectados ao mesmo Banco de Dados, '+
             'solicite que o sistema seja finalizado. Em seguida execute o script novamente.', MB_OK+MB_ICONINFORMATION);
      Exit;

    end;

    ibsAtualizaBancoDados.SQL.Clear;
    CarregaSQL(edtArquivo.Text);

    ProgressBar.Position := 0;
    ProgressBar.Min      := 0;
    ProgressBar.Max      := Length( ibsAtualizaBancoDados.SQL.Text );

    try

      ibsAtualizaBancoDados.Execute;
      IB_Transaction.Commit;

      MsgBox('"Prezado Cliente"'#13'Script executado com sucesso.'+#13#13+
             'Para que as alterações tenham efeito o sistema '+NOME_SISTEMA+' será finalizado.'+#13+
             'Em seguida inicie o sistema novamente.', MB_OK+MB_ICONINFORMATION);

      try

        frmPrincipal.qryUsuarioOnline.Close;
        frmPrincipal.qryUsuarioOnline.ParamByName('DS_USUARIO').AsString := GBL_USUARIO.DS_USUARIO;
        frmPrincipal.qryUsuarioOnline.ExecSQL;

        frmPrincipal.trnsUsuario.Commit;

      except
      end;

      Application.Terminate;

    except
      on e: exception do
      begin
        IB_Transaction.Rollback;
        MsgBox('"Prezado Cliente"'#13'Ocorreu um erro na execução do script com a '+
               'seguinte mensagem:'+#13#13+e.Message+#13#13+msgErro, MB_OK+MB_ICONERROR);
      end;
    end;

    ProgressBar.Position := 0;

  end
  else
    MsgBox('"Prezado Cliente"'#13'O arquivo informado não foi encontrado', MB_OK+MB_ICONINFORMATION);

end;

procedure TfrmExecucaoScript.FormActivate(Sender: TObject);
begin
  inherited;

  if ( ExecActivate ) then
  begin

    ExecActivate := false;
    MsgBox('"Prezado Cliente"'#13'Esse procedimento deve ser executado com cautela '+
           'pois o mau uso pode levar a perda de informação do Banco de Dados.'+#13#13+
           'Verifique se existe usuários conectados ao Bando de Dados, se existir '+
           'solicite que o sistema seja finalizado.', MB_OK+MB_ICONINFORMATION);

  end;

end;

procedure TfrmExecucaoScript.FormCreate(Sender: TObject);
begin
  inherited;

  ExecActivate := true;

end;

procedure TfrmExecucaoScript.FormShow(Sender: TObject);
begin
  inherited;

  OpenDialog.DefaultExt := '*.'+AnsiLowerCase(NOME_EMPRESA);
  OpenDialog.Filter     := NOME_EMPRESA+' Script|*.'+AnsiLowerCase(NOME_EMPRESA);

end;

procedure TfrmExecucaoScript.ibsAtualizaBancoDadosStatement(Sender: TIB_Script;
  var Statement: AnsiString; var SkipIt: Boolean);
begin
  inherited;

  ProgressBar.Position := ibsAtualizaBancoDados.BeginPos;
  msgErro              := ibsAtualizaBancoDados.CurrentSQL;

end;

procedure TfrmExecucaoScript.btnLocalizarArquivoClick(Sender: TObject);
begin
  inherited;

  OpenDialog.InitialDir := ExtractFileDir(Application.ExeName);

  if ( OpenDialog.Execute ) then
    edtArquivo.Text := OpenDialog.FileName;

end;

end.
