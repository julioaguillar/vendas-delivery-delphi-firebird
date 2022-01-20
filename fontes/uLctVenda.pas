unit uLctVenda;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  uPadrao, ExtCtrls, StdCtrls, ComCtrls, pngimage, DB, DBClient, IBODataset,
  IB_Components, Buttons;

type
  TfrmLctVenda = class(TfrmPadrao)
    tmrDataHora: TTimer;
    pnlFundo: TPanel;
    lblTotalPagar: TLabel;
    lblQtde: TLabel;
    lblCodigo: TLabel;
    shpCodigo: TShape;
    shpQtde: TShape;
    lblValorTotalItem: TLabel;
    shpValorTotalItem: TShape;
    lblValorUnitario: TLabel;
    shpValorUnitario: TShape;
    lblUnidade: TLabel;
    shpUnidade: TShape;
    Label5: TLabel;
    Label7: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label9: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Label23: TLabel;
    Label22: TLabel;
    lblDataHora: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    Label4: TLabel;
    pnlCupom: TPanel;
    RicEditCupomFiscal: TRichEdit;
    pnlProduto: TPanel;
    Panel1: TPanel;
    lblDescProdutoStatusCaixa: TLabel;
    edtCodigoProduto: TEdit;
    cdsProdutos: TClientDataSet;
    cdsProdutosID_VENDAITEM: TIntegerField;
    cdsProdutosID_PRODUTO: TIntegerField;
    cdsProdutosFG_UNIDADEMEDIDA: TStringField;
    cdsProdutosVR_UNITARIO: TFloatField;
    cdsProdutosNR_QUANTIDADE: TFloatField;
    cdsProdutosVR_DESCONTO: TFloatField;
    cdsProdutosVR_ACRESCIMO: TFloatField;
    cdsProdutosVR_TOTALITEM: TFloatField;
    qryConsProduto: TIBOQuery;
    cdsProdutosDS_DESCPRODUTO: TStringField;
    cdsVenda: TClientDataSet;
    cdsProdutosCD_PRODUTO: TStringField;
    lblOperador: TLabel;
    cdsVendaCD_CLIENTE: TIntegerField;
    cdsVendaDS_NOMECLIENTE: TStringField;
    cdsVendaCD_PROFISSIONAL: TIntegerField;
    cdsVendaDS_NOMEPROFISSIONAL: TStringField;
    cdsVendaDS_FORMAPAGAMENTO: TStringField;
    cdsVendaVR_TOTALVENDA: TFloatField;
    cdsVendaVR_TOTALPAGO: TFloatField;
    cdsVendaVR_TROCO: TFloatField;
    trnsCadPadrao: TIB_Transaction;
    qryVenda: TIBOQuery;
    qryVendaItem: TIBOQuery;
    qryConsulta: TIBOQuery;
    cdsProdutosVR_PRECOMINIMO: TFloatField;
    Panel2: TPanel;
    Label27: TLabel;
    Shape1: TShape;
    btnF1: TSpeedButton;
    btnF2: TSpeedButton;
    btnF3: TSpeedButton;
    btnF4: TSpeedButton;
    btnF5: TSpeedButton;
    btnF6: TSpeedButton;
    btnF12: TSpeedButton;
    Panel3: TPanel;
    Panel4: TPanel;
    Panel5: TPanel;
    Panel6: TPanel;
    Panel7: TPanel;
    edtValorUnitario: TEdit;
    edtQuantidade: TEdit;
    edtValoTotal: TEdit;
    edtUnidade: TEdit;
    edtTotalPagar: TLabel;
    btnF7: TSpeedButton;
    qryConsItemOrcamento: TIBOQuery;
    qryNumVendas: TIBOQuery;
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure tmrDataHoraTimer(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure edtCodigoProdutoKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure edtCodigoProdutoEnter(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure cdsVendaCalcFields(DataSet: TDataSet);
    procedure btnF1Click(Sender: TObject);
    procedure btnF2Click(Sender: TObject);
    procedure btnF3Click(Sender: TObject);
    procedure btnF4Click(Sender: TObject);
    procedure btnF5Click(Sender: TObject);
    procedure btnF6Click(Sender: TObject);
    procedure btnF12Click(Sender: TObject);
    procedure btnF7Click(Sender: TObject);
  private
    { Private declarations }

    function RetornaTotal: Double;

    procedure prcCancelarCupom;
    procedure prcInsereItemVendaMemo;
    procedure prcCaixaLivre;
    procedure prcConsultaProdutos;
    procedure InserirProduto(CodigoProduto: String);
    procedure prcAtualizaValorVenda;
    procedure prcCancelarItem;
    procedure prcFinalizarVenda;
    procedure prcAtualizaQuantidade;
    procedure prcAcrescimoItem;
    procedure prcDescontoItem;

  public
    { Public declarations }
  end;

var
  frmLctVenda: TfrmLctVenda;

implementation

uses uConsProdutoGrade, udmPrincipal, uFuncoes, uConstantes, uFinalizarVenda,
  uQuantidade, uAcrescimo, uDesconto, uConsLctPedido;

{$R *.dfm}

function fncPreencherString(Texto, Caracter, Lado: String; Quantidade: Integer): String;
var i : Integer;
    strSaida : String;
begin

  strSaida := Texto;

  if Lado = 'E' then
  begin

    for i := 1 to Quantidade  - Length( Texto ) do
      strSaida := caracter + strSaida;

  end
  else if Lado = 'D' then
  begin

    for i := 1 to Quantidade  - Length( Texto ) do
      strSaida := strSaida + caracter;

  end;

  Result := strSaida;

end;

procedure TfrmLctVenda.prcAtualizaValorVenda;
var vrTotal: Double;
begin

  cdsProdutos.DisableControls;
  cdsProdutos.First;

  vrTotal := 0.0;

  while not ( cdsProdutos.Eof ) do
  begin
    vrTotal := vrTotal + cdsProdutos.FieldByName('VR_TOTALITEM').AsFloat;
    cdsProdutos.Next;
  end;

  cdsProdutos.EnableControls;

  edtTotalPagar.Caption := FormatFloat(',0.00', vrTotal);

end;

function TfrmLctVenda.RetornaTotal: Double;
begin

  cdsProdutos.DisableControls;
  cdsProdutos.First;

  Result := 0.0;

  while not ( cdsProdutos.Eof ) do
  begin
    Result := Result + cdsProdutos.FieldByName('VR_TOTALITEM').AsFloat;
    cdsProdutos.Next;
  end;

  cdsProdutos.EnableControls;

end;

procedure TfrmLctVenda.InserirProduto(CodigoProduto: String);
var item: Integer;
begin

  qryConsProduto.Close;
  qryConsProduto.ParamByName('CD_PRODUTO').AsString := CodigoProduto;
  qryConsProduto.Open;

  if ( qryConsProduto.IsEmpty ) then
    MsgBox('"Prezado Cliente"'#13'Produto não cadastrado', MB_OK+MB_ICONINFORMATION)
  else
  begin

    item := cdsProdutos.RecordCount + 1;

    cdsProdutos.Append;
    cdsProdutos.FieldByName('ID_VENDAITEM').Value     := item;
    cdsProdutos.FieldByName('ID_PRODUTO').Value       := qryConsProduto.FieldByName('ID_PRODUTO').Value;
    cdsProdutos.FieldByName('FG_UNIDADEMEDIDA').Value := qryConsProduto.FieldByName('FG_UNIDADEMEDIDA').Value;
    cdsProdutos.FieldByName('VR_UNITARIO').Value      := qryConsProduto.FieldByName('VR_PRECOVENDA01').Value;
    cdsProdutos.FieldByName('CD_PRODUTO').Value       := qryConsProduto.FieldByName('CD_PRODUTO').Value;
    cdsProdutos.FieldByName('DS_DESCPRODUTO').Value   := qryConsProduto.FieldByName('DS_NOME').Value;
    cdsProdutos.FieldByName('NR_QUANTIDADE').Value    := 1.0;
    cdsProdutos.FieldByName('VR_DESCONTO').Value      := 0.0;
    cdsProdutos.FieldByName('VR_ACRESCIMO').Value     := 0.0;
    cdsProdutos.FieldByName('VR_TOTALITEM').Value     := cdsProdutos.FieldByName('VR_UNITARIO').AsFloat * cdsProdutos.FieldByName('NR_QUANTIDADE').AsFloat;
    cdsProdutos.FieldByName('VR_PRECOMINIMO').Value   := qryConsProduto.FieldByName('VR_PRECOVENDA03').Value;
    cdsProdutos.Post;

    edtValorUnitario.Text := FormatFloat('#,###,###,##0.00', cdsProdutos.FieldByName('VR_UNITARIO').AsFloat);
    edtQuantidade.Text    := FormatFloat('#,###,###,##0.000', cdsProdutos.FieldByName('NR_QUANTIDADE').AsFloat);
    edtValoTotal.Text     := FormatFloat('#,###,###,##0.00', cdsProdutos.FieldByName('VR_TOTALITEM').AsFloat);

    edtUnidade.Text := qryConsProduto.FieldByName('FG_UNIDADEMEDIDA').AsString;
    lblDescProdutoStatusCaixa.Caption := cdsProdutos.FieldByName('DS_DESCPRODUTO').AsString;

    prcInsereItemVendaMemo;
    prcAtualizaValorVenda;

    edtCodigoProduto.Clear;

  end;

end;

procedure TfrmLctVenda.btnF12Click(Sender: TObject);
begin
  inherited;

  Close;

end;

procedure TfrmLctVenda.btnF1Click(Sender: TObject);
begin
  inherited;

  prcAcrescimoItem;

end;

procedure TfrmLctVenda.btnF2Click(Sender: TObject);
begin
  inherited;

  prcDescontoItem;

end;

procedure TfrmLctVenda.btnF3Click(Sender: TObject);
begin
  inherited;

  prcCancelarItem;

end;

procedure TfrmLctVenda.btnF4Click(Sender: TObject);
begin
  inherited;

  prcAtualizaQuantidade;

end;

procedure TfrmLctVenda.btnF5Click(Sender: TObject);
begin
  inherited;

  prcCancelarCupom;

end;

procedure TfrmLctVenda.btnF6Click(Sender: TObject);
begin
  inherited;

  if ( SISTEMA_DEMOSTRATIVO ) then
  begin

    qryNumVendas.Close;
    qryNumVendas.Open;

    if ( not ( qryNumVendas.IsEmpty ) and ( qryNumVendas.FieldByName('NR_VENDA').AsInteger > 50 ) ) then
    begin

      MsgBox('"Prezado Cliente"'+#13+
             'Você já lançou a quantidade máxima de Vendas para o sistema "DEMOSTRATIVO".'+#13#13+
             'Acesse nosso site: "'+SITE_EMPRESA+'", ou envie um e-mail para "'+EMAIL_EMPRESA+'" solicitando a versão '+
             'completa do '+NOME_SISTEMA, MB_OK+MB_ICONINFORMATION);
      Exit;

    end;

  end;

  prcFinalizarVenda;

end;

procedure TfrmLctVenda.btnF7Click(Sender: TObject);
var item: Integer;
begin
  inherited;

  frmConsLctPedido := TfrmConsLctPedido.Create(Self);
  frmConsLctPedido.ShowModal;

  if ( frmConsLctPedido.ModalResult = mrOk ) and ( not frmConsLctPedido.qryLancamentoPedido.IsEmpty ) then
  begin

    qryConsItemOrcamento.Close;
    qryConsItemOrcamento.ParamByName('ID_PEDIDO').AsInteger := frmConsLctPedido.qryLancamentoPedido.FieldByName('ID_PEDIDO').AsInteger;
    qryConsItemOrcamento.Open;

    while not ( qryConsItemOrcamento.Eof ) do
    begin

      item := cdsProdutos.RecordCount + 1;

      cdsProdutos.Append;
      cdsProdutos.FieldByName('ID_VENDAITEM').Value     := item;
      cdsProdutos.FieldByName('ID_PRODUTO').Value       := qryConsItemOrcamento.FieldByName('ID_PRODUTO').Value;
      cdsProdutos.FieldByName('FG_UNIDADEMEDIDA').Value := qryConsItemOrcamento.FieldByName('FG_UNIDADEMEDIDA').Value;
      cdsProdutos.FieldByName('VR_UNITARIO').Value      := qryConsItemOrcamento.FieldByName('VR_UNITARIO').Value;
      cdsProdutos.FieldByName('CD_PRODUTO').Value       := qryConsItemOrcamento.FieldByName('CD_PRODUTO').Value;
      cdsProdutos.FieldByName('DS_DESCPRODUTO').Value   := qryConsItemOrcamento.FieldByName('DS_NOME').Value;
      cdsProdutos.FieldByName('NR_QUANTIDADE').Value    := qryConsItemOrcamento.FieldByName('NR_QUANTIDADEPRODUTO').Value;
      cdsProdutos.FieldByName('VR_DESCONTO').Value      := qryConsItemOrcamento.FieldByName('VR_DESCONTO').Value;
      cdsProdutos.FieldByName('VR_ACRESCIMO').Value     := qryConsItemOrcamento.FieldByName('VR_ACRESCIMO').Value;
      cdsProdutos.FieldByName('VR_TOTALITEM').Value     := qryConsItemOrcamento.FieldByName('VR_TOTAL').Value;
      cdsProdutos.FieldByName('VR_PRECOMINIMO').Value   := qryConsItemOrcamento.FieldByName('VR_PRECOVENDA03').Value;
      cdsProdutos.Post;

      qryConsItemOrcamento.Next;

    end;

    edtValorUnitario.Text := FormatFloat(',0.00', cdsProdutos.FieldByName('VR_UNITARIO').AsFloat);
    edtQuantidade.Text    := FormatFloat(',0.000', cdsProdutos.FieldByName('NR_QUANTIDADE').AsFloat);
    edtValoTotal.Text     := FormatFloat(',0.00', cdsProdutos.FieldByName('VR_TOTALITEM').AsFloat);

    edtUnidade.Text                   := cdsProdutos.FieldByName('FG_UNIDADEMEDIDA').AsString;
    lblDescProdutoStatusCaixa.Caption := cdsProdutos.FieldByName('DS_DESCPRODUTO').AsString;

    prcInsereItemVendaMemo;
    prcAtualizaValorVenda;

    edtCodigoProduto.Clear;

  end;

  FreeAndNil(frmConsLctPedido);

end;

procedure TfrmLctVenda.cdsVendaCalcFields(DataSet: TDataSet);
begin
  inherited;

  cdsVenda.FieldByName('VR_TROCO').AsFloat := cdsVenda.FieldByName('VR_TOTALPAGO').AsFloat - cdsVenda.FieldByName('VR_TOTALVENDA').AsFloat;

  if ( cdsVenda.FieldByName('VR_TROCO').AsFloat <= 0.0 ) then
    cdsVenda.FieldByName('VR_TROCO').AsFloat := 0.0;

end;

procedure TfrmLctVenda.edtCodigoProdutoEnter(Sender: TObject);
begin
  inherited;

  edtCodigoProduto.SelectAll;

end;

procedure TfrmLctVenda.edtCodigoProdutoKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  inherited;

  if (Key = VK_RETURN) then
  begin

    if (Trim(edtCodigoProduto.Text) <> '') then
      InserirProduto(Trim(edtCodigoProduto.Text));

  end;

end;

procedure TfrmLctVenda.FormActivate(Sender: TObject);
begin
  inherited;

  lblDataHora.Caption := FormatDateTime('DD/MM/YYYY - HH:MM', Now);

end;

procedure TfrmLctVenda.FormCreate(Sender: TObject);
begin
  inherited;

  lblOperador.Caption := GBL_USUARIO.DS_NOMEUSUARIO;

  cdsVenda.CreateDataSet;
  cdsVenda.Open;

  cdsProdutos.CreateDataSet;
  cdsProdutos.Open;

  prcCaixaLivre;

end;

procedure TfrmLctVenda.prcCancelarItem;
begin

  if ( not ( cdsProdutos.IsEmpty ) ) then
  begin

    if ( MsgBox('"Prezado Cliente"'#13'Deseja realmente cancelar o Item?', MB_YESNO+MB_ICONINFORMATION) = mrYes ) then
    begin

      cdsProdutos.Last;
      cdsProdutos.Delete;

      prcInsereItemVendaMemo;
      prcAtualizaValorVenda;

      edtValorUnitario.Clear;
      edtQuantidade.Clear;
      edtUnidade.Clear;
      edtValoTotal.Clear;

    end;

  end;

end;

procedure TfrmLctVenda.prcFinalizarVenda;
var id: Integer;
    ImprimirCupom, QuantidadeVias: String;
begin

  if ( not ( cdsProdutos.IsEmpty ) ) then
  begin

    if ( SISTEMA_BLOQUEADO ) then
    begin

      MsgBox('"Prezado Cliente"'+#13#13+
             'Sistema bloqueado para lançamentos.'+#13+
             'Entre em contato com Aon Sistemas para verificar a possível causa do bloqueio.',
             MB_OK+MB_ICONINFORMATION);
      Exit;

    end;

    cdsVenda.EmptyDataSet;

    cdsVenda.Append;
    cdsVenda.FieldByName('CD_CLIENTE').AsInteger       := 0;
    cdsVenda.FieldByName('DS_NOMECLIENTE').AsString    := 'CONSUMIDOR';
    cdsVenda.FieldByName('DS_FORMAPAGAMENTO').AsString := 'DINHEIRO';
    cdsVenda.FieldByName('VR_TOTALVENDA').AsFloat      := RetornaTotal;
    cdsVenda.FieldByName('VR_TOTALPAGO').AsFloat       := cdsVenda.FieldByName('VR_TOTALPAGO').AsFloat;

    frmFinalizarVenda := TfrmFinalizarVenda.Create(Self);

    frmFinalizarVenda.qryConsCliente.Close;
    frmFinalizarVenda.qryConsCliente.ParamByName('CD_CLIENTE').AsInteger := 0;
    frmFinalizarVenda.qryConsCliente.Open;

    frmFinalizarVenda.ShowModal;

    if ( frmFinalizarVenda.ModalResult = mrOk ) then
    begin

      lblDescProdutoStatusCaixa.Caption := 'AGUARDE...';

      // GRAVAR OS DADOS NO BANCO

      try

        trnsCadPadrao.StartTransaction;

        qryConsulta.Close;
        qryConsulta.SQL.Clear;
        qryConsulta.SQL.Text := 'SELECT GEN_ID(GEN_ID_LCT_VENDA, 1) AS ID FROM RDB$DATABASE';
        qryConsulta.Open;

        id := qryConsulta.FieldByName('ID').AsInteger;

        qryVenda.Close;
        qryVenda.ParamByName('ID_VENDA').Value          := id;
        qryVenda.ParamByName('CD_CLIENTE').Value        := cdsVenda.FieldByName('CD_CLIENTE').Value;
        qryVenda.ParamByName('CD_PROFISSIONAL').Value   := cdsVenda.FieldByName('CD_PROFISSIONAL').Value;
        qryVenda.ParamByName('DS_FORMAPAGAMENTO').Value := cdsVenda.FieldByName('DS_FORMAPAGAMENTO').Value;
        qryVenda.ParamByName('VR_TOTALVENDA').Value     := cdsVenda.FieldByName('VR_TOTALVENDA').Value;
        qryVenda.ParamByName('VR_TOTALPAGO').Value      := cdsVenda.FieldByName('VR_TOTALPAGO').Value;
        qryVenda.ParamByName('VR_TROCO').Value          := cdsVenda.FieldByName('VR_TROCO').Value;
        qryVenda.ParamByName('DT_VENDA').Value          := Now;
        qryVenda.ParamByName('HR_VENDA').Value          := Now;
        qryVenda.ParamByName('FG_STATUS').Value         := 'B';
        qryVenda.ParamByName('FG_ORIGEM').Value         := 'V';
        qryVenda.ExecSQL;

        cdsProdutos.First;

        while not cdsProdutos.Eof do
        begin

          qryVendaItem.Close;
          qryVendaItem.ParamByName('ID_VENDA').Value         := id;
          qryVendaItem.ParamByName('ID_VENDAITEM').Value     := cdsProdutos.RecNo;
          qryVendaItem.ParamByName('ID_PRODUTO').Value       := cdsProdutos.FieldByName('ID_PRODUTO').Value;
          qryVendaItem.ParamByName('FG_UNIDADEMEDIDA').Value := cdsProdutos.FieldByName('FG_UNIDADEMEDIDA').Value;
          qryVendaItem.ParamByName('VR_UNITARIO').Value      := cdsProdutos.FieldByName('VR_UNITARIO').Value;
          qryVendaItem.ParamByName('NR_QUANTIDADE').Value    := cdsProdutos.FieldByName('NR_QUANTIDADE').Value;
          qryVendaItem.ParamByName('VR_DESCONTO').Value      := cdsProdutos.FieldByName('VR_DESCONTO').Value;
          qryVendaItem.ParamByName('VR_ACRESCIMO').Value     := cdsProdutos.FieldByName('VR_ACRESCIMO').Value;
          qryVendaItem.ParamByName('VR_TOTALITEM').Value     := cdsProdutos.FieldByName('VR_TOTALITEM').Value;
          qryVendaItem.ExecSQL;

          cdsProdutos.Next;

        end;

        trnsCadPadrao.Commit;

        ImprimirCupom := GetIniValue('Parametros', 'ImprimirCupom');
        if ( ImprimirCupom <> 'NAO' ) then
        begin

          dmPrincipal.ImprimirExtrato(id, False, False);

          QuantidadeVias := GetIniValue('Parametros', 'QuantidadeVias');
          if ( QuantidadeVias = '2' ) then
            dmPrincipal.ImprimirExtrato(id, True, False);

        end;

      except
        on e: exception do
        begin
          MsgBox('"Prezado Cliente"'#13'Ocorreu um erro na gravação do lançamento com a seguinte mensagem:'+#13+e.Message, MB_OK+MB_ICONINFORMATION);
          trnsCadPadrao.Rollback;
        end;
      end;

      // ********************************************

      cdsVenda.EmptyDataSet;
      cdsProdutos.EmptyDataSet;

      RicEditCupomFiscal.Lines.Clear;
      prcCaixaLivre;

    end;

    FreeAndNil(frmFinalizarVenda);

  end;

end;

procedure TfrmLctVenda.prcAtualizaQuantidade;
begin

  if ( not ( cdsProdutos.IsEmpty ) ) then
  begin

    cdsProdutos.Last;
    cdsProdutos.Edit;

    frmQuantidade := TfrmQuantidade.Create(Self);
    frmQuantidade.ShowModal;

    if ( frmQuantidade.ModalResult = mrOK ) then
    begin
      prcInsereItemVendaMemo;
      prcAtualizaValorVenda;
    end;

    FreeAndNil(frmQuantidade);

  end;

end;

procedure TfrmLctVenda.prcAcrescimoItem;
begin

  if ( not ( cdsProdutos.IsEmpty ) ) then
  begin

    cdsProdutos.Last;
    cdsProdutos.Edit;

    frmAcrescimo := TfrmAcrescimo.Create(Self);
    frmAcrescimo.ShowModal;

    if ( frmAcrescimo.ModalResult = mrOK ) then
    begin
      prcInsereItemVendaMemo;
      prcAtualizaValorVenda;
    end;

    FreeAndNil(frmAcrescimo);

  end;

end;

procedure TfrmLctVenda.prcDescontoItem;
begin

  if ( not ( cdsProdutos.IsEmpty ) ) then
  begin

    cdsProdutos.Last;
    cdsProdutos.Edit;

    frmDesconto := TfrmDesconto.Create(Self);
    frmDesconto.ShowModal;

    if ( frmDesconto.ModalResult = mrOK ) then
    begin
      prcInsereItemVendaMemo;
      prcAtualizaValorVenda;
    end;

    FreeAndNil(frmDesconto);

  end;

end;

procedure TfrmLctVenda.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  inherited;

  if Key = VK_F1 then
    btnF1Click(btnF1)
  else if Key = VK_F2 then
    btnF2Click(btnF2)
  else if Key = VK_F3 then
    btnF3Click(btnF3)
  else if Key = VK_F4 then
    btnF4Click(btnF4)
  else if Key = VK_F5 then
    btnF5Click(btnF5)
  else if Key = VK_F6 then
    btnF6Click(btnF6)
  else if Key = VK_F7 then
    btnF7Click(btnF7)
  else if Key = VK_F9 then
  begin

    frmConsProdutoGrade := TfrmConsProdutoGrade.Create(Self);
    frmConsProdutoGrade.ShowModal;

    if ( frmConsProdutoGrade.ModalResult = mrOk ) then
      edtCodigoProduto.Text := frmConsProdutoGrade.qryConsProduto.FieldByName('CD_PRODUTO').AsString;

    FreeAndNil(frmConsProdutoGrade);

  end
  else if ( Key = VK_F12 ) then
    btnF12Click(btnF12);

end;

procedure TfrmLctVenda.prcCancelarCupom;
begin

  if ( not cdsProdutos.IsEmpty ) then
  begin

    if ( MsgBox('"Prezado Cliente"'#13'Deseja realmente cancelar a venda?', MB_YESNO+MB_ICONINFORMATION) = mrYes ) then
    begin

      cdsVenda.EmptyDataSet;
      cdsProdutos.EmptyDataSet;

      RicEditCupomFiscal.Lines.Clear;
      prcCaixaLivre;

    end;

  end;

end;

procedure TfrmLctVenda.prcConsultaProdutos;
begin

  frmConsProdutoGrade := TfrmConsProdutoGrade.Create(Self);
  frmConsProdutoGrade.ShowModal;

  if frmConsProdutoGrade.ModalResult = mrOK then
  begin

  end;

  FreeAndNil(frmConsProdutoGrade);

end;

procedure TfrmLctVenda.prcCaixaLivre;
begin

  lblDescProdutoStatusCaixa.Caption   := 'CAIXA LIVRE';
  //lblDescProdutoStatusCaixa.Alignment := taCenter;

  edtTotalPagar.Caption := '0,00';

  edtCodigoProduto.Clear;
  edtValorUnitario.Clear;
  edtQuantidade.Clear;
  edtUnidade.Clear;
  edtValoTotal.Clear;

end;

procedure TfrmLctVenda.tmrDataHoraTimer(Sender: TObject);
begin
  inherited;

  lblDataHora.Caption := FormatDateTime('DD/MM/YYYY - HH:MM', Now);

end;

procedure TfrmLctVenda.prcInsereItemVendaMemo;
var sLinha1, sLinha2, sLinhaDesconto, sLinhaAcrescimo, sLinhaCancelado: String;
begin

  RicEditCupomFiscal.Lines.Clear;
  cdsProdutos.First;

  while not ( cdsProdutos.Eof ) do
  begin

    sLinhaDesconto  := '';
    sLinhaAcrescimo := '';
    sLinhaCancelado := '';

    sLinha1 := fncPreencherString(FormatFloat('000', cdsProdutos.FieldByName('ID_VENDAITEM').AsInteger) + ' ', ' ', 'D', 05);
    sLinha1 := sLinha1 + fncPreencherString(Trim(cdsProdutos.FieldByName('CD_PRODUTO').AsString) + ' ', ' ', 'D', 19);
    sLinha1 := sLinha1 + fncPreencherString(Trim(cdsProdutos.FieldByName('DS_DESCPRODUTO').AsString) + ' ', ' ', 'D', 31);

    sLinha2 := fncPreencherString(FormatFloat(',0.00', cdsProdutos.FieldByName('VR_UNITARIO').AsFloat), ' ', 'E', 18);
    sLinha2 := sLinha2 + fncPreencherString(FormatFloat(',0.000', cdsProdutos.FieldByName('NR_QUANTIDADE').AsFloat) + '   ', ' ', 'E', 14);
    sLinha2 := sLinha2 + fncPreencherString(Trim(cdsProdutos.FieldByName('FG_UNIDADEMEDIDA').AsString) + ' ', ' ', 'D', 07);
    sLinha2 := sLinha2 + fncPreencherString(' ', ' ', 'D', 08);
    sLinha2 := sLinha2 + fncPreencherString(FormatFloat(',0.00', cdsProdutos.FieldByName('VR_TOTALITEM').AsFloat) + ' ', ' ', 'E', 18);

    if ( cdsProdutos.FieldByName('VR_DESCONTO').AsFloat > 0.0 ) then
    begin
      sLinhaDesconto := fncPreencherString('Desconto item : '+FormatFloat('000', cdsProdutos.FieldByName('ID_VENDAITEM').AsInteger) + ' ', ' ', 'D', 46);
      sLinhaDesconto := sLinhaDesconto + fncPreencherString(FormatFloat(',0.00', cdsProdutos.FieldByName('VR_DESCONTO').AsFloat), ' ', 'E', 18);
    end;

    if ( cdsProdutos.FieldByName('VR_ACRESCIMO').AsFloat > 0.0 ) then
    begin
      sLinhaAcrescimo := fncPreencherString('Acrescimo item: '+FormatFloat('000', cdsProdutos.FieldByName('ID_VENDAITEM').AsInteger) + ' ', ' ', 'D', 46);
      sLinhaAcrescimo := sLinhaAcrescimo + fncPreencherString(FormatFloat(',0.00', cdsProdutos.FieldByName('VR_ACRESCIMO').AsFloat), ' ', 'E', 18);
    end;

    //if ( cdsProdutos.FieldByName('FG_CANCELADO').AsString = 'S' ) then
    //begin
    //  sLinhaCancelado := fncPreencherString('Item Cancelado: '+FormatFloat('000', cdsProdutos.FieldByName('ID_VENDAITEM').AsInteger) + ' ', ' ', 'D', 46);
    //  sLinhaCancelado := sLinhaCancelado + fncPreencherString('-'+FormatFloat(',0.00', cdsProdutos.FieldByName('VR_TOTALITEM').AsFloat + cdsProdutos.FieldByName('VR_ACRESCIMO').AsFloat - cdsProdutos.FieldByName('VR_DESCONTO').AsFloat), ' ', 'E', 18);
    //end;

    RicEditCupomFiscal.Lines.Add(sLinha1);
    RicEditCupomFiscal.Lines.Add(sLinha2);

    if ( sLinhaDesconto <> '' ) then
      RicEditCupomFiscal.Lines.Add(sLinhaDesconto);

    if ( sLinhaAcrescimo <> '' ) then
      RicEditCupomFiscal.Lines.Add(sLinhaAcrescimo);

    if ( sLinhaCancelado <> '' ) then
      RicEditCupomFiscal.Lines.Add(sLinhaCancelado);

    cdsProdutos.Next;

  end;

  // CONTROLA A ROLAGEM DOS ITENS
  SendMessage(RicEditCupomFiscal.Handle, WM_VSCROLL, SB_BOTTOM, 0);

end;

end.
