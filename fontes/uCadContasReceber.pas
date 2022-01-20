unit uCadContasReceber;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uPadrao, DB, IBODataset, Grids, ValEdit, StdCtrls, DBCtrls, Mask,
  Buttons;

type
  TfrmCadContasReceber = class(TfrmPadrao)
    gpbBotoes: TGroupBox;
    btnConfirmar: TBitBtn;
    btnCancelar: TBitBtn;
    gpbDataVencimento: TGroupBox;
    dbeDataRecebimento: TDBEdit;
    gpbValor: TGroupBox;
    dbeValor: TDBEdit;
    gpbPagarA: TGroupBox;
    dbeReceberDe: TDBEdit;
    gpbDescricao: TGroupBox;
    dbeDescricao: TDBEdit;
    gpbObservacao: TGroupBox;
    dbeObservacao: TDBEdit;
    CamposObrigatorios: TValueListEditor;
    dtsContasReceber: TDataSource;
    procedure btnCancelarClick(Sender: TObject);
    procedure btnConfirmarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadContasReceber: TfrmCadContasReceber;

implementation

uses uLctContasReceber, uFuncoes, udmPrincipal;

{$R *.dfm}

procedure TfrmCadContasReceber.btnCancelarClick(Sender: TObject);
begin
  inherited;

  dtsContasReceber.DataSet.Cancel;
  ModalResult := mrCancel;

end;

procedure TfrmCadContasReceber.btnConfirmarClick(Sender: TObject);
begin
  inherited;

  if ( not ( ValidaCampoObrigatorio(Self, CamposObrigatorios) ) ) then
    Abort;

  try
    dtsContasReceber.DataSet.Post;
    frmLctContasReceber.trnsCadPadrao.Commit;
  except
    on e: Exception do
    begin
      frmLctContasReceber.trnsCadPadrao.Rollback;
      MsgBox('"Prezado Cliente"'#13'Ocorreu um erro na inclusão do registro com a seguinte mensagem: '+e.Message, MB_OK+MB_ICONINFORMATION);
    end;
  end;

  ModalResult := mrOk;

end;

procedure TfrmCadContasReceber.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;

  if ( dtsContasReceber.DataSet.State in [dsInsert,dsEdit] ) then
    dtsContasReceber.DataSet.Cancel;

end;

procedure TfrmCadContasReceber.FormShow(Sender: TObject);
begin
  inherited;

  if ( dbeDataRecebimento.Enabled ) then
    dbeDataRecebimento.SetFocus
  else if ( dbeReceberDe.Enabled ) then
    dbeReceberDe.SetFocus
  else
    btnCancelar.SetFocus;

end;

end.


