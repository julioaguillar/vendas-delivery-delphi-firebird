unit uCadCliente;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uCadPadrao, Menus, DB, IBODataset, IB_Components, Grids, ValEdit,
  StdCtrls, Buttons, ComCtrls, DBCtrls, Mask, DBClient, DBCGrids, DBGrids,
  ExtCtrls, ExtDlgs, jpeg, pngimage, ImgList, AonProcessbar, frxClass,
  frxExportPDF, frxDBSet, frxExportXLS, frxExportMail, ComObj, excelXP, DateUtils,
  Math, StrUtils;

type
  TfrmCadCliente = class(TfrmCadPadrao)
    pgcCliente: TPageControl;
    tbsDadosCliente: TTabSheet;
    cdsDadosCliente: TClientDataSet;
    cdsDadosClienteCD_CLIENTE: TIntegerField;
    cdsDadosClienteDS_NOME: TStringField;
    cdsDadosClienteNR_RG: TStringField;
    cdsDadosClienteNR_CPF: TStringField;
    cdsDadosClienteDT_NASCIMENTO: TDateField;
    cdsDadosClienteDS_SEXO: TStringField;
    cdsDadosClienteDS_ESTADOCIVIL: TStringField;
    cdsDadosClienteDS_PROFISSAO: TStringField;
    cdsDadosClienteDS_LOGRADOURO: TStringField;
    cdsDadosClienteNR_NUMERO: TIntegerField;
    cdsDadosClienteDS_COMPLEMENTO: TStringField;
    cdsDadosClienteDS_BAIRRO: TStringField;
    cdsDadosClienteNR_CEP: TStringField;
    cdsDadosClienteCD_UF: TStringField;
    cdsDadosClienteCD_MUNICIPIO: TIntegerField;
    cdsDadosClienteNR_TELEFONERESIDENCIAL: TStringField;
    cdsDadosClienteNR_TELEFONECOMERCIAL: TStringField;
    cdsDadosClienteNR_CELULAR: TStringField;
    cdsDadosClienteDS_EMAIL: TStringField;
    qryUF: TIBOQuery;
    qryMunicipio: TIBOQuery;
    dtsUF: TDataSource;
    dtsMunicipio: TDataSource;
    qryConsCliente: TIBOQuery;
    qryConsCodigoCliente: TIBOQuery;
    qryNumClientes: TIBOQuery;
    cdsDadosClienteFT_CLIENTE: TBlobField;
    OpenPictureDialog: TOpenPictureDialog;
    imgImpressao: TImageList;
    tbsMensalidades: TTabSheet;
    gpbMensalidades: TGroupBox;
    cdsDadosClienteFG_STATUS: TStringField;
    Image2: TImage;
    GroupBox1: TGroupBox;
    DBGrid1: TDBGrid;
    dbgPedidos: TDBGrid;
    qryLancamentoSaida: TIBOQuery;
    dtsLancamentoSaida: TDataSource;
    qryLancamentoSaidaItem: TIBOQuery;
    dtsLancamentoSaidaItem: TDataSource;
    gpbCodigo: TGroupBox;
    dbeCodigo: TDBEdit;
    gpbNome: TGroupBox;
    dbeNome: TDBEdit;
    gpbFoto: TGroupBox;
    btnCapturarFotoWeb: TSpeedButton;
    btnCapturarFotoArquivo: TSpeedButton;
    btnLimpar: TSpeedButton;
    dbiFotoCliente: TDBImage;
    gpbRG: TGroupBox;
    dbeRG: TDBEdit;
    gpbCPF: TGroupBox;
    dbeCPF: TDBEdit;
    gpbNascimento: TGroupBox;
    dbeNascimento: TDBEdit;
    edtIdade: TEdit;
    gpbSexo: TGroupBox;
    dbcSexo: TDBComboBox;
    gpbEstadoCivil: TGroupBox;
    dbcEstadoCivil: TDBComboBox;
    gpbProfissao: TGroupBox;
    dbeProfissao: TDBEdit;
    gpbEndereco: TGroupBox;
    gpbLogradouro: TGroupBox;
    dbeLogradouro: TDBEdit;
    gpbNumero: TGroupBox;
    dbeNumero: TDBEdit;
    gpbComplemento: TGroupBox;
    dbeComplemento: TDBEdit;
    gpbBairro: TGroupBox;
    dbeBairro: TDBEdit;
    gpbCEP: TGroupBox;
    dbeCEP: TDBEdit;
    gpbUF: TGroupBox;
    dbcUF: TDBLookupComboBox;
    gpbCidade: TGroupBox;
    dbcCidade: TDBLookupComboBox;
    gpbTelefoneResidencial: TGroupBox;
    dbeTelefoneResidencial: TDBEdit;
    gpbTelefoneComercial: TGroupBox;
    dbeTelefoneComercial: TDBEdit;
    gpbCelular: TGroupBox;
    dbeCelular: TDBEdit;
    gpbEmail: TGroupBox;
    dbeEmail: TDBEdit;
    GroupBox2: TGroupBox;
    dbeCNPJ: TDBEdit;
    cdsDadosClienteNR_CNPJ: TStringField;
    procedure btnConsultarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnIncluirClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure btnConfirmarClick(Sender: TObject);
    procedure dbcUFClick(Sender: TObject);
    procedure dbeCPFExit(Sender: TObject);
    procedure dbcUFEnter(Sender: TObject);
    procedure dbcCidadeEnter(Sender: TObject);
    procedure dbcSexoEnter(Sender: TObject);
    procedure dbcEstadoCivilEnter(Sender: TObject);
    procedure dtsCadPadraoDataChange(Sender: TObject; Field: TField);
    procedure cdsDadosClienteAfterOpen(DataSet: TDataSet);
    procedure btnCapturarFotoWebClick(Sender: TObject);
    procedure btnCapturarFotoArquivoClick(Sender: TObject);
    procedure dbiFotoClienteDblClick(Sender: TObject);
    procedure btnLimparClick(Sender: TObject);
    procedure imgFecharClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure dbeCEPExit(Sender: TObject);
    procedure dbeCEPEnter(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure cdsDadosClienteAfterInsert(DataSet: TDataSet);
    procedure qryLancamentoSaidaAfterScroll(DataSet: TDataSet);
    procedure dbeCNPJExit(Sender: TObject);
    procedure dtsCadPadraoStateChange(Sender: TObject);
  private
    { Private declarations }

    CEP: String;

  public
    { Public declarations }

    INCLUIR_CLIENTE: Boolean;
    NOME: String;

    procedure CarregaCliente(CodigoCliente: Integer);

  end;

var
  frmCadCliente: TfrmCadCliente;

implementation

uses udmPrincipal, uFuncoes, uConstantes, uOpcoesPadrao, uPrincipal, uCadFotoCliente,
  uConsCliente;

{$R *.dfm}

procedure TfrmCadCliente.btnAlterarClick(Sender: TObject);
begin
  inherited;

  if ( not ( cdsDadosCliente.IsEmpty ) ) then
  begin

    cdsDadosCliente.Edit;
    dbeCodigo.Enabled := false;

    if ( pgcCliente.ActivePage = tbsDadosCliente ) then
      dbeNome.SetFocus;

  end;

end;

procedure TfrmCadCliente.btnCancelarClick(Sender: TObject);
begin
  inherited;

  if ( MsgBox('"Prezado Cliente"'#13'Confirma o cancelamento?'#13#13'ATENÇÃO: Os dados alterados serão perdidos', MB_YESNO+MB_ICONQUESTION) = IDYES ) then
    cdsDadosCliente.Cancel;

end;

procedure TfrmCadCliente.btnCapturarFotoArquivoClick(Sender: TObject);
var bmp: TBitmap;
    jpg: TJPEGImage;
begin
  inherited;

  if ( OpenPictureDialog.Execute(frmCadCliente.Handle) ) then
  begin

    bmp := TBitmap.Create;
    jpg := TJPegImage.Create;

    try

      try

        if ( FileExists(OpenPictureDialog.Files[0]) ) then
        begin

          jpg.LoadFromFile(OpenPictureDialog.Files[0]);
          bmp.Assign(jpg);

          cdsDadosClienteFT_CLIENTE.Assign(bmp);

        end;

      except
        MsgBox('"Prezado Cliente"'#13'Ocorreu um erro ao carregar a imagem!', MB_OK+MB_ICONERROR);
      end

    finally
      bmp.Free;
      jpg.Free;
    end;

  end;

end;

procedure TfrmCadCliente.btnCapturarFotoWebClick(Sender: TObject);
begin
  inherited;

  frmCadFotoCliente := TfrmCadFotoCliente.Create(Self);
  frmCadFotoCliente.ShowModal;

  if ( frmCadFotoCliente.ModalResult = mrOk ) then
    cdsDadosClienteFT_CLIENTE.Assign(frmCadFotoCliente.ImagemRetorno);

  FreeAndNil(frmCadFotoCliente);

end;

procedure TfrmCadCliente.btnConfirmarClick(Sender: TObject);
begin

  pgcCliente.ActivePage := tbsDadosCliente;
  ActiveControl         := btnConfirmar;

  inherited;

  if ( cdsDadosCliente.State = dsInsert ) then
  begin

    qryConsCliente.Close;
    qryConsCliente.ParamByName('CD_CLIENTE').AsInteger := cdsDadosCliente.FieldByName('CD_CLIENTE').AsInteger;
    qryConsCliente.Open;

    if ( not ( qryConsCliente.IsEmpty ) ) then
    begin
      MsgBox('"Prezado Cliente"'#13'Cliente já cadastrado!', MB_OK+MB_ICONINFORMATION);
      pgcCliente.ActivePage := tbsDadosCliente;
      dbeCodigo.SetFocus;
      Abort;
    end;

  end;

  try

    if ( Trim(cdsDadosCliente.FieldByName('DS_NOME').AsString) = '' ) then
    begin
      MsgBox('"Prezado Cliente"'#13'Informe o Nome do Cliente!', MB_OK+MB_ICONINFORMATION);
      pgcCliente.ActivePage := tbsDadosCliente;
      dbeNome.SetFocus;
      Abort;
    end;

    qryCadPadrao.Close;

    if ( cdsDadosCliente.State = dsEdit ) then
      qryCadPadrao.ParamByName('CD_CLIENTE').AsInteger := cdsDadosCliente.FieldByName('CD_CLIENTE').AsInteger
    else
      qryCadPadrao.ParamByName('CD_CLIENTE').AsInteger := 0;

    qryCadPadrao.Open;

    if ( cdsDadosCliente.State = dsEdit ) then
      qryCadPadrao.Edit
    else
    begin
      qryCadPadrao.Append;
      qryCadPadrao.FieldByName('CD_CLIENTE').Value := cdsDadosCliente.FieldByName('CD_CLIENTE').Value;
    end;

    qryCadPadrao.FieldByName('DS_NOME').Value                := cdsDadosCliente.FieldByName('DS_NOME').Value;
    qryCadPadrao.FieldByName('NR_RG').Value                  := cdsDadosCliente.FieldByName('NR_RG').Value;
    qryCadPadrao.FieldByName('NR_CPF').Value                 := cdsDadosCliente.FieldByName('NR_CPF').Value;
    qryCadPadrao.FieldByName('NR_CNPJ').Value                := cdsDadosCliente.FieldByName('NR_CNPJ').Value;
    qryCadPadrao.FieldByName('DT_NASCIMENTO').Value          := cdsDadosCliente.FieldByName('DT_NASCIMENTO').Value;
    qryCadPadrao.FieldByName('DS_SEXO').Value                := cdsDadosCliente.FieldByName('DS_SEXO').Value;
    qryCadPadrao.FieldByName('DS_ESTADOCIVIL').Value         := cdsDadosCliente.FieldByName('DS_ESTADOCIVIL').Value;
    qryCadPadrao.FieldByName('DS_PROFISSAO').Value           := cdsDadosCliente.FieldByName('DS_PROFISSAO').Value;
    qryCadPadrao.FieldByName('DS_LOGRADOURO').Value          := cdsDadosCliente.FieldByName('DS_LOGRADOURO').Value;
    qryCadPadrao.FieldByName('NR_NUMERO').Value              := cdsDadosCliente.FieldByName('NR_NUMERO').Value;
    qryCadPadrao.FieldByName('DS_COMPLEMENTO').Value         := cdsDadosCliente.FieldByName('DS_COMPLEMENTO').Value;
    qryCadPadrao.FieldByName('DS_BAIRRO').Value              := cdsDadosCliente.FieldByName('DS_BAIRRO').Value;
    qryCadPadrao.FieldByName('NR_CEP').Value                 := cdsDadosCliente.FieldByName('NR_CEP').Value;
    qryCadPadrao.FieldByName('CD_UF').Value                  := cdsDadosCliente.FieldByName('CD_UF').Value;
    qryCadPadrao.FieldByName('CD_MUNICIPIO').Value           := cdsDadosCliente.FieldByName('CD_MUNICIPIO').Value;
    qryCadPadrao.FieldByName('NR_TELEFONERESIDENCIAL').Value := cdsDadosCliente.FieldByName('NR_TELEFONERESIDENCIAL').Value;
    qryCadPadrao.FieldByName('NR_TELEFONECOMERCIAL').Value   := cdsDadosCliente.FieldByName('NR_TELEFONECOMERCIAL').Value;
    qryCadPadrao.FieldByName('NR_CELULAR').Value             := cdsDadosCliente.FieldByName('NR_CELULAR').Value;
    qryCadPadrao.FieldByName('DS_EMAIL').Value               := cdsDadosCliente.FieldByName('DS_EMAIL').Value;
    qryCadPadrao.FieldByName('FT_CLIENTE').Value             := cdsDadosCliente.FieldByName('FT_CLIENTE').Value;
    qryCadPadrao.FieldByName('FG_STATUS').Value              := cdsDadosCliente.FieldByName('FG_STATUS').Value;
    qryCadPadrao.Post;

    cdsDadosCliente.Post;

    trnsCadPadrao.Commit;

  except
    on e: Exception do
    begin
      trnsCadPadrao.Rollback;
      MsgBox('"Prezado Cliente"'#13'Ocorreu um erro na inclusão do registro com a seguinte mensagem:'+#13+e.Message, MB_OK+MB_ICONERROR);
    end;
  end;

end;

procedure TfrmCadCliente.btnConsultarClick(Sender: TObject);
begin
  inherited;

  frmConsCliente := TfrmConsCliente.Create(Self);
  frmConsCliente.ShowModal;

  if ( frmConsCliente.ModalResult = mrOk ) and ( not ( frmConsCliente.qryConsCliente.IsEmpty ) ) then
    CarregaCliente(frmConsCliente.qryConsCliente.FieldByName('CD_CLIENTE').AsInteger);

  FreeAndNil(frmConsCliente);

end;

procedure TfrmCadCliente.btnExcluirClick(Sender: TObject);
begin
  inherited;

  if ( not ( cdsDadosCliente.IsEmpty ) ) and ( cdsDadosCliente.FieldByName('CD_CLIENTE').AsInteger = 0 ) then
  begin
    MsgBox('"Prezado Cliente"'#13'Não é permitido a exclusão o Cliente '+cdsDadosCliente.FieldByName('DS_NOME').AsString+'.', MB_OK+MB_ICONINFORMATION);
    Exit;
  end;

  if ( not ( cdsDadosCliente.IsEmpty ) ) and
     ( MsgBox('"Prezado Cliente"'#13'Confirma a exclusão do registro', MB_YESNO+MB_ICONQUESTION) = IDYES ) then
  begin

    try

      qryCadPadrao.Close;
      qryCadPadrao.ParamByName('CD_CLIENTE').AsInteger := cdsDadosCliente.FieldByName('CD_CLIENTE').AsInteger;
      qryCadPadrao.Open;

      qryCadPadrao.Delete;
      trnsCadPadrao.Commit;

      cdsDadosCliente.Delete;

      CarregaCliente(0);

    except
      on e: Exception do
      begin
        trnsCadPadrao.Rollback;
        MsgBox('"Prezado Cliente"'#13'Ocorreu um erro na exclusão do registro com a seguinte mensagem:'+#13+e.Message, MB_OK+MB_ICONERROR);
      end;
    end;

  end;

end;

procedure TfrmCadCliente.btnIncluirClick(Sender: TObject);
begin
  inherited;

  if ( SISTEMA_DEMOSTRATIVO ) then
  begin

    qryNumClientes.Close;
    qryNumClientes.Open;

    if ( not ( qryNumClientes.IsEmpty ) and ( qryNumClientes.FieldByName('NR_CLIENTE').AsInteger > 10 ) ) then
    begin

      MsgBox('"Prezado Cliente"'+#13+
             'Você já cadastrou a quantidade máxima de Clientes para o sistema "DEMOSTRATIVO".'+#13#13+
             'Acesse nosso site: "'+SITE_EMPRESA+'", ou envie um e-mail para "'+EMAIL_EMPRESA+'" solicitando a versão '+
             'completa do '+NOME_SISTEMA, MB_OK+MB_ICONINFORMATION);
      Exit;

    end;

  end;

  qryLancamentoSaida.Close;
  qryLancamentoSaidaItem.Close;

  cdsDadosCliente.EmptyDataSet;
  cdsDadosCliente.Append;

  qryConsCodigoCliente.Close;
  qryConsCodigoCliente.Open;

  if ( not qryConsCodigoCliente.IsEmpty ) then
    cdsDadosCliente.FieldByName('CD_CLIENTE').AsInteger := qryConsCodigoCliente.FieldByName('CD_CLIENTE').AsInteger + 1
  else
    cdsDadosCliente.FieldByName('CD_CLIENTE').AsInteger := 1;

  pgcCliente.ActivePage := tbsDadosCliente;
  dbeCodigo.SetFocus;

end;

procedure TfrmCadCliente.btnLimparClick(Sender: TObject);
begin
  inherited;

  cdsDadosCliente.FieldByName('FT_CLIENTE').Clear;

end;

procedure TfrmCadCliente.cdsDadosClienteAfterInsert(DataSet: TDataSet);
begin
  inherited;

  cdsDadosCliente.FieldByName('FG_STATUS').AsString := 'ATIVO';

end;

procedure TfrmCadCliente.cdsDadosClienteAfterOpen(DataSet: TDataSet);
begin
  inherited;

  with cdsDadosCliente do
  begin
    ( cdsDadosCliente.FieldByName('DT_NASCIMENTO') as TDateField ).OnSetText := dmPrincipal.ValidaData;
  end;

end;

procedure TfrmCadCliente.dbcCidadeEnter(Sender: TObject);
begin
  inherited;

  dbcCidade.DropDown;

end;

procedure TfrmCadCliente.dbcEstadoCivilEnter(Sender: TObject);
begin
  inherited;

  dbcEstadoCivil.DroppedDown := true;

end;

procedure TfrmCadCliente.dbcSexoEnter(Sender: TObject);
begin
  inherited;

  dbcSexo.DroppedDown := true;

end;

procedure TfrmCadCliente.dbcUFClick(Sender: TObject);
begin
  inherited;

  if ( dbcUF.Text <> '' ) then
  begin
    qryMunicipio.Close;
    qryMunicipio.ParamByName('CD_UF').AsString := dbcUF.Text;
    qryMunicipio.Open;
  end;

end;

procedure TfrmCadCliente.dbcUFEnter(Sender: TObject);
begin
  inherited;

  dbcUF.DropDown;

end;

procedure TfrmCadCliente.dbeCEPEnter(Sender: TObject);
begin
  inherited;

  CEP := dbeCEP.Text;

end;

procedure TfrmCadCliente.dbeCEPExit(Sender: TObject);
var endereco: TEndereco;
    Wait    : TProcessamento;
begin
  inherited;

  if ( dbeCEP.Text <> '' ) and ( dbeCEP.Text <> '  .   -   ' ) and ( CEP <> dbeCEP.Text ) and ( cdsDadosCliente.State in [dsInsert, dsEdit] ) then
  begin

    Wait.CreateProcess;
    Wait.NumProcess := 2;
    Wait.SetMinMax(0, 2);
    Wait.StartProcess;

    try

      Wait.PositionBar     := Wait.PositionBar + 1;
      Wait.PositionProcess := Wait.PositionProcess + 1;

      endereco := RetornarEndereco( dbeCEP.Text );

      Wait.PositionBar     := Wait.PositionBar + 1;
      Wait.PositionProcess := Wait.PositionProcess + 1;

      if ( endereco.Cep <> '' ) then
      begin

        cdsDadosCliente.FieldByName('DS_LOGRADOURO').AsString  := endereco.TipoLogradouro + ' ' + endereco.Logradouro;
        cdsDadosCliente.FieldByName('DS_COMPLEMENTO').AsString := endereco.Complemento;
        cdsDadosCliente.FieldByName('DS_BAIRRO').AsString      := endereco.Bairro;
        cdsDadosCliente.FieldByName('CD_UF').AsString          := endereco.UF;

        dbcUFClick(dbcUF);

        if ( endereco.CodigoMunicipio > 0 ) then
          cdsDadosCliente.FieldByName('CD_MUNICIPIO').AsInteger := endereco.CodigoMunicipio;

      end;

    finally
      Wait.CloseProcess;
    end;

  end;

end;

procedure TfrmCadCliente.dbeCNPJExit(Sender: TObject);
begin
  inherited;

  if ( fncSomenteNumeros(dbeCNPJ.Text) <> '' ) then
  begin

    if ( not ( fncValidaCPFCNPJ(dbeCNPJ.Text) ) ) then
    begin
      MsgBox('"Prezado Cliente:"'#13'Número do CNPJ inválido.', MB_OK+MB_ICONWARNING);
      dbeCNPJ.SetFocus;
      Abort;
    end;

  end;

end;

procedure TfrmCadCliente.dbeCPFExit(Sender: TObject);
begin
  inherited;

  if ( fncSomenteNumeros(dbeCPF.Text) <> '' ) then
  begin

    if ( not ( fncValidaCPFCNPJ(dbeCPF.Text) ) ) then
    begin
      MsgBox('"Prezado Cliente:"'#13'Número do CPF inválido.', MB_OK+MB_ICONWARNING);
      dbeCPF.SetFocus;
      Abort;
    end;

  end;

end;

procedure TfrmCadCliente.dbiFotoClienteDblClick(Sender: TObject);
begin
  inherited;

  if ( not ( cdsDadosCliente.FieldByName('FT_CLIENTE').IsNull ) ) then
  begin

    frmCadFotoCliente := TfrmCadFotoCliente.Create(Self);

    frmCadFotoCliente.fgConsulta              := true;
    frmCadFotoCliente.btnCapturar.Enabled     := false;
    frmCadFotoCliente.cbbDispositivos.Enabled := false;

    frmCadFotoCliente.pbFoto.Picture := dbiFotoCliente.Picture;

    frmCadFotoCliente.ShowModal;

    FreeAndNil(frmCadFotoCliente);

  end;

end;

procedure TfrmCadCliente.dtsCadPadraoDataChange(Sender: TObject; Field: TField);
begin
  inherited;

  if ( cdsDadosCliente.FieldByName('DT_NASCIMENTO').AsDateTime <> 0 ) then
    edtIdade.Text := fncCalcIdade(cdsDadosCliente.FieldByName('DT_NASCIMENTO').AsDateTime).Extenso
  else
    edtIdade.Text := '';

end;

procedure TfrmCadCliente.dtsCadPadraoStateChange(Sender: TObject);
begin
  inherited;

  btnCapturarFotoWeb.Enabled     := cdsDadosCliente.State in [dsInsert, dsEdit];
  btnCapturarFotoArquivo.Enabled := cdsDadosCliente.State in [dsInsert, dsEdit];
  btnLimpar.Enabled              := cdsDadosCliente.State in [dsInsert, dsEdit];

end;

procedure TfrmCadCliente.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  inherited;

  if ( cdsDadosCliente.State in [dsInsert,dsEdit] ) then
  begin

    cdsDadosCliente.Cancel;

    //if ( cdsDadosCliente.State = dsInsert ) then
    //  MsgBox('"Prezado Cliente'+#13+'O cadastro do Cliente se encontra em modo de inclusão. Para fechar é necessário que confirme ou cancele a operação', MB_OK+MB_ICONQUESTION)
    //else
    //  MsgBox('"Prezado Cliente'+#13+'O cadastro do Cliente se encontra em modo de alteração. Para fechar é necessário que confirme ou cancele a operação', MB_OK+MB_ICONQUESTION);
    //
    //CanClose := false;

  end;

end;

procedure TfrmCadCliente.FormCreate(Sender: TObject);
begin
  inherited;

  CEP := '';

  INCLUIR_CLIENTE := false;
  NOME            := '';

  cdsDadosCliente.Close;
  cdsDadosCliente.CreateDataSet;
  cdsDadosCliente.Open;

  qryUF.Close;
  qryUF.Open;

end;

procedure TfrmCadCliente.FormShow(Sender: TObject);
begin
  inherited;

  frmPrincipal.Enabled := False;
  pgcCliente.ActivePage  := tbsDadosCliente;

  if ( INCLUIR_CLIENTE ) then
  begin

    try

      btnIncluirClick(btnIncluir);

      cdsDadosCliente.FieldByName('DS_NOME').AsString := NOME;
      ActiveControl := dbeNome;

    except
      MsgBox('"Prezado Cliente:"'#13'Ocorreu um erro na inclusão do Cliente.', MB_OK + MB_ICONWARNING);
    end;

  end;

end;

procedure TfrmCadCliente.imgFecharClick(Sender: TObject);
begin
  inherited;

  pgcCliente.Enabled := True;
  gpbBotoes.Enabled  := True;

end;

procedure TfrmCadCliente.qryLancamentoSaidaAfterScroll(DataSet: TDataSet);
begin
  inherited;

  qryLancamentoSaidaItem.Close;
  qryLancamentoSaidaItem.ParamByName('ID_VENDA').AsInteger := qryLancamentoSaida.FieldByName('ID_VENDA').AsInteger;
  qryLancamentoSaidaItem.Open;

end;

procedure TfrmCadCliente.CarregaCliente(CodigoCliente: Integer);
begin

  cdsDadosCliente.EmptyDataSet;

  qryConsCliente.Close;
  qryConsCliente.ParamByName('CD_CLIENTE').AsInteger := CodigoCliente;
  qryConsCliente.Open;

  if ( not ( qryConsCliente.IsEmpty ) ) then
  begin

    cdsDadosCliente.Append;
    cdsDadosCliente.FieldByName('CD_CLIENTE').Value             := qryConsCliente.FieldByName('CD_CLIENTE').Value;
    cdsDadosCliente.FieldByName('DS_NOME').Value                := qryConsCliente.FieldByName('DS_NOME').Value;
    cdsDadosCliente.FieldByName('NR_RG').Value                  := qryConsCliente.FieldByName('NR_RG').Value;
    cdsDadosCliente.FieldByName('NR_CPF').Value                 := qryConsCliente.FieldByName('NR_CPF').Value;
    cdsDadosCliente.FieldByName('NR_CNPJ').Value                := qryConsCliente.FieldByName('NR_CNPJ').Value;
    cdsDadosCliente.FieldByName('DT_NASCIMENTO').Value          := qryConsCliente.FieldByName('DT_NASCIMENTO').Value;
    cdsDadosCliente.FieldByName('DS_SEXO').Value                := qryConsCliente.FieldByName('DS_SEXO').Value;
    cdsDadosCliente.FieldByName('DS_ESTADOCIVIL').Value         := qryConsCliente.FieldByName('DS_ESTADOCIVIL').Value;
    cdsDadosCliente.FieldByName('DS_PROFISSAO').Value           := qryConsCliente.FieldByName('DS_PROFISSAO').Value;
    cdsDadosCliente.FieldByName('DS_LOGRADOURO').Value          := qryConsCliente.FieldByName('DS_LOGRADOURO').Value;
    cdsDadosCliente.FieldByName('NR_NUMERO').Value              := qryConsCliente.FieldByName('NR_NUMERO').Value;
    cdsDadosCliente.FieldByName('DS_COMPLEMENTO').Value         := qryConsCliente.FieldByName('DS_COMPLEMENTO').Value;
    cdsDadosCliente.FieldByName('DS_BAIRRO').Value              := qryConsCliente.FieldByName('DS_BAIRRO').Value;
    cdsDadosCliente.FieldByName('NR_CEP').Value                 := qryConsCliente.FieldByName('NR_CEP').Value;
    cdsDadosCliente.FieldByName('CD_UF').Value                  := qryConsCliente.FieldByName('CD_UF').Value;
    cdsDadosCliente.FieldByName('CD_MUNICIPIO').Value           := qryConsCliente.FieldByName('CD_MUNICIPIO').Value;
    cdsDadosCliente.FieldByName('NR_TELEFONERESIDENCIAL').Value := qryConsCliente.FieldByName('NR_TELEFONERESIDENCIAL').Value;
    cdsDadosCliente.FieldByName('NR_TELEFONECOMERCIAL').Value   := qryConsCliente.FieldByName('NR_TELEFONECOMERCIAL').Value;
    cdsDadosCliente.FieldByName('NR_CELULAR').Value             := qryConsCliente.FieldByName('NR_CELULAR').Value;
    cdsDadosCliente.FieldByName('DS_EMAIL').Value               := qryConsCliente.FieldByName('DS_EMAIL').Value;
    cdsDadosCliente.FieldByName('FT_CLIENTE').Value             := qryConsCliente.FieldByName('FT_CLIENTE').Value;
    cdsDadosCliente.FieldByName('FG_STATUS').Value              := qryConsCliente.FieldByName('FG_STATUS').Value;
    cdsDadosCliente.Post;

    qryLancamentoSaida.Close;
    qryLancamentoSaida.ParamByName('CD_CLIENTE').AsInteger := cdsDadosCliente.FieldByName('CD_CLIENTE').AsInteger;
    qryLancamentoSaida.Open;

    if ( cdsDadosCliente.FieldByName('CD_UF').AsString <> '' ) then
    begin
      qryMunicipio.Close;
      qryMunicipio.ParamByName('CD_UF').AsString := cdsDadosCliente.FieldByName('CD_UF').AsString;
      qryMunicipio.Open;
    end;

  end;

end;

end.
