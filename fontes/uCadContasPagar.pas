unit uCadContasPagar;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uPadrao, StdCtrls, DBCtrls, Mask, Buttons, DB, Grids, ValEdit,
  IBODataset;

type
  TfrmCadContasPagar = class(TfrmPadrao)
    gpbBotoes: TGroupBox;
    btnConfirmar: TBitBtn;
    btnCancelar: TBitBtn;
    gpbDataVencimento: TGroupBox;
    gpbValor: TGroupBox;
    gpbPagarA: TGroupBox;
    gpbDescricao: TGroupBox;
    gpbObservacao: TGroupBox;
    dbeDataVencimento: TDBEdit;
    dbeValor: TDBEdit;
    dbePagarA: TDBEdit;
    dbeDescricao: TDBEdit;
    dbeObservacao: TDBEdit;
    dtsContasAPagar: TDataSource;
    CamposObrigatorios: TValueListEditor;
    procedure btnConfirmarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadContasPagar: TfrmCadContasPagar;

implementation

uses uLctContasPagar, uFuncoes, udmPrincipal;

{$R *.dfm}

procedure TfrmCadContasPagar.btnCancelarClick(Sender: TObject);
begin
  inherited;

  dtsContasAPagar.DataSet.Cancel;
  ModalResult := mrCancel;

end;

procedure TfrmCadContasPagar.btnConfirmarClick(Sender: TObject);
begin
  inherited;

  if ( not ( ValidaCampoObrigatorio(Self, CamposObrigatorios) ) ) then
    Abort;

  try
    dtsContasAPagar.DataSet.Post;
    frmLctContasPagar.trnsCadPadrao.Commit;
  except
    on e: Exception do
    begin
      frmLctContasPagar.trnsCadPadrao.Rollback;
      MsgBox('"Prezado Cliente"'#13'Ocorreu um erro na inclusão do registro com a seguinte mensagem: '+e.Message, MB_OK+MB_ICONINFORMATION);
    end;
  end;

  ModalResult := mrOk;

end;

procedure TfrmCadContasPagar.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;

  if ( dtsContasAPagar.DataSet.State in [dsInsert,dsEdit] ) then
    dtsContasAPagar.DataSet.Cancel;

end;

procedure TfrmCadContasPagar.FormShow(Sender: TObject);
begin
  inherited;

  if ( dbeDataVencimento.Enabled ) then
    dbeDataVencimento.SetFocus
  else if ( dbePagarA.Enabled ) then
    dbePagarA.SetFocus
  else
    btnCancelar.SetFocus;

end;

end.
