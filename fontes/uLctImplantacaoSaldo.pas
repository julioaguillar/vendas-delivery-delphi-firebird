unit uLctImplantacaoSaldo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uPadrao, StdCtrls, Buttons, Grids, DBGrids, DB, IBODataset,
  IB_Components;

type
  TfrmLctImplantacaoSaldo = class(TfrmPadrao)
    gpbBotoes: TGroupBox;
    btnAlterar: TBitBtn;
    btnConfirmar: TBitBtn;
    btnCancelar: TBitBtn;
    gpbProdutos: TGroupBox;
    dbgSituacoes: TDBGrid;
    gpbPesquisa: TGroupBox;
    edtPesquisa: TEdit;
    dtsConsProduto: TDataSource;
    qryConsProduto: TIBOQuery;
    trnsCadPadrao: TIB_Transaction;
    edtConsCodigo: TEdit;
    procedure dbgSituacoesCellClick(Column: TColumn);
    procedure dbgSituacoesColEnter(Sender: TObject);
    procedure dbgSituacoesEnter(Sender: TObject);
    procedure dbgSituacoesKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure dbgSituacoesExit(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnConfirmarClick(Sender: TObject);
    procedure edtPesquisaChange(Sender: TObject);
    procedure edtConsCodigoChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmLctImplantacaoSaldo: TfrmLctImplantacaoSaldo;

implementation

uses udmPrincipal;

{$R *.dfm}

procedure TfrmLctImplantacaoSaldo.btnAlterarClick(Sender: TObject);
begin
  inherited;

  if ( not qryConsProduto.IsEmpty ) then
  begin

    btnAlterar.Enabled   := False;
    btnConfirmar.Enabled := True;
    btnCancelar.Enabled  := True;

    if ( not trnsCadPadrao.InTransaction ) then
      trnsCadPadrao.StartTransaction;

    dbgSituacoes.ReadOnly := False;
    dbgSituacoes.Options  := [dgEditing,dgTitles,dgIndicator,dgColLines,dgRowLines,dgTabs,dgConfirmDelete,dgCancelOnExit,dgTitleClick];

    qryConsProduto.First;
    dbgSituacoes.SelectedIndex := 3;

    dbgSituacoes.SetFocus;

  end;

end;

procedure TfrmLctImplantacaoSaldo.btnCancelarClick(Sender: TObject);
begin
  inherited;

  btnAlterar.Enabled   := True;
  btnConfirmar.Enabled := False;
  btnCancelar.Enabled  := False;

  dbgSituacoes.ReadOnly := True;
  dbgSituacoes.Options  := [dgTitles,dgIndicator,dgColLines,dgRowLines,dgTabs,dgConfirmDelete,dgCancelOnExit,dgTitleClick];

  if ( trnsCadPadrao.InTransaction ) then
    trnsCadPadrao.Rollback;

  qryConsProduto.Close;
  qryConsProduto.Open;

end;

procedure TfrmLctImplantacaoSaldo.btnConfirmarClick(Sender: TObject);
begin
  inherited;

  btnAlterar.Enabled   := True;
  btnConfirmar.Enabled := False;
  btnCancelar.Enabled  := False;

  dbgSituacoes.ReadOnly := True;
  dbgSituacoes.Options  := [dgTitles,dgIndicator,dgColLines,dgRowLines,dgTabs,dgConfirmDelete,dgCancelOnExit,dgTitleClick];

  if ( trnsCadPadrao.InTransaction ) then
    trnsCadPadrao.Commit;

  qryConsProduto.Close;
  qryConsProduto.Open;

end;

procedure TfrmLctImplantacaoSaldo.dbgSituacoesCellClick(Column: TColumn);
begin
  inherited;

  if ( not ( qryConsProduto.Active ) ) or ( qryConsProduto.IsEmpty ) then
    Exit;

end;

procedure TfrmLctImplantacaoSaldo.dbgSituacoesColEnter(Sender: TObject);
begin
  inherited;

  if ( dbgSituacoes.SelectedIndex <> 3 ) then
    dbgSituacoes.SelectedIndex := 3;

end;

procedure TfrmLctImplantacaoSaldo.dbgSituacoesEnter(Sender: TObject);
begin
  inherited;

  if (dbgSituacoes.SelectedIndex <> 3) then
    dbgSituacoes.SelectedIndex := 3;

  KeyPreview := False;

end;

procedure TfrmLctImplantacaoSaldo.dbgSituacoesExit(Sender: TObject);
begin
  inherited;

  KeyPreview := True;

end;

procedure TfrmLctImplantacaoSaldo.dbgSituacoesKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;

  if ( Key = VK_RETURN ) then
  begin

    if ( qryConsProduto.State = dsEdit ) then
      qryConsProduto.Post;

    if ( dbgSituacoes.SelectedIndex = 3 ) then
    begin

      qryConsProduto.DisableControls;
      qryConsProduto.Next;
      qryConsProduto.EnableControls;

      if ( dbgSituacoes.DataSource.DataSet.Eof ) then
        KeyPreview := True
      else
      begin
        dbgSituacoes.SelectedIndex := 3;
        dbgSituacoesCellClick( dbgSituacoes.Columns[dbgSituacoes.SelectedIndex] );
      end;

    end
    else
      Perform( wm_NextDlgCtl, 0, 0);

    Exit;

  end
  else if ( Key = VK_ESCAPE ) then
  begin

    if ( qryConsProduto.State = dsEdit ) then
      qryConsProduto.Post;

    if ( dbgSituacoes.SelectedIndex = 3 ) then
    begin

      qryConsProduto.DisableControls;
      qryConsProduto.Prior;
      qryConsProduto.EnableControls;

      if ( dbgSituacoes.DataSource.DataSet.Bof ) then
        KeyPreview := True
      else
      begin
        dbgSituacoes.SelectedIndex := 4;
        dbgSituacoesCellClick( dbgSituacoes.Columns[dbgSituacoes.SelectedIndex] );
      end;

    end
    else
      Perform(wm_NextDlgCtl, 1, 0);

    Exit;

  end;

  if ( Key = VK_DELETE ) and ( btnConfirmar.Enabled ) then
  begin

    if (dbgSituacoes.SelectedIndex = 3) then
    begin
      qryConsProduto.Edit;
      qryConsProduto.FieldByName('VR_SALDOINICIAL').Clear;
      qryConsProduto.Post;
    end;

  end;

end;

procedure TfrmLctImplantacaoSaldo.edtConsCodigoChange(Sender: TObject);
begin
  inherited;

  if ( not qryConsProduto.IsEmpty ) then
  begin

    if (Trim(edtPesquisa.Text) <> '') then
      edtPesquisa.Text := '';

    qryConsProduto.Locate('CD_PRODUTO', edtConsCodigo.Text, [loPartialKey]);
  end;

end;

procedure TfrmLctImplantacaoSaldo.edtPesquisaChange(Sender: TObject);
begin
  inherited;

  if ( not qryConsProduto.IsEmpty ) then
  begin

    if (Trim(edtConsCodigo.Text) <> '') then
      edtConsCodigo.Text := '';

    qryConsProduto.Locate('DS_NOME', UpperCase(edtPesquisa.Text), [loPartialKey]);
  end;

end;

procedure TfrmLctImplantacaoSaldo.FormCreate(Sender: TObject);
begin
  inherited;

  qryConsProduto.Close;
  qryConsProduto.Open;

  dbgSituacoes.SelectedIndex := 3;

end;

end.
