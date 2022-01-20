program AonVendas;

uses
  Forms,
  Windows,
  SysUtils,
  uPadrao in 'uPadrao.pas' {frmPadrao},
  uCadPadrao in 'uCadPadrao.pas' {frmCadPadrao},
  uConsPadrao in 'uConsPadrao.pas' {frmConsPadrao},
  uPrincipal in 'uPrincipal.pas' {frmPrincipal},
  udmPrincipal in 'udmPrincipal.pas' {dmPrincipal: TDataModule},
  uSplashScreen in 'uSplashScreen.pas' {frmSpleshScreen},
  uFuncoes in 'uFuncoes.pas',
  uConfigurarServidor in 'uConfigurarServidor.pas' {frmConfigurarServidor},
  uCadUsuario in 'uCadUsuario.pas' {frmCadUsuario},
  uCampoObrigatorio in 'uCampoObrigatorio.pas' {frmCampoObrigatorio},
  uLogin in 'uLogin.pas' {frmLogin},
  uConstantes in 'uConstantes.pas',
  uCadCliente in 'uCadCliente.pas' {frmCadCliente},
  uCadVendedor in 'uCadVendedor.pas' {frmCadVendedor},
  uCadProduto in 'uCadProduto.pas' {frmCadProduto},
  uSobre in 'uSobre.pas' {frmSobre},
  uCadEmpresa in 'uCadEmpresa.pas' {frmCadEmpresa},
  uCalendario in 'uCalendario.pas' {frmCalendario},
  uAgendaTelefone in 'uAgendaTelefone.pas' {frmAgendaTelefone},
  uCadAgendaTelefone in 'uCadAgendaTelefone.pas' {frmCadAgendaTelefone},
  uFluxoCaixa in 'uFluxoCaixa.pas' {frmFluxoCaixa},
  uCopiaSeguranca in 'uCopiaSeguranca.pas' {frmCopiaSeguranca},
  uScript in 'uScript.pas',
  uExecucaoScript in 'uExecucaoScript.pas' {frmExecucaoScript},
  uCadSerial in 'uCadSerial.pas' {frmCadSerial},
  uImpAniversariantes in 'uImpAniversariantes.pas' {frmImpAniversariantes},
  uImpFluxoCaixa in 'uImpFluxoCaixa.pas' {frmImpFluxoCaixa},
  uCadFeriado in 'uCadFeriado.pas' {frmCadFeriado},
  uSplashConexao in 'uSplashConexao.pas' {frmSplashConexao},
  uThreadStatusSerial in 'uThreadStatusSerial.pas',
  uCadFotoCliente in 'uCadFotoCliente.pas' {frmCadFotoCliente},
  uAtualizacaoBanco in 'uAtualizacaoBanco.pas' {frmAtualizacaoBanco},
  uOpcoesPadrao in 'uOpcoesPadrao.pas' {frmOpcoesPadrao},
  uCadEnderecoCEP in 'uCadEnderecoCEP.pas' {frmCadEnderecoCEP},
  uMsgErrosPadrao in 'uMsgErrosPadrao.pas' {frmMsgErrosPadrao},
  uMsgErrosMensalidade in 'uMsgErrosMensalidade.pas' {frmMsgErrosMensalidade},
  uVisualizaClientes in 'uVisualizaClientes.pas' {frmVisualizaClientes},
  uCadCategoriaProduto in 'uCadCategoriaProduto.pas' {frmCadCategoriaProduto},
  uCadFornecedor in 'uCadFornecedor.pas' {frmCadFornecedor},
  uCadUnidademedida in 'uCadUnidademedida.pas' {frmCadUnidademedida},
  uLctEntrada in 'uLctEntrada.pas' {frmLctEntrada},
  uLctEntradaDetalhe in 'uLctEntradaDetalhe.pas' {frmLctEntradaDetalhe},
  uCadProdutoEntrada in 'uCadProdutoEntrada.pas' {frmCadProdutoEntrada},
  uLctVenda in 'uLctVenda.pas' {frmLctVenda},
  uConsProdutoGrade in 'uConsProdutoGrade.pas' {frmConsProdutoGrade},
  uAcrescimo in 'uAcrescimo.pas' {frmAcrescimo},
  uDesconto in 'uDesconto.pas' {frmDesconto},
  uFinalizarVenda in 'uFinalizarVenda.pas' {frmFinalizarVenda},
  uQuantidade in 'uQuantidade.pas' {frmQuantidade},
  uConsTabelaPreco in 'uConsTabelaPreco.pas' {frmConsTabelaPreco},
  uConsVendedorVenda in 'uConsVendedorVenda.pas' {frmConsVendedorVenda},
  uConsClienteVenda in 'uConsClienteVenda.pas' {frmConsClienteVenda},
  uLctSaida in 'uLctSaida.pas' {frmLctSaida},
  uLctSaidaDetalhamento in 'uLctSaidaDetalhamento.pas' {frmLctSaidaDetalhamento},
  uLctImplantacaoSaldo in 'uLctImplantacaoSaldo.pas' {frmLctImplantacaoSaldo},
  uSystemInformation in 'uSystemInformation.pas',
  DelphiZXIngQRCode in 'DelphiZXIngQRCode.pas',
  uCadParametros in 'uCadParametros.pas' {frmCadParametros},
  uLctPedido in 'uLctPedido.pas' {frmLctPedido},
  uLctPedidoDetalhe in 'uLctPedidoDetalhe.pas' {frmLctPedidoDetalhe},
  uCadProdutoPedido in 'uCadProdutoPedido.pas' {frmCadProdutoPedido},
  uConsLctPedido in 'uConsLctPedido.pas' {frmConsLctPedido},
  uImpPedido in 'uImpPedido.pas' {frmImpPedido},
  uImpVendas in 'uImpVendas.pas' {frmImpVendas},
  uConsGraficoVendas in 'uConsGraficoVendas.pas' {frmConsGraficoVendas},
  uConsEstoqueProduto in 'uConsEstoqueProduto.pas' {frmConsEstoqueProduto},
  uLctVendaDelivery in 'uLctVendaDelivery.pas' {frmLctVendaDelivery},
  uSelClienteDelivery in 'uSelClienteDelivery.pas' {frmSelClienteDelivery},
  uLctVendaDeliveryObservacao in 'uLctVendaDeliveryObservacao.pas' {frmLctVendaDeliveryObservacao},
  uFinalizarVendaDelivery in 'uFinalizarVendaDelivery.pas' {frmFinalizarVendaDelivery},
  uDescontoDelivery in 'uDescontoDelivery.pas' {frmDescontoDelivery},
  uAcrescimoDelivery in 'uAcrescimoDelivery.pas' {frmAcrescimoDelivery},
  uQuantidadeDelivery in 'uQuantidadeDelivery.pas' {frmQuantidadeDelivery},
  uConsCliente in 'uConsCliente.pas' {frmConsCliente},
  uLctContasPagar in 'uLctContasPagar.pas' {frmLctContasPagar},
  uLctContasReceber in 'uLctContasReceber.pas' {frmLctContasReceber},
  uCadContasPagar in 'uCadContasPagar.pas' {frmCadContasPagar},
  uCadContasReceber in 'uCadContasReceber.pas' {frmCadContasReceber},
  uSelProdutoCodigo in 'uSelProdutoCodigo.pas' {frmSelProdutoCodigo},
  uSelProdutoCodigoVarios in 'uSelProdutoCodigoVarios.pas' {frmSelProdutoCodigoVarios},
  uControleAcesso in 'uControleAcesso.pas' {frmControleAcesso},
  uConsUsuario in 'uConsUsuario.pas' {frmConsUsuario},
  uCadAtendimento in 'uCadAtendimento.pas' {frmCadAtendimento},
  uCadAtendimentoItem in 'uCadAtendimentoItem.pas' {frmCadAtendimentoItem},
  uImpAtendimentos in 'uImpAtendimentos.pas' {frmImpAtendimentos},
  uConsClienteAtendimento in 'uConsClienteAtendimento.pas' {frmConsClienteAtendimento},
  uCadProfissional in 'uCadProfissional.pas' {frmCadProfissional},
  uCadHorarioAtendimento in 'uCadHorarioAtendimento.pas' {frmCadHorarioAtendimento};

