unit uLctEntrada;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uPadrao, Grids, DBGrids, StdCtrls, Buttons, DB, IBODataset, DBCtrls,
  IB_Components, Mask, ExtCtrls, frxClass, frxExportPDF, frxDBSet, frxExportRTF,
  frxExportMail, frxExportODF, FileCtrl;

type
  TfrmLctEntrada = class(TfrmPadrao)
    gpbCliente: TGroupBox;
    gpbBotoes: TGroupBox;
    btnIncluir: TBitBtn;
    btnExcluir: TBitBtn;
    btnAlterar: TBitBtn;
    gpbPedidos: TGroupBox;
    dbgPedidos: TDBGrid;
    dblFornecedor: TDBLookupComboBox;
    dtsLancamentoEntrada: TDataSource;
    trnsCadPadrao: TIB_Transaction;
    gpbFiltro: TGroupBox;
    edtPeriodoInicio: TMaskEdit;
    edtPeriodoFim: TMaskEdit;
    Label1: TLabel;
    Panel1: TPanel;
    Panel5: TPanel;
    Panel6: TPanel;
    Label6: TLabel;
    Panel7: TPanel;
    qryLancamentoEntrada: TIBOQuery;
    qryFornecedor: TIBOQuery;
    dtsFornecedor: TDataSource;
    qryConsulta: TIBOQuery;
    qryLancamentoEntradaItems: TIBOQuery;
    qryTotais: TIBOQuery;
    dtsTotais: TDataSource;
    DBText1: TDBText;
    procedure btnIncluirClick(Sender: TObject);
    procedure edtPeriodoInicioExit(Sender: TObject);
    procedure edtPeriodoFimExit(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure dblFornecedorClick(Sender: TObject);
    procedure dblFornecedorKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
    procedure filtraLancamentos();
  public
    { Public declarations }
  end;

const
  STATUS_PENDENTE  = 'P';
  STATUS_ENVIADO   = 'E';
  STATUS_CANCELADO = 'X';
  STATUS_CONCLUIDO = 'C';

var
  frmLctEntrada: TfrmLctEntrada;

implementation

uses udmPrincipal, uLctEntradaDetalhe, uFuncoes, uConstantes;

{$R *.dfm}

procedure TfrmLctEntrada.btnAlterarClick(Sender: TObject);
begin
  inherited;

  if (not qryLancamentoEntrada.IsEmpty) then
  begin

    frmLctEntradaDetalhe := TfrmLctEntradaDetalhe.Create(Self);

    frmLctEntradaDetalhe.cdsEntrada.CreateDataSet;
    frmLctEntradaDetalhe.cdsEntrada.Open;

    frmLctEntradaDetalhe.cdsEntrada.Append;
    frmLctEntradaDetalhe.cdsEntrada.FieldByName('ID_ENTRADA').Value                      := qryLancamentoEntrada.FieldByName('ID_ENTRADA').Value;
    frmLctEntradaDetalhe.cdsEntrada.FieldByName('DT_ENTRADA').Value                      := qryLancamentoEntrada.FieldByName('DT_ENTRADA').Value;
    frmLctEntradaDetalhe.cdsEntrada.FieldByName('HR_ENTRADA').Value                      := qryLancamentoEntrada.FieldByName('HR_ENTRADA').Value;
    frmLctEntradaDetalhe.cdsEntrada.FieldByName('NR_ENTRADA').Value                      := qryLancamentoEntrada.FieldByName('NR_ENTRADA').Value;
    frmLctEntradaDetalhe.cdsEntrada.FieldByName('DS_ENTRADA').Value                      := qryLancamentoEntrada.FieldByName('DS_ENTRADA').Value;
    frmLctEntradaDetalhe.cdsEntrada.FieldByName('NR_QUANTIDADEPRODUTOS').Value           := qryLancamentoEntrada.FieldByName('NR_QUANTIDADEPRODUTOS').Value;
    frmLctEntradaDetalhe.cdsEntrada.FieldByName('VR_TOTALENTRADA').Value                 := qryLancamentoEntrada.FieldByName('VR_TOTALENTRADA').Value;
    frmLctEntradaDetalhe.cdsEntrada.FieldByName('CD_FORNECEDOR').Value                   := qryLancamentoEntrada.FieldByName('CD_FORNECEDOR').Value;
    frmLctEntradaDetalhe.cdsEntrada.Post;

    frmLctEntradaDetalhe.cdsEntrada.Edit;

    frmLctEntradaDetalhe.cdsEntradaItem.CreateDataSet;
    frmLctEntradaDetalhe.cdsEntradaItem.Open;

    qryLancamentoEntradaItems.Close;
    qryLancamentoEntradaItems.ParamByName('ID_ENTRADA').AsInteger := qryLancamentoEntrada.FieldByName('ID_ENTRADA').AsInteger;
    qryLancamentoEntradaItems.Open;

    qryLancamentoEntradaItems.First;
    while (not qryLancamentoEntradaItems.Eof) do
    begin

      frmLctEntradaDetalhe.cdsEntradaItem.Append;
      frmLctEntradaDetalhe.cdsEntradaItem.FieldByName('ID_PRODUTO').Value           := qryLancamentoEntradaItems.FieldByName('ID_PRODUTO').Value;
      frmLctEntradaDetalhe.cdsEntradaItem.FieldByName('VR_UNITARIO').Value          := qryLancamentoEntradaItems.FieldByName('VR_UNITARIO').Value;
      frmLctEntradaDetalhe.cdsEntradaItem.FieldByName('NR_QUANTIDADEPRODUTO').Value := qryLancamentoEntradaItems.FieldByName('NR_QUANTIDADEPRODUTO').Value;
      frmLctEntradaDetalhe.cdsEntradaItem.FieldByName('VR_DESCONTO').Value          := qryLancamentoEntradaItems.FieldByName('VR_DESCONTO').Value;
      frmLctEntradaDetalhe.cdsEntradaItem.FieldByName('VR_TOTAL').Value             := qryLancamentoEntradaItems.FieldByName('VR_TOTAL').Value;
      frmLctEntradaDetalhe.cdsEntradaItem.FieldByName('DS_NOME').Value              := qryLancamentoEntradaItems.FieldByName('DS_NOME').Value;
      frmLctEntradaDetalhe.cdsEntradaItem.Post;

      qryLancamentoEntradaItems.Next;

    end;

    frmLctEntradaDetalhe.cdsEntradaItem.First;

    frmLctEntradaDetalhe.fgOperacao := 'ALTERACAO';

    frmLctEntradaDetalhe.ShowModal;

    if ( frmLctEntradaDetalhe.ModalResult = mrOk ) then
    begin
      qryLancamentoEntrada.Refresh;
      qryTotais.Refresh;
    end;

    FreeAndNil(frmLctEntradaDetalhe);

  end;

end;

procedure TfrmLctEntrada.btnExcluirClick(Sender: TObject);
begin
  inherited;

  if ( not ( qryLancamentoEntrada.IsEmpty ) ) then
  begin

    if ( MsgBox('"Prezado Cliente"'#13'Confirma a exclusão do registro selecionado?', MB_YESNO+MB_ICONQUESTION) = IDYES ) then
    begin

      try

        qryLancamentoEntrada.Delete;
        trnsCadPadrao.Commit;

      except
        on e: Exception do
        begin
          trnsCadPadrao.Rollback;
          MsgBox('"Prezado Cliente"'#13'Ocorreu um erro na exclusão do registro com a seguinte mensagem:'+#13#13+e.Message, MB_OK+MB_ICONINFORMATION);
        end;
      end;

    end;

  end;

end;

procedure TfrmLctEntrada.btnIncluirClick(Sender: TObject);
begin
  inherited;

  frmLctEntradaDetalhe := TfrmLctEntradaDetalhe.Create(Self);

  frmLctEntradaDetalhe.cdsEntrada.CreateDataSet;
  frmLctEntradaDetalhe.cdsEntrada.Open;

  frmLctEntradaDetalhe.cdsEntradaItem.CreateDataSet;
  frmLctEntradaDetalhe.cdsEntradaItem.Open;

  frmLctEntradaDetalhe.cdsEntrada.Insert;
  frmLctEntradaDetalhe.cdsEntrada.FieldByName('DT_ENTRADA').Value := Now;
  frmLctEntradaDetalhe.cdsEntrada.FieldByName('HR_ENTRADA').Value := Now;

  qryConsulta.Close;
  qryConsulta.SQL.Text := 'SELECT COUNT(LCT_ENTRADA.ID_ENTRADA) AS ENTRADA FROM LCT_ENTRADA';
  qryConsulta.Open;

  frmLctEntradaDetalhe.cdsEntrada.FieldByName('NR_ENTRADA').Value := FormatFloat('000000', qryConsulta.FieldByName('ENTRADA').AsInteger+1);

  frmLctEntradaDetalhe.fgOperacao := 'INSERCAO';

  frmLctEntradaDetalhe.ShowModal;

  if ( frmLctEntradaDetalhe.ModalResult = mrOk ) then
  begin
    qryLancamentoEntrada.Refresh;
    qryTotais.Refresh;
  end;

  FreeAndNil(frmLctEntradaDetalhe);

end;

procedure TfrmLctEntrada.dblFornecedorClick(Sender: TObject);
begin
  inherited;

  filtraLancamentos;

end;

procedure TfrmLctEntrada.dblFornecedorKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;

  if ( Key = VK_DELETE ) or ( Key = VK_BACK ) then
  begin
    dblFornecedor.KeyValue := Null;
    filtraLancamentos;
  end;

end;

procedure TfrmLctEntrada.edtPeriodoFimExit(Sender: TObject);
begin
  inherited;

  if ( edtPeriodoFim.Text <> '  /  /    ' ) then
  begin

    try

      edtPeriodoFim.Text := FormatDateTime('dd/mm/yyyy', StrToDate(edtPeriodoFim.Text));

    except
      MsgBox('"Prezado Cliente"'#13'Data inválida', MB_OK+MB_ICONINFORMATION);
      edtPeriodoFim.SetFocus;
      Abort;
    end;

    if ( edtPeriodoInicio.Text = '  /  /    ' ) then
    begin
      MsgBox('"Prezado Cliente"'#13'Data inicial deve ser informada!', MB_OK+MB_ICONINFORMATION);
      edtPeriodoInicio.SetFocus;
      Abort;
    end;

    if ( edtPeriodoInicio.Text <> '  /  /    ' ) and ( StrToDate(edtPeriodoFim.Text) < StrToDate(edtPeriodoInicio.Text) ) then
    begin
      MsgBox('"Prezado Cliente"'#13'Data fim menor que a data início!', MB_OK+MB_ICONINFORMATION);
      edtPeriodoFim.SetFocus;
      Abort;
    end;

  end;

  filtraLancamentos;

end;

procedure TfrmLctEntrada.edtPeriodoInicioExit(Sender: TObject);
begin
  inherited;

  if ( edtPeriodoInicio.Text <> '  /  /    ' ) then
  begin

    try

      edtPeriodoInicio.Text := FormatDateTime('dd/mm/yyyy', StrToDate(edtPeriodoInicio.Text));

    except
      MsgBox('"Prezado Cliente"'#13'Data inválida', MB_OK+MB_ICONINFORMATION);
      edtPeriodoInicio.SetFocus;
      Abort;
    end;

    if ( edtPeriodoFim.Text <> '  /  /    ' ) and ( StrToDate(edtPeriodoInicio.Text) > StrToDate(edtPeriodoFim.Text) ) then
      edtPeriodoFim.Clear;

  end;

  filtraLancamentos;

end;

procedure TfrmLctEntrada.filtraLancamentos;
begin

  qryLancamentoEntrada.Close;
  qryTotais.Close;

  if (dblFornecedor.KeyValue <> null) then
  begin
    qryLancamentoEntrada.SQL.Strings[12] := 'AND LCT_ENTRADA.CD_FORNECEDOR = ' + IntToStr(dblFornecedor.KeyValue);
    qryTotais.SQL.Strings[4]             := 'AND LCT_ENTRADA.CD_FORNECEDOR = ' + IntToStr(dblFornecedor.KeyValue);
  end
  else
  begin
    qryLancamentoEntrada.SQL.Strings[12] := '/*AND LCT_ENTRADA.CD_FORNECEDOR = :CD_FORNECEDOR*/';
    qryTotais.SQL.Strings[4]             := '/*AND LCT_ENTRADA.CD_FORNECEDOR = :CD_FORNECEDOR*/';
  end;

  if (edtPeriodoInicio.Text <> '  /  /    ') or (edtPeriodoFim.Text <> '  /  /    ') then
  begin

    qryLancamentoEntrada.SQL.Strings[13] := 'AND LCT_ENTRADA.DT_ENTRADA BETWEEN :DT_REFERENCIAINICIO AND :DT_REFERENCIAFIM';

    if (edtPeriodoInicio.Text <> '  /  /    ') then
    begin

      qryLancamentoEntrada.ParamByName('DT_REFERENCIAINICIO').AsDateTime := StrToDate(edtPeriodoInicio.Text);

      if (edtPeriodoFim.Text = '  /  /    ') then
        qryLancamentoEntrada.ParamByName('DT_REFERENCIAFIM').AsDateTime := StrToDate('31/12/9999')
      else
        qryLancamentoEntrada.ParamByName('DT_REFERENCIAFIM').AsDateTime := StrToDate(edtPeriodoFim.Text);

    end
    else
    begin

      qryLancamentoEntrada.ParamByName('DT_REFERENCIAFIM').AsDateTime := StrToDate(edtPeriodoFim.Text);

      if (edtPeriodoInicio.Text = '  /  /    ') then
        qryLancamentoEntrada.ParamByName('DT_REFERENCIAINICIO').AsDateTime := StrToDate('01/01/0001')
      else
        qryLancamentoEntrada.ParamByName('DT_REFERENCIAINICIO').AsDateTime := StrToDate(edtPeriodoInicio.Text);

    end;

  end
  else
    qryLancamentoEntrada.SQL.Strings[13] := '/*AND LCT_ENTRADA.DT_ENTRADA BETWEEN :DT_REFERENCIAINICIO AND :DT_REFERENCIAFIM*/';

  qryLancamentoEntrada.Open;
  qryTotais.Open;

end;

procedure TfrmLctEntrada.FormCreate(Sender: TObject);
begin
  inherited;

  qryFornecedor.Close;
  qryFornecedor.Open;

  qryLancamentoEntrada.Close;
  qryLancamentoEntrada.Open;

  qryTotais.Close;
  qryTotais.Open;

  btnIncluir.Enabled := ( not SISTEMA_BLOQUEADO );
  btnExcluir.Enabled := ( not SISTEMA_BLOQUEADO );
  btnAlterar.Enabled := ( not SISTEMA_BLOQUEADO );

end;

end.
