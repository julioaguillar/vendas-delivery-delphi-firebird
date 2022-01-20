unit uPrincipal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uPadrao, Menus, ComCtrls, Grids, ValEdit, ExtCtrls, DB, IBODataset,
  IB_Components, Buttons, ToolWin, ImgList, StdCtrls, DBGrids, ExtDlgs, jpeg,
  pngimage, DateUtils, DBClient, DBCtrls, AppEvnts, IniFiles, MidasLib,
  uThreadStatusSerial, ComObj, IdBaseComponent, IdComponent, IdTCPConnection,
  IdTCPClient, IdExplicitTLSClientServerBase, IdFTP, StrUtils, AonProcessbar;

type
  TfrmPrincipal = class(TfrmPadrao)
    mnPrincipal: TMainMenu;
    mnCadastro: TMenuItem;
    mnConfiguracoes: TMenuItem;
    mniConfigurarServidor: TMenuItem;
    trnsUsuario: TIB_Transaction;
    qryUsuarioOnline: TIBOQuery;
    timerLogin: TTimer;
    toolBar: TToolBar;
    N5: TMenuItem;
    N7: TMenuItem;
    mnAgenda: TMenuItem;
    mnImpressao: TMenuItem;
    mnUtilitarios: TMenuItem;
    mnLancamento: TMenuItem;
    mniCalculadora: TMenuItem;
    mniFluxoCaixa: TMenuItem;
    pnlRodape: TPanel;
    imgConexao: TImage;
    lblConexao: TLabel;
    lblSistema: TLabel;
    pnlDivisao: TPanel;
    imgUsuario: TImage;
    lblUsuario: TLabel;
    pnlDivisaoUsuario: TPanel;
    mniCadastroCliente: TMenuItem;
    mniCadastroUsuario: TMenuItem;
    mniCadastroProduto: TMenuItem;
    N12: TMenuItem;
    timerHora: TTimer;
    pnlMensagem: TPanel;
    edtMensagem: TEdit;
    OpenPictureDialog: TOpenPictureDialog;
    mniConsultaPaciente: TMenuItem;
    mniCadastroEmpresa: TMenuItem;
    mniAnotacoes: TMenuItem;
    pnlAnotacoes: TPanel;
    pnlTituloAnotacao: TPanel;
    btnFecharAnotacao: TSpeedButton;
    mniCalendario: TMenuItem;
    N22: TMenuItem;
    ppmAnotacoes: TPopupMenu;
    mnConsulta: TMenuItem;
    N24: TMenuItem;
    mniTelefones: TMenuItem;
    N26: TMenuItem;
    cdsAnotacao: TClientDataSet;
    cdsAnotacaoDS_ANOTACAO: TBlobField;
    dbmAnotacao: TDBMemo;
    dtsAnotacao: TDataSource;
    pmiTrazerFrenteAnotacao: TMenuItem;
    pmiEnviarTrasAnotacao: TMenuItem;
    pnlBotoes: TPanel;
    btnCliente: TSpeedButton;
    btnTelefone: TSpeedButton;
    btnCalculadora: TSpeedButton;
    btnCalendario: TSpeedButton;
    N2: TMenuItem;
    mniBackupRestore: TMenuItem;
    btnEntradaEstoque: TSpeedButton;
    ApplicationEvents: TApplicationEvents;
    N11: TMenuItem;
    mniExecucaodeScript: TMenuItem;
    mniFluxodeCaixa: TMenuItem;
    N28: TMenuItem;
    mniCadastroFeriado: TMenuItem;
    N31: TMenuItem;
    ImageList: TImageList;
    N35: TMenuItem;
    mniImpPaciente: TMenuItem;
    mniAjuda: TMenuItem;
    mniSobre: TMenuItem;
    N9: TMenuItem;
    mniSair: TMenuItem;
    mniCadastroEndereco: TMenuItem;
    N6: TMenuItem;
    imgFundo: TImage;
    mniConsultaRelacaoClientes: TMenuItem;
    N16: TMenuItem;
    pmiEntrada: TMenuItem;
    mniConsVenda: TMenuItem;
    N3: TMenuItem;
    mniCadastroProdutoCadastro: TMenuItem;
    N8: TMenuItem;
    mniCadastroProdutoCategoria: TMenuItem;
    mniCadastroFornecedor: TMenuItem;
    mniCadastroProdutoUnidade: TMenuItem;
    N15: TMenuItem;
    N17: TMenuItem;
    mniTabelaPreco: TMenuItem;
    btnVenda: TSpeedButton;
    pmiVenda: TMenuItem;
    btnPrecoProduto: TSpeedButton;
    N10: TMenuItem;
    mniImplantacaoSaldo: TMenuItem;
    btnProduto: TSpeedButton;
    timerSistemaBloqueado: TTimer;
    N1: TMenuItem;
    btnOrcamento: TSpeedButton;
    mniCadastroParametros: TMenuItem;
    N4: TMenuItem;
    pmiPedido: TMenuItem;
    N13: TMenuItem;
    N14: TMenuItem;
    mniRelatorioVendas: TMenuItem;
    mniOrcamento: TMenuItem;
    N18: TMenuItem;
    imgAon: TImage;
    imgAonvendas: TImage;
    mniGraficoVendas: TMenuItem;
    mniEstoque: TMenuItem;
    btnVendaDelivery: TSpeedButton;
    pmiVendaDelivery: TMenuItem;
    N19: TMenuItem;
    btnContasPagar: TSpeedButton;
    btnContasReceber: TSpeedButton;
    pmiContasPagar: TMenuItem;
    pmiContasReceber: TMenuItem;
    N20: TMenuItem;
    mniConsultaProduto: TMenuItem;
    N21: TMenuItem;
    mniControleAcessoUsuario: TMenuItem;
    qryConsultaPermissao: TIBOQuery;
    cdsMenu: TClientDataSet;
    cdsMenuDS_MENU: TStringField;
    mniAtendimentos: TMenuItem;
    N23: TMenuItem;
    mnProfissional: TMenuItem;
    N25: TMenuItem;
    procedure mniConfigurarServidorClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure timerLoginTimer(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure mniCalculadoraClick(Sender: TObject);
    procedure mniCadastroUsuarioClick(Sender: TObject);
    procedure mniConsultaPacienteClick(Sender: TObject);
    procedure mniCadastroEmpresaClick(Sender: TObject);
    procedure btnFecharClick(Sender: TObject);
    procedure mniCalendarioClick(Sender: TObject);
    procedure mniCadastroClienteClick(Sender: TObject);
    procedure mniTelefonesClick(Sender: TObject);
    procedure pnlTituloAnotacaoMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure pnlTituloAnotacaoMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
    procedure pnlTituloAnotacaoMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure btnFecharAnotacaoClick(Sender: TObject);
    procedure mniAnotacoesClick(Sender: TObject);
    procedure pmiTrazerFrenteAnotacaoClick(Sender: TObject);
    procedure pmiEnviarTrasAnotacaoClick(Sender: TObject);
    procedure btnTelefoneClick(Sender: TObject);
    procedure btnCalculadoraClick(Sender: TObject);
    procedure btnCalendarioClick(Sender: TObject);
    procedure mniFluxoCaixaClick(Sender: TObject);
    procedure mniBackupRestoreClick(Sender: TObject);
    procedure ApplicationEventsException(Sender: TObject; E: Exception);
    procedure mniExecucaodeScriptClick(Sender: TObject);
    procedure mniFluxodeCaixaClick(Sender: TObject);
    procedure dbmAnotacaoEnter(Sender: TObject);
    procedure dbmAnotacaoExit(Sender: TObject);
    procedure dbmAnotacaoKeyPress(Sender: TObject; var Key: Char);
    procedure mniCadastroFeriadoClick(Sender: TObject);
    procedure lblConexaoClick(Sender: TObject);
    procedure lblUsuarioClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure N39Click(Sender: TObject);
    procedure mniSairClick(Sender: TObject);
    procedure mniSobreClick(Sender: TObject);
    procedure btnClienteClick(Sender: TObject);
    procedure mniCadastroEnderecoClick(Sender: TObject);
    procedure mniConsultaRelacaoClientesClick(Sender: TObject);
    procedure mniCadastroProdutoCadastroClick(Sender: TObject);
    procedure mniCadastroProdutoCategoriaClick(Sender: TObject);
    procedure mniCadastroFornecedorClick(Sender: TObject);
    procedure mniCadastroProdutoUnidadeClick(Sender: TObject);
    procedure pmiEntradaClick(Sender: TObject);
    procedure btnEntradaEstoqueClick(Sender: TObject);
    procedure mniTabelaPrecoClick(Sender: TObject);
    procedure pmiVendaClick(Sender: TObject);
    procedure btnVendaClick(Sender: TObject);
    procedure mniConsVendaClick(Sender: TObject);
    procedure mniImpPacienteClick(Sender: TObject);
    procedure btnPrecoProdutoClick(Sender: TObject);
    procedure mniImplantacaoSaldoClick(Sender: TObject);
    procedure btnProdutoClick(Sender: TObject);
    procedure timerSistemaBloqueadoTimer(Sender: TObject);
    procedure mniCadastroParametrosClick(Sender: TObject);
    procedure pmiPedidoClick(Sender: TObject);
    procedure btnOrcamentoClick(Sender: TObject);
    procedure mniOrcamentoClick(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure mniRelatorioVendasClick(Sender: TObject);
    procedure mniGraficoVendasClick(Sender: TObject);
    procedure mniEstoqueClick(Sender: TObject);
    procedure pmiVendaDeliveryClick(Sender: TObject);
    procedure btnVendaDeliveryClick(Sender: TObject);
    procedure pmiContasPagarClick(Sender: TObject);
    procedure pmiContasReceberClick(Sender: TObject);
    procedure btnContasPagarClick(Sender: TObject);
    procedure btnContasReceberClick(Sender: TObject);
    procedure mniConsultaProdutoClick(Sender: TObject);
    procedure mniControleAcessoUsuarioClick(Sender: TObject);
    procedure mniAtendimentosClick(Sender: TObject);
    procedure mnProfissionalClick(Sender: TObject);
  private
    { Private declarations }

    criarForm, moverPanelAnotacao: Boolean;
    posicaoPanelAnotacao: TPoint;

    procedure setPosicaoPanelAnotacao;
    procedure CarregarAnotacao(Value: Boolean);
    procedure prcPermissaoUsuario;
    procedure HabilitarForm(Value: Boolean);

    function getPosicaoPanelAnotacao: TPoint;
    function VerificaSerial: Boolean;

  public
    { Public declarations }

    fgBloquearSistema: Boolean;

  end;

var
  frmPrincipal: TfrmPrincipal;
  StatusSerial: ThreadStatusSerial;

implementation

uses uConfigurarServidor, uCadUsuario, uLogin, udmPrincipal, uConstantes,
  uFuncoes, uCadProduto, uSobre, uCadEmpresa, uCalendario, uAgendaTelefone,
  uFluxoCaixa, uCopiaSeguranca, uExecucaoScript, uCadSerial, uImpFluxoCaixa,
  uImpAniversariantes, uCadFeriado, uSplashConexao, uCadEnderecoCEP,
  uVisualizaClientes, uCadCliente, uCadCategoriaProduto, uCadFornecedor,
  uCadUnidademedida, uLctEntrada, uLctVenda, uConsTabelaPreco, uLctSaida,
  uLctImplantacaoSaldo, uCadParametros, uLctPedido, uImpPedido, uImpVendas,
  uConsGraficoVendas, uConsEstoqueProduto, uLctVendaDelivery, uConsCliente,
  uLctContasPagar, uLctContasReceber, uSelProdutoCodigo, uControleAcesso,
  uCadAtendimento, uCadProfissional;

{$R *.dfm}

function TfrmPrincipal.VerificaSerial: Boolean;
var numSerial: String;
begin

  numSerial := '';
  Result    := true;

  if ( not ( SISTEMA_DEMOSTRATIVO ) ) then
  begin

    try

      dmPrincipal.qryConsSerial.Close;
      dmPrincipal.qryConsSerial.Open;

      numSerial := dmPrincipal.qryConsSerial.FieldByName('NR_SERIAL').AsString;

    except
    end;

    if ( numSerial = '' ) then
    begin

      frmCadSerial := TfrmCadSerial.Create(Self);
      frmCadSerial.ShowModal;

      if ( frmCadSerial.ModalResult <> mrOk ) then
        Result := false;

      FreeAndNil(frmCadSerial);

    end;

  end;

end;

procedure TfrmPrincipal.mniConsultaPacienteClick(Sender: TObject);
begin
  inherited;

  frmConsCliente := TfrmConsCliente.Create(Self);
  frmConsCliente.ShowModal;

  if ( frmConsCliente.ModalResult = mrOk ) and ( not ( frmConsCliente.qryConsCliente.IsEmpty ) ) then
  begin

    frmCadCliente := TfrmCadCliente.Create(Self);
    frmCadCliente.CarregaCliente(frmConsCliente.qryConsCliente.FieldByName('CD_CLIENTE').AsInteger);
    frmCadCliente.ShowModal;
    FreeAndNil(frmCadCliente);

  end;

  FreeAndNil(frmConsCliente);

end;

procedure TfrmPrincipal.mniConsultaProdutoClick(Sender: TObject);
var idProduto: Integer;
begin
  inherited;

  idProduto := 0;

  frmSelProdutoCodigo := TfrmSelProdutoCodigo.Create(Self);
  frmSelProdutoCodigo.ShowModal;

  if ( frmSelProdutoCodigo.ModalResult = mrOk ) then
    idProduto := frmSelProdutoCodigo.qryConsProduto.FieldByName('ID_PRODUTO').AsInteger;

  FreeAndNil(frmSelProdutoCodigo);

  if ( idProduto > 0 ) then
  begin
    frmCadProduto := TfrmCadProduto.Create(Self);
    frmCadProduto.idProduto := idProduto;
    frmCadProduto.ShowModal;
    FreeAndNil(frmCadProduto);
  end;

end;

procedure TfrmPrincipal.mniConsultaRelacaoClientesClick(Sender: TObject);
begin
  inherited;

  frmVisualizaClientes := TfrmVisualizaClientes.Create(Self);
  frmVisualizaClientes.ShowModal;
  FreeAndNil(frmVisualizaClientes);

end;

procedure TfrmPrincipal.mniCadastroEmpresaClick(Sender: TObject);
begin
  inherited;

  frmCadEmpresa := TfrmCadEmpresa.Create(Self);
  frmCadEmpresa.ShowModal;
  FreeAndNil(frmCadEmpresa);

end;

procedure TfrmPrincipal.btnClienteClick(Sender: TObject);
begin
  inherited;

  mniCadastroClienteClick(mniCadastroCliente);

end;

procedure TfrmPrincipal.btnContasPagarClick(Sender: TObject);
begin
  inherited;

  pmiContasPagarClick(pmiContasPagar);

end;

procedure TfrmPrincipal.btnContasReceberClick(Sender: TObject);
begin
  inherited;

  pmiContasReceberClick(pmiContasReceber);

end;

procedure TfrmPrincipal.btnCalculadoraClick(Sender: TObject);
begin
  inherited;

  mniCalculadoraClick(mniCalculadora);

end;

procedure TfrmPrincipal.btnCalendarioClick(Sender: TObject);
begin
  inherited;

  mniCalendarioClick(mniCalendario);

end;

procedure TfrmPrincipal.btnEntradaEstoqueClick(Sender: TObject);
begin
  inherited;

  pmiEntradaClick(pmiEntrada);

end;

procedure TfrmPrincipal.btnFecharClick(Sender: TObject);
begin
  inherited;

  timerHora.Enabled := false;

end;

procedure TfrmPrincipal.btnOrcamentoClick(Sender: TObject);
begin
  inherited;

  pmiPedidoClick(pmiPedido);

end;

procedure TfrmPrincipal.btnPrecoProdutoClick(Sender: TObject);
begin
  inherited;

  mniTabelaPrecoClick(mniTabelaPreco);

end;

procedure TfrmPrincipal.btnProdutoClick(Sender: TObject);
begin
  inherited;

  frmCadProduto := TfrmCadProduto.Create(Self);
  frmCadProduto.ShowModal;
  FreeAndNil(frmCadProduto);

end;

procedure TfrmPrincipal.dbmAnotacaoEnter(Sender: TObject);
begin
  inherited;

  Self.KeyPreview := false;

end;

procedure TfrmPrincipal.dbmAnotacaoExit(Sender: TObject);
begin
  inherited;

  Self.KeyPreview := true;

end;

procedure TfrmPrincipal.dbmAnotacaoKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;

  if ( dbmAnotacao.Lines.Count > 11 ) and ( Key <> #8 ) then
     key := #0;

end;

procedure TfrmPrincipal.mniCadastroEnderecoClick(Sender: TObject);
begin
  inherited;

  frmCadEnderecoCEP := TfrmCadEnderecoCEP.Create(Self);
  frmCadEnderecoCEP.ShowModal;
  FreeAndNil(frmCadEnderecoCEP);

end;

procedure TfrmPrincipal.pmiContasPagarClick(Sender: TObject);
begin
  inherited;

  frmLctContasPagar := TfrmLctContasPagar.Create(Self);
  frmLctContasPagar.ShowModal;
  FreeAndNil(frmLctContasPagar);

end;

procedure TfrmPrincipal.pmiContasReceberClick(Sender: TObject);
begin
  inherited;

  frmLctContasReceber := TfrmLctContasReceber.Create(Self);
  frmLctContasReceber.ShowModal;
  FreeAndNil(frmLctContasReceber);

end;

procedure TfrmPrincipal.pmiEntradaClick(Sender: TObject);
begin
  inherited;

  frmLctEntrada := TfrmLctEntrada.Create(Self);
  frmLctEntrada.ShowModal;
  FreeAndNil(frmLctEntrada);

end;

procedure TfrmPrincipal.mniEstoqueClick(Sender: TObject);
begin
  inherited;

  frmConsEstoqueProduto := TfrmConsEstoqueProduto.Create(Self);
  frmConsEstoqueProduto.ShowModal;
  FreeAndNil(frmConsEstoqueProduto);

end;

procedure TfrmPrincipal.mniExecucaodeScriptClick(Sender: TObject);
begin
  inherited;

  frmExecucaoScript := TfrmExecucaoScript.Create(Self);
  frmExecucaoScript.ShowModal;
  FreeAndNil(frmExecucaoScript);

end;

procedure TfrmPrincipal.mniTelefonesClick(Sender: TObject);
begin
  inherited;

  frmAgendaTelefone := TfrmAgendaTelefone.Create(Self);
  frmAgendaTelefone.ShowModal;
  FreeAndNil(frmAgendaTelefone);

end;

procedure TfrmPrincipal.mnProfissionalClick(Sender: TObject);
begin
  inherited;

  frmCadProfissional := TfrmCadProfissional.Create(Self);
  frmCadProfissional.ShowModal;
  FreeAndNil(frmCadProfissional);

end;

procedure TfrmPrincipal.mniCadastroUsuarioClick(Sender: TObject);
begin
  inherited;

  frmCadUsuario := TfrmCadUsuario.Create(Self);
  frmCadUsuario.ShowModal;
  FreeAndNil(frmCadUsuario);

end;

procedure TfrmPrincipal.mniCalculadoraClick(Sender: TObject);
var Mutex, H   : THandle;
    pathArquivo: AnsiString;
begin
  inherited;

  pathArquivo := ExtractFilePath(Application.ExeName);
  pathArquivo := pathArquivo+CALC_EMPRESA+'.exe';

  if FileExists( pathArquivo ) then
  begin

    try

      Mutex := CreateMutex(Nil, False, PChar(CALC_EMPRESA)  );

      if ( Mutex = 0 ) or ( GetLastError = ERROR_ALREADY_EXISTS ) then
        SetForegroundWindow( FindWindow(Nil, PChar(CALC_EMPRESA)) )
      else
      begin

        WinExec(PAnsiChar(pathArquivo+' calc20130513'), SW_SHOW);
        H := FindWindow(nil, PChar(CALC_EMPRESA));

        if H <> 0 then
          SetWindowText(H, PChar(CALC_EMPRESA));

      end;

    finally
      CloseHandle(Mutex);
    end;

  end
  else
    MsgBox('"Prezado Cliente"'#13'A ferramenta Calculadora não está disponível', MB_OK+MB_ICONINFORMATION);

end;

procedure TfrmPrincipal.mniCalendarioClick(Sender: TObject);
begin
  inherited;

  frmCalendario := TfrmCalendario.Create(Self);
  frmCalendario.ShowModal;
  FreeAndNil(frmCalendario);

end;

procedure TfrmPrincipal.mniFluxoCaixaClick(Sender: TObject);
begin
  inherited;

  frmFluxoCaixa := TfrmFluxoCaixa.Create(Self);
  frmFluxoCaixa.ShowModal;
  FreeAndNil(frmFluxoCaixa);

end;

procedure TfrmPrincipal.pmiEnviarTrasAnotacaoClick(Sender: TObject);
begin
  inherited;

  pnlAnotacoes.SendToBack;

end;

procedure TfrmPrincipal.pmiPedidoClick(Sender: TObject);
begin
  inherited;

  frmLctPedido := TfrmLctPedido.Create(Self);
  frmLctPedido.ShowModal;
  FreeAndNil(frmLctPedido);

end;

procedure TfrmPrincipal.mniConsVendaClick(Sender: TObject);
begin
  inherited;

  frmLctSaida := TfrmLctSaida.Create(Self);
  frmLctSaida.ShowModal;
  FreeAndNil(frmLctSaida);

end;

procedure TfrmPrincipal.mniImpPacienteClick(Sender: TObject);
begin
  inherited;

  frmImpAniversariantes := TfrmImpAniversariantes.Create(Self);
  frmImpAniversariantes.ShowModal;
  FreeAndNil(frmImpAniversariantes);

end;

procedure TfrmPrincipal.mniOrcamentoClick(Sender: TObject);
begin
  inherited;

  frmImpPedido := TfrmImpPedido.Create(Self);
  frmImpPedido.ShowModal;
  FreeAndNil(frmImpPedido);

end;

procedure TfrmPrincipal.mniRelatorioVendasClick(Sender: TObject);
begin
  inherited;

  frmImpVendas := TfrmImpVendas.Create(Self);
  frmImpVendas.ShowModal;
  FreeAndNil(frmImpVendas);

end;

procedure TfrmPrincipal.mniCadastroFeriadoClick(Sender: TObject);
begin
  inherited;

  frmCadFeriado := TfrmCadFeriado.Create(Self);
  frmCadFeriado.ShowModal;
  FreeAndNil(frmCadFeriado);

end;

procedure TfrmPrincipal.mniFluxodeCaixaClick(Sender: TObject);
begin
  inherited;

  frmImpFluxoCaixa := TfrmImpFluxoCaixa.Create(Self);
  frmImpFluxoCaixa.ShowModal;
  FreeAndNil(frmImpFluxoCaixa);

end;

procedure TfrmPrincipal.mniGraficoVendasClick(Sender: TObject);
begin
  inherited;

  frmConsGraficoVendas := TfrmConsGraficoVendas.Create(Self);
  frmConsGraficoVendas.ShowModal;
  FreeAndNil(frmConsGraficoVendas);

end;

procedure TfrmPrincipal.FormActivate(Sender: TObject);
begin
  inherited;

  if ( criarForm ) then
  begin
    criarForm          := false;
    timerLogin.Enabled := true;
  end;

end;

procedure TfrmPrincipal.FormClose(Sender: TObject; var Action: TCloseAction);
var Mutex: THandle;
begin
  inherited;

  try

    Mutex := CreateMutex(Nil, False, PChar(CALC_EMPRESA) );

    if ( Mutex = 0 ) or ( GetLastError = ERROR_ALREADY_EXISTS ) then
      PostMessage( FindWindow(Nil, PChar(CALC_EMPRESA)), WM_CLOSE, 0, 0);

    if ( pnlAnotacoes.Visible ) then
      setPosicaoPanelAnotacao;

  finally
    CloseHandle(Mutex);
  end;

end;

procedure TfrmPrincipal.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  inherited;

  if ( MsgBox('"Prezado Cliente'#13'Deseja finalizar o sistema?', MB_YESNO+MB_ICONQUESTION) = IDYES ) then
  begin

    try

      if ( cdsAnotacao.State in [dsInsert,dsEdit] ) then
        cdsAnotacao.Post;

      qryUsuarioOnline.Close;
      qryUsuarioOnline.ParamByName('DS_USUARIO').AsString := GBL_USUARIO.DS_USUARIO;
      qryUsuarioOnline.ExecSQL;

      trnsUsuario.Commit;

    except
    end;

    CanClose := true;

  end
  else
    CanClose := false;

end;

procedure TfrmPrincipal.mniAnotacoesClick(Sender: TObject);
begin
  inherited;

  if ( not ( pnlAnotacoes.Visible ) ) then
    CarregarAnotacao(true);

end;

procedure TfrmPrincipal.mniAtendimentosClick(Sender: TObject);
begin
  inherited;

  frmCadAtendimento := TfrmCadAtendimento.Create(Self);
  frmCadAtendimento.ShowModal;
  FreeAndNil(frmCadAtendimento);

end;

procedure TfrmPrincipal.mniTabelaPrecoClick(Sender: TObject);
begin
  inherited;

  frmConsTabelaPreco := TfrmConsTabelaPreco.Create(Self);
  frmConsTabelaPreco.ShowModal;
  FreeAndNil(frmConsTabelaPreco);

end;

procedure TfrmPrincipal.ApplicationEventsException(Sender: TObject; E: Exception);
begin
  inherited;

  //PrintScreenException(Sender, E);
  MsgBox(e.Message, MB_OK);

end;

procedure TfrmPrincipal.mniBackupRestoreClick(Sender: TObject);
begin
  inherited;

  frmCopiaSeguranca := TfrmCopiaSeguranca.Create(Self);
  frmCopiaSeguranca.ShowModal;
  FreeAndNil(frmCopiaSeguranca);

end;

procedure TfrmPrincipal.FormCreate(Sender: TObject);
var servidor, caminho, retornoStatus: String;
begin
  inherited;

  HabilitarForm(False);

  fgBloquearSistema := False;
  SISTEMA_BLOQUEADO := False;

  dmPrincipal.qryConsSerial.Close;
  dmPrincipal.qryConsSerial.Open;

  if ( dmPrincipal.qryConsSerial.FieldByName('FG_STATUS').AsString <> '' ) and
     ( fncCriptografia(Descriptografar, dmPrincipal.qryConsSerial.FieldByName('FG_STATUS').AsString) <> 'LIBERADO' ) then
  begin

    if ( ConexaoInternet ) then
    begin

      retornoStatus := RetornaConsultaPHP('status_serial', fncCriptografia(Descriptografar, dmPrincipal.qryConsSerial.FieldByName('NR_SERIAL').AsString));

      if ( retornoStatus = 'BLOQUEADO' ) then
      begin
        fgBloquearSistema := true;
        edtMensagem.Text  := MSG_SISTEMA_BLOQUEADO;
        BloquerMenuPrincipal(true);
      end
      else
      begin

        try

          dmPrincipal.qryStatusSerial.Close;
          dmPrincipal.qryStatusSerial.ParamByName('FG_STATUS').AsString := fncCriptografia(Criptografar, 'LIBERADO');
          dmPrincipal.qryStatusSerial.ExecSQL;

          dmPrincipal.IB_Transaction.Commit;

        except
        end;

      end;

    end
    else if ( fncCriptografia(Descriptografar, dmPrincipal.qryConsSerial.FieldByName('FG_STATUS').AsString) = 'BLOQUEADO' ) then
    begin
      edtMensagem.Text  := MSG_SISTEMA_BLOQUEADO;
      BloquerMenuPrincipal(true);
    end;

  end;

  criarForm := true;
  servidor  := GetIniValue('Conexao', 'Servidor');
  caminho   := GetIniValue('Conexao', 'CaminhoBanco');

  lblConexao.Caption := 'Conexão em: '+servidor+':'+caminho;
  lblSistema.Caption := 'Versão do Sistema: '+VERSAO_SISTEMA+' Build: '+BUILD_SISTEMA;

  timerSistemaBloqueado.Enabled := ( SISTEMA_BLOQUEADO );

end;

procedure TfrmPrincipal.FormResize(Sender: TObject);
begin
  inherited;

  imgAonvendas.Top  := pnlMensagem.Top + pnlMensagem.Height + 10;
  imgAonvendas.Left := 10;

  imgAon.Top  := pnlRodape.Top - imgAon.Height - 10;
  imgAon.Left := frmPrincipal.Width - imgAon.Width - 10;

end;

procedure TfrmPrincipal.FormShow(Sender: TObject);
begin
  inherited;

  frmPrincipal.Caption := NOME_SISTEMA + ' - Controle de Estoque e Vendas';
  lblSistema.Caption   := NOME_EMPRESA + ' - Versão: ' + VERSAO_SISTEMA + ' Build: ' +BUILD_SISTEMA;

end;

procedure TfrmPrincipal.mniCadastroFornecedorClick(Sender: TObject);
begin
  inherited;

  frmCadFornecedor := TfrmCadFornecedor.Create(Self);
  frmCadFornecedor.ShowModal;
  FreeAndNil(frmCadFornecedor);

end;

procedure TfrmPrincipal.lblConexaoClick(Sender: TObject);
begin
  inherited;

  mniConfigurarServidorClick(mniConfigurarServidor);

end;

procedure TfrmPrincipal.lblUsuarioClick(Sender: TObject);
begin
  inherited;

  mniCadastroUsuarioClick(mniCadastroUsuario);

end;

procedure TfrmPrincipal.mniConfigurarServidorClick(Sender: TObject);
begin
  inherited;

  frmConfigurarServidor := TfrmConfigurarServidor.Create(Self);
  frmConfigurarServidor.ShowModal;
  FreeAndNil(frmConfigurarServidor);

end;

procedure TfrmPrincipal.pnlTituloAnotacaoMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  inherited;

  SetCapture(pnlTituloAnotacao.Handle);

  moverPanelAnotacao     := True;
  posicaoPanelAnotacao.X := X;
  posicaoPanelAnotacao.Y := Y;

end;

procedure TfrmPrincipal.pnlTituloAnotacaoMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
var leftPanel, topPanel: Integer;
begin
  inherited;

  if ( moverPanelAnotacao ) then
  begin

    leftPanel := pnlAnotacoes.Left - ( posicaoPanelAnotacao.X - X );
    topPanel  := pnlAnotacoes.Top - ( posicaoPanelAnotacao.Y - Y );

    if ( leftPanel < 3 ) then
      leftPanel := 3
    else if ( leftPanel > ( frmPrincipal.Width - pnlAnotacoes.Width - 10 ) ) then
      leftPanel := frmPrincipal.Width - pnlAnotacoes.Width - 10;

    if ( topPanel < 85 ) then
      topPanel := 85
    else if ( topPanel > ( frmPrincipal.Height - pnlRodape.Height - pnlAnotacoes.Height - 50 ) ) then
      topPanel := frmPrincipal.Height - pnlRodape.Height - pnlAnotacoes.Height - 50;

    pnlAnotacoes.Left := leftPanel;
    pnlAnotacoes.Top  := topPanel;

  end;

end;

procedure TfrmPrincipal.pnlTituloAnotacaoMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var leftPanel, topPanel: Integer;
begin
  inherited;

  if ( moverPanelAnotacao ) then
  begin

    ReleaseCapture;
    moverPanelAnotacao := false;

    leftPanel := pnlAnotacoes.Left - ( posicaoPanelAnotacao.X - X );
    topPanel  := pnlAnotacoes.Top - ( posicaoPanelAnotacao.Y - Y );

    if ( leftPanel < 3 ) then
      leftPanel := 3
    else if ( leftPanel > ( frmPrincipal.Width - pnlAnotacoes.Width - 10 ) ) then
      leftPanel := frmPrincipal.Width - pnlAnotacoes.Width - 10;

    if ( topPanel < 85 ) then
      topPanel := 85
    else if ( topPanel > ( frmPrincipal.Height - pnlRodape.Height - pnlAnotacoes.Height - 50 ) ) then
      topPanel := frmPrincipal.Height - pnlRodape.Height - pnlAnotacoes.Height - 50;

    pnlAnotacoes.Left := leftPanel;
    pnlAnotacoes.Top  := topPanel;

  end;

end;

procedure TfrmPrincipal.mniCadastroClienteClick(Sender: TObject);
begin
  inherited;

  frmCadCliente := TfrmCadCliente.Create(Self);
  frmCadCliente.ShowModal;
  FreeAndNil(frmCadCliente);

end;

procedure TfrmPrincipal.mniCadastroParametrosClick(Sender: TObject);
begin
  inherited;

  frmCadParametros := TfrmCadParametros.Create(Self);
  frmCadParametros.ShowModal;
  FreeAndNil(frmCadParametros);

end;

procedure TfrmPrincipal.mniSairClick(Sender: TObject);
begin
  inherited;

  Close;

end;

procedure TfrmPrincipal.mniSobreClick(Sender: TObject);
begin
  inherited;

  frmSobre := TfrmSobre.Create(Self);
  frmSobre.ShowModal;
  FreeAndNil(frmSobre);

end;

procedure TfrmPrincipal.pmiTrazerFrenteAnotacaoClick(Sender: TObject);
begin
  inherited;

  pnlAnotacoes.BringToFront;

end;

procedure TfrmPrincipal.pmiVendaClick(Sender: TObject);
begin
  inherited;

  if ( SISTEMA_BLOQUEADO ) then
  begin

    MsgBox('"Prezado Cliente"'+#13#13+
           'Sistema Bloqueado'+#13+
           'Não é possível acessar o Lançamento de Venda. '+
           'Entre em contato para regulizar a situação e solicitar a liberação do sistema.', MB_OK+MB_ICONEXCLAMATION);
    Abort;

  end;

  frmLctVenda := TfrmLctVenda.Create(Self);
  frmLctVenda.ShowModal;
  FreeAndNil(frmLctVenda);

end;

procedure TfrmPrincipal.pmiVendaDeliveryClick(Sender: TObject);
begin
  inherited;

  if ( SISTEMA_BLOQUEADO ) then
  begin

    MsgBox('"Prezado Cliente"'+#13#13+
           'Sistema Bloqueado'+#13+
           'Não é possível acessar o Lançamento de Venda. '+
           'Entre em contato para regulizar a situação e solicitar a liberação do sistema.', MB_OK+MB_ICONEXCLAMATION);
    Abort;

  end;

  frmLctVendaDelivery := TfrmLctVendaDelivery.Create(Self);
  frmLctVendaDelivery.ShowModal;
  FreeAndNil(frmLctVendaDelivery);

end;

procedure TfrmPrincipal.N39Click(Sender: TObject);
begin
  inherited;

  frmSobre := TfrmSobre.Create(Self);
  frmSobre.ShowModal;
  FreeAndNil(frmSobre);

end;

procedure TfrmPrincipal.timerLoginTimer(Sender: TObject);
var fgModalResult: TModalResult;
    serialValido: Boolean;
    arquivo: String;
begin
  inherited;

  timerLogin.Enabled := false;

  if ( not ( fgBloquearSistema ) ) then
  begin

    serialValido := VerificaSerial;

    if ( serialValido ) then
    begin

      frmLogin := TfrmLogin.Create(Self);
      frmLogin.ShowModal;

      fgModalResult := frmLogin.ModalResult;
      FreeAndNil(frmLogin);

      if ( fgModalResult = mrOk ) then
      begin

        lblUsuario.Caption := 'Usuário: '+GBL_USUARIO.DS_USUARIO+'     ';

        lblUsuario.Visible        := true;
        imgUsuario.Visible        := true;
        pnlDivisaoUsuario.Visible := true;

        arquivo := ExtractFileDir(Application.ExeName) +'\anotacao.xml';

        if ( FileExists(arquivo) ) then
          CarregarAnotacao(true);

        if ( not ( SISTEMA_DEMOSTRATIVO ) ) then
        begin

          // Cria a Thread que verifica o status do serial
          StatusSerial := ThreadStatusSerial.Create(False);
          StatusSerial.FreeOnTerminate := True;
          StatusSerial.Priority        := tpIdle;
          StatusSerial.Resume;

        end
        else
          edtMensagem.Text := 'SISTEMA DEMOSTRATIVO - ' + AnsiUpperCase(SITE_EMPRESA);

        HabilitarForm(True);
        prcPermissaoUsuario;

      end
      else
        Application.Terminate;

    end
    else
      Application.Terminate;

  end
  else
  begin
    frmSobre := TfrmSobre.Create(Self);
    frmSobre.ShowModal;
    FreeAndNil(frmSobre);
  end;

end;

procedure TfrmPrincipal.timerSistemaBloqueadoTimer(Sender: TObject);
begin
  inherited;

  if ( SISTEMA_BLOQUEADO ) then
  begin

    if ( not Assigned(frmSobre) ) then
    begin
      frmSobre := TfrmSobre.Create(Self);
      frmSobre.ShowModal;
      FreeAndNil(frmSobre);
    end;

  end;

end;

procedure TfrmPrincipal.mniCadastroProdutoUnidadeClick(Sender: TObject);
begin
  inherited;

  frmCadUnidademedida := TfrmCadUnidademedida.Create(Self);
  frmCadUnidademedida.ShowModal;
  FreeAndNil(frmCadUnidademedida);

end;

procedure TfrmPrincipal.setPosicaoPanelAnotacao;
begin

  SetIniValue('Anotacao', 'LeftPanelAnotacao', IntToStr(pnlAnotacoes.Left));
  SetIniValue('Anotacao', 'TopPanelAnotacao' , IntToStr(pnlAnotacoes.Top));

end;

procedure TfrmPrincipal.btnFecharAnotacaoClick(Sender: TObject);
begin
  inherited;

  if ( MsgBox('"Prezado Cliente'#13'Tem certeza que deseja excluir a anotação', MB_YESNO+MB_ICONQUESTION) = IDYES ) then
    CarregarAnotacao(false);

end;

procedure TfrmPrincipal.btnTelefoneClick(Sender: TObject);
begin
  inherited;

  mniTelefonesClick(mniTelefones);

end;

procedure TfrmPrincipal.btnVendaClick(Sender: TObject);
begin
  inherited;

  pmiVendaClick(pmiVenda);

end;

procedure TfrmPrincipal.btnVendaDeliveryClick(Sender: TObject);
begin
  inherited;

  pmiVendaDeliveryClick(pmiVendaDelivery);

end;

procedure TfrmPrincipal.mniImplantacaoSaldoClick(Sender: TObject);
begin
  inherited;

  frmLctImplantacaoSaldo := TfrmLctImplantacaoSaldo.Create(Self);
  frmLctImplantacaoSaldo.ShowModal;
  FreeAndNil(frmLctImplantacaoSaldo);

end;

function TfrmPrincipal.getPosicaoPanelAnotacao: TPoint;
var LeftPanelAnotacao, TopPanelAnotacao: String;
begin

  Result.X := 4;
  Result.Y := 235;

  LeftPanelAnotacao := GetIniValue('Anotacao', 'LeftPanelAnotacao');
  TopPanelAnotacao  := GetIniValue('Anotacao', 'TopPanelAnotacao');

  if ( LeftPanelAnotacao <> '' ) then
  begin

    try
      Result.X := StrToInt(LeftPanelAnotacao);
    except
    end;

  end;

  if ( TopPanelAnotacao <> '' ) then
  begin

    try
      Result.Y := StrToInt(TopPanelAnotacao);
    except
    end;

  end;

end;

procedure TfrmPrincipal.mniCadastroProdutoCadastroClick(Sender: TObject);
begin
  inherited;

  frmCadProduto := TfrmCadProduto.Create(Self);
  frmCadProduto.ShowModal;
  FreeAndNil(frmCadProduto);

end;

procedure TfrmPrincipal.CarregarAnotacao(Value: Boolean);
var arquivo: String;
    posicao: TPoint;
begin

  try

    if ( Value ) then
    begin

      arquivo := ExtractFileDir(Application.ExeName) +'\anotacao.xml';

      if ( FileExists(arquivo) ) then
      begin

        cdsAnotacao.Close;
        cdsAnotacao.FileName := arquivo;
        cdsAnotacao.Open;

      end
      else
      begin

        cdsAnotacao.Close;
        cdsAnotacao.CreateDataSet;

        cdsAnotacao.SaveToFile(arquivo, dfXML);
        cdsAnotacao.FileName := arquivo;

      end;

      posicao      := getPosicaoPanelAnotacao;
      pnlAnotacoes.Left := posicao.X;
      pnlAnotacoes.Top  := posicao.Y;

    end
    else
    begin

      if ( cdsAnotacao.State in [dsInsert,dsEdit] ) then
        cdsAnotacao.Post;

      cdsAnotacao.Close;
      cdsAnotacao.FileName := '';

      arquivo := ExtractFileDir(Application.ExeName) +'\anotacao.xml';

      if ( FileExists(arquivo) ) then
        DeleteFile(arquivo);

      setPosicaoPanelAnotacao;

    end;

  except
  end;

  pnlAnotacoes.Visible := Value;

end;

procedure TfrmPrincipal.mniControleAcessoUsuarioClick(Sender: TObject);
begin
  inherited;

  frmControleAcesso := TfrmControleAcesso.Create(Self);
  frmControleAcesso.MenuPrincipal := mnPrincipal;
  frmControleAcesso.ShowModal;
  FreeAndNil(frmControleAcesso);

end;

procedure TfrmPrincipal.mniCadastroProdutoCategoriaClick(Sender: TObject);
begin
  inherited;

  frmCadCategoriaProduto := TfrmCadCategoriaProduto.Create(Self);
  frmCadCategoriaProduto.ShowModal;
  FreeAndNil(frmCadCategoriaProduto);

end;

procedure TfrmPrincipal.prcPermissaoUsuario;
var i, iQtdComponente: Integer;
    habilitar: Boolean;
    WaitMenu : TProcessamento;
    menuPai  : TMenuItem;

    bProduto, bCliente, bVenda, bVendaDelivery, bOrcamento, bEntradaEstoque,
    bContasPagar, bContasReceber, bPrecoProduto, bTelefone, bCalculadora,
    bCalendario: Boolean;

begin

  WaitMenu.CreateProcess;
  WaitMenu.Caption := 'Carregando Permissões do Usuário ' + Trim( GBL_USUARIO.DS_USUARIO ) + '...';
  WaitMenu.StartProcess;

  cdsMenu.EmptyDataSet;

  qryConsultaPermissao.Close;
  qryConsultaPermissao.ParamByName('DS_USUARIO').AsString := GBL_USUARIO.DS_USUARIO;
  qryConsultaPermissao.Open;

  if ( not qryConsultaPermissao.IsEmpty ) then
  begin

    while not ( qryConsultaPermissao.Eof ) do
    begin

      cdsMenu.Append;
      cdsMenu.FieldByName('DS_MENU').AsString := qryConsultaPermissao.FieldByName('DS_MENU').AsString;
      cdsMenu.Post;

      qryConsultaPermissao.Next;

    end;

  end;

  qryConsultaPermissao.Close;

  try

    try

      iQtdComponente := Pred( Self.ComponentCount );

      for i := 0 to iQtdComponente do
      begin

        if Self.Components[i] is TMenuItem then
        begin

          menuPai := TMenuItem( Self.Components[i] );
          while ( menuPai.Parent.name <> '' ) do
            menuPai := menuPai.Parent;

          // PARA DESABILITAR UM ITEM DO MENU NO FINAL DO NOME INSERIR DESABILITADO
          if ( UpperCase( RightStr(TMenuItem(Self.Components[i]).Name, 12) ) = 'DESABILITADO' ) then
          begin
            TMenuItem( Self.Components[i] ).Enabled := False;
            TMenuItem( Self.Components[i] ).Visible := False;
          end
          else
          begin
            TMenuItem( Self.Components[i] ).Enabled := True;
            TMenuItem( Self.Components[i] ).Visible := True;
          end;

        end;

      end;

      if not ( cdsMenu.IsEmpty ) then
      begin

        WaitMenu.NumProcess := 1;
        WaitMenu.SetMinMax(0, iQtdComponente);

        bProduto        := True;
        bCliente        := True;
        bVenda          := True;
        bVendaDelivery  := True;
        bOrcamento      := True;
        bEntradaEstoque := True;
        bContasPagar    := True;
        bContasReceber  := True;
        bPrecoProduto   := True;
        bTelefone       := True;
        bCalculadora    := True;
        bCalendario     := True;

        for i := 0 to iQtdComponente do
        begin

          WaitMenu.PositionBar := WaitMenu.PositionBar + 1;

          if Self.Components[i] is TMenuItem then
          begin

            menuPai := TMenuItem( Self.Components[i] );
            while ( menuPai.Parent.name <> '' ) do
              menuPai := menuPai.Parent;

            if ( UpperCase( RightStr(TMenuItem(Self.Components[i]).Name, 12) ) <> 'DESABILITADO' ) then
            begin

              habilitar := not ( cdsMenu.Locate('DS_MENU', TMenuItem(Self.Components[i]).Name, []) );

              TMenuItem( Self.Components[i] ).Enabled := habilitar;
              TMenuItem( Self.Components[i] ).Visible := habilitar;

              if ( TMenuItem(Self.Components[i]).Name = 'mniCadastroProdutoCadastro' ) then
                bProduto := habilitar
              else if ( TMenuItem(Self.Components[i]).Name = 'mniCadastroCliente' ) then
                bCliente := habilitar
              else if ( TMenuItem(Self.Components[i]).Name = 'pmiVenda' ) then
                bVenda := habilitar
              else if ( TMenuItem(Self.Components[i]).Name = 'pmiVendaDelivery' ) then
                bVendaDelivery := habilitar
              else if ( TMenuItem(Self.Components[i]).Name = 'pmiPedido' ) then
                bOrcamento := habilitar
              else if ( TMenuItem(Self.Components[i]).Name = 'pmiEntrada' ) then
                bEntradaEstoque := habilitar
              else if ( TMenuItem(Self.Components[i]).Name = 'pmiContasPagar' ) then
                bContasPagar := habilitar
              else if ( TMenuItem(Self.Components[i]).Name = 'pmiContasReceber' ) then
                bContasReceber := habilitar
              else if ( TMenuItem(Self.Components[i]).Name = 'mniTabelaPreco' ) then
                bPrecoProduto := habilitar
              else if ( TMenuItem(Self.Components[i]).Name = 'mniTelefones' ) then
                bTelefone := habilitar
              else if ( TMenuItem(Self.Components[i]).Name = 'mniCalculadora' ) then
                bCalculadora := habilitar
              else if ( TMenuItem(Self.Components[i]).Name = 'mniCalendario' ) then
                bCalendario := habilitar;

            end
            else
            begin

              TMenuItem( Self.Components[i] ).Enabled := False;
              TMenuItem( Self.Components[i] ).Visible := False;

            end;

          end;

        end;

        btnProduto.Visible        := bProduto;
        btnCliente.Visible        := bCliente;
        btnVenda.Visible          := bVenda;
        btnVendaDelivery.Visible  := bVendaDelivery;
        btnOrcamento.Visible      := bOrcamento;
        btnEntradaEstoque.Visible := bEntradaEstoque;
        btnContasPagar.Visible    := bContasPagar;
        btnContasReceber.Visible  := bContasReceber;
        btnPrecoProduto.Visible   := bPrecoProduto;
        btnTelefone.Visible       := bTelefone;
        btnCalculadora.Visible    := bCalculadora;
        btnCalendario.Visible     := bCalendario;

      end;

      toolBar.Refresh;

    except
      MsgBox('"Prezado Cliente"'+#13+'Ocorreu um erro ao atribuir as permissões para o usuário.', MB_OK+MB_ICONINFORMATION);
    end;

  finally
    WaitMenu.CloseProcess;
  end;

end;

procedure TfrmPrincipal.HabilitarForm(Value: Boolean);
begin

  if ( Value ) then
  begin

    frmPrincipal.Color := $00BD8742;
    prcManipulaImagem(imgFundo, Colorido);

  end
  else
  begin

    frmPrincipal.Color := $00787878;
    prcManipulaImagem(imgFundo, EscalaCinza);

  end;

  btnProduto.Enabled        := Value;
  btnCliente.Enabled        := Value;
  btnVenda.Enabled          := Value;
  btnVendaDelivery.Enabled  := Value;
  btnOrcamento.Enabled      := Value;
  btnEntradaEstoque.Enabled := Value;
  btnContasPagar.Enabled    := Value;
  btnContasReceber.Enabled  := Value;
  btnPrecoProduto.Enabled   := Value;
  btnTelefone.Enabled       := Value;
  btnCalculadora.Enabled    := Value;
  btnCalendario.Enabled     := Value;

end;

end.
