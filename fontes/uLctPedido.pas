unit uLctPedido;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uPadrao, Grids, DBGrids, StdCtrls, Buttons, DB, IBODataset, DBCtrls,
  IB_Components, Mask, ExtCtrls, frxClass, frxExportPDF, frxDBSet, frxExportRTF,
  frxExportMail, frxExportODF, FileCtrl;

type
  TfrmLctPedido = class(TfrmPadrao)
    gpbCliente: TGroupBox;
    gpbBotoes: TGroupBox;
    btnIncluir: TBitBtn;
    btnExcluir: TBitBtn;
    btnAlterar: TBitBtn;
    gpbLancamentos: TGroupBox;
    dbgPedidos: TDBGrid;
    dblCliente: TDBLookupComboBox;
    dtsLancamentoPedido: TDataSource;
    trnsCadPadrao: TIB_Transaction;
    gpbPeriodo: TGroupBox;
    edtPeriodoInicio: TMaskEdit;
    edtPeriodoFim: TMaskEdit;
    Label1: TLabel;
    Panel1: TPanel;
    Panel5: TPanel;
    Panel6: TPanel;
    Label6: TLabel;
    Panel7: TPanel;
    qryLancamentoPedido: TIBOQuery;
    qryCliente: TIBOQuery;
    dtsCliente: TDataSource;
    qryConsulta: TIBOQuery;
    qryLancamentoPedidoItens: TIBOQuery;
    qryTotais: TIBOQuery;
    dtsTotais: TDataSource;
    dbtTotal: TDBText;
    btnImprimir: TBitBtn;
    qryNumPedidos: TIBOQuery;
    procedure btnIncluirClick(Sender: TObject);
    procedure edtPeriodoInicioExit(Sender: TObject);
    procedure edtPeriodoFimExit(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure dblClienteClick(Sender: TObject);
    procedure dblClienteKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure btnImprimirClick(Sender: TObject);
  private
    { Private declarations }

    procedure filtraLancamentos;

  public
    { Public declarations }
  end;

var
  frmLctPedido: TfrmLctPedido;

implementation

uses udmPrincipal, uLctPedidoDetalhe, uFuncoes, uImpPedido, uConstantes;

{$R *.dfm}

procedure TfrmLctPedido.btnAlterarClick(Sender: TObject);
begin
  inherited;

  if (not qryLancamentoPedido.IsEmpty) then
  begin

    frmLctPedidoDetalhe := TfrmLctPedidoDetalhe.Create(Self);

    frmLctPedidoDetalhe.cdsPedido.CreateDataSet;
    frmLctPedidoDetalhe.cdsPedido.Open;

    frmLctPedidoDetalhe.cdsPedido.Append;
    frmLctPedidoDetalhe.cdsPedido.FieldByName('ID_PEDIDO').Value             := qryLancamentoPedido.FieldByName('ID_PEDIDO').Value;
    frmLctPedidoDetalhe.cdsPedido.FieldByName('DT_PEDIDO').Value             := qryLancamentoPedido.FieldByName('DT_PEDIDO').Value;
    frmLctPedidoDetalhe.cdsPedido.FieldByName('HR_PEDIDO').Value             := qryLancamentoPedido.FieldByName('HR_PEDIDO').Value;
    frmLctPedidoDetalhe.cdsPedido.FieldByName('NR_PEDIDO').Value             := qryLancamentoPedido.FieldByName('NR_PEDIDO').Value;
    frmLctPedidoDetalhe.cdsPedido.FieldByName('DS_OBSERVACAO').Value         := qryLancamentoPedido.FieldByName('DS_OBSERVACAO').Value;
    frmLctPedidoDetalhe.cdsPedido.FieldByName('NR_QUANTIDADEPRODUTOS').Value := qryLancamentoPedido.FieldByName('NR_QUANTIDADEPRODUTOS').Value;
    frmLctPedidoDetalhe.cdsPedido.FieldByName('VR_TOTALPEDIDO').Value        := qryLancamentoPedido.FieldByName('VR_TOTALPEDIDO').Value;
    frmLctPedidoDetalhe.cdsPedido.FieldByName('CD_CLIENTE').Value            := qryLancamentoPedido.FieldByName('CD_CLIENTE').Value;
    frmLctPedidoDetalhe.cdsPedido.Post;

    frmLctPedidoDetalhe.cdsPedido.Edit;

    frmLctPedidoDetalhe.cdsPedidoItem.CreateDataSet;
    frmLctPedidoDetalhe.cdsPedidoItem.Open;

    qryLancamentoPedidoItens.Close;
    qryLancamentoPedidoItens.ParamByName('ID_PEDIDO').AsInteger := qryLancamentoPedido.FieldByName('ID_PEDIDO').AsInteger;
    qryLancamentoPedidoItens.Open;

    qryLancamentoPedidoItens.First;
    while (not qryLancamentoPedidoItens.Eof) do
    begin

      frmLctPedidoDetalhe.cdsPedidoItem.Append;
      frmLctPedidoDetalhe.cdsPedidoItem.FieldByName('ID_PRODUTO').Value           := qryLancamentoPedidoItens.FieldByName('ID_PRODUTO').Value;
      frmLctPedidoDetalhe.cdsPedidoItem.FieldByName('VR_UNITARIO').Value          := qryLancamentoPedidoItens.FieldByName('VR_UNITARIO').Value;
      frmLctPedidoDetalhe.cdsPedidoItem.FieldByName('NR_QUANTIDADEPRODUTO').Value := qryLancamentoPedidoItens.FieldByName('NR_QUANTIDADEPRODUTO').Value;
      frmLctPedidoDetalhe.cdsPedidoItem.FieldByName('VR_ACRESCIMO').Value         := qryLancamentoPedidoItens.FieldByName('VR_ACRESCIMO').Value;
      frmLctPedidoDetalhe.cdsPedidoItem.FieldByName('VR_DESCONTO').Value          := qryLancamentoPedidoItens.FieldByName('VR_DESCONTO').Value;
      frmLctPedidoDetalhe.cdsPedidoItem.FieldByName('VR_TOTAL').Value             := qryLancamentoPedidoItens.FieldByName('VR_TOTAL').Value;
      frmLctPedidoDetalhe.cdsPedidoItem.FieldByName('DS_NOME').Value              := qryLancamentoPedidoItens.FieldByName('DS_NOME').Value;
      frmLctPedidoDetalhe.cdsPedidoItem.Post;

      qryLancamentoPedidoItens.Next;

    end;

    frmLctPedidoDetalhe.cdsPedidoItem.First;

    frmLctPedidoDetalhe.fgOperacao := 'ALTERACAO';

    frmLctPedidoDetalhe.ShowModal;

    if ( frmLctPedidoDetalhe.ModalResult = mrOk ) then
    begin
      qryLancamentoPedido.Refresh;
      qryTotais.Refresh;
    end;

    FreeAndNil(frmLctPedidoDetalhe);

  end;

end;

procedure TfrmLctPedido.btnExcluirClick(Sender: TObject);
begin
  inherited;

  if ( not ( qryLancamentoPedido.IsEmpty ) ) then
  begin

    if ( MsgBox('"Prezado Cliente"'#13'Confirma a exclusão do registro selecionado?', MB_YESNO+MB_ICONQUESTION) = IDYES ) then
    begin

      try

        qryLancamentoPedido.Delete;
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

procedure TfrmLctPedido.btnImprimirClick(Sender: TObject);
begin
  inherited;

  frmImpPedido := TfrmImpPedido.Create(Self);

  if ( not qryLancamentoPedido.IsEmpty ) then
  begin
    frmImpPedido.edtNumPedido.Text := qryLancamentoPedido.FieldByName('NR_PEDIDO').AsString;
    frmImpPedido.edtIdPedido.Text  := qryLancamentoPedido.FieldByName('ID_PEDIDO').AsString;
  end;

  frmImpPedido.ShowModal;
  FreeAndNil(frmImpPedido);

end;

procedure TfrmLctPedido.btnIncluirClick(Sender: TObject);
begin
  inherited;

  if ( SISTEMA_DEMOSTRATIVO ) then
  begin

    qryNumPedidos.Close;
    qryNumPedidos.Open;

    if ( not ( qryNumPedidos.IsEmpty ) and ( qryNumPedidos.FieldByName('NR_PEDIDO').AsInteger > 50 ) ) then
    begin

      MsgBox('"Prezado Cliente"'+#13+
             'Você já lançou a quantidade máxima de Orçamentos para o sistema "DEMOSTRATIVO".'+#13#13+
             'Acesse nosso site: "'+SITE_EMPRESA+'", ou envie um e-mail para "'+EMAIL_EMPRESA+'" solicitando a versão '+
             'completa do '+NOME_SISTEMA, MB_OK+MB_ICONINFORMATION);
      Exit;

    end;

  end;

  frmLctPedidoDetalhe := TfrmLctPedidoDetalhe.Create(Self);

  frmLctPedidoDetalhe.cdsPedido.CreateDataSet;
  frmLctPedidoDetalhe.cdsPedido.Open;

  frmLctPedidoDetalhe.cdsPedidoItem.CreateDataSet;
  frmLctPedidoDetalhe.cdsPedidoItem.Open;

  frmLctPedidoDetalhe.cdsPedido.Insert;
  frmLctPedidoDetalhe.cdsPedido.FieldByName('DT_PEDIDO').Value := Now;
  frmLctPedidoDetalhe.cdsPedido.FieldByName('HR_PEDIDO').Value := StrToTime(FormatDateTime('hh:mm', Now));

  qryConsulta.Close;
  qryConsulta.SQL.Text := 'SELECT COUNT(LCT_PEDIDO.ID_PEDIDO) AS PEDIDO FROM LCT_PEDIDO';
  qryConsulta.Open;

  frmLctPedidoDetalhe.cdsPedido.FieldByName('NR_PEDIDO').Value := FormatFloat('000000', qryConsulta.FieldByName('PEDIDO').AsInteger+1);

  frmLctPedidoDetalhe.fgOperacao := 'INSERCAO';

  frmLctPedidoDetalhe.ShowModal;

  if ( frmLctPedidoDetalhe.ModalResult = mrOk ) then
  begin
    qryLancamentoPedido.Refresh;
    qryTotais.Refresh;
  end;

  FreeAndNil(frmLctPedidoDetalhe);

end;

procedure TfrmLctPedido.dblClienteClick(Sender: TObject);
begin
  inherited;

  filtraLancamentos;

end;

procedure TfrmLctPedido.dblClienteKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  inherited;

  if ( Key = VK_DELETE ) or ( Key = VK_BACK ) then
  begin
    dblCliente.KeyValue := Null;
    filtraLancamentos;
  end;

end;

procedure TfrmLctPedido.edtPeriodoFimExit(Sender: TObject);
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

procedure TfrmLctPedido.edtPeriodoInicioExit(Sender: TObject);
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

procedure TfrmLctPedido.filtraLancamentos;
begin

  qryLancamentoPedido.Close;
  qryTotais.Close;

  if (dblCliente.KeyValue <> null) then
  begin
    qryLancamentoPedido.SQL.Strings[14] := 'AND LCT_PEDIDO.CD_CLIENTE = ' + IntToStr(dblCliente.KeyValue);
    qryTotais.SQL.Strings[4]            := 'AND LCT_PEDIDO.CD_CLIENTE = ' + IntToStr(dblCliente.KeyValue);
  end
  else
  begin
    qryLancamentoPedido.SQL.Strings[14] := '/*AND LCT_PEDIDO.CD_CLIENTE = :CD_CLIENTE*/';
    qryTotais.SQL.Strings[4]            := '/*AND LCT_PEDIDO.CD_CLIENTE = :CD_CLIENTE*/';
  end;

  if (edtPeriodoInicio.Text <> '  /  /    ') or (edtPeriodoFim.Text <> '  /  /    ') then
  begin

    qryLancamentoPedido.SQL.Strings[15] := 'AND LCT_PEDIDO.DT_PEDIDO BETWEEN :DT_REFERENCIAINICIO AND :DT_REFERENCIAFIM';

    if (edtPeriodoInicio.Text <> '  /  /    ') then
    begin

      qryLancamentoPedido.ParamByName('DT_REFERENCIAINICIO').AsDateTime := StrToDate(edtPeriodoInicio.Text);

      if (edtPeriodoFim.Text = '  /  /    ') then
        qryLancamentoPedido.ParamByName('DT_REFERENCIAFIM').AsDateTime := StrToDate('31/12/9999')
      else
        qryLancamentoPedido.ParamByName('DT_REFERENCIAFIM').AsDateTime := StrToDate(edtPeriodoFim.Text);

    end
    else
    begin

      qryLancamentoPedido.ParamByName('DT_REFERENCIAFIM').AsDateTime := StrToDate(edtPeriodoFim.Text);

      if (edtPeriodoInicio.Text = '  /  /    ') then
        qryLancamentoPedido.ParamByName('DT_REFERENCIAINICIO').AsDateTime := StrToDate('01/01/0001')
      else
        qryLancamentoPedido.ParamByName('DT_REFERENCIAINICIO').AsDateTime := StrToDate(edtPeriodoInicio.Text);

    end;

  end
  else
    qryLancamentoPedido.SQL.Strings[15] := '/*AND LCT_PEDIDO.DT_PEDIDO BETWEEN :DT_REFERENCIAINICIO AND :DT_REFERENCIAFIM*/';

  qryLancamentoPedido.Open;
  qryTotais.Open;

end;

procedure TfrmLctPedido.FormCreate(Sender: TObject);
begin
  inherited;

  qryCliente.Close;
  qryCliente.Open;

  qryLancamentoPedido.Close;
  qryLancamentoPedido.Open;

  qryTotais.Close;
  qryTotais.Open;

  btnIncluir.Enabled := ( not SISTEMA_BLOQUEADO );
  btnExcluir.Enabled := ( not SISTEMA_BLOQUEADO );
  btnAlterar.Enabled := ( not SISTEMA_BLOQUEADO );

end;

end.