{$R *.res}

var
  Mutex: THandle;
  bExecutaPrograma: Boolean;

begin

  NOME_EMPRESA := 'Aon';
  NOME_SISTEMA := 'AonVendas';

  SITE_EMPRESA  := 'www.aonsistemas.com.br';
  EMAIL_EMPRESA := 'suporte@aonsistemas.com.br';

  MUTEX_EMPRESA      := 'AONVENDASMUTEX';
  BANCO_EMPRESA      := 'AONVENDAS.FDB';
  BACKUP_EMPRESA     := 'AONVENDAS.FBK';
  BACKUP_EMPRESA_BCK := 'AONVENDAS.BCK';

  MSG_SISTEMA_BLOQUEADO := 'Sistema bloqueado entre em contato com nosso suporte tecnlógico - ' + EMAIL_EMPRESA;
  MSG_SERIAL_INVALIDO   := 'Serial informado não é válido entre em contato com nosso suporte tecnlógico - ' + EMAIL_EMPRESA;

  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.Title := NOME_SISTEMA;

  ShortDateFormat   := 'dd/mm/yyyy';
  DateSeparator     := '/';
  ThousandSeparator := '.';
  DecimalSeparator  := ',';

  LongMonthNames[1]  := 'janeiro';
  LongMonthNames[2]  := 'fevereiro';
  LongMonthNames[3]  := 'março';
  LongMonthNames[4]  := 'abril';
  LongMonthNames[5]  := 'maio';
  LongMonthNames[6]  := 'junho';
  LongMonthNames[7]  := 'julho';
  LongMonthNames[8]  := 'agosto';
  LongMonthNames[9]  := 'setembro';
  LongMonthNames[10] := 'outubro';
  LongMonthNames[11] := 'novembro';
  LongMonthNames[12] := 'dezembro';

  ShortMonthNames[1]  := 'jan';
  ShortMonthNames[2]  := 'fev';
  ShortMonthNames[3]  := 'mar';
  ShortMonthNames[4]  := 'abr';
  ShortMonthNames[5]  := 'mai';
  ShortMonthNames[6]  := 'jun';
  ShortMonthNames[7]  := 'jul';
  ShortMonthNames[8]  := 'ago';
  ShortMonthNames[9]  := 'set';
  ShortMonthNames[10] := 'out';
  ShortMonthNames[11] := 'nov';
  ShortMonthNames[12] := 'dez';

  LongDayNames[1] := 'domingo';
  LongDayNames[2] := 'segunda-feira';
  LongDayNames[3] := 'terça-feira';
  LongDayNames[4] := 'quarta-feira';
  LongDayNames[5] := 'quinta-feira';
  LongDayNames[6] := 'sexta-feira';
  LongDayNames[7] := 'sábado';

  ShortDayNames[1] := 'dom';
  ShortDayNames[2] := 'seg';
  ShortDayNames[3] := 'ter';
  ShortDayNames[4] := 'qua';
  ShortDayNames[5] := 'qui';
  ShortDayNames[6] := 'sex';
  ShortDayNames[7] := 'sáb';

  bExecutaPrograma := true;
  Mutex            := CreateMutex(nil, false, PWideChar( MUTEX_EMPRESA) );

  if ( Mutex = 0 ) or ( GetLastError = ERROR_ALREADY_EXISTS ) then
  begin
    MessageBox(Application.Handle, PWideChar('"Prezado Cliente"'+#13+
               'O Sistema '+ NOME_SISTEMA +' já está em execução nesta estação.'), PWideChar( NOME_EMPRESA ), MB_OK+MB_ICONERROR);
    bExecutaPrograma := False;
  end;

  if ( bExecutaPrograma ) then
  begin

    VERIFICAR_CONEXAO := False;

    // TELA DE ABERTURA
    frmSpleshScreen := TfrmSpleshScreen.Create(Application);
    frmSpleshScreen.ShowModal;
    FreeAndNil(frmSpleshScreen);

    frmSplashConexao := TfrmSplashConexao.Create(Application);
    frmSplashConexao.Show;
    frmSplashConexao.Refresh;
    Application.ProcessMessages;

    Application.Title := NOME_SISTEMA;
    Application.CreateForm(TdmPrincipal, dmPrincipal);

    if ( dmPrincipal.ConexaoBanco ) then
    begin

      FreeAndNil(frmSplashConexao);

      if ( dmPrincipal.VerificaVersaoSistema ) then
      begin
        MessageBox(Application.Handle, '"Prezado Cliente"'+#13+
                   'Versão do sistema não é compatível com a versão do Banco de Dados '+
                   'verifique se seu sistema está com a ultima atualização disponível', PWideChar(NOME_EMPRESA), MB_OK+MB_ICONERROR);
        Application.Terminate;
      end;

      if ( dmPrincipal.VerificaVersaoBanco ) then
      begin

        VERIFICAR_CONEXAO := True;

        Application.CreateForm(TfrmPrincipal, frmPrincipal);
        Application.Run;

      end
      else
        Application.Terminate;

    end
    else
    begin

      FreeAndNil(frmSplashConexao);

      frmConfigurarServidor := TfrmConfigurarServidor.Create(Application);
      frmConfigurarServidor.ShowModal;
      frmConfigurarServidor.Free;

      Application.Terminate;

    end;

  end
  else
    Application.Terminate;

end.
